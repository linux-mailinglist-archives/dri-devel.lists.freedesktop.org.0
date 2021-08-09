Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A740A3E3D99
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19558992E;
	Mon,  9 Aug 2021 01:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5085898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:07 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30D2115AD;
 Mon,  9 Aug 2021 03:35:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472906;
 bh=FpHY5soa1YrFNsdVb947SeuKY/nrASDKRdeSq1l5w/Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qYUufxTdGV+MRFYxvbdGSXXyenKOwy056grz337h0Uq0fsZn6y0/gSkWI/tONkICN
 7F2Q6Q27v95xJr3HxOMa0x16El4LFb0TsB1yYir/HbYrqprXt+mtEKxTssPIQr9eBM
 Jz1f8krrDlpdqH94+oxavVVM6VTWJl2MkE4lFRuk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 07/36] drm: xlnx: zynqmp_dpsub: Move encoder to DPSUB core
Date: Mon,  9 Aug 2021 04:34:28 +0300
Message-Id: <20210809013457.11266-8-laurent.pinchart@ideasonboard.com>
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

As part of the transitition of the DP encoder to a DRM bridge, turn the
DRM encoder into a dummy encoder and move it out of the DP code, to the
DPSUB core. DP encoder operations are handled by the DP bridge, which is
now attached to the encoder.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 79 ++---------------------------
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 16 +++++-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  8 +++
 3 files changed, 25 insertions(+), 78 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 838585bb84ab..27b5277f8f64 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -15,12 +15,10 @@
 #include <drm/drm_device.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_encoder.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -276,7 +274,6 @@ struct zynqmp_dp_config {
 
 /**
  * struct zynqmp_dp - Xilinx DisplayPort core
- * @encoder: the drm encoder structure
  * @connector: the drm connector structure
  * @dev: device structure
  * @dpsub: Display subsystem
@@ -298,7 +295,6 @@ struct zynqmp_dp_config {
  * @train_set: set of training data
  */
 struct zynqmp_dp {
-	struct drm_encoder encoder;
 	struct drm_connector connector;
 	struct device *dev;
 	struct zynqmp_dpsub *dpsub;
@@ -323,11 +319,6 @@ struct zynqmp_dp {
 	u8 train_set[ZYNQMP_DP_MAX_LANES];
 };
 
-static inline struct zynqmp_dp *encoder_to_dp(struct drm_encoder *encoder)
-{
-	return container_of(encoder, struct zynqmp_dp, encoder);
-}
-
 static inline struct zynqmp_dp *connector_to_dp(struct drm_connector *connector)
 {
 	return container_of(connector, struct zynqmp_dp, connector);
@@ -1565,7 +1556,7 @@ zynqmp_dp_connector_best_encoder(struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = connector_to_dp(connector);
 
-	return &dp->encoder;
+	return &dp->dpsub->encoder;
 }
 
 static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
@@ -1593,55 +1584,6 @@ zynqmp_dp_connector_helper_funcs = {
 	.mode_valid	= zynqmp_dp_connector_mode_valid,
 };
 
-/* -----------------------------------------------------------------------------
- * DRM Encoder
- */
-
-static void zynqmp_dp_encoder_atomic_enable(struct drm_encoder *encoder,
-					    struct drm_atomic_state *state)
-{
-	struct zynqmp_dp *dp = encoder_to_dp(encoder);
-	struct drm_bridge_state bridge_state;
-
-	bridge_state.base.state = state;
-	zynqmp_dp_bridge_atomic_enable(&dp->bridge, &bridge_state);
-}
-
-static void zynqmp_dp_encoder_atomic_disable(struct drm_encoder *encoder,
-					     struct drm_atomic_state *state)
-{
-	struct zynqmp_dp *dp = encoder_to_dp(encoder);
-	struct drm_bridge_state bridge_state;
-
-	bridge_state.base.state = state;
-	zynqmp_dp_bridge_atomic_disable(&dp->bridge, &bridge_state);
-}
-
-static void
-zynqmp_dp_encoder_atomic_mode_set(struct drm_encoder *encoder,
-				  struct drm_crtc_state *crtc_state,
-				  struct drm_connector_state *connector_state)
-{
-}
-
-static int
-zynqmp_dp_encoder_atomic_check(struct drm_encoder *encoder,
-			       struct drm_crtc_state *crtc_state,
-			       struct drm_connector_state *conn_state)
-{
-	struct zynqmp_dp *dp = encoder_to_dp(encoder);
-
-	return zynqmp_dp_bridge_atomic_check(&dp->bridge, NULL, crtc_state,
-					     conn_state);
-}
-
-static const struct drm_encoder_helper_funcs zynqmp_dp_encoder_helper_funcs = {
-	.atomic_enable		= zynqmp_dp_encoder_atomic_enable,
-	.atomic_disable		= zynqmp_dp_encoder_atomic_disable,
-	.atomic_mode_set	= zynqmp_dp_encoder_atomic_mode_set,
-	.atomic_check		= zynqmp_dp_encoder_atomic_check,
-};
-
 /* -----------------------------------------------------------------------------
  * Interrupt Handling
  */
@@ -1730,32 +1672,17 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 {
 	struct zynqmp_dp *dp = dpsub->dp;
 	struct drm_bridge *bridge = &dp->bridge;
-	struct drm_encoder *encoder = &dp->encoder;
 	int ret;
 
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
 	zynqmp_dp_set_format(dp, NULL, ZYNQMP_DPSUB_FORMAT_RGB, 8);
 
-	/*
-	 * Initialize the bridge. Setting the device and encoder manually is a
-	 * hack, to be removed once the bridge will get attached to the encoder
-	 * using the bridge API.
-	 */
-	bridge->dev = dp->drm;
-	bridge->encoder = &dp->encoder;
+	/* Initialize the bridge. */
 	bridge->funcs = &zynqmp_dp_bridge_funcs;
 	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
 		    | DRM_BRIDGE_OP_HPD;
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
-
-	/* Create the DRM encoder and attach the bridge. */
-	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
-	drm_simple_encoder_init(dp->drm, encoder, DRM_MODE_ENCODER_TMDS);
-	drm_encoder_helper_add(encoder, &zynqmp_dp_encoder_helper_funcs);
-
-	ret = zynqmp_dp_bridge_attach(bridge, 0);
-	if (ret < 0)
-		return ret;
+	dpsub->bridge = bridge;
 
 	/* Initialize and register the AUX adapter. */
 	ret = zynqmp_dp_aux_init(dp);
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index ac37053412a1..3a3a85821e99 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -17,6 +17,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
@@ -26,6 +27,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "zynqmp_disp.h"
@@ -93,6 +95,7 @@ static const struct drm_driver zynqmp_dpsub_drm_driver = {
 
 static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 {
+	struct drm_encoder *encoder = &dpsub->encoder;
 	struct drm_device *drm = &dpsub->drm;
 	int ret;
 
@@ -115,8 +118,7 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 
 	/*
 	 * Initialize the DISP and DP components. This will creates planes,
-	 * CRTC, encoder and connector. The DISP should be initialized first as
-	 * the DP encoder needs the CRTC.
+	 * CRTC, and a bridge for the DP encoder.
 	 */
 	ret = zynqmp_disp_drm_init(dpsub);
 	if (ret)
@@ -126,6 +128,16 @@ static int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 	if (ret)
 		goto err_poll_fini;
 
+	/* Create the encoder and attach the bridge. */
+	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
+	drm_simple_encoder_init(drm, encoder, DRM_MODE_ENCODER_NONE);
+
+	ret = drm_bridge_attach(encoder, dpsub->bridge, NULL, 0);
+	if (ret) {
+		dev_err(dpsub->dev, "failed to attach bridge to encoder\n");
+		goto err_poll_fini;
+	}
+
 	/* Reset all components and register the DRM device. */
 	drm_mode_config_reset(drm);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index c04026d82639..66820bbc4507 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -12,8 +12,11 @@
 #ifndef _ZYNQMP_DPSUB_H_
 #define _ZYNQMP_DPSUB_H_
 
+#include <drm/drm_encoder.h>
+
 struct clk;
 struct device;
+struct drm_bridge;
 struct drm_device;
 struct zynqmp_disp;
 struct zynqmp_dp;
@@ -30,6 +33,8 @@ enum zynqmp_dpsub_format {
  * @drm: The DRM/KMS device
  * @dev: The physical device
  * @apb_clk: The APB clock
+ * @encoder: The dummy DRM encoder
+ * @bridge: The DP encoder bridge
  * @disp: The display controller
  * @dp: The DisplayPort controller
  * @dma_align: DMA alignment constraint (must be a power of 2)
@@ -40,6 +45,9 @@ struct zynqmp_dpsub {
 
 	struct clk *apb_clk;
 
+	struct drm_encoder encoder;
+	struct drm_bridge *bridge;
+
 	struct zynqmp_disp *disp;
 	struct zynqmp_dp *dp;
 
-- 
Regards,

Laurent Pinchart

