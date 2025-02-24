Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C067A41703
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 09:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF3A10E153;
	Mon, 24 Feb 2025 08:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="S7veqawX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m3295.qiye.163.com (mail-m3295.qiye.163.com
 [220.197.32.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70A310E0BC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 08:14:27 +0000 (UTC)
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id bfd2884d;
 Mon, 24 Feb 2025 16:14:22 +0800 (GMT+08:00)
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
Subject: [PATCH v7 13/15] drm/rockchip: analogix_dp: Add support for RK3588
Date: Mon, 24 Feb 2025 16:13:23 +0800
Message-Id: <20250224081325.96724-14-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250224081325.96724-1-damon.ding@rock-chips.com>
References: <20250224081325.96724-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkoYHVZPSRgeGUhDH0JIHkNWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
X-HM-Tid: 0a953705826303a3kunmbfd2884d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OD46Nxw5EzIKFRMYGDM5ERYy
 LAIwCw1VSlVKTE9LSENPQ01PQ0lIVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
 EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFNT0hINwY+
DKIM-Signature: a=rsa-sha256;
 b=S7veqawXZ6Ip7kq6X/BGrdpDi3vbaxlLS9z9+/Y9oGAs+Cnrk2v57ouyeWXzrPyKLHLHBsa6cvZkWyDLo2gUnVNVbustqTsC+Hj9EUyE+LH9DcgT6Lx2uY5b0uFNga1Dr7lH9/erSb1tX2jR7eXc3jMmEvUsrL8P99JOxAFsQk4=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=bL8WDju1troBb+pwjlmDIJVq2NgMPzjB8iEraIApaog=;
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

RK3588 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
TX Combo PHY based on a Samsung IP block. There are also two independent
eDP display interface with different address on RK3588 Soc.

The patch currently adds only the basic support, specifically RGB output
up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specific
features.

In additon, the above Analogix IP has always been utilized as eDP on
Rockchip platform, despite its capability to also support the DP v1.2.
Therefore, the newly added logs will contain the term 'edp' rather than
'dp'. And the newly added 'apb' reset control is to ensure the APB bus
of eDP controller works well on the RK3588 SoC.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

---

Changes in v2:
- Add support for the other eDP output edp1

Changes in v3:
- Fix the unexpected use of alias
- Add more details in commit message

Changes in v4:
- Add the 'apb' reset control

Changes in v5:
- Use drm_...()/dev_...() instead of DRM_...()
- Clean &rockchip_dp_chip_data.reg related comments in commit message
- Move the modifications in anlogix_dp.h to the Analogix side in order
  to avoid the warning:

  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c:1506:10: warning:
  enumeration value 'RK3588_EDP' not handled in switch [-Wswitch]
          switch (dp->plat_data->dev_type) {

Changes in v6:
- Pass 'dp' in drm_...() rather than 'dp->drm_dev'
- Use drm_...() uniformly rather than mixing drm_...() and dev_..()

Changes in v7:
- Just keep the DRM_...() as they were in the previous for this series
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 61 ++++++++++++++++++-
 1 file changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index bbfcc59081f6..4ea948093157 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -52,11 +52,13 @@ struct rockchip_grf_reg_field {
 /**
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
  * @lcdc_sel: grf register field of lcdc_sel
+ * @edp_mode: grf register field of edp_mode
  * @chip_type: specific chip type
  * @reg: register base address
  */
 struct rockchip_dp_chip_data {
 	const struct rockchip_grf_reg_field lcdc_sel;
+	const struct rockchip_grf_reg_field edp_mode;
 	u32	chip_type;
 	u32	reg;
 };
@@ -71,6 +73,7 @@ struct rockchip_dp_device {
 	struct clk               *grfclk;
 	struct regmap            *grf;
 	struct reset_control     *rst;
+	struct reset_control     *apbrst;
 
 	const struct rockchip_dp_chip_data *data;
 
@@ -116,6 +119,10 @@ static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 	usleep_range(10, 20);
 	reset_control_deassert(dp->rst);
 
+	reset_control_assert(dp->apbrst);
+	usleep_range(10, 20);
+	reset_control_deassert(dp->apbrst);
+
 	return 0;
 }
 
@@ -137,12 +144,21 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 		return ret;
 	}
 
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
+	if (ret != 0)
+		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
+
 	return ret;
 }
 
 static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 {
 	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+	int ret;
+
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 0);
+	if (ret != 0)
+		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
 
 	clk_disable_unprepare(dp->pclk);
 
@@ -206,6 +222,10 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
+	struct of_endpoint endpoint;
+	struct device_node *remote_port, *remote_port_parent;
+	char name[32];
+	u32 port_id;
 	int ret;
 
 	crtc = rockchip_dp_drm_get_new_crtc(encoder, state);
@@ -223,13 +243,27 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 		return;
 	}
 
-	ret = drm_of_encoder_active_endpoint_id(dp->dev->of_node, encoder);
+	ret = drm_of_encoder_active_endpoint(dp->dev->of_node, encoder, &endpoint);
 	if (ret < 0)
 		return;
 
-	DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
+	remote_port_parent = of_graph_get_remote_port_parent(endpoint.local_node);
+	if (remote_port_parent) {
+		if (of_get_child_by_name(remote_port_parent, "ports")) {
+			remote_port = of_graph_get_remote_port(endpoint.local_node);
+			of_property_read_u32(remote_port, "reg", &port_id);
+			of_node_put(remote_port);
+			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
+		} else {
+			sprintf(name, "%s %s",
+				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
+		}
+		of_node_put(remote_port_parent);
+
+		DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
+	}
 
-	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, ret);
+	ret = rockchip_grf_field_write(dp->grf, &dp->data->lcdc_sel, endpoint.id);
 	if (ret != 0)
 		DRM_DEV_ERROR(dp->dev, "Could not write to GRF: %d\n", ret);
 
@@ -323,6 +357,12 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 		return PTR_ERR(dp->rst);
 	}
 
+	dp->apbrst = devm_reset_control_get_optional(dev, "apb");
+	if (IS_ERR(dp->apbrst)) {
+		DRM_DEV_ERROR(dev, "failed to get apb reset control\n");
+		return PTR_ERR(dp->apbrst);
+	}
+
 	return 0;
 }
 
@@ -520,9 +560,24 @@ static const struct rockchip_dp_chip_data rk3288_dp[] = {
 	{ /* sentinel */ }
 };
 
+static const struct rockchip_dp_chip_data rk3588_edp[] = {
+	{
+		.edp_mode = GRF_REG_FIELD(0x0000, 0, 0),
+		.chip_type = RK3588_EDP,
+		.reg = 0xfdec0000,
+	},
+	{
+		.edp_mode = GRF_REG_FIELD(0x0004, 0, 0),
+		.chip_type = RK3588_EDP,
+		.reg = 0xfded0000,
+	},
+	{ /* sentinel */ }
+};
+
 static const struct of_device_id rockchip_dp_dt_ids[] = {
 	{.compatible = "rockchip,rk3288-dp", .data = &rk3288_dp },
 	{.compatible = "rockchip,rk3399-edp", .data = &rk3399_edp },
+	{.compatible = "rockchip,rk3588-edp", .data = &rk3588_edp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_dp_dt_ids);
-- 
2.34.1

