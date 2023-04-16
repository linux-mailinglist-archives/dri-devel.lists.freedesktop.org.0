Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 291C76E3945
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 16:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687EC10E0F9;
	Sun, 16 Apr 2023 14:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E46A10E0F9
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 14:30:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7826E619DD;
 Sun, 16 Apr 2023 14:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CFB3C433D2;
 Sun, 16 Apr 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681655446;
 bh=PuURzTi5L4RopjJy8e+/1dDYYJjZD9f+GEDrU+rGPmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=r2C3JUtVHUV6Vplqx0DVabuaBUNiJzFBj598KjF9s6EA4Vh/dbAtexci/0OUPTGAn
 xpvnNGKFR7J+IdyUs5ho8Ahb4GX9ebebyyqdlq8DC6B9N0rMJjsOynTdtg5ICAM5dl
 hjUQ/lMN++FphJI1luvD7RvHzpjIIJtiCoGMKOZzbSrWze1CwH5O76TifhXkobD7OT
 r6UH3cXHs+0b5ZqzS0it/eWLtkRX19Zv9u64x9JUUwAlDevaNX1QmiSL+kuQ1pUPpm
 mGAzsjlPQDfZhZLcVxa8+L5j234fkn6gYZz9rxa0/ZY7WX5t1r85i2DetZwlTnMVOm
 OihQq+gxtPxRA==
Date: Sun, 16 Apr 2023 15:30:46 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 04/11] iio: buffer-dma: Enable buffer write support
Message-ID: <20230416153046.106de4a1@jic23-huawei>
In-Reply-To: <20230403154800.215924-5-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-5-paul@crapouillou.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  3 Apr 2023 17:47:53 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Adding write support to the buffer-dma code is easy - the write()
> function basically needs to do the exact same thing as the read()
> function: dequeue a block, read or write the data, enqueue the block
> when entirely processed.
> 
> Therefore, the iio_buffer_dma_read() and the new iio_buffer_dma_write()
> now both call a function iio_buffer_dma_io(), which will perform this
> task.
> 
> The .space_available() callback can return the exact same value as the
> .data_available() callback for input buffers, since in both cases we
> count the exact same thing (the number of bytes in each available
> block).

As they are doing the same thing, I'd like that to be visible down
where the callback is set.  As such, do we need a wrapper to
provide the space available version?  Perhaps just give the
data_available version a more generic name to make it seem
appropriate for both usecases?

Otherwise LGTM.

Jonathan


