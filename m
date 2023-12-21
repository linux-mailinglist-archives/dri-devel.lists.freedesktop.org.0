Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAF781BB73
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 17:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1906E10E0AC;
	Thu, 21 Dec 2023 16:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C7E10E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 16:05:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id EB2DDB820E8;
 Thu, 21 Dec 2023 16:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4F5C433C7;
 Thu, 21 Dec 2023 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703174702;
 bh=XNhUqOfjLcvVCPjO3xJPt6Xx/mZDgeiWV3XsOhPh4Vk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LQ/dRIxyEykhaBg/e9Ihe5IbyYWnpkkkGKyOLTU93BFsq8+5ZOAgdmSAG9vOxvqWV
 kbc91kyOf+yyqvdR8roJQsivmoJq5JDH0nuBrkihYsQTIlHxseXIA5Ta0vZn79LUmY
 Gft3yaWQlqRKG7FnOpXXvKpZCq69Sm6Ft3vBVC17cFjXxpGehRofszd/tPmrEoPQx+
 gAIkXrdSDB3l8KZzS6mRXgQmKr/G9g1RRaAo91WbMrvRHXNMRDP32mj+Uta6RlQG/v
 yVzKRCqmgD9dc0JY4lHihSlQM0tqp3giTf/O0b4f3/T7NGM19qqVwZ42SX/78Hnh8v
 saLEUlh2E8xyw==
Date: Thu, 21 Dec 2023 16:04:45 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 6/8] iio: buffer-dma: Enable support for DMABUFs
Message-ID: <20231221160445.0e3e5a8c@jic23-huawei>
In-Reply-To: <20231219175009.65482-7-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-7-paul@crapouillou.net>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Vinod Koul <vkoul@kernel.org>,
 Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Dec 2023 18:50:07 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
> and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
> DMA buffer implementations.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
Hi Paul,

A few comments in here. Mostly places where the cleanup.h guard() stuff
can simplify error paths.

Overall this looks reasonable to me.

Jonathan

> ---
> v3: Update code to provide the functions that will be used as callbacks
>     for the new IOCTLs.
> ---
>  drivers/iio/buffer/industrialio-buffer-dma.c | 157 +++++++++++++++++--
>  include/linux/iio/buffer-dma.h               |  26 +++
>  2 files changed, 170 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
> index 5610ba67925e..adb64f975064 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
> @@ -14,6 +14,7 @@
>  #include <linux/poll.h>
>  #include <linux/iio/buffer_impl.h>
>  #include <linux/iio/buffer-dma.h>
> +#include <linux/dma-buf.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/sizes.h>
>  
> @@ -94,14 +95,24 @@ static void iio_buffer_block_release(struct kref *kref)
>  {
>  	struct iio_dma_buffer_block *block = container_of(kref,
>  		struct iio_dma_buffer_block, kref);
> +	struct iio_dma_buffer_queue *queue = block->queue;
>  
> -	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
> +	WARN_ON(block->fileio && block->state != IIO_BLOCK_STATE_DEAD);
>  
> -	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
> -					block->vaddr, block->phys_addr);
> +	mutex_lock(&queue->lock);
>  
> -	iio_buffer_put(&block->queue->buffer);
> +	if (block->fileio) {
> +		dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
> +				  block->vaddr, block->phys_addr);
> +		queue->num_fileio_blocks--;
> +	}
> +
> +	queue->num_blocks--;
>  	kfree(block);
> +
> +	mutex_unlock(&queue->lock);
> +
> +	iio_buffer_put(&queue->buffer);
>  }
>  
>  static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
> @@ -163,7 +174,7 @@ static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
>  }
>  
>  static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
> -	struct iio_dma_buffer_queue *queue, size_t size)
> +	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
>  {
>  	struct iio_dma_buffer_block *block;
>  
> @@ -171,13 +182,16 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>  	if (!block)
>  		return NULL;
>  
> -	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
> -		&block->phys_addr, GFP_KERNEL);
> -	if (!block->vaddr) {
> -		kfree(block);
> -		return NULL;
> +	if (fileio) {
> +		block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
> +						  &block->phys_addr, GFP_KERNEL);
> +		if (!block->vaddr) {
> +			kfree(block);
> +			return NULL;
> +		}
>  	}
>  
> +	block->fileio = fileio;
>  	block->size = size;
>  	block->state = IIO_BLOCK_STATE_DONE;
>  	block->queue = queue;
> @@ -186,6 +200,9 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
>  
>  	iio_buffer_get(&queue->buffer);
>  
> +	queue->num_blocks++;
> +	queue->num_fileio_blocks += fileio;
Adding a boolean is non intuitive.

	if (fileio)
		queue->num_fileio_blocks++;

