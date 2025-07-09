Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81511AFE0E7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 09:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE2710E74F;
	Wed,  9 Jul 2025 07:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YJp6TiDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49213.qiye.163.com (mail-m49213.qiye.163.com
 [45.254.49.213])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF6410E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 07:07:51 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1b69d1c62;
 Wed, 9 Jul 2025 15:02:45 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jingoohan1@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 l.stach@pengutronix.de, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v2 12/12] drm/bridge: analogix_dp: Apply drm_bridge_connector
 helper
Date: Wed,  9 Jul 2025 15:01:39 +0800
Message-Id: <20250709070139.3130635-13-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709070139.3130635-1-damon.ding@rock-chips.com>
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pNHVZIShgdT01LT09PGExWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97edfe742e03a3kunm3a7bcd50c83c18
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46Lww*GDE9FS86IxASIggu
 KE8KCx5VSlVKTE5JS09PTk1MQ0lCVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTkpDSTcG
DKIM-Signature: a=rsa-sha256;
 b=YJp6TiDmNn61GQKFsP7UqPJeoPdNuLgP2tEZYpksJwJYtMifFOQiZ3gfHmiIYtFkI76Rut6ZAQPS9196VEKqjzfcPeDviYLNCpMFH1oV61aM8I5YNKdTb2vSTIkz+xR5BQTD4DZ+1D98y/G3XziTN0E1n2GYGdku7fbGai+08yI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=cSY3TkMdjEllBQXgZokkOJ3V+o53bAd9gba3gMKDbH0=;
 h=date:mime-version:subject:message-id:from;
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

Apply drm_bridge_connector helper for Analogix DP driver.

The following changes have been made:
- Remove &analogix_dp_device.connector and change
  &analogix_dp_device.bridge from a pointer to an instance.
- Apply devm_drm_bridge_alloc() to allocate &analogix_dp_device that
  contains &drm_bridge.
- Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
  and &drm_connector_helper_funcs.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

------

Changes in v2:
- For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
  DRM_BRIDGE_OP_EDID.
- Add analogix_dp_bridge_edid_read().
- Move &analogix_dp_plat_data.skip_connector deletion to the previous
  patches.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 169 ++++++++----------
 .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
 2 files changed, 80 insertions(+), 93 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index abc64cc17e4c..fb510e55ef06 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -23,6 +23,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
@@ -948,23 +949,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
 }
 
-static int analogix_dp_get_modes(struct drm_connector *connector)
+static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
-	const struct drm_edid *drm_edid;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	int num_modes = 0;
 
 	if (dp->plat_data->panel) {
 		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
-	} else {
-		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
-
-		drm_edid_connector_update(&dp->connector, drm_edid);
-
-		if (drm_edid) {
-			num_modes += drm_edid_connector_add_modes(&dp->connector);
-			drm_edid_free(drm_edid);
-		}
 	}
 
 	if (dp->plat_data->get_modes)
@@ -973,51 +964,39 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 	return num_modes;
 }
 
-static struct drm_encoder *
-analogix_dp_best_encoder(struct drm_connector *connector)
+static const struct drm_edid *analogix_dp_bridge_edid_read(struct drm_bridge *bridge,
+							   struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp = to_dp(bridge);
+	const struct drm_edid *drm_edid = NULL;
 
-	return dp->encoder;
-}
+	drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
+
+	if (dp->plat_data->get_modes)
+		dp->plat_data->get_modes(dp->plat_data, connector);
 
+	return drm_edid;
+}
 
-static int analogix_dp_atomic_check(struct drm_connector *connector,
-				    struct drm_atomic_state *state)
+static int analogix_dp_bridge_atomic_check(struct drm_bridge *bridge,
+					   struct drm_bridge_state *bridge_state,
+					   struct drm_crtc_state *crtc_state,
+					   struct drm_connector_state *conn_state)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
-
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
-	if (WARN_ON(!conn_state))
-		return -ENODEV;
+	struct analogix_dp_device *dp = to_dp(bridge);
 
 	conn_state->self_refresh_aware = true;
 
-	if (!conn_state->crtc)
-		return 0;
-
-	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
-	if (!crtc_state)
-		return 0;
-
 	if (crtc_state->self_refresh_active && !dp->psr_supported)
 		return -EINVAL;
 
 	return 0;
 }
 
-static const struct drm_connector_helper_funcs analogix_dp_connector_helper_funcs = {
-	.get_modes = analogix_dp_get_modes,
-	.best_encoder = analogix_dp_best_encoder,
-	.atomic_check = analogix_dp_atomic_check,
-};
-
 static enum drm_connector_status
-analogix_dp_detect(struct drm_connector *connector, bool force)
+analogix_dp_bridge_detect(struct drm_bridge *bridge)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	if (dp->plat_data->panel)
@@ -1029,20 +1008,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 	return status;
 }
 
-static const struct drm_connector_funcs analogix_dp_connector_funcs = {
-	.fill_modes = drm_helper_probe_single_connector_modes,
-	.detect = analogix_dp_detect,
-	.destroy = drm_connector_cleanup,
-	.reset = drm_atomic_helper_connector_reset,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
-};
-
 static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 				     struct drm_encoder *encoder,
 				     enum drm_bridge_attach_flags flags)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_connector *connector = NULL;
 	int ret = 0;
 
