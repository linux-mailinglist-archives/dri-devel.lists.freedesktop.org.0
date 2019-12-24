Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C116F12A740
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05EC489D5E;
	Wed, 25 Dec 2019 10:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B2989C97
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 14:39:20 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 91EDDE0009;
 Tue, 24 Dec 2019 14:39:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 <linux-rockchip@lists.infradead.org>
Subject: [PATCH v2 04/11] drm/rockchip: lvds: Harmonize function names
Date: Tue, 24 Dec 2019 15:38:53 +0100
Message-Id: <20191224143900.23567-5-miquel.raynal@bootlin.com>
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

Prepare the introduction of PX30 support by clarifying the function
prefixes.

We continue to prefix with 'rockchip_lvds_' generic functions that are
not specific to a single hardware. Functions implying hardware
modifications are now prefixed with 'rk3288_lvds_'.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/gpu/drm/rockchip/rockchip_lvds.c | 138 ++++++++++++-----------
 1 file changed, 73 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index 64aefa856896..3c08e50923ae 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -66,7 +66,8 @@ struct rockchip_lvds {
 	struct dev_pin_info *pins;
 };
 
-static inline void lvds_writel(struct rockchip_lvds *lvds, u32 offset, u32 val)
+static inline void rk3288_writel(struct rockchip_lvds *lvds, u32 offset,
+				 u32 val)
 {
 	writel_relaxed(val, lvds->regs + offset);
 	if (lvds->output == DISPLAY_OUTPUT_LVDS)
@@ -74,7 +75,7 @@ static inline void lvds_writel(struct rockchip_lvds *lvds, u32 offset, u32 val)
 	writel_relaxed(val, lvds->regs + offset + lvds->soc_data->ch1_offset);
 }
 
-static inline int lvds_name_to_format(const char *s)
+static inline int rockchip_lvds_name_to_format(const char *s)
 {
 	if (strncmp(s, "jeida-18", 8) == 0)
 		return LVDS_JEIDA_18;
@@ -86,7 +87,7 @@ static inline int lvds_name_to_format(const char *s)
 	return -EINVAL;
 }
 
-static inline int lvds_name_to_output(const char *s)
+static inline int rockchip_lvds_name_to_output(const char *s)
 {
 	if (strncmp(s, "rgb", 3) == 0)
 		return DISPLAY_OUTPUT_RGB;
@@ -98,7 +99,7 @@ static inline int lvds_name_to_output(const char *s)
 	return -EINVAL;
 }
 
