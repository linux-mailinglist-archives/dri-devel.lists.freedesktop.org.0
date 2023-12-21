Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96BE81B574
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 13:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EB210E342;
	Thu, 21 Dec 2023 12:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30C10E342
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Dec 2023 12:06:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id BEB19B81FA8;
 Thu, 21 Dec 2023 12:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AD5C433C8;
 Thu, 21 Dec 2023 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703160402;
 bh=FYeMNbw8BtytmLK5Ppctl2wRAn1H7cpvJrvgLFOJx2Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sX6so0f4M/3Bs5KwTHM+VMk5in6ZgO5QYdYI0Paa7gQu9qHCci1ZVUdXUxK9oFtRX
 9lVHjt8zxqJVwZ+NhER/9c+1+ZfqkBBRMClGjdrOMF1wB2+VRKqLtMFERbfM/Zgyin
 ixzCLXoT0WCt8FnzrbjXOWQDZPQnoErnhty2SBw70Da1OQfREssoBJaQfomklAsi6/
 U1YLaRMm6STIQPdA2Sx/DOVxFIToUl0tdub6n/AfDSRM+WxefiiTZpa0/0T7xpq1ck
 tQWiBG7c1fXD6+Yik/KzgwSrajMEzReB+Qc+VuNbdyUraD3fDRG/F50pYfbMpHjR6F
 utzHHz8O2jk/g==
Date: Thu, 21 Dec 2023 12:06:24 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 5/8] iio: core: Add new DMABUF interface infrastructure
Message-ID: <20231221120624.7bcdc302@jic23-huawei>
In-Reply-To: <20231219175009.65482-6-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
 <20231219175009.65482-6-paul@crapouillou.net>
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

On Tue, 19 Dec 2023 18:50:06 +0100
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

Fair enough - so they don't apply to the 'legacy' buffer which simplifies
things but in one place you assume that logic is used (given error return
values).

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
This is big and complex and I'm out of time for now, so I've made some
comments but should revisit it.
I'm also looking for review from those more familiar with dmabuf side
of things than I am!

Jonathan


>  
> +static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
> +{
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +	if (ret) {
> +		if (ret != -EDEADLK)
> +			goto out;
> +		if (nonblock) {
> +			ret = -EBUSY;
> +			goto out;
> +		}
> +
> +		ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
> +	}
> +
> +out:
> +	return ret;

I'm not a fan gotos that do nothing.  Just return in appropriate places above.

> +}
>
> +static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib, int *user_req)
> +{
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int dmabuf_fd, ret = 0;
> +
> +	if (copy_from_user(&dmabuf_fd, user_req, sizeof(dmabuf_fd)))
> +		return -EFAULT;
> +
> +	dmabuf = dma_buf_get(dmabuf_fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	attach = iio_buffer_find_attachment(ib->indio_dev, dmabuf);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto out_dmabuf_put;
> +	}
> +
> +	priv = attach->importer_priv;
> +	list_del_init(&priv->entry);
> +
> +	/*
> +	 * Unref twice to release the reference obtained with
> +	 * iio_buffer_find_attachment() above, and the one obtained in
> +	 * iio_buffer_attach_dmabuf().
> +	 */
> +	iio_buffer_dmabuf_put(attach);
> +	iio_buffer_dmabuf_put(attach);
> +
> +out_dmabuf_put:
> +	dma_buf_put(dmabuf);
As below. Feels like a __free(dma_buf_put) bit of magic would be a nice to have.

> +
> +	return ret;
> +}
> +
> +static const char *
> +iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return "iio";
> +}
> +
> +static void iio_buffer_dma_fence_release(struct dma_fence *fence)
> +{
> +	struct iio_dma_fence *iio_fence =
> +		container_of(fence, struct iio_dma_fence, base);
> +
> +	kfree(iio_fence);
> +}
> +
> +static const struct dma_fence_ops iio_buffer_dma_fence_ops = {
> +	.get_driver_name	= iio_buffer_dma_fence_get_driver_name,
> +	.get_timeline_name	= iio_buffer_dma_fence_get_driver_name,
> +	.release		= iio_buffer_dma_fence_release,
> +};
> +
> +static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair *ib,
> +				     struct iio_dmabuf __user *iio_dmabuf_req,
> +				     bool nonblock)
> +{
> +	struct iio_dev *indio_dev = ib->indio_dev;
> +	struct iio_buffer *buffer = ib->buffer;
> +	struct iio_dmabuf iio_dmabuf;
> +	struct dma_buf_attachment *attach;
> +	struct iio_dmabuf_priv *priv;
> +	enum dma_data_direction dir;
> +	struct iio_dma_fence *fence;
> +	struct dma_buf *dmabuf;
> +	struct sg_table *sgt;
> +	unsigned long timeout;
> +	bool dma_to_ram;
> +	bool cyclic;
> +	int ret;
> +
> +	if (copy_from_user(&iio_dmabuf, iio_dmabuf_req, sizeof(iio_dmabuf)))
> +		return -EFAULT;
> +
> +	if (iio_dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
> +		return -EINVAL;
> +
> +	cyclic = iio_dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC;
> +
> +	/* Cyclic flag is only supported on output buffers */
> +	if (cyclic && buffer->direction != IIO_BUFFER_DIRECTION_OUT)
> +		return -EINVAL;
> +
> +	dmabuf = dma_buf_get(iio_dmabuf.fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (!iio_dmabuf.bytes_used || iio_dmabuf.bytes_used > dmabuf->size) {
> +		ret = -EINVAL;
> +		goto err_dmabuf_put;
> +	}
> +
> +	attach = iio_buffer_find_attachment(indio_dev, dmabuf);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto err_dmabuf_put;

Might be worth some cleanup.h magic given this put happens in all exit paths.

> +	}
> +
> +	priv = attach->importer_priv;
> +
> +	dma_to_ram = buffer->direction == IIO_BUFFER_DIRECTION_IN;
> +	dir = dma_to_ram ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
> +
> +	sgt = dma_buf_map_attachment(attach, dir);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		dev_err(&indio_dev->dev, "Unable to map attachment: %d\n", ret);
> +		goto err_attachment_put;
> +	}
> +
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_unmap_attachment;
> +	}
> +
> +	fence->priv = priv;
> +	fence->sgt = sgt;
> +	fence->dir = dir;
> +	priv->fence = fence;
> +
> +	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
> +		       &priv->lock, priv->context, 0);
> +
> +	ret = iio_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_fence_put;
> +
> +	timeout = nonblock ? 0 : msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
> +
> +	/* Make sure we don't have writers */
> +	ret = (int) dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_WRITE,
> +					  true, timeout);

