Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79594138650
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D8D89CCB;
	Sun, 12 Jan 2020 12:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [184.105.72.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0186EA27
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 14:12:13 +0000 (UTC)
Received: from localhost.localdomain ([94.155.250.134])
 by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 06:12:01 -0800
From: Stefan Mavrodiev <stefan@olimex.com>
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list),
 dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10)
Subject: [PATCH 1/2] dmaengine: sun4i: Add support for cyclic requests with
 dedicated DMA
Date: Fri, 10 Jan 2020 16:11:39 +0200
Message-Id: <20200110141140.28527-2-stefan@olimex.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110141140.28527-1-stefan@olimex.com>
References: <20200110141140.28527-1-stefan@olimex.com>
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the cyclic transfers can be used only with normal DMAs. They
can be used by pcm_dmaengine module, which is required for implementing
sound with sun4i-hdmi encoder. This is so because the controller can
accept audio only from a dedicated DMA.

This patch enables them, following the existing style for the
scatter/gather type transfers.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 drivers/dma/sun4i-dma.c | 45 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index e397a50058c8..7b41815d86fb 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -669,43 +669,41 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 	dma_addr_t src, dest;
 	u32 endpoints;
 	int nr_periods, offset, plength, i;
+	u8 ram_type, io_mode, linear_mode;
 
 	if (!is_slave_direction(dir)) {
 		dev_err(chan2dev(chan), "Invalid DMA direction\n");
 		return NULL;
 	}
 
-	if (vchan->is_dedicated) {
-		/*
-		 * As we are using this just for audio data, we need to use
-		 * normal DMA. There is nothing stopping us from supporting
-		 * dedicated DMA here as well, so if a client comes up and
-		 * requires it, it will be simple to implement it.
-		 */
-		dev_err(chan2dev(chan),
-			"Cyclic transfers are only supported on Normal DMA\n");
-		return NULL;
-	}
-
 	contract = generate_dma_contract();
 	if (!contract)
 		return NULL;
 
 	contract->is_cyclic = 1;
 
-	/* Figure out the endpoints and the address we need */
+	if (vchan->is_dedicated) {
+		io_mode = SUN4I_DDMA_ADDR_MODE_IO;
+		linear_mode = SUN4I_DDMA_ADDR_MODE_LINEAR;
+		ram_type = SUN4I_DDMA_DRQ_TYPE_SDRAM;
+	} else {
+		io_mode = SUN4I_NDMA_ADDR_MODE_IO;
+		linear_mode = SUN4I_NDMA_ADDR_MODE_LINEAR;
+		ram_type = SUN4I_NDMA_DRQ_TYPE_SDRAM;
+	}
+
 	if (dir == DMA_MEM_TO_DEV) {
 		src = buf;
 		dest = sconfig->dst_addr;
-		endpoints = SUN4I_DMA_CFG_SRC_DRQ_TYPE(SUN4I_NDMA_DRQ_TYPE_SDRAM) |
-			    SUN4I_DMA_CFG_DST_DRQ_TYPE(vchan->endpoint) |
-			    SUN4I_DMA_CFG_DST_ADDR_MODE(SUN4I_NDMA_ADDR_MODE_IO);
+		endpoints = SUN4I_DMA_CFG_DST_DRQ_TYPE(vchan->endpoint) |
+			    SUN4I_DMA_CFG_DST_ADDR_MODE(io_mode) |
+			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(ram_type);
 	} else {
 		src = sconfig->src_addr;
 		dest = buf;
-		endpoints = SUN4I_DMA_CFG_SRC_DRQ_TYPE(vchan->endpoint) |
-			    SUN4I_DMA_CFG_SRC_ADDR_MODE(SUN4I_NDMA_ADDR_MODE_IO) |
-			    SUN4I_DMA_CFG_DST_DRQ_TYPE(SUN4I_NDMA_DRQ_TYPE_SDRAM);
+		endpoints = SUN4I_DMA_CFG_DST_DRQ_TYPE(ram_type) |
+			    SUN4I_DMA_CFG_SRC_DRQ_TYPE(vchan->endpoint) |
+			    SUN4I_DMA_CFG_SRC_ADDR_MODE(io_mode);
 	}
 
 	/*
@@ -747,8 +745,13 @@ sun4i_dma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf, size_t len,
 			dest = buf + offset;
 
 		/* Make the promise */
-		promise = generate_ndma_promise(chan, src, dest,
-						plength, sconfig, dir);
+		if (vchan->is_dedicated)
+			promise = generate_ddma_promise(chan, src, dest,
+							plength, sconfig);
+		else
+			promise = generate_ndma_promise(chan, src, dest,
+							plength, sconfig, dir);
+
 		if (!promise) {
 			/* TODO: should we free everything? */
 			return NULL;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