@@ -1051,23 +1021,15 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!dp->plat_data->bridge) {
-		connector = &dp->connector;
-		connector->polled = DRM_CONNECTOR_POLL_HPD;
-
-		ret = drm_connector_init(dp->drm_dev, connector,
-					 &analogix_dp_connector_funcs,
-					 DRM_MODE_CONNECTOR_eDP);
-		if (ret) {
-			DRM_ERROR("Failed to initialize connector with drm\n");
-			return ret;
-		}
-
-		drm_connector_helper_add(connector,
-					 &analogix_dp_connector_helper_funcs);
-		drm_connector_attach_encoder(connector, encoder);
+	connector = drm_bridge_connector_init(dp->drm_dev, encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(dp->dev, "Failed to initialize connector with drm\n");
+		return ret;
 	}
 
+	drm_connector_attach_encoder(connector, encoder);
+
 	/*
 	 * NOTE: the connector registration is implemented in analogix
 	 * platform driver, that to say connector would be exist after
@@ -1126,7 +1088,7 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 						 struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 
@@ -1179,14 +1141,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 }
 
 static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_atomic_state *state,
 					const struct drm_display_mode *mode)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
-	struct drm_display_info *display_info = &dp->connector.display_info;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct video_info *video = &dp->video_info;
 	struct device_node *dp_node = dp->dev->of_node;
+	struct drm_connector *connector;
+	struct drm_display_info *display_info;
 	int vic;
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	if (!connector)
+		return;
+	display_info = &connector->display_info;
+
 	/* Input video interlaces & hsync pol & vsync pol */
 	video->interlaced = !!(mode->flags & DRM_MODE_FLAG_INTERLACE);
 	video->v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
@@ -1257,7 +1226,7 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 					     struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	int timeout_loop = 0;
@@ -1270,7 +1239,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state)
 		return;
-	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
+	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
@@ -1299,7 +1268,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 
 static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
@@ -1322,7 +1291,7 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 					      struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *old_crtc, *new_crtc;
 	struct drm_crtc_state *old_crtc_state = NULL;
 	struct drm_crtc_state *new_crtc_state = NULL;
@@ -1360,7 +1329,7 @@ static void analogix_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 static void analogix_dp_bridge_atomic_post_disable(struct drm_bridge *bridge,
 						   struct drm_atomic_state *old_state)
 {
-	struct analogix_dp_device *dp = bridge->driver_private;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	int ret;
@@ -1386,24 +1355,28 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
+	.atomic_check = analogix_dp_bridge_atomic_check,
 	.attach = analogix_dp_bridge_attach,
+	.get_modes = analogix_dp_bridge_get_modes,
+	.edid_read = analogix_dp_bridge_edid_read,
+	.detect = analogix_dp_bridge_detect,
 };
 
 static int analogix_dp_create_bridge(struct drm_device *drm_dev,
 				     struct analogix_dp_device *dp)
 {
-	struct drm_bridge *bridge;
-
-	bridge = devm_kzalloc(drm_dev->dev, sizeof(*bridge), GFP_KERNEL);
-	if (!bridge) {
-		DRM_ERROR("failed to allocate for drm bridge\n");
-		return -ENOMEM;
-	}
+	struct drm_bridge *bridge = &dp->bridge;
+	int ret;
 
-	dp->bridge = bridge;
+	bridge->ops = DRM_BRIDGE_OP_DETECT |
+		      DRM_BRIDGE_OP_EDID |
+		      DRM_BRIDGE_OP_MODES;
+	bridge->of_node = dp->dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_eDP;
 
-	bridge->driver_private = dp;
-	bridge->funcs = &analogix_dp_bridge_funcs;
+	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
+	if (ret)
+		return ret;
 
 	return drm_bridge_attach(dp->encoder, bridge, NULL, 0);
 }
@@ -1495,9 +1468,10 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
 		return ERR_PTR(-EINVAL);
 	}
 
-	dp = devm_kzalloc(dev, sizeof(struct analogix_dp_device), GFP_KERNEL);
-	if (!dp)
-		return ERR_PTR(-ENOMEM);
+	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
+				   &analogix_dp_bridge_funcs);
+	if (IS_ERR(dp))
+		return ERR_CAST(dp);
 
 	dp->dev = &pdev->dev;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1664,8 +1638,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
-	analogix_dp_bridge_disable(dp->bridge);
-	dp->connector.funcs->destroy(&dp->connector);
+	analogix_dp_bridge_disable(&dp->bridge);
 
 	drm_panel_unprepare(dp->plat_data->panel);
 
@@ -1675,7 +1648,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
 int analogix_dp_start_crc(struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp;
+	struct drm_bridge *bridge;
 
 	if (!connector->state->crtc) {
 		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
@@ -1683,13 +1657,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
 		return -EINVAL;
 	}
 
+	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
+	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
+		return -EINVAL;
+
+	dp = to_dp(bridge);
+
 	return drm_dp_start_crc(&dp->aux, connector->state->crtc);
 }
 EXPORT_SYMBOL_GPL(analogix_dp_start_crc);
 
 int analogix_dp_stop_crc(struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp;
+	struct drm_bridge *bridge;
+
+	bridge = drm_bridge_chain_get_first_bridge(connector->encoder);
+	if (bridge->type != DRM_MODE_CONNECTOR_eDP)
+		return -EINVAL;
+
+	dp = to_dp(bridge);
 
 	return drm_dp_stop_crc(&dp->aux);
 }
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 9f9e492da80f..22f28384b4ec 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -10,6 +10,7 @@
 #define _ANALOGIX_DP_CORE_H
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 
 #define DP_TIMEOUT_LOOP_COUNT 100
@@ -153,8 +154,7 @@ struct analogix_dp_device {
 	struct drm_encoder	*encoder;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
-	struct drm_connector	connector;
-	struct drm_bridge	*bridge;
+	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
 	unsigned int		irq;
-- 
2.34.1

