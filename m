Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 334888615A7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 16:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2318510E034;
	Fri, 23 Feb 2024 15:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="Bef+SpsF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6456B10E034
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 15:25:27 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N9Novu014764; Fri, 23 Feb 2024 07:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=DKIM; bh=iJSe6bwUzDB6QPyUKqq+ATVT00o8PlSmhGnd0fy/caI=; b=
 Bef+SpsF9xacMDAfD3MD3huyNlKggF/3OhQzvr14xtlfku2pGklshCnp3meYMhwm
 +GUFLbxKUhTta6GVvkBHKA6ZA4c39miqaLRahgvKAkgGc9FOI5CqOAMAzWAKOOpe
 EA+yztFCs+2dQJ0OR3QsxWT6swyFlGG1mMTQVYhUc+cVs8zUOsWkAq3+RC4A7AKY
 laiEWbQKKpYfYU1fimcel/JDNzZsBcOu5iyZXUoTTpP1FYZ+UsyOlTdoWZyU16qp
 mF5RHgP5xZgSAoTKG2eS6HiQWTBfrBnmqWwxiIXNfmBVGb3xh8KbSqajttSwbCqH
 fBZ4Hy+/D2x+iweOICc+1Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3wd21pect3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 07:11:04 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41NCB3XY033119
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 23 Feb 2024 07:11:03 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 23 Feb
 2024 07:11:02 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 23 Feb 2024 07:11:02 -0500
Received: from [127.0.0.1] ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41NCAb2U032246;
 Fri, 23 Feb 2024 07:10:56 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Fri, 23 Feb 2024 13:14:01 +0100
Subject: [PATCH v7 3/6] iio: core: Add new DMABUF interface infrastructure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-iio-dmabuf-v7-3-78cfaad117b9@analog.com>
References: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
In-Reply-To: <20240223-iio-dmabuf-v7-0-78cfaad117b9@analog.com>
To: Vinod Koul <vkoul@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jonathan Cameron <jic23@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jonathan Corbet <corbet@lwn.net>, Paul Cercueil <paul@crapouillou.net>
CC: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich
 <Michael.Hennerich@analog.com>,
 <linux-doc@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708690439; l=20283;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=108K8tUmbWSynkD4cqqgh4ED/8V234gSMh3T1YiLhII=;
 b=DYBcswormbwHw2QQ3rqj+PQHTkxLpJQ8gJr3iQaKHn9qom5nT10dSQyT6mCXpBnQ3LOn7yHVj
 ykvHqF/ILdFBrMsqDIUvVP+zmnzrcHX8LljAQUyKQzGbwpU+11sVyFN
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 57U7jIncxMYs6Lj6ir3r4YlFjc9IyOi3
X-Proofpoint-ORIG-GUID: 57U7jIncxMYs6Lj6ir3r4YlFjc9IyOi3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230087
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Paul Cercueil <paul@crapouillou.net>

Add the necessary infrastructure to the IIO core to support a new
optional DMABUF based interface.

With this new interface, DMABUF objects (externally created) can be
attached to a IIO buffer, and subsequently used for data transfer.

A userspace application can then use this interface to share DMABUF
objects between several interfaces, allowing it to transfer data in a
zero-copy fashion, for instance between IIO and the USB stack.

The userspace application can also memory-map the DMABUF objects, and
access the sample data directly. The advantage of doing this vs. the
read() interface is that it avoids an extra copy of the data between the
kernel and userspace. This is particularly userful for high-speed
devices which produce several megabytes or even gigabytes of data per
second.

As part of the interface, 3 new IOCTLs have been added:

IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd):
 Attach the DMABUF object identified by the given file descriptor to the
 buffer.

IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd):
 Detach the DMABUF object identified by the given file descriptor from
 the buffer. Note that closing the IIO buffer's file descriptor will
 automatically detach all previously attached DMABUF objects.

IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *):
 Request a data transfer to/from the given DMABUF object. Its file
 descriptor, as well as the transfer size and flags are provided in the
 "iio_dmabuf" structure.

