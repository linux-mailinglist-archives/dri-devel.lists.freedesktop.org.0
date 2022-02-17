Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F154B9B1B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C367910EB00;
	Thu, 17 Feb 2022 08:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398910EAE9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 08:30:12 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAs-0002Dz-C1; Thu, 17 Feb 2022 09:30:02 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nKcAp-00ClSc-ML; Thu, 17 Feb 2022 09:29:59 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 01/23] drm/rockchip: Embed drm_encoder into rockchip_decoder
Date: Thu, 17 Feb 2022 09:29:32 +0100
Message-Id: <20220217082954.2967889-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217082954.2967889-1-s.hauer@pengutronix.de>
References: <20220217082954.2967889-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Peter Geis <pgwipeout@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP2 driver needs rockchip specific information for a drm_encoder.

This patch creates a struct rockchip_encoder with a struct drm_encoder
embedded in it. This is used throughout the rockchip driver instead of
struct drm_encoder directly.

The information the VOP2 drivers needs is the of_graph endpoint node
of the encoder. To ease bisectability this is added here.

While at it convert the different encoder-to-driverdata macros to
static inline functions in order to gain type safety and readability.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Notes:
    Changes since v5:
    - new patch

 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 32 +++++++++++------
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 18 ++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 17 ++++++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 11 ++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 32 +++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 34 ++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   | 11 ++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.c      | 26 ++++++++------
 9 files changed, 123 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8abb5ac26807e..bb33c6c217f77 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -40,8 +40,6 @@
 
 #define PSR_WAIT_LINE_FLAG_TIMEOUT_MS	100
 
