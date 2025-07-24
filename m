Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C9B102BE
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 10:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CD910E8BB;
	Thu, 24 Jul 2025 08:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="GKiL17nR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com
 [45.254.49.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5D110E8C9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 08:03:53 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 1d1c3447a;
 Thu, 24 Jul 2025 16:03:49 +0800 (GMT+08:00)
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
Subject: [PATCH v3 14/14] drm/bridge: analogix_dp: Apply panel_bridge helper
Date: Thu, 24 Jul 2025 16:03:04 +0800
Message-Id: <20250724080304.3572457-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724080304.3572457-1-damon.ding@rock-chips.com>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a983b75bf9c03a3kunmbbba7af2a153
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09JQlZMSEtNSxpCQklLThhWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=GKiL17nRWTjV+7m8krZ83CHFbhr6lLO+8pOW2q615Pyd5woG/FDZnWVErQrSFeS/YQda0ENtSXS7aGN0AHhkNsJLM1XAY6wokiSjh+glHH2DvFBvhm5ETYm5TzLisJ3Gx36DnP9veDd9QTXvaUUiGBK1So5Ra77F2PelVk/OH24=;
 s=default; c=relaxed/relaxed; d=rock-chips.com; v=1; 
 bh=nAwTUjL16khgdMfMVgzSxegkq3E4EUqY6J74Ws+fERM=;
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

In order to unify the handling of the panel and bridge, apply
panel_bridge helpers for Analogix DP driver. With this patch, the
bridge support will also become available.

The following changes have ben made:
- Apply plane_bridge helper to wrap the panel as the bridge.
- Remove the explicit panel APIs calls, which can be replaced with
  the automic bridge APIs calls wrapped by the panel.
- Unify the API of getting modes to drm_bridge_get_modes().

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 30 +++++++++++--------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bf0b1c0912e4..18f631c83300 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -948,11 +948,7 @@ static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_co
 	struct analogix_dp_device *dp = to_dp(bridge);
 	int num_modes = 0;
 
-	if (dp->plat_data->panel)
-		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
-
-	if (dp->plat_data->bridge)
-		num_modes += drm_bridge_get_modes(dp->plat_data->bridge, connector);
+	num_modes += drm_bridge_get_modes(dp->plat_data->bridge, connector);
 
 	if (dp->plat_data->get_modes)
 		num_modes += dp->plat_data->get_modes(dp->plat_data, connector);
@@ -995,7 +991,7 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge)
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->panel)
+	if (drm_bridge_is_panel(dp->plat_data->bridge))
 		return connector_status_connected;
 
 	if (!analogix_dp_detect_hpd(dp))
@@ -1080,8 +1076,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Don't touch the panel if we're coming back from PSR */
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
-
-	drm_panel_prepare(dp->plat_data->panel);
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1236,7 +1230,6 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
 		if (analogix_dp_set_bridge(dp) == 0) {
 			dp->dpms_mode = DRM_MODE_DPMS_ON;
-			drm_panel_enable(dp->plat_data->panel);
 			return;
 		}
 		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
@@ -1254,16 +1247,12 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
 	if (dp->dpms_mode != DRM_MODE_DPMS_ON)
 		return;
 
-	drm_panel_disable(dp->plat_data->panel);
-
 	disable_irq(dp->irq);
 
 	analogix_dp_set_analog_power_down(dp, POWER_ALL, 1);
 
 	pm_runtime_put_sync(dp->dev);
 
-	drm_panel_unprepare(dp->plat_data->panel);
-
 	dp->fast_train_enable = false;
 	dp->psr_supported = false;
 	dp->dpms_mode = DRM_MODE_DPMS_OFF;
@@ -1599,6 +1588,21 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		goto err_unregister_aux;
 	}
 
+	if (dp->plat_data->panel) {
+		dp->plat_data->bridge = devm_drm_panel_bridge_add(dp->dev, dp->plat_data->panel);
+		if (IS_ERR(dp->plat_data->bridge)) {
+			ret = PTR_ERR(bridge);
+			goto err_unregister_aux;
+		}
+	}
+
+	ret = drm_bridge_attach(dp->encoder, dp->plat_data->bridge, bridge,
+				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	if (ret) {
+		dev_err(dp->dev, "failed to attach following panel or bridge (%d)\n", ret);
+		goto err_unregister_aux;
+	}
+
 	return 0;
 
 err_unregister_aux:
-- 
2.34.1