These three IOCTLs have to be performed on the IIO buffer's file
descriptor, obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/iio/industrialio-buffer.c | 462 ++++++++++++++++++++++++++++++++++++++
 include/linux/iio/buffer_impl.h   |  33 +++
 include/uapi/linux/iio/buffer.h   |  22 ++
 3 files changed, 517 insertions(+)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index b581a7e80566..0e63a09fa90a 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -9,14 +9,19 @@
  * - Better memory allocation techniques?
  * - Alternative access techniques?
  */
+#include <linux/atomic.h>
 #include <linux/anon_inodes.h>
 #include <linux/kernel.h>
 #include <linux/export.h>
 #include <linux/device.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
+#include <linux/dma-resv.h>
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/cdev.h>
 #include <linux/slab.h>
+#include <linux/mm.h>
 #include <linux/poll.h>
 #include <linux/sched/signal.h>
 
@@ -28,6 +33,32 @@
 #include <linux/iio/buffer.h>
 #include <linux/iio/buffer_impl.h>
 
+#define DMABUF_ENQUEUE_TIMEOUT_MS 5000
+
+struct iio_dma_fence;
+
+struct iio_dmabuf_priv {
+	struct list_head entry;
+	struct kref ref;
+
+	struct iio_buffer *buffer;
+	struct iio_dma_buffer_block *block;
+
+	u64 context;
+	spinlock_t lock;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sgt;
+	enum dma_data_direction dir;
+	atomic_t seqno;
+};
+
+struct iio_dma_fence {
+	struct dma_fence base;
+	struct iio_dmabuf_priv *priv;
+	struct work_struct work;
+};
+
 static const char * const iio_endian_prefix[] = {
 	[IIO_BE] = "be",
 	[IIO_LE] = "le",
@@ -332,6 +363,8 @@ void iio_buffer_init(struct iio_buffer *buffer)
 {
 	INIT_LIST_HEAD(&buffer->demux_list);
 	INIT_LIST_HEAD(&buffer->buffer_list);
+	INIT_LIST_HEAD(&buffer->dmabufs);
+	mutex_init(&buffer->dmabufs_mutex);
 	init_waitqueue_head(&buffer->pollq);
 	kref_init(&buffer->ref);
 	if (!buffer->watermark)
@@ -1519,14 +1552,62 @@ static void iio_buffer_unregister_legacy_sysfs_groups(struct iio_dev *indio_dev)
 	kfree(iio_dev_opaque->legacy_scan_el_group.attrs);
 }
 
+static void iio_buffer_dmabuf_release(struct kref *ref)
+{
+	struct iio_dmabuf_priv *priv = container_of(ref, struct iio_dmabuf_priv, ref);
+	struct dma_buf_attachment *attach = priv->attach;
+	struct iio_buffer *buffer = priv->buffer;
+	struct dma_buf *dmabuf = attach->dmabuf;
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
+	dma_resv_unlock(dmabuf->resv);
+
+	buffer->access->detach_dmabuf(buffer, priv->block);
+
+	dma_buf_detach(attach->dmabuf, attach);
+	dma_buf_put(dmabuf);
+	kfree(priv);
+}
+
+void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach)
+{
+	struct iio_dmabuf_priv *priv = attach->importer_priv;
+
+	kref_get(&priv->ref);
+}
+EXPORT_SYMBOL_GPL(iio_buffer_dmabuf_get);
+
+void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach)
+{
+	struct iio_dmabuf_priv *priv = attach->importer_priv;
+
+	kref_put(&priv->ref, iio_buffer_dmabuf_release);
+}
+EXPORT_SYMBOL_GPL(iio_buffer_dmabuf_put);
+
 static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
 {
 	struct iio_dev_buffer_pair *ib = filep->private_data;
 	struct iio_dev *indio_dev = ib->indio_dev;
 	struct iio_buffer *buffer = ib->buffer;
+	struct iio_dmabuf_priv *priv, *tmp;
 
 	wake_up(&buffer->pollq);
 
+	mutex_lock(&buffer->dmabufs_mutex);
+
+	/* Close all attached DMABUFs */
+	list_for_each_entry_safe(priv, tmp, &buffer->dmabufs, entry) {
+		list_del_init(&priv->entry);
+		iio_buffer_dmabuf_put(priv->attach);
+	}
+
+	if (!list_empty(&buffer->dmabufs))
+		dev_warn(&indio_dev->dev, "Buffer FD closed with active transfers\n");
+
+	mutex_unlock(&buffer->dmabufs_mutex);
+
 	kfree(ib);
 	clear_bit(IIO_BUSY_BIT_POS, &buffer->flags);
 	iio_device_put(indio_dev);
@@ -1534,11 +1615,391 @@ static int iio_buffer_chrdev_release(struct inode *inode, struct file *filep)
 	return 0;
 }
 
