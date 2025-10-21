Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD4BF4696
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D38910E55D;
	Tue, 21 Oct 2025 02:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="QIAutRYY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m1973175.qiye.163.com (mail-m1973175.qiye.163.com
 [220.197.31.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0007A10E55D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:57:16 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 26979c619;
 Tue, 21 Oct 2025 10:57:12 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
 alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 m.szyprowski@samsung.com, luca.ceresoli@bootlin.com, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 08/18] drm/exynos: exynos_dp: Apply of-display-mode-bridge
 to parse the display-timings node
Date: Tue, 21 Oct 2025 10:56:54 +0800
Message-Id: <20251021025701.1524229-1-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021023130.1523707-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b3047603a3kunmcdd3bf8c5a402a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkgfTVYfQh8aGkNDTUhNQ01WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNQk
 tVSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=QIAutRYYHTvhVTgjC3uYoHP/QIXWTsU0vgvlk0wvkLxpZC2ae06FXyl0bVbZmtEwCHWn9pTwidsTlNHoyVBIdYJJxDBQaQO9YjizNS38xlFz8usiUYTSiMxcnhqVxn5ZTKipC+/rniAIq22E2N9GDu9hCcajGXHKC7FJnSLe1Y4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=DLgwRoSZkiEzvN/zcPKGoFOzo9iVfJiXb9YkvPXxjaY=;
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

If there is neither a panel nor a bridge, the display timing can be
parsed from the display-timings node under the dp node.

In order to get rid of &analogix_dp_plat_data.get_modes() and make
the codes more consistent, apply DRM of-display-mode-bridge to parse
display timings.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

------

Changes in v6:
- Apply DRM legacy bridge to parse display timings instead of
  implementing the same codes only for Exynos DP.

Changes in v7:
- Use temporary flag &exynos_dp_device.has_of_bridge, which will be
  removed in the following patch, instead of applying API
  drm_bridge_is_legacy().
- Remove exynos_dp_legacy_bridge_init() and inline API
  devm_drm_of_display_mode_bridge().
---
 drivers/gpu/drm/exynos/Kconfig     |  1 +
 drivers/gpu/drm/exynos/exynos_dp.c | 66 ++++++++----------------------
 2 files changed, 17 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index 0d13828e7d9e..380d9a8ce259 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -72,6 +72,7 @@ config DRM_EXYNOS_DP
 	select DRM_ANALOGIX_DP
 	select DRM_DISPLAY_DP_HELPER
 	default DRM_EXYNOS
+	select DRM_OF_DISPLAY_MODE_BRIDGE
 	select DRM_PANEL
 	help
 	  This enables support for DP device.
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index e20513164032..ac16138a22fe 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -19,6 +19,7 @@
 #include <video/videomode.h>
 
 #include <drm/bridge/analogix_dp.h>
+#include <drm/bridge/of-display-mode-bridge.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
@@ -38,9 +39,10 @@ struct exynos_dp_device {
 	struct drm_device          *drm_dev;
 	struct device              *dev;
 
-	struct videomode           vm;
 	struct analogix_dp_device *adp;
 	struct analogix_dp_plat_data plat_data;
+
+	bool has_of_bridge;
 };
 
 static int exynos_dp_crtc_clock_enable(struct analogix_dp_plat_data *plat_data,
@@ -67,44 +69,20 @@ static int exynos_dp_poweroff(struct analogix_dp_plat_data *plat_data)
 	return exynos_dp_crtc_clock_enable(plat_data, false);
 }
 
-static int exynos_dp_get_modes(struct analogix_dp_plat_data *plat_data,
-			       struct drm_connector *connector)
-{
-	struct exynos_dp_device *dp = to_dp(plat_data);
-	struct drm_display_mode *mode;
-
-	if (dp->plat_data.panel)
-		return 0;
-
-	mode = drm_mode_create(connector->dev);
-	if (!mode) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed to create a new display mode.\n");
-		return 0;
-	}
-
-	drm_display_mode_from_videomode(&dp->vm, mode);
-	connector->display_info.width_mm = mode->width_mm;
-	connector->display_info.height_mm = mode->height_mm;
-
-	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
-	drm_mode_set_name(mode);
-	drm_mode_probed_add(connector, mode);
-
-	return 1;
-}
-
 static int exynos_dp_bridge_attach(struct analogix_dp_plat_data *plat_data,
 				   struct drm_bridge *bridge,
 				   struct drm_connector *connector)
 {
 	struct exynos_dp_device *dp = to_dp(plat_data);
+	enum drm_bridge_attach_flags flags = 0;
 	int ret;
 
 	/* Pre-empt DP connector creation if there's a bridge */
 	if (plat_data->next_bridge) {
-		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge,
-					0);
+		if (dp->has_of_bridge)
+			flags = DRM_BRIDGE_ATTACH_NO_CONNECTOR;
+
+		ret = drm_bridge_attach(&dp->encoder, plat_data->next_bridge, bridge, flags);
 		if (ret)
 			return ret;
 	}
@@ -129,19 +107,6 @@ static const struct drm_encoder_helper_funcs exynos_dp_encoder_helper_funcs = {
 	.disable = exynos_dp_nop,
 };
 
-static int exynos_dp_dt_parse_panel(struct exynos_dp_device *dp)
-{
-	int ret;
-
-	ret = of_get_videomode(dp->dev->of_node, &dp->vm, OF_USE_NATIVE_MODE);
-	if (ret) {
-		DRM_DEV_ERROR(dp->dev,
-			      "failed: of_get_videomode() : %d\n", ret);
-		return ret;
-	}
-	return 0;
-}
-
 static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 {
 	struct exynos_dp_device *dp = dev_get_drvdata(dev);
@@ -151,12 +116,6 @@ static int exynos_dp_bind(struct device *dev, struct device *master, void *data)
 
 	dp->drm_dev = drm_dev;
 
-	if (!dp->plat_data.panel && !dp->plat_data.next_bridge) {
-		ret = exynos_dp_dt_parse_panel(dp);
-		if (ret)
-			return ret;
-	}
-
 	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
 
 	drm_encoder_helper_add(encoder, &exynos_dp_encoder_helper_funcs);
@@ -223,6 +182,14 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	}
 
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, &bridge);
+	if (ret == -ENODEV) {
+		dp->plat_data.next_bridge = devm_drm_of_display_mode_bridge(dp->dev,
+									dp->dev->of_node,
+									DRM_MODE_CONNECTOR_eDP);
+		ret = IS_ERR(dp->plat_data.next_bridge) ? PTR_ERR(dp->plat_data.next_bridge) : 0;
+		if (!ret)
+			dp->has_of_bridge = true;
+	}
 	if (ret)
 		return ret;
 
@@ -233,7 +200,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
 	dp->plat_data.power_on = exynos_dp_poweron;
 	dp->plat_data.power_off = exynos_dp_poweroff;
 	dp->plat_data.attach = exynos_dp_bridge_attach;
-	dp->plat_data.get_modes = exynos_dp_get_modes;
 	dp->plat_data.skip_connector = !!bridge;
 
 out:
-- 
2.34.1