-#define to_dp(nm)	container_of(nm, struct rockchip_dp_device, nm)
-
 /**
  * struct rockchip_dp_chip_data - splite the grf setting of kind of chips
  * @lcdsel_grf_reg: grf register offset of lcdc select
@@ -59,7 +57,7 @@ struct rockchip_dp_chip_data {
 struct rockchip_dp_device {
 	struct drm_device        *drm_dev;
 	struct device            *dev;
-	struct drm_encoder       encoder;
+	struct rockchip_encoder  encoder;
 	struct drm_display_mode  mode;
 
 	struct clk               *pclk;
@@ -73,6 +71,18 @@ struct rockchip_dp_device {
 	struct analogix_dp_plat_data plat_data;
 };
 
+static struct rockchip_dp_device *encoder_to_dp(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct rockchip_dp_device, encoder);
+}
+
+static struct rockchip_dp_device *pdata_encoder_to_dp(struct analogix_dp_plat_data *plat_data)
+{
+	return container_of(plat_data, struct rockchip_dp_device, plat_data);
+}
+
 static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 {
 	reset_control_assert(dp->rst);
@@ -84,7 +94,7 @@ static int rockchip_dp_pre_init(struct rockchip_dp_device *dp)
 
 static int rockchip_dp_poweron_start(struct analogix_dp_plat_data *plat_data)
 {
-	struct rockchip_dp_device *dp = to_dp(plat_data);
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
 	int ret;
 
 	ret = clk_prepare_enable(dp->pclk);
@@ -105,7 +115,7 @@ static int rockchip_dp_poweron_start(struct analogix_dp_plat_data *plat_data)
 
 static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 {
-	struct rockchip_dp_device *dp = to_dp(plat_data);
+	struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
 
 	clk_disable_unprepare(dp->pclk);
 
@@ -166,7 +176,7 @@ struct drm_crtc *rockchip_dp_drm_get_new_crtc(struct drm_encoder *encoder,
 static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 					   struct drm_atomic_state *state)
 {
-	struct rockchip_dp_device *dp = to_dp(encoder);
+	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int ret;
@@ -208,7 +218,7 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 static void rockchip_dp_drm_encoder_disable(struct drm_encoder *encoder,
 					    struct drm_atomic_state *state)
 {
-	struct rockchip_dp_device *dp = to_dp(encoder);
+	struct rockchip_dp_device *dp = encoder_to_dp(encoder);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state = NULL;
 	int ret;
@@ -297,7 +307,7 @@ static int rockchip_dp_of_probe(struct rockchip_dp_device *dp)
 
 static int rockchip_dp_drm_create_encoder(struct rockchip_dp_device *dp)
 {
-	struct drm_encoder *encoder = &dp->encoder;
+	struct drm_encoder *encoder = &dp->encoder.encoder;
 	struct drm_device *drm_dev = dp->drm_dev;
 	struct device *dev = dp->dev;
 	int ret;
@@ -333,7 +343,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	dp->plat_data.encoder = &dp->encoder;
+	dp->plat_data.encoder = &dp->encoder.encoder;
 
 	ret = analogix_dp_bind(dp->adp, drm_dev);
 	if (ret)
@@ -341,7 +351,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 
 	return 0;
 err_cleanup_encoder:
-	dp->encoder.funcs->destroy(&dp->encoder);
+	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
 	return ret;
 }
 
@@ -351,7 +361,7 @@ static void rockchip_dp_unbind(struct device *dev, struct device *master,
 	struct rockchip_dp_device *dp = dev_get_drvdata(dev);
 
 	analogix_dp_unbind(dp->adp);
-	dp->encoder.funcs->destroy(&dp->encoder);
+	dp->encoder.encoder.funcs->destroy(&dp->encoder.encoder);
 }
 
 static const struct component_ops rockchip_dp_component_ops = {
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 16497c31d9f91..6ce1c1cdd9d68 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -26,11 +26,17 @@
 #include "cdn-dp-reg.h"
 #include "rockchip_drm_vop.h"
 
-#define connector_to_dp(c) \
-		container_of(c, struct cdn_dp_device, connector)
+static inline struct cdn_dp_device *connector_to_dp(struct drm_connector *connector)
+{
+	return container_of(connector, struct cdn_dp_device, connector);
+}
 
-#define encoder_to_dp(c) \
-		container_of(c, struct cdn_dp_device, encoder)
+static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct cdn_dp_device, encoder);
+}
 
 #define GRF_SOC_CON9		0x6224
 #define DP_SEL_VOP_LIT		BIT(12)
@@ -1022,7 +1028,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 
 	INIT_WORK(&dp->event_work, cdn_dp_pd_event_work);
 
-	encoder = &dp->encoder;
+	encoder = &dp->encoder.encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
@@ -1087,7 +1093,7 @@ static int cdn_dp_bind(struct device *dev, struct device *master, void *data)
 static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
-	struct drm_encoder *encoder = &dp->encoder;
+	struct drm_encoder *encoder = &dp->encoder.encoder;
 	struct drm_connector *connector = &dp->connector;
 
 	cancel_work_sync(&dp->event_work);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 81ac9b658a70a..29539170d3b1b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -65,7 +65,7 @@ struct cdn_dp_device {
 	struct device *dev;
 	struct drm_device *drm_dev;
 	struct drm_connector connector;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4ed7a68681978..110e83aad9bb4 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -181,8 +181,6 @@
 
 #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
 
-#define to_dsi(nm)	container_of(nm, struct dw_mipi_dsi_rockchip, nm)
-
 enum {
 	DW_DSI_USAGE_IDLE,
 	DW_DSI_USAGE_DSI,
@@ -236,7 +234,7 @@ struct rockchip_dw_dsi_chip_data {
 
 struct dw_mipi_dsi_rockchip {
 	struct device *dev;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	void __iomem *base;
 
 	struct regmap *grf_regmap;
@@ -271,6 +269,13 @@ struct dw_mipi_dsi_rockchip {
 	bool dsi_bound;
 };
 
+static struct dw_mipi_dsi_rockchip *to_dsi(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct dw_mipi_dsi_rockchip, encoder);
+}
+
 struct dphy_pll_parameter_map {
 	unsigned int max_mbps;
 	u8 hsfreqrange;
@@ -770,7 +775,7 @@ static void dw_mipi_dsi_encoder_enable(struct drm_encoder *encoder)
 	int ret, mux;
 
 	mux = drm_of_encoder_active_endpoint_id(dsi->dev->of_node,
-						&dsi->encoder);
+						&dsi->encoder.encoder);
 	if (mux < 0)
 		return;
 
@@ -801,7 +806,7 @@ dw_mipi_dsi_encoder_helper_funcs = {
 static int rockchip_dsi_drm_create_encoder(struct dw_mipi_dsi_rockchip *dsi,
 					   struct drm_device *drm_dev)
 {
-	struct drm_encoder *encoder = &dsi->encoder;
+	struct drm_encoder *encoder = &dsi->encoder.encoder;
 	int ret;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
@@ -959,7 +964,7 @@ static int dw_mipi_dsi_rockchip_bind(struct device *dev,
 		goto out_pll_clk;
 	}
 
-	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder);
+	ret = dw_mipi_dsi_bind(dsi->dmd, &dsi->encoder.encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "Failed to bind: %d\n", ret);
 		goto out_pll_clk;
diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 8677c82716784..06c9ddef6f362 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -67,7 +67,7 @@ struct rockchip_hdmi_chip_data {
 struct rockchip_hdmi {
 	struct device *dev;
 	struct regmap *regmap;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
 	struct clk *vpll_clk;
 	struct clk *grf_clk;
@@ -75,7 +75,12 @@ struct rockchip_hdmi {
 	struct phy *phy;
 };
 
-#define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
+static struct rockchip_hdmi *to_rockchip_hdmi(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct rockchip_hdmi, encoder);
+}
 
 static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 	{
@@ -511,7 +516,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	hdmi->dev = &pdev->dev;
 	hdmi->chip_data = plat_data->phy_data;
 	plat_data->phy_data = hdmi;
-	encoder = &hdmi->encoder;
+	encoder = &hdmi->encoder.encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 	/*
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 046e8ec2a71c5..0a4f72021d6af 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -26,8 +26,6 @@
 
 #include "inno_hdmi.h"
 
-#define to_inno_hdmi(x)	container_of(x, struct inno_hdmi, x)
-
 struct hdmi_data_info {
 	int vic;
 	bool sink_is_hdmi;
@@ -56,7 +54,7 @@ struct inno_hdmi {
 	void __iomem *regs;
 
 	struct drm_connector	connector;
-	struct drm_encoder	encoder;
+	struct rockchip_encoder	encoder;
 
 	struct inno_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
@@ -67,6 +65,18 @@ struct inno_hdmi {
 	struct drm_display_mode previous_mode;
 };
 
+static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct inno_hdmi, encoder);
+}
+
+static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
+{
+	return container_of(connector, struct inno_hdmi, connector);
+}
+
 enum {
 	CSC_ITU601_16_235_TO_RGB_0_255_8BIT,
 	CSC_ITU601_0_255_TO_RGB_0_255_8BIT,
@@ -483,7 +493,7 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 				       struct drm_display_mode *mode,
 				       struct drm_display_mode *adj_mode)
 {
-	struct inno_hdmi *hdmi = to_inno_hdmi(encoder);
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_setup(hdmi, adj_mode);
 
@@ -493,14 +503,14 @@ static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 
 static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
-	struct inno_hdmi *hdmi = to_inno_hdmi(encoder);
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }
 
 static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct inno_hdmi *hdmi = to_inno_hdmi(encoder);
+	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
 
 	inno_hdmi_set_pwr_mode(hdmi, LOWER_PWR);
 }
@@ -536,7 +546,7 @@ static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
 static enum drm_connector_status
 inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct inno_hdmi *hdmi = to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
 	return (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
 		connector_status_connected : connector_status_disconnected;
@@ -544,7 +554,7 @@ inno_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct inno_hdmi *hdmi = to_inno_hdmi(connector);
+	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	struct edid *edid;
 	int ret = 0;
 
@@ -599,7 +609,7 @@ static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
 
 static int inno_hdmi_register(struct drm_device *drm, struct inno_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = &hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.encoder;
 	struct device *dev = hdmi->dev;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
@@ -879,7 +889,7 @@ static int inno_hdmi_bind(struct device *dev, struct device *master,
 	return 0;
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.funcs->destroy(&hdmi->encoder);
+	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 err_put_adapter:
 	i2c_put_adapter(hdmi->ddc);
 err_disable_clk:
@@ -893,7 +903,7 @@ static void inno_hdmi_unbind(struct device *dev, struct device *master,
 	struct inno_hdmi *hdmi = dev_get_drvdata(dev);
 
 	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.funcs->destroy(&hdmi->encoder);
+	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 
 	i2c_put_adapter(hdmi->ddc);
 	clk_disable_unprepare(hdmi->pclk);
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1c546c3a89984..319240c33dcc0 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -47,7 +47,7 @@ struct rk3066_hdmi {
 	void __iomem *regs;
 
 	struct drm_connector connector;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 
 	struct rk3066_hdmi_i2c *i2c;
 	struct i2c_adapter *ddc;
@@ -58,7 +58,17 @@ struct rk3066_hdmi {
 	struct drm_display_mode previous_mode;
 };
 
-#define to_rk3066_hdmi(x) container_of(x, struct rk3066_hdmi, x)
+static struct rk3066_hdmi *encoder_to_rk3066_hdmi(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct rk3066_hdmi, encoder);
+}
+
+static struct rk3066_hdmi *connector_to_rk3066_hdmi(struct drm_connector *connector)
+{
+	return container_of(connector, struct rk3066_hdmi, connector);
+}
 
 static inline u8 hdmi_readb(struct rk3066_hdmi *hdmi, u16 offset)
 {
@@ -380,7 +390,7 @@ rk3066_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 			     struct drm_display_mode *mode,
 			     struct drm_display_mode *adj_mode)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
 
 	/* Store the display mode for plugin/DPMS poweron events. */
 	memcpy(&hdmi->previous_mode, adj_mode, sizeof(hdmi->previous_mode));
