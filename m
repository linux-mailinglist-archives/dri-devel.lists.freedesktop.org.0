Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3C43E3DB1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3119789AB3;
	Mon,  9 Aug 2021 01:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F4A8991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:14 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F8553844;
 Mon,  9 Aug 2021 03:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472913;
 bh=lTfmzJNiu4Kv86Lq/MQftyh8/ZmsFlNTcVEGEk55L/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vRcpuES/HTFNKaYeh2WKP4j5NIrNTvpiRP60OxGGCuGkfCjpPwtNjXrgTqVXlWah8
 4UUAWKBeKZT/SN3EOZvZHxSG0OAIQ08w6gVv/eNxGZaL0jPFD5oMlS0g9fd+R51alJ
 /b8MyzCVAkCFDM/I3k/vTKapFErcGoHGe8gIB920=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 22/36] drm: xlnx: zynqmp_dpsub: Move planes to zynqmp_dpsub
 structure
Date: Mon,  9 Aug 2021 04:34:43 +0300
Message-Id: <20210809013457.11266-23-laurent.pinchart@ideasonboard.com>
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

Decouple the zynqmp_disp, which handles the hardware configuration, from
the DRM planes by moving the planes to the zynqmp_dpsub structure. The
planes handling code will be moved to a separate file in a subsequent
step.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/Makefile       |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 20 ++++----
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 46 ++----------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  5 ++
 drivers/gpu/drm/xlnx/zynqmp_kms.c   | 73 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.h   | 19 ++++++++
 6 files changed, 110 insertions(+), 55 deletions(-)
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.h

diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index 51c24b72217b..ea1422a39502 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,2 @@
-zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
+zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o zynqmp_kms.o
 obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 7cae0eaaf118..d5e037166c02 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -71,7 +71,6 @@
 #define ZYNQMP_DISP_AV_BUF_NUM_VID_GFX_BUFFERS		4
 #define ZYNQMP_DISP_AV_BUF_NUM_BUFFERS			6
 
-#define ZYNQMP_DISP_NUM_LAYERS				2
 #define ZYNQMP_DISP_MAX_NUM_SUB_PLANES			3
 
 /**
@@ -133,8 +132,7 @@ struct zynqmp_disp_layer_info {
 };
 
 /**
- * struct zynqmp_disp_layer - Display layer (DRM plane)
- * @plane: DRM plane
+ * struct zynqmp_disp_layer - Display layer
  * @id: Layer ID
  * @disp: Back pointer to struct zynqmp_disp
  * @info: Static layer information
@@ -181,7 +179,7 @@ struct zynqmp_disp {
 		void __iomem *base;
 	} audio;
 
-	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
+	struct zynqmp_disp_layer layers[ZYNQMP_DPSUB_NUM_LAYERS];
 };
 
 /* -----------------------------------------------------------------------------
@@ -1189,6 +1187,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
+		struct drm_plane *plane = &disp->dpsub->planes[i];
 		enum drm_plane_type type;
 		unsigned int num_formats;
 		u32 *formats;
@@ -1200,7 +1199,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 		/* Graphics layer is primary, and video layer is overlay. */
 		type = zynqmp_disp_layer_is_video(layer)
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
-		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
+		ret = drm_universal_plane_init(disp->drm, plane, 0,
 					       &zynqmp_disp_plane_funcs,
 					       formats, num_formats,
 					       NULL, type, NULL);
@@ -1208,12 +1207,11 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 		if (ret)
 			return ret;
 
-		drm_plane_helper_add(&layer->plane,
-				     &zynqmp_disp_plane_helper_funcs);
+		drm_plane_helper_add(plane, &zynqmp_disp_plane_helper_funcs);
 
-		drm_plane_create_zpos_immutable_property(&layer->plane, i);
+		drm_plane_create_zpos_immutable_property(plane, i);
 		if (zynqmp_disp_layer_is_gfx(layer))
-			drm_plane_create_alpha_property(&layer->plane);
+			drm_plane_create_alpha_property(plane);
 	}
 
 	return 0;
