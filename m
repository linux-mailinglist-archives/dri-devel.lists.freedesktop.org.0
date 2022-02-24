Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA8E4C365F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:59:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822A10E3A3;
	Thu, 24 Feb 2022 19:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16F210E284
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:58:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E8CD183CD8;
 Thu, 24 Feb 2022 20:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645732733;
 bh=OdltV87LwUBf4FGczV9ZGjxgxIt6MEEd1ytniRVK2TY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=x+gLjwj8y3NzLpD5MkzV+w0UV6BGut026uucI/xKEPBuVs9FqTU8zo+R+Asm0rdgX
 y9Zf8lInbvwWnVhFdYArUgtoDISgaIimNl0ycCCE/CuHzBBeOSiGHRx1tuki/lH2Iy
 jMwd0yrRa/XRLEZ1VVZsfR4eLLznnVR2AaQ6wlxaawp697lcOquG1EYvNeDLKCgzYX
 SaFr/CJmZsGnK8kRtERNw8fOfnzJlbO/4vlxLL+fV84D61RSR/aKFfHi660yH+Sk3a
 rgRgCfbe1c5AvpZLLZTsoiLtX1FajNtWU+cRXqZ/EsSGSy7r4lkyO1esBPM5pJ0M/+
 aRVQENtPIdMdg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 06/12] drm/bridge: tc358767: Move hardware init to enable
 callback
Date: Thu, 24 Feb 2022 20:58:11 +0100
Message-Id: <20220224195817.68504-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224195817.68504-1-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating either from
attached Xtal or from DSI clock lane clock. In case the later is used,
all I2C accesses will fail until the DSI clock lane is running and
supplying clock to the chip.

Move all hardware initialization to enable callback to guarantee the
DSI clock lane is running before accessing the hardware. In case Xtal
is attached to the chip, this change has no effect. Operation without
Xtal is currently not supported. The DSI-to-(e)DP mode is currently
not supported and it might be difficult to implement without Xtal.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - Rebase on next-20220217
V3: - Adjust commit message, point out operation without Xtal and
      DSI-to-(e)DP modes are not supported yet.
---
 drivers/gpu/drm/bridge/tc358767.c | 111 +++++++++++++++++-------------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e95153d9c1499..ea0d4467878f0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1234,6 +1234,63 @@ static int tc_edp_stream_disable(struct tc_data *tc)
 	return 0;
 }
 
+static int tc_hardware_init(struct tc_data *tc)
+{
+	int ret;
+
+	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
+	if (ret) {
+		dev_err(tc->dev, "can not read device ID: %d\n", ret);
+		return ret;
+	}
+
+	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
+		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
+		return -EINVAL;
+	}
+
+	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
+
+	if (!tc->reset_gpio) {
+		/*
+		 * If the reset pin isn't present, do a software reset. It isn't
+		 * as thorough as the hardware reset, as we can't reset the I2C
+		 * communication block for obvious reasons, but it's getting the
+		 * chip into a defined state.
+		 */
+		regmap_update_bits(tc->regmap, SYSRSTENB,
+				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
+				0);
+		regmap_update_bits(tc->regmap, SYSRSTENB,
+				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
+				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
+		usleep_range(5000, 10000);
+	}
+
+	if (tc->hpd_pin >= 0) {
+		u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
+		u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
+
+		/* Set LCNT to 2ms */
+		regmap_write(tc->regmap, lcnt_reg,
+			     clk_get_rate(tc->refclk) * 2 / 1000);
+		/* We need the "alternate" mode for HPD */
+		regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
+
+		if (tc->have_irq) {
+			/* enable H & LC */
+			regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
+		}
+	}
+
+	if (tc->have_irq) {
+		/* enable SysErr */
+		regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
+	}
+
+	return 0;
+}
+
 static void
 tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
 			    struct drm_bridge_state *old_bridge_state)
@@ -1241,6 +1298,12 @@ tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
 
+	ret = tc_hardware_init(tc);
+	if (ret < 0) {
+		dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
+		return;
+	}
+
 	ret = tc_get_display_props(tc);
 	if (ret < 0) {
 		dev_err(tc->dev, "failed to read display props: %d\n", ret);
@@ -1660,9 +1723,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	if (client->irq > 0) {
-		/* enable SysErr */
-		regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
-
 		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL, tc_irq_handler,
 						IRQF_ONESHOT,
@@ -1675,51 +1735,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		tc->have_irq = true;
 	}
 
-	ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
-	if (ret) {
-		dev_err(tc->dev, "can not read device ID: %d\n", ret);
-		return ret;
-	}
-
-	if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
-		dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
-		return -EINVAL;
-	}
-
-	tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
-
-	if (!tc->reset_gpio) {
-		/*
-		 * If the reset pin isn't present, do a software reset. It isn't
-		 * as thorough as the hardware reset, as we can't reset the I2C
-		 * communication block for obvious reasons, but it's getting the
-		 * chip into a defined state.
-		 */
-		regmap_update_bits(tc->regmap, SYSRSTENB,
-				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
-				0);
-		regmap_update_bits(tc->regmap, SYSRSTENB,
-				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
-				ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
-		usleep_range(5000, 10000);
-	}
-
-	if (tc->hpd_pin >= 0) {
-		u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
-		u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
-
-		/* Set LCNT to 2ms */
-		regmap_write(tc->regmap, lcnt_reg,
-			     clk_get_rate(tc->refclk) * 2 / 1000);
-		/* We need the "alternate" mode for HPD */
-		regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
-
-		if (tc->have_irq) {
-			/* enable H & LC */
-			regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
-		}
-	}
-
 	ret = tc_aux_link_setup(tc);
 	if (ret)
 		return ret;
-- 
2.34.1

