Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C46B6E5F16
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 12:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE910E755;
	Tue, 18 Apr 2023 10:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.fris.de (mail.fris.de [116.203.77.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE73910E752
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 10:42:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D1D01C0180; Tue, 18 Apr 2023 12:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
 t=1681814566; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Odmdh/D2/jLFTdQG8vQtirvm1VnzvlvInuwT5gmEdRY=;
 b=QklAl10hOynG8ATSKLUjQoH38eJL2NeA/JFmVwMNpxS9b8hKSiiYOGmblVDZ3QfXAUksR5
 oWeSEuvJ4T9HouZYmDlp588J2HtRR0yKGZsqqUL1qDSJRg7nSSYjl3CnE8OfDELutw/dsg
 7SS92pjiM2brzm6wN++WikcZ2Ke3WHn2GHsWPbjHZLffFqM0tNBy2zzddfrgACK099Y0up
 fit+5PU+zotQwRYcPWXBFl51DUy7RwT+hPfnYao8C/xM49Wmwop+6zOx7HnZ+iAUiMg2dH
 W43jt+jXZC2e5cJMp6aAqG0+6i0rl+W6kld390s42QhhCbO0/2kJuE9DP3vxjw==
From: Frieder Schrempf <frieder@fris.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>
Subject: [RFC PATCH 2/3] drm/bridge: ti-sn65dsi83: Fix enable/disable flow to
 meet spec
Date: Tue, 18 Apr 2023 12:42:41 +0200
Message-Id: <20230418104242.877897-1-frieder@fris.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The datasheet describes the following initialization flow including
minimum delay times between each step:

1. DSI data lanes need to be in LP-11 and the clock lane in HS mode
2. toggle EN signal
3. initialize registers
4. enable PLL
5. soft reset
6. enable DSI stream
7. check error status register

To meet this requirement we need to make sure the host bridge's
pre_enable() is called first by using the pre_enable_prev_first
flag.

Furthermore we need to split enable() into pre_enable() which covers
steps 2-5 from above and enable() which covers step 7 and is called
after the host bridge's enable().

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 75286c9afbb9..a82f10b8109f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -321,8 +321,8 @@ static u8 sn65dsi83_get_dsi_div(struct sn65dsi83 *ctx)
 	return dsi_div - 1;
 }
 
-static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_bridge_state *old_bridge_state)
+static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 	struct drm_atomic_state *state = old_bridge_state->base.state;
@@ -484,11 +484,22 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	/* Trigger reset after CSR register update. */
 	regmap_write(ctx->regmap, REG_RC_RESET, REG_RC_RESET_SOFT_RESET);
 
+	/* Wait for 10ms after soft reset as specified in datasheet */
+	usleep_range(10000, 12000);
+}
+
+static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_bridge_state *old_bridge_state)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	unsigned int pval;
+
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
 	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
 
-	usleep_range(10000, 12000);
+	/* Wait for 1ms and check for errors in status register */
+	usleep_range(1000, 1100);
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
 	if (pval)
 		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
@@ -555,6 +566,7 @@ static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
 	.atomic_enable		= sn65dsi83_atomic_enable,
+	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
 	.atomic_disable		= sn65dsi83_atomic_disable,
 	.mode_valid		= sn65dsi83_mode_valid,
 
@@ -697,6 +709,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 
 	ctx->bridge.funcs = &sn65dsi83_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);
-- 
2.40.0

