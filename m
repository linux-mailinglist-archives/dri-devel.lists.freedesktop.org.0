Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7074ABEB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 14:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAE810F619;
	Mon,  7 Feb 2022 13:00:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3432E10F619
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 13:00:24 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>
Subject: [PATCH v2 06/12] iio: buffer-dma: split iio_dma_buffer_fileio_free()
 function
Date: Mon,  7 Feb 2022 12:59:27 +0000
Message-Id: <20220207125933.81634-7-paul@crapouillou.net>
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
 Alexandru Ardelean <alexandru.ardelean@analog.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexandru Ardelean <alexandru.ardelean@analog.com>

A part of the logic in the iio_dma_buffer_exit() is required for the change
to add mmap support to IIO buffers.
This change splits the logic into a separate function, which will be
re-used later.

Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/iio/buffer/industrialio-buffer-dma.c | 43 +++++++++++---------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index a9f1b673374f..15ea7bc3ac08 100644
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
@@ -694,27 +717,9 @@ EXPORT_SYMBOL_GPL(iio_dma_buffer_init);
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
2.34.1

