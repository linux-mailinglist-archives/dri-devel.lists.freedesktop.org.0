Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B786D4C65
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 17:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91B710E4FA;
	Mon,  3 Apr 2023 15:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C935110E4FA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 15:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1680536896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1izcu1WFEt9b1dtaujjpu20y6Ear8HIPhk9DR+eEyjM=;
 b=ljgwlqlOwZPST5STP6Sk4GHJKbrMKG5ReGJabr5s0M0POrNRwMlcE5iLbGkjAlBWFz08+P
 mzOQJUEgkqfIHSpAqJ2U48K6q3p9wQ4qBCRd2985d+9uzvma4lGF12cT+b0sXnwsdiV9Y9
 YSOUIkyiHi6PxtZYIDww20BXOKiAr5s=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 05/11] iio: buffer-dmaengine: Support specifying buffer
 direction
Date: Mon,  3 Apr 2023 17:47:54 +0200
Message-Id: <20230403154800.215924-6-paul@crapouillou.net>
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
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the devm_iio_dmaengine_buffer_setup() function to support
specifying the buffer direction.

Update the iio_dmaengine_buffer_submit() function to handle input
buffers as well as output buffers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 drivers/iio/adc/adi-axi-adc.c                 |  3 ++-
 .../buffer/industrialio-buffer-dmaengine.c    | 24 +++++++++++++++----
 include/linux/iio/buffer-dmaengine.h          |  5 +++-
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index e8a8ea4140f1..d33574b5417a 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -114,7 +114,8 @@ static int adi_axi_adc_config_dma_buffer(struct device *dev,
 		dma_name = "rx";
 
 	return devm_iio_dmaengine_buffer_setup(indio_dev->dev.parent,
-					       indio_dev, dma_name);
+					       indio_dev, dma_name,
+					       IIO_BUFFER_DIRECTION_IN);
 }
 
 static int adi_axi_adc_read_raw(struct iio_dev *indio_dev,
diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index 5f85ba38e6f6..592d2aa9044c 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -64,14 +64,25 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 	struct dmaengine_buffer *dmaengine_buffer =
 		iio_buffer_to_dmaengine_buffer(&queue->buffer);
 	struct dma_async_tx_descriptor *desc;
+	enum dma_transfer_direction dma_dir;
+	size_t max_size;
 	dma_cookie_t cookie;
 
-	block->bytes_used = min(block->size, dmaengine_buffer->max_size);
-	block->bytes_used = round_down(block->bytes_used,
-			dmaengine_buffer->align);
+	max_size = min(block->size, dmaengine_buffer->max_size);
+	max_size = round_down(max_size, dmaengine_buffer->align);
+
+	if (queue->buffer.direction == IIO_BUFFER_DIRECTION_IN) {
+		block->bytes_used = max_size;
+		dma_dir = DMA_DEV_TO_MEM;
+	} else {
+		dma_dir = DMA_MEM_TO_DEV;
+	}
+
+	if (!block->bytes_used || block->bytes_used > max_size)
+		return -EINVAL;
 
 	desc = dmaengine_prep_slave_single(dmaengine_buffer->chan,
-		block->phys_addr, block->bytes_used, DMA_DEV_TO_MEM,
+		block->phys_addr, block->bytes_used, dma_dir,
 		DMA_PREP_INTERRUPT);
 	if (!desc)
 		return -ENOMEM;
@@ -275,7 +286,8 @@ static struct iio_buffer *devm_iio_dmaengine_buffer_alloc(struct device *dev,
  */
 int devm_iio_dmaengine_buffer_setup(struct device *dev,
 				    struct iio_dev *indio_dev,
-				    const char *channel)
+				    const char *channel,
+				    enum iio_buffer_direction dir)
 {
 	struct iio_buffer *buffer;
 
@@ -286,6 +298,8 @@ int devm_iio_dmaengine_buffer_setup(struct device *dev,
 
 	indio_dev->modes |= INDIO_BUFFER_HARDWARE;
 
+	buffer->direction = dir;
+
 	return iio_device_attach_buffer(indio_dev, buffer);
 }
 EXPORT_SYMBOL_GPL(devm_iio_dmaengine_buffer_setup);
diff --git a/include/linux/iio/buffer-dmaengine.h b/include/linux/iio/buffer-dmaengine.h
index 5c355be89814..538d0479cdd6 100644
--- a/include/linux/iio/buffer-dmaengine.h
+++ b/include/linux/iio/buffer-dmaengine.h
@@ -7,11 +7,14 @@
 #ifndef __IIO_DMAENGINE_H__
 #define __IIO_DMAENGINE_H__
 
+#include <linux/iio/buffer.h>
+
 struct iio_dev;
 struct device;
 
 int devm_iio_dmaengine_buffer_setup(struct device *dev,
 				    struct iio_dev *indio_dev,
-				    const char *channel);
+				    const char *channel,
+				    enum iio_buffer_direction dir);
 
 #endif
-- 
2.39.2

