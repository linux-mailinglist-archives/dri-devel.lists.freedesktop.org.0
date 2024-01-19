Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D554832B29
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 15:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332C510EA34;
	Fri, 19 Jan 2024 14:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4275610E0EA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 14:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705673654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEEYiuLeIQ4/+QA+DhT4nVTv5/edVx50oVzMxKrH1w4=;
 b=QLAS56wgZGcnmqpfLGkhpK2KY6pPcsu9xTYj6Ew50+hPNTxlR3ICIKcjyYllFnQrPQHFHj
 Rck42IjixnGA44D199A8PCaacR7czLUsqGSRtUIwThMaBwfToU4WaT1N7G6WfDPlNSt9gs
 DafXR9L6AJP3uMdMCBmlY18Ml7FqGzg=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 5/6] usb: gadget: functionfs: Add DMABUF import interface
Date: Fri, 19 Jan 2024 15:14:01 +0100
Message-ID: <20240119141402.44262-6-paul@crapouillou.net>
In-Reply-To: <20240119141402.44262-1-paul@crapouillou.net>
References: <20240119141402.44262-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch introduces three new ioctls. They all should be called on a
data endpoint (ie. not ep0). They are:

- FUNCTIONFS_DMABUF_ATTACH, which takes the file descriptor of a DMABUF
  object to attach to the endpoint.

- FUNCTIONFS_DMABUF_DETACH, which takes the file descriptor of the
  DMABUF to detach from the endpoint. Note that closing the endpoint's
  file descriptor will automatically detach all attached DMABUFs.

- FUNCTIONFS_DMABUF_TRANSFER, which requests a data transfer from / to
  the given DMABUF. Its argument is a structure that packs the DMABUF's
  file descriptor, the size in bytes to transfer (which should generally
  be set to the size of the DMABUF), and a 'flags' field which is unused
  for now.
  Before this ioctl can be used, the related DMABUF must be attached
  with FUNCTIONFS_DMABUF_ATTACH.

These three ioctls enable the FunctionFS code to transfer data between
the USB stack and a DMABUF object, which can be provided by a driver
from a completely different subsystem, in a zero-copy fashion.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Christian König <christian.koenig@amd.com>

---
v2:
- Make ffs_dma_resv_lock() static
- Add MODULE_IMPORT_NS(DMA_BUF);
- The attach/detach functions are now performed without locking the
  eps_lock spinlock. The transfer function starts with the spinlock
  unlocked, then locks it before allocating and queueing the USB
  transfer.

v3:
- Inline to_ffs_dma_fence() which was called only once.
- Simplify ffs_dma_resv_lock()
- Add comment explaining why we unref twice in ffs_dmabuf_detach()
- Document uapi struct usb_ffs_dmabuf_transfer_req and IOCTLs

v4:
- Protect the DMABUF list with a mutex
- Use incremental sequence number for the dma_fences
- Unref attachments and DMABUFs in workers
- Remove dead code in ffs_dma_resv_lock()
- Fix non-block actually blocking
- Use dma_fence_begin/end_signalling()
- Add comment about cache-management and dma_buf_unmap_attachment()
- Make sure dma_buf_map_attachment() is called with the dma-resv locked

v5:
- Cache the dma_buf_attachment while the DMABUF is attached.
- Use dma_buf_begin/end_access() to ensure that the DMABUF data will be
  coherent to the hardware.
- Remove comment about cache-management and dma_buf_unmap_attachment(),
  since we now use dma_buf_begin/end_access().
- Added Christian's ACK
- Select DMA_SHARED_BUFFER in Kconfig entry
---
 drivers/usb/gadget/Kconfig          |   1 +
 drivers/usb/gadget/function/f_fs.c  | 456 ++++++++++++++++++++++++++++
 include/uapi/linux/usb/functionfs.h |  41 +++
 3 files changed, 498 insertions(+)

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index b3592bcb0f96..566ff0b1282a 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -190,6 +190,7 @@ config USB_F_MASS_STORAGE
 	tristate
 
 config USB_F_FS
+	select DMA_SHARED_BUFFER
 	tristate
 
 config USB_F_UAC1
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index ed2a6d5fcef7..82cc449a4d7e 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -15,6 +15,9 @@
 /* #define VERBOSE_DEBUG */
 
 #include <linux/blkdev.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
 #include <linux/pagemap.h>
 #include <linux/export.h>
 #include <linux/fs_parser.h>
