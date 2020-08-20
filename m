Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D6224C170
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAB26E965;
	Thu, 20 Aug 2020 15:09:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A84146E965
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:09:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18997150C;
 Thu, 20 Aug 2020 08:09:47 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 788913F6CF;
 Thu, 20 Aug 2020 08:09:43 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: hch@lst.de,
	joro@8bytes.org,
	linux@armlinux.org.uk
Subject: [PATCH 14/18] drm/exynos: Consolidate IOMMU mapping code
Date: Thu, 20 Aug 2020 16:08:33 +0100
Message-Id: <8b4a21e4f1b4d6da086371ee213c654b10fcf946.1597931876.git.robin.murphy@arm.com>
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

Now that arch/arm is wired up for default domains and iommu-dma, we can
consolidate the shared mapping code onto the generic IOMMU API version,
and retire the arch-specific implementation.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---
This is a cheeky revert of 07dc3678bacc ("drm/exynos: Fix cleanup of
IOMMU related objects"), plus removal of the remaining arm_iommu_*
references on top.
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 +-
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c       | 61 +++----------------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 +-
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 +-
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +--
 11 files changed, 29 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2a881e..8428ae12dfa5 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -55,7 +55,6 @@ static const char * const decon_clks_name[] = {
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
-	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -645,7 +644,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 
 	decon_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
+	return exynos_drm_register_dma(drm_dev, dev);
 }
 
 static void decon_unbind(struct device *dev, struct device *master, void *data)
@@ -655,7 +654,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
 	decon_atomic_disable(ctx->crtc);
 
 	/* detach this sub driver from iommu mapping if supported. */
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
 }
 
 static const struct component_ops decon_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f2d87a7445c7..e7b58097ccdc 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -40,7 +40,6 @@
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
-	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -128,13 +127,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
 
 	decon_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
+	return exynos_drm_register_dma(drm_dev, ctx->dev);
 }
 
 static void decon_ctx_remove(struct decon_context *ctx)
 {
 	/* detach this sub driver from iommu mapping if supported. */
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
 }
 
 static u32 decon_calc_clkdiv(struct decon_context *ctx,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 58b89ec11b0e..fd5f9bcf1857 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -14,19 +14,6 @@
 
 #include "exynos_drm_drv.h"
 
-#if defined(CONFIG_ARM_DMA_USE_IOMMU)
-#include <asm/dma-iommu.h>
-#else
-#define arm_iommu_create_mapping(...)	({ NULL; })
-#define arm_iommu_attach_device(...)	({ -ENODEV; })
-#define arm_iommu_release_mapping(...)	({ })
-#define arm_iommu_detach_device(...)	({ })
-#define to_dma_iommu_mapping(dev) NULL
-#endif
-
-#if !defined(CONFIG_IOMMU_DMA)
-#define iommu_dma_init_domain(...) ({ -EINVAL; })
-#endif
 
 #define EXYNOS_DEV_ADDR_START	0x20000000
 #define EXYNOS_DEV_ADDR_SIZE	0x40000000
@@ -58,7 +45,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
  * mapping.
  */
 static int drm_iommu_attach_device(struct drm_device *drm_dev,
-				struct device *subdrv_dev, void **dma_priv)
+				struct device *subdrv_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret = 0;
@@ -73,22 +60,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (ret)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
-		/*
-		 * Keep the original DMA mapping of the sub-device and
-		 * restore it on Exynos DRM detach, otherwise the DMA
-		 * framework considers it as IOMMU-less during the next
-		 * probe (in case of deferred probe or modular build)
-		 */
-		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
-		if (*dma_priv)
-			arm_iommu_detach_device(subdrv_dev);
-
-		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
-	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
-		ret = iommu_attach_device(priv->mapping, subdrv_dev);
-	}
-
+	ret = iommu_attach_device(priv->mapping, subdrv_dev);
 	if (ret)
 		clear_dma_max_seg_size(subdrv_dev);
 
@@ -105,21 +77,15 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
  * mapping
  */
 static void drm_iommu_detach_device(struct drm_device *drm_dev,
-				    struct device *subdrv_dev, void **dma_priv)
+				struct device *subdrv_dev)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
-		arm_iommu_detach_device(subdrv_dev);
-		arm_iommu_attach_device(subdrv_dev, *dma_priv);
-	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
-		iommu_detach_device(priv->mapping, subdrv_dev);
-
+	iommu_detach_device(priv->mapping, subdrv_dev);
 	clear_dma_max_seg_size(subdrv_dev);
 }
 
-int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-			    void **dma_priv)
+int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
 {
 	struct exynos_drm_private *priv = drm->dev_private;
 
@@ -133,27 +99,20 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
 		return 0;
 
 	if (!priv->mapping) {
-		void *mapping;
-
-		if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
-			mapping = arm_iommu_create_mapping(&platform_bus_type,
-				EXYNOS_DEV_ADDR_START, EXYNOS_DEV_ADDR_SIZE);
-		else if (IS_ENABLED(CONFIG_IOMMU_DMA))
-			mapping = iommu_get_domain_for_dev(priv->dma_dev);
+		void *mapping = iommu_get_domain_for_dev(priv->dma_dev);
 
 		if (IS_ERR(mapping))
 			return PTR_ERR(mapping);
 		priv->mapping = mapping;
 	}
 
-	return drm_iommu_attach_device(drm, dev, dma_priv);
+	return drm_iommu_attach_device(drm, dev);
 }
 
-void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
-			       void **dma_priv)
+void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev)
 {
 	if (IS_ENABLED(CONFIG_EXYNOS_IOMMU))
-		drm_iommu_detach_device(drm, dev, dma_priv);
+		drm_iommu_detach_device(drm, dev);
 }
 
 void exynos_drm_cleanup_dma(struct drm_device *drm)
