Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EC0450698
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 15:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBD76EDF6;
	Mon, 15 Nov 2021 14:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4226EDF6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 14:20:39 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH 10/15] iio: buffer-dma: Implement new DMABUF based userspace
 API
Date: Mon, 15 Nov 2021 14:19:20 +0000
Message-Id: <20211115141925.60164-11-paul@crapouillou.net>
In-Reply-To: <20211115141925.60164-1-paul@crapouillou.net>
References: <20211115141925.60164-1-paul@crapouillou.net>
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
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the two functions iio_dma_buffer_alloc_dmabuf() and
iio_dma_buffer_enqueue_dmabuf(), as well as all the necesary bits to
enable userspace access to the DMABUF objects.

These two functions are exported as GPL symbols so that IIO buffer
implementations can support the new DMABUF based userspace API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 273 ++++++++++++++++++-
 include/linux/iio/buffer-dma.h               |  13 +
 2 files changed, 279 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index adb20434f2d2..92356ee02f30 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -15,7 +15,9 @@
 #include <linux/iio/buffer_impl.h>
 #include <linux/iio/buffer-dma.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-resv.h>
 #include <linux/sizes.h>
 
 /*
@@ -97,6 +99,18 @@ struct iio_buffer_dma_buf_attachment {
 	struct iio_dma_buffer_block *block;
 };
 
+struct iio_buffer_dma_fence {
+	struct dma_fence base;
+	struct iio_dma_buffer_block *block;
+	spinlock_t lock;
+};
+
+static struct iio_buffer_dma_fence *
+to_iio_buffer_dma_fence(struct dma_fence *fence)
+{
+	return container_of(fence, struct iio_buffer_dma_fence, base);
+}
+
 static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
 {
 	return container_of(buf, struct iio_dma_buffer_queue, buffer);
@@ -118,6 +132,48 @@ static void iio_buffer_block_put(struct iio_dma_buffer_block *block)
 	dma_buf_put(block->dmabuf);
 }
 
+static const char *
+iio_buffer_dma_fence_get_driver_name(struct dma_fence *fence)
+{
+	struct iio_buffer_dma_fence *iio_fence = to_iio_buffer_dma_fence(fence);
+
+	return dev_name(iio_fence->block->queue->dev);
+}
+
+static void iio_buffer_dma_fence_release(struct dma_fence *fence)
+{
+	struct iio_buffer_dma_fence *iio_fence = to_iio_buffer_dma_fence(fence);
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
+static struct dma_fence *
+iio_dma_buffer_create_dma_fence(struct iio_dma_buffer_block *block)
+{
+	struct iio_buffer_dma_fence *fence;
+	u64 ctx;
+
+	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
+	if (!fence)
+		return ERR_PTR(-ENOMEM);
+
+	fence->block = block;
+	spin_lock_init(&fence->lock);
+
+	ctx = dma_fence_context_alloc(1);
+
+	dma_fence_init(&fence->base, &iio_buffer_dma_fence_ops,
+		       &fence->lock, ctx, 0);
+
+	return &fence->base;
+}
+
 static int iio_buffer_dma_buf_attach(struct dma_buf *dbuf,
 				     struct dma_buf_attachment *at)
 {
@@ -162,10 +218,26 @@ static void iio_buffer_dma_buf_unmap(struct dma_buf_attachment *at,
 	kfree(dba);
 }
 
+static int iio_buffer_dma_buf_mmap(struct dma_buf *dbuf,
+				   struct vm_area_struct *vma)
+{
+	struct iio_dma_buffer_block *block = dbuf->priv;
+	struct device *dev = block->queue->dev;
+
+	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
+
+	if (vma->vm_ops->open)
+		vma->vm_ops->open(vma);
+
+	return dma_mmap_pages(dev, vma, vma->vm_end - vma->vm_start,
+			      virt_to_page(block->vaddr));
+}
+
 static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
 {
 	struct iio_dma_buffer_block *block = dbuf->priv;
 	struct iio_dma_buffer_queue *queue = block->queue;
+	bool is_fileio = block->fileio;
 
 	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
 
@@ -176,20 +248,51 @@ static void iio_buffer_dma_buf_release(struct dma_buf *dbuf)
 
 	kfree(block);
 
+	queue->num_blocks--;
+	if (is_fileio)
+		queue->num_fileio_blocks--;
 	mutex_unlock(&queue->lock);
 	iio_buffer_put(&queue->buffer);
 }
 
+static int iio_buffer_dma_buf_begin_cpu_access(struct dma_buf *dbuf,
+					       enum dma_data_direction dma_dir)
+{
+	struct iio_dma_buffer_block *block = dbuf->priv;
+	struct device *dev = block->queue->dev;
+
+	/* We only need to invalidate the cache for input buffers */
+	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
+		dma_sync_single_for_cpu(dev, block->phys_addr, block->size, dma_dir);
+
+	return 0;
+}
+
+static int iio_buffer_dma_buf_end_cpu_access(struct dma_buf *dbuf,
+					     enum dma_data_direction dma_dir)
+{
+	struct iio_dma_buffer_block *block = dbuf->priv;
+	struct device *dev = block->queue->dev;
+
+	/* We only need to sync the cache for output buffers */
+	if (block->queue->buffer.direction == IIO_BUFFER_DIRECTION_OUT)
+		dma_sync_single_for_device(dev, block->phys_addr, block->size, dma_dir);
+
+	return 0;
+}
 
 static const struct dma_buf_ops iio_dma_buffer_dmabuf_ops = {
 	.attach			= iio_buffer_dma_buf_attach,
 	.map_dma_buf		= iio_buffer_dma_buf_map,
 	.unmap_dma_buf		= iio_buffer_dma_buf_unmap,
+	.mmap			= iio_buffer_dma_buf_mmap,
 	.release		= iio_buffer_dma_buf_release,
+	.begin_cpu_access	= iio_buffer_dma_buf_begin_cpu_access,
+	.end_cpu_access		= iio_buffer_dma_buf_end_cpu_access,
 };
 
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
-	struct iio_dma_buffer_queue *queue, size_t size)
+	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
 {
 	struct iio_dma_buffer_block *block;
 	DEFINE_DMA_BUF_EXPORT_INFO(einfo);
@@ -223,10 +326,15 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	block->bytes_used = size;
 	block->state = IIO_BLOCK_STATE_DONE;
 	block->queue = queue;
+	block->fileio = fileio;
 	INIT_LIST_HEAD(&block->head);
 
 	iio_buffer_get(&queue->buffer);
 
+	queue->num_blocks++;
+	if (fileio)
+		queue->num_fileio_blocks++;
+
 	return block;
 
 err_free_dma:
@@ -265,14 +373,22 @@ static void iio_dma_buffer_queue_wake(struct iio_dma_buffer_queue *queue)
 void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 {
 	struct iio_dma_buffer_queue *queue = block->queue;
+	struct dma_resv *resv = block->dmabuf->resv;
+	struct dma_fence *fence;
 	unsigned long flags;
 
 	spin_lock_irqsave(&queue->list_lock, flags);
 	_iio_dma_buffer_block_done(block);
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	fence = dma_resv_excl_fence(resv);
+	if (fence)
+		dma_fence_signal(fence);
+	dma_resv_unlock(resv);
+
 	iio_buffer_block_put(block);
-	iio_dma_buffer_queue_wake(queue);
+	if (queue->fileio.enabled)
+		iio_dma_buffer_queue_wake(queue);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
 
@@ -298,6 +414,8 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 		block->bytes_used = 0;
 		_iio_dma_buffer_block_done(block);
 
+		if (dma_resv_is_locked(block->dmabuf->resv))
+			dma_resv_unlock(block->dmabuf->resv);
 		iio_buffer_block_put(block);
 	}
 	spin_unlock_irqrestore(&queue->list_lock, flags);
@@ -323,6 +441,12 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
 	}
 }
 
