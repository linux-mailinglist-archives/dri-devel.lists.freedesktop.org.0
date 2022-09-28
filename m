Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218D5EE99D
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6296F10E502;
	Wed, 28 Sep 2022 22:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45F910E502
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:48:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 426696DB;
 Thu, 29 Sep 2022 00:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405281;
 bh=tOyaFuMJrX8NvcN52eKodOhkTMasYYYpdnzur3FYSp4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a8Egp60+U8azGYnIv60Q19SP1Ho3Dd31hGTKYy4ciMH3bKAZFSKLfHH1X+Fq6ckLt
 jp64LDwbkqGLNvkPXsFNlmXTrY+VyUfnb6GMlFSERwVnaT0i0tBL9F5KWT/t07HUWg
 rZDNe4GpyV2iFp/XX6Tpi69uXQesPjGRqvmvZck8=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 24/37] drm: xlnx: zynqmp_dpsub: Move CRTC handling to
 zynqmp_kms.c
Date: Thu, 29 Sep 2022 01:47:06 +0300
Message-Id: <20220928224719.3291-25-laurent.pinchart@ideasonboard.com>
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

Decouple the CRTC handling from the display controller programming by
moving the corresponding code from zynqmp_disp.c to zynqmp_kms.c. This
prepares for using the DPSUB with a live video input, without creating a
DRM CRTC in the DPSUB driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 251 +++--------------------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h |  21 ++-
 drivers/gpu/drm/xlnx/zynqmp_dp.c   |   3 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c  | 190 +++++++++++++++++++++-
 drivers/gpu/drm/xlnx/zynqmp_kms.h  |   2 +
 5 files changed, 232 insertions(+), 235 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3b3aef42a390..7bf7e2113ef0 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -11,9 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
@@ -21,18 +19,14 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
-#include <drm/drm_vblank.h>
 
 #include <linux/clk.h>
-#include <linux/delay.h>
 #include <linux/dma/xilinx_dpdma.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
-#include <linux/spinlock.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_disp_regs.h"
@@ -89,16 +83,6 @@ struct zynqmp_disp_format {
 	const u32 *sf;
 };
 
-/**
- * enum zynqmp_disp_layer_id - Layer identifier
- * @ZYNQMP_DISP_LAYER_VID: Video layer
- * @ZYNQMP_DISP_LAYER_GFX: Graphics layer
- */
-enum zynqmp_disp_layer_id {
-	ZYNQMP_DISP_LAYER_VID,
-	ZYNQMP_DISP_LAYER_GFX
-};
-
 /**
  * enum zynqmp_disp_layer_mode - Layer mode
  * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
@@ -144,7 +128,7 @@ struct zynqmp_disp_layer_info {
  * @mode: Current operation mode
  */
 struct zynqmp_disp_layer {
-	enum zynqmp_disp_layer_id id;
+	enum zynqmp_dpsub_layer_id id;
 	struct zynqmp_disp *disp;
 	const struct zynqmp_disp_layer_info *info;
 
@@ -399,12 +383,12 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp *disp, int reg, u32 val)
 
 static bool zynqmp_disp_layer_is_gfx(const struct zynqmp_disp_layer *layer)
 {
-	return layer->id == ZYNQMP_DISP_LAYER_GFX;
+	return layer->id == ZYNQMP_DPSUB_LAYER_GFX;
 }
 
 static bool zynqmp_disp_layer_is_video(const struct zynqmp_disp_layer *layer)
 {
-	return layer->id == ZYNQMP_DISP_LAYER_VID;
+	return layer->id == ZYNQMP_DPSUB_LAYER_VID;
 }
 
 /**
@@ -883,35 +867,6 @@ static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
 				ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST);
 }
 
-/* -----------------------------------------------------------------------------
- * ZynqMP Display external functions for zynqmp_dp
- */
-
-/**
- * zynqmp_disp_handle_vblank - Handle the vblank event
- * @disp: Display controller
- *
- * This function handles the vblank interrupt, and sends an event to
- * CRTC object. This will be called by the DP vblank interrupt handler.
- */
-void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
-{
-	struct drm_crtc *crtc = &disp->dpsub->crtc;
-
-	drm_crtc_handle_vblank(crtc);
-}
-
-/**
- * zynqmp_disp_get_crtc_mask - Return the CRTC bit mask
- * @disp: Display controller
- *
- * Return: the crtc mask of the zyqnmp_disp CRTC.
- */
-uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp)
-{
-	return drm_crtc_mask(&disp->dpsub->crtc);
-}
-
 /* -----------------------------------------------------------------------------
  * ZynqMP Display Layer & DRM Plane
  */
