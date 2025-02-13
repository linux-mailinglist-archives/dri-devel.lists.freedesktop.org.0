Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7A5A342F0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 15:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB9710EAD5;
	Thu, 13 Feb 2025 14:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G50Epbc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89310EAD5
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 14:44:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 30451A42633;
 Thu, 13 Feb 2025 14:42:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B73C4CED1;
 Thu, 13 Feb 2025 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739457840;
 bh=ea9WzSwxBcxRmUJsGjKXuEwzfaNYA7kcMOJgBOqObC4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=G50Epbc/bgGgOhgNUFeL8CRuCAGESmVzY01FzEzh0a7pIe0L19RZg3slQLmvNfgw8
 N7q8jzIxt8HZTb9OVBSzIX8zzsNt0sR/GmH8ALaxCS9eOcPRkum+3cd+YYBGFbWas+
 JbLwal5bF5CD6EtRvVOMy7r7k1GEXZgGfSnc0XQEc0YVcVuucM+LP61A9lC2tAVEN7
 0qXwvNVADLrFrweDdiplX+H33VeQFDewl6R9FalU7dqMp4GVg4XEAa7092KTHNefDd
 sJaYY4HO7JUaAyaBYQU35tMi/tjmHFv8JXK3G7omkWdqOKDrQVTbZsImISYMkg6Skl
 e1ci+uluAZIOg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Feb 2025 15:43:21 +0100
Subject: [PATCH v3 02/37] drm/bridge: Pass full state to atomic_pre_enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-bridge-connector-v3-2-e71598f49c8f@kernel.org>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17090; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ea9WzSwxBcxRmUJsGjKXuEwzfaNYA7kcMOJgBOqObC4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOnrWMXsnBhLQypMGP3PCN98yb7Cxm3zkgkZ4vH7OiNTb
 y4w11HvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABP5/ZWx4QvD66fCO4pNTrtO
 Cppl9Lmx+PuysF3zlROmHtYIEwidZH4npHvLVunVMYGtvjWztxUeYGyYzsW3RE79Tor7CmHr58I
 Rc64mpO9glI/+4uuyZcene2nxIflHjP18Loro2F/suXu04SEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

It's pretty inconvenient to access the full atomic state from
drm_bridges, so let's change the atomic_pre_enable hook prototype to
pass it directly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c |  6 ++----
 drivers/gpu/drm/bridge/chipone-icn6211.c           |  2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c           |  7 +++----
 drivers/gpu/drm/bridge/ite-it6505.c                |  2 +-
 drivers/gpu/drm/bridge/lontium-lt9611.c            |  2 +-
 drivers/gpu/drm/bridge/panel.c                     |  3 +--
 drivers/gpu/drm/bridge/parade-ps8640.c             |  2 +-
 drivers/gpu/drm/bridge/samsung-dsim.c              |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c      |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c     |  2 +-
 drivers/gpu/drm/bridge/tc358762.c                  |  3 ++-
 drivers/gpu/drm/bridge/ti-dlpc3433.c               |  2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  3 +--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c              |  2 +-
 drivers/gpu/drm/drm_bridge.c                       | 15 +++------------
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  2 +-
 drivers/gpu/drm/vc4/vc4_dsi.c                      |  3 +--
 include/drm/drm_bridge.h                           |  2 +-
 19 files changed, 25 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff0fea8f6f8852b428bee8f2c729bd..e097d97fb7d9f1523ec2162c2a7a7df104fcaa99 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1195,15 +1195,13 @@ struct drm_crtc *analogix_dp_get_new_crtc(struct analogix_dp_device *dp,
 		return NULL;
 
 	return conn_state->crtc;
 }
 
