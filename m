Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F1826E62
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 13:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AF310E227;
	Mon,  8 Jan 2024 12:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34DB410E227
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 12:39:50 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-33678b10a6eso111859f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 04:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704717588; x=1705322388; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KbKWdY6tX7JYXqTO40SnLsFWTNoCK2o+Xfus7NtTz0=;
 b=WckV52vI4f4KxiPg3uQmN0mmLwuudcrxjoM0G2qd+s6AfkK3RBuw8YZVo3+r4JN5SV
 WSsiA0b3vnx/0ZE6ZrDVrBDa4jUBH4FgQHu34B0lxFYlBUw0csW3yNEpIHB+1GhxOg3R
 wiwsZTyWj8+1CDD4gh8Pm2U5CTjQ2Rt1Nu8ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704717588; x=1705322388;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+KbKWdY6tX7JYXqTO40SnLsFWTNoCK2o+Xfus7NtTz0=;
 b=O3+tcMVgoQE6jMXJbfDVmt6D4cSyym2XOLFwbM+kap8d8u6focWA+yHilFMa9r+sfM
 R/mLqBV2yaO6sTUOUOHCuld6j6oTfHe0C/lUeCzy8QaD7J0hY1lLtCzD2l93cOatVXez
 vMPc0wlqoJ2ruhheZ+RaQ3yP++bqe32ls2GaHNG9XWIL7HZgimtjWMJTML+IgJQY5RbX
 k8/pN5LIyXBaUaLctVkEjqzLtsTBMCLj/zKuAdiIN/fJOzuJkSaqWC18RScEuZMLNT49
 UKfUFBTc72HWE+hIsjgvXDXrwj9pgw15fLh3WhtCSgwpAYMM/xBPwo0YBBWN6+QIhCa4
 R0vA==
X-Gm-Message-State: AOJu0Yx+CI/MsU3jbUuLNJ3cKAOKeOCsicAfpKZIrOKb0SEV9lJ0SQSE
 89U97Q5vqL9CqTAudVQDdigtgZHRGvAdCg==
X-Google-Smtp-Source: AGHT+IEtdsujLQAfMWY6f9gvYBA/7jBgVOleN/XweQQFmj3GT8Jwm8Z1cde2qqWLdjwrV6/eZRCzcw==
X-Received: by 2002:a5d:618c:0:b0:336:fad1:ffd3 with SMTP id
 j12-20020a5d618c000000b00336fad1ffd3mr4348628wru.4.1704717588308; 
 Mon, 08 Jan 2024 04:39:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a5d4ac5000000b00336670abdcasm7730581wrs.40.2024.01.08.04.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 04:39:47 -0800 (PST)
