Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FF1818EA7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 18:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590A10E4DA;
	Tue, 19 Dec 2023 17:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E4010E4DA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1703008220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oGRsJ+tJFINsq/9OPmu94IJFWwVMC9QjYHPIQeMCNU4=;
 b=MuLGfssg4c9uqlHRE79Zan0YaFSA3PIM61XIkgjxelhw2LYPW8Jn5pJTAmN0n8UE/9AEV0
 I6LySUbuJkX7pS6REh3X6KUQauCdJbZajVCIWXQ3CmRo01P3enWEBItJwTkaJO7etrVqF7
 H6+2m5ML39bNO7JhosPuSzW5yinBUbo=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v5 2/8] iio: buffer-dma: split iio_dma_buffer_fileio_free()
 function
Date: Tue, 19 Dec 2023 18:50:03 +0100
Message-ID: <20231219175009.65482-3-paul@crapouillou.net>
In-Reply-To: <20231219175009.65482-1-paul@crapouillou.net>
References: <20231219175009.65482-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>, dmaengine@vger.kernel.org,
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexandru Ardelean <alexandru.ardelean@analog.com>

This change splits the logic into a separate function, which will be
re-used later.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 43 +++++++++++---------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index 1fc91467d1aa..5610ba67925e 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -346,6 +346,29 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 }
 EXPORT_SYMBOL_GPL(iio_dma_buffer_request_update);
 
+static void iio_dma_buffer_fileio_free(struct iio_dma_buffer_queue *queue)
+{
+	unsigned int i;
+
+	spin_lock_irq(&queue->list_lock);
+	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
+		if (!queue->fileio.blocks[i])
+			continue;
+		queue->fileio.blocks[i]->state = IIO_BLOCK_STATE_DEAD;
+	}
+	spin_unlock_irq(&queue->list_lock);
+
+	INIT_LIST_HEAD(&queue->incoming);
+
+	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
+		if (!queue->fileio.blocks[i])
+			continue;
+		iio_buffer_block_put(queue->fileio.blocks[i]);
+		queue->fileio.blocks[i] = NULL;
+	}
+	queue->fileio.active_block = NULL;
+}
+
 static void iio_dma_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 	struct iio_dma_buffer_block *block)
 {
@@ -638,27 +661,9 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_init);
  */
 void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue)
 {
-	unsigned int i;
-
 	mutex_lock(&queue->lock);
 
-	spin_lock_irq(&queue->list_lock);
-	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
-		if (!queue->fileio.blocks[i])
-			continue;
-		queue->fileio.blocks[i]->state = IIO_BLOCK_STATE_DEAD;
-	}
-	spin_unlock_irq(&queue->list_lock);
-
-	INIT_LIST_HEAD(&queue->incoming);
-
-	for (i = 0; i < ARRAY_SIZE(queue->fileio.blocks); i++) {
-		if (!queue->fileio.blocks[i])
-			continue;
-		iio_buffer_block_put(queue->fileio.blocks[i]);
-		queue->fileio.blocks[i] = NULL;
-	}
-	queue->fileio.active_block = NULL;
+	iio_dma_buffer_fileio_free(queue);
 	queue->ops = NULL;
 
 	mutex_unlock(&queue->lock);
-- 
2.43.0

