Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDBD82731E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 16:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE36610E27B;
	Mon,  8 Jan 2024 15:30:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B2410E232
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 15:29:59 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e412c1c58so2769575e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 07:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704727798; x=1705332598; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2MbnvuFH5avs224Y6+eUBoAgapNKRL93z9F8nAO2ztM=;
 b=I/7x/kCJGHeuKQBFrF5YYZ/1JSnaQ86ib1riM2ch/182m/dVRluMylkiqJJmMchaMf
 5bgBbkWHuF+i+ljjYJfWyhij3REVCfdWIPXf0A/6+tOruc44b2DFMqyhB1imlkLeSy+L
 tlH6P34wnY30ydVhTJeLryn5/HhkJ1Yc45D8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704727798; x=1705332598;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2MbnvuFH5avs224Y6+eUBoAgapNKRL93z9F8nAO2ztM=;
 b=DIWb6X/Ly81f4AO4znqxZPq7C73AWibsvCd9WFK8bu4/s+tYvwcylDgH81A2IUTHX4
 +7lB/qSAGk+8Aa4RQjmw4Rs9IS8jigsRDTpdUKgRVpLUm1LML0kou4SQbaer8dSVljZp
 fgZyx+MJyFRwQ4sJkss7/HrbanOrxslZn5SWRWLf8Ee8NKCWdp1vHWa+/6XvJ6JqyDiw
 bw7iOxk4WIzf2klm065Ll+FcNMmVxVMu6E6vVIJr6/0xeK6f2WHY1G6lYp9YfjrUkpK1
 cjefHENJKi0Me+CMBpn0dHj/xH8ucRrk7nbPdO/vVVlWJTo9WLzrBMdyf1HUvTpI/nzn
 5+0g==
X-Gm-Message-State: AOJu0Yw7JLWIe32sHH6Brm+H45QX2aPm4eiuyp+snqDSFhKDWRKkN+pD
 eqxi+iPSOM6bXR6FU7kBVFCHM7a6sciYNw==
X-Google-Smtp-Source: AGHT+IGGafolo4lUSJI50rV03s0/28KwRrPLnQWVQNtXCVhLE7Rq+r9OtK2rAoRA23RT0NDE+Ur5pg==
X-Received: by 2002:a05:600c:511f:b0:40d:7720:30a6 with SMTP id
 o31-20020a05600c511f00b0040d772030a6mr4843525wms.3.1704727797848; 
 Mon, 08 Jan 2024 07:29:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b0040e34835a58sm182569wmn.22.2024.01.08.07.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 07:29:57 -0800 (PST)
Date: Mon, 8 Jan 2024 16:29:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 3/4] usb: gadget: functionfs: Add DMABUF import
 interface
