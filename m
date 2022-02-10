Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6144B1192
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 16:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8710E87C;
	Thu, 10 Feb 2022 15:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7348C10E882
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 15:22:37 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nIBHD-0000Yc-0W; Thu, 10 Feb 2022 16:22:31 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nIBH9-0002Cy-Il; Thu, 10 Feb 2022 16:22:27 +0100
Date: Thu, 10 Feb 2022 16:22:27 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 01/23] drm/encoder: Add of_graph port to struct
 drm_encoder
Message-ID: <20220210152227.GA18637@pengutronix.de>
References: <20220209095350.2104049-1-s.hauer@pengutronix.de>
 <20220209095350.2104049-2-s.hauer@pengutronix.de>
 <20220209100736.GV18637@pengutronix.de> <87fsospa36.fsf@intel.com>
 <20220210115232.GY18637@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210115232.GY18637@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:20:58 up 62 days, 6 min, 82 users,  load average: 0.17, 0.16, 0.18
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
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
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kernel@pengutronix.de,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 12:52:32PM +0100, Sascha Hauer wrote:
> On Wed, Feb 09, 2022 at 01:12:45PM +0200, Jani Nikula wrote:
> > On Wed, 09 Feb 2022, Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > David, Daniel,
> > >
> > > I'll need a word from you regarding this patch. It's needed in patch
> > > 22/23 in this series.
> > > vop2_crtc_atomic_enable() needs to control the mux which routes the
> > > display output to the different encoders. Which encoder is used is
> > > described in the of_graph port, so I need a way to identify the encoder
> > > in the device tree.
> > 
> > I think the question is how useful is this going to be in general. IMO
> > we should not be adding members that are useful in a single driver only.
> > 
> > For example i915 wraps encoders with:
> > 
> > 	struct intel_encoder {
> > 		struct drm_encoder base;
> > 
> > 		/* i915 specific stuff here*/
> > 	};
> > 
> > So that we can add stuff of our own there. Of course, it does mean a
> > bunch of overhead for the first time you need to do it. But adding
> > driver specific stuff to struct drm_encoder adds overhead for everyone.
> > 
> > All that said, *I* don't know how useful the port member would be in
> > drivers that use device tree. Maybe it's worth it.
> 
> I don't know either.
> 
> Right now the drm_encoder is directly embedded into the encoder drivers
> private data structures, like this:
> 
> struct rockchip_hdmi {
>         struct drm_encoder encoder;
> 	...
> };
> 
> I could change this to:
> 
> struct rockchip_encoder {
> 	struct device_node *port;
> 	struct drm_encoder encoder;
> }
> 
> and then
> 
> struct rockchip_hdmi {
> 	struct rockchip_encoder encoder;
> 	...
> };
> 
> That would solve the issue without touching generic DRM code if that's
> preferred.

FYI here is a patch for this solution.

Sascha

------------------------------8<--------------------------------

From 43512166d8a5ee1856e7ec9644ee5ae5fc178785 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Thu, 10 Feb 2022 15:30:22 +0100
Subject: [PATCH] drm/rockchip: Embed drm_encoder into rockchip_decoder

The VOP2 driver needs rockchip specific informations for a drm_encoder.
This patch creates a struct rockchip_encoder with a struct drm_encoder
embedded in it. This is used throughout the rockchip driver instead of
struct drm_encoder directly.
While at it convert the different encoder-to-driverdata macros to
static inline functions in order to gain type safety and readability.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 32 +++++++++++------
 drivers/gpu/drm/rockchip/cdn-dp-core.c        | 18 ++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |  2 +-
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 17 ++++++----
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 11 ++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 32 +++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        | 34 ++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |  9 +++++
 drivers/gpu/drm/rockchip/rockchip_lvds.c      | 26 ++++++++------
 9 files changed, 121 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 8abb5ac26807..bb33c6c217f7 100644
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
index 16497c31d9f9..6ce1c1cdd9d6 100644
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
index 81ac9b658a70..29539170d3b1 100644
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
index 4ed7a6868197..110e83aad9bb 100644
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
index c038674271b2..ac9a0a272210 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -72,7 +72,7 @@ struct rockchip_hdmi_chip_data {
 struct rockchip_hdmi {
 	struct device *dev;
 	struct regmap *regmap;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	const struct rockchip_hdmi_chip_data *chip_data;
 	struct clk *ref_clk;
 	struct clk *grf_clk;
@@ -83,7 +83,12 @@ struct rockchip_hdmi {
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
@@ -528,7 +533,7 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	hdmi->dev = &pdev->dev;
 	hdmi->chip_data = plat_data->phy_data;
 	plat_data->phy_data = hdmi;
-	encoder = &hdmi->encoder;
+	encoder = &hdmi->encoder.encoder;
 
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 046e8ec2a71c..0a4f72021d6a 100644
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
index 1c546c3a8998..319240c33dcc 100644
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
index 6e1f97e1e4a6..d2cb84b7b2b4 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -68,4 +68,13 @@ extern struct platform_driver vop_platform_driver;
 extern struct platform_driver rk3066_hdmi_driver;
 extern struct platform_driver vop2_platform_driver;
 
+struct rockchip_encoder {
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
index be74c87a8be4..4ced073c6b06 100644
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

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
