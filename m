Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D43B4ABEB8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A51010F63E;
	Mon,  7 Feb 2022 13:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563310F63E
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:00:30 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 07/12] iio: buffer-dma: Use DMABUFs instead of custom
 solution
Date: Mon,  7 Feb 2022 12:59:28 +0000
Message-Id: <20220207125933.81634-8-paul@crapouillou.net>
In-Reply-To: <20220207125933.81634-1-paul@crapouillou.net>
References: <20220207125933.81634-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enhance the current fileio code by using DMABUF objects instead of
custom buffers.

This adds more code than it removes, but:
- a lot of the complexity can be dropped, e.g. custom kref and
  iio_buffer_block_put_atomic() are not needed anymore;
- it will be much easier to introduce an API to export these DMABUF
  objects to userspace in a following patch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 192 ++++++++++++-------
 include/linux/iio/buffer-dma.h               |   8 +-
 2 files changed, 122 insertions(+), 78 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 15ea7bc3ac08..54e6000cd2ee 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -14,6 +14,7 @@
 #include <linux/poll.h>
 #include <linux/iio/buffer_impl.h>
 #include <linux/iio/buffer-dma.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/sizes.h>
 
@@ -90,103 +91,145 @@
  * callback is called from within the custom callback.
  */
 
-static void iio_buffer_block_release(struct kref *kref)
-{
-	struct iio_dma_buffer_block *block = container_of(kref,
-		struct iio_dma_buffer_block, kref);
-
-	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
-
-	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
-					block->vaddr, block->phys_addr);
-
-	iio_buffer_put(&block->queue->buffer);
-	kfree(block);
-}
-
-static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
-{
-	kref_get(&block->kref);
-}
-
-static void iio_buffer_block_put(struct iio_dma_buffer_block *block)
-{
-	kref_put(&block->kref, iio_buffer_block_release);
-}
-
-/*
- * dma_free_coherent can sleep, hence we need to take some special care to be
- * able to drop a reference from an atomic context.
- */
-static LIST_HEAD(iio_dma_buffer_dead_blocks);
-static DEFINE_SPINLOCK(iio_dma_buffer_dead_blocks_lock);
-
-static void iio_dma_buffer_cleanup_worker(struct work_struct *work)
-{
-	struct iio_dma_buffer_block *block, *_block;
-	LIST_HEAD(block_list);
-
-	spin_lock_irq(&iio_dma_buffer_dead_blocks_lock);
-	list_splice_tail_init(&iio_dma_buffer_dead_blocks, &block_list);
-	spin_unlock_irq(&iio_dma_buffer_dead_blocks_lock);
-
-	list_for_each_entry_safe(block, _block, &block_list, head)
-		iio_buffer_block_release(&block->kref);
-}
-static DECLARE_WORK(iio_dma_buffer_cleanup_work, iio_dma_buffer_cleanup_worker);
-
-static void iio_buffer_block_release_atomic(struct kref *kref)
-{
+struct iio_buffer_dma_buf_attachment {
+	struct scatterlist sgl;
+	struct sg_table sg_table;
 	struct iio_dma_buffer_block *block;
-	unsigned long flags;
-
-	block = container_of(kref, struct iio_dma_buffer_block, kref);
-
-	spin_lock_irqsave(&iio_dma_buffer_dead_blocks_lock, flags);
-	list_add_tail(&block->head, &iio_dma_buffer_dead_blocks);
-	spin_unlock_irqrestore(&iio_dma_buffer_dead_blocks_lock, flags);
-
-	schedule_work(&iio_dma_buffer_cleanup_work);
-}
-
-/*
- * Version of iio_buffer_block_put() that can be called from atomic context
- */
-static void iio_buffer_block_put_atomic(struct iio_dma_buffer_block *block)
-{
-	kref_put(&block->kref, iio_buffer_block_release_atomic);
-}
+};
 
 static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
 {
 	return container_of(buf, struct iio_dma_buffer_queue, buffer);
 }
 