Message-ID: <ZZwU827NMHbx7bsO@phenom.ffwll.local>
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
 <ZZvtEXL8DLPPdtPs@phenom.ffwll.local>
 <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a44aca93adc60ce56a64c50797a029631900172e.camel@crapouillou.net>
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
Cc: linux-usb@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 08, 2024 at 03:21:21PM +0100, Paul Cercueil wrote:
> Hi Daniel (Sima?),
> 
> Le lundi 08 janvier 2024 à 13:39 +0100, Daniel Vetter a écrit :
> > On Mon, Jan 08, 2024 at 01:00:55PM +0100, Paul Cercueil wrote:
> > > This patch introduces three new ioctls. They all should be called
> > > on a
> > > data endpoint (ie. not ep0). They are:
> > > 
> > > - FUNCTIONFS_DMABUF_ATTACH, which takes the file descriptor of a
> > > DMABUF
> > >   object to attach to the endpoint.
> > > 
> > > - FUNCTIONFS_DMABUF_DETACH, which takes the file descriptor of the
> > >   DMABUF to detach from the endpoint. Note that closing the
> > > endpoint's
> > >   file descriptor will automatically detach all attached DMABUFs.
> > > 
> > > - FUNCTIONFS_DMABUF_TRANSFER, which requests a data transfer from /
> > > to
> > >   the given DMABUF. Its argument is a structure that packs the
> > > DMABUF's
> > >   file descriptor, the size in bytes to transfer (which should
> > > generally
> > >   be set to the size of the DMABUF), and a 'flags' field which is
> > > unused
> > >   for now.
> > >   Before this ioctl can be used, the related DMABUF must be
> > > attached
> > >   with FUNCTIONFS_DMABUF_ATTACH.
> > > 
> > > These three ioctls enable the FunctionFS code to transfer data
> > > between
> > > the USB stack and a DMABUF object, which can be provided by a
> > > driver
> > > from a completely different subsystem, in a zero-copy fashion.
> > > 
> > > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> > > 
> > > ---
> > > v2:
> > > - Make ffs_dma_resv_lock() static
> > > - Add MODULE_IMPORT_NS(DMA_BUF);
> > > - The attach/detach functions are now performed without locking the
> > >   eps_lock spinlock. The transfer function starts with the spinlock
> > >   unlocked, then locks it before allocating and queueing the USB
> > >   transfer.
> > > 
> > > v3:
> > > - Inline to_ffs_dma_fence() which was called only once.
> > > - Simplify ffs_dma_resv_lock()
> > > - Add comment explaining why we unref twice in ffs_dmabuf_detach()
> > > - Document uapi struct usb_ffs_dmabuf_transfer_req and IOCTLs
> > > ---
> > >  drivers/usb/gadget/function/f_fs.c  | 417
> > > ++++++++++++++++++++++++++++
> > >  include/uapi/linux/usb/functionfs.h |  41 +++
> > >  2 files changed, 458 insertions(+)
> > > 
> > > diff --git a/drivers/usb/gadget/function/f_fs.c
> > > b/drivers/usb/gadget/function/f_fs.c
> > > index ed2a6d5fcef7..9df1f5abb0d4 100644
> > > --- a/drivers/usb/gadget/function/f_fs.c
> > > +++ b/drivers/usb/gadget/function/f_fs.c
> > > @@ -15,6 +15,9 @@
> > >  /* #define VERBOSE_DEBUG */
> > >  
> > >  #include <linux/blkdev.h>
> > > +#include <linux/dma-buf.h>
> > > +#include <linux/dma-fence.h>
> > > +#include <linux/dma-resv.h>
> > >  #include <linux/pagemap.h>
> > >  #include <linux/export.h>
> > >  #include <linux/fs_parser.h>
> > > @@ -43,6 +46,8 @@
> > >  
> > >  #define FUNCTIONFS_MAGIC	0xa647361 /* Chosen by a honest
> > > dice roll ;) */
> > >  
> > > +MODULE_IMPORT_NS(DMA_BUF);
> > > +
> > >  /* Reference counter handling */
> > >  static void ffs_data_get(struct ffs_data *ffs);
> > >  static void ffs_data_put(struct ffs_data *ffs);
> > > @@ -124,6 +129,21 @@ struct ffs_ep {
> > >  	u8				num;
> > >  };
> > >  
> > > +struct ffs_dmabuf_priv {
> > > +	struct list_head entry;
> > > +	struct kref ref;
> > > +	struct dma_buf_attachment *attach;
> > > +	spinlock_t lock;
> > > +	u64 context;
> > > +};
> > > +
> > > +struct ffs_dma_fence {
> > > +	struct dma_fence base;
> > > +	struct ffs_dmabuf_priv *priv;
> > > +	struct sg_table *sgt;
> > > +	enum dma_data_direction dir;
> > > +};
> > > +
> > >  struct ffs_epfile {
> > >  	/* Protects ep->ep and ep->req. */
> > >  	struct mutex			mutex;
> > > @@ -197,6 +217,8 @@ struct ffs_epfile {
> > >  	unsigned char			isoc;	/* P: ffs-
> > > >eps_lock */
> > >  
> > >  	unsigned char			_pad;
> > > +
> > > +	struct list_head		dmabufs;
> > >  };
> > >  
> > >  struct ffs_buffer {
> > > @@ -1271,10 +1293,44 @@ static ssize_t ffs_epfile_read_iter(struct
> > > kiocb *kiocb, struct iov_iter *to)
> > >  	return res;
> > >  }
> > >  
> > > +static void ffs_dmabuf_release(struct kref *ref)
> > > +{
> > > +	struct ffs_dmabuf_priv *priv = container_of(ref, struct
> > > ffs_dmabuf_priv, ref);
> > > +	struct dma_buf_attachment *attach = priv->attach;
> > > +	struct dma_buf *dmabuf = attach->dmabuf;
> > > +
> > > +	pr_debug("FFS DMABUF release\n");
> > > +	dma_buf_detach(attach->dmabuf, attach);
> > > +	dma_buf_put(dmabuf);
> > > +
> > > +	list_del(&priv->entry);
> > 
> > I didn't find any locking for this list here.
> 
> Yeah. I'll add some.
> 
> > > +	kfree(priv);
> > > +}
> > > +
> > > +static void ffs_dmabuf_get(struct dma_buf_attachment *attach)
> > > +{
> > > +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> > > +
> > > +	kref_get(&priv->ref);
> > > +}
> > > +
> > > +static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
> > > +{
> > > +	struct ffs_dmabuf_priv *priv = attach->importer_priv;
> > > +
> > > +	kref_put(&priv->ref, ffs_dmabuf_release);
> > > +}
> > > +
> > >  static int
> > >  ffs_epfile_release(struct inode *inode, struct file *file)
> > >  {
> > >  	struct ffs_epfile *epfile = inode->i_private;
> > > +	struct ffs_dmabuf_priv *priv, *tmp;
> > > +
> > > +	/* Close all attached DMABUFs */
> > > +	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs,
> > > entry) {
> > > +		ffs_dmabuf_put(priv->attach);
> > > +	}
> > >  
> > >  	__ffs_epfile_read_buffer_free(epfile);
> > >  	ffs_data_closed(epfile->ffs);
> > > @@ -1282,6 +1338,328 @@ ffs_epfile_release(struct inode *inode,
> > > struct file *file)
> > >  	return 0;
> > >  }
> > >  
> > > +static void ffs_dmabuf_signal_done(struct ffs_dma_fence
> > > *dma_fence, int ret)
> > > +{
> > > +	struct ffs_dmabuf_priv *priv = dma_fence->priv;
> > > +	struct dma_fence *fence = &dma_fence->base;
> > > +
> > > +	dma_fence_get(fence);
> > > +	fence->error = ret;
> > > +	dma_fence_signal(fence);
> > > +
> > > +	dma_buf_unmap_attachment(priv->attach, dma_fence->sgt,
> > > dma_fence->dir);
> > > +	dma_fence_put(fence);
> > > +	ffs_dmabuf_put(priv->attach);
> > 
> > So this can in theory take the dma_resv lock, and if the usb
> > completion
> > isn't an unlimited worker this could hold up completion of future
> > dma_fence, resulting in a deadlock.
> > 
> > Needs to be checked how usb works, and if stalling indefinitely in
> > the
> > io_complete callback can hold up the usb stack you need to:
> > 
> > - drop a dma_fence_begin/end_signalling annotations in here
> > - pull out the unref stuff into a separate preallocated worker (or at
> >   least the final unrefs for ffs_dma_buf).
> 
> Only ffs_dmabuf_put() can attempt to take the dma_resv and would have
> to be in a worker, right? Everything else would be inside the
> dma_fence_begin/end_signalling() annotations?

Yup. Also I noticed that unlike the iio patches you don't have the
dma_buf_unmap here in the completion path (or I'm blind?), which helps a
lot with avoiding trouble.

> > > +}
> > > +
> > > +static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
> > > +					  struct usb_request *req)
> > > +{
> > > +	pr_debug("FFS: DMABUF transfer complete, status=%d\n",
> > > req->status);
> > > +	ffs_dmabuf_signal_done(req->context, req->status);
> > > +	usb_ep_free_request(ep, req);
> > > +}
> > > +
> > > +static const char *ffs_dmabuf_get_driver_name(struct dma_fence
> > > *fence)
> > > +{
> > > +	return "functionfs";
> > > +}
> > > +
> > > +static const char *ffs_dmabuf_get_timeline_name(struct dma_fence
> > > *fence)
> > > +{
> > > +	return "";
> > > +}
> > > +
> > > +static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> > > +{
> > > +	struct ffs_dma_fence *dma_fence =
> > > +		container_of(fence, struct ffs_dma_fence, base);
> > > +
> > > +	kfree(dma_fence);
> > > +}
> > > +
> > > +static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
> > > +	.get_driver_name	= ffs_dmabuf_get_driver_name,
> > > +	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
> > > +	.release		= ffs_dmabuf_fence_release,
> > > +};
> > > +
> > > +static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool
> > > nonblock)
> > > +{
> > > +	int ret;
> > > +
> > > +	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
> > > +	if (ret) {
> > > +		if (ret != -EDEADLK)
> > > +			return ret;
> > > +		if (nonblock)
> > > +			return -EBUSY;
> > > +
> > > +		ret = dma_resv_lock_slow_interruptible(dmabuf-
> > > >resv, NULL);
> > 
> > This is overkill, without a reservation context you will never get
> > -EDEADLK and so never have to do slowpath locking. So just dead code.
> > 
> > If you want to check, build with CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> 
> Ok.
> 
> > 
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static struct dma_buf_attachment *
> > > +ffs_dmabuf_find_attachment(struct device *dev, struct dma_buf
> > > *dmabuf,
> > > +			   bool nonblock)
> > > +{
> > > +	struct dma_buf_attachment *elm, *attach = NULL;
> > > +	int ret;
> > > +
> > > +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> > > +	if (ret)
> > > +		return ERR_PTR(ret);
> > > +
> > > +	list_for_each_entry(elm, &dmabuf->attachments, node) {
> > > +		if (elm->dev == dev) {
> > > +			attach = elm;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (attach)
> > > +		ffs_dmabuf_get(elm);
> > 
> > This needs a kref_get_unless_zero or you can race with the final
> > free.
> > 
> > I'm not super keen that usb-gadget is noodling around in the
> > attachment
> > list like this, your own lookup structure (you have the dma-buf list
> > already anyway to keep track of all attachments) would be much nicer.
> > But
> > the get_unless_zero I think is mandatory here for this weak
> > reference.
> 
> Christian suggested to move that to a dma_buf function.
> Alternatively I can browse my epfile->dmabufs list, sure - that won't
> be hard to do. That's probably a better idea too.

The trouble with the dma_buf function is that you need to have the
kref_get_unless_zero on the kref in your private thing _within_ the
dma_resv_lock critical section. Otherwise this lookup function and a
concurrent final kref_put might race. So that helper function would need
to require the caller to hold dma_resv_lock already.

It's that kind of locking context leaking across subsystems I don't really
like much. It's not buggy, but it is a bit much leaky abstraction.

> > > +
> > > +	dma_resv_unlock(dmabuf->resv);
> > > +
> > > +	return attach ?: ERR_PTR(-EPERM);
> > > +}
> > > +
> > > +static int ffs_dmabuf_attach(struct file *file, int fd)
> > > +{
> > > +	struct ffs_epfile *epfile = file->private_data;
> > > +	struct usb_gadget *gadget = epfile->ffs->gadget;
> > > +	struct dma_buf_attachment *attach;
> > > +	struct ffs_dmabuf_priv *priv;
> > > +	struct dma_buf *dmabuf;
> > > +	int err;
> > > +
> > > +	if (!gadget || !gadget->sg_supported)
> > > +		return -EPERM;
> > > +
> > > +	dmabuf = dma_buf_get(fd);
> > > +	if (IS_ERR(dmabuf))
> > > +		return PTR_ERR(dmabuf);
> > > +
> > > +	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
> > > +	if (IS_ERR(attach)) {
> > > +		err = PTR_ERR(attach);
> > > +		goto err_dmabuf_put;
> > > +	}
> > > +
> > > +	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
> > > +	if (!priv) {
> > > +		err = -ENOMEM;
> > > +		goto err_dmabuf_detach;
> > > +	}
> > > +
> > > +	attach->importer_priv = priv;
> > > +
> > > +	priv->attach = attach;
> > > +	spin_lock_init(&priv->lock);
> > > +	kref_init(&priv->ref);
> > > +	priv->context = dma_fence_context_alloc(1);
> > 
> > Just to check: usb gagdet gurantees that all requests on an ep are
> > ordered?
> 
> The documentation of usb_ep_queue() states that the transfer requests
> are processed in FIFO order, yes.

Might be good to document this in the comment message, or if you feel
like, in the seqno generation for each dma_fence.
> 
> > 
> > > +
> > > +	list_add(&priv->entry, &epfile->dmabufs);
> > > +
> > > +	return 0;
> > > +
> > > +err_dmabuf_detach:
> > > +	dma_buf_detach(dmabuf, attach);
> > > +err_dmabuf_put:
> > > +	dma_buf_put(dmabuf);
> > > +
> > > +	return err;
> > > +}
> > > +
> > > +static int ffs_dmabuf_detach(struct file *file, int fd)
> > > +{
> > > +	struct ffs_epfile *epfile = file->private_data;
> > > +	struct usb_gadget *gadget = epfile->ffs->gadget;
> > > +	bool nonblock = file->f_flags & O_NONBLOCK;
> > > +	struct dma_buf_attachment *attach;
> > > +	struct dma_buf *dmabuf;
> > > +	int ret = 0;
> > > +
> > > +	dmabuf = dma_buf_get(fd);
> > > +	if (IS_ERR(dmabuf))
> > > +		return PTR_ERR(dmabuf);
> > > +
> > > +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> > > +					    dmabuf, nonblock);
> > > +	if (IS_ERR(attach)) {
> > > +		ret = PTR_ERR(attach);
> > > +		goto out_dmabuf_put;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Unref twice to release the reference obtained with
> > > +	 * ffs_dmabuf_find_attachment() above, and the one
> > > obtained in
> > > +	 * ffs_dmabuf_attach().
> > > +	 */
> > > +	ffs_dmabuf_put(attach);
> > 
> > This looks strange, what's stopping userspace from calling detach
> > multiple
> > times while a transfer is pending (so that the destruction is
> > delayed)?
> > That smells like a refcount underflow.
> 
> My idea was that the second ffs_dmabuf_put() would trigger
> ffs_dmabuf_release(), which calls the list_del(); so a second call to
> ffs_dmabuf_detach() would fail to find the attachment.
> 
> Indeed, if there's an on-going transfer, the refcount is higher, and
> this breaks miserably.

Yup that was the scenario I was thinking of.

> Christian pointed out that it breaks if ffs_dmabuf_detach() is called
> concurrently, but this is even worse :)

You need the 2nd detach ioctl call to actually make things underrun, but I
guess it also means that with just one you destroy the mapping/attachment
before the hw is finished. Which I missed :-)

> > You probably need to tie the refcounts you acquire in
> > ffs_dmabuf_attach to
> > epfile->dmabufs 1:1 to make sure there's no way userspace can pull
> > you
> > over the table. This is also the reason why I looked for the locking
> > of
> > that list, and didn't find it.
> 
> I'll change the code to atomically get the dma_buf_attachment and
> remove it from the list.
> 
> > 
> > > +	ffs_dmabuf_put(attach);
> > > +
> > > +out_dmabuf_put:
> > > +	dma_buf_put(dmabuf);
> > > +	return ret;
> > > +}
> > > +
> > > +static int ffs_dmabuf_transfer(struct file *file,
> > > +			       const struct
> > > usb_ffs_dmabuf_transfer_req *req)
> > > +{
> > > +	bool dma_to_ram, nonblock = file->f_flags & O_NONBLOCK;
> > > +	struct ffs_epfile *epfile = file->private_data;
> > > +	struct usb_gadget *gadget = epfile->ffs->gadget;
> > > +	struct dma_buf_attachment *attach;
> > > +	struct ffs_dmabuf_priv *priv;
> > > +	enum dma_data_direction dir;
> > > +	struct ffs_dma_fence *fence;
> > > +	struct usb_request *usb_req;
> > > +	struct sg_table *sg_table;
> > > +	struct dma_buf *dmabuf;
> > > +	struct ffs_ep *ep;
> > > +	int ret;
> > > +
> > > +	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
> > > +		return -EINVAL;
> > > +
> > > +	dmabuf = dma_buf_get(req->fd);
> > > +	if (IS_ERR(dmabuf))
> > > +		return PTR_ERR(dmabuf);
> > > +
> > > +	if (req->length > dmabuf->size || req->length == 0) {
> > > +		ret = -EINVAL;
> > > +		goto err_dmabuf_put;
> > > +	}
> > > +
> > > +	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
> > > +					    dmabuf, nonblock);
> > > +	if (IS_ERR(attach)) {
> > > +		ret = PTR_ERR(attach);
> > > +		goto err_dmabuf_put;
> > > +	}
> > > +
> > > +	priv = attach->importer_priv;
> > > +
> > > +	if (epfile->in)
> > > +		dir = DMA_FROM_DEVICE;
> > > +	else
> > > +		dir = DMA_TO_DEVICE;
> > > +
> > > +	sg_table = dma_buf_map_attachment(attach, dir);
> > > +	if (IS_ERR(sg_table)) {
> > > +		ret = PTR_ERR(sg_table);
> > > +		goto err_attachment_put;
> > > +	}
> > > +
> > > +	ep = ffs_epfile_wait_ep(file);
> > > +	if (IS_ERR(ep)) {
> > > +		ret = PTR_ERR(ep);
> > > +		goto err_unmap_attachment;
> > > +	}
> > > +
> > > +	ret = ffs_dma_resv_lock(dmabuf, nonblock);
> > > +	if (ret)
> > > +		goto err_unmap_attachment;
> > > +
> > > +	/* Make sure we don't have writers */
> > > +	if (!dma_resv_test_signaled(dmabuf->resv,
> > > DMA_RESV_USAGE_WRITE)) {
> > > +		pr_debug("FFS WRITE fence is not signaled\n");
> > > +		ret = -EBUSY;
> > > +		goto err_resv_unlock;
> > > +	}
> > > +
> > > +	dma_to_ram = dir == DMA_FROM_DEVICE;
> > > +
> > > +	/* If we're writing to the DMABUF, make sure we don't have
> > > readers */
> > > +	if (dma_to_ram &&
> > > +	    !dma_resv_test_signaled(dmabuf->resv,
> > > DMA_RESV_USAGE_READ)) {
> > > +		pr_debug("FFS READ fence is not signaled\n");
> > > +		ret = -EBUSY;
> > > +		goto err_resv_unlock;
> > > +	}
> > > +
> > > +	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> > > +	if (ret)
> > > +		goto err_resv_unlock;
> > > +
> > > +	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
> > > +	if (!fence) {
> > > +		ret = -ENOMEM;
> > > +		goto err_resv_unlock;
> > > +	}
> > > +
> > > +	fence->sgt = sg_table;
> > > +	fence->dir = dir;
> > > +	fence->priv = priv;
> > > +
> > > +	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
> > > +		       &priv->lock, priv->context, 0);
> > 
> > You need a real seqno here or things break with fence merging. Or
> > alternatively unordered dma_fence (which are implemented by
> > allocating a
> > new context for each fence, maybe we should change that eventually
> > ...).
> 
> Understood.
> 
> > > +
> > > +	spin_lock_irq(&epfile->ffs->eps_lock);
> > > +
> > > +	/* In the meantime, endpoint got disabled or changed. */
> > > +	if (epfile->ep != ep) {
> > > +		ret = -ESHUTDOWN;
> > > +		goto err_fence_put;
> > > +	}
> > > +
> > > +	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
> > > +	if (!usb_req) {
> > > +		ret = -ENOMEM;
> > > +		goto err_fence_put;
> > > +	}
> > > +
> > > +	dma_resv_add_fence(dmabuf->resv, &fence->base,
> > > +			   dma_resv_usage_rw(dma_to_ram));
> > > +	dma_resv_unlock(dmabuf->resv);
> > > +
> > > +	/* Now that the dma_fence is in place, queue the transfer.
> > > */
> > > +
> > > +	usb_req->length = req->length;
> > > +	usb_req->buf = NULL;
> > > +	usb_req->sg = sg_table->sgl;
> > > +	usb_req->num_sgs = sg_nents_for_len(sg_table->sgl, req-
> > > >length);
> > > +	usb_req->sg_was_mapped = true;
> > > +	usb_req->context  = fence;
> > > +	usb_req->complete = ffs_epfile_dmabuf_io_complete;
> > > +
> > > +	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
> > > +	if (ret) {
> > > +		usb_ep_free_request(ep->ep, usb_req);
> > > +
> > > +		spin_unlock_irq(&epfile->ffs->eps_lock);
> > > +
> > > +		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
> > > +		ffs_dmabuf_signal_done(fence, ret);
> > > +		goto out_dma_buf_put;
> > > +	}
> > > +
> > > +	spin_unlock_irq(&epfile->ffs->eps_lock);
> > > +
> > > +out_dma_buf_put:
> > > +	dma_buf_put(dmabuf);
> > > +
> > > +	return ret;
> > > +
> > > +err_fence_put:
> > > +	spin_unlock_irq(&epfile->ffs->eps_lock);
> > > +	dma_fence_put(&fence->base);
> > > +err_resv_unlock:
> > > +	dma_resv_unlock(dmabuf->resv);
> > > +err_unmap_attachment:
> > > +	dma_buf_unmap_attachment(attach, sg_table, dir);
> > > +err_attachment_put:
> > > +	ffs_dmabuf_put(attach);
> > > +err_dmabuf_put:
> > > +	dma_buf_put(dmabuf);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static long ffs_epfile_ioctl(struct file *file, unsigned code,
> > >  			     unsigned long value)
> > >  {
> > > @@ -1292,6 +1670,44 @@ static long ffs_epfile_ioctl(struct file
> > > *file, unsigned code,
> > >  	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
> > >  		return -ENODEV;
> > >  
> > > +	switch (code) {
> > > +	case FUNCTIONFS_DMABUF_ATTACH:
> > > +	{
> > > +		int fd;
> > > +
> > > +		if (copy_from_user(&fd, (void __user *)value,
> > > sizeof(fd))) {
> > > +			ret = -EFAULT;
> > > +			break;
> > > +		}
> > > +
> > > +		return ffs_dmabuf_attach(file, fd);
> > > +	}
> > > +	case FUNCTIONFS_DMABUF_DETACH:
> > > +	{
> > > +		int fd;
> > > +
> > > +		if (copy_from_user(&fd, (void __user *)value,
> > > sizeof(fd))) {
> > > +			ret = -EFAULT;
> > > +			break;
> > > +		}
> > > +
> > > +		return ffs_dmabuf_detach(file, fd);
> > > +	}
> > > +	case FUNCTIONFS_DMABUF_TRANSFER:
> > > +	{
> > > +		struct usb_ffs_dmabuf_transfer_req req;
> > > +
> > > +		if (copy_from_user(&req, (void __user *)value,
> > > sizeof(req))) {
> > > +			ret = -EFAULT;
> > > +			break;
> > > +		}
> > > +
> > > +		return ffs_dmabuf_transfer(file, &req);
> > > +	}
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > >  	/* Wait for endpoint to be enabled */
> > >  	ep = ffs_epfile_wait_ep(file);
> > >  	if (IS_ERR(ep))
> > > @@ -1869,6 +2285,7 @@ static int ffs_epfiles_create(struct ffs_data
> > > *ffs)
> > >  	for (i = 1; i <= count; ++i, ++epfile) {
> > >  		epfile->ffs = ffs;
> > >  		mutex_init(&epfile->mutex);
> > > +		INIT_LIST_HEAD(&epfile->dmabufs);
> > >  		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
> > >  			sprintf(epfile->name, "ep%02x", ffs-
> > > >eps_addrmap[i]);
> > >  		else
> > > diff --git a/include/uapi/linux/usb/functionfs.h
> > > b/include/uapi/linux/usb/functionfs.h
> > > index 078098e73fd3..9f88de9c3d66 100644
> > > --- a/include/uapi/linux/usb/functionfs.h
> > > +++ b/include/uapi/linux/usb/functionfs.h
> > > @@ -86,6 +86,22 @@ struct usb_ext_prop_desc {
> > >  	__le16	wPropertyNameLength;
> > >  } __attribute__((packed));
> > >  
> > > +/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
> > > +#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
> > > +
> > > +/**
> > > + * struct usb_ffs_dmabuf_transfer_req - Transfer request for a
> > > DMABUF object
> > > + * @fd:		file descriptor of the DMABUF object
> > > + * @flags:	one or more USB_FFS_DMABUF_TRANSFER_* flags
> > > + * @length:	number of bytes used in this DMABUF for the data
> > > transfer.
> > > + *		Should generally be set to the DMABUF's size.
> > > + */
> > > +struct usb_ffs_dmabuf_transfer_req {
> > > +	int fd;
> > > +	__u32 flags;
> > > +	__u64 length;
> > > +} __attribute__((packed));
> > > +
> > >  #ifndef __KERNEL__
> > >  
> > >  /*
> > > @@ -290,6 +306,31 @@ struct usb_functionfs_event {
> > >  #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
> > >  					     struct
> > > usb_endpoint_descriptor)
> > >  
> > > +/*
> > > + * Attach the DMABUF object, identified by its file descriptor, to
> > > the
> > > + * data endpoint. Returns zero on success, and a negative errno
> > > value
> > > + * on error.
> > > + */
> > > +#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
> > > +
> > >  
> > > +/*
> > > + * Detach the given DMABUF object, identified by its file
> > > descriptor,
> > > + * from the data endpoint. Returns zero on success, and a negative
> > > + * errno value on error. Note that closing the endpoint's file
> > > + * descriptor will automatically detach all attached DMABUFs.
> > > + */
> > > +#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
> > > +
> > > +/*
> > > + * Enqueue the previously attached DMABUF to the transfer queue.
> > > + * The argument is a structure that packs the DMABUF's file
> > > descriptor,
> > > + * the size in bytes to transfer (which should generally
> > > correspond to
> > > + * the size of the DMABUF), and a 'flags' field which is unused
> > > + * for now. Returns zero on success, and a negative errno value on
> > > + * error.
> > > + */
> > > +#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
> > > +					     struct
> > > usb_ffs_dmabuf_transfer_req)
> > >  
> > >  #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
> > 
> > Only things I've found are (I think at least) bugs in the usb gadget
> > logic, not directly in how dma-buf/fence is used. The only thing I've
> > noticed is the lack of actual dma_fence seqno (which I think
> > Christian
> > already pointed out in an already review, looking at archives at
> > least).
> > With that addressed:
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > Cheers, Sima
> 
> Thanks for the review!

btw if you address all the locking/lifetime issues I guess you can upgrade
to r-b: me on the next version.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
