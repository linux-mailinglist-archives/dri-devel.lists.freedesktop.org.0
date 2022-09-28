Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E665EE9A7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6AC10E77F;
	Wed, 28 Sep 2022 22:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D211910E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F1F76DB;
 Thu, 29 Sep 2022 00:47:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405278;
 bh=kbauzpuyO+rU3ERz5TF9bgHqeOiLlXERhmm9KzD3JOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bclcxL77eebugiU5Oe0QvoJEbhADaH2xL0/aQ4blMaXmmEtPFpJdXuNArtjLvnxJp
 A+sWEUogrgzopyo8SaP6YilRgMmxCrUAkTibE0wFIMTwaq1zRxFVoh6Wr71AFmeE/J
 vxWTWJVlECZylVSu6WaJe9CHARnejnwvvW9wq4Ek=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/37] drm: xlnx: zynqmp_dpsub: Move planes to zynqmp_dpsub
 structure
Date: Thu, 29 Sep 2022 01:47:04 +0300
Message-Id: <20220928224719.3291-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
References: <20220928224719.3291-1-laurent.pinchart@ideasonboard.com>
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
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Decouple the zynqmp_disp, which handles the hardware configuration, from
the DRM planes by moving the planes to the zynqmp_dpsub structure. The
planes handling code will be moved to a separate file in a subsequent
step.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 32 ++++++++++++-----------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  5 +++++
 2 files changed, 18 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 94073cdfd714..3b3aef42a390 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -73,7 +73,6 @@
 #define ZYNQMP_DISP_AV_BUF_NUM_VID_GFX_BUFFERS		4
 #define ZYNQMP_DISP_AV_BUF_NUM_BUFFERS			6
 
-#define ZYNQMP_DISP_NUM_LAYERS				2
 #define ZYNQMP_DISP_MAX_NUM_SUB_PLANES			3
 
 /**
@@ -135,8 +134,7 @@ struct zynqmp_disp_layer_info {
 };
 
 /**
- * struct zynqmp_disp_layer - Display layer (DRM plane)
- * @plane: DRM plane
+ * struct zynqmp_disp_layer - Display layer
  * @id: Layer ID
  * @disp: Back pointer to struct zynqmp_disp
  * @info: Static layer information
@@ -146,7 +144,6 @@ struct zynqmp_disp_layer_info {
  * @mode: Current operation mode
  */
 struct zynqmp_disp_layer {
-	struct drm_plane plane;
 	enum zynqmp_disp_layer_id id;
 	struct zynqmp_disp *disp;
 	const struct zynqmp_disp_layer_info *info;
@@ -183,7 +180,7 @@ struct zynqmp_disp {
 		void __iomem *base;
 	} audio;
 
-	struct zynqmp_disp_layer layers[ZYNQMP_DISP_NUM_LAYERS];
+	struct zynqmp_disp_layer layers[ZYNQMP_DPSUB_NUM_LAYERS];
 };
 
 /* -----------------------------------------------------------------------------
@@ -1092,11 +1089,6 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 	return 0;
 }
 
-static inline struct zynqmp_disp_layer *plane_to_layer(struct drm_plane *plane)
-{
-	return container_of(plane, struct zynqmp_disp_layer, plane);
-}
-
 static int
 zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
 			       struct drm_atomic_state *state)
@@ -1125,7 +1117,8 @@ zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
 									   plane);
-	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_disp_layer *layer = &dpsub->disp->layers[plane->index];
 
 	if (!old_state->fb)
 		return;
@@ -1143,7 +1136,8 @@ zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
-	struct zynqmp_disp_layer *layer = plane_to_layer(plane);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_disp_layer *layer = &dpsub->disp->layers[plane->index];
 	bool format_changed = false;
 
 	if (!old_state->fb ||
@@ -1195,6 +1189,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
 		struct zynqmp_disp_layer *layer = &disp->layers[i];
+		struct drm_plane *plane = &disp->dpsub->planes[i];
 		enum drm_plane_type type;
 		unsigned int num_formats;
 		u32 *formats;
@@ -1206,7 +1201,7 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 		/* Graphics layer is primary, and video layer is overlay. */
 		type = zynqmp_disp_layer_is_video(layer)
 		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
-		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
+		ret = drm_universal_plane_init(disp->drm, plane, 0,
 					       &zynqmp_disp_plane_funcs,
 					       formats, num_formats,
 					       NULL, type, NULL);
@@ -1214,12 +1209,11 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
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
@@ -1539,7 +1533,7 @@ static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
 
 static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
 {
-	struct drm_plane *plane = &disp->layers[ZYNQMP_DISP_LAYER_GFX].plane;
+	struct drm_plane *plane = &disp->dpsub->planes[ZYNQMP_DISP_LAYER_GFX];
 	struct drm_crtc *crtc = &disp->dpsub->crtc;
 	int ret;
 
@@ -1562,7 +1556,7 @@ static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
-		disp->layers[i].plane.possible_crtcs = possible_crtcs;
+		disp->dpsub->planes[i].possible_crtcs = possible_crtcs;
 }
 
 /* -----------------------------------------------------------------------------
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 4ee0dc69ebee..2a955895404f 100644
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
  * @bridge: The DP encoder bridge
@@ -55,6 +59,7 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
+	struct drm_plane planes[ZYNQMP_DPSUB_NUM_LAYERS];
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_bridge *bridge;
-- 
Regards,

Laurent Pinchart

