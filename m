Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 932385383D6
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 17:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D6B10EE1A;
	Mon, 30 May 2022 15:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0034910EE02
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 15:06:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy4-0005Kt-Bh; Mon, 30 May 2022 17:06:04 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy4-005TI8-HS; Mon, 30 May 2022 17:06:03 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <mfe@pengutronix.de>)
 id 1nvgy1-005BeB-FQ; Mon, 30 May 2022 17:06:01 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: robert.foss@linaro.org, laurent.pinchart@ideasonboard.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org, maxime@cerno.tech
Subject: [PATCH 6/6] drm/bridge: ti-sn65dsi83: add support for a external
 reset controller
Date: Mon, 30 May 2022 17:05:49 +0200
Message-Id: <20220530150548.1236307-7-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220530150548.1236307-1-m.felsch@pengutronix.de>
References: <20220530150548.1236307-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
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
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge chip has an enable gpio which of course can enable/disable
the bridge. Most the time this gpio is connected directly to the host
but sometimes it is connected to a reset controller chip and the host
controlls the reset controller chip instead. This commit adds the
support to handle that.

Therefore we need either the reset controller or a gpio to be present
and valid. The behaviour is changed in that way that a gpio or a reset
controller have to be successfully requested else the driver probe
fails, like the current behaviour.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 3c1dc16985b5..7b232a4f8bcb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -35,6 +35,7 @@
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -146,6 +147,7 @@ struct sn65dsi83 {
 	struct drm_bridge		*panel_bridge;
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
+	struct reset_control		*reset;
 	int				dsi_lanes;
 	bool				lvds_dual_link;
 	bool				lvds_dual_link_even_odd_swap;
@@ -350,6 +352,7 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 
 	/* Deassert reset */
 	gpiod_set_value(ctx->enable_gpio, 1);
+	reset_control_deassert(ctx->reset);
 	usleep_range(1000, 1100);
 
 	/* Get the LVDS format from the bridge state. */
@@ -511,6 +514,7 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 
 	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	gpiod_set_value(ctx->enable_gpio, 0);
+	reset_control_assert(ctx->reset);
 	usleep_range(10000, 11000);
 
 	ret = regulator_disable(ctx->vcc);
@@ -760,6 +764,13 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		return dev_err_probe(ctx->dev, PTR_ERR(ctx->enable_gpio),
 				     "Failed to get GPIO\n");
 
+	/* Or use a external reset chip to do so */
+	ctx->reset = devm_reset_control_get_optional(ctx->dev, NULL);
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(ctx->dev, PTR_ERR(ctx->reset),
+				     "Failed to get reset\n");
+	reset_control_assert(ctx->reset);
+
 	usleep_range(10000, 11000);
 
 	ret = sn65dsi83_parse_dt(ctx, model);
-- 
2.30.2