@@ -1111,7 +1066,7 @@ zynqmp_disp_plane_atomic_check(struct drm_plane *plane,
 						   false, false);
 }
 
-static void
+void
 zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
 				 struct drm_atomic_state *state)
 {
@@ -1301,12 +1256,12 @@ static int zynqmp_disp_layer_request_dma(struct zynqmp_disp *disp,
 static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 {
 	static const struct zynqmp_disp_layer_info layer_info[] = {
-		[ZYNQMP_DISP_LAYER_VID] = {
+		[ZYNQMP_DPSUB_LAYER_VID] = {
 			.formats = avbuf_vid_fmts,
 			.num_formats = ARRAY_SIZE(avbuf_vid_fmts),
 			.num_channels = 3,
 		},
-		[ZYNQMP_DISP_LAYER_GFX] = {
+		[ZYNQMP_DPSUB_LAYER_GFX] = {
 			.formats = avbuf_gfx_fmts,
 			.num_formats = ARRAY_SIZE(avbuf_gfx_fmts),
 			.num_channels = 1,
@@ -1336,14 +1291,14 @@ static int zynqmp_disp_create_layers(struct zynqmp_disp *disp)
 }
 
 /* -----------------------------------------------------------------------------
- * ZynqMP Display & DRM CRTC
+ * ZynqMP Display
  */
 
 /**
  * zynqmp_disp_enable - Enable the display controller
  * @disp: Display controller
  */
-static void zynqmp_disp_enable(struct zynqmp_disp *disp)
+void zynqmp_disp_enable(struct zynqmp_disp *disp)
 {
 	zynqmp_disp_blend_set_output_format(disp, ZYNQMP_DPSUB_FORMAT_RGB);
 	zynqmp_disp_blend_set_bg_color(disp, 0, 0, 0);
@@ -1363,7 +1318,7 @@ static void zynqmp_disp_enable(struct zynqmp_disp *disp)
  * zynqmp_disp_disable - Disable the display controller
  * @disp: Display controller
  */
-static void zynqmp_disp_disable(struct zynqmp_disp *disp)
+void zynqmp_disp_disable(struct zynqmp_disp *disp)
 {
 	zynqmp_disp_audio_disable(disp);
 
@@ -1372,8 +1327,15 @@ static void zynqmp_disp_disable(struct zynqmp_disp *disp)
 	zynqmp_disp_avbuf_disable(disp);
 }
 
-static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
-				   unsigned long mode_clock)
+/**
+ * zynqmp_disp_setup_clock - Configure the display controller pixel clock rate
+ * @disp: Display controller
+ * @mode_clock: The pixel clock rate, in Hz
+ *
+ * Return: 0 on success, or a negative error clock otherwise
+ */
+int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
+			    unsigned long mode_clock)
 {
 	unsigned long rate;
 	long diff;
@@ -1399,186 +1361,13 @@ static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 	return 0;
 }
 
-static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
-{
-	return container_of(crtc, struct zynqmp_dpsub, crtc)->disp;
-}
-
-static void
-zynqmp_disp_crtc_atomic_enable(struct drm_crtc *crtc,
-			       struct drm_atomic_state *state)
-{
-	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
-	int ret, vrefresh;
-
-	pm_runtime_get_sync(disp->dev);
-
-	zynqmp_disp_setup_clock(disp, adjusted_mode->clock * 1000);
-
-	ret = clk_prepare_enable(disp->dpsub->vid_clk);
-	if (ret) {
-		dev_err(disp->dev, "failed to enable the video clock\n");
-		pm_runtime_put_sync(disp->dev);
-		return;
-	}
-
-	zynqmp_disp_enable(disp);
-
-	/* Delay of 3 vblank intervals for timing gen to be stable */
-	vrefresh = (adjusted_mode->clock * 1000) /
-		   (adjusted_mode->vtotal * adjusted_mode->htotal);
-	msleep(3 * 1000 / vrefresh);
-}
-
-static void
-zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
-				struct drm_atomic_state *state)
-{
-	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-	struct drm_plane_state *old_plane_state;
-
-	/*
-	 * Disable the plane if active. The old plane state can be NULL in the
-	 * .shutdown() path if the plane is already disabled, skip
-	 * zynqmp_disp_plane_atomic_disable() in that case.
-	 */
-	old_plane_state = drm_atomic_get_old_plane_state(state, crtc->primary);
-	if (old_plane_state)
-		zynqmp_disp_plane_atomic_disable(crtc->primary, state);
-
-	zynqmp_disp_disable(disp);
-
-	drm_crtc_vblank_off(crtc);
-
-	spin_lock_irq(&crtc->dev->event_lock);
-	if (crtc->state->event) {
-		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		crtc->state->event = NULL;
-	}
-	spin_unlock_irq(&crtc->dev->event_lock);
-
-	clk_disable_unprepare(disp->dpsub->vid_clk);
-	pm_runtime_put_sync(disp->dev);
-}
-
-static int zynqmp_disp_crtc_atomic_check(struct drm_crtc *crtc,
-					 struct drm_atomic_state *state)
-{
-	return drm_atomic_add_affected_planes(state, crtc);
-}
-
-static void
-zynqmp_disp_crtc_atomic_begin(struct drm_crtc *crtc,
-			      struct drm_atomic_state *state)
-{
-	drm_crtc_vblank_on(crtc);
-}
-
-static void
-zynqmp_disp_crtc_atomic_flush(struct drm_crtc *crtc,
-			      struct drm_atomic_state *state)
-{
-	if (crtc->state->event) {
-		struct drm_pending_vblank_event *event;
-
-		/* Consume the flip_done event from atomic helper. */
-		event = crtc->state->event;
-		crtc->state->event = NULL;
-
-		event->pipe = drm_crtc_index(crtc);
-
-		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
-
-		spin_lock_irq(&crtc->dev->event_lock);
-		drm_crtc_arm_vblank_event(crtc, event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-	}
-}
-
-static const struct drm_crtc_helper_funcs zynqmp_disp_crtc_helper_funcs = {
-	.atomic_enable	= zynqmp_disp_crtc_atomic_enable,
-	.atomic_disable	= zynqmp_disp_crtc_atomic_disable,
-	.atomic_check	= zynqmp_disp_crtc_atomic_check,
-	.atomic_begin	= zynqmp_disp_crtc_atomic_begin,
-	.atomic_flush	= zynqmp_disp_crtc_atomic_flush,
-};
-
-static int zynqmp_disp_crtc_enable_vblank(struct drm_crtc *crtc)
-{
-	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-
-	zynqmp_dp_enable_vblank(disp->dpsub->dp);
-
-	return 0;
-}
-
-static void zynqmp_disp_crtc_disable_vblank(struct drm_crtc *crtc)
-{
-	struct zynqmp_disp *disp = crtc_to_disp(crtc);
-
-	zynqmp_dp_disable_vblank(disp->dpsub->dp);
-}
-
-static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
-	.destroy		= drm_crtc_cleanup,
-	.set_config		= drm_atomic_helper_set_config,
-	.page_flip		= drm_atomic_helper_page_flip,
-	.reset			= drm_atomic_helper_crtc_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
-	.enable_vblank		= zynqmp_disp_crtc_enable_vblank,
-	.disable_vblank		= zynqmp_disp_crtc_disable_vblank,
-};
-
-static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
-{
-	struct drm_plane *plane = &disp->dpsub->planes[ZYNQMP_DISP_LAYER_GFX];
-	struct drm_crtc *crtc = &disp->dpsub->crtc;
-	int ret;
-
-	ret = drm_crtc_init_with_planes(disp->drm, crtc, plane,
-					NULL, &zynqmp_disp_crtc_funcs, NULL);
-	if (ret < 0)
-		return ret;
-
-	drm_crtc_helper_add(crtc, &zynqmp_disp_crtc_helper_funcs);
-
-	/* Start with vertical blanking interrupt reporting disabled. */
-	drm_crtc_vblank_off(crtc);
-
-	return 0;
-}
-
-static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
-{
-	u32 possible_crtcs = drm_crtc_mask(&disp->dpsub->crtc);
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
-		disp->dpsub->planes[i].possible_crtcs = possible_crtcs;
-}
-
 /* -----------------------------------------------------------------------------
  * Initialization & Cleanup
  */
 
 int zynqmp_disp_drm_init(struct zynqmp_dpsub *dpsub)
 {
-	struct zynqmp_disp *disp = dpsub->disp;
-	int ret;
-
-	ret = zynqmp_disp_create_planes(disp);
-	if (ret)
-		return ret;
-
-	ret = zynqmp_disp_create_crtc(disp);
-	if (ret < 0)
-		return ret;
-
-	zynqmp_disp_map_crtc_to_plane(disp);
-
-	return 0;
+	return zynqmp_disp_create_planes(dpsub->disp);
 }
 
 int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
@@ -1618,7 +1407,7 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm)
 	if (ret)
 		return ret;
 
-	layer = &disp->layers[ZYNQMP_DISP_LAYER_VID];
+	layer = &disp->layers[ZYNQMP_DPSUB_LAYER_VID];
 	dpsub->dma_align = 1 << layer->dmas[0].chan->device->copy_align;
 
 	return 0;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.h b/drivers/gpu/drm/xlnx/zynqmp_disp.h
index 1b7f90a81857..57cd540f550f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.h
@@ -25,13 +25,30 @@
 #define ZYNQMP_DISP_MAX_DMA_BIT				44
 
 struct device;
+struct drm_atomic_state;
 struct drm_device;
+struct drm_plane;
 struct platform_device;
 struct zynqmp_disp;
 struct zynqmp_dpsub;
 
-void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp);
-uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp);
+/**
+ * enum zynqmp_dpsub_layer_id - Layer identifier
+ * @ZYNQMP_DPSUB_LAYER_VID: Video layer
+ * @ZYNQMP_DPSUB_LAYER_GFX: Graphics layer
+ */
+enum zynqmp_dpsub_layer_id {
+	ZYNQMP_DPSUB_LAYER_VID,
+	ZYNQMP_DPSUB_LAYER_GFX,
+};
+
+void zynqmp_disp_enable(struct zynqmp_disp *disp);
+void zynqmp_disp_disable(struct zynqmp_disp *disp);
+int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
+			    unsigned long mode_clock);
+
+void zynqmp_disp_plane_atomic_disable(struct drm_plane *plane,
+				      struct drm_atomic_state *state);
 
 int zynqmp_disp_drm_init(struct zynqmp_dpsub *dpsub);
 int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub, struct drm_device *drm);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 3e4d164d40fe..7ad6a5d96c5f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -31,6 +31,7 @@
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
 #include "zynqmp_dpsub.h"
