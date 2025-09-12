Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476E0B5463E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 10:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9285F10EBDB;
	Fri, 12 Sep 2025 08:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="WbiO1PWB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3283.qiye.163.com (mail-m3283.qiye.163.com
 [220.197.32.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B95B10EBD2
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 08:59:27 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2298a0e45;
 Fri, 12 Sep 2025 16:59:22 +0800 (GMT+08:00)
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
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply drm_bridge_connector
 helper
Date: Fri, 12 Sep 2025 16:58:39 +0800
Message-Id: <20250912085846.7349-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a993d26928703a3kunm813a8c8ea46033
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5LS1YYGkNDTB9MTh8ZSx9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNQk
 tVSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=WbiO1PWB/SKX/KBWVLHHNqO/uoq2XTGXG6dxDoX99oYUV1BcxFlFLhoqDikhcVCfrtTRWTGcW2fB1arh97S7T63X65YAW7rRmNkI3OMlnAd3YNXt2/xhhLySLjN2fnIjvC8itxKuTBsdxn4DHdwgGoO5huxM2hjGckXQTCBP09k=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=zTEL50l880bUhecD6CfYzmHViRYFR4jqHsUeUGzAqs8=;
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
- Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
  and &drm_connector_helper_funcs.
- Remove unnecessary parameter struct drm_connector* for callback
  &analogix_dp_plat_data.attach.
- Remove &analogix_dp_device.connector.
- Convert analogix_dp_atomic_check()/analogix_dp_detect() to
  &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
- Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
  &drm_bridge_funcs.edid_read().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

------

Changes in v2:
- For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
  DRM_BRIDGE_OP_EDID.
- Add analogix_dp_bridge_edid_read().
- Move &analogix_dp_plat_data.skip_connector deletion to the previous
  patches.

Changes in v3:
- Rebase with the new devm_drm_bridge_alloc() related commit
  48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
  API").
- Expand the commit message.
- Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
  bridge is available.
- Remove unnecessary parameter struct drm_connector* for callback
  &analogix_dp_plat_data.attach.
- In order to decouple the connector driver and the bridge driver, move
  the bridge connector initilization to the Rockchip and Exynos sides.

Changes in v4:
- Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
  &drm_connector.
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v5:
- Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
  for next bridge attachment of Exynos side.
- Distinguish the &drm_bridge->ops of Analogix bridge based on whether
  the downstream device is a panel, a bridge or neither.
- Remove the calls to &analogix_dp_plat_data.get_modes().
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
 .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
 drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
 include/drm/bridge/analogix_dp.h              |   3 +-
 5 files changed, 95 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9bf91d7595d6..156114170c4d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -856,44 +856,38 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
 	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
 }
 
-static int analogix_dp_get_modes(struct drm_connector *connector)
+static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
-	const struct drm_edid *drm_edid;
+	struct analogix_dp_device *dp = to_dp(bridge);
 	int num_modes = 0;
 
-	if (dp->plat_data->panel) {
+	if (dp->plat_data->panel)
 		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
-	} else {
-		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
 
-		drm_edid_connector_update(&dp->connector, drm_edid);
-
-		if (drm_edid) {
-			num_modes += drm_edid_connector_add_modes(&dp->connector);
-			drm_edid_free(drm_edid);
-		}
-	}
+	if (dp->plat_data->next_bridge)
+		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
 
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
-	struct drm_display_info *di = &connector->display_info;
-	struct drm_connector_state *conn_state;
-	struct drm_crtc_state *crtc_state;
+	struct analogix_dp_device *dp = to_dp(bridge);
+	struct drm_display_info *di = &conn_state->connector->display_info;
 	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
 
 	if (is_rockchip(dp->plat_data->dev_type)) {
@@ -905,35 +899,18 @@ static int analogix_dp_atomic_check(struct drm_connector *connector,
 		}
 	}
 
-	conn_state = drm_atomic_get_new_connector_state(state, connector);
-	if (WARN_ON(!conn_state))
-		return -ENODEV;
-
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
+analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
 	if (dp->plat_data->panel)
@@ -945,21 +922,11 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
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
 	struct analogix_dp_device *dp = to_dp(bridge);
-	struct drm_connector *connector = NULL;
 	int ret = 0;
 
 	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
@@ -967,31 +934,8 @@ static int analogix_dp_bridge_attach(struct drm_bridge *bridge,
 		return -EINVAL;
 	}
 