probably easier to read and compiler should be able to figure out how to
optimise the condition away.

> +
>  	return block;
>  }
>  
> @@ -211,6 +228,9 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
>  	_iio_dma_buffer_block_done(block);
>  	spin_unlock_irqrestore(&queue->list_lock, flags);
>  
> +	if (!block->fileio)
> +		iio_buffer_signal_dmabuf_done(block->attach, 0);
> +
>  	iio_buffer_block_put_atomic(block);
>  	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
>  }
> @@ -237,10 +257,14 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
>  		list_del(&block->head);
>  		block->bytes_used = 0;
>  		_iio_dma_buffer_block_done(block);
> +
> +		if (!block->fileio)
> +			iio_buffer_signal_dmabuf_done(block->attach, -EINTR);
>  		iio_buffer_block_put_atomic(block);
>  	}
>  	spin_unlock_irqrestore(&queue->list_lock, flags);
>  
> +	queue->fileio.enabled = false;

While this obviously doesn't need to be conditional if it can already be false
it might be easier to follow the code flow it if didn't check if we were doing
fileio or not before disabling it.

>  	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
> @@ -261,6 +285,12 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
>  	}
>  }
>  
> +static bool iio_dma_buffer_fileio_mode(struct iio_dma_buffer_queue *queue)
> +{
> +	return queue->fileio.enabled ||
> +		queue->num_blocks == queue->num_fileio_blocks;
This is a little odd. So would be good have a comment on why this condition.
Or rename the function to imply it's checking if enabled, or can be enabled.

At first glanced I expected a function with this name to just be an accessor
function. e.g.
	return queue->fileio.enabled;

> +}
> +
>  /**
>   * iio_dma_buffer_request_update() - DMA buffer request_update callback
>   * @buffer: The buffer which to request an update
> @@ -287,6 +317,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>  
>  	mutex_lock(&queue->lock);
>  
> +	queue->fileio.enabled = iio_dma_buffer_fileio_mode(queue);
> +
> +	/* If DMABUFs were created, disable fileio interface */
> +	if (!queue->fileio.enabled)
> +		goto out_unlock;
> +
>  	/* Allocations are page aligned */
>  	if (PAGE_ALIGN(queue->fileio.block_size) == PAGE_ALIGN(size))
>  		try_reuse = true;
> @@ -317,7 +353,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>  			block = queue->fileio.blocks[i];
>  			if (block->state == IIO_BLOCK_STATE_DEAD) {
>  				/* Could not reuse it */
> -				iio_buffer_block_put(block);
> +				iio_buffer_block_put_atomic(block);
>  				block = NULL;
>  			} else {
>  				block->size = size;
> @@ -327,7 +363,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
>  		}
>  
>  		if (!block) {
> -			block = iio_dma_buffer_alloc_block(queue, size);
> +			block = iio_dma_buffer_alloc_block(queue, size, true);
>  			if (!block) {
>  				ret = -ENOMEM;
>  				goto out_unlock;
> @@ -363,7 +399,7 @@ static void iio_dma_buffer_fileio_free(struct iio_dma_buffer_queue *queue)
>  	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
>  		if (!queue->fileio.blocks[i])
>  			continue;
> -		iio_buffer_block_put(queue->fileio.blocks[i]);
> +		iio_buffer_block_put_atomic(queue->fileio.blocks[i]);

For these cases that are atomic or not, it might be worth calling out why they need to be
atomic.

>  		queue->fileio.blocks[i] = NULL;
>  	}
>  	queue->fileio.active_block = NULL;
> @@ -384,8 +420,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
>  
>  	block->state = IIO_BLOCK_STATE_ACTIVE;
>  	iio_buffer_block_get(block);
> +
>  	ret = queue->ops->submit(queue, block);
>  	if (ret) {
> +		if (!block->fileio)
> +			iio_buffer_signal_dmabuf_done(block->attach, ret);
> +
>  		/*
>  		 * This is a bit of a problem and there is not much we can do
>  		 * other then wait for the buffer to be disabled and re-enabled
> @@ -588,6 +628,97 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_data_available);
>  
> +struct iio_dma_buffer_block *
> +iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
> +			     struct dma_buf_attachment *attach)
> +{
> +	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
> +	struct iio_dma_buffer_block *block;
> +	int err;
> +
> +	mutex_lock(&queue->lock);

	guard(mutex)(&queue->lock);
> +
> +	/*
> +	 * If the buffer is enabled and in fileio mode new blocks can't be
> +	 * allocated.
> +	 */
> +	if (queue->fileio.enabled) {
> +		err = -EBUSY;
		return ERR_PTR(-EBUSY);
> +		goto err_unlock;
> +	}
> +
> +	block = iio_dma_buffer_alloc_block(queue, attach->dmabuf->size, false);
> +	if (!block) {
> +		err = -ENOMEM;

		return 

> +		goto err_unlock;
> +	}
> +
> +	block->attach = attach;
> +
> +	/* Free memory that might be in use for fileio mode */
> +	iio_dma_buffer_fileio_free(queue);
> +
> +	mutex_unlock(&queue->lock);

Drop this as unneeded if you use guard()

> +
> +	return block;
> +
> +err_unlock:
> +	mutex_unlock(&queue->lock);
> +	return ERR_PTR(err);
> +}
> +EXPORT_SYMBOL_GPL(iio_dma_buffer_attach_dmabuf);


> +static int iio_dma_can_enqueue_block(struct iio_dma_buffer_block *block)
> +{
> +	struct iio_dma_buffer_queue *queue = block->queue;
> +
> +	/* If in fileio mode buffers can't be enqueued. */
> +	if (queue->fileio.enabled)
> +		return -EBUSY;
> +
> +	switch (block->state) {
> +	case IIO_BLOCK_STATE_QUEUED:
> +		return -EPERM;
> +	case IIO_BLOCK_STATE_DONE:
> +		return 0;
> +	default:
> +		return -EBUSY;

Is this a real condition or just avoiding a compile warning?  If it's real
I'd like the various states that lead to it be listed here just so we
can more easily understand why -EBUSY is appropriate.

> +	}
> +}
> +
> +int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
> +				  struct iio_dma_buffer_block *block,
> +				  struct sg_table *sgt,
> +				  size_t size, bool cyclic)
> +{
> +	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
> +	int ret = 0;

No need to init as it's always set.


> +
> +	mutex_lock(&queue->lock);

guard(mutex)(&queue->lock);

Then can do direct returns on error and not bother with the manual
unlock.

> +	ret = iio_dma_can_enqueue_block(block);
> +	if (ret < 0)
> +		goto out_mutex_unlock;
> +
> +	block->bytes_used = size;
> +	block->cyclic = cyclic;
> +	block->sg_table = sgt;
> +
> +	iio_dma_buffer_enqueue(queue, block);
> +
> +out_mutex_unlock:
> +	mutex_unlock(&queue->lock);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(iio_dma_buffer_enqueue_dmabuf);


