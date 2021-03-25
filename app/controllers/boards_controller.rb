class BoardsController < ApplicationController
  protect_from_forgery except: :create
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(boards_params)
    if  @board.valid?
      @board.save
      redirect_to root_path
    else
      render :new
    end
  end
end

private

  def boards_params
    params.require(:board).permit(:title, :content).merge(user_id: current_user.id)
  end
