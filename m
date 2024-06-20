Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F39103F7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 14:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6461910E97C;
	Thu, 20 Jun 2024 12:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="Sv5wT4DB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5401F10E96F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1718886466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJGLLTUoKxRUUmCuADS9MQUDO1mER8ltDHfR++/AYpU=;
 b=Sv5wT4DBjXVp0rzIgUUmi9dT53xZpxMKRu4oDY7NC2C0Vd149v2WsRuP186VZbzCT3xkfy
 cbQToYE30ZYhPOY3tprXxL+4tYfp6Tb36Pc5xW3SbZbMgV7N8D+0dIWXU/91oclQN4/Ye+
 JwHPYXa43UVTbSsWKEpnpFfVbrduXkM=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 4/7] iio: buffer-dma: Enable support for DMABUFs
Date: Thu, 20 Jun 2024 14:27:23 +0200
Message-ID: <20240620122726.41232-5-paul@crapouillou.net>
In-Reply-To: <20240620122726.41232-1-paul@crapouillou.net>
References: <20240620122726.41232-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
DMA buffer implementations.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Co-developed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>

---
v3: Update code to provide the functions that will be used as callbacks
    for the new IOCTLs.

v6: - Update iio_dma_buffer_enqueue_dmabuf() to take a dma_fence pointer
    - Pass that dma_fence pointer along to
      iio_buffer_signal_dmabuf_done()
    - Add iio_dma_buffer_lock_queue() / iio_dma_buffer_unlock_queue()
    - Do not lock the queue in iio_dma_buffer_enqueue_dmabuf().
      The caller will ensure that it has been locked already.
    - Replace "int += bool;" by "if (bool) int++;"
    - Use dma_fence_begin/end_signalling in the dma_fence critical
      sections
    - Use one "num_dmabufs" fields instead of one "num_blocks" and one
      "num_fileio_blocks". Make it an atomic_t, which makes it possible
      to decrement it atomically in iio_buffer_block_release() without
      having to lock the queue mutex; and in turn, it means that we
      don't need to use iio_buffer_block_put_atomic() everywhere to
      avoid locking the queue mutex twice.
    - Use cleanup.h guard(mutex) when possible
    - Explicitely list all states in the switch in
      iio_dma_can_enqueue_block()
    - Rename iio_dma_buffer_fileio_mode() to
      iio_dma_buffer_can_use_fileio(), and add a comment explaining why
      it cannot race vs. DMABUF.

v11:
    - Remove useless field "attach" in struct iio_dma_buffer_block
    - Document "sg_table" and "fence" fields in struct iio_block_state
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 178 +++++++++++++++++--
 include/linux/iio/buffer-dma.h               |  31 ++++
 2 files changed, 198 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 13b1a858969e..647f417a045e 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -4,6 +4,8 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/atomic.h>
+#include <linux/cleanup.h>
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -14,6 +16,8 @@
 #include <linux/poll.h>
 #include <linux/iio/buffer_impl.h>
 #include <linux/iio/buffer-dma.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-fence.h>
 #include <linux/dma-mapping.h>
 #include <linux/sizes.h>
 
@@ -94,13 +98,18 @@ static void iio_buffer_block_release(struct kref *kref)
 {
 	struct iio_dma_buffer_block *block = container_of(kref,
 		struct iio_dma_buffer_block, kref);
+	struct iio_dma_buffer_queue *queue = block->queue;
 
-	WARN_ON(block->state != IIO_BLOCK_STATE_DEAD);
+	WARN_ON(block->fileio && block->state != IIO_BLOCK_STATE_DEAD);
 
-	dma_free_coherent(block->queue->dev, PAGE_ALIGN(block->size),
-					block->vaddr, block->phys_addr);
+	if (block->fileio) {
+		dma_free_coherent(queue->dev, PAGE_ALIGN(block->size),
+				  block->vaddr, block->phys_addr);
+	} else {
+		atomic_dec(&queue->num_dmabufs);
+	}
 
-	iio_buffer_put(&block->queue->buffer);
+	iio_buffer_put(&queue->buffer);
 	kfree(block);
 }
 
@@ -163,7 +172,7 @@ static struct iio_dma_buffer_queue *iio_buffer_to_queue(struct iio_buffer *buf)
 }
 
 static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
