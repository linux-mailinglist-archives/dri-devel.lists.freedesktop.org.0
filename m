Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549646E399D
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B22910E1E6;
	Sun, 16 Apr 2023 15:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D839010E1E6
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:10:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3935760C01;
 Sun, 16 Apr 2023 15:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23133C433D2;
 Sun, 16 Apr 2023 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681657824;
 bh=I0sotEmV3kawNyJtlPP3kmpIyzaPhPsF87PCQWk+tlY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sPXbC0sAJIEoZdtARQ8ujGEOupvOV46NmhADpKDepBQtzwPcO0oko3cFP0kUwSjFW
 9bWkPtWo1p0jYWXPNV+7F4Vz/nzPvZpvkJgSeS6+AkbGqaz2DVx3OwXsD9mxZdMCGJ
 F+ntAIeeoUDxtOWV6Kr5I1kYHIlTAmK1TkQxvkUlULhs/wwZCU9kvksDQn6+qhrn9G
 Z6bvxASy0KCgriRs42PpEUlOtY9zzHJDDM0Pk1c36EDo7f+BlnU6lXdQProQSL+nQz
 Mw8SMUN/9Xaz0avDg+4zabNkNYgg93URXiM5j7tMUwDaTR02tsQ+inoiBL1DnD2zIw
 qWeKX7qeNQblQ==
Date: Sun, 16 Apr 2023 16:10:24 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 09/11] iio: buffer-dma: Enable support for DMABUFs
Message-ID: <20230416161024.68c761b2@jic23-huawei>
In-Reply-To: <20230403154800.215924-10-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-10-paul@crapouillou.net>
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
 Vinod Koul <vkoul@kernel.org>, Nuno =?UTF-8?B?U8Oh?= <noname.nuno@gmail.com>,
 dmaengine@vger.kernel.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  3 Apr 2023 17:47:58 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
> and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
> DMA buffer implementations.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Hi Paul,

A few superficially comments.

Jonathan

> 
> ---
> v3: Update code to provide the functions that will be used as callbacks
> for the new IOCTLs.
> ---
>  drivers/iio/buffer/industrialio-buffer-dma.c | 157 +++++++++++++++++--
>  include/linux/iio/buffer-dma.h               |  24 +++
>  2 files changed, 168 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
> index e14814e0d4c8..422bd784fd1e 100644
> --- a/drivers/iio/buffer/industrialio-buffer-dma.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dma.c
...

> @@ -412,8 +448,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
>  
>  	block->state = IIO_BLOCK_STATE_ACTIVE;
>  	iio_buffer_block_get(block);
> +

Trivial, but I'd rather not see unrelated white space changes in a patch
doing anything else.

>  	ret = queue->ops->submit(queue, block);
>  	if (ret) {
> +		if (!block->fileio)
> +			iio_buffer_signal_dmabuf_done(block->attach, ret);
> +
>  		/*
>  		 * This is a bit of a problem and there is not much we can do
>  		 * other then wait for the buffer to be disabled and re-enabled
> @@ -645,6 +685,97 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
>  }
>  EXPORT_SYMBOL_GPL(iio_dma_buffer_data_available);

...

> +int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
> +				  struct iio_dma_buffer_block *block,
> +				  struct sg_table *sgt,
> +				  size_t size, bool cyclic)
> +{
> +	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
> +	int ret = 0;

No need to init.

> +
> +	mutex_lock(&queue->lock);
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

Obviously an unrelated activity but good to namespace these
in a future patch set.

> +
>  /**
>   * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
>   * @buffer: Buffer to set the bytes-per-datum for
> diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
> index 490b93f76fa8..e5e5817e99db 100644
> --- a/include/linux/iio/buffer-dma.h
> +++ b/include/linux/iio/buffer-dma.h

>  /**
>   * enum iio_block_state - State of a struct iio_dma_buffer_block
> @@ -41,6 +43,7 @@ enum iio_block_state {
>   * @queue: Parent DMA buffer queue
>   * @kref: kref used to manage the lifetime of block
>   * @state: Current state of the block
> + * @fileio: True if this buffer is used for fileio mode

Docs need update for the other two new elements.

>   */
>  struct iio_dma_buffer_block {
>  	/* May only be accessed by the owner of the block */
> @@ -63,6 +66,11 @@ struct iio_dma_buffer_block {
>  	 * queue->list_lock if the block is not owned by the core.
>  	 */
>  	enum iio_block_state state;
> +
> +	bool fileio;
> +
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sg_table;
>  };