+#include "zynqmp_kms.h"
 
 static uint zynqmp_dp_aux_timeout_ms = 50;
 module_param_named(aux_timeout_ms, zynqmp_dp_aux_timeout_ms, uint, 0444);
@@ -1560,7 +1561,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 	zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
 
 	if (status & ZYNQMP_DP_INT_VBLANK_START)
-		zynqmp_disp_handle_vblank(dp->dpsub->disp);
+		zynqmp_dpsub_handle_vblank(dp->dpsub);
 
 	if (status & ZYNQMP_DP_INT_HPD_EVENT)
 		schedule_delayed_work(&dp->hpd_work, 0);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index e4e7f8fd96d2..8162bf18537b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -9,17 +9,199 @@
  * - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/drm_vblank.h>
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/spinlock.h>
 
 #include "zynqmp_disp.h"
 #include "zynqmp_dp.h"
 #include "zynqmp_dpsub.h"
 #include "zynqmp_kms.h"
 
+/* -----------------------------------------------------------------------------
+ * DRM CRTC
+ */
+
+static inline struct zynqmp_dpsub *crtc_to_dpsub(struct drm_crtc *crtc)
+{
+	return container_of(crtc, struct zynqmp_dpsub, crtc);
+}
+
+static void zynqmp_dpsub_crtc_atomic_enable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
+	struct zynqmp_dpsub *dpsub = crtc_to_dpsub(crtc);
+	struct drm_display_mode *adjusted_mode = &crtc->state->adjusted_mode;
+	int ret, vrefresh;
+
+	pm_runtime_get_sync(dpsub->dev);
+
+	zynqmp_disp_setup_clock(dpsub->disp, adjusted_mode->clock * 1000);
+
+	ret = clk_prepare_enable(dpsub->vid_clk);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to enable a pixel clock\n");
+		pm_runtime_put_sync(dpsub->dev);
+		return;
+	}
+
+	zynqmp_disp_enable(dpsub->disp);
+
+	/* Delay of 3 vblank intervals for timing gen to be stable */
+	vrefresh = (adjusted_mode->clock * 1000) /
+		   (adjusted_mode->vtotal * adjusted_mode->htotal);
+	msleep(3 * 1000 / vrefresh);
+}
+
+static void zynqmp_dpsub_crtc_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *state)
+{
+	struct zynqmp_dpsub *dpsub = crtc_to_dpsub(crtc);
+	struct drm_plane_state *old_plane_state;
+
+	/*
+	 * Disable the plane if active. The old plane state can be NULL in the
+	 * .shutdown() path if the plane is already disabled, skip
+	 * zynqmp_disp_plane_atomic_disable() in that case.
+	 */
+	old_plane_state = drm_atomic_get_old_plane_state(state, crtc->primary);
+	if (old_plane_state)
+		zynqmp_disp_plane_atomic_disable(crtc->primary, state);
+
+	zynqmp_disp_disable(dpsub->disp);
+
+	drm_crtc_vblank_off(crtc);
+
+	spin_lock_irq(&crtc->dev->event_lock);
+	if (crtc->state->event) {
+		drm_crtc_send_vblank_event(crtc, crtc->state->event);
+		crtc->state->event = NULL;
+	}
+	spin_unlock_irq(&crtc->dev->event_lock);
+
+	clk_disable_unprepare(dpsub->vid_clk);
+	pm_runtime_put_sync(dpsub->dev);
+}
+
+static int zynqmp_dpsub_crtc_atomic_check(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
+{
+	return drm_atomic_add_affected_planes(state, crtc);
+}
+
+static void zynqmp_dpsub_crtc_atomic_begin(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	drm_crtc_vblank_on(crtc);
+}
+
+static void zynqmp_dpsub_crtc_atomic_flush(struct drm_crtc *crtc,
+					   struct drm_atomic_state *state)
+{
+	if (crtc->state->event) {
+		struct drm_pending_vblank_event *event;
+
+		/* Consume the flip_done event from atomic helper. */
+		event = crtc->state->event;
+		crtc->state->event = NULL;
+
+		event->pipe = drm_crtc_index(crtc);
+
+		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+
+		spin_lock_irq(&crtc->dev->event_lock);
+		drm_crtc_arm_vblank_event(crtc, event);
+		spin_unlock_irq(&crtc->dev->event_lock);
+	}
+}
+
+static const struct drm_crtc_helper_funcs zynqmp_dpsub_crtc_helper_funcs = {
+	.atomic_enable	= zynqmp_dpsub_crtc_atomic_enable,
+	.atomic_disable	= zynqmp_dpsub_crtc_atomic_disable,
+	.atomic_check	= zynqmp_dpsub_crtc_atomic_check,
+	.atomic_begin	= zynqmp_dpsub_crtc_atomic_begin,
+	.atomic_flush	= zynqmp_dpsub_crtc_atomic_flush,
+};
+
+static int zynqmp_dpsub_crtc_enable_vblank(struct drm_crtc *crtc)
+{
+	struct zynqmp_dpsub *dpsub = crtc_to_dpsub(crtc);
+
+	zynqmp_dp_enable_vblank(dpsub->dp);
+
+	return 0;
+}
+
+static void zynqmp_dpsub_crtc_disable_vblank(struct drm_crtc *crtc)
+{
+	struct zynqmp_dpsub *dpsub = crtc_to_dpsub(crtc);
+
+	zynqmp_dp_disable_vblank(dpsub->dp);
+}
+
+static const struct drm_crtc_funcs zynqmp_dpsub_crtc_funcs = {
+	.destroy		= drm_crtc_cleanup,
+	.set_config		= drm_atomic_helper_set_config,
+	.page_flip		= drm_atomic_helper_page_flip,
+	.reset			= drm_atomic_helper_crtc_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_crtc_destroy_state,
+	.enable_vblank		= zynqmp_dpsub_crtc_enable_vblank,
+	.disable_vblank		= zynqmp_dpsub_crtc_disable_vblank,
+};
+
+static int zynqmp_dpsub_create_crtc(struct zynqmp_dpsub *dpsub)
+{
+	struct drm_plane *plane = &dpsub->planes[ZYNQMP_DPSUB_LAYER_GFX];
+	struct drm_crtc *crtc = &dpsub->crtc;
+	int ret;
+
+	ret = drm_crtc_init_with_planes(&dpsub->drm, crtc, plane,
+					NULL, &zynqmp_dpsub_crtc_funcs, NULL);
+	if (ret < 0)
+		return ret;
+
+	drm_crtc_helper_add(crtc, &zynqmp_dpsub_crtc_helper_funcs);
+
+	/* Start with vertical blanking interrupt reporting disabled. */
+	drm_crtc_vblank_off(crtc);
+
+	return 0;
+}
+
+static void zynqmp_dpsub_map_crtc_to_plane(struct zynqmp_dpsub *dpsub)
+{
+	u32 possible_crtcs = drm_crtc_mask(&dpsub->crtc);
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dpsub->planes); i++)
+		dpsub->planes[i].possible_crtcs = possible_crtcs;
+}
+
+/**
+ * zynqmp_dpsub_handle_vblank - Handle the vblank event
+ * @dpsub: DisplayPort subsystem
+ *
+ * This function handles the vblank interrupt, and sends an event to
+ * CRTC object. This will be called by the DP vblank interrupt handler.
+ */
+void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub)
+{
+	drm_crtc_handle_vblank(&dpsub->crtc);
+}
+
 /* -----------------------------------------------------------------------------
  * Initialization
  */
@@ -38,12 +220,18 @@ int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		return ret;
 
+	ret = zynqmp_dpsub_create_crtc(dpsub);
+	if (ret < 0)
+		return ret;
+
+	zynqmp_dpsub_map_crtc_to_plane(dpsub);
+
 	ret = zynqmp_dp_drm_init(dpsub);
 	if (ret)
 		return ret;
 
 	/* Create the encoder and attach the bridge. */
-	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
+	encoder->possible_crtcs |= drm_crtc_mask(&dpsub->crtc);
 	drm_simple_encoder_init(&dpsub->drm, encoder, DRM_MODE_ENCODER_NONE);
 
 	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.h b/drivers/gpu/drm/xlnx/zynqmp_kms.h
index a6729d9d82cc..a8934b1abb05 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.h
@@ -14,6 +14,8 @@
 
 struct zynqmp_dpsub;
 
+void zynqmp_dpsub_handle_vblank(struct zynqmp_dpsub *dpsub);
+
 int zynqmp_dpsub_kms_init(struct zynqmp_dpsub *dpsub);
 
 #endif /* _ZYNQMP_KMS_H_ */
-- 
Regards,

Laurent Pinchart

