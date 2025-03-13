Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D642A5F3A0
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49310E871;
	Thu, 13 Mar 2025 12:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hjhVdRqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB3D10E878
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 12:00:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1E1715C464F;
 Thu, 13 Mar 2025 11:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6304C4CEE5;
 Thu, 13 Mar 2025 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741867257;
 bh=atUu69wRsiDL2eOwFYjquYlB8EAdd7+DA+qcNypDzmQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hjhVdRqTAoNjv3jEALdiDSm/4qgv0m0lsEGbnCwNj74QdzzAEDAmRXQ+13isNdWVF
 46U9zifOogxjkHrsxS75HabcC0mNumzntjRPSm/2REM7Dn7APm0rW7W6yKROZRMtCH
 d2oid4xd0WaJux8oP/O3ScA7Z8on7OfqZEkuU8rkm15IulxdMmR7cKMahfidUSuaVy
 3pwuqSOm0gA3RCYjWyj7bMQlotkOoEP+jNlNrw8wFZO3evO54gCKwiDs9wPvzp1E7e
 bWJDVKqOnMozcr/vOoad9JDo3u9k9B8e5zxC/Iu1eG/a1Oa7m2L9gJSPNmWlEHvyJH
 1dCYZ6sCX1qxw==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 13 Mar 2025 13:00:10 +0100
Subject: [PATCH v6 16/16] drm/bridge: ti-sn65dsi86: Remove
 drm_encoder->crtc use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-bridge-connector-v6-16-511c54a604fb@kernel.org>
References: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
In-Reply-To: <20250313-bridge-connector-v6-0-511c54a604fb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8854; i=mripard@kernel.org;
 h=from:subject:message-id; bh=atUu69wRsiDL2eOwFYjquYlB8EAdd7+DA+qcNypDzmQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOmXTpwIef8uUZex7PSWa51T1h5ic97TeTfog6LuxPCIW
 IlP5mUeHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZgINwvDH47MiYs9t/OFx237
 MyfrPvctxai/h2oi8u1r0x5sNpO4c5vhf4rX28DtG7RbLoSsSSsT2OPrWrQivcSW5bzDt31n1j/
 tYQAA
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

Fortunately, the atomic hooks provide the drm_atomic_state and we can
access our current CRTC from that, going from the bridge to its encoder,
to its connector, and to its CRTC.

This bridge driver uses the atomic hooks already, but dereferences the
drm_encoder->crtc pointer in functions that don't have access to it.

Let's rework the driver to pass the state where needed, and remove the
need for the drm_encoder->crtc dereference.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 55 ++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 190929a41abd1d8d6619e27bb9391f75145ed64a..fd68ad2e27186c24cef20dd4ae20decdd6da4a2e 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -241,15 +241,30 @@ static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,
 	u8 buf[2] = { val & 0xff, val >> 8 };
 
 	regmap_bulk_write(pdata->regmap, reg, buf, ARRAY_SIZE(buf));
 }
 
-static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata)
+static struct drm_display_mode *
+get_new_adjusted_display_mode(struct drm_bridge *bridge,
+			      struct drm_atomic_state *state)
+{
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_crtc_state *crtc_state =
+		drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+
+	return &crtc_state->adjusted_mode;
+}
+
+static u32 ti_sn_bridge_get_dsi_freq(struct ti_sn65dsi86 *pdata,
+				     struct drm_atomic_state *state)
 {
 	u32 bit_rate_khz, clk_freq_khz;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		get_new_adjusted_display_mode(&pdata->bridge, state);
 
 	bit_rate_khz = mode->clock *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
 	clk_freq_khz = bit_rate_khz / (pdata->dsi->lanes * 2);
 
@@ -272,11 +287,12 @@ static const u32 ti_sn_bridge_dsiclk_lut[] = {
 	416000000,
 	486000000,
 	460800000,
 };
 
-static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata,
+					 struct drm_atomic_state *state)
 {
 	int i;
 	u32 refclk_rate;
 	const u32 *refclk_lut;
 	size_t refclk_lut_size;
@@ -285,11 +301,11 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 		refclk_rate = clk_get_rate(pdata->refclk);
 		refclk_lut = ti_sn_bridge_refclk_lut;
 		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_refclk_lut);
 		clk_prepare_enable(pdata->refclk);
 	} else {
-		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata) * 1000;
+		refclk_rate = ti_sn_bridge_get_dsi_freq(pdata, state) * 1000;
 		refclk_lut = ti_sn_bridge_dsiclk_lut;
 		refclk_lut_size = ARRAY_SIZE(ti_sn_bridge_dsiclk_lut);
 	}
 
 	/* for i equals to refclk_lut_size means default frequency */
@@ -309,16 +325,17 @@ static void ti_sn_bridge_set_refclk_freq(struct ti_sn65dsi86 *pdata)
 	 * regardless of its actual sourcing.
 	 */
 	pdata->pwm_refclk_freq = ti_sn_bridge_refclk_lut[i];
 }
 
