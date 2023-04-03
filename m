Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EE46D4C69
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEBE10E501;
	Mon,  3 Apr 2023 15:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF1810E501
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680536901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beF+K1NHWP/zsnX7POz8yyiiOBr7zCFi5ikb61FvcI4=;
 b=rEQlu75pE1XlxvEiW2Vp6Q2DrJqFlXQRWGAGO/qViDKRDquUpd4KRJ2jtCkCphUkqIMmkc
 kCibghuDBjplYnoTYkLj+VJLDOiOKickpRJaP+TywS3SWmlYLN2xIf8YpVNxnxU3wY3Pj7
 8OG7sKOHPKMOxagqrUvT8h8+0YtaZik=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 08/11] iio: buffer-dma: split iio_dma_buffer_fileio_free()
 function
Date: Mon,  3 Apr 2023 17:47:57 +0200
Message-Id: <20230403154800.215924-9-paul@crapouillou.net>
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
 linaro-mm-sig@lists.linaro.org, Alexandru Ardelean <ardeleanalex@gmail.com>,
 dmaengine@vger.kernel.org, Alexandru Ardelean <alexandru.ardelean@analog.com>,
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
index 86eced458236..e14814e0d4c8 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -374,6 +374,29 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
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
@@ -695,27 +718,9 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_init);
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
2.39.2