+static int iio_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
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
+iio_buffer_find_attachment(struct iio_dev_buffer_pair *ib,
+			   struct dma_buf *dmabuf, bool nonblock)
+{
+	struct device *dev = ib->indio_dev->dev.parent;
+	struct iio_buffer *buffer = ib->buffer;
+	struct dma_buf_attachment *attach = NULL;
+	struct iio_dmabuf_priv *priv;
+
+	mutex_lock(&buffer->dmabufs_mutex);
+
+	list_for_each_entry(priv, &buffer->dmabufs, entry) {
+		if (priv->attach->dev == dev
+		    && priv->attach->dmabuf == dmabuf) {
+			attach = priv->attach;
+			break;
+		}
+	}
+
+	if (attach)
+		iio_buffer_dmabuf_get(attach);
+
+	mutex_unlock(&buffer->dmabufs_mutex);
+
+	return attach ?: ERR_PTR(-EPERM);
+}
+
+static int iio_buffer_attach_dmabuf(struct iio_dev_buffer_pair *ib,
+				    int __user *user_fd, bool nonblock)
+{
+	struct iio_dev *indio_dev = ib->indio_dev;
+	struct iio_buffer *buffer = ib->buffer;
+	struct dma_buf_attachment *attach;
+	struct iio_dmabuf_priv *priv;
+	struct dma_buf *dmabuf;
+	int err, fd;
+
+	if (!buffer->access->attach_dmabuf
+	    || !buffer->access->detach_dmabuf
+	    || !buffer->access->enqueue_dmabuf)
+		return -EPERM;
+
+	if (copy_from_user(&fd, user_fd, sizeof(fd)))
+		return -EFAULT;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	spin_lock_init(&priv->lock);
+	priv->context = dma_fence_context_alloc(1);
+
+	dmabuf = dma_buf_get(fd);
+	if (IS_ERR(dmabuf)) {
+		err = PTR_ERR(dmabuf);
+		goto err_free_priv;
+	}
+
+	attach = dma_buf_attach(dmabuf, indio_dev->dev.parent);
+	if (IS_ERR(attach)) {
+		err = PTR_ERR(attach);
+		goto err_dmabuf_put;
+	}
+
+	err = iio_dma_resv_lock(dmabuf, nonblock);
+	if (err)
+		goto err_dmabuf_detach;
+
+	priv->dir = buffer->direction == IIO_BUFFER_DIRECTION_IN
+		? DMA_FROM_DEVICE : DMA_TO_DEVICE;
+
+	priv->sgt = dma_buf_map_attachment(attach, priv->dir);
+	if (IS_ERR(priv->sgt)) {
+		err = PTR_ERR(priv->sgt);
+		dev_err(&indio_dev->dev, "Unable to map attachment: %d\n", err);
+		goto err_resv_unlock;
+	}
+
+	kref_init(&priv->ref);
+	priv->buffer = buffer;
+	priv->attach = attach;
+	attach->importer_priv = priv;
+
+	priv->block = buffer->access->attach_dmabuf(buffer, attach);
+	if (IS_ERR(priv->block)) {
+		err = PTR_ERR(priv->block);
+		goto err_dmabuf_unmap_attachment;
+	}
+
+	dma_resv_unlock(dmabuf->resv);
+
+	mutex_lock(&buffer->dmabufs_mutex);
+	list_add(&priv->entry, &buffer->dmabufs);
+	mutex_unlock(&buffer->dmabufs_mutex);
+
+	return 0;
+
+err_dmabuf_unmap_attachment:
+	dma_buf_unmap_attachment(attach, priv->sgt, priv->dir);
+err_resv_unlock:
+	dma_resv_unlock(dmabuf->resv);
+err_dmabuf_detach:
+	dma_buf_detach(dmabuf, attach);
+err_dmabuf_put:
+	dma_buf_put(dmabuf);
+err_free_priv:
+	kfree(priv);
+
+	return err;
+}
+
+static int iio_buffer_detach_dmabuf(struct iio_dev_buffer_pair *ib,
+				    int *user_req, bool nonblock)
+{
+	struct iio_buffer *buffer = ib->buffer;
+	struct iio_dev *indio_dev = ib->indio_dev;
+	struct iio_dmabuf_priv *priv;
+	struct dma_buf *dmabuf;
+	int dmabuf_fd, ret = -EPERM;
+
+	if (copy_from_user(&dmabuf_fd, user_req, sizeof(dmabuf_fd)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(dmabuf_fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	mutex_lock(&buffer->dmabufs_mutex);
+
+	list_for_each_entry(priv, &buffer->dmabufs, entry) {
+		if (priv->attach->dev == indio_dev->dev.parent
+		    && priv->attach->dmabuf == dmabuf) {
+			list_del(&priv->entry);
+
+			/* Unref the reference from iio_buffer_attach_dmabuf() */
+			iio_buffer_dmabuf_put(priv->attach);
+			ret = 0;
+			break;
+		}
+	}
+
+	mutex_unlock(&buffer->dmabufs_mutex);
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
+static const char *
+iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
+{
+	return "iio";
+}
+
+static void iio_buffer_dma_fence_release(struct dma_fence *fence)
+{
+	struct iio_dma_fence *iio_fence =
+		container_of(fence, struct iio_dma_fence, base);
+
+	kfree(iio_fence);
+}
+
+static const struct dma_fence_ops iio_buffer_dma_fence_ops = {
+	.get_driver_name	= iio_buffer_dma_fence_get_driver_name,
+	.get_timeline_name	= iio_buffer_dma_fence_get_driver_name,
+	.release		= iio_buffer_dma_fence_release,
+};
+
+static int iio_buffer_enqueue_dmabuf(struct iio_dev_buffer_pair *ib,
+				     struct iio_dmabuf __user *iio_dmabuf_req,
+				     bool nonblock)
+{
+	struct iio_buffer *buffer = ib->buffer;
+	struct iio_dmabuf iio_dmabuf;
+	struct dma_buf_attachment *attach;
+	struct iio_dmabuf_priv *priv;
+	struct iio_dma_fence *fence;
+	struct dma_buf *dmabuf;
+	unsigned long timeout;
+	bool cookie, cyclic, dma_to_ram;
+	long retl;
+	u32 seqno;
+	int ret;
+
+	if (copy_from_user(&iio_dmabuf, iio_dmabuf_req, sizeof(iio_dmabuf)))
+		return -EFAULT;
+
+	if (iio_dmabuf.flags & ~IIO_BUFFER_DMABUF_SUPPORTED_FLAGS)
+		return -EINVAL;
+
+	cyclic = iio_dmabuf.flags & IIO_BUFFER_DMABUF_CYCLIC;
+
+	/* Cyclic flag is only supported on output buffers */
+	if (cyclic && buffer->direction != IIO_BUFFER_DIRECTION_OUT)
+		return -EINVAL;
+
+	dmabuf = dma_buf_get(iio_dmabuf.fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+
+	if (!iio_dmabuf.bytes_used || iio_dmabuf.bytes_used > dmabuf->size) {
+		ret = -EINVAL;
+		goto err_dmabuf_put;
+	}
+
+	attach = iio_buffer_find_attachment(ib, dmabuf, nonblock);
+	if (IS_ERR(attach)) {
+		ret = PTR_ERR(attach);
+		goto err_dmabuf_put;
+	}
+
+	priv = attach->importer_priv;
+
+	fence = kmalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence) {
+		ret = -ENOMEM;
+		goto err_attachment_put;
+	}
+
+	fence->priv = priv;
+
+	seqno = atomic_add_return(1, &priv->seqno);
+
+	/*
+	 * The transfers are guaranteed to be processed in the order they are
+	 * enqueued, so we can use a simple incrementing sequence number for
+	 * the dma_fence.
+	 */
+	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
+		       &priv->lock, priv->context, seqno);
+
+	ret = iio_dma_resv_lock(dmabuf, nonblock);
+	if (ret)
+		goto err_fence_put;
+
+	timeout = nonblock ? 0 : msecs_to_jiffies(DMABUF_ENQUEUE_TIMEOUT_MS);
+
+	/* Make sure we don't have writers */
+	retl = dma_resv_wait_timeout(dmabuf->resv, DMA_RESV_USAGE_WRITE,
+				     true, timeout);
+	if (retl == 0)
+		retl = -EBUSY;
+	if (retl < 0) {
+		ret = (int)retl;
+		goto err_resv_unlock;
+	}
+
+	dma_to_ram = buffer->direction == IIO_BUFFER_DIRECTION_IN;
+
+	if (dma_to_ram) {
+		/*
+		 * If we're writing to the DMABUF, make sure we don't have
+		 * readers
+		 */
+		retl = dma_resv_wait_timeout(dmabuf->resv,
+					     DMA_RESV_USAGE_READ, true,
+					     timeout);
+		if (retl == 0)
+			retl = -EBUSY;
+		if (retl < 0) {
+			ret = (int)retl;
+			goto err_resv_unlock;
+		}
+	}
+
+	if (buffer->access->lock_queue)
+		buffer->access->lock_queue(buffer);
+
+	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
+	if (ret)
+		goto err_queue_unlock;
+
+	dma_resv_add_fence(dmabuf->resv, &fence->base,
+			   dma_resv_usage_rw(dma_to_ram));
+	dma_resv_unlock(dmabuf->resv);
+
+	cookie = dma_fence_begin_signalling();
+
+	ret = buffer->access->enqueue_dmabuf(buffer, priv->block, &fence->base,
+					     priv->sgt, iio_dmabuf.bytes_used,
+					     cyclic);
+	if (ret) {
+		/*
+		 * DMABUF enqueue failed, but we already added the fence.
+		 * Signal the error through the fence completion mechanism.
+		 */
+		iio_buffer_signal_dmabuf_done(&fence->base, ret);
+	}
+
+	if (buffer->access->unlock_queue)
+		buffer->access->unlock_queue(buffer);
+
+	dma_fence_end_signalling(cookie);
+	dma_buf_put(dmabuf);
+
+	return ret;
+
+err_queue_unlock:
+	if (buffer->access->unlock_queue)
+		buffer->access->unlock_queue(buffer);
+err_resv_unlock:
+	dma_resv_unlock(dmabuf->resv);
+err_fence_put:
+	dma_fence_put(&fence->base);
+err_attachment_put:
+	iio_buffer_dmabuf_put(attach);
+err_dmabuf_put:
+	dma_buf_put(dmabuf);
+
+	return ret;
+}
+
+static void iio_buffer_cleanup(struct work_struct *work)
+{
+	struct iio_dma_fence *fence =
+		container_of(work, struct iio_dma_fence, work);
+	struct iio_dmabuf_priv *priv = fence->priv;
+	struct dma_buf_attachment *attach = priv->attach;
+
+	dma_fence_put(&fence->base);
+	iio_buffer_dmabuf_put(attach);
+}
+
+void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret)
+{
+	struct iio_dma_fence *iio_fence =
+		container_of(fence, struct iio_dma_fence, base);
+	bool cookie = dma_fence_begin_signalling();
+
+	/*
+	 * Get a reference to the fence, so that it's not freed as soon as
+	 * it's signaled.
+	 */
+	dma_fence_get(fence);
+
+	fence->error = ret;
+	dma_fence_signal(fence);
+	dma_fence_end_signalling(cookie);
+
+	/*
+	 * The fence will be unref'd in iio_buffer_cleanup.
+	 * It can't be done here, as the unref functions might try to lock the
+	 * resv object, which can deadlock.
+	 */
+	INIT_WORK(&iio_fence->work, iio_buffer_cleanup);
+	schedule_work(&iio_fence->work);
+}
+EXPORT_SYMBOL_GPL(iio_buffer_signal_dmabuf_done);
+
+static long iio_buffer_chrdev_ioctl(struct file *filp,
+				    unsigned int cmd, unsigned long arg)
+{
+	struct iio_dev_buffer_pair *ib = filp->private_data;
+	void __user *_arg = (void __user *)arg;
+	bool nonblock = filp->f_flags & O_NONBLOCK;
+
+	switch (cmd) {
+	case IIO_BUFFER_DMABUF_ATTACH_IOCTL:
+		return iio_buffer_attach_dmabuf(ib, _arg, nonblock);
+	case IIO_BUFFER_DMABUF_DETACH_IOCTL:
+		return iio_buffer_detach_dmabuf(ib, _arg, nonblock);
+	case IIO_BUFFER_DMABUF_ENQUEUE_IOCTL:
+		return iio_buffer_enqueue_dmabuf(ib, _arg, nonblock);
+	default:
+		return -EINVAL;
+	}
+}
+
 static const struct file_operations iio_buffer_chrdev_fileops = {
 	.owner = THIS_MODULE,
 	.llseek = noop_llseek,
 	.read = iio_buffer_read,
 	.write = iio_buffer_write,
+	.unlocked_ioctl = iio_buffer_chrdev_ioctl,
+	.compat_ioctl = compat_ptr_ioctl,
 	.poll = iio_buffer_poll,
 	.release = iio_buffer_chrdev_release,
 };
@@ -1953,6 +2414,7 @@ static void iio_buffer_release(struct kref *ref)
 {
 	struct iio_buffer *buffer = container_of(ref, struct iio_buffer, ref);
 
+	mutex_destroy(&buffer->dmabufs_mutex);
 	buffer->access->release(buffer);
 }
 
diff --git a/include/linux/iio/buffer_impl.h b/include/linux/iio/buffer_impl.h
index 89c3fd7c29ca..f4b1147291e5 100644
--- a/include/linux/iio/buffer_impl.h
+++ b/include/linux/iio/buffer_impl.h
@@ -9,8 +9,12 @@
 #include <uapi/linux/iio/buffer.h>
 #include <linux/iio/buffer.h>
 
+struct dma_buf_attachment;
+struct dma_fence;
 struct iio_dev;
+struct iio_dma_buffer_block;
 struct iio_buffer;
+struct sg_table;
 
 /**
  * INDIO_BUFFER_FLAG_FIXED_WATERMARK - Watermark level of the buffer can not be
@@ -39,6 +43,13 @@ struct iio_buffer;
  *                      device stops sampling. Calles are balanced with @enable.
  * @release:		called when the last reference to the buffer is dropped,
  *			should free all resources allocated by the buffer.
+ * @attach_dmabuf:	called from userspace via ioctl to attach one external
+ *			DMABUF.
+ * @detach_dmabuf:	called from userspace via ioctl to detach one previously
+ *			attached DMABUF.
+ * @enqueue_dmabuf:	called from userspace via ioctl to queue this DMABUF
+ *			object to this buffer. Requires a valid DMABUF fd, that
+ *			was previouly attached to this buffer.
  * @modes:		Supported operating modes by this buffer type
  * @flags:		A bitmask combination of INDIO_BUFFER_FLAG_*
  *
@@ -68,6 +79,17 @@ struct iio_buffer_access_funcs {
 
 	void (*release)(struct iio_buffer *buffer);
 
+	struct iio_dma_buffer_block * (*attach_dmabuf)(struct iio_buffer *buffer,
+						       struct dma_buf_attachment *attach);
+	void (*detach_dmabuf)(struct iio_buffer *buffer,
+			      struct iio_dma_buffer_block *block);
+	int (*enqueue_dmabuf)(struct iio_buffer *buffer,
+			      struct iio_dma_buffer_block *block,
+			      struct dma_fence *fence, struct sg_table *sgt,
+			      size_t size, bool cyclic);
+	void (*lock_queue)(struct iio_buffer *buffer);
+	void (*unlock_queue)(struct iio_buffer *buffer);
+
 	unsigned int modes;
 	unsigned int flags;
 };
@@ -136,6 +158,12 @@ struct iio_buffer {
 
 	/* @ref: Reference count of the buffer. */
 	struct kref ref;
+
+	/* @dmabufs: List of DMABUF attachments */
+	struct list_head dmabufs; /* P: dmabufs_mutex */
+
+	/* @dmabufs_mutex: Protects dmabufs */
+	struct mutex dmabufs_mutex;
 };
 
 /**
@@ -156,9 +184,14 @@ int iio_update_buffers(struct iio_dev *indio_dev,
  **/
 void iio_buffer_init(struct iio_buffer *buffer);
 
+void iio_buffer_dmabuf_get(struct dma_buf_attachment *attach);
+void iio_buffer_dmabuf_put(struct dma_buf_attachment *attach);
+
 struct iio_buffer *iio_buffer_get(struct iio_buffer *buffer);
 void iio_buffer_put(struct iio_buffer *buffer);
 
+void iio_buffer_signal_dmabuf_done(struct dma_fence *fence, int ret);
+
 #else /* CONFIG_IIO_BUFFER */
 
 static inline void iio_buffer_get(struct iio_buffer *buffer) {}
diff --git a/include/uapi/linux/iio/buffer.h b/include/uapi/linux/iio/buffer.h
index 13939032b3f6..c666aa95e532 100644
--- a/include/uapi/linux/iio/buffer.h
+++ b/include/uapi/linux/iio/buffer.h
@@ -5,6 +5,28 @@
 #ifndef _UAPI_IIO_BUFFER_H_
 #define _UAPI_IIO_BUFFER_H_
 
+#include <linux/types.h>
+
+/* Flags for iio_dmabuf.flags */
+#define IIO_BUFFER_DMABUF_CYCLIC		(1 << 0)
+#define IIO_BUFFER_DMABUF_SUPPORTED_FLAGS	0x00000001
+
+/**
+ * struct iio_dmabuf - Descriptor for a single IIO DMABUF object
+ * @fd:		file descriptor of the DMABUF object
+ * @flags:	one or more IIO_BUFFER_DMABUF_* flags
+ * @bytes_used:	number of bytes used in this DMABUF for the data transfer.
+ *		Should generally be set to the DMABUF's size.
+ */
+struct iio_dmabuf {
+	__u32 fd;
+	__u32 flags;
+	__u64 bytes_used;
+};
+
 #define IIO_BUFFER_GET_FD_IOCTL			_IOWR('i', 0x91, int)
+#define IIO_BUFFER_DMABUF_ATTACH_IOCTL		_IOW('i', 0x92, int)
+#define IIO_BUFFER_DMABUF_DETACH_IOCTL		_IOW('i', 0x93, int)
+#define IIO_BUFFER_DMABUF_ENQUEUE_IOCTL		_IOW('i', 0x94, struct iio_dmabuf)
 
 #endif /* _UAPI_IIO_BUFFER_H_ */

-- 
2.43.2

