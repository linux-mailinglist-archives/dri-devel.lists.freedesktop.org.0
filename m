Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D5A27530
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:01:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55C610E694;
	Tue,  4 Feb 2025 15:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vt3avH7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE07410E692
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:01:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3F2E65C69DE;
 Tue,  4 Feb 2025 15:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E94C4CEDF;
 Tue,  4 Feb 2025 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738681274;
 bh=nMPrnko8NIXHxK0qBKf1FnCloSLkqwlYjmZ4ZeLx4vM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Vt3avH7jXTydpf51MzfbLCcuoIbwhQ14eLF0Eh3PnprJ4MMrbTQ6XfSVNWSKTeg/5
 w37tJRaUHlpKAm5cUU3lvX5EjTBUzL0YSC36/Hc0oU2a5oMV6DzrV6p3/tksPKa0JA
 udAmqDr8AV+BJNh4TVFYwYz9nEkxkPuS+kPFYOO/s1HYKZocyvU67zPuAtBe1uBZA0
 1IMSd/rr94XcQp42PBTOreSYXwSjf5avuCUk58cTNTs5vLuycx+Vs2kaMoZ33dOXJY
 iHChbiarf1xqdZ1agcqiOcie3Sd996PWqkIEuU7JUxyXjWYddKRYBVgHA7iq/+e7ha
 6wFRGGdlKuIng==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 04 Feb 2025 15:58:03 +0100
Subject: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9273; i=mripard@kernel.org;
 h=from:subject:message-id; bh=nMPrnko8NIXHxK0qBKf1FnCloSLkqwlYjmZ4ZeLx4vM=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOmLtH7MELh96p9x8K0T1tevXNh/7r39B91FcktEQrP23
 Al1zhEI75jKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATmXmDsVa2XTzHKLLH/txC
 x6Wnly9Vzylz7f0WWa684JDC5aqFS5mToiRW3Ysq3923+vwKu0kX4hkb/kbXKU6/fFrwq9pXVZ3
 LHH8vzfxi+1TpaexEccn1nz++lrhcF3tr9t9IgVO7Z3vJRHDkAAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
deprecated and shouldn't be used by atomic drivers.

This was due to the fact that we did't have any other alternative to
retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
in the bridge state, so we can move to atomic callbacks and drop that
deprecated pointer usage.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 497e7212d7719a03045d055b7069f9a10c7f3877..590504bd2746fd1f9b78a8203e762d154dfb0bb2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -242,15 +242,16 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 	u8 buf[2] = { val & 0xff, val >> 8 };
 
 	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
-static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
+static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
+				     struct drm_bridge_state *bridge_state)
 {
 	u32 bit_rate_khz, clk_freq_khz;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		&bridge_state->crtc->state->adjusted_mode;
 
 	bit_rate_khz = mode->clock *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
 	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
 
@@ -273,11 +274,12 @@ static const u32 ti_sn_bridge_dsiclk_lut[] = {
 	416000000,
 	486000000,
 	460800000,
 };
 
-static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata,
+					 struct drm_bridge_state *bridge_state)
 {
 	int i;
 	u32 refclk_rate;
 	const u32 *refclk_lut;
 	size_t refclk_lut_size;
@@ -286,11 +288,11 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 		refclk_rate = clk_get_rate(pdata->refclk);
 		refclk_lut = ti_sn_bridge_refclk_lut;
 		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
 		clk_prepare_enable(pdata->refclk);
 	} else {
-		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
+		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata, bridge_state) * 1000;
 		refclk_lut = ti_sn_bridge_dsiclk_lut;
 		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
 	}
 
 	/* for i equals to refclk_lut_size means default frequency */
@@ -310,16 +312,17 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 	 * regardless of its actual sourcing.
 	 */
 	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
 }
 
-static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
+				      struct drm_bridge_state *bridge_state)
 {
 	mutex_lock(&pdata->comms_mutex);
 
 	/* configure bridge ref_clk */
-	ti_sn_bridge_set_refclk_freq(pdata);
+	ti_sn_bridge_set_refclk_freq(pdata, bridge_state);
 
 	/*
 	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
 	 * so the HPD is an internal signal that's only there to signal that
 	 * the panel is done powering up.  ...but the bridge chip debounces
@@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	 * panel (including the aux channel) w/out any need for an input clock
 	 * so we can do it in resume which lets us read the EDID before
 	 * pre_enable(). Without a reference clock we need the MIPI reference
 	 * clock so reading early doesn't work.
 	 */
-	if (pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+	if (pdata->refclk) {
+		drm_modeset_lock(&pdata->bridge.base.lock, NULL);
+		ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current_state(&pdata->bridge));
+		drm_modeset_unlock(&pdata->bridge.base.lock);
+	}
 
 	return ret;
 }
 
 static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
@@ -821,16 +827,17 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
 }
 
-static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata,
+				      struct drm_bridge_state *bridge_state)
 {
 	unsigned int bit_rate_mhz, clk_freq_mhz;
 	unsigned int val;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		&bridge_state->crtc->state->adjusted_mode;
 
 	/* set DSIA clk frequency */
 	bit_rate_mhz = (mode->clock / 1000) *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
 	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
@@ -856,16 +863,18 @@ static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
  */
 static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata,
+					     struct drm_bridge_state *bridge_state,
+					     unsigned int bpp)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		&bridge_state->crtc->state->adjusted_mode;
 
 	/* Calculate minimum bit rate based on our pixel clock. */
 	bit_rate_khz = mode->clock * bpp;
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
@@ -960,14 +969,15 @@ static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata)
 	}
 
 	return valid_rates;
 }
 
-static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata,
+					   struct drm_bridge_state *bridge_state)
 {
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		&bridge_state->crtc->state->adjusted_mode;
 	u8 hsync_polarity = 0, vsync_polarity = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		hsync_polarity = CHA_HSYNC_POLARITY;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
@@ -1076,19 +1086,21 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 
 static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 				       struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct drm_bridge_state *bridge_state;
 	struct drm_connector *connector;
 	const char *last_err_str = "No supported DP rate";
 	unsigned int valid_rates;
 	int dp_rate_idx;
 	unsigned int val;
 	int ret = -EINVAL;
 	int max_dp_lanes;
 	unsigned int bpp;
 
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (!connector) {
 		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
 		return;
@@ -1105,11 +1117,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
 			   pdata->ln_polrs << LN_POLRS_OFFSET);
 
 	/* set dsi clk frequency value */
-	ti_sn_bridge_set_dsi_rate(pdata);
+	ti_sn_bridge_set_dsi_rate(pdata, bridge_state);
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
 	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
@@ -1140,11 +1152,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 			   val);
 
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bridge_state, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
 			continue;
 
@@ -1156,26 +1168,28 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
 	}
 
 	/* config video parameters */
-	ti_sn_bridge_set_video_timings(pdata);
+	ti_sn_bridge_set_video_timings(pdata, bridge_state);
 
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
 }
 
 static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					   struct drm_atomic_state *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	struct drm_bridge_state *bridge_state =
+		drm_atomic_get_new_bridge_state(state, bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
 	if (!pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+		ti_sn65dsi86_enable_comms(pdata, bridge_state);
 
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
 }
 

-- 
2.48.0

