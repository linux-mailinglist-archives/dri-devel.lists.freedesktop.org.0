Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A05EE9AA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:49:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D4210E77D;
	Wed, 28 Sep 2022 22:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533E610E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:04 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAEF247C;
 Thu, 29 Sep 2022 00:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405282;
 bh=9h0DVvp1WWo+GNJf0Kj0VTn0NvzpF7hWhQiyd51dhvA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F8gTYovtKul2KELSgBhT48lo4C+bwVHcP0rA6DALxgnEoIBTROXZLOKO5/RNor+Ai
 RU1IiFr/OhwMneZ5S61pgD/mByL/H04iLRnywUFen2SflkPczE8XVwkHnHr528Dip/
 KKE2urzg1CwDmQjvRfBLtHLljyfv6jUiU2IA1tNk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 25/37] drm: xlnx: zynqmp_dpsub: Move planes handling to
 zynqmp_kms.c
Date: Thu, 29 Sep 2022 01:47:07 +0300
Message-Id: <20220928224719.3291-26-laurent.pinchart@ideasonboard.com>
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

Decouple the planes handling from the display controller programming by
moving the corresponding code from zynqmp_disp.c to zynqmp_kms.c. This
prepares for using the DPSUB with a live video input, without creating
DRM planes in the DPSUB driver.

While at it, fix a typo in a comment.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 170 ++--------------------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h  |  19 +++-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |   2 +
 drivers/gpu/drm/xlnx/zynqmp_kms.c   | 145 +++++++++++++++++++++++-
 4 files changed, 167 insertions(+), 169 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 7bf7e2113ef0..2df946f93575 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -9,16 +9,11 @@
  * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
-#include <drm/drm_atomic.h>
-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_blend.h>
-#include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
-#include <drm/drm_plane_helper.h>
 
 #include <linux/clk.h>
 #include <linux/dma/xilinx_dpdma.h>
@@ -142,7 +137,6 @@ struct zynqmp_disp_layer {
 /**
  * struct zynqmp_disp - Display controller
  * @dev: Device structure
- * @drm: DRM core
  * @dpsub: Display subsystem
  * @blend.base: Register I/O base address for the blender
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
@@ -151,7 +145,6 @@ struct zynqmp_disp_layer {
  */
 struct zynqmp_disp {
 	struct device *dev;
-	struct drm_device *drm;
 	struct zynqmp_dpsub *dpsub;
 
 	struct {
@@ -381,11 +374,6 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp *disp, int reg, u32 val)
 	writel(val, disp->avbuf.base + reg);
 }
 
-static bool zynqmp_disp_layer_is_gfx(const struct zynqmp_disp_layer *layer)
-{
-	return layer->id == ZYNQMP_DPSUB_LAYER_GFX;
-}
-
 static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 {
 	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
@@ -723,8 +711,8 @@ static void zynqmp_disp_blend_set_bg_color(struct zynqmp_disp *disp,
  * @enable: True to enable global alpha blending
  * @alpha: Global alpha value (ignored if @enabled is false)
  */
-static void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
-					       bool enable, u32 alpha)
+void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
+					bool enable, u32 alpha)
 {
 	zynqmp_disp_blend_write(disp, ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA,
 				ZYNQMP_DISP_V_BLEND_SET_GLOBAL_ALPHA_VALUE(alpha) |
@@ -905,8 +893,8 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  * supported by the layer. The number of formats in the array is returned
  * through the num_formats argument.
  */
-static u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
-					  unsigned int *num_formats)
+u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
+				   unsigned int *num_formats)
 {
 	unsigned int i;
 	u32 *formats;
@@ -930,7 +918,7 @@ static u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
  * Enable the @layer in the audio/video buffer manager and the blender. DMA
  * channels are started separately by zynqmp_disp_layer_update().
  */
-static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
 	zynqmp_disp_avbuf_enable_video(layer->disp, layer,
 				       ZYNQMP_DISP_LAYER_NONLIVE);
@@ -946,7 +934,7 @@ static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
  * Disable the layer by stopping its DMA channels and disabling it in the
  * audio/video buffer manager and the blender.
  */
-static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
+void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 {
 	unsigned int i;
 
@@ -964,8 +952,8 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
  *
  * Set the format for @layer to @info. The layer must be disabled.
  */
-static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
-					 const struct drm_format_info *info)
+void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
+				  const struct drm_format_info *info)
 {
 	unsigned int i;
 
@@ -1003,8 +991,8 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
  *
  * Return: 0 on success, or the DMA descriptor failure error otherwise
  */
-static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
-				    struct drm_plane_state *state)
+int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
+			     struct drm_plane_state *state)
 {
 	const struct drm_format_info *info = layer->drm_fmt;
 	unsigned int i;
@@ -1044,136 +1032,6 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 	return 0;
 }
 
