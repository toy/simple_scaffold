class <%= controller_class_name %>Controller < ApplicationController
  before_filter :build_<%= file_name %>, :only => [:new, :create]
  before_filter :find_<%= file_name %>, :only => [:show, :edit, :update, :destroy]

  def index
    @<%= table_name %> = <%= class_name %>.all
  end

  def show
  end

  def new
    render :action => :edit
  end

  def edit
  end

  def create
    if @<%= file_name %>.save
      flash[:notice] = t('<%= file_name %>.created_message', :default => :'model.created_message')
      redirect_to @<%= file_name %>
    else
      render :action => :edit
    end
  end

  def update
    if @<%= file_name %>.update_attributes(params[:<%= file_name %>])
      flash[:notice] = t('<%= file_name %>.updated_message', :default => :'model.updated_message')
      redirect_to @<%= file_name %>
    else
      render :action => :edit
    end
  end

  def destroy
    @<%= file_name %>.destroy

    redirect_to <%= table_name %>_url
  end

private

  def find_<%= file_name %>
    @<%= file_name %> = <%= class_name %>.find(params[:id])
  end

  def build_<%= file_name %>
    @<%= file_name %> = <%= class_name %>.new(params[:<%= file_name %>])
  end
end
