Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DCF6D4C6E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 766C210E4F4;
	Mon,  3 Apr 2023 15:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADC810E4F4
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680536903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8PmkZdIE9FdBhRGx72/sSOhDClhx1FbzE4O+lf4iMcM=;
 b=v87QroxueeO0YCfxdu0pF1xJuArsC0IP3ZOO9nK0wsf3sliLSUuDXcMoFI4vtoWFKqIXci
 pwNK4YZimP0gO1fZER+tmONttpzCVbXYeafzeiKzS18/7WPikxoICX0hFErjvw63SKc7dV
 VSH1pzCWw0WqB3OJpK8ExkY/vxBXhr4=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 09/11] iio: buffer-dma: Enable support for DMABUFs
Date: Mon,  3 Apr 2023 17:47:58 +0200
Message-Id: <20230403154800.215924-10-paul@crapouillou.net>
In-Reply-To: <20230403154800.215924-1-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
DMA buffer implementations.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v3: Update code to provide the functions that will be used as callbacks
for the new IOCTLs.
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 157 +++++++++++++++++--
 include/linux/iio/buffer-dma.h               |  24 +++
 2 files changed, 168 insertions(+), 13 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index e14814e0d4c8..422bd784fd1e 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -14,6 +14,7 @@
 #include <linux/poll.h>
 #include <linux/iio/buffer_impl.h>
 #include <linux/iio/buffer-dma.h>
+#include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
 #include <linux/sizes.h>
 
@@ -94,14 +95,24 @@ static void iio_buffer_block_release(struct kref *kref)
 {
 	struct iio_dma_buffer_block *block = container_of(kref,
 		struct iio_dma_buffer_block, kref);
+	struct iio_dma_buffer_queue *queue = block->queue;
 
-	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
+	WARN_ON(block->fileio && block->state != IIO_BLOCK_STATE_DEAD);
 
-	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
-					block->vaddr, block->phys_addr);
+	mutex_lock(&queue->lock);
 
-	iio_buffer_put(&block->queue->buffer);
+	if (block->fileio) {
+		dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
+				  block->vaddr, block->phys_addr);
+		queue->num_fileio_blocks--;
+	}
+
+	queue->num_blocks--;
 	kfree(block);
+
+	mutex_unlock(&queue->lock);
+
+	iio_buffer_put(&queue->buffer);
 }
 
 static void iio_buffer_block_get(struct iio_dma_buffer_block *block)
@@ -163,7 +174,7 @@ static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
 }
 
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
-	struct iio_dma_buffer_queue *queue, size_t size)
+	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
 {
 	struct iio_dma_buffer_block *block;
 
@@ -171,13 +182,16 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 	if (!block)
 		return NULL;
 
-	block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
-		&block->phys_addr, GFP_KERNEL);
-	if (!block->vaddr) {
-		kfree(block);
-		return NULL;
+	if (fileio) {
+		block->vaddr = dma_alloc_coherent(queue->dev, PAGE_ALIGN(size),
+						  &block->phys_addr, GFP_KERNEL);
+		if (!block->vaddr) {
+			kfree(block);
+			return NULL;
+		}
 	}
 
+	block->fileio = fileio;
 	block->size = size;
 	block->state = IIO_BLOCK_STATE_DONE;
 	block->queue = queue;
@@ -186,6 +200,9 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 
 	iio_buffer_get(&queue->buffer);
 
+	queue->num_blocks++;
+	queue->num_fileio_blocks += fileio;
+
 	return block;
 }
 
@@ -223,6 +240,9 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 	_iio_dma_buffer_block_done(block);
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	if (!block->fileio)
+		iio_buffer_signal_dmabuf_done(block->attach, 0);
+
 	iio_buffer_block_put_atomic(block);
 	iio_dma_buffer_queue_wake(queue);
 }
@@ -249,10 +269,14 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 		list_del(&block->head);
 		block->bytes_used = 0;
 		_iio_dma_buffer_block_done(block);
+
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->attach, -EINTR);
 		iio_buffer_block_put_atomic(block);
 	}
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	queue->fileio.enabled = false;
 	iio_dma_buffer_queue_wake(queue);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