Date: Mon, 8 Jan 2024 13:39:45 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108120056.22165-4-paul@crapouillou.net>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: linux-usb@vger.kernel.org, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil wrote:
> This patch introduces three new ioctls. They all should be called on a
> data endpoint (ie. not ep0). They are:
> 
> - FUNCTIONFS_DMABUF_ATTACH, which takes the file descriptor of a DMABUF
>   object to attach to the endpoint.
> 
> - FUNCTIONFS_DMABUF_DETACH, which takes the file descriptor of the
>   DMABUF to detach from the endpoint. Note that closing the endpoint's
>   file descriptor will automatically detach all attached DMABUFs.
> 
> - FUNCTIONFS_DMABUF_TRANSFER, which requests a data transfer from / to
>   the given DMABUF. Its argument is a structure that packs the DMABUF's
>   file descriptor, the size in bytes to transfer (which should generally
>   be set to the size of the DMABUF), and a 'flags' field which is unused
>   for now.
>   Before this ioctl can be used, the related DMABUF must be attached
>   with FUNCTIONFS_DMABUF_ATTACH.
> 
> These three ioctls enable the FunctionFS code to transfer data between
> the USB stack and a DMABUF object, which can be provided by a driver
> from a completely different subsystem, in a zero-copy fashion.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> 
> ---
> v2:
> - Make ffs_dma_resv_lock() static
> - Add MODULE_IMPORT_NS(DMA_BUF);
> - The attach/detach functions are now performed without locking the
>   eps_lock spinlock. The transfer function starts with the spinlock
>   unlocked, then locks it before allocating and queueing the USB
>   transfer.
> 
> v3:
> - Inline to_ffs_dma_fence() which was called only once.
> - Simplify ffs_dma_resv_lock()
> - Add comment explaining why we unref twice in ffs_dmabuf_detach()
> - Document uapi struct usb_ffs_dmabuf_transfer_req and IOCTLs
> ---
>  drivers/usb/gadget/function/f_fs.c  | 417 ++++++++++++++++++++++++++++
>  include/uapi/linux/usb/functionfs.h |  41 +++
>  2 files changed, 458 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index ed2a6d5fcef7..9df1f5abb0d4 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -15,6 +15,9 @@
>  /* #define VERBOSE_DEBUG */
>  
>  #include <linux/blkdev.h>
> +#include <linux/dma-buf.h>
> +#include <linux/dma-fence.h>
> +#include <linux/dma-resv.h>
>  #include <linux/pagemap.h>
>  #include <linux/export.h>
>  #include <linux/fs_parser.h>
> @@ -43,6 +46,8 @@
>  
>  #define FUNCTIONFS_MAGIC	0xa647361 /* Chosen by a honest dice roll ;) */
>  
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>  /* Reference counter handling */
>  static void ffs_data_get(struct ffs_data *ffs);
>  static void ffs_data_put(struct ffs_data *ffs);
> @@ -124,6 +129,21 @@ struct ffs_ep {
>  	u8				num;
>  };
>  
> +struct ffs_dmabuf_priv {
> +	struct list_head entry;
> +	struct kref ref;
> +	struct dma_buf_attachment *attach;
> +	spinlock_t lock;
> +	u64 context;
> +};
> +
> +struct ffs_dma_fence {
> +	struct dma_fence base;
> +	struct ffs_dmabuf_priv *priv;
> +	struct sg_table *sgt;
> +	enum dma_data_direction dir;
> +};
> +
>  struct ffs_epfile {
>  	/* Protects ep->ep and ep->req. */
>  	struct mutex			mutex;
> @@ -197,6 +217,8 @@ struct ffs_epfile {
>  	unsigned char			isoc;	/* P: ffs->eps_lock */
>  
>  	unsigned char			_pad;
> +
> +	struct list_head		dmabufs;
>  };
>  
>  struct ffs_buffer {
> @@ -1271,10 +1293,44 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
>  	return res;
>  }
>  
> +static void ffs_dmabuf_release(struct kref *ref)
> +{
> +	struct ffs_dmabuf_priv *priv = container_of(ref, struct ffs_dmabuf_priv, ref);
> +	struct dma_buf_attachment *attach = priv->attach;
> +	struct dma_buf *dmabuf = attach->dmabuf;
> +
> +	pr_debug("FFS DMABUF release\n");
> +	dma_buf_detach(attach->dmabuf, attach);
> +	dma_buf_put(dmabuf);
> +
> +	list_del(&priv->entry);

I didn't find any locking for this list here.

> +	kfree(priv);
> +}
> +
> +static void ffs_dmabuf_get(struct dma_buf_attachment *attach)
> +{
> +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_get(&priv->ref);
> +}
> +
> +static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
> +{
> +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> +
> +	kref_put(&priv->ref, ffs_dmabuf_release);
> +}
> +
>  static int
>  ffs_epfile_release(struct inode *inode, struct file *file)
>  {
>  	struct ffs_epfile *epfile = inode->i_private;
> +	struct ffs_dmabuf_priv *priv, *tmp;
> +
> +	/* Close all attached DMABUFs */
> +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
> +		ffs_dmabuf_put(priv->attach);
> +	}
>  
>  	__ffs_epfile_read_buffer_free(epfile);
>  	ffs_data_closed(epfile->ffs);
> @@ -1282,6 +1338,328 @@ ffs_epfile_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
> +{
> +	struct ffs_dmabuf_priv *priv = dma_fence->priv;
> +	struct dma_fence *fence = &dma_fence->base;
> +
> +	dma_fence_get(fence);
> +	fence->error = ret;
> +	dma_fence_signal(fence);
> +
> +	dma_buf_unmap_attachment(priv->attach, dma_fence->sgt, dma_fence->dir);
> +	dma_fence_put(fence);
> +	ffs_dmabuf_put(priv->attach);

So this can in theory take the dma_resv lock, and if the usb completion
isn't an unlimited worker this could hold up completion of future
dma_fence, resulting in a deadlock.

Needs to be checked how usb works, and if stalling indefinitely in the
io_complete callback can hold up the usb stack you need to:

- drop a dma_fence_begin/end_signalling annotations in here
- pull out the unref stuff into a separate preallocated worker (or at
  least the final unrefs for ffs_dma_buf).

> +}
> +
> +static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
> +					  struct usb_request *req)
> +{
> +	pr_debug("FFS: DMABUF transfer complete, status=%d\n", req->status);
> +	ffs_dmabuf_signal_done(req->context, req->status);
> +	usb_ep_free_request(ep, req);
> +}
> +
> +static const char *ffs_dmabuf_get_driver_name(struct dma_fence *fence)
> +{
> +	return "functionfs";
> +}
> +
> +static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
> +{
> +	return "";
> +}
> +
> +static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> +{
> +	struct ffs_dma_fence *dma_fence =
> +		container_of(fence, struct ffs_dma_fence, base);
> +
> +	kfree(dma_fence);
> +}
> +
> +static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
> +	.get_driver_name	= ffs_dmabuf_get_driver_name,
> +	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
> +	.release		= ffs_dmabuf_fence_release,
> +};
> +
> +static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
> +{
> +	int ret;
> +
> +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> +	if (ret) {
> +		if (ret != -EDEADLK)
> +			return ret;
> +		if (nonblock)
> +			return -EBUSY;
> +
> +		ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);

This is overkill, without a reservation context you will never get
-EDEADLK and so never have to do slowpath locking. So just dead code.

If you want to check, build with CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y

> +	}
> +
> +	return ret;
> +}
> +
> +static struct dma_buf_attachment *
> +ffs_dmabuf_find_attachment(struct device *dev, struct dma_buf *dmabuf,
> +			   bool nonblock)
> +{
> +	struct dma_buf_attachment *elm, *attach = NULL;
> +	int ret;
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	list_for_each_entry(elm, &dmabuf->attachments, node) {
> +		if (elm->dev == dev) {
> +			attach = elm;
> +			break;
> +		}
> +	}
> +
> +	if (attach)
> +		ffs_dmabuf_get(elm);

This needs a kref_get_unless_zero or you can race with the final free.

I'm not super keen that usb-gadget is noodling around in the attachment
list like this, your own lookup structure (you have the dma-buf list
already anyway to keep track of all attachments) would be much nicer. But
the get_unless_zero I think is mandatory here for this weak reference.

> +
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	return attach ?: ERR_PTR(-EPERM);
> +}
> +
> +static int ffs_dmabuf_attach(struct file *file, int fd)
> +{
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	struct dma_buf_attachment *attach;
> +	struct ffs_dmabuf_priv *priv;
> +	struct dma_buf *dmabuf;
> +	int err;
> +
> +	if (!gadget || !gadget->sg_supported)
> +		return -EPERM;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
> +	if (IS_ERR(attach)) {
> +		err = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		err = -ENOMEM;
> +		goto err_dmabuf_detach;
> +	}
> +
> +	attach->importer_priv = priv;
> +
> +	priv->attach = attach;
> +	spin_lock_init(&priv->lock);
> +	kref_init(&priv->ref);
> +	priv->context = dma_fence_context_alloc(1);

Just to check: usb gagdet gurantees that all requests on an ep are
ordered?

> +
> +	list_add(&priv->entry, &epfile->dmabufs);
> +
> +	return 0;
> +
> +err_dmabuf_detach:
> +	dma_buf_detach(dmabuf, attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return err;
> +}
> +
> +static int ffs_dmabuf_detach(struct file *file, int fd)
> +{
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	bool nonblock = file->f_flags & O_NONBLOCK;
> +	struct dma_buf_attachment *attach;
> +	struct dma_buf *dmabuf;
> +	int ret = 0;
> +
> +	dmabuf = dma_buf_get(fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> +					    dmabuf, nonblock);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto out_dmabuf_put;
> +	}
> +
> +	/*
> +	 * Unref twice to release the reference obtained with
> +	 * ffs_dmabuf_find_attachment() above, and the one obtained in
> +	 * ffs_dmabuf_attach().
> +	 */
> +	ffs_dmabuf_put(attach);

This looks strange, what's stopping userspace from calling detach multiple
times while a transfer is pending (so that the destruction is delayed)?
That smells like a refcount underflow.

You probably need to tie the refcounts you acquire in ffs_dmabuf_attach to
epfile->dmabufs 1:1 to make sure there's no way userspace can pull you
over the table. This is also the reason why I looked for the locking of
that list, and didn't find it.

> +	ffs_dmabuf_put(attach);
> +
> +out_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +	return ret;
> +}
> +
> +static int ffs_dmabuf_transfer(struct file *file,
> +			       const struct usb_ffs_dmabuf_transfer_req *req)
> +{
> +	bool dma_to_ram, nonblock = file->f_flags & O_NONBLOCK;
> +	struct ffs_epfile *epfile = file->private_data;
> +	struct usb_gadget *gadget = epfile->ffs->gadget;
> +	struct dma_buf_attachment *attach;
> +	struct ffs_dmabuf_priv *priv;
> +	enum dma_data_direction dir;
> +	struct ffs_dma_fence *fence;
> +	struct usb_request *usb_req;
> +	struct sg_table *sg_table;
> +	struct dma_buf *dmabuf;
> +	struct ffs_ep *ep;
> +	int ret;
> +
> +	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
> +		return -EINVAL;
> +
> +	dmabuf = dma_buf_get(req->fd);
> +	if (IS_ERR(dmabuf))
> +		return PTR_ERR(dmabuf);
> +
> +	if (req->length > dmabuf->size || req->length == 0) {
> +		ret = -EINVAL;
> +		goto err_dmabuf_put;
> +	}
> +
> +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> +					    dmabuf, nonblock);
> +	if (IS_ERR(attach)) {
> +		ret = PTR_ERR(attach);
> +		goto err_dmabuf_put;
> +	}
> +
> +	priv = attach->importer_priv;
> +
> +	if (epfile->in)
> +		dir = DMA_FROM_DEVICE;
> +	else
> +		dir = DMA_TO_DEVICE;
> +
> +	sg_table = dma_buf_map_attachment(attach, dir);
> +	if (IS_ERR(sg_table)) {
> +		ret = PTR_ERR(sg_table);
> +		goto err_attachment_put;
> +	}
> +
> +	ep = ffs_epfile_wait_ep(file);
> +	if (IS_ERR(ep)) {
> +		ret = PTR_ERR(ep);
> +		goto err_unmap_attachment;
> +	}
> +
> +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> +	if (ret)
> +		goto err_unmap_attachment;
> +
> +	/* Make sure we don't have writers */
> +	if (!dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_WRITE)) {
> +		pr_debug("FFS WRITE fence is not signaled\n");
> +		ret = -EBUSY;
> +		goto err_resv_unlock;
> +	}
> +
> +	dma_to_ram = dir == DMA_FROM_DEVICE;
> +
> +	/* If we're writing to the DMABUF, make sure we don't have readers */
> +	if (dma_to_ram &&
> +	    !dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_READ)) {
> +		pr_debug("FFS READ fence is not signaled\n");
> +		ret = -EBUSY;
> +		goto err_resv_unlock;
> +	}
> +
> +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> +	if (ret)
> +		goto err_resv_unlock;
> +
> +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence) {
> +		ret = -ENOMEM;
> +		goto err_resv_unlock;
> +	}
> +
> +	fence->sgt = sg_table;
> +	fence->dir = dir;
> +	fence->priv = priv;
> +
> +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> +		       &priv->lock, priv->context, 0);