+static bool iio_dma_buffer_fileio_mode(struct iio_dma_buffer_queue *queue)
+{
+	return queue->fileio.enabled ||
+		queue->num_blocks == queue->num_fileio_blocks;
+}
+
 /**
  * iio_dma_buffer_request_update() - DMA buffer request_update callback
  * @buffer: The buffer which to request an update
@@ -349,6 +473,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
 	mutex_lock(&queue->lock);
 
+	queue->fileio.enabled = iio_dma_buffer_fileio_mode(queue);
+
+	/* If DMABUFs were created, disable fileio interface */
+	if (!queue->fileio.enabled)
+		goto out_unlock;
+
 	/* Allocations are page aligned */
 	if (PAGE_ALIGN(queue->fileio.block_size) == PAGE_ALIGN(size))
 		try_reuse = true;
@@ -387,7 +517,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 		}
 
 		if (!block) {
-			block = iio_dma_buffer_alloc_block(queue, size);
+			block = iio_dma_buffer_alloc_block(queue, size, true);
 			if (IS_ERR(block)) {
 				ret = PTR_ERR(block);
 				goto out_unlock;
@@ -444,6 +574,8 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 
 	block->state = IIO_BLOCK_STATE_ACTIVE;
 	iio_buffer_block_get(block);
+	dma_resv_lock(block->dmabuf->resv, NULL);
+
 	ret = queue->ops->submit(queue, block);
 	if (ret) {
 		/*
@@ -480,12 +612,18 @@ int iio_dma_buffer_enable(struct iio_buffer *buffer,
 	mutex_lock(&queue->lock);
 	queue->active = true;
 	queue->fileio.next_dequeue = 0;
+	queue->fileio.enabled = iio_dma_buffer_fileio_mode(queue);
 
-	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
-		block = queue->fileio.blocks[i];
+	dev_dbg(queue->dev, "Buffer enabled in %s mode\n",
+		queue->fileio.enabled ? "fileio" : "dmabuf");
 
-		if (block->state == IIO_BLOCK_STATE_QUEUED)
-			iio_dma_buffer_submit_block(queue, block);
+	if (queue->fileio.enabled) {
+		for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
+			block = queue->fileio.blocks[i];
+
+			if (block->state == IIO_BLOCK_STATE_QUEUED)
+				iio_dma_buffer_submit_block(queue, block);
+		}
 	}
 	mutex_unlock(&queue->lock);
 
@@ -507,6 +645,7 @@ int iio_dma_buffer_disable(struct iio_buffer *buffer,
 	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
 
 	mutex_lock(&queue->lock);
+	queue->fileio.enabled = false;
 	queue->active = false;
 
 	if (queue->ops && queue->ops->abort)
@@ -565,6 +704,11 @@ static int iio_dma_buffer_io(struct iio_buffer *buffer,
 
 	mutex_lock(&queue->lock);
 
+	if (!queue->fileio.enabled) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
 	if (!queue->fileio.active_block) {
 		block = iio_dma_buffer_dequeue(queue);
 		if (block == NULL) {
@@ -681,6 +825,121 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_data_available);
 
+int iio_dma_buffer_alloc_dmabuf(struct iio_buffer *buffer,
+				struct iio_dmabuf_alloc_req *req)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	struct iio_dma_buffer_block *block;
+	int ret = 0;
+
+	mutex_lock(&queue->lock);
+
+	/*
+	 * If the buffer is enabled and in fileio mode new blocks can't be
+	 * allocated.
+	 */
+	if (queue->fileio.enabled) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	if (!req->size || req->size > SIZE_MAX) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
+
+	/* Free memory that might be in use for fileio mode */
+	iio_dma_buffer_fileio_free(queue);
+
+	block = iio_dma_buffer_alloc_block(queue, req->size, false);
+	if (IS_ERR(block)) {
+		ret = PTR_ERR(block);
+		goto out_unlock;
+	}
+
+	ret = dma_buf_fd(block->dmabuf, O_CLOEXEC);
+	if (ret < 0) {
+		dma_buf_put(block->dmabuf);
+		goto out_unlock;
+	}
+
+out_unlock:
+	mutex_unlock(&queue->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_alloc_dmabuf);
+
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dmabuf *iio_dmabuf)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	struct iio_dma_buffer_block *dma_block;
+	struct dma_fence *fence;
+	struct dma_buf *dmabuf;
+	int ret = 0;
+
+	mutex_lock(&queue->lock);
+
+	/* If in fileio mode buffers can't be enqueued. */
+	if (queue->fileio.enabled) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	dmabuf = dma_buf_get(iio_dmabuf->fd);
+	if (IS_ERR(dmabuf)) {
+		ret = PTR_ERR(dmabuf);
+		goto out_unlock;
+	}
+
+	if (dmabuf->ops != &iio_dma_buffer_dmabuf_ops) {
+		dev_err(queue->dev, "importing DMABUFs from other drivers is not yet supported.\n");
+		ret = -EINVAL;
+		goto out_dma_buf_put;
+	}
+
+	dma_block = dmabuf->priv;
+
+	if (iio_dmabuf->bytes_used > dma_block->size) {
+		ret = -EINVAL;
+		goto out_dma_buf_put;
+	}
+
+	dma_block->bytes_used = iio_dmabuf->bytes_used ?: dma_block->size;
+
+	switch (dma_block->state) {
+	case IIO_BLOCK_STATE_QUEUED:
+		/* Nothing to do */
+		goto out_unlock;
+	case IIO_BLOCK_STATE_DONE:
+		break;
+	default:
+		ret = -EBUSY;
+		goto out_dma_buf_put;
+	}
+
+	fence = iio_dma_buffer_create_dma_fence(dma_block);
+	if (IS_ERR(fence)) {
+		ret = PTR_ERR(fence);
+		goto out_dma_buf_put;
+	}
+
+	dma_resv_lock(dmabuf->resv, NULL);
+	dma_resv_add_excl_fence(dmabuf->resv, fence);
+	dma_resv_unlock(dmabuf->resv);
+
+	iio_dma_buffer_enqueue(queue, dma_block);
+
+out_dma_buf_put:
+	dma_buf_put(dmabuf);
+out_unlock:
+	mutex_unlock(&queue->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_enqueue_dmabuf);
+
 /**
  * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
  * @buffer: Buffer to set the bytes-per-datum for
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 22effd6cfbb6..85e55fe35282 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -42,6 +42,7 @@ enum iio_block_state {
  * @phys_addr: Physical address of the blocks memory
  * @queue: Parent DMA buffer queue
  * @state: Current state of the block
+ * @fileio: True if this buffer is used for fileio mode
  * @dmabuf: Underlying DMABUF object
  */
 struct iio_dma_buffer_block {
@@ -64,6 +65,7 @@ struct iio_dma_buffer_block {
 	 */
 	enum iio_block_state state;
 
+	bool fileio;
 	struct dma_buf *dmabuf;
 };
 
@@ -74,6 +76,7 @@ struct iio_dma_buffer_block {
  * @pos: Read offset in the active block
  * @block_size: Size of each block
  * @next_dequeue: index of next block that will be dequeued
+ * @enabled: Whether the buffer is operating in fileio mode
  */
 struct iio_dma_buffer_queue_fileio {
 	struct iio_dma_buffer_block *blocks[2];
@@ -82,6 +85,7 @@ struct iio_dma_buffer_queue_fileio {
 	size_t block_size;
 
 	unsigned int next_dequeue;
+	bool enabled;
 };
 
 /**
@@ -96,6 +100,8 @@ struct iio_dma_buffer_queue_fileio {
  *   list and typically also a list of active blocks in the part that handles
  *   the DMA controller
  * @active: Whether the buffer is currently active
+ * @num_blocks: Total number of blocks in the queue
+ * @num_fileio_blocks: Number of blocks used for fileio interface
  * @fileio: FileIO state
  */
 struct iio_dma_buffer_queue {
@@ -107,6 +113,8 @@ struct iio_dma_buffer_queue {
 	spinlock_t list_lock;
 
 	bool active;
+	unsigned int num_blocks;
+	unsigned int num_fileio_blocks;
 
 	struct iio_dma_buffer_queue_fileio fileio;
 };
@@ -149,4 +157,9 @@ static inline size_t iio_dma_buffer_space_available(struct iio_buffer *buffer)
 	return iio_dma_buffer_data_available(buffer);
 }
 
+int iio_dma_buffer_alloc_dmabuf(struct iio_buffer *buffer,
+				struct iio_dmabuf_alloc_req *req);
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dmabuf *dmabuf);
+
 #endif
-- 
2.33.0

