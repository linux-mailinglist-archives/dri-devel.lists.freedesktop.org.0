Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E553E3D95
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AC898FD;
	Mon,  9 Aug 2021 01:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B60898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:06 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D105FE04;
 Mon,  9 Aug 2021 03:35:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472905;
 bh=0rXRa2umS+Zi7ydL2YsEKtHZh9O47Q09euQRvkJpywM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bL7i8YP+yhwrv1yOjTrATO+pS9jDyPioCmAYVlM/2j3rkvMTW/O3g2FLcPTG5BToI
 N/DJjtTZVgsl74sguLq7TuSOhxUEHSC5nJHeNA+L9U8eBmWCji8eYlSAot0YhjvTio
 0xdPOsBGhhUj5hI8g5jEW2DXZGcZyDJlF0Kwkuyo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>
Subject: [PATCH 04/36] drm: xlnx: zynqmp_dpsub: Create DRM bridge to model DP
 encoder
Date: Mon,  9 Aug 2021 04:34:25 +0300
Message-Id: <20210809013457.11266-5-laurent.pinchart@ideasonboard.com>
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

The DP encoder is currently modelled as a DRM encoder and DRM connector.
This doesn't support system configurations where the DP encoder is
driven by the FPGA programmable logic, using the live video input to the
DP subsystem. To enable such use cases, we need to model the encoder as
a DRM bridge.

As a first step, create a DRM bridge in the DP encoder driver. Move and
delegate the implementation of the DRM encoder and connector operations
to the bridge to prepare for the transition. The bridge will be
registered with the DRM core as a separate change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 333 +++++++++++++++++++++----------
 1 file changed, 225 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 7768b45a0d73..2c82a5fbd43a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -284,6 +284,7 @@ struct zynqmp_dp_config {
  * @iomem: device I/O memory for register access
  * @reset: reset controller
  * @irq: irq
+ * @bridge: DRM bridge for the DP encoder
  * @config: IP core configuration from DTS
  * @aux: aux channel
  * @phy: PHY handles for DP lanes
@@ -306,6 +307,8 @@ struct zynqmp_dp {
 	struct reset_control *reset;
 	int irq;
 
+	struct drm_bridge bridge;
+
 	struct zynqmp_dp_config config;
 	struct drm_dp_aux aux;
 	struct phy *phy[ZYNQMP_DP_MAX_LANES];
@@ -330,6 +333,11 @@ static inline struct zynqmp_dp *connector_to_dp(struct drm_connector *connector)
 	return container_of(connector, struct zynqmp_dp, connector);
 }
 
+static inline struct zynqmp_dp *bridge_to_dp(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct zynqmp_dp, bridge);
+}
+
 static void zynqmp_dp_write(struct zynqmp_dp *dp, int offset, u32 val)
 {
 	writel(val, dp->iomem + offset);
@@ -1254,7 +1262,7 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VSTART,
 			mode->vtotal - mode->vsync_start);
 
-	/* In synchronous mode, set the diviers */
+	/* In synchronous mode, set the dividers */
 	if (dp->config.misc0 & ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK) {
 		reg = drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
 		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_N_VID, reg);
@@ -1280,13 +1288,167 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 }
 
 /* -----------------------------------------------------------------------------
- * DRM Connector
+ * DRM Bridge
  */
 
