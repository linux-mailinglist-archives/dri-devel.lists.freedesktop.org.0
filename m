Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FAA12D44
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:07:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED5E10E814;
	Wed, 15 Jan 2025 21:07:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JJzZy4yN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D759610E813
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:07:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 051D5A42524;
 Wed, 15 Jan 2025 21:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B4BC4CED1;
 Wed, 15 Jan 2025 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975220;
 bh=XkJDra09QyuAsQxq5bOx2/A8d5UtPsANLqv7dd5sQKE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=JJzZy4yNYXzt8uCJu3oRULBJqWrC+5eUUSbYyjngHeXkY4LG/56zBWODFzktQB/sb
 12cer6wotSjt+l9PXGbajzHU8QGTY76MMzBtCXBHPqxXqmVxzQa24FEQRjdhEwSQkg
 mnXQAL859N8RQDi4MNisSMKsuR/MWL1tb3cVioEPD5B0e0WsATicwFOY624EIY4p60
 LPww1mEyEGrec9xqGx6UB5yaasyMtJaSz+ofJRxH5ekaQHee3srmP5hsWoHnu/TzEm
 9/StOeR5xk8/1j4dXDnvSyuNzs6bTsgT9WXFQojPePFrYoCq+l0xL4rmnB652qBNkv
 +fsPfv2a0jS5w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 15 Jan 2025 22:05:36 +0100
Subject: [PATCH 29/29] drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-bridge-connector-v1-29-9a2fecd886a6@kernel.org>
References: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
In-Reply-To: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8143; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XkJDra09QyuAsQxq5bOx2/A8d5UtPsANLqv7dd5sQKE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdykovk5wesf2d/9hzrqmMhwvHdbbY7CzJzgtaV+Zuy
 FkbdmF5x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiIbzFjnRn/qdkLLu1/8PDl
 rYUa8Xxs6xo3Gz0u1eB52qoya5bb/cnbtW96b1d5xtzZZXqj52dUAmOdudXR9zZWNj2e5e+9Swv
 +PIy7vcN6xXzvuLaWTy83nt2exPVijbxtHuutuD3T9b4m6ysBAA==
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 41 ++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index b3d617505dda7d22b38c000fb79de46376adf3f1..c17d9486cf5c36d61eb00af2bdf9ba1b6f890ffd 100644
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
@@ -375,11 +378,11 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	 * so we can do it in resume which lets us read the EDID before
 	 * pre_enable(). Without a reference clock we need the MIPI reference
 	 * clock so reading early doesn't work.
 	 */
 	if (pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+		ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current_state(&pdata->bridge));
 
 	return ret;
 }
 
 static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
@@ -820,16 +823,17 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 
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
@@ -855,16 +859,18 @@ static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
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
@@ -959,14 +965,15 @@ static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata)
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
@@ -1104,11 +1111,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
 			   pdata->ln_polrs << LN_POLRS_OFFSET);
 
 	/* set dsi clk frequency value */
-	ti_sn_bridge_set_dsi_rate(pdata);
+	ti_sn_bridge_set_dsi_rate(pdata, old_bridge_state);
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
 	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
@@ -1139,11 +1146,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 			   val);
 
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, old_bridge_state, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
 			continue;
 
@@ -1155,11 +1162,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
 	}
 
 	/* config video parameters */
-	ti_sn_bridge_set_video_timings(pdata);
+	ti_sn_bridge_set_video_timings(pdata, old_bridge_state);
 
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
 }
@@ -1170,11 +1177,11 @@ static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
 	if (!pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+		ti_sn65dsi86_enable_comms(pdata, old_bridge_state);
 
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
 }
 

-- 
2.47.1

