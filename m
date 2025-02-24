Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4964A4218E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 14:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBAF10E551;
	Mon, 24 Feb 2025 13:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="FzjpxCwV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49229.qiye.163.com (mail-m49229.qiye.163.com
 [45.254.49.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37CEF10E036
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:14:19 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id bfd28821;
 Mon, 24 Feb 2025 16:14:16 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, sebastian.reichel@collabora.com,
 cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com,
 l.stach@pengutronix.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v7 10/15] drm/rockchip: analogix_dp: Add support to get panel
 from the DP AUX bus
Date: Mon, 24 Feb 2025 16:13:20 +0800
Message-Id: <20250224081325.96724-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGU8fTVZOGR8ZTEwZHhpOQ0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a953705699703a3kunmbfd28821
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PiI6SDo6CTIIShMLNj1DESg8
 VjIaCQJVSlVKTE9LSENPQ05DT0hMVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPTUhMNwY+
DKIM-Signature: a=rsa-sha256;
 b=FzjpxCwVjR2/ggT1I7I92LeMRmj2z47VGJL0+i2xbGnVJjpWnKQj2665anxorGBOTQOBXOqjfhvJQTLmr0NXlhKoigw4M/EnfYWKmK8ms2p1mX6LpLo6aGhWZpjECwS6whzii+gf+4MbQ6FhyW+HXuz2BoM5VEnxxHab+SSwAuo=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=NX5fbGEsZgrO5RoHv9ius1DqmYq4vKomQhFvCfpI4Xk=;
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

Move drm_of_find_panel_or_bridge() a little later and combine it with
component_add() into a new function rockchip_dp_link_panel(). The function
will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
aiding to support for obtaining the eDP panel via the DP AUX bus.

If failed to get the panel from the DP AUX bus, it will then try the other
way to get panel information through the platform bus.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes in v4:
- Use done_probing() to call drm_of_find_panel_or_bridge() and
  component_add() when getting panel from the DP AUX bus

Changes in v5:
- Use the functions exported by the Analogix side to get the pointers of
  struct analogix_dp_plat_data and struct drm_dp_aux.
- Use dev_err() instead of drm_err() in rockchip_dp_poweron().

Changes in v6:
- Keep drm_err() in rockchip_dp_poweron()
- Pass 'dp' in drm_...() rather than 'dp->drm_dev'

Changes in v7:
- Include the drm_dp_aux_bus.h for devm_of_dp_aux_populate_bus()
- Use dev_err_probe() for the return value check of
  devm_of_dp_aux_populate_bus()
- Select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
- Restore the error check for drm_of_find_panel_or_bridge() which was
  removed by mistake
---
 drivers/gpu/drm/rockchip/Kconfig              |  1 +
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 37 ++++++++++++++-----
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 26c4410b2407..f9d7776a859a 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -8,6 +8,7 @@ config DRM_ROCKCHIP
 	select DRM_PANEL
 	select VIDEOMODE_HELPERS
 	select DRM_ANALOGIX_DP if ROCKCHIP_ANALOGIX_DP
+	select DRM_DISPLAY_DP_AUX_BUS if ROCKCHIP_ANALOGIX_DP
 	select DRM_DW_HDMI if ROCKCHIP_DW_HDMI
 	select DRM_DW_HDMI_QP if ROCKCHIP_DW_HDMI_QP
 	select DRM_DW_MIPI_DSI if ROCKCHIP_DW_MIPI_DSI
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index a8265a1bf9ff..bbfcc59081f6 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,6 +21,7 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
+#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -392,11 +393,27 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
+static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
+{
+	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
+	if (ret && ret != -ENODEV)
+		return ret;
+
+	ret = component_add(dp->dev, &rockchip_dp_component_ops);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct rockchip_dp_chip_data *dp_data;
-	struct drm_panel *panel = NULL;
 	struct rockchip_dp_device *dp;
 	struct resource *res;
 	int i;
@@ -406,10 +423,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (!dp_data)
 		return -ENODEV;
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret < 0 && ret != -ENODEV)
-		return ret;
-
 	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
 	if (!dp)
 		return -ENOMEM;
@@ -432,7 +445,6 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 
 	dp->dev = dev;
 	dp->adp = ERR_PTR(-ENODEV);
-	dp->plat_data.panel = panel;
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
@@ -448,9 +460,16 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = component_add(dev, &rockchip_dp_component_ops);
-	if (ret)
-		return ret;
+	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
+	if (ret) {
+		if (ret != -ENODEV)
+			return dev_err_probe(dp->dev, ret,
+					     "failed to populate aux bus : %d\n", ret);
+
+		ret = rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-- 
2.34.1

