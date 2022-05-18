Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11152C7A0
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 01:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2CC210EC7F;
	Wed, 18 May 2022 23:36:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913FE10EB28
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 23:36:26 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8B29083C01;
 Thu, 19 May 2022 01:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652916985;
 bh=AX59G+EPYeE8a2vIvPCXCxbnuyZJA8H59V6RmalLsJw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iu3hHOHVPey8kvxGFIcTwXdmuEaQGuv/PlfMcRgbk5sWh0SKThRRxnSilIIixL1wu
 PBrwkv8M+qoXtJZIE76xrI8QDt3WPGtlfF+QCtpZlO4UBiWTyNGueMs2avXCOo0ENa
 HOXdjvwXTpAD8Swu0z53eQD+1uBPyE4LuX8cMvBJwh/DMw/D2pxI5Zn9Mv8wkHYaMV
 jxAZtQsGAm7GHQSjurdba7llGZbcZkWKEGPCXknTnstyeJTapOqiykAt/wJ5trcbWW
 iWa43PDrSrgGHJvGHUI8k/0z6/B/SCrleZcZ6UaWCaH4ko1X/8P86Du4LlG3XCbXrD
 0VvPq3KaW7lVg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/bridge: tc358767: Make sure Refclk clock are enabled
Date: Thu, 19 May 2022 01:36:02 +0200
Message-Id: <20220518233602.248185-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518233602.248185-1-marex@denx.de>
References: <20220518233602.248185-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 robert.foss@linaro.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Refclk may be supplied by SoC clock output instead of crystal
oscillator, make sure the clock are enabled before any other action
is performed with the bridge chip, otherwise it may either fail to
operate at all, or miss reset GPIO toggle.

Fixes: 7caff0fc4296e ("drm/bridge: tc358767: Add DPI to eDP bridge driver")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 51 ++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index a8bb6de9e600a..4b15acbc73c4e 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2055,10 +2055,24 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
+	tc->refclk = devm_clk_get(dev, "ref");
+	if (IS_ERR(tc->refclk)) {
+		ret = PTR_ERR(tc->refclk);
+		dev_err(dev, "Failed to get refclk: %d\n", ret);
+		return ret;
+	}
+
+	clk_prepare_enable(tc->refclk);
+
+	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
+	usleep_range(10, 15);
+
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
-	if (IS_ERR(tc->sd_gpio))
-		return PTR_ERR(tc->sd_gpio);
+	if (IS_ERR(tc->sd_gpio)) {
+		ret = PTR_ERR(tc->sd_gpio);
+		goto err_clk;
+	}
 
 	if (tc->sd_gpio) {
 		gpiod_set_value_cansleep(tc->sd_gpio, 0);
@@ -2067,26 +2081,21 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	/* Reset GPIO is optional */
 	tc->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(tc->reset_gpio))
-		return PTR_ERR(tc->reset_gpio);
+	if (IS_ERR(tc->reset_gpio)) {
+		ret = PTR_ERR(tc->reset_gpio);
+		goto err_clk;
+	}
 
 	if (tc->reset_gpio) {
 		gpiod_set_value_cansleep(tc->reset_gpio, 1);
 		usleep_range(5000, 10000);
 	}
 
-	tc->refclk = devm_clk_get(dev, "ref");
-	if (IS_ERR(tc->refclk)) {
-		ret = PTR_ERR(tc->refclk);
-		dev_err(dev, "Failed to get refclk: %d\n", ret);
-		return ret;
-	}
-
 	tc->regmap = devm_regmap_init_i2c(client, &tc_regmap_config);
 	if (IS_ERR(tc->regmap)) {
 		ret = PTR_ERR(tc->regmap);
 		dev_err(dev, "Failed to initialize regmap: %d\n", ret);
-		return ret;
+		goto err_clk;
 	}
 
 	ret = of_property_read_u32(dev->of_node, "toshiba,hpd-pin",
@@ -2096,7 +2105,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	} else {
 		if (tc->hpd_pin < 0 || tc->hpd_pin > 1) {
 			dev_err(dev, "failed to parse HPD number\n");
-			return ret;
+			goto err_clk;
 		}
 	}
 
@@ -2110,7 +2119,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 						"tc358767-irq", tc);
 		if (ret) {
 			dev_err(dev, "failed to register dp interrupt\n");
-			return ret;
+			goto err_clk;
 		}
 
 		tc->have_irq = true;
@@ -2119,12 +2128,13 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
 	if (ret) {
 		dev_err(tc->dev, "can not read device ID: %d\n", ret);
-		return ret;
+		goto err_clk;
 	}
 
 	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
 		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_clk;
 	}
 
 	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
@@ -2164,7 +2174,7 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (tc->bridge.type != DRM_MODE_CONNECTOR_DPI) { /* (e)DP output */
 		ret = tc_aux_link_setup(tc);
 		if (ret)
-			return ret;
+			goto err_clk;
 	}
 
 	tc->bridge.of_node = dev->of_node;
@@ -2176,11 +2186,15 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		ret = tc_mipi_dsi_host_attach(tc);
 		if (ret) {
 			drm_bridge_remove(&tc->bridge);
-			return ret;
+			goto err_clk;
 		}
 	}
 
 	return 0;
+
+err_clk:
+	clk_disable_unprepare(tc->refclk);
+	return ret;
 }
 
 static int tc_remove(struct i2c_client *client)
@@ -2188,6 +2202,7 @@ static int tc_remove(struct i2c_client *client)
 	struct tc_data *tc = i2c_get_clientdata(client);
 
 	drm_bridge_remove(&tc->bridge);
+	clk_disable_unprepare(tc->refclk);
 
 	return 0;
 }
-- 
2.35.1

