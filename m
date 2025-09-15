Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B62FB56DBE
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 03:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7E510E277;
	Mon, 15 Sep 2025 01:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="LFNkKIz/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32114.qiye.163.com (mail-m32114.qiye.163.com
 [220.197.32.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF410E277
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 01:06:05 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 22c2d7f23;
 Mon, 15 Sep 2025 09:06:01 +0800 (GMT+08:00)
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
Subject: [PATCH v5 17/17] drm/bridge: analogix_dp: Apply panel_bridge helper
Date: Mon, 15 Sep 2025 09:05:57 +0800
Message-Id: <20250915010557.244692-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a994ae8489703a3kunm2e24f0f2c406ad
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGklMTFYZTB5LGkIaT00ZHRlWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=LFNkKIz/N3bu37tZp7ez4ISGt1rPba2Xe+HHNsgqpNg5ZxHNIc64Ug8V3NwK5cHtaiDi/WzuCT9Un86A8dfLj5u290PFcXApcRNgEbrNnJJFdVmjm5sOeX9FYec3vcF0UfC1N+Y6Ck5qmgDCGR0Xc7/aGIbjllALGHBckuL5spo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=wyl4GTfuVp8GLSnSJKlEMZiEYu5mv+JiSb0mho34cjc=;
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

Changes in v4:
- Rename the &analogix_dp_plat_data.bridge to
  &analogix_dp_plat_data.next_bridge.

Changes in v5:
- Move panel_bridge addition a little forward.
- Move next_bridge attachment from Analogix side to Rockchip/Exynos
  side.
---
 .../drm/bridge/analogix/analogix_dp_core.c    | 29 +++++++++----------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 5e9e14b2f29a..e53dc0420490 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -857,11 +857,7 @@ static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_co
 	struct analogix_dp_device *dp = to_dp(bridge);
 	int num_modes = 0;
 
-	if (dp->plat_data->panel)
-		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
-
-	if (dp->plat_data->next_bridge)
-		num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
+	num_modes += drm_bridge_get_modes(dp->plat_data->next_bridge, connector);
 
 	return num_modes;
 }
@@ -909,7 +905,7 @@ analogix_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *conne
 	struct analogix_dp_device *dp = to_dp(bridge);
 	enum drm_connector_status status = connector_status_disconnected;
 
-	if (dp->plat_data->panel)
+	if (drm_bridge_is_panel(dp->plat_data->next_bridge))
 		return connector_status_connected;
 
 	if (!analogix_dp_detect_hpd(dp))
@@ -994,8 +990,6 @@ static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	/* Don't touch the panel if we're coming back from PSR */
 	if (old_crtc_state && old_crtc_state->self_refresh_active)
 		return;
-
-	drm_panel_prepare(dp->plat_data->panel);
 }
 
 static int analogix_dp_set_bridge(struct analogix_dp_device *dp)
@@ -1150,7 +1144,6 @@ static void analogix_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	while (timeout_loop < MAX_PLL_LOCK_LOOP) {
 		if (analogix_dp_set_bridge(dp) == 0) {
 			dp->dpms_mode = DRM_MODE_DPMS_ON;
-			drm_panel_enable(dp->plat_data->panel);
 			return;
 		}
 		dev_err(dp->dev, "failed to set bridge, retry: %d\n",
@@ -1168,16 +1161,12 @@ static void analogix_dp_bridge_disable(struct drm_bridge *bridge)
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
@@ -1498,15 +1487,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
 		return ret;
 	}
 
-	if (dp->plat_data->panel)
+	if (dp->plat_data->panel) {
 		/* If the next is a panel, the EDID parsing is checked by the panel driver */
 		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
-	else if (dp->plat_data->next_bridge)
+
+		dp->plat_data->next_bridge = devm_drm_panel_bridge_add(dp->dev,
+								       dp->plat_data->panel);
+		if (IS_ERR(dp->plat_data->next_bridge)) {
+			ret = PTR_ERR(bridge);
+			goto err_unregister_aux;
+		}
+	} else if (dp->plat_data->next_bridge) {
 		/* If the next is a bridge, the supported operations depend on the next bridge */
 		bridge->ops = 0;
-	else
+	} else {
 		/* In DP mode, the EDID parsing and HPD detection should be supported */
 		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+	}
 
 	bridge->of_node = dp->dev->of_node;
 	bridge->type = DRM_MODE_CONNECTOR_eDP;
-- 
2.34.1