-static void
-analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+static void analogix_dp_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+						 struct drm_atomic_state *old_state)
 {
-	struct drm_atomic_state *old_state = old_bridge_state->base.state;
 	struct analogix_dp_device *dp = bridge->driver_private;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int ret;
 
diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index d47703559b0dec13fa4478d90ca29be2e899637a..7a009ab57f9ec8e944d1410373ac9e06db12a815 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -443,11 +443,11 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 
 	usleep_range(10000, 11000);
 }
 
 static void chipone_atomic_pre_enable(struct drm_bridge *bridge,
-				      struct drm_bridge_state *old_bridge_state)
+				      struct drm_atomic_state *state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
 	int ret;
 
 	if (icn->vdd1) {
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..009c7fcb3d595d7bfabde298511fde89a85dc890 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -201,13 +201,12 @@ imx8qxp_ldb_bridge_mode_set(struct drm_bridge *bridge,
 
 	if (is_split && companion)
 		companion->funcs->mode_set(companion, mode, adjusted_mode);
 }
 
-static void
-imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+static void imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+						 struct drm_atomic_state *state)
 {
 	struct ldb_channel *ldb_ch = bridge->driver_private;
 	struct ldb *ldb = ldb_ch->ldb;
 	struct imx8qxp_ldb *imx8qxp_ldb = base_to_imx8qxp_ldb(ldb);
 	struct drm_bridge *companion = imx8qxp_ldb->companion;
@@ -215,11 +214,11 @@ imx8qxp_ldb_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	clk_prepare_enable(imx8qxp_ldb->clk_pixel);
 	clk_prepare_enable(imx8qxp_ldb->clk_bypass);
 
 	if (is_split && companion)
-		companion->funcs->atomic_pre_enable(companion, old_bridge_state);
+		companion->funcs->atomic_pre_enable(companion, state);
 }
 
 static void
 imx8qxp_ldb_bridge_atomic_enable(struct drm_bridge *bridge,
 				 struct drm_bridge_state *old_bridge_state)
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 76dabca04d0d191b3bdee23c6a3e55f4b6d3bad4..647579342a0a82ce4f4f4f04ea5d0633e4d03af8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3252,11 +3252,11 @@ static void it6505_bridge_atomic_disable(struct drm_bridge *bridge,
 		it6505_video_disable(it6505);
 	}
 }
 
 static void it6505_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					    struct drm_bridge_state *old_state)
+					    struct drm_atomic_state *state)
 {
 	struct it6505 *it6505 = bridge_to_it6505(bridge);
 	struct device *dev = it6505->dev;
 
 	DRM_DEV_DEBUG_DRIVER(dev, "start");
diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e650cd83fc8d880012edb8a85c69b2f1d378f64c..5d3bbfeaf2299e2425e0079cff0805b37180351b 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -765,11 +765,11 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 
 	return MODE_OK;
 }
 
 static void lt9611_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					    struct drm_bridge_state *old_bridge_state)
+					    struct drm_atomic_state *state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	static const struct reg_sequence reg_cfg[] = {
 		{ 0x8102, 0x12 },
 		{ 0x8123, 0x40 },
diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f5faee690b7c53e8dcd0f1ee2281c..1dbe1c2139879c8c8b6ffa150bcf57fcad2af964 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -107,14 +107,13 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 	if (connector->dev)
 		drm_connector_cleanup(connector);
 }
 
 static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-				struct drm_bridge_state *old_bridge_state)
+					   struct drm_atomic_state *atomic_state)
 {
 	struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
-	struct drm_atomic_state *atomic_state = old_bridge_state->base.state;
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 
 	crtc = drm_atomic_get_new_crtc_for_encoder(atomic_state, encoder);
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index b0e38177c1ecb803e5e61b223b2bd7568c36de25..7ec674bffa81327ebeacecce091364e0f3e9a4f9 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -435,11 +435,11 @@ static const struct dev_pm_ops ps8640_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
 
 static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
-				     struct drm_bridge_state *old_bridge_state)
+				     struct drm_atomic_state *state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
 	struct device *dev = &ps_bridge->page[PAGE0_DP_CNTL]->dev;
 	int ret;
diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index f8b4fb8357659018ec0db65374ee5d05330639ae..415ce14e747dfca0c5395e18f1195733e17616da 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1455,11 +1455,11 @@ static int samsung_dsim_init(struct samsung_dsim *dsi)
 
 	return 0;
 }
 
 static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+					   struct drm_atomic_state *state)
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	if (dsi->state & DSIM_STATE_ENABLED)
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 0fb02e4e7f4e5fcf1ad0b606b1485ab05ceb53f8..9731a6b45a52b54fdf910a3cc84d8f97b0c37c91 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -1020,11 +1020,11 @@ static void dw_mipi_dsi_mode_set(struct dw_mipi_dsi *dsi,
 	if (phy_ops->power_on)
 		phy_ops->power_on(dsi->plat_data->priv_data);
 }
 
 static void dw_mipi_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-						 struct drm_bridge_state *old_bridge_state)
+						 struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
 
 	/* Power up the dsi ctl into a command mode */
 	dw_mipi_dsi_mode_set(dsi, &dsi->mode);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index d7569bf2d9c3ef1f22ac07c95d112d1c62dd67a1..194ac6e192f4c2a89048e241da7b7d0e2db75149 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -819,11 +819,11 @@ static void dw_mipi_dsi2_mode_set(struct dw_mipi_dsi2 *dsi2,
 
 	dw_mipi_dsi2_ipi_set(dsi2);
 }
 
 static void dw_mipi_dsi2_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-						  struct drm_bridge_state *old_bridge_state)
+						  struct drm_atomic_state *state)
 {
 	struct dw_mipi_dsi2 *dsi2 = bridge_to_dsi2(bridge);
 
 	/* Power up the dsi ctl into a command mode */
 	dw_mipi_dsi2_mode_set(dsi2, &dsi2->mode);
diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index f92aff3d515a3354f7e447495adb3e18514b029a..15daf6d97365e6127273079a6e3b48597398fd37 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -169,11 +169,12 @@ static void tc358762_post_disable(struct drm_bridge *bridge, struct drm_bridge_s
 	ret = regulator_disable(ctx->regulator);
 	if (ret < 0)
 		dev_err(ctx->dev, "error disabling regulators (%d)\n", ret);
 }
 
-static void tc358762_pre_enable(struct drm_bridge *bridge, struct drm_bridge_state *state)
+static void tc358762_pre_enable(struct drm_bridge *bridge,
+				struct drm_atomic_state *state)
 {
 	struct tc358762 *ctx = bridge_to_tc358762(bridge);
 	int ret;
 
 	ret = regulator_enable(ctx->regulator);
diff --git a/drivers/gpu/drm/bridge/ti-dlpc3433.c b/drivers/gpu/drm/bridge/ti-dlpc3433.c
index eaec70fa42b6213df75b9a9ee581a61c116acb3c..c513cd1902048d52088b946691db8a1aa24a5a32 100644
--- a/drivers/gpu/drm/bridge/ti-dlpc3433.c
+++ b/drivers/gpu/drm/bridge/ti-dlpc3433.c
@@ -168,11 +168,11 @@ static void dlpc_atomic_enable(struct drm_bridge *bridge,
 
 	msleep(10);
 }
 
 static void dlpc_atomic_pre_enable(struct drm_bridge *bridge,
-				   struct drm_bridge_state *old_bridge_state)
+				   struct drm_atomic_state *state)
 {
 	struct dlpc *dlpc = bridge_to_dlpc(bridge);
 	int ret;
 
 	gpiod_set_value(dlpc->enable_gpio, 1);
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index f6728c491cc5c6d90d93b733c46732f80cdebf69..049d73526b904637dc1162893fa11d002c7b77d1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -361,14 +361,13 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 
 	return dsi_div - 1;
 }
 
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
+					struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	struct drm_atomic_state *state = old_bridge_state->base.state;
 	const struct drm_bridge_state *bridge_state;
 	const struct drm_crtc_state *crtc_state;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 205bd0fde4f8b3400caa8507092308e50eb172b7..86bbfdc37d97f0ee33a7b116f89f885b527dc3d8 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1162,11 +1162,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
 }
 
 static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					   struct drm_bridge_state *old_bridge_state)