-static int rockchip_lvds_poweron(struct rockchip_lvds *lvds)
+static int rk3288_lvds_poweron(struct rockchip_lvds *lvds)
 {
 	int ret;
 	u32 val;
@@ -120,63 +121,70 @@ static int rockchip_lvds_poweron(struct rockchip_lvds *lvds)
 	if (lvds->output == DISPLAY_OUTPUT_RGB) {
 		val |= RK3288_LVDS_CH0_REG0_TTL_EN |
 			RK3288_LVDS_CH0_REG0_LANECK_EN;
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG0, val);
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG2,
-			    RK3288_LVDS_PLL_FBDIV_REG2(0x46));
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG4,
-			    RK3288_LVDS_CH0_REG4_LANECK_TTL_MODE |
-			    RK3288_LVDS_CH0_REG4_LANE4_TTL_MODE |
-			    RK3288_LVDS_CH0_REG4_LANE3_TTL_MODE |
-			    RK3288_LVDS_CH0_REG4_LANE2_TTL_MODE |
-			    RK3288_LVDS_CH0_REG4_LANE1_TTL_MODE |
-			    RK3288_LVDS_CH0_REG4_LANE0_TTL_MODE);
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG5,
-			    RK3288_LVDS_CH0_REG5_LANECK_TTL_DATA |
-			    RK3288_LVDS_CH0_REG5_LANE4_TTL_DATA |
-			    RK3288_LVDS_CH0_REG5_LANE3_TTL_DATA |
-			    RK3288_LVDS_CH0_REG5_LANE2_TTL_DATA |
-			    RK3288_LVDS_CH0_REG5_LANE1_TTL_DATA |
-			    RK3288_LVDS_CH0_REG5_LANE0_TTL_DATA);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG0, val);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG2,
+			      RK3288_LVDS_PLL_FBDIV_REG2(0x46));
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG4,
+			      RK3288_LVDS_CH0_REG4_LANECK_TTL_MODE |
+			      RK3288_LVDS_CH0_REG4_LANE4_TTL_MODE |
+			      RK3288_LVDS_CH0_REG4_LANE3_TTL_MODE |
+			      RK3288_LVDS_CH0_REG4_LANE2_TTL_MODE |
+			      RK3288_LVDS_CH0_REG4_LANE1_TTL_MODE |
+			      RK3288_LVDS_CH0_REG4_LANE0_TTL_MODE);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG5,
+			      RK3288_LVDS_CH0_REG5_LANECK_TTL_DATA |
+			      RK3288_LVDS_CH0_REG5_LANE4_TTL_DATA |
+			      RK3288_LVDS_CH0_REG5_LANE3_TTL_DATA |
+			      RK3288_LVDS_CH0_REG5_LANE2_TTL_DATA |
+			      RK3288_LVDS_CH0_REG5_LANE1_TTL_DATA |
+			      RK3288_LVDS_CH0_REG5_LANE0_TTL_DATA);
 	} else {
 		val |= RK3288_LVDS_CH0_REG0_LVDS_EN |
 			    RK3288_LVDS_CH0_REG0_LANECK_EN;
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG0, val);
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG1,
-			    RK3288_LVDS_CH0_REG1_LANECK_BIAS |
-			    RK3288_LVDS_CH0_REG1_LANE4_BIAS |
-			    RK3288_LVDS_CH0_REG1_LANE3_BIAS |
-			    RK3288_LVDS_CH0_REG1_LANE2_BIAS |
-			    RK3288_LVDS_CH0_REG1_LANE1_BIAS |
-			    RK3288_LVDS_CH0_REG1_LANE0_BIAS);
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG2,
-			    RK3288_LVDS_CH0_REG2_RESERVE_ON |
-			    RK3288_LVDS_CH0_REG2_LANECK_LVDS_MODE |
-			    RK3288_LVDS_CH0_REG2_LANE4_LVDS_MODE |
-			    RK3288_LVDS_CH0_REG2_LANE3_LVDS_MODE |
-			    RK3288_LVDS_CH0_REG2_LANE2_LVDS_MODE |
-			    RK3288_LVDS_CH0_REG2_LANE1_LVDS_MODE |
-			    RK3288_LVDS_CH0_REG2_LANE0_LVDS_MODE |
-			    RK3288_LVDS_PLL_FBDIV_REG2(0x46));
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG4, 0x00);
-		lvds_writel(lvds, RK3288_LVDS_CH0_REG5, 0x00);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG0, val);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG1,
+			      RK3288_LVDS_CH0_REG1_LANECK_BIAS |
+			      RK3288_LVDS_CH0_REG1_LANE4_BIAS |
+			      RK3288_LVDS_CH0_REG1_LANE3_BIAS |
+			      RK3288_LVDS_CH0_REG1_LANE2_BIAS |
+			      RK3288_LVDS_CH0_REG1_LANE1_BIAS |
+			      RK3288_LVDS_CH0_REG1_LANE0_BIAS);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG2,
+			      RK3288_LVDS_CH0_REG2_RESERVE_ON |
+			      RK3288_LVDS_CH0_REG2_LANECK_LVDS_MODE |
+			      RK3288_LVDS_CH0_REG2_LANE4_LVDS_MODE |
+			      RK3288_LVDS_CH0_REG2_LANE3_LVDS_MODE |
+			      RK3288_LVDS_CH0_REG2_LANE2_LVDS_MODE |
+			      RK3288_LVDS_CH0_REG2_LANE1_LVDS_MODE |
+			      RK3288_LVDS_CH0_REG2_LANE0_LVDS_MODE |
+			      RK3288_LVDS_PLL_FBDIV_REG2(0x46));
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG4, 0x00);
+		rk3288_writel(lvds, RK3288_LVDS_CH0_REG5, 0x00);
 	}
