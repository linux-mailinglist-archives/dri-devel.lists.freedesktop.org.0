Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3BC25CB9F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 22:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C526E92F;
	Thu,  3 Sep 2020 20:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 010DE6E934
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 20:59:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 059751045;
 Thu,  3 Sep 2020 13:59:19 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 328733F68F;
 Thu,  3 Sep 2020 13:59:18 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Subject: [PATCH] drm/mediatek: Drop local dma_parms
Date: Thu,  3 Sep 2020 21:59:14 +0100
Message-Id: <d6f1943aaf58bb0ca527e048406e09cf387a12b0.1599166624.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++--------------------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |  2 --
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 040a8f393fe2..3941f6f6b003 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -221,21 +221,10 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
 	 * when importing PRIME buffers.
 	 */
-	if (!dma_dev->dma_parms) {
-		private->dma_parms_allocated = true;
-		dma_dev->dma_parms =
-			devm_kzalloc(drm->dev, sizeof(*dma_dev->dma_parms),
-				     GFP_KERNEL);
-	}
-	if (!dma_dev->dma_parms) {
-		ret = -ENOMEM;
-		goto err_component_unbind;
-	}
-
-	ret = dma_set_max_seg_size(dma_dev, (unsigned int)DMA_BIT_MASK(32));
+	ret = dma_set_max_seg_size(dma_dev, UINT_MAX);
 	if (ret) {
 		dev_err(dma_dev, "Failed to set DMA segment size\n");
-		goto err_unset_dma_parms;
+		goto err_component_unbind;
 	}
 
 	/*
@@ -246,16 +235,13 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 	drm->irq_enabled = true;
 	ret = drm_vblank_init(drm, MAX_CRTC);
 	if (ret < 0)
-		goto err_unset_dma_parms;
+		goto err_component_unbind;
 
 	drm_kms_helper_poll_init(drm);
 	drm_mode_config_reset(drm);
 
 	return 0;
 
-err_unset_dma_parms:
-	if (private->dma_parms_allocated)
-		dma_dev->dma_parms = NULL;
 err_component_unbind:
 	component_unbind_all(drm->dev, drm);
 
@@ -269,9 +255,6 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
 
-	if (private->dma_parms_allocated)
-		private->dma_dev->dma_parms = NULL;
-
 	component_unbind_all(drm->dev, drm);
 }
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index b5be63e53176..6afd0b5f2b92 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -44,8 +44,6 @@ struct mtk_drm_private {
 	struct mtk_ddp_comp *ddp_comp[DDP_COMPONENT_ID_MAX];
 	const struct mtk_mmsys_driver_data *data;
 	struct drm_atomic_state *suspend_state;
-
-	bool dma_parms_allocated;
 };
 
 extern struct platform_driver mtk_ddp_driver;
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
