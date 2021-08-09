Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988DB3E3DB5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A6589A8C;
	Mon,  9 Aug 2021 01:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65B8999E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:18 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 674B449A;
 Mon,  9 Aug 2021 03:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472916;
 bh=gcdFZenMvzxqhhYF8UYPl0iev68yB9noh0ZfCn0CCoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OaxtMsSJhbZ+CEYOIftD11tRCa97mdKd66mE+9apItIcFMlpJ/O1SJzz9XLWOAvaP
 EliKkjbJoST4C+dLWRIluRnRfsYmoXWgTErfqK8cI+mn0n8h0Qt6aJvcKPGyu9u/3O
 qPS5bln7+y8Ld0h+DbgIHy1LESviRzangorMrbjs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 29/36] drm: xlnx: zynqmp_dpsub: Decouple DRM device from
 zynqmp_dpsub
Date: Mon,  9 Aug 2021 04:34:50 +0300
Message-Id: <20210809013457.11266-30-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
References: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
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

To complete the decoupling of the DRM device from the zynqmp_dpsub,
group all DRM-related structures in a zynqmp_dpsub_drm structure and
allocate it separately from the zynqmp_dpsub. The DRM managed allocation
of the drm_device now doesn't cover the zynqmp_dpsub anymore, so we need
to register a cleanup action to release the zynqmp_dpsub when the
drm_device is released.

The will allow usage of the DisplayPort encoder as a standalone bridge,
without registering a DRM device in this driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 41 +++++++++-------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h | 20 ++------
 drivers/gpu/drm/xlnx/zynqmp_kms.c   | 72 ++++++++++++++++++++---------
 drivers/gpu/drm/xlnx/zynqmp_kms.h   | 26 ++++++++++-
 4 files changed, 104 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 75209272ccb2..e6532a13fb78 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -18,8 +18,6 @@
 #include <linux/slab.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_drv.h>
-#include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper.h>
 
 #include "zynqmp_disp.h"
@@ -35,14 +33,20 @@ static int __maybe_unused zynqmp_dpsub_suspend(struct device *dev)
 {
 	struct zynqmp_dpsub *dpsub = dev_get_drvdata(dev);
 
-	return drm_mode_config_helper_suspend(&dpsub->drm);
+	if (!dpsub->drm)
+		return 0;
+
+	return drm_mode_config_helper_suspend(&dpsub->drm->dev);
 }
 
 static int __maybe_unused zynqmp_dpsub_resume(struct device *dev)
 {
 	struct zynqmp_dpsub *dpsub = dev_get_drvdata(dev);
 
-	return drm_mode_config_helper_resume(&dpsub->drm);
+	if (!dpsub->drm)
+		return 0;
+
+	return drm_mode_config_helper_resume(&dpsub->drm->dev);
 }
 
 static const struct dev_pm_ops zynqmp_dpsub_pm_ops = {
@@ -137,12 +141,11 @@ static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
 	return 0;
 }
 
-static void zynqmp_dpsub_release(struct drm_device *drm, void *res)
+void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub)
 {
-	struct zynqmp_dpsub *dpsub = res;
-
 	kfree(dpsub->disp);
 	kfree(dpsub->dp);
+	kfree(dpsub);
 }
 
 static int zynqmp_dpsub_probe(struct platform_device *pdev)
@@ -151,14 +154,9 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	int ret;
 
 	/* Allocate private data. */
-	dpsub = devm_drm_dev_alloc(&pdev->dev, &zynqmp_dpsub_drm_driver,
-				   struct zynqmp_dpsub, drm);
-	if (IS_ERR(dpsub))
-		return PTR_ERR(dpsub);
-
-	ret = drmm_add_action(&dpsub->drm, zynqmp_dpsub_release, dpsub);
-	if (ret < 0)
-		return ret;
+	dpsub = kzalloc(sizeof(*dpsub), GFP_KERNEL);
+	if (!dpsub)
+		return -ENOMEM;
 
 	dpsub->dev = &pdev->dev;
 	platform_set_drvdata(pdev, dpsub);
