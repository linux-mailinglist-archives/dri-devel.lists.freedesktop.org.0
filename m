Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1B06D4C78
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7EB210E504;
	Mon,  3 Apr 2023 15:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6C10E516
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680537005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wA4riywwKKpvJAgChQaqtpae762HoiQ3X43R1omKQq4=;
 b=w2Vbrqzju+FpRpVjzxZ2RLYiP3a1YX0fUt98d/TwX/8ordZETUPCJEcVcrO40kky/ffb9S
 crFaELFhXS+K44RKouzy6bUJopS6o5LK2G4sSwcSpNycj2XHVf7p/0YKpt+mQ99jEQKCwj
 YMLN5v0VHzBRjP/xQ0K8kCdC+HOP350=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 10/11] iio: buffer-dmaengine: Support new DMABUF based
 userspace API
Date: Mon,  3 Apr 2023 17:49:54 +0200
Message-Id: <20230403154955.216148-1-paul@crapouillou.net>
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

Use the functions provided by the buffer-dma core to implement the
DMABUF userspace API in the buffer-dmaengine IIO buffer implementation.

Since we want to be able to transfer an arbitrary number of bytes and
not necesarily the full DMABUF, the associated scatterlist is converted
to an array of DMA addresses + lengths, which is then passed to
dmaengine_prep_slave_dma_array().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>

---
v3: Use the new dmaengine_prep_slave_dma_array(), and adapt the code to
    work with the new functions introduced in industrialio-buffer-dma.c.
---
 .../buffer/industrialio-buffer-dmaengine.c    | 69 ++++++++++++++++---
 include/linux/iio/buffer-dma.h                |  2 +
 2 files changed, 60 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index 866c8b84bb24..faed9c2b089c 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -65,25 +65,68 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 		iio_buffer_to_dmaengine_buffer(&queue->buffer);
 	struct dma_async_tx_descriptor *desc;
 	enum dma_transfer_direction dma_dir;
+	unsigned int i, nents, *lenghts;
+	struct scatterlist *sgl;
+	unsigned long flags;
+	dma_addr_t *addrs;
 	size_t max_size;
 	dma_cookie_t cookie;
+	size_t len_total;
 
-	max_size = min(block->size, dmaengine_buffer->max_size);
-	max_size = round_down(max_size, dmaengine_buffer->align);
+	if (!block->bytes_used)
+		return -EINVAL;
 
-	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
-		block->bytes_used = max_size;
+	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
 		dma_dir = DMA_DEV_TO_MEM;
-	} else {
+	else
 		dma_dir = DMA_MEM_TO_DEV;
-	}
 
-	if (!block->bytes_used || block->bytes_used > max_size)
-		return -EINVAL;
+	if (block->sg_table) {
+		sgl = block->sg_table->sgl;
+		nents = sg_nents_for_len(sgl, block->bytes_used);
+
+		addrs = kmalloc_array(nents, sizeof(*addrs), GFP_KERNEL);
+		if (!addrs)
+			return -ENOMEM;
+
+		lenghts = kmalloc_array(nents, sizeof(*lenghts), GFP_KERNEL);
+		if (!lenghts) {
+			kfree(addrs);
+			return -ENOMEM;
+		}
+
+		len_total = block->bytes_used;
 
-	desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
-		block->phys_addr, block->bytes_used, dma_dir,
-		DMA_PREP_INTERRUPT);
+		for (i = 0; i < nents; i++) {
+			addrs[i] = sg_dma_address(sgl);
+			lenghts[i] = min(sg_dma_len(sgl), len_total);
+			len_total -= lenghts[i];
+
+			sgl = sg_next(sgl);
+		}
+
+		flags = block->cyclic ? DMA_PREP_REPEAT : DMA_PREP_INTERRUPT;
+
+		desc = dmaengine_prep_slave_dma_array(dmaengine_buffer->chan,
+						      addrs, lenghts, nents,
+						      dma_dir, flags);
+		kfree(addrs);
+		kfree(lenghts);
+	} else {
+		max_size = min(block->size, dmaengine_buffer->max_size);
+		max_size = round_down(max_size, dmaengine_buffer->align);
+
+		if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN)
+			block->bytes_used = max_size;
+
+		if (block->bytes_used > max_size)
+			return -EINVAL;
+
+		desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
+						   block->phys_addr,
+						   block->bytes_used, dma_dir,
+						   DMA_PREP_INTERRUPT);
+	}
 	if (!desc)
 		return -ENOMEM;
 
@@ -133,6 +176,10 @@ static const struct iio_buffer_access_funcs iio_dmaengine_buffer_ops = {
 	.space_available = iio_dma_buffer_space_available,
 	.release = iio_dmaengine_buffer_release,
 
+	.enqueue_dmabuf = iio_dma_buffer_enqueue_dmabuf,
+	.attach_dmabuf = iio_dma_buffer_attach_dmabuf,
+	.detach_dmabuf = iio_dma_buffer_detach_dmabuf,
+
 	.modes = INDIO_BUFFER_HARDWARE,
 	.flags = INDIO_BUFFER_FLAG_FIXED_WATERMARK,
 };
diff --git a/include/linux/iio/buffer-dma.h b/include/linux/iio/buffer-dma.h
index e5e5817e99db..48f7ffaf0867 100644
--- a/include/linux/iio/buffer-dma.h
+++ b/include/linux/iio/buffer-dma.h
@@ -43,6 +43,7 @@ enum iio_block_state {
  * @queue: Parent DMA buffer queue
  * @kref: kref used to manage the lifetime of block
  * @state: Current state of the block
+ * @cyclic: True if this is a cyclic buffer
  * @fileio: True if this buffer is used for fileio mode
  */
 struct iio_dma_buffer_block {
@@ -67,6 +68,7 @@ struct iio_dma_buffer_block {
 	 */
 	enum iio_block_state state;
 
+	bool cyclic;
 	bool fileio;
 
 	struct dma_buf_attachment *attach;
-- 
2.39.2

