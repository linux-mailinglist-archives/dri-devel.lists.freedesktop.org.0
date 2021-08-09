Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD11D3E3DA1
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C3989973;
	Mon,  9 Aug 2021 01:35:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AFB78991D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:14 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D9F1E2226;
 Mon,  9 Aug 2021 03:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472913;
 bh=QzABQSMFhB7ienRzJFKchBnQWb3Gop9itvc+jgFY23Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ToaaZk+msb8hWXHf+8vKyhbkZ46pWHa36OiDd0uS5RB/CVKwItPD2t4YI4zyR1UMC
 Bdvz4aK0qnAkbGxYpeL+Es4x3KGVSEG2o/Yne25mnol4PXWlMP42HfpGD7opVvP55M
 FU8W/cj/dO2bnYff0djxkikgIZRTh5QD/jQRlqEg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 21/36] drm: xlnx: zynqmp_dpsub: Move CRTC to zynqmp_dpsub
 structure
Date: Mon,  9 Aug 2021 04:34:42 +0300
Message-Id: <20210809013457.11266-22-laurent.pinchart@ideasonboard.com>
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
the DRM CRTC by moving the CRTC to the zynqmp_dpsub structure. The CRTC
handling code will be moved to a separate file in a subsequent step.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 20 +++++++++-----------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  3 +++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index bd21eb77589f..7cae0eaaf118 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -161,7 +161,6 @@ struct zynqmp_disp_layer {
  * @dev: Device structure
  * @drm: DRM core
  * @dpsub: Display subsystem
- * @crtc: DRM CRTC
  * @blend.base: Register I/O base address for the blender
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
  * @audio.base: Registers I/O base address for the audio mixer
@@ -172,8 +171,6 @@ struct zynqmp_disp {
 	struct drm_device *drm;
 	struct zynqmp_dpsub *dpsub;
 
-	struct drm_crtc crtc;
-
 	struct {
 		void __iomem *base;
 	} blend;
@@ -900,7 +897,7 @@ static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
  */
 void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
 {
-	struct drm_crtc *crtc = &disp->crtc;
+	struct drm_crtc *crtc = &disp->dpsub->crtc;
 
 	drm_crtc_handle_vblank(crtc);
 }
@@ -913,7 +910,7 @@ void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
  */
 uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp)
 {
-	return drm_crtc_mask(&disp->crtc);
+	return drm_crtc_mask(&disp->dpsub->crtc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -1404,7 +1401,7 @@ static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 
 static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
 {
-	return container_of(crtc, struct zynqmp_disp, crtc);
+	return container_of(crtc, struct zynqmp_dpsub, crtc)->disp;
 }
 
 static void
@@ -1452,7 +1449,7 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	zynqmp_disp_disable(disp);
 
-	drm_crtc_vblank_off(&disp->crtc);
+	drm_crtc_vblank_off(crtc);
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event) {
@@ -1537,24 +1534,25 @@ static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
 static int zynqmp_disp_create_crtc(struct zynqmp_disp *disp)
 {
 	struct drm_plane *plane = &disp->layers[ZYNQMP_DISP_LAYER_GFX].plane;
+	struct drm_crtc *crtc = &disp->dpsub->crtc;
 	int ret;
 
-	ret = drm_crtc_init_with_planes(disp->drm, &disp->crtc, plane,
+	ret = drm_crtc_init_with_planes(disp->drm, crtc, plane,
 					NULL, &zynqmp_disp_crtc_funcs, NULL);
 	if (ret < 0)
 		return ret;
 
-	drm_crtc_helper_add(&disp->crtc, &zynqmp_disp_crtc_helper_funcs);
+	drm_crtc_helper_add(crtc, &zynqmp_disp_crtc_helper_funcs);
 
 	/* Start with vertical blanking interrupt reporting disabled. */
-	drm_crtc_vblank_off(&disp->crtc);
+	drm_crtc_vblank_off(crtc);
 
 	return 0;
 }
 
 static void zynqmp_disp_map_crtc_to_plane(struct zynqmp_disp *disp)
 {
-	u32 possible_crtcs = drm_crtc_mask(&disp->crtc);
+	u32 possible_crtcs = drm_crtc_mask(&disp->dpsub->crtc);
 	unsigned int i;
 
 	for (i = 0; i < ARRAY_SIZE(disp->layers); i++)
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 55d90f4130b2..a0a7d66efdb2 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -12,6 +12,7 @@
 #ifndef _ZYNQMP_DPSUB_H_
 #define _ZYNQMP_DPSUB_H_
 
+#include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 
 struct clk;
@@ -37,6 +38,7 @@ enum zynqmp_dpsub_format {
  * @vid_clk_from_ps: True of the video clock comes from PS, false from PL
  * @aud_clk: Audio clock
  * @aud_clk_from_ps: True of the audio clock comes from PS, false from PL
+ * @crtc: The DRM CRTC
  * @encoder: The dummy DRM encoder
  * @connector: The DP connector
  * @bridge: The DP encoder bridge
@@ -54,6 +56,7 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
+	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_connector *connector;
 	struct drm_bridge *bridge;
-- 
Regards,

Laurent Pinchart