I'd handle this and similar cases as long rather than adding the odd looking cast and making
me think too much about it.

> +	if (ret == 0)
> +		ret = -EBUSY;
> +	if (ret < 0)
> +		goto err_resv_unlock;
> +
> +	if (dma_to_ram) {
> +		/*
> +		 * If we're writing to the DMABUF, make sure we don't have
> +		 * readers
> +		 */
> +		ret = (int) dma_resv_wait_timeout(dmabuf->resv,
> +						  DMA_RESV_USAGE_READ, true,
> +						  timeout);
> +		if (ret == 0)
> +			ret = -EBUSY;
> +		if (ret < 0)
> +			goto err_resv_unlock;
> +	}
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_resv_unlock;
> +
> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> +			   dma_resv_usage_rw(dma_to_ram));
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	ret = buffer->access->enqueue_dmabuf(buffer, priv->block, sgt,
> +					     iio_dmabuf.bytes_used, cyclic);
> +	if (ret)
> +		iio_buffer_signal_dmabuf_done(attach, ret);

I'd like a comment on why using the 'successful' path cleanup makes sense in this
error case.  It's possible to figure it out, but reviewers are lazy and generally
we like the cleanup to be obvious and local on error paths.

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

I don't know much about dma_fence, but is it valid to access
contents of it (sgt, etc) before getting a reference?
Ultimately dma_fence_put() can result in a kfree_rcu() so seems
unlikely to be safe and definitely fails the 'obviously correct'
test.  Given those are I assume trivial accesses just do them 
down here perhaps?


> +	fence->base.error = ret;
> +	dma_fence_signal(&fence->base);
> +	dma_fence_put(&fence->base);
> +
> +	dma_buf_unmap_attachment(attach, sgt, dir);
> +	iio_buffer_dmabuf_put(attach);
> +}
> +EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
> +

> +static long iio_buffer_chrdev_ioctl(struct file *filp,
> +				    unsigned int cmd, unsigned long arg)
> +{
> +	struct iio_dev_buffer_pair *ib = filp->private_data;
> +	void __user *_arg = (void __user *)arg;
> +
> +	switch (cmd) {
> +	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
> +		return iio_buffer_attach_dmabuf(ib, _arg);
> +	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
> +		return iio_buffer_detach_dmabuf(ib, _arg);
> +	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
> +		return iio_buffer_enqueue_dmabuf(ib, _arg,
> +						 filp->f_flags & O_NONBLOCK);
> +	default:
> +		return IIO_IOCTL_UNHANDLED;

Given you aren't using the ioctl handling on the legacy buffer, I think this
should simply return an error code, not the magic value we use to indicate
'all fine, but it's not mine'.
Probably -EINVAL or similar.  Note that the wrapper around the legacy buffer
ioctls translates this to -ENODEV; rather than returning from the ioctl.



> +	}
> +}
> +
>  static const struct file_operations iio_buffer_chrdev_fileops = {
>  	.owner = THIS_MODULE,
>  	.llseek = noop_llseek,
>  	.read = iio_buffer_read,
>  	.write = iio_buffer_write,
> +	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
> +	.compat_ioctl = compat_ptr_ioctl,
>  	.poll = iio_buffer_poll,
>  	.release = iio_buffer_chrdev_release,
>  };