-	struct iio_dma_buffer_queue *queue, size_t size)
+	struct iio_dma_buffer_queue *queue, size_t size, bool fileio)
 {
 	struct iio_dma_buffer_block *block;
 
@@ -171,13 +180,16 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
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
@@ -186,6 +198,9 @@ static struct iio_dma_buffer_block *iio_dma_buffer_alloc_block(
 
 	iio_buffer_get(&queue->buffer);
 
+	if (!fileio)
+		atomic_inc(&queue->num_dmabufs);
+
 	return block;
 }
 
@@ -218,13 +233,20 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 {
 	struct iio_dma_buffer_queue *queue = block->queue;
 	unsigned long flags;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(&queue->list_lock, flags);
 	_iio_dma_buffer_block_done(block);
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	if (!block->fileio)
+		iio_buffer_signal_dmabuf_done(block->fence, 0);
+
 	iio_buffer_block_put_atomic(block);
 	iio_dma_buffer_queue_wake(queue);
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
 
@@ -243,17 +265,27 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 {
 	struct iio_dma_buffer_block *block, *_block;
 	unsigned long flags;
+	bool cookie;
+
+	cookie = dma_fence_begin_signalling();
 
 	spin_lock_irqsave(&queue->list_lock, flags);
 	list_for_each_entry_safe(block, _block, list, head) {
 		list_del(&block->head);
 		block->bytes_used = 0;
 		_iio_dma_buffer_block_done(block);
+
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->fence, -EINTR);
 		iio_buffer_block_put_atomic(block);
 	}
 	spin_unlock_irqrestore(&queue->list_lock, flags);
 
+	if (queue->fileio.enabled)
+		queue->fileio.enabled = false;
+
 	iio_dma_buffer_queue_wake(queue);
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
 
@@ -273,6 +305,16 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
 	}
 }
 
+static bool iio_dma_buffer_can_use_fileio(struct iio_dma_buffer_queue *queue)
+{
+	/*
+	 * Note that queue->num_dmabufs cannot increase while the queue is
+	 * locked, it can only decrease, so it does not race against
+	 * iio_dma_buffer_alloc_block().
+	 */
+	return queue->fileio.enabled || !atomic_read(&queue->num_dmabufs);
+}
+
 /**
  * iio_dma_buffer_request_update() - DMA buffer request_update callback
  * @buffer: The buffer which to request an update
@@ -299,6 +341,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
 	mutex_lock(&queue->lock);
 
+	queue->fileio.enabled = iio_dma_buffer_can_use_fileio(queue);
+
+	/* If DMABUFs were created, disable fileio interface */
+	if (!queue->fileio.enabled)
+		goto out_unlock;
+
 	/* Allocations are page aligned */
 	if (PAGE_ALIGN(queue->fileio.block_size) == PAGE_ALIGN(size))
 		try_reuse = true;