@@ -388,7 +398,7 @@ rk3066_hdmi_encoder_mode_set(struct drm_encoder *encoder,
 
 static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
 	int mux, val;
 
 	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
@@ -407,7 +417,7 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder)
 
 static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(encoder);
+	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
 
 	DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder disable\n");
 
@@ -455,7 +465,7 @@ struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
 static enum drm_connector_status
 rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
 
 	return (hdmi_readb(hdmi, HDMI_HPG_MENS_STA) & HDMI_HPG_IN_STATUS_HIGH) ?
 		connector_status_connected : connector_status_disconnected;
@@ -463,7 +473,7 @@ rk3066_hdmi_connector_detect(struct drm_connector *connector, bool force)
 
 static int rk3066_hdmi_connector_get_modes(struct drm_connector *connector)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
 	struct edid *edid;
 	int ret = 0;
 
@@ -496,9 +506,9 @@ rk3066_hdmi_connector_mode_valid(struct drm_connector *connector,
 static struct drm_encoder *
 rk3066_hdmi_connector_best_encoder(struct drm_connector *connector)
 {
-	struct rk3066_hdmi *hdmi = to_rk3066_hdmi(connector);
+	struct rk3066_hdmi *hdmi = connector_to_rk3066_hdmi(connector);
 
-	return &hdmi->encoder;
+	return &hdmi->encoder.encoder;
 }
 
 static int
@@ -538,7 +548,7 @@ struct drm_connector_helper_funcs rk3066_hdmi_connector_helper_funcs = {
 static int
 rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 {
-	struct drm_encoder *encoder = &hdmi->encoder;
+	struct drm_encoder *encoder = &hdmi->encoder.encoder;
 	struct device *dev = hdmi->dev;
 
 	encoder->possible_crtcs =
@@ -816,7 +826,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 
 err_cleanup_hdmi:
 	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.funcs->destroy(&hdmi->encoder);
+	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 err_disable_i2c:
 	i2c_put_adapter(hdmi->ddc);
 err_disable_hclk:
@@ -831,7 +841,7 @@ static void rk3066_hdmi_unbind(struct device *dev, struct device *master,
 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
 
 	hdmi->connector.funcs->destroy(&hdmi->connector);
-	hdmi->encoder.funcs->destroy(&hdmi->encoder);
+	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
 
 	i2c_put_adapter(hdmi->ddc);
 	clk_disable_unprepare(hdmi->hclk);
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 143a48330f849..d3e42410ae5da 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -63,4 +63,15 @@ extern struct platform_driver rockchip_dp_driver;
 extern struct platform_driver rockchip_lvds_driver;
 extern struct platform_driver vop_platform_driver;
 extern struct platform_driver rk3066_hdmi_driver;
+
+struct rockchip_encoder {
+	struct device_node *port;
+	struct drm_encoder encoder;
+};
+
+static inline struct rockchip_encoder *to_rockchip_encoder(struct drm_encoder *encoder)
+{
+	return container_of(encoder, struct rockchip_encoder, encoder);
+}
+
 #endif /* _ROCKCHIP_DRM_DRV_H_ */
diff --git a/drivers/gpu/drm/rockchip/rockchip_lvds.c b/drivers/gpu/drm/rockchip/rockchip_lvds.c
index be74c87a8be4d..4ced073c6b06c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_lvds.c
+++ b/drivers/gpu/drm/rockchip/rockchip_lvds.c
@@ -36,12 +36,6 @@
 
 struct rockchip_lvds;
 
-#define connector_to_lvds(c) \
-		container_of(c, struct rockchip_lvds, connector)
-
-#define encoder_to_lvds(c) \
-		container_of(c, struct rockchip_lvds, encoder)
-
 /**
  * struct rockchip_lvds_soc_data - rockchip lvds Soc private data
  * @probe: LVDS platform probe function
@@ -65,10 +59,22 @@ struct rockchip_lvds {
 	struct drm_panel *panel;
 	struct drm_bridge *bridge;
 	struct drm_connector connector;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	struct dev_pin_info *pins;
 };
 
+static inline struct rockchip_lvds *connector_to_lvds(struct drm_connector *connector)
+{
+	return container_of(connector, struct rockchip_lvds, connector);
+}
+
+static inline struct rockchip_lvds *encoder_to_lvds(struct drm_encoder *encoder)
+{
+	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
+
+	return container_of(rkencoder, struct rockchip_lvds, encoder);
+}
+
 static inline void rk3288_writel(struct rockchip_lvds *lvds, u32 offset,
 				 u32 val)
 {
@@ -599,7 +605,7 @@ static int rockchip_lvds_bind(struct device *dev, struct device *master,
 		goto err_put_remote;
 	}
 
-	encoder = &lvds->encoder;
+	encoder = &lvds->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm_dev,
 							     dev->of_node);
 
@@ -674,10 +680,10 @@ static void rockchip_lvds_unbind(struct device *dev, struct device *master,
 	const struct drm_encoder_helper_funcs *encoder_funcs;
 
 	encoder_funcs = lvds->soc_data->helper_funcs;
-	encoder_funcs->disable(&lvds->encoder);
+	encoder_funcs->disable(&lvds->encoder.encoder);
 	pm_runtime_disable(dev);
 	drm_connector_cleanup(&lvds->connector);
-	drm_encoder_cleanup(&lvds->encoder);
+	drm_encoder_cleanup(&lvds->encoder.encoder);
 }
 
 static const struct component_ops rockchip_lvds_component_ops = {
-- 
2.30.2