-static enum drm_connector_status
-zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
+static int zynqmp_dp_bridge_attach(struct drm_bridge *bridge,
+				   enum drm_bridge_attach_flags flags)
 {
-	struct zynqmp_dp *dp = connector_to_dp(connector);
+	return 0;
+}
+
+static int zynqmp_dp_bridge_mode_valid(struct drm_bridge *bridge,
+				       const struct drm_display_info *info,
+				       const struct drm_display_mode *mode)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	int rate;
+
+	if (mode->clock > ZYNQMP_MAX_FREQ) {
+		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
+			mode->name);
+		drm_mode_debug_printmodeline(mode);
+		return MODE_CLOCK_HIGH;
+	}
+
+	/* Check with link rate and lane count */
+	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
+				  dp->link_config.max_lanes, dp->config.bpp);
+	if (mode->clock > rate) {
+		dev_dbg(dp->dev, "filtered mode %s for high pixel rate\n",
+			mode->name);
+		drm_mode_debug_printmodeline(mode);
+		return MODE_CLOCK_HIGH;
+	}
+
+	return MODE_OK;
+}
+
+static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *adjusted_mode;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+	unsigned int i;
+	int rate;
+	int ret;
+
+	pm_runtime_get_sync(dp->dev);
+
+	/*
+	 * Retrieve the CRTC mode and adjusted mode. This requires a little
+	 * dance to go from the bridge to the encoder, to the connector and to
+	 * the CRTC.
+	 */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	adjusted_mode = &crtc_state->adjusted_mode;
+	mode = &crtc_state->mode;
+
+	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
+
+	/* Check again as bpp or format might have been changed */
+	rate = zynqmp_dp_max_rate(dp->link_config.max_rate,
+				  dp->link_config.max_lanes, dp->config.bpp);
+	if (mode->clock > rate) {
+		dev_err(dp->dev, "mode %s has too high pixel rate\n",
+			mode->name);
+		drm_mode_debug_printmodeline(mode);
+	}
+
+	/* Configure the mode */
+	ret = zynqmp_dp_mode_configure(dp, adjusted_mode->clock, 0);
+	if (ret < 0) {
+		pm_runtime_put_sync(dp->dev);
+		return;
+	}
+
+	zynqmp_dp_encoder_mode_set_transfer_unit(dp, adjusted_mode);
+	zynqmp_dp_encoder_mode_set_stream(dp, adjusted_mode);
+
+	/* Enable the encoder */
+	dp->enabled = true;
+	zynqmp_dp_update_misc(dp);
+	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
+		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN, 0);
+	if (dp->status == connector_status_connected) {
+		for (i = 0; i < 3; i++) {
+			ret = drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER,
+						 DP_SET_POWER_D0);
+			if (ret == 1)
+				break;
+			usleep_range(300, 500);
+		}
+		/* Some monitors take time to wake up properly */
+		msleep(zynqmp_dp_power_on_delay_ms);
+	}
+	if (ret != 1)
+		dev_dbg(dp->dev, "DP aux failed\n");
+	else
+		zynqmp_dp_train_loop(dp);
+	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
+			ZYNQMP_DP_SOFTWARE_RESET_ALL);
+	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
+}
+
+static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+					    struct drm_bridge_state *old_bridge_state)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+
+	dp->enabled = false;
+	cancel_delayed_work(&dp->hpd_work);
+	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
+	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
+			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
+	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
+		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
+	pm_runtime_put_sync(dp->dev);
+}
+
+#define ZYNQMP_DP_MIN_H_BACKPORCH	20
+
+static int zynqmp_dp_bridge_atomic_check(struct drm_bridge *bridge,
+					 struct drm_bridge_state *bridge_state,
+					 struct drm_crtc_state *crtc_state,
+					 struct drm_connector_state *conn_state)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+	struct drm_display_mode *mode = &crtc_state->mode;
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	int diff = mode->htotal - mode->hsync_end;
+
+	/*
+	 * ZynqMP DP requires horizontal backporch to be greater than 12.
+	 * This limitation may not be compatible with the sink device.
+	 */
+	if (diff < ZYNQMP_DP_MIN_H_BACKPORCH) {
+		int vrefresh = (adjusted_mode->clock * 1000) /
+			       (adjusted_mode->vtotal * adjusted_mode->htotal);
+
+		dev_dbg(dp->dev, "hbackporch adjusted: %d to %d",
+			diff, ZYNQMP_DP_MIN_H_BACKPORCH - diff);
+		diff = ZYNQMP_DP_MIN_H_BACKPORCH - diff;
+		adjusted_mode->htotal += diff;
+		adjusted_mode->clock = adjusted_mode->vtotal *
+				       adjusted_mode->htotal * vrefresh / 1000;
+	}
+
+	return 0;
+}
+
+static enum drm_connector_status zynqmp_dp_bridge_detect(struct drm_bridge *bridge)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
 	struct zynqmp_dp_link_config *link_config = &dp->link_config;
 	u32 state, i;
 	int ret;
@@ -1326,13 +1488,46 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_disconnected;
 }
 
