Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7705EE9B7
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 00:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06D010E7DA;
	Wed, 28 Sep 2022 22:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5840510E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 22:47:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0D146BE;
 Thu, 29 Sep 2022 00:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664405277;
 bh=5IayDYX0zQFbaYmUQoQij1AJhSamUqtXCvset270LTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LcSPVY/Pj2Di8L6Mw9bn2S0ZKikDMDDjVxnSOIhkM6PPiotQG4G58V6ZiB+v9zdOw
 ADZpHrw8gJT/GK2ETYuyGIBKwA9N0b+smsdcaTY/yfINLx/zTbssuhb7yLbtL4gu7y
 +3VQ4FSYMq2jgecNSaozwTGtLDaVxYmDFFmol+vw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 21/37] drm: xlnx: zynqmp_dpsub: Move CRTC to zynqmp_dpsub
 structure
Date: Thu, 29 Sep 2022 01:47:03 +0300
Message-Id: <20220928224719.3291-22-laurent.pinchart@ideasonboard.com>
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
the DRM CRTC by moving the CRTC to the zynqmp_dpsub structure. The CRTC
handling code will be moved to a separate file in a subsequent step.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 20 +++++++++-----------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  3 +++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 640be60c4214..94073cdfd714 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -163,7 +163,6 @@ struct zynqmp_disp_layer {
  * @dev: Device structure
  * @drm: DRM core
  * @dpsub: Display subsystem
- * @crtc: DRM CRTC
  * @blend.base: Register I/O base address for the blender
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
  * @audio.base: Registers I/O base address for the audio mixer
@@ -174,8 +173,6 @@ struct zynqmp_disp {
 	struct drm_device *drm;
 	struct zynqmp_dpsub *dpsub;
 
-	struct drm_crtc crtc;
-
 	struct {
 		void __iomem *base;
 	} blend;
@@ -902,7 +899,7 @@ static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
  */
 void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
 {
-	struct drm_crtc *crtc = &disp->crtc;
+	struct drm_crtc *crtc = &disp->dpsub->crtc;
 
 	drm_crtc_handle_vblank(crtc);
 }
@@ -915,7 +912,7 @@ void zynqmp_disp_handle_vblank(struct zynqmp_disp *disp)
  */
 uint32_t zynqmp_disp_get_crtc_mask(struct zynqmp_disp *disp)
 {
-	return drm_crtc_mask(&disp->crtc);
+	return drm_crtc_mask(&disp->dpsub->crtc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -1410,7 +1407,7 @@ static int zynqmp_disp_setup_clock(struct zynqmp_disp *disp,
 
 static inline struct zynqmp_disp *crtc_to_disp(struct drm_crtc *crtc)
 {
-	return container_of(crtc, struct zynqmp_disp, crtc);
+	return container_of(crtc, struct zynqmp_dpsub, crtc)->disp;
 }
 
 static void
@@ -1458,7 +1455,7 @@ zynqmp_disp_crtc_atomic_disable(struct drm_crtc *crtc,
 
 	zynqmp_disp_disable(disp);
 
-	drm_crtc_vblank_off(&disp->crtc);
+	drm_crtc_vblank_off(crtc);
 
 	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event) {
@@ -1543,24 +1540,25 @@ static const struct drm_crtc_funcs zynqmp_disp_crtc_funcs = {
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
index 5bd42e192e17..4ee0dc69ebee 100644
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
  * @bridge: The DP encoder bridge
  * @disp: The display controller
@@ -53,6 +55,7 @@ struct zynqmp_dpsub {
 	struct clk *aud_clk;
 	bool aud_clk_from_ps;
 
+	struct drm_crtc crtc;
 	struct drm_encoder encoder;
 	struct drm_bridge *bridge;
 
-- 
Regards,

Laurent Pinchart

