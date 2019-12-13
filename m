Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514A11F226
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2019 15:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0F96E37C;
	Sat, 14 Dec 2019 14:43:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958226EC0C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:20:41 +0000 (UTC)
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id D31C43B3ECE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 18:11:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 83362200015;
 Fri, 13 Dec 2019 18:11:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
Date: Fri, 13 Dec 2019 19:10:48 +0100
Message-Id: <20191213181051.25983-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213181051.25983-1-miquel.raynal@bootlin.com>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 14 Dec 2019 14:42:54 +0000
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
Cc: dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce PX30 LVDS support. This means adding the relevant helper
functions, a specific probe and also the initialization of a specific
PHY.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 173 +++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.h |  14 ++
 2 files changed, 187 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index a0c203dcd66f..e550c2f102e0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -10,6 +10,7 @@
 #include <linux/component.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
@@ -54,6 +55,7 @@ struct rockchip_lvds {
 	void __iomem *regs;
 	struct regmap *grf;
 	struct clk *pclk;
+	struct phy *dphy;
 	const struct rockchip_lvds_soc_data *soc_data;
 	int output; /* rgb lvds or dual lvds output */
 	int format; /* vesa or jeida format */
@@ -322,6 +324,133 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
 	drm_panel_unprepare(lvds->panel);
 }
 
+static int px30_lvds_poweron(struct rockchip_lvds *lvds)
+{
+	int ret;
+
+	ret = pm_runtime_get_sync(lvds->dev);
+	if (ret < 0) {
+		DRM_DEV_ERROR(lvds->dev, "failed to get pm runtime: %d\n", ret);
+		return ret;
+	}
+
+	/* Enable LVDS mode */
+	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
+				  PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1));
+}
+
+static void px30_lvds_poweroff(struct rockchip_lvds *lvds)
+{
+	regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+			   PX30_LVDS_MODE_EN(1) | PX30_LVDS_P2S_EN(1),
+			   PX30_LVDS_MODE_EN(0) | PX30_LVDS_P2S_EN(0));
+
+	pm_runtime_put(lvds->dev);
+}
+
+static int px30_lvds_grf_config(struct drm_encoder *encoder,
+				struct drm_display_mode *mode)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
+	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
+	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
+	int ret;
+
+	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
+		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
+			      lvds->output);
+		return -EINVAL;
+	}
+
+	if (nhsync ^ nvsync) {
+		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
+		return -EINVAL;
+	}
+
+	/* Set format */
+	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+				 PX30_LVDS_FORMAT(lvds->format),
+				 PX30_LVDS_FORMAT(lvds->format));
+	if (ret)
+		return ret;
+
+	/* Control Hsync/Vsync polarity */
+	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
+				 PX30_LVDS_TIE_CLKS(1),
+				 PX30_LVDS_TIE_CLKS(1));
+	if (ret)
+		return ret;
+
+	/* Set Hsync/Vsync polarity */
+	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
+				 PX30_LVDS_INVERT_CLKS(1),
+				 PX30_LVDS_INVERT_CLKS(nhsync));
+	if (ret)
+		return ret;
+
+	/* Set dclk polarity */
+	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
+				  PX30_LVDS_INVERT_DCLK(1),
+				  PX30_LVDS_INVERT_DCLK(ndclk));
+}
+
+static int px30_lvds_set_vop_source(struct rockchip_lvds *lvds,
+				    struct drm_encoder *encoder)
+{
+	int vop;
+
+	vop = drm_of_encoder_active_endpoint_id(lvds->dev->of_node, encoder);
+	if (vop < 0)
+		return vop;
+
+	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+				  PX30_LVDS_VOP_SEL(1),
+				  PX30_LVDS_VOP_SEL(vop));
+}
+
+static void px30_lvds_encoder_enable(struct drm_encoder *encoder)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
+	int ret;
+
+	drm_panel_prepare(lvds->panel);
+
+	ret = px30_lvds_poweron(lvds);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to power on LVDS: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	ret = px30_lvds_grf_config(encoder, mode);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to configure LVDS: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	ret = px30_lvds_set_vop_source(lvds, encoder);
+	if (ret) {
+		DRM_DEV_ERROR(lvds->dev, "failed to set VOP source: %d\n", ret);
+		drm_panel_unprepare(lvds->panel);
+		return;
+	}
+
+	drm_panel_enable(lvds->panel);
+}
+
+static void px30_lvds_encoder_disable(struct drm_encoder *encoder)
+{
+	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
+
+	drm_panel_disable(lvds->panel);
+	px30_lvds_poweroff(lvds);
+	drm_panel_unprepare(lvds->panel);
+}
+
 static const
 struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
 	.enable = rk3288_lvds_encoder_enable,