+static struct edid *zynqmp_dp_bridge_get_edid(struct drm_bridge *bridge,
+					      struct drm_connector *connector)
+{
+	struct zynqmp_dp *dp = bridge_to_dp(bridge);
+
+	return drm_get_edid(connector, &dp->aux.ddc);
+}
+
+static const struct drm_bridge_funcs zynqmp_dp_bridge_funcs = {
+	.attach = zynqmp_dp_bridge_attach,
+	.mode_valid = zynqmp_dp_bridge_mode_valid,
+	.atomic_enable = zynqmp_dp_bridge_atomic_enable,
+	.atomic_disable = zynqmp_dp_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_check = zynqmp_dp_bridge_atomic_check,
+	.detect = zynqmp_dp_bridge_detect,
+	.get_edid = zynqmp_dp_bridge_get_edid,
+};
+
+/* -----------------------------------------------------------------------------
+ * DRM Connector
+ */
+
+static enum drm_connector_status
+zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
+{
+	struct zynqmp_dp *dp = connector_to_dp(connector);
+
+	return zynqmp_dp_bridge_detect(&dp->bridge);
+}
+
 static int zynqmp_dp_connector_get_modes(struct drm_connector *connector)
 {
 	struct zynqmp_dp *dp = connector_to_dp(connector);
 	struct edid *edid;
 	int ret;
 
-	edid = drm_get_edid(connector, &dp->aux.ddc);
+	edid = zynqmp_dp_bridge_get_edid(&dp->bridge, connector);
 	if (!edid)
 		return 0;
 
@@ -1355,28 +1550,9 @@ static int zynqmp_dp_connector_mode_valid(struct drm_connector *connector,
 					  struct drm_display_mode *mode)
 {
 	struct zynqmp_dp *dp = connector_to_dp(connector);
-	u8 max_lanes = dp->link_config.max_lanes;
-	u8 bpp = dp->config.bpp;
-	int max_rate = dp->link_config.max_rate;
-	int rate;
 
-	if (mode->clock > ZYNQMP_MAX_FREQ) {
-		dev_dbg(dp->dev, "filtered the mode, %s,for high pixel rate\n",
-			mode->name);
-		drm_mode_debug_printmodeline(mode);
-		return MODE_CLOCK_HIGH;
-	}
-
-	/* Check with link rate and lane count */
-	rate = zynqmp_dp_max_rate(max_rate, max_lanes, bpp);
-	if (mode->clock > rate) {
-		dev_dbg(dp->dev, "filtered the mode, %s,for high pixel rate\n",
-			mode->name);
-		drm_mode_debug_printmodeline(mode);
-		return MODE_CLOCK_HIGH;
-	}
-
-	return MODE_OK;
+	return zynqmp_dp_bridge_mode_valid(&dp->bridge, &connector->display_info,
+					   mode);
 }
 
 static const struct drm_connector_funcs zynqmp_dp_connector_funcs = {
@@ -1403,49 +1579,20 @@ static void zynqmp_dp_encoder_atomic_enable(struct drm_encoder *encoder,
 					    struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
-	unsigned int i;
-	int ret = 0;
+	struct drm_bridge_state bridge_state;
 
-	pm_runtime_get_sync(dp->dev);
-	dp->enabled = true;
-	zynqmp_dp_update_misc(dp);
-	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
-		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
-	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN, 0);
-	if (dp->status == connector_status_connected) {
-		for (i = 0; i < 3; i++) {
-			ret = drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER,
-						 DP_SET_POWER_D0);
-			if (ret == 1)
-				break;
-			usleep_range(300, 500);
-		}
-		/* Some monitors take time to wake up properly */
-		msleep(zynqmp_dp_power_on_delay_ms);
-	}
-	if (ret != 1)
-		dev_dbg(dp->dev, "DP aux failed\n");
-	else
-		zynqmp_dp_train_loop(dp);
-	zynqmp_dp_write(dp, ZYNQMP_DP_SOFTWARE_RESET,
-			ZYNQMP_DP_SOFTWARE_RESET_ALL);
-	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 1);
+	bridge_state.base.state = state;
+	zynqmp_dp_bridge_atomic_enable(&dp->bridge, &bridge_state);
 }
 
 static void zynqmp_dp_encoder_atomic_disable(struct drm_encoder *encoder,
 					     struct drm_atomic_state *state)
 {
 	struct zynqmp_dp *dp = encoder_to_dp(encoder);
+	struct drm_bridge_state bridge_state;
 
-	dp->enabled = false;
-	cancel_delayed_work(&dp->hpd_work);
-	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_ENABLE, 0);
-	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
-	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
-			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
-	if (zynqmp_disp_audio_enabled(dp->dpsub->disp))
-		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
-	pm_runtime_put_sync(dp->dev);
+	bridge_state.base.state = state;
+	zynqmp_dp_bridge_atomic_disable(&dp->bridge, &bridge_state);
 }
 
 static void
