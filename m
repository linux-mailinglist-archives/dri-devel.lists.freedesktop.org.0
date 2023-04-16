Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D3E6E3993
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 17:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542510E19F;
	Sun, 16 Apr 2023 15:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F4B10E19F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 15:04:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A121660C8F;
 Sun, 16 Apr 2023 15:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1B6C433EF;
 Sun, 16 Apr 2023 15:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681657448;
 bh=3XfcYKJTf9648eHoIZWE+scXWW1wRgr8pMTuHaE/qZ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p1uWn8XV4gWYM/nyHekPHz6WphaIcOgDac5rAU5cSiyyBERYHRb3y+5NBS+mjdk4W
 Hda1w6aFP5Aos8zqMx+498ZvoUNo53kfiyflUYv1KcBPdsukThlEqDlDduLTv18gAs
 CKsRZV6Dx44D3mQLsWGz4y0B5CYwhCiGnPcfQtejxUld13qSE3a1OzX8NJWdwcf4gw
 zeUq8f64mdF3yfku7/lqgWpcoHGW164TWJ4B+mrxjn4NWoloYdw15KwntM4xLNm9HB
 30+QmtDQO3qD+90dmXcVfBGMLf5zMHsNK+f5jrtRYSVd2tdSgRyGbLzeSjbSVkRR8q
 TtyK0pPrVsN6g==
Date: Sun, 16 Apr 2023 16:04:08 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 07/11] iio: core: Add new DMABUF interface
 infrastructure
Message-ID: <20230416160408.5fae01a0@jic23-huawei>
In-Reply-To: <20230403154800.215924-8-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154800.215924-8-paul@crapouillou.net>
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

On Mon,  3 Apr 2023 17:47:56 +0200
Paul Cercueil <paul@crapouillou.net> wrote:

> Add the necessary infrastructure to the IIO core to support a new
> optional DMABUF based interface.
> 
> With this new interface, DMABUF objects (externally created) can be
> attached to a IIO buffer, and subsequently used for data transfer.
> 
> A userspace application can then use this interface to share DMABUF
> objects between several interfaces, allowing it to transfer data in a
> zero-copy fashion, for instance between IIO and the USB stack.
> 
> The userspace application can also memory-map the DMABUF objects, and
> access the sample data directly. The advantage of doing this vs. the
> read() interface is that it avoids an extra copy of the data between the
> kernel and userspace. This is particularly userful for high-speed
> devices which produce several megabytes or even gigabytes of data per
> second.

I like numbers to support a patch.  Any nice ones to throw in here
as examples of expected rates?

> 
> As part of the interface, 3 new IOCTLs have been added:
> 
> IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
>  Attach the DMABUF object identified by the given file descriptor to the
>  buffer.
> 
> IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
>  Detach the DMABUF object identified by the given file descriptor from
>  the buffer. Note that closing the IIO buffer's file descriptor will
>  automatically detach all previously attached DMABUF objects.
> 
> IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
>  Request a data transfer to/from the given DMABUF object. Its file
>  descriptor, as well as the transfer size and flags are provided in the
>  "iio_dmabuf" structure.
> 
> These three IOCTLs have to be performed on the IIO buffer's file
> descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 

Trivial comments from me.  I don't (yet) understand dmabuf well enough
to know if that part is right or not.  Not sure I will ever find the time
so relying on those who are more familiar with it to tell me if that code
is correct.

Thanks,

Jonathan



>  static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>  {
>  	struct iio_dev_buffer_pair *ib = filep->private_data;
>  	struct iio_dev *indio_dev = ib->indio_dev;
>  	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf_priv *priv, *tmp;
>  
>  	wake_up(&buffer->pollq);
>  
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &buffer->dmabufs, entry) {
> +		list_del_init(&priv->entry);
> +		iio_buffer_dmabuf_put(priv->attach);
> +	}
> +
> +	/* TODO: Is it safe? Can "ib" be freed here? */

No idea :)  However that need resolving before we apply this.

> +	if (!list_empty(&buffer->dmabufs))
> +		dev_warn(&indio_dev->dev, "Buffer FD closed with active transfers\n");
> +
>  	kfree(ib);
>  	clear_bit(IIO_BUSY_BIT_POS, &buffer->flags);
>  	iio_device_put(indio_dev);
> @@ -1515,11 +1591,337 @@ static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
>  	return 0;
>  }
>  




> +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair *ib,
> +				     struct iio_dmabuf __user *iio_dmabuf_req,
> +				     bool nonblock)
> +{

...

> +
> +	ret = buffer->access->enqueue_dmabuf(buffer, priv->block, sgt,
> +					     iio_dmabuf.bytes_used, cyclic);
> +	if (ret)

Hmm. Is there an easy way to perhaps avoid a function with multiple
error handling paths like we have here.  Perhaps drag the
extra stuff from the the dmabuf_done() function into this if (ret)
then goto err_fence_put;?  I'm not sure if that would make this even
harder to read however.

> +		iio_buffer_signal_dmabuf_done(attach, ret);
> +
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_fence_put:
> +	dma_fence_put(&fence->base);
> +err_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, sgt, dir);
> +err_attachment_put:
> +	iio_buffer_dmabuf_put(attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
> +void iio_buffer_signal_dmabuf_done(struct dma_buf_attachment *attach, int ret)
> +{
> +	struct iio_dmabuf_priv *priv = attach->importer_priv;
> +	struct iio_dma_fence *fence = priv->fence;
> +	enum dma_data_direction dir = fence->dir;
> +	struct sg_table *sgt = fence->sgt;
> +
> +	dma_fence_get(&fence->base);
> +	fence->base.error = ret;
> +	dma_fence_signal(&fence->base);
> +	dma_fence_put(&fence->base);
> +
> +	dma_buf_unmap_attachment(attach, sgt, dir);
> +	iio_buffer_dmabuf_put(attach);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);

...

> diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
> index 89c3fd7c29ca..a8a490091277 100644
> --- a/include/linux/iio/buffer_impl.h
> +++ b/include/linux/iio/buffer_impl.h
> @@ -9,8 +9,11 @@
>  #include <uapi/linux/iio/buffer.h>
>  #include <linux/iio/buffer.h>
>  
> +struct dma_buf_attachment;
>  struct iio_dev;
> +struct iio_dma_buffer_block;
>  struct iio_buffer;
> +struct sg_table;
>  
>  /**
>   * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the buffer can not be
> @@ -39,6 +42,9 @@ struct iio_buffer;
>   *                      device stops sampling. Calles are balanced with @enable.
>   * @release:		called when the last reference to the buffer is dropped,
>   *			should free all resources allocated by the buffer
> + * @alloc_dmabuf:	called from userspace via ioctl to allocate one DMABUF.

Looks like you missed updating the docs.

> + * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
> + *			object to this buffer. Requires a valid DMABUF fd.
>   * @modes:		Supported operating modes by this buffer type
>   * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
>   *
> @@ -68,6 +74,14 @@ struct iio_buffer_access_funcs {
>  
>  	void (*release)(struct iio_buffer *buffer);
>  
> +	struct iio_dma_buffer_block * (*attach_dmabuf)(struct iio_buffer *buffer,
> +						       struct dma_buf_attachment *attach);
> +	void (*detach_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block);
> +	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
> +			      struct iio_dma_buffer_block *block,
> +			      struct sg_table *sgt, size_t size, bool cyclic);
> +
>  	unsigned int modes;
>  	unsigned int flags;
>  };