@@ -273,6 +297,12 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
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
@@ -299,6 +329,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
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
@@ -329,7 +365,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 			block = queue->fileio.blocks[i];
 			if (block->state == IIO_BLOCK_STATE_DEAD) {
 				/* Could not reuse it */
-				iio_buffer_block_put(block);
+				iio_buffer_block_put_atomic(block);
 				block = NULL;
 			} else {
 				block->size = size;
@@ -339,7 +375,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 		}
 
 		if (!block) {
-			block = iio_dma_buffer_alloc_block(queue, size);
+			block = iio_dma_buffer_alloc_block(queue, size, true);
 			if (!block) {
 				ret = -ENOMEM;
 				goto out_unlock;
@@ -391,7 +427,7 @@ static void iio_dma_buffer_fileio_free(struct iio_dma_buffer_queue *queue)
 	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
 		if (!queue->fileio.blocks[i])
 			continue;
-		iio_buffer_block_put(queue->fileio.blocks[i]);
+		iio_buffer_block_put_atomic(queue->fileio.blocks[i]);
 		queue->fileio.blocks[i] = NULL;
 	}
 	queue->fileio.active_block = NULL;
@@ -412,8 +448,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 
 	block->state = IIO_BLOCK_STATE_ACTIVE;
 	iio_buffer_block_get(block);
+
 	ret = queue->ops->submit(queue, block);
 	if (ret) {
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->attach, ret);
+
 		/*
 		 * This is a bit of a problem and there is not much we can do
 		 * other then wait for the buffer to be disabled and re-enabled
@@ -645,6 +685,97 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_data_available);
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	struct iio_dma_buffer_block *block;
+	int err;
+
+	mutex_lock(&queue->lock);
+
+	/*
+	 * If the buffer is enabled and in fileio mode new blocks can't be
+	 * allocated.
+	 */
+	if (queue->fileio.enabled) {
+		err = -EBUSY;
+		goto err_unlock;
+	}
+
+	block = iio_dma_buffer_alloc_block(queue, attach->dmabuf->size, false);
+	if (!block) {
+		err = -ENOMEM;
+		goto err_unlock;
+	}
+
+	block->attach = attach;
+
+	/* Free memory that might be in use for fileio mode */
+	iio_dma_buffer_fileio_free(queue);
+
+	mutex_unlock(&queue->lock);
+
+	return block;
+
+err_unlock:
+	mutex_unlock(&queue->lock);
+	return ERR_PTR(err);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_attach_dmabuf);
+
+void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block)
+{
+	block->state = IIO_BLOCK_STATE_DEAD;
+	iio_buffer_block_put_atomic(block);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_detach_dmabuf);
+
+static int iio_dma_can_enqueue_block(struct iio_dma_buffer_block *block)
+{
+	struct iio_dma_buffer_queue *queue = block->queue;
+
+	/* If in fileio mode buffers can't be enqueued. */
+	if (queue->fileio.enabled)
+		return -EBUSY;
+
+	switch (block->state) {
+	case IIO_BLOCK_STATE_QUEUED:
+		return -EPERM;
+	case IIO_BLOCK_STATE_DONE:
+		return 0;
+	default:
+		return -EBUSY;
+	}
+}
+
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	int ret = 0;
+
+	mutex_lock(&queue->lock);
+	ret = iio_dma_can_enqueue_block(block);
+	if (ret < 0)
+		goto out_mutex_unlock;
+
+	block->bytes_used = size;
+	block->cyclic = cyclic;
+	block->sg_table = sgt;
+
+	iio_dma_buffer_enqueue(queue, block);
+
+out_mutex_unlock:
+	mutex_unlock(&queue->lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_enqueue_dmabuf);
+
 /**
  * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
  * @buffer: Buffer to set the bytes-per-datum for
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 490b93f76fa8..e5e5817e99db 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -16,6 +16,8 @@
 struct iio_dma_buffer_queue;
 struct iio_dma_buffer_ops;
 struct device;
+struct dma_buf_attachment;
+struct sg_table;
 
 /**
  * enum iio_block_state - State of a struct iio_dma_buffer_block
@@ -41,6 +43,7 @@ enum iio_block_state {
  * @queue: Parent DMA buffer queue
  * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @fileio: True if this buffer is used for fileio mode
  */
 struct iio_dma_buffer_block {
 	/* May only be accessed by the owner of the block */
@@ -63,6 +66,11 @@ struct iio_dma_buffer_block {
 	 * queue->list_lock if the block is not owned by the core.
 	 */
 	enum iio_block_state state;
+
+	bool fileio;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sg_table;
 };
 
 /**
@@ -72,6 +80,7 @@ struct iio_dma_buffer_block {
  * @pos: Read offset in the active block
  * @block_size: Size of each block
  * @next_dequeue: index of next block that will be dequeued
+ * @enabled: Whether the buffer is operating in fileio mode
  */
 struct iio_dma_buffer_queue_fileio {
 	struct iio_dma_buffer_block *blocks[2];
@@ -80,6 +89,7 @@ struct iio_dma_buffer_queue_fileio {
 	size_t block_size;
 
 	unsigned int next_dequeue;
+	bool enabled;
 };
 
 /**
@@ -95,6 +105,8 @@ struct iio_dma_buffer_queue_fileio {
  *   the DMA controller
  * @incoming: List of buffers on the incoming queue
  * @active: Whether the buffer is currently active
+ * @num_blocks: Total number of DMA blocks
+ * @num_fileio_blocks: Number of DMA blocks for fileio mode
  * @fileio: FileIO state
  */
 struct iio_dma_buffer_queue {
@@ -107,6 +119,8 @@ struct iio_dma_buffer_queue {
 	struct list_head incoming;
 
 	bool active;
+	unsigned int num_blocks;
+	unsigned int num_fileio_blocks;
 
 	struct iio_dma_buffer_queue_fileio fileio;
 };
@@ -149,4 +163,14 @@ static inline size_t iio_dma_buffer_space_available(struct iio_buffer *buffer)
 	return iio_dma_buffer_data_available(buffer);
 }
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach);
+void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block);
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic);
+
 #endif
-- 
2.39.2