@@ -1453,60 +1600,17 @@ zynqmp_dp_encoder_atomic_mode_set(struct drm_encoder *encoder,
 				  struct drm_crtc_state *crtc_state,
 				  struct drm_connector_state *connector_state)
 {
-	struct zynqmp_dp *dp = encoder_to_dp(encoder);
-	struct drm_display_mode *mode = &crtc_state->mode;
-	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-	u8 max_lanes = dp->link_config.max_lanes;
-	u8 bpp = dp->config.bpp;
-	int rate, max_rate = dp->link_config.max_rate;
-	int ret;
-
-	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
-
-	/* Check again as bpp or format might have been chagned */
-	rate = zynqmp_dp_max_rate(max_rate, max_lanes, bpp);
-	if (mode->clock > rate) {
-		dev_err(dp->dev, "the mode, %s,has too high pixel rate\n",
-			mode->name);
-		drm_mode_debug_printmodeline(mode);
-	}
-
-	ret = zynqmp_dp_mode_configure(dp, adjusted_mode->clock, 0);
-	if (ret < 0)
-		return;
-
-	zynqmp_dp_encoder_mode_set_transfer_unit(dp, adjusted_mode);
-	zynqmp_dp_encoder_mode_set_stream(dp, adjusted_mode);
 }
 
-#define ZYNQMP_DP_MIN_H_BACKPORCH	20
-
 static int
 zynqmp_dp_encoder_atomic_check(struct drm_encoder *encoder,
 			       struct drm_crtc_state *crtc_state,
 			       struct drm_connector_state *conn_state)
 {
-	struct drm_display_mode *mode = &crtc_state->mode;
-	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
-	int diff = mode->htotal - mode->hsync_end;
+	struct zynqmp_dp *dp = encoder_to_dp(encoder);
 
-	/*
-	 * ZynqMP DP requires horizontal backporch to be greater than 12.
-	 * This limitation may not be compatible with the sink device.
-	 */
-	if (diff < ZYNQMP_DP_MIN_H_BACKPORCH) {
-		int vrefresh = (adjusted_mode->clock * 1000) /
-			       (adjusted_mode->vtotal * adjusted_mode->htotal);
-
-		dev_dbg(encoder->dev->dev, "hbackporch adjusted: %d to %d",
-			diff, ZYNQMP_DP_MIN_H_BACKPORCH - diff);
-		diff = ZYNQMP_DP_MIN_H_BACKPORCH - diff;
-		adjusted_mode->htotal += diff;
-		adjusted_mode->clock = adjusted_mode->vtotal *
-				       adjusted_mode->htotal * vrefresh / 1000;
-	}
-
-	return 0;
+	return zynqmp_dp_bridge_atomic_check(&dp->bridge, NULL, crtc_state,
+					     conn_state);
 }
 
 static const struct drm_encoder_helper_funcs zynqmp_dp_encoder_helper_funcs = {
@@ -1603,6 +1707,7 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
 int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 {
 	struct zynqmp_dp *dp = dpsub->dp;
+	struct drm_bridge *bridge = &dp->bridge;
 	struct drm_encoder *encoder = &dp->encoder;
 	struct drm_connector *connector = &dp->connector;
 	int ret;
@@ -1610,6 +1715,18 @@ int zynqmp_dp_drm_init(struct zynqmp_dpsub *dpsub)
 	dp->config.misc0 &= ~ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK;
 	zynqmp_dp_set_format(dp, ZYNQMP_DPSUB_FORMAT_RGB, 8);
 
+	/*
+	 * Initialize the bridge. Setting the device and encoder manually is a
+	 * hack, to be removed once the bridge will get attached to the encoder
+	 * using the bridge API.
+	 */
+	bridge->dev = dp->drm;
+	bridge->encoder = &dp->encoder;
+	bridge->funcs = &zynqmp_dp_bridge_funcs;
+	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+		    | DRM_BRIDGE_OP_HPD;
+	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
+
 	/* Create the DRM encoder and connector. */
 	encoder->possible_crtcs |= zynqmp_disp_get_crtc_mask(dpsub->disp);
 	drm_simple_encoder_init(dp->drm, encoder, DRM_MODE_ENCODER_TMDS);
-- 
Regards,

Laurent Pinchart

