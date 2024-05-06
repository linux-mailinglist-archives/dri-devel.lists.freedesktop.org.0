Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1334A8BCF15
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:35:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE6210FB4C;
	Mon,  6 May 2024 13:35:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9hLaZa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6C610FB4C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:35:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 87F106120A;
 Mon,  6 May 2024 13:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2EAC4AF67;
 Mon,  6 May 2024 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002547;
 bh=gBI1ftlJZK9GLIPJr/NbCBA/Qls8YZkI0rH9liGw82E=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=h9hLaZa9H6GjxzIZRfYYsRrPiaEmUBLgk6uaHxdbdFwp22Q8cgdEsaIYiY/Rf9Ypn
 lKfCsi5ROojUiHyhphcOKtuGgMn09uF3w7sGI7DHHmw2wJfmOSWNqILS6JyTqtR9mI
 vTuU+4CE27bz6NZqk7YLmD41xVHbRzFLlUmbvDv8txUgLoEyF8D9AvcZ7zPiVB+ui8
 TvBIrBVQR0u5CFL8Bwl8nowBUbU/Ns+7KxHFwvblEdcotqt5Gym8KN1BTbu6g1+FR8
 AGjo26xCkv+3PXBt4SaWMbcRwgdKOz6aL0v5qHB8opihXv97Ht6PM7oKtG2bMOFK4c
 cxXwl1Tzm7rXg==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:38 +0200
Subject: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay calculation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
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

To cite the datasheet on VSDELAY:
  During DSI link speed is slower than that of LVDS link’s, data needs
  to be buffer within 775XBG before outputting to prevent data from
  underflow. Register field VPCTRL[VSDELAY] is used to for this purpose

This driver assumes that the DSI link speed is the pixel clock (as does
every DSI bridge driver), after all the LVDS clock is derived from the
DSI clock. Thus we know for a fact, that the DSI link is not slower than
the LVDS side. Just use the (sane) default value of the bridge and drop
the complicated calculation here.

While at it, replace the TC358775_VPCTRL_MSF() and
TC358775_VPCTRL_OPXLFMT() inline functions by the usual macros for a bit
flag.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 49 +++++++--------------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 54aea58a3406..a9d731e87970 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -109,7 +109,9 @@
 #define RDPKTLN         0x0404  /* Command Read Packet Length */
 
 #define VPCTRL          0x0450  /* Video Path Control */
-#define EVTMODE		BIT(5)  /* Video event mode enable, tc35876x only */
+#define VPCTRL_MSF	BIT(0)
+#define VPCTRL_OPXLFMT	BIT(8)
+#define VPCTRL_EVTMODE	BIT(5)  /* Video event mode enable, tc35876x only */
 #define HTIM1           0x0454  /* Horizontal Timing Control 1 */
 #define HTIM2           0x0458  /* Horizontal Timing Control 2 */
 #define VTIM1           0x045C  /* Vertical Timing Control 1 */
@@ -187,30 +189,6 @@ enum {
 
 #define L0EN BIT(1)
 
-#define TC358775_VPCTRL_VSDELAY__MASK	0x3FF00000
-#define TC358775_VPCTRL_VSDELAY__SHIFT	20
-static inline u32 TC358775_VPCTRL_VSDELAY(uint32_t val)
-{
-	return ((val) << TC358775_VPCTRL_VSDELAY__SHIFT) &
-			TC358775_VPCTRL_VSDELAY__MASK;
-}
-
-#define TC358775_VPCTRL_OPXLFMT__MASK	0x00000100
-#define TC358775_VPCTRL_OPXLFMT__SHIFT	8
-static inline u32 TC358775_VPCTRL_OPXLFMT(uint32_t val)
-{
-	return ((val) << TC358775_VPCTRL_OPXLFMT__SHIFT) &
-			TC358775_VPCTRL_OPXLFMT__MASK;
-}
-
-#define TC358775_VPCTRL_MSF__MASK	0x00000001
-#define TC358775_VPCTRL_MSF__SHIFT	0
-static inline u32 TC358775_VPCTRL_MSF(uint32_t val)
-{
-	return ((val) << TC358775_VPCTRL_MSF__SHIFT) &
-			TC358775_VPCTRL_MSF__MASK;
-}
-
 #define TC358775_LVCFG_PCLKDIV__MASK	0x000000f0
 #define TC358775_LVCFG_PCLKDIV__SHIFT	4
 static inline u32 TC358775_LVCFG_PCLKDIV(uint32_t val)
@@ -350,7 +328,6 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 	u32 hback_porch, hsync_len, hfront_porch, hactive, htime1, htime2;
 	u32 vback_porch, vsync_len, vfront_porch, vactive, vtime1, vtime2;
 	unsigned int val = 0;
-	u16 dsiclk, clkdiv, byteclk, t1, t2, t3, vsdelay;
 	struct drm_display_mode *mode;
 	struct drm_connector *connector = get_connector(bridge->encoder);
 
@@ -398,27 +375,17 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 
 	/* Video event mode vs pulse mode bit, does not exist for tc358775 */
 	if (tc->type == TC358765)
-		val = EVTMODE;
+		val = VPCTRL_EVTMODE;
 	else
 		val = 0;
 
 	if (tc->bpc == 8)
-		val |= TC358775_VPCTRL_OPXLFMT(1);
+		val |= VPCTRL_OPXLFMT;
 	else /* bpc = 6; */
-		val |= TC358775_VPCTRL_MSF(1);
-
-	dsiclk = mode->crtc_clock * 3 * tc->bpc / tc->num_dsi_lanes / 1000;
-	clkdiv = dsiclk / (tc->lvds_link == DUAL_LINK ? DIVIDE_BY_6 : DIVIDE_BY_3);
-	byteclk = dsiclk / 4;
-	t1 = hactive * (tc->bpc * 3 / 8) / tc->num_dsi_lanes;
-	t2 = ((100000 / clkdiv)) * (hactive + hback_porch + hsync_len + hfront_porch) / 1000;
-	t3 = ((t2 * byteclk) / 100) - (hactive * (tc->bpc * 3 / 8) /
-		tc->num_dsi_lanes);
-
-	vsdelay = (clkdiv * (t1 + t3) / byteclk) - hback_porch - hsync_len - hactive;
+		val |= VPCTRL_MSF;
 
-	val |= TC358775_VPCTRL_VSDELAY(vsdelay);
-	regmap_write(tc->regmap, VPCTRL, val);
+	regmap_update_bits(tc->regmap, VPCTRL, val,
+			   VPCTRL_OPXLFMT | VPCTRL_MSF | VPCTRL_EVTMODE);
 
 	regmap_write(tc->regmap, HTIM1, htime1);
 	regmap_write(tc->regmap, VTIM1, vtime1);

-- 
2.39.2

