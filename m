Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D48BCF1B
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 15:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099C010FBC6;
	Mon,  6 May 2024 13:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fKoAURvJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6DA10FBC6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 13:36:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 48A8561180;
 Mon,  6 May 2024 13:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C6DC4AF63;
 Mon,  6 May 2024 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715002572;
 bh=2qrwEGgpJfR6a/ANS2qyau3152FW/n1Efs/NSwqyfq0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fKoAURvJwU7PQ7A60+LC3D9rbSoxh2IprTicgx6iHdgw3xbzOSx2GCVLTVCbZ8djJ
 H9QxnH6/50KnMgSdXODGrFTgXNaVh9GCX11xdLqtPLL0iGtFXOL3dSlsLoulF5vDF3
 ZEmnFSoveKIZMx4szbIqoGWCBIDh9KHXRTpqaisLILlO3XoCb7AEfM/nw7QQlD8Uhe
 ZWqLFtr4EhSi+HBShK4RKdoEAeZNdCSECkUVRdry/lyn7nV0AlWtNJT0sxJ98/W8dc
 4BbBk9pO1I5pGtzn3vjfJ4DYAAjyDVGkAhO5dZCJ2xPkjdUB3dniX81Xw5BffzQXjX
 n7Yyvgt4OaJPw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:43 +0200
Subject: [PATCH 14/20] drm/bridge: tc358775: configure PLL depending on the
 LVDS clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-14-545dcf00b8dd@kernel.org>
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

The PLL setting was hardcoded to a LVDS clock between 60MHz and 135MHz.
This adds support for slower frequencies. Also, rework the reset
sequence to match the initialization sequence provided by the vendor.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 50 ++++++++++++++++++++++++++++++++-------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 4ec059531c5f..e3fba7ac71ec 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -30,8 +30,6 @@
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
-#define FLD_VAL(val, start, end) FIELD_PREP(GENMASK(start, end), val)
-
 /* Registers */
 
 /* DSI D-PHY Layer Registers */
@@ -146,10 +144,10 @@ enum {
 #define PCLKSEL_HSRCK	0	/* DSI clock */
 
 #define LVPHY0          0x04A0  /* LVDS PHY 0 */
-#define LV_PHY0_RST(v)          FLD_VAL(v, 22, 22) /* PHY reset */
-#define LV_PHY0_IS(v)           FLD_VAL(v, 15, 14)
-#define LV_PHY0_ND(v)           FLD_VAL(v, 4, 0) /* Frequency range select */
-#define LV_PHY0_PRBS_ON(v)      FLD_VAL(v, 20, 16) /* Clock/Data Flag pins */
+#define LVPHY0_LV_ND	GENMASK(4, 0)
+#define LVPHY0_LV_FS	GENMASK(6, 5)
+#define LVPHY0_LV_IS	GENMASK(15, 14) /* charge pump current */
+#define LVPHY0_LV_RST	BIT(22)
 
 #define LVPHY1          0x04A4  /* LVDS PHY 1 */
 #define SYSSTAT         0x0500  /* System Status  */
@@ -223,6 +221,14 @@ struct tc_data {
 	enum tc3587x5_type	type;
 };
 
+struct tc358775_pll_settings {
+	unsigned int min_khz;
+	unsigned int max_khz;
+	u8 fs;
+	u8 nd;
+	u8 is;
+};
+
 static inline struct tc_data *bridge_to_tc(struct drm_bridge *b)
 {
 	return container_of(b, struct tc_data, bridge);
@@ -371,10 +377,38 @@ static void tc358775_configure_lvds_timings(struct tc_data *tc,
 	regmap_write(tc->regmap, VFUEN, VFUEN_EN);
 }
 
-static void tc358775_configure_pll(struct tc_data *tc, int pixelclk)
+static const struct tc358775_pll_settings tc358775_pll_settings[] = {
+	{ 25000, 30000, 2, 27, 1 },
+	{ 30000, 60000, 1, 13, 1 },
+	{ 60000, 135000, 0, 6, 1 },
+	{}
+};
+
+static void tc358775_configure_pll(struct tc_data *tc, unsigned int pixelclk)
 {
+	const struct tc358775_pll_settings *settings;
+	unsigned int val;
+
+	if (tc->lvds_dual_link)
+		pixelclk /= 2;
+
+	for (settings = tc358775_pll_settings; settings->min_khz; settings++)
+		if (pixelclk > settings->min_khz &&
+		    pixelclk < settings->max_khz)
+			break;
+
+	if (!settings->min_khz)
+		return;
+
+	val = u32_encode_bits(settings->fs, LVPHY0_LV_FS);
+	val |= u32_encode_bits(settings->nd, LVPHY0_LV_ND);
+	val |= u32_encode_bits(settings->is, LVPHY0_LV_IS);
+
+	regmap_write(tc->regmap, LVPHY0, val | LVPHY0_LV_RST);
+	usleep_range(100, 150);
+	regmap_write(tc->regmap, LVPHY0, val);
+
 	regmap_write(tc->regmap, SYSRST, SYS_RST_LCD);
-	regmap_write(tc->regmap, LVPHY0, LV_PHY0_PRBS_ON(4) | LV_PHY0_ND(6));
 }
 
 static void tc358775_configure_color_mapping(struct tc_data *tc, u32 fmt)

-- 
2.39.2

