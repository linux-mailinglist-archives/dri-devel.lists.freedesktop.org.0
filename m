Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E09D552D1C2
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 13:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF07211A514;
	Thu, 19 May 2022 11:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9182B11A51F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 11:48:03 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D916680F7B;
 Thu, 19 May 2022 13:48:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652960882;
 bh=HXYJfqjuF52v1rNbbDwlXchE0DtWwDPijNPgs74D5CU=;
 h=From:To:Cc:Subject:Date:From;
 b=En5LTPtJdxjyMxNQnro4Hklrm6XfWBz0zwwAvSZjE215SW1SDIEFF8S2ruwLNmr7n
 M0DXTL7KVyxaS4D7VVA8RQsQEuSw2fPqmNoGWw2N+V7nWzUU6vcxK88+kdaeE/awkW
 yAbVg5TO7wJqipZKG869QtrJkzkZfUlsew2XdPSxJqrNF8reecM8aX7K+HgF9uuhIa
 b62l0wHsC1yiOZGxyZjpgD/0QXZjecErJaTv4+iwmtK5HVSyGw3l4/nCip7irs2w7I
 mFOEjDaszfkn1FVxlWbaTyytsdhqLj0V0fX/yzaaa2p+5F/X9Lxx1F9JkNzDoR/8Nv
 qB7/2oFkJLgrA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/bridge: tc358767: Make sure Refclk clock are enabled
Date: Thu, 19 May 2022 13:47:51 +0200
Message-Id: <20220519114751.69852-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
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
V2: Use devm_add_action_or_reset() to add clock disable hook instead
    of wall of failpath
---
 drivers/gpu/drm/bridge/tc358767.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 45ea829d56601..b2ef01303be23 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -2033,6 +2033,13 @@ static int tc_probe_bridge_endpoint(struct tc_data *tc)
 	return -EINVAL;
 }
 
+static void tc_clk_disable(void *data)
+{
+	struct clk *refclk = data;
+
+	clk_disable_unprepare(refclk);
+}
+
 static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct device *dev = &client->dev;
@@ -2049,6 +2056,22 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
+	tc->refclk = devm_clk_get(dev, "ref");
+	if (IS_ERR(tc->refclk)) {
+		ret = PTR_ERR(tc->refclk);
+		dev_err(dev, "Failed to get refclk: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, tc_clk_disable, tc->refclk);
+	if (ret)
+		return ret;
+
+	clk_prepare_enable(tc->refclk);
+
+	/* tRSTW = 100 cycles , at 13 MHz that is ~7.69 us */
+	usleep_range(10, 15);
+
 	/* Shut down GPIO is optional */
 	tc->sd_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(tc->sd_gpio))
@@ -2069,13 +2092,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
-- 
2.35.1

