Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B060546C99
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 20:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF2A311232F;
	Fri, 10 Jun 2022 18:39:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C11D11232F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 18:39:12 +0000 (UTC)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1nzjXE-0006v9-Tk; Fri, 10 Jun 2022 20:39:04 +0200
From: Lucas Stach <l.stach@pengutronix.de>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Marek Vasut <marex@denx.de>
Subject: [PATCH] drm/bridge: tc358767: don't fixup mode polarity
Date: Fri, 10 Jun 2022 20:39:02 +0200
Message-Id: <20220610183902.268375-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 patchwork-lst@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It doesn't always work, as there is just a single adjusted mode, so if
parts of the display pipeline disagree on the required sync polarity
it's possible to end up with a invalid config. However it also isn't
necessary for this bridge chip, as the DPI interface has a configurable
sync polarity, so we can just set it up to match the mode.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/gpu/drm/bridge/tc358767.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 485717c8f0b4..bd2cae711ca0 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -889,6 +889,7 @@ static int tc_set_edp_video_mode(struct tc_data *tc,
 	u32 dp0_syncval;
 	u32 bits_per_pixel = 24;
 	u32 in_bw, out_bw;
+	u32 dpipxlfmt;
 
 	/*
 	 * Recommended maximum number of symbols transferred in a transfer unit:
@@ -938,10 +939,15 @@ static int tc_set_edp_video_mode(struct tc_data *tc,
 	if (ret)
 		return ret;
 
-	ret = regmap_write(tc->regmap, DPIPXLFMT,
-			   VS_POL_ACTIVE_LOW | HS_POL_ACTIVE_LOW |
-			   DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 |
-			   DPI_BPP_RGB888);
+	dpipxlfmt = DE_POL_ACTIVE_HIGH | SUB_CFG_TYPE_CONFIG1 | DPI_BPP_RGB888;
+
+	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
+		dpipxlfmt |= VS_POL_ACTIVE_LOW;
+
+	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
+		dpipxlfmt |= HS_POL_ACTIVE_LOW;
+
+	ret = regmap_write(tc->regmap, DPIPXLFMT, dpipxlfmt);
 	if (ret)
 		return ret;
 
@@ -1471,18 +1477,6 @@ tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
 		dev_err(tc->dev, "main link disable error: %d\n", ret);
 }
 
-static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
-				 const struct drm_display_mode *mode,
-				 struct drm_display_mode *adj)
-{
-	/* Fixup sync polarities, both hsync and vsync are active low */
-	adj->flags = mode->flags;
-	adj->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
-	adj->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
-
-	return true;
-}
-
 static int tc_common_atomic_check(struct drm_bridge *bridge,
 				  struct drm_bridge_state *bridge_state,
 				  struct drm_crtc_state *crtc_state,
@@ -1758,7 +1752,6 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_check = tc_edp_atomic_check,
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
-	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
-- 
2.30.2