@@ -203,6 +201,8 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 	clk_disable_unprepare(dpsub->apb_clk);
 err_mem:
 	of_reserved_mem_device_release(&pdev->dev);
+	if (!dpsub->drm)
+		zynqmp_dpsub_release(dpsub);
 	return ret;
 }
 
@@ -210,7 +210,8 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
 
-	zynqmp_dpsub_drm_cleanup(dpsub);
+	if (dpsub->drm)
+		zynqmp_dpsub_drm_cleanup(dpsub);
 
 	zynqmp_disp_remove(dpsub);
 	zynqmp_dp_remove(dpsub);
@@ -219,6 +220,9 @@ static int zynqmp_dpsub_remove(struct platform_device *pdev)
 	clk_disable_unprepare(dpsub->apb_clk);
 	of_reserved_mem_device_release(&pdev->dev);
 
+	if (!dpsub->drm)
+		zynqmp_dpsub_release(dpsub);
+
 	return 0;
 }
 
@@ -226,7 +230,10 @@ static void zynqmp_dpsub_shutdown(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
 
-	drm_atomic_helper_shutdown(&dpsub->drm);
+	if (!dpsub->drm)
+		return;
+
+	drm_atomic_helper_shutdown(&dpsub->drm->dev);
 }
 
 static const struct of_device_id zynqmp_dpsub_of_match[] = {
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 1778092e0829..6c6029ad9bc5 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -12,17 +12,13 @@
 #ifndef _ZYNQMP_DPSUB_H_
 #define _ZYNQMP_DPSUB_H_
 
-#include <drm/drm_crtc.h>
-#include <drm/drm_encoder.h>
-#include <drm/drm_plane.h>
-
 struct clk;
 struct device;
 struct drm_bridge;
-struct drm_device;
 struct zynqmp_disp;
 struct zynqmp_disp_layer;
 struct zynqmp_dp;
+struct zynqmp_dpsub_drm;
 
 #define ZYNQMP_DPSUB_NUM_LAYERS				2
 
@@ -35,24 +31,19 @@ enum zynqmp_dpsub_format {
 
 /**
  * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem
- * @drm: The DRM/KMS device
  * @dev: The physical device
  * @apb_clk: The APB clock
  * @vid_clk: Video clock
  * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
  * @aud_clk: Audio clock
  * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
- * @planes: The DRM planes
- * @crtc: The DRM CRTC
- * @encoder: The dummy DRM encoder
- * @connector: The DP connector
+ * @drm: The DRM/KMS device data
  * @bridge: The DP encoder bridge
  * @disp: The display controller
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
  */
 struct zynqmp_dpsub {
-	struct drm_device drm;
 	struct device *dev;
 
 	struct clk *apb_clk;
@@ -61,10 +52,7 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
-	struct drm_plane planes[ZYNQMP_DPSUB_NUM_LAYERS];
-	struct drm_crtc crtc;
-	struct drm_encoder encoder;
-	struct drm_connector *connector;
+	struct zynqmp_dpsub_drm *drm;
 	struct drm_bridge *bridge;
 
 	struct zynqmp_disp *disp;
@@ -77,4 +65,6 @@ struct zynqmp_dpsub {
 bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub);
 unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub);
 
+void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub);
+
 #endif /* _ZYNQMP_DPSUB_H_ */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 7b6af07baad4..35093f41c532 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -43,7 +43,7 @@
 
 static inline struct zynqmp_dpsub *to_zynqmp_dpsub(struct drm_device *drm)
 {
-	return container_of(drm, struct zynqmp_dpsub, drm);
+	return container_of(drm, struct zynqmp_dpsub_drm, dev)->dpsub;
 }
 
 /* -----------------------------------------------------------------------------
@@ -145,9 +145,9 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 	unsigned int i;
 	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(dpsub->planes); i++) {
+	for (i = 0; i < ARRAY_SIZE(dpsub->drm->planes); i++) {
 		struct zynqmp_disp_layer *layer = dpsub->layers[i];
-		struct drm_plane *plane = &dpsub->planes[i];
+		struct drm_plane *plane = &dpsub->drm->planes[i];
 		enum drm_plane_type type;
 		unsigned int num_formats;
 		u32 *formats;
@@ -159,7 +159,7 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 		/* Graphics layer is primary, and video layer is overlay. */
 		type = i == ZYNQMP_DPSUB_LAYER_VID
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
-		ret = drm_universal_plane_init(&dpsub->drm, plane, 0,
+		ret = drm_universal_plane_init(&dpsub->drm->dev, plane, 0,
 					       &zynqmp_dpsub_plane_funcs,
 					       formats, num_formats,
 					       NULL, type, NULL);
@@ -183,7 +183,7 @@ static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
 
 static inline struct zynqmp_dpsub *crtc_to_dpsub(struct drm_crtc *crtc)
 {
-	return container_of(crtc, struct zynqmp_dpsub, crtc);
+	return container_of(crtc, struct zynqmp_dpsub_drm, crtc)->dpsub;
 }
 
 static void zynqmp_dpsub_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -311,11 +311,11 @@ static const struct drm_crtc_funcs zynqmp_dpsub_crtc_funcs = {
 
 static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_plane *plane = &dpsub->planes[ZYNQMP_DPSUB_LAYER_GFX];
-	struct drm_crtc *crtc = &dpsub->crtc;
+	struct drm_plane *plane = &dpsub->drm->planes[ZYNQMP_DPSUB_LAYER_GFX];
+	struct drm_crtc *crtc = &dpsub->drm->crtc;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(&dpsub->drm, crtc, plane,
+	ret = drm_crtc_init_with_planes(&dpsub->drm->dev, crtc, plane,
 					NULL, &zynqmp_dpsub_crtc_funcs, NULL);
 	if (ret < 0)
 		return ret;
@@ -330,11 +330,11 @@ static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
 
 static void zynqmp_dpsub_map_crtc_to_plane(struct zynqmp_dpsub *dpsub)
 {
-	u32 possible_crtcs = drm_crtc_mask(&dpsub->crtc);
+	u32 possible_crtcs = drm_crtc_mask(&dpsub->drm->crtc);
 	unsigned int i;
 
-	for (i = 0; i < ARRAY_SIZE(dpsub->planes); i++)
-		dpsub->planes[i].possible_crtcs = possible_crtcs;
+	for (i = 0; i < ARRAY_SIZE(dpsub->drm->planes); i++)
+		dpsub->drm->planes[i].possible_crtcs = possible_crtcs;
 }
 
 /**
@@ -346,7 +346,7 @@ static void zynqmp_dpsub_map_crtc_to_plane(struct zynqmp_dpsub *dpsub)
  */
 void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub)
 {
-	drm_crtc_handle_vblank(&dpsub->crtc);
+	drm_crtc_handle_vblank(&dpsub->drm->crtc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -393,7 +393,7 @@ static const struct drm_mode_config_funcs zynqmp_dpsub_mode_config_funcs = {
 
 DEFINE_DRM_GEM_CMA_FOPS(zynqmp_dpsub_drm_fops);
 
-const struct drm_driver zynqmp_dpsub_drm_driver = {
+static const struct drm_driver zynqmp_dpsub_drm_driver = {
 	.driver_features		= DRIVER_MODESET | DRIVER_GEM |
 					  DRIVER_ATOMIC,
 
@@ -410,7 +410,7 @@ const struct drm_driver zynqmp_dpsub_drm_driver = {
 
 static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_encoder *encoder = &dpsub->encoder;
+	struct drm_encoder *encoder = &dpsub->drm->encoder;
 	struct drm_connector *connector;
 	int ret;
 
@@ -426,8 +426,8 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	zynqmp_dpsub_map_crtc_to_plane(dpsub);
 
 	/* Create the encoder and attach the bridge. */
-	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->crtc);
-	drm_simple_encoder_init(&dpsub->drm, encoder, DRM_MODE_ENCODER_NONE);
+	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->drm->crtc);
+	drm_simple_encoder_init(&dpsub->drm->dev, encoder, DRM_MODE_ENCODER_NONE);
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
 				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
@@ -437,7 +437,7 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	}
 
 	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(&dpsub->drm, encoder);
+	connector = drm_bridge_connector_init(&dpsub->drm->dev, encoder);
 	if (IS_ERR(connector)) {
 		dev_err(dpsub->dev, "failed to created connector\n");
 		return PTR_ERR(connector);
@@ -450,16 +450,44 @@ static int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	}
 
 	drm_bridge_connector_enable_hpd(connector);
-	dpsub->connector = connector;
+	dpsub->drm->connector = connector;
 
 	return 0;
 }
 
+static void zynqmp_dpsub_drm_release(struct drm_device *drm, void *res)
+{
+	struct zynqmp_dpsub_drm *dpdrm = res;
+
+	zynqmp_dpsub_release(dpdrm->dpsub);
+}
+
 int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_device *drm = &dpsub->drm;
+	struct zynqmp_dpsub_drm *dpdrm;
+	struct drm_device *drm;
 	int ret;
 
+	/*
+	 * Allocate the drm_device and immediately add a cleanup action to
+	 * release the zynqmp_dpsub instance. If any of those operations fail,
+	 * dpsub->drm will remain NULL, which tells the caller that it must
+	 * cleanup manually.
+	 */
+	dpdrm = devm_drm_dev_alloc(dpsub->dev, &zynqmp_dpsub_drm_driver,
+				   struct zynqmp_dpsub_drm, dev);
+	if (IS_ERR(dpdrm))
+		return PTR_ERR(dpdrm);
+
+	dpdrm->dpsub = dpsub;
+	drm = &dpdrm->dev;
+
+	ret = drmm_add_action(drm, zynqmp_dpsub_drm_release, dpdrm);
+	if (ret < 0)
+		return ret;
+
+	dpsub->drm = dpdrm;
+
 	/* Initialize mode config, vblank and the KMS poll helper. */
 	ret = drmm_mode_config_init(drm);
 	if (ret < 0)
@@ -500,10 +528,10 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 void zynqmp_dpsub_drm_cleanup(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_device *drm = &dpsub->drm;
+	struct drm_device *drm = &dpsub->drm->dev;
 
-	if (dpsub->connector)
-		drm_bridge_connector_disable_hpd(dpsub->connector);
+	if (dpsub->drm->connector)
+		drm_bridge_connector_disable_hpd(dpsub->drm->connector);
 
 	drm_dev_unregister(drm);
 	drm_atomic_helper_shutdown(drm);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index 8074148fd429..9674ce2e544d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -12,9 +12,33 @@
 #ifndef _ZYNQMP_KMS_H_
 #define _ZYNQMP_KMS_H_
 
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
+
+#include "zynqmp_dpsub.h"
+
 struct zynqmp_dpsub;
 
-extern const struct drm_driver zynqmp_dpsub_drm_driver;
+/**
+ * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem DRM/KMS data
+ * @dpsub: Backpointer to the DisplayPort subsystem
+ * @drm: The DRM/KMS device
+ * @planes: The DRM planes
+ * @crtc: The DRM CRTC
+ * @encoder: The dummy DRM encoder
+ * @connector: The DP connector
+ */
+struct zynqmp_dpsub_drm {
+	struct zynqmp_dpsub *dpsub;
+
+	struct drm_device dev;
+	struct drm_plane planes[ZYNQMP_DPSUB_NUM_LAYERS];
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
+	struct drm_connector *connector;
+};
 
 void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub);
 
-- 
Regards,

Laurent Pinchart