@@ -1533,7 +1531,7 @@ static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
 
 static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
 {
-	struct drm_plane *plane = &disp->layers[ZYNQMP_DISP_LAYER_GFX].plane;
+	struct drm_plane *plane = &disp->dpsub->planes[ZYNQMP_DISP_LAYER_GFX];
 	struct drm_crtc *crtc = &disp->dpsub->crtc;
 	int ret;
 
@@ -1556,7 +1554,7 @@ static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
-		disp->layers[i].plane.possible_crtcs = possible_crtcs;
+		disp->dpsub->planes[i].possible_crtcs = possible_crtcs;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index ba52dbed5ba0..6f4e78b2a7c0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -17,9 +17,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
-#include <drm/drm_connector.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -29,12 +27,12 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
 #include "zynqmp_dpsub.h"
+#include "zynqmp_kms.h"
 
 /* -----------------------------------------------------------------------------
  * Dumb Buffer & Framebuffer Allocation
@@ -97,8 +95,6 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 
 static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 {
-	struct drm_encoder *encoder = &dpsub->encoder;
-	struct drm_connector *connector;
 	struct drm_device *drm = &dpsub->drm;
 	int ret;
 
@@ -119,46 +115,10 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 	drm_kms_helper_poll_init(drm);
 
-	/*
-	 * Initialize the DISP and DP components. This will creates planes,
-	 * CRTC, and a bridge for the DP encoder.
-	 */
-	ret = zynqmp_disp_drm_init(dpsub);
-	if (ret)
+	ret = zynqmp_dpsub_kms_init(dpsub);
+	if (ret < 0)
 		goto err_poll_fini;
 
-	ret = zynqmp_dp_drm_init(dpsub);
-	if (ret)
-		goto err_poll_fini;
-
-	/* Create the encoder and attach the bridge. */
-	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
-	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
-
-	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
-				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-	if (ret) {
-		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
-		goto err_poll_fini;
-	}
-
-	/* Create the connector for the chain of bridges. */
-	connector = drm_bridge_connector_init(drm, encoder);
-	if (IS_ERR(connector)) {
-		dev_err(dpsub->dev, "failed to created connector\n");
-		ret = PTR_ERR(connector);
-		goto err_poll_fini;
-	}
-
-	ret = drm_connector_attach_encoder(connector, encoder);
-	if (ret < 0) {
-		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
-		goto err_poll_fini;
-	}
-
-	drm_bridge_connector_enable_hpd(connector);
-	dpsub->connector = connector;
-
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index a0a7d66efdb2..5b8bbbfd06e0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -14,6 +14,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 
 struct clk;
 struct device;
@@ -22,6 +23,8 @@ struct drm_device;
 struct zynqmp_disp;
 struct zynqmp_dp;
 
+#define ZYNQMP_DPSUB_NUM_LAYERS				2
+
 enum zynqmp_dpsub_format {
 	ZYNQMP_DPSUB_FORMAT_RGB,
 	ZYNQMP_DPSUB_FORMAT_YCRCB444,
@@ -38,6 +41,7 @@ enum zynqmp_dpsub_format {
  * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
  * @aud_clk: Audio clock
  * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
+ * @planes: The DRM planes
  * @crtc: The DRM CRTC
  * @encoder: The dummy DRM encoder
  * @connector: The DP connector
@@ -56,6 +60,7 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
+	struct drm_plane planes[ZYNQMP_DPSUB_NUM_LAYERS];
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
new file mode 100644
index 000000000000..a18b57f7aab7
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP DisplayPort Subsystem - KMS API
+ *
+ * Copyright (C) 2017 - 2021 Xilinx, Inc.
+ *
+ * Authors:
+ * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_encoder.h>
+#include <drm/drm_simple_kms_helper.h>
+
+#include "zynqmp_disp.h"
+#include "zynqmp_dp.h"
+#include "zynqmp_dpsub.h"
+#include "zynqmp_kms.h"
+
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
+int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
+{
+	struct drm_encoder *encoder = &dpsub->encoder;
+	struct drm_connector *connector;
+	int ret;
+
+	/*
+	 * Initialize the DISP and DP components. This will creates planes,
+	 * CRTC, and a bridge for the DP encoder.
+	 */
+	ret = zynqmp_disp_drm_init(dpsub);
+	if (ret)
+		return ret;
+
+	ret = zynqmp_dp_drm_init(dpsub);
+	if (ret)
+		return ret;
+
+	/* Create the encoder and attach the bridge. */
+	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
+	drm_simple_encoder_init(&dpsub->drm, encoder, DRM_MODE_ENCODER_NONE);
+
+	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
+		return ret;
+	}
+
+	/* Create the connector for the chain of bridges. */
+	connector = drm_bridge_connector_init(&dpsub->drm, encoder);
+	if (IS_ERR(connector)) {
+		dev_err(dpsub->dev, "failed to created connector\n");
+		return PTR_ERR(connector);
+	}
+
+	ret = drm_connector_attach_encoder(connector, encoder);
+	if (ret < 0) {
+		dev_err(dpsub->dev, "failed to attach connector to encoder\n");
+		return ret;
+	}
+
+	drm_bridge_connector_enable_hpd(connector);
+	dpsub->connector = connector;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
new file mode 100644
index 000000000000..a6729d9d82cc
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ZynqMP DisplayPort Subsystem - KMS API
+ *
+ * Copyright (C) 2017 - 2021 Xilinx, Inc.
+ *
+ * Authors:
+ * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+ */
+
+#ifndef _ZYNQMP_KMS_H_
+#define _ZYNQMP_KMS_H_
+
+struct zynqmp_dpsub;
+
+int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub);
+
+#endif /* _ZYNQMP_KMS_H_ */
-- 
Regards,

Laurent Pinchart

