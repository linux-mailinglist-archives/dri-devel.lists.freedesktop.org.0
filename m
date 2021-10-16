Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DD430500
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 23:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E506E544;
	Sat, 16 Oct 2021 21:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63476E544
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 21:04:09 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 85C34831FD;
 Sat, 16 Oct 2021 23:04:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634418246;
 bh=8xkUxH3SJ8xXbM3h7HOTV1mcEUFFBWD7Z9u1kQxbky4=;
 h=From:To:Cc:Subject:Date:From;
 b=xrnXS38hAgSuJ8DubY8Wx5w/qNmcLDrILKG7a8WAiMOuedDLlWwLO/+S8BG/nfEMW
 tiIKFa9UDEgL3xOtxqfhKE/f7rbEpVxyPlyAgdhS0ftsfObCP90Mfref5pSCLVM+vP
 XVksVcMvgRInTG5RiLjuBL4nDiyzmVu4SOSBXkzeo3uR+QzHO8YFSW6UFVwVyiIhWv
 Z3Wifa1P2NZ2HewQXvp7DSFlPSX9cOu/x54V9Tx98iK+xxZcN5wPAuXaYgVykz5GTp
 NdrWB7dUYSvnBbKYUDC7rjYkB2Op1LOMIVKqvhqGN7iTKUL/yb06aLWHLhrTvpz/kB
 Kz18a1Ib7/X8w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Optimize reset line toggling
Date: Sat, 16 Oct 2021 23:04:02 +0200
Message-Id: <20211016210402.171595-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Current code always sets reset line low in .pre_enable callback and
holds it low for 10ms. This is sub-optimal and increases the time
between enablement of the DSI83 and valid LVDS clock.

Rework the reset handling such that the reset line is held low for 10ms
both in probe() of the driver and .disable callback, which guarantees
that the reset line was always held low for more than 10ms and therefore
the reset line timing requirement is satisfied. Furthermore, move the
reset handling into .enable callback so the entire DSI83 initialization
is now in one place.

This reduces DSI83 enablement delay by up to 10ms.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 40 ++++++++-------------------
 1 file changed, 11 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index ba1160ec6d6e..52030a82f3e1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -301,22 +301,6 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
 	ctx->dsi = NULL;
 }
 
-static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
-					struct drm_bridge_state *old_bridge_state)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-
-	/*
-	 * Reset the chip, pull EN line low for t_reset=10ms,
-	 * then high for t_en=1ms.
-	 */
-	regcache_mark_dirty(ctx->regmap);
-	gpiod_set_value(ctx->enable_gpio, 0);
-	usleep_range(10000, 11000);
-	gpiod_set_value(ctx->enable_gpio, 1);
-	usleep_range(1000, 1100);
-}
-
 static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
 				   const struct drm_display_mode *mode)
 {
@@ -394,6 +378,10 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	u16 val;
 	int ret;
 
+	/* Deassert reset */
+	gpiod_set_value(ctx->enable_gpio, 1);
+	usleep_range(1000, 1100);
+
 	/* Get the LVDS format from the bridge state. */
 	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 
@@ -540,18 +528,11 @@ static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
 {
 	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
 
-	/* Clear reset, disable PLL */
-	regmap_write(ctx->regmap, REG_RC_RESET, 0x00);
-	regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
-}
-
-static void sn65dsi83_atomic_post_disable(struct drm_bridge *bridge,
-					  struct drm_bridge_state *old_bridge_state)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-
-	/* Put the chip in reset, pull EN line low. */
+	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	gpiod_set_value(ctx->enable_gpio, 0);
+	usleep_range(10000, 11000);
+
+	regcache_mark_dirty(ctx->regmap);
 }
 
 static enum drm_mode_status
@@ -597,10 +578,8 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
-	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
 	.atomic_enable		= sn65dsi83_atomic_enable,
 	.atomic_disable		= sn65dsi83_atomic_disable,
-	.atomic_post_disable	= sn65dsi83_atomic_post_disable,
 	.mode_valid		= sn65dsi83_mode_valid,
 
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -685,10 +664,13 @@ static int sn65dsi83_probe(struct i2c_client *client,
 		model = id->driver_data;
 	}
 
+	/* Put the chip in reset, pull EN line low, and assure 10ms reset low timing. */
 	ctx->enable_gpio = devm_gpiod_get(ctx->dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->enable_gpio))
 		return PTR_ERR(ctx->enable_gpio);
 
+	usleep_range(10000, 11000);
+
 	ret = sn65dsi83_parse_dt(ctx, model);
 	if (ret)
 		return ret;
-- 
2.33.0