> 
> Note that we preemptively reset block->bytes_used to the buffer's size
> in iio_dma_buffer_request_update(), as in the future the
> iio_dma_buffer_enqueue() function won't reset it.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
> 
> ---
> v2: - Fix block->state not being reset in
>       iio_dma_buffer_request_update() for output buffers.
>     - Only update block->bytes_used once and add a comment about why we
>       update it.
>     - Add a comment about why we're setting a different state for output
>       buffers in iio_dma_buffer_request_update()
>     - Remove useless cast to bool (!!) in iio_dma_buffer_io()
> 
> v3: - Reorganize arguments to iio_dma_buffer_io()
>     - Change 'is_write' argument to 'is_from_user'
>     - Change (__force char *) to (__force __user char *), in
>       iio_dma_buffer_write(), since we only want to drop the "const".
> ---
>  drivers/iio/buffer/industrialio-buffer-dma.c | 89 ++++++++++++++++----
>  include/linux/iio/buffer-dma.h               |  7 ++
>  2 files changed, 80 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
> index 1fc91467d1aa..86eced458236 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
> @@ -195,6 +195,18 @@ static void _iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
>  		block->state = IIO_BLOCK_STATE_DONE;
>  }
>  
> +static void iio_dma_buffer_queue_wake(struct iio_dma_buffer_queue *queue)
> +{
> +	__poll_t flags;
> +
> +	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
> +		flags = EPOLLIN | EPOLLRDNORM;
> +	else
> +		flags = EPOLLOUT | EPOLLWRNORM;
> +
> +	wake_up_interruptible_poll(&queue->buffer.pollq, flags);
> +}
> +
>  /**
>   * iio_dma_buffer_block_done() - Indicate that a block has been completed
>   * @block: The completed block
> @@ -212,7 +224,7 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
>  	spin_unlock_irqrestore(&queue->list_lock, flags);
>  
>  	iio_buffer_block_put_atomic(block);
> -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
> +	iio_dma_buffer_queue_wake(queue);
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
>  
> @@ -241,7 +253,7 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
>  	}
>  	spin_unlock_irqrestore(&queue->list_lock, flags);
>  
> -	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
> +	iio_dma_buffer_queue_wake(queue);
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
>  
> @@ -335,8 +347,24 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>  			queue->fileio.blocks[i] = block;
>  		}
>  
> -		block->state = IIO_BLOCK_STATE_QUEUED;
> -		list_add_tail(&block->head, &queue->incoming);
> +		/*
> +		 * block->bytes_used may have been modified previously, e.g. by
> +		 * iio_dma_buffer_block_list_abort(). Reset it here to the
> +		 * block's so that iio_dma_buffer_io() will work.
> +		 */
> +		block->bytes_used = block->size;
> +
> +		/*
> +		 * If it's an input buffer, mark the block as queued, and
> +		 * iio_dma_buffer_enable() will submit it. Otherwise mark it as
> +		 * done, which means it's ready to be dequeued.
> +		 */
> +		if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
> +			block->state = IIO_BLOCK_STATE_QUEUED;
> +			list_add_tail(&block->head, &queue->incoming);
> +		} else {
> +			block->state = IIO_BLOCK_STATE_DONE;
> +		}
>  	}
>  
>  out_unlock:
> @@ -465,20 +493,12 @@ static struct iio_dma_buffer_block *iio_dma_buffer_dequeue(
>  	return block;
>  }
>  
> -/**
> - * iio_dma_buffer_read() - DMA buffer read callback
> - * @buffer: Buffer to read form
> - * @n: Number of bytes to read
> - * @user_buffer: Userspace buffer to copy the data to
> - *
> - * Should be used as the read callback for iio_buffer_access_ops
> - * struct for DMA buffers.
> - */
> -int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
> -	char __user *user_buffer)
> +static int iio_dma_buffer_io(struct iio_buffer *buffer, size_t n,
> +			     char __user *user_buffer, bool is_from_user)
>  {
>  	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
>  	struct iio_dma_buffer_block *block;
> +	void *addr;
>  	int ret;
>  
>  	if (n < buffer->bytes_per_datum)
> @@ -501,8 +521,13 @@ int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>  	n = rounddown(n, buffer->bytes_per_datum);
>  	if (n > block->bytes_used - queue->fileio.pos)
>  		n = block->bytes_used - queue->fileio.pos;
> +	addr = block->vaddr + queue->fileio.pos;
>  
> -	if (copy_to_user(user_buffer, block->vaddr + queue->fileio.pos, n)) {
> +	if (is_from_user)
> +		ret = copy_from_user(addr, user_buffer, n);
> +	else
> +		ret = copy_to_user(user_buffer, addr, n);
> +	if (ret) {
>  		ret = -EFAULT;
>  		goto out_unlock;
>  	}
> @@ -521,8 +546,40 @@ int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>  
>  	return ret;
>  }
> +
> +/**
> + * iio_dma_buffer_read() - DMA buffer read callback
> + * @buffer: Buffer to read form
> + * @n: Number of bytes to read
> + * @user_buffer: Userspace buffer to copy the data to
> + *
> + * Should be used as the read callback for iio_buffer_access_ops
> + * struct for DMA buffers.
> + */
> +int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
> +	char __user *user_buffer)
> +{
> +	return iio_dma_buffer_io(buffer, n, user_buffer, false);
> +}
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_read);
>  
> +/**
> + * iio_dma_buffer_write() - DMA buffer write callback
> + * @buffer: Buffer to read form
> + * @n: Number of bytes to read
> + * @user_buffer: Userspace buffer to copy the data from
> + *
> + * Should be used as the write callback for iio_buffer_access_ops
> + * struct for DMA buffers.
> + */
> +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
> +			 const char __user *user_buffer)
> +{
> +	return iio_dma_buffer_io(buffer, n,
> +				 (__force __user char *)user_buffer, true);
> +}
> +EXPORT_SYMBOL_GPL(iio_dma_buffer_write);
> +
>  /**
>   * iio_dma_buffer_data_available() - DMA buffer data_available callback
>   * @buf: Buffer to check for data availability
> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
> index 18d3702fa95d..490b93f76fa8 100644
> --- a/include/linux/iio/buffer-dma.h
> +++ b/include/linux/iio/buffer-dma.h
> @@ -132,6 +132,8 @@ int iio_dma_buffer_disable(struct iio_buffer *buffer,
>  	struct iio_dev *indio_dev);
>  int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
>  	char __user *user_buffer);
> +int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
> +			 const char __user *user_buffer);
>  size_t iio_dma_buffer_data_available(struct iio_buffer *buffer);
>  int iio_dma_buffer_set_bytes_per_datum(struct iio_buffer *buffer, size_t bpd);
>  int iio_dma_buffer_set_length(struct iio_buffer *buffer, unsigned int length);
> @@ -142,4 +144,9 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
>  void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue);
>  void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue);
>  
> +static inline size_t iio_dma_buffer_space_available(struct iio_buffer *buffer)
> +{
> +	return iio_dma_buffer_data_available(buffer);

As mentioned above, I don't see having this trivial wrapper as beneficial.

> +}
> +
>  #endif