-static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata)
+static void ti_sn65dsi86_enable_comms(struct ti_sn65dsi86 *pdata,
+				      struct drm_atomic_state *state)
 {
 	mutex_lock(&pdata->comms_mutex);
 
 	/* configure bridge ref_clk */
-	ti_sn_bridge_set_refclk_freq(pdata);
+	ti_sn_bridge_set_refclk_freq(pdata, state);
 
 	/*
 	 * HPD on this bridge chip is a bit useless.  This is an eDP bridge
 	 * so the HPD is an internal signal that's only there to signal that
 	 * the panel is done powering up.  ...but the bridge chip debounces
@@ -374,11 +391,11 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 	 * so we can do it in resume which lets us read the EDID before
 	 * pre_enable(). Without a reference clock we need the MIPI reference
 	 * clock so reading early doesn't work.
 	 */
 	if (pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+		ti_sn65dsi86_enable_comms(pdata, NULL);
 
 	return ret;
 }
 
 static int __maybe_unused ti_sn65dsi86_suspend(struct device *dev)
@@ -820,16 +837,17 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
 }
 
-static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata,
+				      struct drm_atomic_state *state)
 {
 	unsigned int bit_rate_mhz, clk_freq_mhz;
 	unsigned int val;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		get_new_adjusted_display_mode(&pdata->bridge, state);
 
 	/* set DSIA clk frequency */
 	bit_rate_mhz = (mode->clock / 1000) *
 			mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
 	clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
@@ -855,16 +873,18 @@ static unsigned int ti_sn_bridge_get_bpp(struct drm_connector *connector)
  */
 static const unsigned int ti_sn_bridge_dp_rate_lut[] = {
 	0, 1620, 2160, 2430, 2700, 3240, 4320, 5400
 };
 
-static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata, unsigned int bpp)
+static int ti_sn_bridge_calc_min_dp_rate_idx(struct ti_sn65dsi86 *pdata,
+					     struct drm_atomic_state *state,
+					     unsigned int bpp)
 {
 	unsigned int bit_rate_khz, dp_rate_mhz;
 	unsigned int i;
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		get_new_adjusted_display_mode(&pdata->bridge, state);
 
 	/* Calculate minimum bit rate based on our pixel clock. */
 	bit_rate_khz = mode->clock * bpp;
 
 	/* Calculate minimum DP data rate, taking 80% as per DP spec */
@@ -959,14 +979,15 @@ static unsigned int ti_sn_bridge_read_valid_rates(struct ti_sn65dsi86 *pdata)
 	}
 
 	return valid_rates;
 }
 
-static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
+static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata,
+					   struct drm_atomic_state *state)
 {
 	struct drm_display_mode *mode =
-		&pdata->bridge.encoder->crtc->state->adjusted_mode;
+		get_new_adjusted_display_mode(&pdata->bridge, state);
 	u8 hsync_polarity = 0, vsync_polarity = 0;
 
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		hsync_polarity = CHA_HSYNC_POLARITY;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
@@ -1104,11 +1125,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	regmap_write(pdata->regmap, SN_LN_ASSIGN_REG, pdata->ln_assign);
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, LN_POLRS_MASK,
 			   pdata->ln_polrs << LN_POLRS_OFFSET);
 
 	/* set dsi clk frequency value */
-	ti_sn_bridge_set_dsi_rate(pdata);
+	ti_sn_bridge_set_dsi_rate(pdata, state);
 
 	/*
 	 * The SN65DSI86 only supports ASSR Display Authentication method and
 	 * this method is enabled for eDP panels. An eDP panel must support this
 	 * authentication method. We need to enable this method in the eDP panel
@@ -1139,11 +1160,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 			   val);
 
 	valid_rates = ti_sn_bridge_read_valid_rates(pdata);
 
 	/* Train until we run out of rates */
-	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, bpp);
+	for (dp_rate_idx = ti_sn_bridge_calc_min_dp_rate_idx(pdata, state, bpp);
 	     dp_rate_idx < ARRAY_SIZE(ti_sn_bridge_dp_rate_lut);
 	     dp_rate_idx++) {
 		if (!(valid_rates & BIT(dp_rate_idx)))
 			continue;
 
@@ -1155,11 +1176,11 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
 		return;
 	}
 
 	/* config video parameters */
-	ti_sn_bridge_set_video_timings(pdata);
+	ti_sn_bridge_set_video_timings(pdata, state);
 
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
 }
@@ -1170,11 +1191,11 @@ static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
 	pm_runtime_get_sync(pdata->dev);
 
 	if (!pdata->refclk)
-		ti_sn65dsi86_enable_comms(pdata);
+		ti_sn65dsi86_enable_comms(pdata, state);
 
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
 }
 

-- 
2.48.1