-	lvds_writel(lvds, RK3288_LVDS_CH0_REG3, RK3288_LVDS_PLL_FBDIV_REG3(0x46));
-	lvds_writel(lvds, RK3288_LVDS_CH0_REGD, RK3288_LVDS_PLL_PREDIV_REGD(0x0a));
-	lvds_writel(lvds, RK3288_LVDS_CH0_REG20, RK3288_LVDS_CH0_REG20_LSB);
+	rk3288_writel(lvds, RK3288_LVDS_CH0_REG3,
+		      RK3288_LVDS_PLL_FBDIV_REG3(0x46));
+	rk3288_writel(lvds, RK3288_LVDS_CH0_REGD,
+		      RK3288_LVDS_PLL_PREDIV_REGD(0x0a));
+	rk3288_writel(lvds, RK3288_LVDS_CH0_REG20,
+		      RK3288_LVDS_CH0_REG20_LSB);
 
-	lvds_writel(lvds, RK3288_LVDS_CFG_REGC, RK3288_LVDS_CFG_REGC_PLL_ENABLE);
-	lvds_writel(lvds, RK3288_LVDS_CFG_REG21, RK3288_LVDS_CFG_REG21_TX_ENABLE);
+	rk3288_writel(lvds, RK3288_LVDS_CFG_REGC,
+		      RK3288_LVDS_CFG_REGC_PLL_ENABLE);
+	rk3288_writel(lvds, RK3288_LVDS_CFG_REG21,
+		      RK3288_LVDS_CFG_REG21_TX_ENABLE);
 
 	return 0;
 }
 
