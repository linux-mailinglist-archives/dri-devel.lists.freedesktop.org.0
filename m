Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 042D2AA7533
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 16:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D0D10E94C;
	Fri,  2 May 2025 14:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="ugPaCDoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD15910E962
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail; t=1746196893; x=1746456093;
 bh=YDD7Tfq+Eps0vHG8CPXWTHstEOqGuUomGTuL/oqz3gg=;
 h=From:Date:Subject:Message-Id:To:Cc:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector:List-Unsubscribe:
 List-Unsubscribe-Post;
 b=ugPaCDoVgHFH3HzWcMshlaKoJ7cw8LKJP2X9gUNgOYvaYYcTLsxC2l2St9Pca0Cqg
 MUAkiaotgAeTC2ms8toGFOj0p4JPRWnHUWcobcuUm+BoIWUwr5+rUJwqoPyyfCob00
 x9o2HDqdk78G60a6bCHNLJGWpcHy9DeTqgd6QSnkJHaPk6MXI/pL82AEhGjXYuXpdv
 itXPkpfU36W6uAuK2XkyyFg4vXzIhkE12GRYstDlfWqYC1UTj4v0u+1VzyhOBI/Me/
 Vrni1miQldHeFTvCvd/RhApD+Lmh5e2tb7Tw6mypNAWP2dwLUIS/GuUmyypBLmJ3yX
 i8XtgywrgqJAg==
X-Pm-Submission-Id: 4ZptsN41Wpz44t
From: Esben Haabendal <esben@geanix.com>
Date: Fri, 02 May 2025 16:41:23 +0200
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Support LVDS Channel B on SN65DSI84
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-sn65dsi83-channel-swap-v1-1-0738be9b27ab@geanix.com>
X-B4-Tracking: v=1; b=H4sIAJLZFGgC/x2MWwqAIBAArxL73YJlD+kq0YfYWgth4UIF4d2zP
 odh5gGhyCQwFA9EOll4DxmqsgC32rAQ8pwZalW3qtEKJXTtLGw0fj7QhnLZA32vrXe9sY4M5Pi
 I5Pn+x+OU0gsnyAbcaAAAAA==
X-Change-ID: 20250430-sn65dsi83-channel-swap-f73afc78ace8
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746196887; l=4020;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=wRB06aWUoFvAIFh3EUqSrQRuVJ/cLk6D3jb7XLHptyw=;
 b=7mkJ8UT8OcCUPjIWeQWMYEH1+nqQXdvjrJmouF3Z+2OVeDnuc6S5zD2j5TnfrFFdil3lcYv92
 xJUbQz1W/2BAbkKaM5SjwauRHM+RB1RBOvy+Qk1wEQCN2daCc8Rbo94
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
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

This adds support for using SN65DSI84 in single-link mode with output to
LVDS Channel B.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 95563aa1b450d549be8cacbe58c45f07b93595e5..e5785447c804eeced24f80c2b8b90283623c86a9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -11,6 +11,8 @@
  *   = 1x Single-link DSI ~ 2x Single-link or 1x Dual-link LVDS
  *   - Supported
  *   - Dual-link LVDS mode tested
+ *   - Single-link to LVDS Channel A tested.
+ *   - Single-link to LVDS Channel B tested.
  *   - 2x Single-link LVDS mode unsupported
  *     (should be easy to add by someone who has the HW)
  * - SN65DSI85
@@ -158,7 +160,7 @@ struct sn65dsi83 {
 	struct gpio_desc		*enable_gpio;
 	struct regulator		*vcc;
 	bool				lvds_dual_link;
-	bool				lvds_dual_link_even_odd_swap;
+	bool				lvds_channel_swap;
 	int				lvds_vod_swing_conf[2];
 	int				lvds_term_conf[2];
 	int				irq;
@@ -587,7 +589,7 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 			REG_LVDS_VCOM_CHA_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_A]) |
 			REG_LVDS_VCOM_CHB_LVDS_VOD_SWING(ctx->lvds_vod_swing_conf[CHANNEL_B]));
 	regmap_write(ctx->regmap, REG_LVDS_LANE,
-		     (ctx->lvds_dual_link_even_odd_swap ?
+		     (ctx->lvds_channel_swap ?
 		      REG_LVDS_LANE_EVEN_ODD_SWAP : 0) |
 		     (ctx->lvds_term_conf[CHANNEL_A] ?
 			  REG_LVDS_LANE_CHA_LVDS_TERM : 0) |
@@ -834,6 +836,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
+	u32 panel_port = 2;
 	int ret;
 
 	ret = sn65dsi83_parse_lvds_endpoint(ctx, CHANNEL_A);
@@ -845,29 +848,38 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
 		return ret;
 
 	ctx->lvds_dual_link = false;
-	ctx->lvds_dual_link_even_odd_swap = false;
+	ctx->lvds_channel_swap = false;
 	if (model != MODEL_SN65DSI83) {
-		struct device_node *port2, *port3;
+		struct device_node *port0, *port1, *port2, *port3;
 		int dual_link;
 
+		port0 = of_graph_get_port_by_id(dev->of_node, 0);
+		port1 = of_graph_get_port_by_id(dev->of_node, 1);
 		port2 = of_graph_get_port_by_id(dev->of_node, 2);
 		port3 = of_graph_get_port_by_id(dev->of_node, 3);
 		dual_link = drm_of_lvds_get_dual_link_pixel_order(port2, port3);
-		of_node_put(port2);
-		of_node_put(port3);
 
 		if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS) {
-			ctx->lvds_dual_link = true;
 			/* Odd pixels to LVDS Channel A, even pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = false;
-		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			ctx->lvds_dual_link = true;
+		} else if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
 			/* Even pixels to LVDS Channel A, odd pixels to B */
-			ctx->lvds_dual_link_even_odd_swap = true;
+			ctx->lvds_dual_link = true;
+			ctx->lvds_channel_swap = true;
+		} else if (port0 && !port1 && port2 && !port3) {
+			/* DSI Channel A to LVDS Channel A */
+		} else if (port0 && !port1 && !port2 && port3) {
+			/* DSI Channel A to LVDS Channel B */
+			ctx->lvds_channel_swap = true;
+			panel_port = 3;
 		}
+		of_node_put(port0);
+		of_node_put(port1);
+		of_node_put(port2);
+		of_node_put(port3);
 	}
 
-	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 2, 0);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, panel_port, 0);
 	if (IS_ERR(panel_bridge))
 		return dev_err_probe(dev, PTR_ERR(panel_bridge), "Failed to get panel bridge\n");
 

---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250430-sn65dsi83-channel-swap-f73afc78ace8

Best regards,
-- 
Esben Haabendal <esben@geanix.com>

