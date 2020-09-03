Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3582025CB82
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 22:51:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A10636E92A;
	Thu,  3 Sep 2020 20:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1E1A06E92A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 20:51:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B99B1045;
 Thu,  3 Sep 2020 13:51:53 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 623DB3F68F;
 Thu,  3 Sep 2020 13:51:52 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com
Subject: [PATCH] drm/exynos: Drop local dma_parms
Date: Thu,  3 Sep 2020 21:51:48 +0100
Message-Id: <dade9fce82e4905f3d61494785f81604674df5da.1599166024.git.robin.murphy@arm.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 26 +------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 58b89ec11b0e..9f25a5ebbf7d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -31,23 +31,6 @@
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
 
-static inline int configure_dma_max_seg_size(struct device *dev)
-{
-	if (!dev->dma_parms)
-		dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
-	if (!dev->dma_parms)
-		return -ENOMEM;
-
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
-	return 0;
-}
-
-static inline void clear_dma_max_seg_size(struct device *dev)
-{
-	kfree(dev->dma_parms);
-	dev->dma_parms = NULL;
-}
-
 /*
  * drm_iommu_attach_device- attach device to iommu mapping
  *
@@ -69,9 +52,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return -EINVAL;
 	}
 
-	ret = configure_dma_max_seg_size(subdrv_dev);
-	if (ret)
-		return ret;
+	dma_set_max_seg_size(subdrv_dev, UINT_MAX);
 
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
 		/*
@@ -89,9 +70,6 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	}
 
-	if (ret)
-		clear_dma_max_seg_size(subdrv_dev);
-
 	return ret;
 }
 
@@ -114,8 +92,6 @@ static void drm_iommu_detach_device(struct drm_device *drm_dev,
 		arm_iommu_attach_device(subdrv_dev, *dma_priv);
 	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 		iommu_detach_device(priv->mapping, subdrv_dev);
-
-	clear_dma_max_seg_size(subdrv_dev);
 }
 
 int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
