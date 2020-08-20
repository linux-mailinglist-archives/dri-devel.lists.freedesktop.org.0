Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DD24C178
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3F6E967;
	Thu, 20 Aug 2020 15:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E0BD36E969
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84CA2152B;
 Thu, 20 Aug 2020 08:09:58 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA9CB3F6CF;
 Thu, 20 Aug 2020 08:09:54 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
Date: Thu, 20 Aug 2020 16:08:36 +0100
Message-Id: <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <cover.1597931875.git.robin.murphy@arm.com>
References: <cover.1597931875.git.robin.murphy@arm.com>
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org,
 magnus.damm@gmail.com, kyungmin.park@samsung.com, jonathanh@nvidia.com,
 agross@kernel.org, yong.wu@mediatek.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that arch/arm is wired up for default domains and iommu-dma, devices
behind IOMMUs will get mappings set up automatically as appropriate, so
there is no need for drivers to do so manually.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/media/platform/omap3isp/isp.c | 68 ++-------------------------
 drivers/media/platform/omap3isp/isp.h |  3 --
 2 files changed, 3 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
index b91e472ee764..196522883231 100644
--- a/drivers/media/platform/omap3isp/isp.c
+++ b/drivers/media/platform/omap3isp/isp.c
@@ -56,10 +56,6 @@
 #include <linux/sched.h>
 #include <linux/vmalloc.h>
 
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-#include <asm/dma-iommu.h>
-#endif
-
 #include <media/v4l2-common.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-device.h>
@@ -1942,51 +1938,6 @@ static int isp_initialize_modules(struct isp_device *isp)
 	return ret;
 }
 
-static void isp_detach_iommu(struct isp_device *isp)
-{
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-	arm_iommu_detach_device(isp->dev);
-	arm_iommu_release_mapping(isp->mapping);
-	isp->mapping = NULL;
-#endif
-}
-
-static int isp_attach_iommu(struct isp_device *isp)
-{
-#ifdef CONFIG_ARM_DMA_USE_IOMMU
-	struct dma_iommu_mapping *mapping;
-	int ret;
-
-	/*
-	 * Create the ARM mapping, used by the ARM DMA mapping core to allocate
-	 * VAs. This will allocate a corresponding IOMMU domain.
-	 */
-	mapping = arm_iommu_create_mapping(&platform_bus_type, SZ_1G, SZ_2G);
-	if (IS_ERR(mapping)) {
-		dev_err(isp->dev, "failed to create ARM IOMMU mapping\n");
-		return PTR_ERR(mapping);
-	}
-
-	isp->mapping = mapping;
-
-	/* Attach the ARM VA mapping to the device. */
-	ret = arm_iommu_attach_device(isp->dev, mapping);
-	if (ret < 0) {
-		dev_err(isp->dev, "failed to attach device to VA mapping\n");
-		goto error;
-	}
-
-	return 0;
-
-error:
-	arm_iommu_release_mapping(isp->mapping);
-	isp->mapping = NULL;
-	return ret;
-#else
-	return -ENODEV;
-#endif
-}
-
 /*
  * isp_remove - Remove ISP platform device
  * @pdev: Pointer to ISP platform device
@@ -2002,10 +1953,6 @@ static int isp_remove(struct platform_device *pdev)
 	isp_cleanup_modules(isp);
 	isp_xclk_cleanup(isp);
 
-	__omap3isp_get(isp, false);
-	isp_detach_iommu(isp);
-	__omap3isp_put(isp, false);
-
 	media_entity_enum_cleanup(&isp->crashed);
 	v4l2_async_notifier_cleanup(&isp->notifier);
 
@@ -2383,18 +2330,11 @@ static int isp_probe(struct platform_device *pdev)
 	isp->mmio_hist_base_phys =
 		mem->start + isp_res_maps[m].offset[OMAP3_ISP_IOMEM_HIST];
 
-	/* IOMMU */
-	ret = isp_attach_iommu(isp);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "unable to attach to IOMMU\n");
-		goto error_isp;
-	}
-
 	/* Interrupt */
 	ret = platform_get_irq(pdev, 0);
 	if (ret <= 0) {
 		ret = -ENODEV;
-		goto error_iommu;
+		goto error_isp;
 	}
 	isp->irq_num = ret;
 
@@ -2402,13 +2342,13 @@ static int isp_probe(struct platform_device *pdev)
 			     "OMAP3 ISP", isp)) {
 		dev_err(isp->dev, "Unable to request IRQ\n");
 		ret = -EINVAL;
-		goto error_iommu;
+		goto error_isp;
 	}
 
 	/* Entities */
 	ret = isp_initialize_modules(isp);
 	if (ret < 0)
-		goto error_iommu;
+		goto error_isp;
 
 	ret = isp_register_entities(isp);
 	if (ret < 0)
@@ -2433,8 +2373,6 @@ static int isp_probe(struct platform_device *pdev)
 	isp_unregister_entities(isp);
 error_modules:
 	isp_cleanup_modules(isp);
-error_iommu:
-	isp_detach_iommu(isp);
 error_isp:
 	isp_xclk_cleanup(isp);
 	__omap3isp_put(isp, false);
diff --git a/drivers/media/platform/omap3isp/isp.h b/drivers/media/platform/omap3isp/isp.h
index a9d760fbf349..b50459106d89 100644
--- a/drivers/media/platform/omap3isp/isp.h
+++ b/drivers/media/platform/omap3isp/isp.h
@@ -145,7 +145,6 @@ struct isp_xclk {
  * @syscon: Regmap for the syscon register space
  * @syscon_offset: Offset of the CSIPHY control register in syscon
  * @phy_type: ISP_PHY_TYPE_{3430,3630}
- * @mapping: IOMMU mapping
  * @stat_lock: Spinlock for handling statistics
  * @isp_mutex: Mutex for serializing requests to ISP.
  * @stop_failure: Indicates that an entity failed to stop.
@@ -185,8 +184,6 @@ struct isp_device {
 	u32 syscon_offset;
 	u32 phy_type;
 
-	struct dma_iommu_mapping *mapping;
-
 	/* ISP Obj */
 	spinlock_t stat_lock;	/* common lock for statistic drivers */
 	struct mutex isp_mutex;	/* For handling ref_count field */
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