@@ -43,6 +46,8 @@
 
 #define FUNCTIONFS_MAGIC	0xa647361 /* Chosen by a honest dice roll ;) */
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 /* Reference counter handling */
 static void ffs_data_get(struct ffs_data *ffs);
 static void ffs_data_put(struct ffs_data *ffs);
@@ -124,6 +129,23 @@ struct ffs_ep {
 	u8				num;
 };
 
+struct ffs_dmabuf_priv {
+	struct list_head entry;
+	struct kref ref;
+	struct ffs_data *ffs;
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	enum dma_data_direction dir;
+	spinlock_t lock;
+	u64 context;
+};
+
+struct ffs_dma_fence {
+	struct dma_fence base;
+	struct ffs_dmabuf_priv *priv;
+	struct work_struct work;
+};
+
 struct ffs_epfile {
 	/* Protects ep->ep and ep->req. */
 	struct mutex			mutex;
@@ -197,6 +219,11 @@ struct ffs_epfile {
 	unsigned char			isoc;	/* P: ffs->eps_lock */
 
 	unsigned char			_pad;
+
+	/* Protects dmabufs */
+	struct mutex			dmabufs_mutex;
+	struct list_head		dmabufs; /* P: dmabufs_mutex */
+	atomic_t			seqno;
 };
 
 struct ffs_buffer {
@@ -1271,10 +1298,51 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	return res;
 }
 
+static void ffs_dmabuf_release(struct kref *ref)
+{
+	struct ffs_dmabuf_priv *priv = container_of(ref, struct ffs_dmabuf_priv, ref);
+	struct dma_buf_attachment *attach = priv->attach;
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	pr_debug("FFS DMABUF release\n");
+	dma_resv_lock(dmabuf->resv, NULL);
+	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
+	dma_resv_unlock(dmabuf->resv);
+
+	dma_buf_detach(attach->dmabuf, attach);
+	dma_buf_put(dmabuf);
+	kfree(priv);
+}
+
+static void ffs_dmabuf_get(struct dma_buf_attachment *attach)
+{
+	struct ffs_dmabuf_priv *priv = attach->importer_priv;
+
+	kref_get(&priv->ref);
+}
+
+static void ffs_dmabuf_put(struct dma_buf_attachment *attach)
+{
+	struct ffs_dmabuf_priv *priv = attach->importer_priv;
+
+	kref_put(&priv->ref, ffs_dmabuf_release);
+}
+
 static int
 ffs_epfile_release(struct inode *inode, struct file *file)
 {
 	struct ffs_epfile *epfile = inode->i_private;
+	struct ffs_dmabuf_priv *priv, *tmp;
+
+	mutex_lock(&epfile->dmabufs_mutex);
+
+	/* Close all attached DMABUFs */
+	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
+		list_del(&priv->entry);
+		ffs_dmabuf_put(priv->attach);
+	}
+
+	mutex_unlock(&epfile->dmabufs_mutex);
 
 	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
@@ -1282,6 +1350,354 @@ ffs_epfile_release(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static void ffs_dmabuf_unmap_work(struct work_struct *work)
+{
+	struct ffs_dma_fence *dma_fence =
+		container_of(work, struct ffs_dma_fence, work);
+	struct ffs_dmabuf_priv *priv = dma_fence->priv;
+	struct dma_buf_attachment *attach = priv->attach;
+	struct dma_fence *fence = &dma_fence->base;
+
+	ffs_dmabuf_put(attach);
+	dma_fence_put(fence);
+}
+
+static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
+{
+	struct ffs_dmabuf_priv *priv = dma_fence->priv;
+	struct dma_fence *fence = &dma_fence->base;
+	bool cookie = dma_fence_begin_signalling();
+
+	dma_fence_get(fence);
+	dma_buf_end_access(priv->attach, priv->sgt, priv->dir);
+
+	fence->error = ret;
+	dma_fence_signal(fence);
+	dma_fence_end_signalling(cookie);
+
+	/*
+	 * The fence will be unref'd in ffs_dmabuf_unmap_work.
+	 * It can't be done here, as the unref functions might try to lock
+	 * the resv object, which would deadlock.
+	 */
+	INIT_WORK(&dma_fence->work, ffs_dmabuf_unmap_work);
+	queue_work(priv->ffs->io_completion_wq, &dma_fence->work);
+}
+
+static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
+					  struct usb_request *req)
+{
+	pr_debug("FFS: DMABUF transfer complete, status=%d\n", req->status);
+	ffs_dmabuf_signal_done(req->context, req->status);
+	usb_ep_free_request(ep, req);
+}
+
+static const char *ffs_dmabuf_get_driver_name(struct dma_fence *fence)
+{
+	return "functionfs";
+}
+
+static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
+{
+	return "";
+}
+
+static void ffs_dmabuf_fence_release(struct dma_fence *fence)
+{
+	struct ffs_dma_fence *dma_fence =
+		container_of(fence, struct ffs_dma_fence, base);
+
+	kfree(dma_fence);
+}
+
+static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
+	.get_driver_name	= ffs_dmabuf_get_driver_name,
+	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
+	.release		= ffs_dmabuf_fence_release,
+};
+
+static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
+{
+	if (!nonblock)
+		return dma_resv_lock_interruptible(dmabuf->resv, NULL);
+
+	if (!dma_resv_trylock(dmabuf->resv))
+		return -EBUSY;
+
+	return 0;
+}
+
+static struct dma_buf_attachment *
+ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dmabuf)
+{
+	struct device *dev = epfile->ffs->gadget->dev.parent;
+	struct dma_buf_attachment *attach = NULL;
+	struct ffs_dmabuf_priv *priv;
+
+	mutex_lock(&epfile->dmabufs_mutex);
+
+	list_for_each_entry(priv, &epfile->dmabufs, entry) {
+		if (priv->attach->dev == dev
+		    && priv->attach->dmabuf == dmabuf) {
+			attach = priv->attach;
+			break;
+		}
+	}
+
+	if (attach)
+		ffs_dmabuf_get(attach);
+
+	mutex_unlock(&epfile->dmabufs_mutex);
+
+	return attach ?: ERR_PTR(-EPERM);
+}
+
+static int ffs_dmabuf_attach(struct file *file, int fd)
+{
+	bool nonblock = file->f_flags & O_NONBLOCK;
+	struct ffs_epfile *epfile = file->private_data;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
+	struct dma_buf_attachment *attach;
+	struct ffs_dmabuf_priv *priv;
+	enum dma_data_direction dir;
+	struct sg_table *sg_table;
+	struct dma_buf *dmabuf;
+	int err;
+
+	if (!gadget || !gadget->sg_supported)
+		return -EPERM;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	attach = dma_buf_attach(dmabuf, gadget->dev.parent);
+	if (IS_ERR(attach)) {
+		err = PTR_ERR(attach);
+		goto err_dmabuf_put;
+	}
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		err = -ENOMEM;
+		goto err_dmabuf_detach;
+	}
+
+	dir = epfile->in ? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	err = ffs_dma_resv_lock(dmabuf, nonblock);
+	if (err)
+		goto err_free_priv;
+
+	sg_table = dma_buf_map_attachment(attach, dir);
+	dma_resv_unlock(dmabuf->resv);
+
+	if (IS_ERR(sg_table)) {
+		err = PTR_ERR(sg_table);
+		goto err_free_priv;
+	}
+
+	attach->importer_priv = priv;
+
+	priv->sgt = sg_table;
+	priv->dir = dir;
+	priv->ffs = epfile->ffs;
+	priv->attach = attach;
+	spin_lock_init(&priv->lock);
+	kref_init(&priv->ref);
+	priv->context = dma_fence_context_alloc(1);
+
+	mutex_lock(&epfile->dmabufs_mutex);
+	list_add(&priv->entry, &epfile->dmabufs);
+	mutex_unlock(&epfile->dmabufs_mutex);
+
+	return 0;
+
+err_free_priv:
+	kfree(priv);
+err_dmabuf_detach:
+	dma_buf_detach(dmabuf, attach);
+err_dmabuf_put:
+	dma_buf_put(dmabuf);
+
+	return err;
+}
+
+static int ffs_dmabuf_detach(struct file *file, int fd)
+{
+	struct ffs_epfile *epfile = file->private_data;
+	struct device *dev = epfile->ffs->gadget->dev.parent;
+	struct ffs_dmabuf_priv *priv;
+	struct dma_buf *dmabuf;
+	int ret = -EPERM;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	mutex_lock(&epfile->dmabufs_mutex);
+
+	list_for_each_entry(priv, &epfile->dmabufs, entry) {
+		if (priv->attach->dev == dev
+		    && priv->attach->dmabuf == dmabuf) {
+			list_del(&priv->entry);
+
+			/* Unref the reference from ffs_dmabuf_attach() */
+			ffs_dmabuf_put(priv->attach);
+			ret = 0;
+			break;
+		}
+	}
+
+	mutex_unlock(&epfile->dmabufs_mutex);
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
+static int ffs_dmabuf_transfer(struct file *file,
+			       const struct usb_ffs_dmabuf_transfer_req *req)
+{
+	bool nonblock = file->f_flags & O_NONBLOCK;
+	struct ffs_epfile *epfile = file->private_data;
+	struct dma_buf_attachment *attach;
+	struct ffs_dmabuf_priv *priv;
+	struct ffs_dma_fence *fence;
+	struct usb_request *usb_req;
+	struct dma_buf *dmabuf;
+	struct ffs_ep *ep;
+	bool cookie;
+	u32 seqno;
+	int ret;
+
+	if (req->flags & ~USB_FFS_DMABUF_TRANSFER_MASK)
+		return -EINVAL;
+
+	dmabuf = dma_buf_get(req->fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	if (req->length > dmabuf->size || req->length == 0) {
+		ret = -EINVAL;
+		goto err_dmabuf_put;
+	}
+
+	attach = ffs_dmabuf_find_attachment(epfile, dmabuf);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto err_dmabuf_put;
+	}
+
+	priv = attach->importer_priv;
+
+	ep = ffs_epfile_wait_ep(file);
+	if (IS_ERR(ep)) {
+		ret = PTR_ERR(ep);
+		goto err_attachment_put;
+	}
+
+	ret = dma_buf_begin_access(attach, priv->sgt, priv->dir);
+	if (ret)
+		goto err_attachment_put;
+
+	ret = ffs_dma_resv_lock(dmabuf, nonblock);
+	if (ret)
+		goto err_end_access;
+
+	/* Make sure we don't have writers */
+	if (!dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_WRITE)) {
+		pr_debug("FFS WRITE fence is not signaled\n");
+		ret = -EBUSY;
+		goto err_resv_unlock;
+	}
+
+	/* If we're writing to the DMABUF, make sure we don't have readers */
+	if (epfile->in &&
+	    !dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_READ)) {
+		pr_debug("FFS READ fence is not signaled\n");
+		ret = -EBUSY;
+		goto err_resv_unlock;
+	}
+
+	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
+	if (ret)
+		goto err_resv_unlock;
+
+	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence) {
+		ret = -ENOMEM;
+		goto err_resv_unlock;
+	}
+
+	fence->priv = priv;
+
+	spin_lock_irq(&epfile->ffs->eps_lock);
+
+	/* In the meantime, endpoint got disabled or changed. */
+	if (epfile->ep != ep) {
+		ret = -ESHUTDOWN;
+		goto err_fence_put;
+	}
+
+	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
+	if (!usb_req) {
+		ret = -ENOMEM;
+		goto err_fence_put;
+	}
+
+	/*
+	 * usb_ep_queue() guarantees that all transfers are processed in the
+	 * order they are enqueued, so we can use a simple incrementing
+	 * sequence number for the dma_fence.
+	 */
+	seqno = atomic_add_return(1, &epfile->seqno);
+
+	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
+		       &priv->lock, priv->context, seqno);
+
+	dma_resv_add_fence(dmabuf->resv, &fence->base,
+			   dma_resv_usage_rw(epfile->in));
+	dma_resv_unlock(dmabuf->resv);
+
+	/* Now that the dma_fence is in place, queue the transfer. */
+
+	usb_req->length = req->length;
+	usb_req->buf = NULL;
+	usb_req->sg = priv->sgt->sgl;
+	usb_req->num_sgs = sg_nents_for_len(priv->sgt->sgl, req->length);
+	usb_req->sg_was_mapped = true;
+	usb_req->context  = fence;
+	usb_req->complete = ffs_epfile_dmabuf_io_complete;
+
+	cookie = dma_fence_begin_signalling();
+	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
+	dma_fence_end_signalling(cookie);
+	if (ret) {
+		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
+		ffs_dmabuf_signal_done(fence, ret);
+		usb_ep_free_request(ep->ep, usb_req);
+	}
+
+	spin_unlock_irq(&epfile->ffs->eps_lock);
+	dma_buf_put(dmabuf);
+
+	return ret;
+
+err_fence_put:
+	spin_unlock_irq(&epfile->ffs->eps_lock);
+	dma_fence_put(&fence->base);
+err_resv_unlock:
+	dma_resv_unlock(dmabuf->resv);
+err_end_access:
+	dma_buf_end_access(attach, priv->sgt, priv->dir);
+err_attachment_put:
+	ffs_dmabuf_put(attach);
+err_dmabuf_put:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
 static long ffs_epfile_ioctl(struct file *file, unsigned code,
 			     unsigned long value)
 {
@@ -1292,6 +1708,44 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
+	switch (code) {
+	case FUNCTIONFS_DMABUF_ATTACH:
+	{
+		int fd;
+
+		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		return ffs_dmabuf_attach(file, fd);
+	}
+	case FUNCTIONFS_DMABUF_DETACH:
+	{
+		int fd;
+
+		if (copy_from_user(&fd, (void __user *)value, sizeof(fd))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		return ffs_dmabuf_detach(file, fd);
+	}
+	case FUNCTIONFS_DMABUF_TRANSFER:
+	{
+		struct usb_ffs_dmabuf_transfer_req req;
+
+		if (copy_from_user(&req, (void __user *)value, sizeof(req))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		return ffs_dmabuf_transfer(file, &req);
+	}
+	default:
+		break;
+	}
+
 	/* Wait for endpoint to be enabled */
 	ep = ffs_epfile_wait_ep(file);
 	if (IS_ERR(ep))
@@ -1869,6 +2323,8 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 	for (i = 1; i <= count; ++i, ++epfile) {
 		epfile->ffs = ffs;
 		mutex_init(&epfile->mutex);
+		mutex_init(&epfile->dmabufs_mutex);
+		INIT_LIST_HEAD(&epfile->dmabufs);
 		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index 078098e73fd3..9f88de9c3d66 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -86,6 +86,22 @@ struct usb_ext_prop_desc {
 	__le16	wPropertyNameLength;
 } __attribute__((packed));
 
+/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
+#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
+
+/**
+ * struct usb_ffs_dmabuf_transfer_req - Transfer request for a DMABUF object
+ * @fd:		file descriptor of the DMABUF object
+ * @flags:	one or more USB_FFS_DMABUF_TRANSFER_* flags
+ * @length:	number of bytes used in this DMABUF for the data transfer.
+ *		Should generally be set to the DMABUF's size.
+ */
+struct usb_ffs_dmabuf_transfer_req {
+	int fd;
+	__u32 flags;
+	__u64 length;
+} __attribute__((packed));
+
 #ifndef __KERNEL__
 
 /*
@@ -290,6 +306,31 @@ struct usb_functionfs_event {
 #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
 					     struct usb_endpoint_descriptor)
 
+/*
+ * Attach the DMABUF object, identified by its file descriptor, to the
+ * data endpoint. Returns zero on success, and a negative errno value
+ * on error.
+ */
+#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
+
 
+/*
+ * Detach the given DMABUF object, identified by its file descriptor,
+ * from the data endpoint. Returns zero on success, and a negative
+ * errno value on error. Note that closing the endpoint's file
+ * descriptor will automatically detach all attached DMABUFs.
+ */
+#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
+
+/*
+ * Enqueue the previously attached DMABUF to the transfer queue.
+ * The argument is a structure that packs the DMABUF's file descriptor,
+ * the size in bytes to transfer (which should generally correspond to
+ * the size of the DMABUF), and a 'flags' field which is unused
+ * for now. Returns zero on success, and a negative errno value on
+ * error.
+ */
+#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
+					     struct usb_ffs_dmabuf_transfer_req)
 
 #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
-- 
2.43.0