@@ -339,7 +387,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 		}
 
 		if (!block) {
-			block = iio_dma_buffer_alloc_block(queue, size);
+			block = iio_dma_buffer_alloc_block(queue, size, true);
 			if (!block) {
 				ret = -ENOMEM;
 				goto out_unlock;
@@ -412,8 +460,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 
 	block->state = IIO_BLOCK_STATE_ACTIVE;
 	iio_buffer_block_get(block);
+
 	ret = queue->ops->submit(queue, block);
 	if (ret) {
+		if (!block->fileio)
+			iio_buffer_signal_dmabuf_done(block->fence, ret);
+
 		/*
 		 * This is a bit of a problem and there is not much we can do
 		 * other then wait for the buffer to be disabled and re-enabled
@@ -646,6 +698,110 @@ size_t iio_dma_buffer_usage(struct iio_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_usage);
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	struct iio_dma_buffer_block *block;
+
+	guard(mutex)(&queue->lock);
+
+	/*
+	 * If the buffer is enabled and in fileio mode new blocks can't be
+	 * allocated.
+	 */
+	if (queue->fileio.enabled)
+		return ERR_PTR(-EBUSY);
+
+	block = iio_dma_buffer_alloc_block(queue, attach->dmabuf->size, false);
+	if (!block)
+		return ERR_PTR(-ENOMEM);
+
+	/* Free memory that might be in use for fileio mode */
+	iio_dma_buffer_fileio_free(queue);
+
+	return block;
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
+	case IIO_BLOCK_STATE_ACTIVE:
+	case IIO_BLOCK_STATE_DEAD:
+		return -EBUSY;
+	case IIO_BLOCK_STATE_DONE:
+		break;
+	}
+
+	return 0;
+}
+
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct dma_fence *fence,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+	bool cookie;
+	int ret;
+
+	WARN_ON(!mutex_is_locked(&queue->lock));
+
+	cookie = dma_fence_begin_signalling();
+
+	ret = iio_dma_can_enqueue_block(block);
+	if (ret < 0)
+		goto out_end_signalling;
+
+	block->bytes_used = size;
+	block->cyclic = cyclic;
+	block->sg_table = sgt;
+	block->fence = fence;
+
+	iio_dma_buffer_enqueue(queue, block);
+
+out_end_signalling:
+	dma_fence_end_signalling(cookie);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_enqueue_dmabuf);
+
+void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+
+	mutex_lock(&queue->lock);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_lock_queue);
+
+void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
+{
+	struct iio_dma_buffer_queue *queue = iio_buffer_to_queue(buffer);
+
+	mutex_unlock(&queue->lock);
+}
+EXPORT_SYMBOL_GPL(iio_dma_buffer_unlock_queue);
+
 /**
  * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
  * @buffer: Buffer to set the bytes-per-datum for
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index 6e27e47077d5..5eb66a399002 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -7,6 +7,7 @@
 #ifndef __INDUSTRIALIO_DMA_BUFFER_H__
 #define __INDUSTRIALIO_DMA_BUFFER_H__
 
+#include <linux/atomic.h>
 #include <linux/list.h>
 #include <linux/kref.h>
 #include <linux/spinlock.h>
@@ -16,6 +17,9 @@
 struct iio_dma_buffer_queue;
 struct iio_dma_buffer_ops;
 struct device;
+struct dma_buf_attachment;
+struct dma_fence;
+struct sg_table;
 
 /**
  * enum iio_block_state - State of a struct iio_dma_buffer_block
@@ -41,6 +45,10 @@ enum iio_block_state {
  * @queue: Parent DMA buffer queue
  * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @cyclic: True if this is a cyclic buffer
+ * @fileio: True if this buffer is used for fileio mode
+ * @sg_table: DMA table for the transfer when transferring a DMABUF
+ * @fence: DMA fence to be signaled when a DMABUF transfer is complete
  */
 struct iio_dma_buffer_block {
 	/* May only be accessed by the owner of the block */
@@ -63,6 +71,12 @@ struct iio_dma_buffer_block {
 	 * queue->list_lock if the block is not owned by the core.
 	 */
 	enum iio_block_state state;
+
+	bool cyclic;
+	bool fileio;
+
+	struct sg_table *sg_table;
+	struct dma_fence *fence;
 };
 
 /**
@@ -72,6 +86,7 @@ struct iio_dma_buffer_block {
  * @pos: Read offset in the active block
  * @block_size: Size of each block
  * @next_dequeue: index of next block that will be dequeued
+ * @enabled: Whether the buffer is operating in fileio mode
  */
 struct iio_dma_buffer_queue_fileio {
 	struct iio_dma_buffer_block *blocks[2];
@@ -80,6 +95,7 @@ struct iio_dma_buffer_queue_fileio {
 	size_t block_size;
 
 	unsigned int next_dequeue;
+	bool enabled;
 };
 
 /**
@@ -95,6 +111,7 @@ struct iio_dma_buffer_queue_fileio {
  *   the DMA controller
  * @incoming: List of buffers on the incoming queue
  * @active: Whether the buffer is currently active
+ * @num_dmabufs: Total number of DMABUFs attached to this queue
  * @fileio: FileIO state
  */
 struct iio_dma_buffer_queue {
@@ -107,6 +124,7 @@ struct iio_dma_buffer_queue {
 	struct list_head incoming;
 
 	bool active;
+	atomic_t num_dmabufs;
 
 	struct iio_dma_buffer_queue_fileio fileio;
 };
@@ -144,4 +162,17 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
 void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue);
 void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue);
 
+struct iio_dma_buffer_block *
+iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
+			     struct dma_buf_attachment *attach);
+void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block);
+int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
+				  struct iio_dma_buffer_block *block,
+				  struct dma_fence *fence,
+				  struct sg_table *sgt,
+				  size_t size, bool cyclic);
+void iio_dma_buffer_lock_queue(struct iio_buffer *buffer);
+void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer);
+
 #endif
-- 
2.43.0