-static int
-zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
-			       struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	struct drm_crtc_state *crtc_state;
-
-	if (!new_plane_state->crtc)
-		return 0;
-
-	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
-	if (IS_ERR(crtc_state))
-		return PTR_ERR(crtc_state);
-
-	return drm_atomic_helper_check_plane_state(new_plane_state,
-						   crtc_state,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_HELPER_NO_SCALING,
-						   false, false);
-}
-
-void
-zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
-				 struct drm_atomic_state *state)
-{
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
-	struct zynqmp_disp_layer *layer = &dpsub->disp->layers[plane->index];
-
-	if (!old_state->fb)
-		return;
-
-	zynqmp_disp_layer_disable(layer);
-
-	if (zynqmp_disp_layer_is_gfx(layer))
-		zynqmp_disp_blend_set_global_alpha(layer->disp, false,
-						   plane->state->alpha >> 8);
-}
-
-static void
-zynqmp_disp_plane_atomic_update(struct drm_plane *plane,
-				struct drm_atomic_state *state)
-{
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
-	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
-	struct zynqmp_disp_layer *layer = &dpsub->disp->layers[plane->index];
-	bool format_changed = false;
-
-	if (!old_state->fb ||
-	    old_state->fb->format->format != new_state->fb->format->format)
-		format_changed = true;
-
-	/*
-	 * If the format has changed (including going from a previously
-	 * disabled state to any format), reconfigure the format. Disable the
-	 * plane first if needed.
-	 */
-	if (format_changed) {
-		if (old_state->fb)
-			zynqmp_disp_layer_disable(layer);
-
-		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
-	}
-
-	zynqmp_disp_layer_update(layer, new_state);
-
-	if (zynqmp_disp_layer_is_gfx(layer))
-		zynqmp_disp_blend_set_global_alpha(layer->disp, true,
-						   plane->state->alpha >> 8);
-
-	/* Enable or re-enable the plane is the format has changed. */
-	if (format_changed)
-		zynqmp_disp_layer_enable(layer);
-}
-
-static const struct drm_plane_helper_funcs zynqmp_disp_plane_helper_funcs = {
-	.atomic_check		= zynqmp_disp_plane_atomic_check,
-	.atomic_update		= zynqmp_disp_plane_atomic_update,
-	.atomic_disable		= zynqmp_disp_plane_atomic_disable,
-};
-
-static const struct drm_plane_funcs zynqmp_disp_plane_funcs = {
-	.update_plane		= drm_atomic_helper_update_plane,
-	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
-};
-
-static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < ARRAY_SIZE(disp->layers); i++) {
-		struct zynqmp_disp_layer *layer = &disp->layers[i];
-		struct drm_plane *plane = &disp->dpsub->planes[i];
-		enum drm_plane_type type;
-		unsigned int num_formats;
-		u32 *formats;
-
-		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
-		if (!formats)
-			return -ENOMEM;
-
-		/* Graphics layer is primary, and video layer is overlay. */
-		type = zynqmp_disp_layer_is_video(layer)
-		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
-		ret = drm_universal_plane_init(disp->drm, plane, 0,
-					       &zynqmp_disp_plane_funcs,
-					       formats, num_formats,
-					       NULL, type, NULL);
-		kfree(formats);
-		if (ret)
-			return ret;
-
-		drm_plane_helper_add(plane, &zynqmp_disp_plane_helper_funcs);
-
-		drm_plane_create_zpos_immutable_property(plane, i);
-		if (zynqmp_disp_layer_is_gfx(layer))
-			drm_plane_create_alpha_property(plane);
-	}
-
-	return 0;
-}
-
 /**
  * zynqmp_disp_layer_release_dma - Release DMA channels for a layer
  * @disp: Display controller
@@ -1281,6 +1139,8 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 		ret = zynqmp_disp_layer_request_dma(disp, layer);
 		if (ret)
 			goto err;
+
+		disp->dpsub->layers[i] = layer;
 	}
 
 	return 0;
@@ -1365,11 +1225,6 @@ int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
  * Initialization & Cleanup
  */
 