You need a real seqno here or things break with fence merging. Or
alternatively unordered dma_fence (which are implemented by allocating a
new context for each fence, maybe we should change that eventually ...).
> +
> +	spin_lock_irq(&epfile->ffs->eps_lock);
> +
> +	/* In the meantime, endpoint got disabled or changed. */
> +	if (epfile->ep != ep) {
> +		ret = -ESHUTDOWN;
> +		goto err_fence_put;
> +	}
> +
> +	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> +	if (!usb_req) {
> +		ret = -ENOMEM;
> +		goto err_fence_put;
> +	}
> +
> +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> +			   dma_resv_usage_rw(dma_to_ram));
> +	dma_resv_unlock(dmabuf->resv);
> +
> +	/* Now that the dma_fence is in place, queue the transfer. */
> +
> +	usb_req->length = req->length;
> +	usb_req->buf = NULL;
> +	usb_req->sg = sg_table->sgl;
> +	usb_req->num_sgs = sg_nents_for_len(sg_table->sgl, req->length);
> +	usb_req->sg_was_mapped = true;
> +	usb_req->context  = fence;
> +	usb_req->complete = ffs_epfile_dmabuf_io_complete;
> +
> +	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
> +	if (ret) {
> +		usb_ep_free_request(ep->ep, usb_req);
> +
> +		spin_unlock_irq(&epfile->ffs->eps_lock);
> +
> +		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
> +		ffs_dmabuf_signal_done(fence, ret);
> +		goto out_dma_buf_put;
> +	}
> +
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +
> +out_dma_buf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +
> +err_fence_put:
> +	spin_unlock_irq(&epfile->ffs->eps_lock);
> +	dma_fence_put(&fence->base);
> +err_resv_unlock:
> +	dma_resv_unlock(dmabuf->resv);
> +err_unmap_attachment:
> +	dma_buf_unmap_attachment(attach, sg_table, dir);
> +err_attachment_put:
> +	ffs_dmabuf_put(attach);
> +err_dmabuf_put:
> +	dma_buf_put(dmabuf);
> +
> +	return ret;
> +}
> +
>  static long ffs_epfile_ioctl(struct file *file, unsigned code,
>  			     unsigned long value)
>  {
> @@ -1292,6 +1670,44 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
>  	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
>  		return -ENODEV;
>  
> +	switch (code) {
> +	case FUNCTIONFS_DMABUF_ATTACH:
> +	{
> +		int fd;
> +
> +		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_attach(file, fd);
> +	}
> +	case FUNCTIONFS_DMABUF_DETACH:
> +	{
> +		int fd;
> +
> +		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_detach(file, fd);
> +	}
> +	case FUNCTIONFS_DMABUF_TRANSFER:
> +	{
> +		struct usb_ffs_dmabuf_transfer_req req;
> +
> +		if (copy_from_user(&req, (void __user *)value, sizeof(req))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		return ffs_dmabuf_transfer(file, &req);
> +	}
> +	default:
> +		break;
> +	}
> +
>  	/* Wait for endpoint to be enabled */
>  	ep = ffs_epfile_wait_ep(file);
>  	if (IS_ERR(ep))
> @@ -1869,6 +2285,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>  	for (i = 1; i <= count; ++i, ++epfile) {
>  		epfile->ffs = ffs;
>  		mutex_init(&epfile->mutex);
> +		INIT_LIST_HEAD(&epfile->dmabufs);
>  		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
>  			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
>  		else
> diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
> index 078098e73fd3..9f88de9c3d66 100644
> --- a/include/uapi/linux/usb/functionfs.h
> +++ b/include/uapi/linux/usb/functionfs.h
> @@ -86,6 +86,22 @@ struct usb_ext_prop_desc {
>  	__le16	wPropertyNameLength;
>  } __attribute__((packed));
>  
> +/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
> +#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
> +
> +/**
> + * struct usb_ffs_dmabuf_transfer_req - Transfer request for a DMABUF object
> + * @fd:		file descriptor of the DMABUF object
> + * @flags:	one or more USB_FFS_DMABUF_TRANSFER_* flags
> + * @length:	number of bytes used in this DMABUF for the data transfer.
> + *		Should generally be set to the DMABUF's size.
> + */
> +struct usb_ffs_dmabuf_transfer_req {
> +	int fd;
> +	__u32 flags;
> +	__u64 length;
> +} __attribute__((packed));
> +
>  #ifndef __KERNEL__
>  
>  /*
> @@ -290,6 +306,31 @@ struct usb_functionfs_event {
>  #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
>  					     struct usb_endpoint_descriptor)
>  
> +/*
> + * Attach the DMABUF object, identified by its file descriptor, to the
> + * data endpoint. Returns zero on success, and a negative errno value
> + * on error.
> + */
> +#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
> +
>  
> +/*
> + * Detach the given DMABUF object, identified by its file descriptor,
> + * from the data endpoint. Returns zero on success, and a negative
> + * errno value on error. Note that closing the endpoint's file
> + * descriptor will automatically detach all attached DMABUFs.
> + */
> +#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
> +
> +/*
> + * Enqueue the previously attached DMABUF to the transfer queue.
> + * The argument is a structure that packs the DMABUF's file descriptor,
> + * the size in bytes to transfer (which should generally correspond to
> + * the size of the DMABUF), and a 'flags' field which is unused
> + * for now. Returns zero on success, and a negative errno value on
> + * error.
> + */
> +#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
> +					     struct usb_ffs_dmabuf_transfer_req)
>  
>  #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */

Only things I've found are (I think at least) bugs in the usb gadget
logic, not directly in how dma-buf/fence is used. The only thing I've
noticed is the lack of actual dma_fence seqno (which I think Christian
already pointed out in an already review, looking at archives at least).
With that addressed:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
