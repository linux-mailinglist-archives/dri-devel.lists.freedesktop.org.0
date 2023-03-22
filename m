Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0E36C4639
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:21:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C43510E8E0;
	Wed, 22 Mar 2023 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F48610E8DE
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1679476889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9BZxja6OPxkoW/Pr/5zyuJjOVcEhn2qcfBGacm4biQ=;
 b=wthtQQZtyOnhrcXoagzWxiGeNSkDkiK92F55Rvw8/gnwMW7uRURTfIP5aGPWyvLYOWKlKT
 dZYDw5Plukkkb4jsnERKRMidJMCuT2Ntc2ub5gkjyLhdOFvbPh+Vd7MjOhcdMZM0N0ATi5
 0YlnjWFPNv7irFugz8kjYJaIhIKGuFI=
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 3/3] usb: gadget: functionfs: Add DMABUF import interface
Date: Wed, 22 Mar 2023 10:21:18 +0100
Message-Id: <20230322092118.9213-4-paul@crapouillou.net>
In-Reply-To: <20230322092118.9213-1-paul@crapouillou.net>
References: <20230322092118.9213-1-paul@crapouillou.net>
MIME-Version: 1.0
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
Cc: Paul Cercueil <paul@crapouillou.net>, michael.hennerich@analog.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nuno.sa@analog.com,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
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

---
v2:
- Make ffs_dma_resv_lock() static
- Add MODULE_IMPORT_NS(DMA_BUF);
- The attach/detach functions are now performed without locking the
  eps_lock spinlock. The transfer function starts with the spinlock
  unlocked, then locks it before allocating and queueing the USB
  transfer.
---
 drivers/usb/gadget/function/f_fs.c  | 421 ++++++++++++++++++++++++++++
 include/uapi/linux/usb/functionfs.h |  14 +-
 2 files changed, 434 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 8da64f0fdef0..f5c609c83b36 100644
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
@@ -124,6 +129,26 @@ struct ffs_ep {
 	u8				num;
 };
 
