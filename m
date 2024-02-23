Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA8986130F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 14:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D910510EC0B;
	Fri, 23 Feb 2024 13:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=analog.com header.i=@analog.com header.b="SYZz4sp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A059310EC0B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:44:12 +0000 (UTC)
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41N6rd0k030350; Fri, 23 Feb 2024 07:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
 from:date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=DKIM; bh=caKbzzOgQcSL0nwDkNESBmj8xoOV5cNJB/71r9s4Wmk=; b=
 SYZz4sp/8RVCaAdkGjr2rxCs0UK9OMFMKVsp8dT8rsKGS7Pqiz6/gq2tNZquk2lR
 WpY4vaLzMxXxuIb6U4ET+9+hlv8RqpNe/j0TZvErH6r30y6W9XzxT98H8p0gjY3G
 vGuT0V2GRs6PAcqxxIS+ZivFxFZ1WOcwNbQYBNx8yfr0g0lCqzyEp3B/693wa/Qb
 CL5t1GN7ErWDFwBoBsK4y30PHfi/Ie7zRwwjskzwW6NhhCWCr4RXIydWHedXbwp9
 I6OxASyYbzzRdVnPjztRK5vbZYiFJwh3JeyDIuI9YwqG1D4QhBM9CbstQFN/3iAv
 7+53Wf5kHJRROMC9B2X23Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3wepgc11p7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 23 Feb 2024 07:11:21 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41NCB5rB033127
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 23 Feb 2024 07:11:05 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 23 Feb
 2024 07:11:04 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 23 Feb 2024 07:11:04 -0500
Received: from [127.0.0.1] ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41NCAb2V032246;
 Fri, 23 Feb 2024 07:10:58 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Fri, 23 Feb 2024 13:14:02 +0100
Subject: [PATCH v7 4/6] iio: buffer-dma: Enable support for DMABUFs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240223-iio-dmabuf-v7-4-78cfaad117b9@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708690439; l=12470;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=qkzQZP5LbzNx55b8OghG1F1wB4XBJJdReDWUW43Sz9Y=;
 b=PohMGitn+TnJk45lhJVfHh+SJFwKB0vQTdIIBn3pkVfEZ2bPv8UA9axgwWdrFFbxUmD+DuleR
 kqo8nNaZBb3DOhgBpWgZkMMk2J+jGbE7rpLDYRrsqyTObKl0nzPvFH3
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: QSyGBBlqywm1203IQ7EfbA5W64oHMtpw
X-Proofpoint-ORIG-GUID: QSyGBBlqywm1203IQ7EfbA5W64oHMtpw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230088
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

Implement iio_dma_buffer_attach_dmabuf(), iio_dma_buffer_detach_dmabuf()
and iio_dma_buffer_transfer_dmabuf(), which can then be used by the IIO
DMA buffer implementations.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 181 +++++++++++++++++++++++++--
 include/linux/iio/buffer-dma.h               |  31 +++++
 2 files changed, 201 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 5610ba67925e..c0f539af98f9 100644
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
 
@@ -206,13 +221,21 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
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
 	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
+
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_done);
 
@@ -231,17 +254,27 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
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
 	wake_up_interruptible_poll(&queue->buffer.pollq, EPOLLIN | EPOLLRDNORM);
+	dma_fence_end_signalling(cookie);
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_block_list_abort);
 
@@ -261,6 +294,16 @@ static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
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
@@ -287,6 +330,12 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
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
@@ -327,7 +376,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 		}
 
 		if (!block) {
-			block = iio_dma_buffer_alloc_block(queue, size);
+			block = iio_dma_buffer_alloc_block(queue, size, true);
 			if (!block) {
 				ret = -ENOMEM;
 				goto out_unlock;
@@ -384,8 +433,12 @@ static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 
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
@@ -588,6 +641,112 @@ size_t iio_dma_buffer_data_available(struct iio_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_data_available);
 
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
+	block->attach = attach;
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
index 18d3702fa95d..b62ff2a3f554 100644
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
@@ -41,6 +45,8 @@ enum iio_block_state {
  * @queue: Parent DMA buffer queue
  * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @cyclic: True if this is a cyclic buffer
+ * @fileio: True if this buffer is used for fileio mode
  */
 struct iio_dma_buffer_block {
 	/* May only be accessed by the owner of the block */
@@ -63,6 +69,14 @@ struct iio_dma_buffer_block {
 	 * queue->list_lock if the block is not owned by the core.
 	 */
 	enum iio_block_state state;
+
+	bool cyclic;
+	bool fileio;
+
+	struct dma_buf_attachment *attach;
+	struct sg_table *sg_table;
+
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
@@ -142,4 +160,17 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
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
2.43.2