-int zynqmp_disp_drm_init(struct zynqmp_dpsub *dpsub)
-{
-	return zynqmp_disp_create_planes(dpsub->disp);
-}
-
 int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 {
 	struct platform_device *pdev = to_platform_device(dpsub->dev);
@@ -1384,7 +1239,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 
 	disp->dev = &pdev->dev;
 	disp->dpsub = dpsub;
-	disp->drm = drm;
 
 	dpsub->disp = disp;
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 57cd540f550f..663f7d67c78f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -25,11 +25,12 @@
 #define ZYNQMP_DISP_MAX_DMA_BIT				44
 
 struct device;
-struct drm_atomic_state;
 struct drm_device;
-struct drm_plane;
+struct drm_format_info;
+struct drm_plane_state;
 struct platform_device;
 struct zynqmp_disp;
+struct zynqmp_disp_layer;
 struct zynqmp_dpsub;
 
 /**
@@ -47,10 +48,18 @@ void zynqmp_disp_disable(struct zynqmp_disp *disp);
 int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 			    unsigned long mode_clock);
 
-void zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
-				      struct drm_atomic_state *state);
+void zynqmp_disp_blend_set_global_alpha(struct zynqmp_disp *disp,
+					bool enable, u32 alpha);
+
+u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
+				   unsigned int *num_formats);
+void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer);
+void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer);
+void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
+				  const struct drm_format_info *info);
+int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
+			     struct drm_plane_state *state);
 
-int zynqmp_disp_drm_init(struct zynqmp_dpsub *dpsub);
 int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
 void zynqmp_disp_remove(struct zynqmp_dpsub *dpsub);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 2a955895404f..bad9148d2d3e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -21,6 +21,7 @@ struct device;
 struct drm_bridge;
 struct drm_device;
 struct zynqmp_disp;
+struct zynqmp_disp_layer;
 struct zynqmp_dp;
 
 #define ZYNQMP_DPSUB_NUM_LAYERS				2
@@ -65,6 +66,7 @@ struct zynqmp_dpsub {
 	struct drm_bridge *bridge;
 
 	struct zynqmp_disp *disp;
+	struct zynqmp_disp_layer *layers[ZYNQMP_DPSUB_NUM_LAYERS];
 	struct zynqmp_dp *dp;
 
 	unsigned int dma_align;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 8162bf18537b..1445337de478 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -11,12 +11,17 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -30,6 +35,137 @@
 #include "zynqmp_dpsub.h"
 #include "zynqmp_kms.h"
 
+/* -----------------------------------------------------------------------------
+ * DRM Planes
+ */
+
+static int zynqmp_dpsub_plane_atomic_check(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
+										 plane);
+	struct drm_crtc_state *crtc_state;
+
+	if (!new_plane_state->crtc)
+		return 0;
+
+	crtc_state = drm_atomic_get_crtc_state(state, new_plane_state->crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	return drm_atomic_helper_check_plane_state(new_plane_state,
+						   crtc_state,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   DRM_PLANE_HELPER_NO_SCALING,
+						   false, false);
+}
+
+static void zynqmp_dpsub_plane_atomic_disable(struct drm_plane *plane,
+					      struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
+									   plane);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_disp_layer *layer = dpsub->layers[plane->index];
+
+	if (!old_state->fb)
+		return;
+
+	zynqmp_disp_layer_disable(layer);
+
+	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
+		zynqmp_disp_blend_set_global_alpha(dpsub->disp, false,
+						   plane->state->alpha >> 8);
+}
+
+static void zynqmp_dpsub_plane_atomic_update(struct drm_plane *plane,
+					     struct drm_atomic_state *state)
+{
+	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state, plane);
+	struct zynqmp_dpsub *dpsub = to_zynqmp_dpsub(plane->dev);
+	struct zynqmp_disp_layer *layer = dpsub->layers[plane->index];
+	bool format_changed = false;
+
+	if (!old_state->fb ||
+	    old_state->fb->format->format != new_state->fb->format->format)
+		format_changed = true;
+
+	/*
+	 * If the format has changed (including going from a previously
+	 * disabled state to any format), reconfigure the format. Disable the
+	 * plane first if needed.
+	 */
+	if (format_changed) {
+		if (old_state->fb)
+			zynqmp_disp_layer_disable(layer);
+
+		zynqmp_disp_layer_set_format(layer, new_state->fb->format);
+	}
+
+	zynqmp_disp_layer_update(layer, new_state);
+
+	if (plane->index == ZYNQMP_DPSUB_LAYER_GFX)
+		zynqmp_disp_blend_set_global_alpha(dpsub->disp, true,
+						   plane->state->alpha >> 8);
+
+	/* Enable or re-enable the plane if the format has changed. */
+	if (format_changed)
+		zynqmp_disp_layer_enable(layer);
+}
+
+static const struct drm_plane_helper_funcs zynqmp_dpsub_plane_helper_funcs = {
+	.atomic_check		= zynqmp_dpsub_plane_atomic_check,
+	.atomic_update		= zynqmp_dpsub_plane_atomic_update,
+	.atomic_disable		= zynqmp_dpsub_plane_atomic_disable,
+};
+
+static const struct drm_plane_funcs zynqmp_dpsub_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static int zynqmp_dpsub_create_planes(struct zynqmp_dpsub *dpsub)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(dpsub->planes); i++) {
+		struct zynqmp_disp_layer *layer = dpsub->layers[i];
+		struct drm_plane *plane = &dpsub->planes[i];
+		enum drm_plane_type type;
+		unsigned int num_formats;
+		u32 *formats;
+
+		formats = zynqmp_disp_layer_drm_formats(layer, &num_formats);
+		if (!formats)
+			return -ENOMEM;
+
+		/* Graphics layer is primary, and video layer is overlay. */
+		type = i == ZYNQMP_DPSUB_LAYER_VID
+		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
+		ret = drm_universal_plane_init(&dpsub->drm, plane, 0,
+					       &zynqmp_dpsub_plane_funcs,
+					       formats, num_formats,
+					       NULL, type, NULL);
+		kfree(formats);
+		if (ret)
+			return ret;
+
+		drm_plane_helper_add(plane, &zynqmp_dpsub_plane_helper_funcs);
+
+		drm_plane_create_zpos_immutable_property(plane, i);
+		if (i == ZYNQMP_DPSUB_LAYER_GFX)
+			drm_plane_create_alpha_property(plane);
+	}
+
+	return 0;
+}
+
 /* -----------------------------------------------------------------------------
  * DRM CRTC
  */
@@ -78,7 +214,7 @@ static void zynqmp_dpsub_crtc_atomic_disable(struct drm_crtc *crtc,
 	 */
 	old_plane_state = drm_atomic_get_old_plane_state(state, crtc->primary);
 	if (old_plane_state)
-		zynqmp_disp_plane_atomic_disable(crtc->primary, state);
+		zynqmp_dpsub_plane_atomic_disable(crtc->primary, state);
 
 	zynqmp_disp_disable(dpsub->disp);
 
@@ -212,11 +348,8 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	struct drm_connector *connector;
 	int ret;
 
-	/*
-	 * Initialize the DISP and DP components. This will creates planes,
-	 * CRTC, and a bridge for the DP encoder.
-	 */
-	ret = zynqmp_disp_drm_init(dpsub);
+	/* Create the planes and the CRTC, and initialize the DP encoder. */
+	ret = zynqmp_dpsub_create_planes(dpsub);
 	if (ret)
 		return ret;
 
-- 
Regards,

Laurent Pinchart

