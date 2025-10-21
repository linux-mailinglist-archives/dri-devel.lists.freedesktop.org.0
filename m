Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AEBF46BA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 04:58:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6947110E564;
	Tue, 21 Oct 2025 02:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="YaEynfXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m32124.qiye.163.com (mail-m32124.qiye.163.com
 [220.197.32.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D3210E564
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 02:58:38 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2697bbbed;
 Tue, 21 Oct 2025 10:58:34 +0800 (GMT+08:00)
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
Subject: [PATCH v7 14/18] drm/rockchip: analogix_dp: Apply
 analogix_dp_finish_probe()
Date: Tue, 21 Oct 2025 10:57:00 +0800
Message-Id: <20251021025701.1524229-7-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025701.1524229-1-damon.ding@rock-chips.com>
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021025701.1524229-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a04b443ff03a3kunmcdd3bf8c5a48b9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxpOTFZPTkxLSxpKGR1CSU9WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
 1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
 b=YaEynfXY23Oub9XICo1+FkgrLlH11F1g+dBOl0CWOSl+awSiligI5wFbVBgxkuT0TUp3+uHZAG9Lp8oPvhXpYUKdWJ3iXLPqSKuwymz//1qXmbiWQm06D+AQwX6oOMC4ALXNHxwpuw/aM99yyWAhLahvbXSsqDbsFajCtIxGIVw=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=QvZ4HUQAMtPnMu23/b94zBMRRF7ubPr1onbf1FIrmU4=;
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

Apply analogix_dp_finish_probe() in order to move the panel/bridge
parsing from Rockchip side to the Analogix side.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Changes in v4:
- Rename analogix_dp_find_panel_or_bridge() to
  analogix_dp_finish_probe().

Changes in v5:
- Remove DRM_DISPLAY_DP_AUX_BUS for ROCKCHIP_ANALOGIX_DP
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 38 +------------------
 1 file changed, 2 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 3b6b2d3ca5d1..0784f19a2ed9 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -21,14 +21,12 @@
 #include <video/of_videomode.h>
 #include <video/videomode.h>
 
-#include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge_connector.h>
 #include <drm/bridge/analogix_dp.h>
 #include <drm/drm_of.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
@@ -416,24 +414,6 @@ static const struct component_ops rockchip_dp_component_ops = {
 	.unbind = rockchip_dp_unbind,
 };
 
-static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
-{
-	struct analogix_dp_plat_data *plat_data = analogix_dp_aux_to_plat_data(aux);
-	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
-	int ret;
-
-	/*
-	 * If drm_of_find_panel_or_bridge() returns -ENODEV, there may be no valid panel
-	 * or bridge nodes. The driver should go on for the driver-free bridge or the DP
-	 * mode applications.
-	 */
-	ret = drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data->panel, NULL);
-	if (ret && ret != -ENODEV)
-		return ret;
-
-	return component_add(dp->dev, &rockchip_dp_component_ops);
-}
-
 static int rockchip_dp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -472,6 +452,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	dp->plat_data.dev_type = dp->data->chip_type;
 	dp->plat_data.power_on = rockchip_dp_poweron;
 	dp->plat_data.power_off = rockchip_dp_powerdown;
+	dp->plat_data.ops = &rockchip_dp_component_ops;
 
 	ret = rockchip_dp_of_probe(dp);
 	if (ret < 0)
@@ -483,22 +464,7 @@ static int rockchip_dp_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->adp))
 		return PTR_ERR(dp->adp);
 
-	ret = devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockchip_dp_link_panel);
-	if (ret) {
-		/*
-		 * If devm_of_dp_aux_populate_bus() returns -ENODEV, the done_probing() will not
-		 * be called because there are no EP devices. Then the rockchip_dp_link_panel()
-		 * will be called directly in order to support the other valid DT configurations.
-		 *
-		 * NOTE: The devm_of_dp_aux_populate_bus() is allowed to return -EPROBE_DEFER.
-		 */
-		if (ret != -ENODEV)
-			return dev_err_probe(dp->dev, ret, "failed to populate aux bus\n");
-
-		return rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
-	}
-
-	return 0;
+	return analogix_dp_finish_probe(dp->adp);
 }
 
 static void rockchip_dp_remove(struct platform_device *pdev)
-- 
2.34.1