-	if (!dp->plat_data->next_bridge) {
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
-	}
-
-	/*
-	 * NOTE: the connector registration is implemented in analogix
-	 * platform driver, that to say connector would be exist after
-	 * plat_data->attch return, that's why we record the connector
-	 * point after plat attached.
-	 */
 	if (dp->plat_data->attach) {
-		ret = dp->plat_data->attach(dp->plat_data, bridge, connector);
+		ret = dp->plat_data->attach(dp->plat_data, bridge);
 		if (ret) {
 			DRM_ERROR("Failed at platform attach func\n");
 			return ret;
@@ -1095,14 +1039,21 @@ static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
 }
 
 static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
+					struct drm_atomic_state *state,
 					const struct drm_display_mode *mode)
 {
 	struct analogix_dp_device *dp = to_dp(bridge);
-	struct drm_display_info *display_info = &dp->connector.display_info;
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
@@ -1186,7 +1137,7 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	new_crtc_state = drm_atomic_get_new_crtc_state(old_state, crtc);
 	if (!new_crtc_state)
 		return;
-	analogix_dp_bridge_mode_set(bridge, &new_crtc_state->adjusted_mode);
+	analogix_dp_bridge_mode_set(bridge, old_state, &new_crtc_state->adjusted_mode);
 
 	old_crtc_state = drm_atomic_get_old_crtc_state(old_state, crtc);
 	/* Not a full enable, just disable PSR and continue */
@@ -1302,7 +1253,11 @@ static const struct drm_bridge_funcs analogix_dp_bridge_funcs = {
 	.atomic_enable = analogix_dp_bridge_atomic_enable,
 	.atomic_disable = analogix_dp_bridge_atomic_disable,
 	.atomic_post_disable = analogix_dp_bridge_atomic_post_disable,
+	.atomic_check = analogix_dp_bridge_atomic_check,
 	.attach = analogix_dp_bridge_attach,
+	.get_modes = analogix_dp_bridge_get_modes,
+	.edid_read = analogix_dp_bridge_edid_read,
+	.detect = analogix_dp_bridge_detect,
 };
 
 static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
@@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
 
 int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 {
+	struct drm_bridge *bridge = &dp->bridge;
 	int ret;
 
 	dp->drm_dev = drm_dev;
@@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
+	if (dp->plat_data->panel)
+		/* If the next is a panel, the EDID parsing is checked by the panel driver */
+		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
+	else if (dp->plat_data->next_bridge)
+		/* If the next is a bridge, the supported operations depend on the next bridge */
+		bridge->ops = 0;
+	else
+		/* In DP mode, the EDID parsing and HPD detection should be supported */
+		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+
+	bridge->of_node = dp->dev->of_node;
+	bridge->type = DRM_MODE_CONNECTOR_eDP;
+	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
+	if (ret)
+		goto err_unregister_aux;
+
+	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
 	if (ret) {
 		DRM_ERROR("failed to create bridge (%d)\n", ret);
 		goto err_unregister_aux;
@@ -1563,7 +1535,6 @@ EXPORT_SYMBOL_GPL(analogix_dp_bind);
 void analogix_dp_unbind(struct analogix_dp_device *dp)
 {
 	analogix_dp_bridge_disable(&dp->bridge);
-	dp->connector.funcs->destroy(&dp->connector);
 
 	drm_panel_unprepare(dp->plat_data->panel);
 
@@ -1573,7 +1544,8 @@ EXPORT_SYMBOL_GPL(analogix_dp_unbind);
 
 int analogix_dp_start_crc(struct drm_connector *connector)
 {
-	struct analogix_dp_device *dp = to_dp(connector);
+	struct analogix_dp_device *dp;
+	struct drm_bridge *bridge;
 
 	if (!connector->state->crtc) {
 		DRM_ERROR("Connector %s doesn't currently have a CRTC.\n",
@@ -1581,13 +1553,26 @@ int analogix_dp_start_crc(struct drm_connector *connector)
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
index 91b215c6a0cf..17347448c6b0 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -154,7 +154,6 @@ struct analogix_dp_device {
 	struct drm_encoder	*encoder;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
-	struct drm_connector	connector;
 	struct drm_bridge	bridge;
 	struct drm_dp_aux	aux;
 	struct clk		*clock;
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index 33e9758bc00d..0ec3514912f4 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -21,6 +21,7 @@
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -142,19 +143,15 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 }
 
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
-				   struct drm_bridge *bridge,
-				   struct drm_connector *connector)
+				   struct drm_bridge *bridge)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
-	enum drm_bridge_attach_flags flags = 0;
 	int ret;
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
-		if (plat_data->next_bridge->funcs == &exynos_dp_legacy_bridge_funcs)
-			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
-
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
+					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (ret)
 			return ret;
 	}
@@ -184,6 +181,7 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_encoder *encoder = &dp->encoder;
 	struct drm_device *drm_dev = data;
+	struct drm_connector *connector;
 	int ret;
 
 	dp->drm_dev = drm_dev;
@@ -199,10 +197,19 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 	dp->plat_data.encoder = encoder;
 
 	ret = analogix_dp_bind(dp->adp, dp->drm_dev);
-	if (ret)
+	if (ret) {
 		dp->encoder.funcs->destroy(&dp->encoder);
+		return ret;
+	}
+
+	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		return ret;
+	}
 
-	return ret;
+	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
 }
 
 static void exynos_dp_unbind(struct device *dev, struct device *master,
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0a185ebd26af..3b6b2d3ca5d1 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -25,6 +25,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
@@ -368,6 +369,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 {
 	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct drm_connector *connector;
 	int ret;
 
 	dp->drm_dev = drm_dev;
@@ -387,7 +389,14 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	if (ret)
 		goto err_cleanup_encoder;
 
-	return 0;
+	connector = drm_bridge_connector_init(dp->drm_dev, dp->plat_data.encoder);
+	if (IS_ERR(connector)) {
+		ret = PTR_ERR(connector);
+		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		goto err_cleanup_encoder;
+	}
+
+	return drm_connector_attach_encoder(connector, dp->plat_data.encoder);
 err_cleanup_encoder:
 	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
 	return ret;
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 3301392eda5f..3428ffff24c5 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -33,8 +33,7 @@ struct analogix_dp_plat_data {
 
 	int (*power_on)(struct analogix_dp_plat_data *);
 	int (*power_off)(struct analogix_dp_plat_data *);
-	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *,
-		      struct drm_connector *);
+	int (*attach)(struct analogix_dp_plat_data *, struct drm_bridge *);
 };
 
 int analogix_dp_resume(struct analogix_dp_device *dp);
-- 
2.34.1