@@ -329,6 +458,13 @@ struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
 	.atomic_check = rockchip_lvds_encoder_atomic_check,
 };
 
+static const
+struct drm_encoder_helper_funcs px30_lvds_encoder_helper_funcs = {
+	.enable = px30_lvds_encoder_enable,
+	.disable = px30_lvds_encoder_disable,
+	.atomic_check = rockchip_lvds_encoder_atomic_check,
+};
+
 static const struct drm_encoder_funcs rockchip_lvds_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
@@ -379,16 +515,53 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
 	return 0;
 }
 
+static int px30_lvds_probe(struct platform_device *pdev,
+			   struct rockchip_lvds *lvds)
+{
+	int ret;
+
+	/* MSB */
+	ret =  regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+				  PX30_LVDS_MSBSEL(1),
+				  PX30_LVDS_MSBSEL(1));
+	if (ret)
+		return ret;
+
+	/* PHY */
+	lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
+	if (IS_ERR(lvds->dphy))
+		return PTR_ERR(lvds->dphy);
+
+	phy_init(lvds->dphy);
+	if (ret)
+		return ret;
+
+	phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
+	if (ret)
+		return ret;
+
+	return phy_power_on(lvds->dphy);
+}
+
 static const struct rockchip_lvds_soc_data rk3288_lvds_data = {
 	.probe = rk3288_lvds_probe,
 	.helper_funcs = &rk3288_lvds_encoder_helper_funcs,
 };
 
+static const struct rockchip_lvds_soc_data px30_lvds_data = {
+	.probe = px30_lvds_probe,
+	.helper_funcs = &px30_lvds_encoder_helper_funcs,
+};
+
 static const struct of_device_id rockchip_lvds_dt_ids[] = {
 	{
 		.compatible = "rockchip,rk3288-lvds",
 		.data = &rk3288_lvds_data
 	},
+	{
+		.compatible = "rockchip,px30-lvds",
+		.data = &px30_lvds_data
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rockchip_lvds_dt_ids);
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.h b/drivers/gpu/drm/rockchip/rockchip_lvds.h
index e41e9ab3c306..7cfb102b4854 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -106,4 +106,18 @@
 #define LVDS_VESA_18				2
 #define LVDS_JEIDA_18				3
 
+#define WRITE_EN(v, h, l)  ((GENMASK(h, l) << 16) | (v << l))
+
+#define PX30_LVDS_GRF_PD_VO_CON0		0x434
+#define   PX30_LVDS_TIE_CLKS(val)		WRITE_EN(val,  8,  8)
+#define   PX30_LVDS_INVERT_CLKS(val)		WRITE_EN(val,  9,  9)
+#define   PX30_LVDS_INVERT_DCLK(val)		WRITE_EN(val,  5,  5)
+
+#define PX30_LVDS_GRF_PD_VO_CON1		0x438
+#define   PX30_LVDS_FORMAT(val)			WRITE_EN(val, 14, 13)
+#define   PX30_LVDS_MODE_EN(val)		WRITE_EN(val, 12, 12)
+#define   PX30_LVDS_MSBSEL(val)			WRITE_EN(val, 11, 11)
+#define   PX30_LVDS_P2S_EN(val)			WRITE_EN(val,  6,  6)
+#define   PX30_LVDS_VOP_SEL(val)		WRITE_EN(val,  1,  1)
+
 #endif /* _ROCKCHIP_LVDS_ */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
