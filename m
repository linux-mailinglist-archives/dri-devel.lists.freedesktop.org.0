Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D01F12A728
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286B189D53;
	Wed, 25 Dec 2019 10:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB5889C69
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:39:28 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 1DE12E0007;
 Tue, 24 Dec 2019 14:39:26 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH v2 09/11] drm/rockchip: lvds: Add PX30 support
Date: Tue, 24 Dec 2019 15:38:58 +0100
Message-Id: <20191224143900.23567-10-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191224143900.23567-1-miquel.raynal@bootlin.com>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
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
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 143 +++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.h |  14 +++
 2 files changed, 157 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index f2ece09e4e24..d762cdd114f9 100644
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
@@ -53,6 +54,7 @@ struct rockchip_lvds {
 	void __iomem *regs;
 	struct regmap *grf;
 	struct clk *pclk;
+	struct phy *dphy;
 	const struct rockchip_lvds_soc_data *soc_data;
 	int output; /* rgb lvds or dual lvds output */
 	int format; /* vesa or jeida format */
@@ -321,6 +323,103 @@ static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
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
+
+	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
+		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
+			      lvds->output);
+		return -EINVAL;
+	}
+
+	/* Set format */
+	return regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
+				  PX30_LVDS_FORMAT(lvds->format),
+				  PX30_LVDS_FORMAT(lvds->format));
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
@@ -328,6 +427,13 @@ struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
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
@@ -378,16 +484,53 @@ static int rk3288_lvds_probe(struct platform_device *pdev,
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
index e41e9ab3c306..ff3cffc4770d 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.h
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.h
@@ -106,4 +106,18 @@
 #define LVDS_VESA_18				2
 #define LVDS_JEIDA_18				3
 
+#define HIWORD_UPDATE(v, h, l)  ((GENMASK(h, l) << 16) | (v << l))
+
+#define PX30_LVDS_GRF_PD_VO_CON0		0x434
+#define   PX30_LVDS_TIE_CLKS(val)		HIWORD_UPDATE(val,  8,  8)
+#define   PX30_LVDS_INVERT_CLKS(val)		HIWORD_UPDATE(val,  9,  9)
+#define   PX30_LVDS_INVERT_DCLK(val)		HIWORD_UPDATE(val,  5,  5)
+
+#define PX30_LVDS_GRF_PD_VO_CON1		0x438
+#define   PX30_LVDS_FORMAT(val)			HIWORD_UPDATE(val, 14, 13)
+#define   PX30_LVDS_MODE_EN(val)		HIWORD_UPDATE(val, 12, 12)
+#define   PX30_LVDS_MSBSEL(val)			HIWORD_UPDATE(val, 11, 11)
+#define   PX30_LVDS_P2S_EN(val)			HIWORD_UPDATE(val,  6,  6)
+#define   PX30_LVDS_VOP_SEL(val)		HIWORD_UPDATE(val,  1,  1)
+
 #endif /* _ROCKCHIP_LVDS_ */
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