@@ -163,7 +122,5 @@ void exynos_drm_cleanup_dma(struct drm_device *drm)
 	if (!IS_ENABLED(CONFIG_EXYNOS_IOMMU))
 		return;
 
-	arm_iommu_release_mapping(priv->mapping);
-	priv->mapping = NULL;
 	priv->dma_dev = NULL;
 }
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index 6ae9056e7a18..d4d21d8cfb90 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -223,10 +223,8 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 	return priv->mapping ? true : false;
 }
 
-int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
-			    void **dma_priv);
-void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
-			       void **dma_priv);
+int exynos_drm_register_dma(struct drm_device *drm, struct device *dev);
+void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev);
 void exynos_drm_cleanup_dma(struct drm_device *drm);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 29ab8be8604c..8ea2e1d77802 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -97,7 +97,6 @@ struct fimc_scaler {
 struct fimc_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
-	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
 	struct exynos_drm_ipp_formats	*formats;
@@ -1134,7 +1133,7 @@ static int fimc_bind(struct device *dev, struct device *master, void *data)
 
 	ctx->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
+	exynos_drm_register_dma(drm_dev, dev);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -1154,7 +1153,7 @@ static void fimc_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &ctx->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
+	exynos_drm_unregister_dma(drm_dev, dev);
 }
 
 static const struct component_ops fimc_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bb67cad8371f..21aec38702fc 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -167,7 +167,6 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
 struct fimd_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
-	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -1091,7 +1090,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (is_drm_iommu_supported(drm_dev))
 		fimd_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
+	return exynos_drm_register_dma(drm_dev, dev);
 }
 
 static void fimd_unbind(struct device *dev, struct device *master,
@@ -1101,7 +1100,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
 
 	fimd_atomic_disable(ctx->crtc);
 
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
 
 	if (ctx->encoder)
 		exynos_dpi_remove(ctx->encoder);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 03be31427181..256ceafd9945 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -232,7 +232,6 @@ struct g2d_runqueue_node {
 
 struct g2d_data {
 	struct device			*dev;
-	void				*dma_priv;
 	struct clk			*gate_clk;
 	void __iomem			*regs;
 	int				irq;
@@ -1410,7 +1409,7 @@ static int g2d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ret = exynos_drm_register_dma(drm_dev, dev, &g2d->dma_priv);
+	ret = exynos_drm_register_dma(drm_dev, dev);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable iommu.\n");
 		g2d_fini_cmdlist(g2d);
@@ -1435,7 +1434,7 @@ static void g2d_unbind(struct device *dev, struct device *master, void *data)
 	priv->g2d_dev = NULL;
 
 	cancel_work_sync(&g2d->runqueue_work);
-	exynos_drm_unregister_dma(g2d->drm_dev, dev, &g2d->dma_priv);
+	exynos_drm_unregister_dma(g2d->drm_dev, dev);
 }
 
 static const struct component_ops g2d_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 45e9aee8366a..88b6fcaa20be 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -97,7 +97,6 @@ struct gsc_scaler {
 struct gsc_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
-	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
 	struct exynos_drm_ipp_formats	*formats;
@@ -1170,7 +1169,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
 
 	ctx->drm_dev = drm_dev;
 	ctx->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
+	exynos_drm_register_dma(drm_dev, dev);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -1190,7 +1189,7 @@ static void gsc_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &ctx->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
+	exynos_drm_unregister_dma(drm_dev, dev);
 }
 
 static const struct component_ops gsc_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 2d94afba031e..f22fa0d2621a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -56,7 +56,6 @@ struct rot_variant {
 struct rot_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
-	void		*dma_priv;
 	struct device	*dev;
 	void __iomem	*regs;
 	struct clk	*clock;
@@ -244,7 +243,7 @@ static int rotator_bind(struct device *dev, struct device *master, void *data)
 
 	rot->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev, &rot->dma_priv);
+	exynos_drm_register_dma(drm_dev, dev);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
@@ -262,7 +261,7 @@ static void rotator_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &rot->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(rot->drm_dev, rot->dev, &rot->dma_priv);
+	exynos_drm_unregister_dma(rot->drm_dev, rot->dev);
 }
 
 static const struct component_ops rotator_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index ce1857138f89..0c560566bd2e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -39,7 +39,6 @@ struct scaler_data {
 struct scaler_context {
 	struct exynos_drm_ipp		ipp;
 	struct drm_device		*drm_dev;
-	void				*dma_priv;
 	struct device			*dev;
 	void __iomem			*regs;
 	struct clk			*clock[SCALER_MAX_CLK];
@@ -451,7 +450,7 @@ static int scaler_bind(struct device *dev, struct device *master, void *data)
 
 	scaler->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev, &scaler->dma_priv);
+	exynos_drm_register_dma(drm_dev, dev);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -471,8 +470,7 @@ static void scaler_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &scaler->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev,
-				  &scaler->dma_priv);
+	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev);
 }
 
 static const struct component_ops scaler_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index af192e5a16ef..18972e605c5d 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -94,7 +94,6 @@ struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
-	void			*dma_priv;
 	struct exynos_drm_crtc	*crtc;
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
 	unsigned long		flags;
@@ -895,14 +894,12 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
 		}
 	}
 
-	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev,
-				       &mixer_ctx->dma_priv);
+	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev);
 }
 
 static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
 {
-	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev,
-				  &mixer_ctx->dma_priv);
+	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev);
 }
 
 static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)
-- 
2.28.0.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
