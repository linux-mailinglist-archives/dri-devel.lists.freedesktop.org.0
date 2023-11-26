Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD187F94F5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 19:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE8D10E13F;
	Sun, 26 Nov 2023 18:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3223E10E13F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 18:57:36 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 3ED59604DD;
 Sun, 26 Nov 2023 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701025055;
 bh=ZvVqIuD0d9Tn28us7HyavAfK8kAIYY6+EYFfE0Fl3Ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lR3EO1mFh+2yQruWymfFJwV3egJi4K9MHs20Yp6V23a9S9L2k0O971br6RpTm6yVp
 X4Brf3rnNhE+LReEOd/5jmQsvFVqcKO+EwpAZh2PFS+NtwgIHfG7605LttwCSrrSEt
 nKoJCshnm0jUiyJMAnw6Yf8Rpt+6lRc1/TcAjTlNBKMmde9EpJTWq/SUZH3g5i0K/W
 ydrFZd47SRRuw3IzxgBPHbqwyxurFg8CZok2Q+52noFzm237bskxx2vMyVjc+AAQ8B
 BMvnFJtuCyQ3HqxRUaYav/SZMTXK5LchfbBTtkmKyjscBGdX/TahmbjAZS7SXZM4YW
 6dvLsPakO23gQ==
Date: Sun, 26 Nov 2023 20:56:52 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>
Subject: [PATCH 5/6] drm/bridge: tc358775: Add support for tc358765
Message-ID: <20231126182135.GA5166@atomide.com>
References: <20231126163247.10131-1-tony@atomide.com>
 <20231126163247.10131-2-tony@atomide.com>
 <20231126171837.GK5169@atomide.com>
 <20231126172018.GL5169@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231126172018.GL5169@atomide.com>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like tc358775 is pin compatible with earlier tc358765 according to
the tc358774xbg_datasheet_en_20190118.pdf documentation. On tc358775,
there is an extra GPIO for STBY pin added, and few other improvments.

The tc358765 has a register bit for video event mode that we must set for
the LCD output to work. On tc358775, this bit no longer exists.

Looks like the registers seem to match otherwise based on a quick glance
comparing the defines to the earlier Android kernel tc358765 driver.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 55 +++++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -15,6 +15,7 @@
 #include <linux/kernel.h>
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
@@ -107,6 +108,7 @@
 #define RDPKTLN         0x0404  /* Command Read Packet Length */
 
 #define VPCTRL          0x0450  /* Video Path Control */
+#define EVTMODE		BIT(5)  /* Video event mode enable, tc35876x only */
 #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
 #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
 #define VTIM1           0x045C  /* Vertical Timing Control 1 */
@@ -254,6 +256,11 @@ enum tc358775_ports {
 	TC358775_LVDS_OUT1,
 };
 
+enum tc3587x5_type {
+	TC358765,
+	TC358775,
+};
+
 struct tc_data {
 	struct i2c_client	*i2c;
 	struct device		*dev;
@@ -271,6 +278,8 @@ struct tc_data {
 	struct gpio_desc	*stby_gpio;
 	u8			lvds_link; /* single-link or dual-link */
 	u8			bpc;
+
+	enum tc3587x5_type	type;
 };
 
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
@@ -294,8 +303,10 @@ static void tc_bridge_pre_enable(struct drm_bridge *bridge)
 		dev_err(dev, "regulator vdd enable failed, %d\n", ret);
 	usleep_range(10000, 11000);
 
-	gpiod_set_value(tc->stby_gpio, 0);
-	usleep_range(10000, 11000);
+	if (!IS_ERR(tc->stby_gpio)) {
+		gpiod_set_value(tc->stby_gpio, 0);
+		usleep_range(10000, 11000);
+	}
 
 	gpiod_set_value(tc->reset_gpio, 0);
 	usleep_range(10, 20);
@@ -310,8 +321,10 @@ static void tc_bridge_post_disable(struct drm_bridge *bridge)
 	gpiod_set_value(tc->reset_gpio, 1);
 	usleep_range(10, 20);
 
-	gpiod_set_value(tc->stby_gpio, 1);
-	usleep_range(10000, 11000);
+	if (!IS_ERR(tc->stby_gpio)) {
+		gpiod_set_value(tc->stby_gpio, 1);
+		usleep_range(10000, 11000);
+	}
 
 	ret = regulator_disable(tc->vdd);
 	if (ret < 0)
@@ -424,10 +437,16 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
 	d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
 
+	/* Video event mode, this bit does not exist for tc358775 */
+	if (tc->type == TC358765)
+		val = EVTMODE;
+	else
+		val = 0;
+
 	if (tc->bpc == 8)
-		val = TC358775_VPCTRL_OPXLFMT(1);
+		val |= TC358775_VPCTRL_OPXLFMT(1);
 	else /* bpc = 6; */
-		val = TC358775_VPCTRL_MSF(1);
+		val |= TC358775_VPCTRL_MSF(1);
 
 	dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
 	clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
@@ -656,6 +675,7 @@ static int tc_probe(struct i2c_client *client)
 
 	tc->dev = dev;
 	tc->i2c = client;
+	tc->type = (enum tc3587x5_type)of_device_get_match_data(dev);
 
 	tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
 						  TC358775_LVDS_OUT0, 0);
@@ -680,11 +700,15 @@ static int tc_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
-	if (IS_ERR(tc->stby_gpio)) {
-		ret = PTR_ERR(tc->stby_gpio);
-		dev_err(dev, "cannot get stby-gpio %d\n", ret);
-		return ret;
+	if (tc->type == TC358775) {
+		tc->stby_gpio = devm_gpiod_get(dev, "stby", GPIOD_OUT_HIGH);
+		if (IS_ERR(tc->stby_gpio)) {
+			ret = PTR_ERR(tc->stby_gpio);
+			dev_err(dev, "cannot get stby-gpio %d\n", ret);
+			return ret;
+		}
+	} else {
+		tc->stby_gpio = ERR_PTR(-ENODEV);
 	}
 
 	tc->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
@@ -696,6 +720,7 @@ static int tc_probe(struct i2c_client *client)
 
 	tc->bridge.funcs = &tc_bridge_funcs;
 	tc->bridge.of_node = dev->of_node;
+	tc->bridge.pre_enable_prev_first = true;
 	drm_bridge_add(&tc->bridge);
 
 	i2c_set_clientdata(client, tc);
@@ -715,17 +740,21 @@ static void tc_remove(struct i2c_client *client)
 {
 	struct tc_data *tc = i2c_get_clientdata(client);
 
+	mipi_dsi_detach(tc->dsi);
 	drm_bridge_remove(&tc->bridge);
+	tc->bridge.funcs = NULL;
 }
 
 static const struct i2c_device_id tc358775_i2c_ids[] = {
-	{ "tc358775", 0 },
+	{ "tc358765", TC358765, },
+	{ "tc358775", TC358775, },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc358775_i2c_ids);
 
 static const struct of_device_id tc358775_of_ids[] = {
-	{ .compatible = "toshiba,tc358775", },
+	{ .compatible = "toshiba,tc358765", .data = (void *)TC358765, },
+	{ .compatible = "toshiba,tc358775", .data = (void *)TC358775, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tc358775_of_ids);
-- 
2.42.1