+static struct iio_buffer_dma_buf_attachment *
+to_iio_buffer_dma_buf_attachment(struct sg_table *table)
+{
+	return container_of(table, struct iio_buffer_dma_buf_attachment, sg_table);
+}
+
+static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
+{
+	get_dma_buf(block->dmabuf);
+}
+
+static void iio_buffer_block_put(struct iio_dma_buffer_block *block)
+{
+	dma_buf_put(block->dmabuf);
+}
+
+static int iio_buffer_dma_buf_attach(struct dma_buf *dbuf,
+				     struct dma_buf_attachment *at)
+{
+	at->priv = dbuf->priv;
+
+	return 0;
+}
+
+static struct sg_table *iio_buffer_dma_buf_map(struct dma_buf_attachment *at,
+					       enum dma_data_direction dma_dir)
+{
+	struct iio_dma_buffer_block *block = at->priv;
+	struct iio_buffer_dma_buf_attachment *dba;
+	int ret;
+
+	dba = kzalloc(sizeof(*dba), GFP_KERNEL);
+	if (!dba)
+		return ERR_PTR(-ENOMEM);
+
+	sg_init_one(&dba->sgl, block->vaddr, PAGE_ALIGN(block->size));
+	dba->sg_table.sgl = &dba->sgl;
+	dba->sg_table.nents = 1;
+	dba->block = block;
+
+	ret = dma_map_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
+	if (ret) {
+		kfree(dba);
+		return ERR_PTR(ret);
+	}
+
+	return &dba->sg_table;
+}
+
+static void iio_buffer_dma_buf_unmap(struct dma_buf_attachment *at,
+				     struct sg_table *sg_table,
+				     enum dma_data_direction dma_dir)
+{
+	struct iio_buffer_dma_buf_attachment *dba =
+		to_iio_buffer_dma_buf_attachment(sg_table);
+
+	dma_unmap_sgtable(at->dev, &dba->sg_table, dma_dir, 0);
+	kfree(dba);
+}
+
+static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
+{
+	struct iio_dma_buffer_block *block = dbuf->priv;
+	struct iio_dma_buffer_queue *queue = block->queue;
+
+	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
+
+	mutex_lock(&queue->lock);
+
+	dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
+			  block->vaddr, block->phys_addr);
+	kfree(block);
+
+	mutex_unlock(&queue->lock);
+	iio_buffer_put(&queue->buffer);
+}
+
+static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
+	.attach			= iio_buffer_dma_buf_attach,
+	.map_dma_buf		= iio_buffer_dma_buf_map,
+	.unmap_dma_buf		= iio_buffer_dma_buf_unmap,
+	.release		= iio_buffer_dma_buf_release,
+};
+
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	struct iio_dma_buffer_queue *queue, size_t size)
 {
 	struct iio_dma_buffer_block *block;
+	DEFINE_DMA_BUF_EXPORT_INFO(einfo);
+	struct dma_buf *dmabuf;
+	int err = -ENOMEM;
 
 	block = kzalloc(sizeof(*block), GFP_KERNEL);
 	if (!block)
-		return NULL;
+		return ERR_PTR(err);
 
 	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
 		&block->phys_addr, GFP_KERNEL);
-	if (!block->vaddr) {
-		kfree(block);
-		return NULL;
+	if (!block->vaddr)
+		goto err_free_block;
+
+	einfo.ops = &iio_dma_buffer_dmabuf_ops;
+	einfo.size = PAGE_ALIGN(size);
+	einfo.priv = block;
+	einfo.flags = O_RDWR;
+
+	dmabuf = dma_buf_export(&einfo);
+	if (IS_ERR(dmabuf)) {
+		err = PTR_ERR(dmabuf);
+		goto err_free_dma;
 	}
 
+	block->dmabuf = dmabuf;
 	block->size = size;
 	block->state = IIO_BLOCK_STATE_DONE;
 	block->queue = queue;
 	INIT_LIST_HEAD(&block->head);
-	kref_init(&block->kref);
 
 	iio_buffer_get(&queue->buffer);
 
 	return block;
+
+err_free_dma:
+	dma_free_coherent(queue->dev, PAGE_ALIGN(size),
+			  block->vaddr, block->phys_addr);
+err_free_block:
+	kfree(block);
+	return ERR_PTR(err);
 }
 
 static void _iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
@@ -223,7 +266,7 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 	_iio_dma_buffer_block_done(block);
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
-	iio_buffer_block_put_atomic(block);
+	iio_buffer_block_put(block);
 	iio_dma_buffer_queue_wake(queue);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
@@ -249,7 +292,8 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 		list_del(&block->head);
 		block->bytes_used = 0;
 		_iio_dma_buffer_block_done(block);
-		iio_buffer_block_put_atomic(block);
+
+		iio_buffer_block_put(block);
 	}
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
@@ -340,8 +384,8 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
 		if (!block) {
 			block = iio_dma_buffer_alloc_block(queue, size);
-			if (!block) {
-				ret = -ENOMEM;
+			if (IS_ERR(block)) {
+				ret = PTR_ERR(block);
 				goto out_unlock;
 			}
 			queue->fileio.blocks[i] = block;
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 490b93f76fa8..6b3fa7d2124b 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -8,7 +8,6 @@
 #define __INDUSTRIALIO_DMA_BUFFER_H__
 
 #include <linux/list.h>
-#include <linux/kref.h>
 #include <linux/spinlock.h>
 #include <linux/mutex.h>
 #include <linux/iio/buffer_impl.h>
@@ -16,6 +15,7 @@
 struct iio_dma_buffer_queue;
 struct iio_dma_buffer_ops;
 struct device;
+struct dma_buf;
 
 /**
  * enum iio_block_state - State of a struct iio_dma_buffer_block
@@ -39,8 +39,8 @@ enum iio_block_state {
  * @vaddr: Virutal address of the blocks memory
  * @phys_addr: Physical address of the blocks memory
  * @queue: Parent DMA buffer queue
- * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @dmabuf: Underlying DMABUF object
  */
 struct iio_dma_buffer_block {
 	/* May only be accessed by the owner of the block */
@@ -56,13 +56,13 @@ struct iio_dma_buffer_block {
 	size_t size;
 	struct iio_dma_buffer_queue *queue;
 
-	/* Must not be accessed outside the core. */
-	struct kref kref;
 	/*
 	 * Must not be accessed outside the core. Access needs to hold
 	 * queue->list_lock if the block is not owned by the core.
 	 */
 	enum iio_block_state state;
+
+	struct dma_buf *dmabuf;
 };
 
 /**
-- 
2.34.1

