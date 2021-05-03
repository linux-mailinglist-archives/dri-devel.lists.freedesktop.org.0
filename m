Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 970CE371394
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 12:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 367796E897;
	Mon,  3 May 2021 10:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4FA6E896
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 10:24:31 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ldVkW-0006AK-Pe; Mon, 03 May 2021 12:24:24 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: etnaviv@lists.freedesktop.org,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH] drm/etnaviv: rework linear window offset calculation
Date: Mon,  3 May 2021 12:24:22 +0200
Message-Id: <20210503102422.1384502-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: patchwork-lst@pengutronix.de, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current calculation based on the required_dma mask can be significantly
off, so that the linear window only overlaps a small part of the DRAM
address space. This can lead to the command buffer being unmappable, which
is obviously bad.

Rework the linear window offset calculation to be based on the command buffer
physical address, making sure that the command buffer is always mappable.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 52 +++++++++++++--------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index c6404b8d067f..a454b13e8106 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -27,10 +27,6 @@
 #include "state_hi.xml.h"
 #include "cmdstream.xml.h"
 
-#ifndef PHYS_OFFSET
-#define PHYS_OFFSET 0
-#endif
-
 static const struct platform_device_id gpu_ids[] = {
 	{ .name = "etnaviv-gpu,2d" },
 	{ },
@@ -724,6 +720,7 @@ static void etnaviv_gpu_hw_init(struct etnaviv_gpu *gpu)
 int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 {
 	struct etnaviv_drm_private *priv = gpu->drm->dev_private;
+	dma_addr_t cmdbuf_paddr;
 	int ret, i;
 
 	ret = pm_runtime_get_sync(gpu->dev);
@@ -766,28 +763,6 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 	if (ret)
 		goto fail;
 
-	/*
-	 * Set the GPU linear window to be at the end of the DMA window, where
-	 * the CMA area is likely to reside. This ensures that we are able to
-	 * map the command buffers while having the linear window overlap as
-	 * much RAM as possible, so we can optimize mappings for other buffers.
-	 *
-	 * For 3D cores only do this if MC2.0 is present, as with MC1.0 it leads
-	 * to different views of the memory on the individual engines.
-	 */
-	if (!(gpu->identity.features & chipFeatures_PIPE_3D) ||
-	    (gpu->identity.minor_features0 & chipMinorFeatures0_MC20)) {
-		u32 dma_mask = (u32)dma_get_required_mask(gpu->dev);
-		if (dma_mask < PHYS_OFFSET + SZ_2G)
-			priv->mmu_global->memory_base = PHYS_OFFSET;
-		else
-			priv->mmu_global->memory_base = dma_mask - SZ_2G + 1;
-	} else if (PHYS_OFFSET >= SZ_2G) {
-		dev_info(gpu->dev, "Need to move linear window on MC1.0, disabling TS\n");
-		priv->mmu_global->memory_base = PHYS_OFFSET;
-		gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
-	}
-
 	/*
 	 * If the GPU is part of a system with DMA addressing limitations,
 	 * request pages for our SHM backend buffers from the DMA32 zone to
@@ -804,6 +779,31 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
 		goto fail;
 	}
 
+	/*
+	 * Set the GPU linear window to cover the cmdbuf region, as the GPU
+	 * won't be able to start execution otherwise. The alignment to 128M is
+	 * chosen arbitrarily but helps in debugging, as the MMU offset
+	 * calculations are much more straight forward this way.
+	 *
+	 * On MC1.0 cores the linear window offset is ignored by the TS engine,
+	 * leading to inconsistent memory views. Avoid using the offset on those
+	 * cores if possible, otherwise disable the TS feature.
+	 */
+	cmdbuf_paddr = ALIGN_DOWN(etnaviv_cmdbuf_get_pa(&gpu->buffer), SZ_128M);
+
+	if (!(gpu->identity.features & chipFeatures_PIPE_3D) ||
+	    (gpu->identity.minor_features0 & chipMinorFeatures0_MC20)) {
+		if (cmdbuf_paddr >= SZ_2G)
+			priv->mmu_global->memory_base = SZ_2G;
+		else
+			priv->mmu_global->memory_base = cmdbuf_paddr;
+	} else if (cmdbuf_paddr + SZ_128M >= SZ_2G) {
+		dev_info(gpu->dev,
+			 "Need to move linear window on MC1.0, disabling TS\n");
+		gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
+		priv->mmu_global->memory_base = SZ_2G;
+	}
+
 	/* Setup event management */
 	spin_lock_init(&gpu->event_spinlock);
 	init_completion(&gpu->event_free);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