-static void rockchip_lvds_poweroff(struct rockchip_lvds *lvds)
+static void rk3288_lvds_poweroff(struct rockchip_lvds *lvds)
 {
 	int ret;
 	u32 val;
 
-	lvds_writel(lvds, RK3288_LVDS_CFG_REG21, RK3288_LVDS_CFG_REG21_TX_ENABLE);
-	lvds_writel(lvds, RK3288_LVDS_CFG_REGC, RK3288_LVDS_CFG_REGC_PLL_ENABLE);
+	rk3288_writel(lvds, RK3288_LVDS_CFG_REG21,
+		      RK3288_LVDS_CFG_REG21_TX_ENABLE);
+	rk3288_writel(lvds, RK3288_LVDS_CFG_REGC,
+		      RK3288_LVDS_CFG_REGC_PLL_ENABLE);
 	val = LVDS_DUAL | LVDS_TTL_EN | LVDS_CH0_EN | LVDS_CH1_EN | LVDS_PWRDN;
 	val |= val << 16;
 	ret = regmap_write(lvds->grf, lvds->soc_data->grf_soc_con7, val);
@@ -208,8 +216,8 @@ struct drm_connector_helper_funcs rockchip_lvds_connector_helper_funcs = {
 	.get_modes = rockchip_lvds_connector_get_modes,
 };
 
-static void rockchip_lvds_grf_config(struct drm_encoder *encoder,
-				     struct drm_display_mode *mode)
+static void rk3288_lvds_grf_config(struct drm_encoder *encoder,
+				   struct drm_display_mode *mode)
 {
 	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
 	u8 pin_hsync = (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 1 : 0;
@@ -240,8 +248,8 @@ static void rockchip_lvds_grf_config(struct drm_encoder *encoder,
 	}
 }
 
-static int rockchip_lvds_set_vop_source(struct rockchip_lvds *lvds,
-					struct drm_encoder *encoder)
+static int rk3288_lvds_set_vop_source(struct rockchip_lvds *lvds,
+				      struct drm_encoder *encoder)
 {
 	u32 val;
 	int ret;
@@ -277,36 +285,36 @@ rockchip_lvds_encoder_atomic_check(struct drm_encoder *encoder,
 	return 0;
 }
 
-static void rockchip_lvds_encoder_enable(struct drm_encoder *encoder)
+static void rk3288_lvds_encoder_enable(struct drm_encoder *encoder)
 {
 	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
 	struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
 	int ret;
 
 	drm_panel_prepare(lvds->panel);
-	ret = rockchip_lvds_poweron(lvds);
+	ret = rk3288_lvds_poweron(lvds);
 	if (ret < 0) {
 		DRM_DEV_ERROR(lvds->dev, "failed to power on lvds: %d\n", ret);
 		drm_panel_unprepare(lvds->panel);
 	}
-	rockchip_lvds_grf_config(encoder, mode);
-	rockchip_lvds_set_vop_source(lvds, encoder);
+	rk3288_lvds_grf_config(encoder, mode);
+	rk3288_lvds_set_vop_source(lvds, encoder);
 	drm_panel_enable(lvds->panel);
 }
 
-static void rockchip_lvds_encoder_disable(struct drm_encoder *encoder)
+static void rk3288_lvds_encoder_disable(struct drm_encoder *encoder)
 {
 	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
 
 	drm_panel_disable(lvds->panel);
-	rockchip_lvds_poweroff(lvds);
+	rk3288_lvds_poweroff(lvds);
 	drm_panel_unprepare(lvds->panel);
 }
 
 static const
-struct drm_encoder_helper_funcs rockchip_lvds_encoder_helper_funcs = {
-	.enable = rockchip_lvds_encoder_enable,
-	.disable = rockchip_lvds_encoder_disable,
+struct drm_encoder_helper_funcs rk3288_lvds_encoder_helper_funcs = {
+	.enable = rk3288_lvds_encoder_enable,
+	.disable = rk3288_lvds_encoder_disable,
 	.atomic_check = rockchip_lvds_encoder_atomic_check,
 };
 
@@ -377,7 +385,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		/* default set it as output rgb */
 		lvds->output = DISPLAY_OUTPUT_RGB;
 	else
-		lvds->output = lvds_name_to_output(name);
+		lvds->output = rockchip_lvds_name_to_output(name);
 
 	if (lvds->output < 0) {
 		DRM_DEV_ERROR(dev, "invalid output type [%s]\n", name);
@@ -389,7 +397,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		/* default set it as format vesa 18 */
 		lvds->format = LVDS_VESA_18;
 	else
-		lvds->format = lvds_name_to_format(name);
+		lvds->format = rockchip_lvds_name_to_format(name);
 
 	if (lvds->format < 0) {
 		DRM_DEV_ERROR(dev, "invalid data-mapping format [%s]\n", name);
@@ -409,7 +417,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		goto err_put_remote;
 	}
 
-	drm_encoder_helper_add(encoder, &rockchip_lvds_encoder_helper_funcs);
+	drm_encoder_helper_add(encoder, &rk3288_lvds_encoder_helper_funcs);
 
 	if (lvds->panel) {
 		connector = &lvds->connector;
@@ -471,7 +479,7 @@ static void rockchip_lvds_unbind(struct device *dev, struct device *master,
 {
 	struct rockchip_lvds *lvds = dev_get_drvdata(dev);
 
-	rockchip_lvds_encoder_disable(&lvds->encoder);
+	rk3288_lvds_encoder_disable(&lvds->encoder);
 	if (lvds->panel)
 		drm_panel_detach(lvds->panel);
 	pm_runtime_disable(dev);
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