+struct ffs_dmabuf_priv {
+	struct list_head entry;
+	struct kref ref;
+	struct dma_buf_attachment *attach;
+	spinlock_t lock;
+	u64 context;
+};
+
+struct ffs_dma_fence {
+	struct dma_fence base;
+	struct ffs_dmabuf_priv *priv;
+	struct sg_table *sgt;
+	enum dma_data_direction dir;
+};
+
+static inline struct ffs_dma_fence *to_ffs_dma_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct ffs_dma_fence, base);
+}
+
 struct ffs_epfile {
 	/* Protects ep->ep and ep->req. */
 	struct mutex			mutex;
@@ -197,6 +222,8 @@ struct ffs_epfile {
 	unsigned char			isoc;	/* P: ffs->eps_lock */
 
 	unsigned char			_pad;
+
+	struct list_head		dmabufs;
 };
 
 struct ffs_buffer {
@@ -1292,19 +1319,374 @@ static ssize_t ffs_epfile_read_iter(struct kiocb *kiocb, struct iov_iter *to)
 	return res;
 }
 
+static void ffs_dmabuf_release(struct kref *ref)
+{
+	struct ffs_dmabuf_priv *priv = container_of(ref, struct ffs_dmabuf_priv, ref);
+	struct dma_buf_attachment *attach = priv->attach;
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	pr_debug("FFS DMABUF release\n");
+	dma_buf_detach(attach->dmabuf, attach);
+	dma_buf_put(dmabuf);
+
+	list_del(&priv->entry);
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
 
 	ENTER();
 
+	/* Close all attached DMABUFs */
+	list_for_each_entry_safe(priv, tmp, &epfile->dmabufs, entry) {
+		ffs_dmabuf_put(priv->attach);
+	}
+
 	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
 
 	return 0;
 }
 
+static void ffs_dmabuf_signal_done(struct ffs_dma_fence *dma_fence, int ret)
+{
+	struct ffs_dmabuf_priv *priv = dma_fence->priv;
+	struct dma_fence *fence = &dma_fence->base;
+
+	dma_fence_get(fence);
+	fence->error = ret;
+	dma_fence_signal(fence);
+
+	dma_buf_unmap_attachment(priv->attach, dma_fence->sgt, dma_fence->dir);
+	dma_fence_put(fence);
+	ffs_dmabuf_put(priv->attach);
+}
+
+static void ffs_epfile_dmabuf_io_complete(struct usb_ep *ep,
+					  struct usb_request *req)
+{
+	ENTER();
+
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
+	struct ffs_dma_fence *dma_fence = to_ffs_dma_fence(fence);
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
+	int ret;
+
+	ret = dma_resv_lock_interruptible(dmabuf->resv, NULL);
+	if (ret) {
+		if (ret != -EDEADLK)
+			goto out;
+		if (nonblock) {
+			ret = -EBUSY;
+			goto out;
+		}
+
+		ret = dma_resv_lock_slow_interruptible(dmabuf->resv, NULL);
+	}
+
+out:
+	return ret;
+}
+
+static struct dma_buf_attachment *
+ffs_dmabuf_find_attachment(struct device *dev, struct dma_buf *dmabuf,
+			   bool nonblock)
+{
+	struct dma_buf_attachment *elm, *attach = NULL;
+	int ret;
+
+	ret = ffs_dma_resv_lock(dmabuf, nonblock);
+	if (ret)
+		return ERR_PTR(ret);
+
+	list_for_each_entry(elm, &dmabuf->attachments, node) {
+		if (elm->dev == dev) {
+			attach = elm;
+			break;
+		}
+	}
+
+	if (attach)
+		ffs_dmabuf_get(elm);
+
+	dma_resv_unlock(dmabuf->resv);
+
+	return attach ?: ERR_PTR(-EPERM);
+}
+
+static int ffs_dmabuf_attach(struct file *file, int fd)
+{
+	struct ffs_epfile *epfile = file->private_data;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
+	struct dma_buf_attachment *attach;
+	struct ffs_dmabuf_priv *priv;
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
+	attach->importer_priv = priv;
+
+	priv->attach = attach;
+	spin_lock_init(&priv->lock);
+	kref_init(&priv->ref);
+	priv->context = dma_fence_context_alloc(1);
+
+	list_add(&priv->entry, &epfile->dmabufs);
+
+	return 0;
+
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
+	struct usb_gadget *gadget = epfile->ffs->gadget;
+	bool nonblock = file->f_flags & O_NONBLOCK;
+	struct dma_buf_attachment *attach;
+	struct dma_buf *dmabuf;
+	int ret = 0;
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
+					    dmabuf, nonblock);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto out_dmabuf_put;
+	}
+
+	ffs_dmabuf_put(attach);
+	ffs_dmabuf_put(attach);
+
+out_dmabuf_put:
+	dma_buf_put(dmabuf);
+	return ret;
+}
+
+static int ffs_dmabuf_transfer(struct file *file,
+			       const struct usb_ffs_dmabuf_transfer_req *req)
+{
+	bool dma_to_ram, nonblock = file->f_flags & O_NONBLOCK;
+	struct ffs_epfile *epfile = file->private_data;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
+	struct dma_buf_attachment *attach;
+	struct ffs_dmabuf_priv *priv;
+	enum dma_data_direction dir;
+	struct ffs_dma_fence *fence;
+	struct usb_request *usb_req;
+	struct sg_table *sg_table;
+	struct dma_buf *dmabuf;
+	struct ffs_ep *ep;
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
+	attach = ffs_dmabuf_find_attachment(gadget->dev.parent,
+					    dmabuf, nonblock);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto err_dmabuf_put;
+	}
+
+	priv = attach->importer_priv;
+
+	if (epfile->in)
+		dir = DMA_FROM_DEVICE;
+	else
+		dir = DMA_TO_DEVICE;
+
+	sg_table = dma_buf_map_attachment(attach, dir);
+	if (IS_ERR(sg_table)) {
+		ret = PTR_ERR(sg_table);
+		goto err_attachment_put;
+	}
+
+	ep = ffs_epfile_wait_ep(file);
+	if (IS_ERR(ep)) {
+		ret = PTR_ERR(ep);
+		goto err_unmap_attachment;
+	}
+
+	ret = ffs_dma_resv_lock(dmabuf, nonblock);
+	if (ret)
+		goto err_unmap_attachment;
+
+	/* Make sure we don't have writers */
+	if (!dma_resv_test_signaled(dmabuf->resv, DMA_RESV_USAGE_WRITE)) {
+		pr_debug("FFS WRITE fence is not signaled\n");
+		ret = -EBUSY;
+		goto err_resv_unlock;
+	}
+
+	dma_to_ram = dir == DMA_FROM_DEVICE;
+
+	/* If we're writing to the DMABUF, make sure we don't have readers */
+	if (dma_to_ram &&
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
+	fence->sgt = sg_table;
+	fence->dir = dir;
+	fence->priv = priv;
+
+	dma_fence_init(&fence->base, &ffs_dmabuf_fence_ops,
+		       &priv->lock, priv->context, 0);
+
+	spin_lock_irq(&epfile->ffs->eps_lock);
+
+	/* In the meantime, endpoint got disabled or changed. */
+	if (epfile->ep != ep) {
+		ret = -ESHUTDOWN;
+		goto err_spin_unlock;
+	}
+
+	usb_req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC);
+	if (!usb_req) {
+		ret = -ENOMEM;
+		goto err_spin_unlock;
+	}
+
+	dma_resv_add_fence(dmabuf->resv, &fence->base,
+			   dma_resv_usage_rw(dma_to_ram));
+	dma_resv_unlock(dmabuf->resv);
+
+	/* Now that the dma_fence is in place, queue the transfer. */
+
+	usb_req->length = req->length;
+	usb_req->buf = NULL;
+	usb_req->sg = sg_table->sgl;
+	usb_req->num_sgs = sg_nents_for_len(sg_table->sgl, req->length);
+	usb_req->sg_was_mapped = true;
+	usb_req->context  = fence;
+	usb_req->complete = ffs_epfile_dmabuf_io_complete;
+
+	ret = usb_ep_queue(ep->ep, usb_req, GFP_ATOMIC);
+	if (ret) {
+		usb_ep_free_request(ep->ep, usb_req);
+
+		spin_unlock_irq(&epfile->ffs->eps_lock);
+
+		pr_warn("FFS: Failed to queue DMABUF: %d\n", ret);
+		ffs_dmabuf_signal_done(fence, ret);
+		goto out_dma_buf_put;
+	}
+
+	spin_unlock_irq(&epfile->ffs->eps_lock);
+
+out_dma_buf_put:
+	dma_buf_put(dmabuf);
+
+	return ret;
+
+err_spin_unlock:
+	spin_unlock_irq(&epfile->ffs->eps_lock);
+	dma_fence_put(&fence->base);
+err_resv_unlock:
+	dma_resv_unlock(dmabuf->resv);
+err_unmap_attachment:
+	dma_buf_unmap_attachment(attach, sg_table, dir);
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
@@ -1317,6 +1699,44 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
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
@@ -1931,6 +2351,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 	for (i = 1; i <= count; ++i, ++epfile) {
 		epfile->ffs = ffs;
 		mutex_init(&epfile->mutex);
+		INIT_LIST_HEAD(&epfile->dmabufs);
 		if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index d77ee6b65328..1412ab9f8ccc 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -84,6 +84,15 @@ struct usb_ext_prop_desc {
 	__le16	wPropertyNameLength;
 } __attribute__((packed));
 
+/* Flags for usb_ffs_dmabuf_transfer_req->flags (none for now) */
+#define USB_FFS_DMABUF_TRANSFER_MASK	0x0
+
+struct usb_ffs_dmabuf_transfer_req {
+	int fd;
+	__u32 flags;
+	__u64 length;
+} __attribute__((packed));
+
 #ifndef __KERNEL__
 
 /*
@@ -288,6 +297,9 @@ struct usb_functionfs_event {
 #define	FUNCTIONFS_ENDPOINT_DESC	_IOR('g', 130, \
 					     struct usb_endpoint_descriptor)
 
-
+#define FUNCTIONFS_DMABUF_ATTACH	_IOW('g', 131, int)
+#define FUNCTIONFS_DMABUF_DETACH	_IOW('g', 132, int)
+#define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
+					     struct usb_ffs_dmabuf_transfer_req)
 
 #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
-- 
2.39.2

