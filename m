Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485AE90C5B8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 12:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC589E59;
	Tue, 18 Jun 2024 10:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=crapouillou.net header.i=@crapouillou.net header.b="JN3FcudL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E5C10E0B4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1718704990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efgVLlNGDnopAmZBC5nh+wIIy52d8Py2hYi67rMzjJ0=;
 b=JN3FcudLNq/SSIZoMe8ldPeJhBQkpEe4d137sMJZXq/IGqeyiGifshBpfXtoUHzkd9+GzA
 NYbeTtTMPbu7nIepMZq8Kd54bZkAFaCDKOPYXJj3tj+GO9HnWdv5vAKQe5dTpnGr6kA1eW
 hu3oi1UCURO5Tf7hpUZTlGoaMUghfT8=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Vinod Koul <vkoul@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>,
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v11 1/7] dmaengine: Add API function
 dmaengine_prep_peripheral_dma_vec()
Date: Tue, 18 Jun 2024 12:02:56 +0200
Message-ID: <20240618100302.72886-2-paul@crapouillou.net>
In-Reply-To: <20240618100302.72886-1-paul@crapouillou.net>
References: <20240618100302.72886-1-paul@crapouillou.net>
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

This function can be used to initiate a scatter-gather DMA transfer,
where the address and size of each segment is located in one entry of
the dma_vec array.

The major difference with dmaengine_prep_slave_sg() is that it supports
specifying the lengths of each DMA transfer; as trying to override the
length of the transfer with dmaengine_prep_slave_sg() is a very tedious
process. The introduction of a new API function is also justified by the
fact that scatterlists are on their way out.

Note that dmaengine_prep_interleaved_dma() is not helpful either in that
case, as it assumes that the address of each segment will be higher than
the one of the previous segment, which we just cannot guarantee in case
of a scatter-gather transfer.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Co-developed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>

---
v3: New patch

v5: Replace with function dmaengine_prep_slave_dma_vec(), and struct
    'dma_vec'.
    Note that at some point we will need to support cyclic transfers
    using dmaengine_prep_slave_dma_vec(). Maybe with a new "flags"
    parameter to the function?

v7:
  - Renamed *device_prep_slave_dma_vec() -> device_prep_peripheral_dma_vec();
  - Added a new flag parameter to the function as agreed between Paul
    and Vinod. I renamed the first parameter to prep_flags as it's supposed to
    be used (I think) with enum dma_ctrl_flags. I'm not really sure how that API
    can grow but I was thinking in just having a bool cyclic parameter (as the
    first intention of the flags is to support cyclic transfers) but ended up
    "respecting" the previously agreed approach.

v10:
  - Add kernel doc to dmaengine_prep_peripheral_dma_vec()
  - Remove extra flags parameter
---
 include/linux/dmaengine.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 73537fddbb52..b137fdb56093 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -160,6 +160,16 @@ struct dma_interleaved_template {
 	struct data_chunk sgl[];
 };
 
+/**
+ * struct dma_vec - DMA vector
+ * @addr: Bus address of the start of the vector
+ * @len: Length in bytes of the DMA vector
+ */
+struct dma_vec {
+	dma_addr_t addr;
+	size_t len;
+};
+
 /**
  * enum dma_ctrl_flags - DMA flags to augment operation preparation,
  *  control completion, and communicate status.
@@ -910,6 +920,10 @@ struct dma_device {
 	struct dma_async_tx_descriptor *(*device_prep_dma_interrupt)(
 		struct dma_chan *chan, unsigned long flags);
 
+	struct dma_async_tx_descriptor *(*device_prep_peripheral_dma_vec)(
+		struct dma_chan *chan, const struct dma_vec *vecs,
+		size_t nents, enum dma_transfer_direction direction,
+		unsigned long flags);
 	struct dma_async_tx_descriptor *(*device_prep_slave_sg)(
 		struct dma_chan *chan, struct scatterlist *sgl,
 		unsigned int sg_len, enum dma_transfer_direction direction,
@@ -973,6 +987,25 @@ static inline struct dma_async_tx_descriptor *dmaengine_prep_slave_single(
 						  dir, flags, NULL);
 }
 
+/**
+ * dmaengine_prep_peripheral_dma_vec() - Prepare a DMA scatter-gather descriptor
+ * @chan: The channel to be used for this descriptor
+ * @vecs: The array of DMA vectors that should be transferred
+ * @nents: The number of DMA vectors in the array
+ * @dir: Specifies the direction of the data transfer
+ * @flags: DMA engine flags
+ */
+static inline struct dma_async_tx_descriptor *dmaengine_prep_peripheral_dma_vec(
+	struct dma_chan *chan, const struct dma_vec *vecs, size_t nents,
+	enum dma_transfer_direction dir, unsigned long flags)
+{
+	if (!chan || !chan->device || !chan->device->device_prep_peripheral_dma_vec)
+		return NULL;
+
+	return chan->device->device_prep_peripheral_dma_vec(chan, vecs, nents,
+							    dir, flags);
+}
+
 static inline struct dma_async_tx_descriptor *dmaengine_prep_slave_sg(
 	struct dma_chan *chan, struct scatterlist *sgl,	unsigned int sg_len,
 	enum dma_transfer_direction dir, unsigned long flags)
-- 
2.43.0

