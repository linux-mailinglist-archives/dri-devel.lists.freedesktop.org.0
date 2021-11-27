Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34145FC5C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Nov 2021 04:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A086EC3D;
	Sat, 27 Nov 2021 03:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678B6EC3D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Nov 2021 03:24:24 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 6C6B4801E7;
 Sat, 27 Nov 2021 04:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1637983462;
 bh=s4NqW9+X4SpEDC8RJG/w2DxxUB2Td7adfCY+AX0KePs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JEsvNoA1Q3MkxiR6cPD7wpYeNxIjSITrBE0K9Uyt0GxDOFOVtRt8JFvCJ1oN/uDuf
 Dw1d5dvUSsrbqvnspCE8xKnFzBbuaeEbul+9c88LsN0wnMFd02oLXmaMLtBBcMjeEM
 Q7NCeSRuqn90GdWJmXD+g9UJTTdjUejd+bvyIBh7/mUWDDA470ieAII7U/k4NHqvqc
 HCxv33Hz+gCrevg2Bi+KEoFmq8X15Q/gFiszm6TJlbn0XbDccDUE1DYU6g8bdospEf
 SihTcM0IcB3NQdSEkPSJWp76mgakhkPXVvkkGo3fGsvuG/3qTe0wRPfQcJOvQIO6Jz
 lqzXM26oalrpA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
Date: Sat, 27 Nov 2021 04:24:03 +0100
Message-Id: <20211127032405.283435-2-marex@denx.de>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211127032405.283435-1-marex@denx.de>
References: <20211127032405.283435-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TC358767/TC358867/TC9595 are all capable of operating either from
attached Xtal or from DSI clock lane clock. In case the later is used,
all I2C accesses will fail until the DSI clock lane is running and
supplying clock to the chip.

Move all hardware initialization to enable callback to guarantee the
DSI clock lane is running before accessing the hardware. In case Xtal
is attached to the chip, this change has no effect.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/tc358767.c | 111 +++++++++++++++++-------------
 1 file changed, 63 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 23a6f90b694b..f7fbf6f673e9 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1234,11 +1234,74 @@ static int tc_stream_disable(struct tc_data *tc)
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
 static void tc_bridge_enable(struct drm_bridge *bridge)
 {
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
@@ -1626,9 +1689,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	if (client->irq > 0) {
-		/* enable SysErr */
-		regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
-
 		ret = devm_request_threaded_irq(dev, client->irq,
 						NULL, tc_irq_handler,
 						IRQF_ONESHOT,
@@ -1641,51 +1701,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
2.33.0

