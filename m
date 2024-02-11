Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA06285088D
	for <lists+dri-devel@lfdr.de>; Sun, 11 Feb 2024 10:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2C10E574;
	Sun, 11 Feb 2024 09:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="cK9Z7ToC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB5310E574
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Feb 2024 09:59:46 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id B2C896049B;
 Sun, 11 Feb 2024 09:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1707645585;
 bh=k8tevH7fh59H3rha0FSg4+P0590GQdDynueJfgAtkbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cK9Z7ToCyvocHCKgpLKH3lkNjiupDyNJ6H+CzcZuH91iN+/cEz37lUjfngHzVtE/4
 hWnLxtzUwDTzc2PRHF0L2feQHC2c7cgX4ah6Jn81PL4P2vXlPq02H58X3mCfpmWqMg
 bAX3nzAddlWoOlounWLZi9Hnl8r3BkqgSjhJ3X5GdKloAitI7h0aPRNWYG6eBUHJrI
 QtrGQwvvofihY9qYAWoP1mGEiJMFHbKsLX5MnP63of8qSsgT8+1mLBUa++accxOSeK
 j3RQ2Ou7TfVp+ZFtIvCZlsIpzPAB/NSZuDJz4OXj2Qgs4m4bP1LFx5OGCLOKZC1ZsC
 cf4KxoC1iIRQg==
From: Tony Lindgren <tony@atomide.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Simha BN <simhavcs@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Michael Walle <mwalle@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 09/10] drm/bridge: tc358775: Add support for tc358765
Date: Sun, 11 Feb 2024 11:51:14 +0200
Message-ID: <20240211095144.2589-10-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240211095144.2589-1-tony@atomide.com>
References: <20240211095144.2589-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The tc358775 bridge is pin compatible with earlier tc358765 according to
the tc358774xbg_datasheet_en_20190118.pdf documentation. Compared to the
tc358765, the tc358775 supports a STBY GPIO and higher data rates.

The tc358765 has a register bit for video event mode vs video pulse mode.
We must set it to video event mode for the LCD output to work, and on the
tc358775, this bit no longer exists.

Looks like the registers seem to match otherwise based on a quick glance
comparing the defines to the earlier Android kernel tc358765 driver.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

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
+	TC358765 = 0x65,
+	TC358775 = 0x75,
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
@@ -424,10 +433,16 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	d2l_write(tc->i2c, PPI_STARTPPI, PPI_START_FUNCTION);
 	d2l_write(tc->i2c, DSI_STARTDSI, DSI_RX_START);
 
+	/* Video event mode vs pulse mode bit, does not exist for tc358775 */
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
@@ -643,6 +658,7 @@ static int tc_probe(struct i2c_client *client)
 
 	tc->dev = dev;
 	tc->i2c = client;
+	tc->type = (enum tc3587x5_type)(unsigned long)of_device_get_match_data(dev);
 
 	tc->panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node,
 						  TC358775_LVDS_OUT0, 0);
@@ -704,13 +720,15 @@ static void tc_remove(struct i2c_client *client)
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
2.43.0