+					   struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 241a384ebce39b4a3db58c208af27960904fc662..e6bf964ddd82e4e2eea5c8e83201d08bb50a3137 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -696,23 +696,14 @@ void drm_atomic_bridge_chain_post_disable(struct drm_bridge *bridge,
 EXPORT_SYMBOL(drm_atomic_bridge_chain_post_disable);
 
 static void drm_atomic_bridge_call_pre_enable(struct drm_bridge *bridge,
 					      struct drm_atomic_state *old_state)
 {
-	if (old_state && bridge->funcs->atomic_pre_enable) {
-		struct drm_bridge_state *old_bridge_state;
-
-		old_bridge_state =
-			drm_atomic_get_old_bridge_state(old_state,
-							bridge);
-		if (WARN_ON(!old_bridge_state))
-			return;
-
-		bridge->funcs->atomic_pre_enable(bridge, old_bridge_state);
-	} else if (bridge->funcs->pre_enable) {
+	if (old_state && bridge->funcs->atomic_pre_enable)
+		bridge->funcs->atomic_pre_enable(bridge, old_state);
+	else if (bridge->funcs->pre_enable)
 		bridge->funcs->pre_enable(bridge);
-	}
 }
 
 /**
  * drm_atomic_bridge_chain_pre_enable - prepares for enabling all bridges in
  *					the encoder chain
diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 40752f2320548fbf6c7de96b18e8a636ac9c31be..aed9d03bcf012fc555277da8fe6adfbd6b839070 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -843,11 +843,11 @@ static void mtk_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	mtk_output_dsi_enable(dsi);
 }
 
 static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					     struct drm_bridge_state *old_bridge_state)
+					     struct drm_atomic_state *state)
 {
 	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
 	int ret;
 
 	ret = mtk_dsi_poweron(dsi);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb96446d4d34eeef45848df03bd716b..928909b4403a4c7ee6b919056f9cfd0c01d13cbd 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1360,11 +1360,11 @@ static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
 
 	drm_mode_copy(&hdmi->mode, adjusted_mode);
 }
 
 static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
-					      struct drm_bridge_state *old_state)
+					      struct drm_atomic_state *state)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
 
 	mtk_hdmi_hw_make_reg_writable(hdmi, true);
 	mtk_hdmi_hw_1p4_version_enable(hdmi, true);
diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 5eb293bdb363d81341b20c11b8041bdb34663a1b..eb747ea3325c1d487ac879a91d2b5436f5cd10c7 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -871,13 +871,12 @@ static bool vc4_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	return true;
 }
 
 static void vc4_dsi_bridge_pre_enable(struct drm_bridge *bridge,
-				      struct drm_bridge_state *old_state)
+				      struct drm_atomic_state *state)
 {
-	struct drm_atomic_state *state = old_state->base.state;
 	struct vc4_dsi *dsi = bridge_to_vc4_dsi(bridge);
 	const struct drm_crtc_state *crtc_state;
 	struct device *dev = &dsi->pdev->dev;
 	const struct drm_display_mode *mode;
 	struct drm_connector *connector;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 496dbbd2ad7edff7f091adfbe62de1e33ef0cf07..eef4487f45af50dccbee5144378dbb3b5972a210 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -303,11 +303,11 @@ struct drm_bridge_funcs {
 	 * there is one) when this callback is called.
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
 	void (*atomic_pre_enable)(struct drm_bridge *bridge,
-				  struct drm_bridge_state *old_bridge_state);
+				  struct drm_atomic_state *state);
 
 	/**
 	 * @atomic_enable:
 	 *
 	 * This callback should enable the bridge. It is called right after

-- 
2.48.0

