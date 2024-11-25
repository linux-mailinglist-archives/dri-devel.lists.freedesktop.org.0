Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE9B9D87B5
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 15:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A703210E656;
	Mon, 25 Nov 2024 14:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="TSWFbGXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D026B10E661
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID;
 bh=YX5YUSgQhjndAt0sb0ENmF6XZRCGd2awE/vIbYDp+ek=; b=TSWFbGXcMccB8NduNdu8UkSdyZ
 lDSFG2a+5IAjCK7aqlohfVijKDwMfJSBQ/MedN7pyx7L2vVaRFR3f4RxV9PgKHOiqPmEn1WPGvqPQ
 IFZ3V7qCXX8Lq+R8znPFwfnAXJBXsaXr8XNdZOxqTJMSwygLA07pSFs6FtpKMvyrpbWQL2VzQEEsv
 5ZTtce8LhmAANataDOuslRHwm4gDeG964jZGUDjfDqc8My+9kcdJUBfARDTrfoztD5C2YRPxK6m1o
 xTbviSPz2PYTzz80aBLLsLa0OHzLqrL51bwLWPAeaqtDDcWork6qOlU/4AekjO1yXphEA1+wmM0uv
 iGeFItJw==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFZTB-000Ccl-Sn; Mon, 25 Nov 2024 14:49:41 +0100
Received: from [185.17.218.86] (helo=zen.localdomain)
 by sslproxy08.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFZTA-000A3a-2y;
 Mon, 25 Nov 2024 14:49:40 +0100
From: Sean Nyekjaer <sean@geanix.com>
Date: Mon, 25 Nov 2024 14:49:28 +0100
Subject: [PATCH v2 3/3] drm/stm: dsi: use drm_mode_validate_mode() helper
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, Sean Nyekjaer <sean@geanix.com>
X-Mailer: b4 0.14.2
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
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

When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
to reguire the requested and the actual px clock to be within
50Hz. A typical LVDS display requires the px clock to be within +-10%.

In case for HDMI .5% tolerance is required.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
index b20123854c4ad7b3a2cc973a26fc10fd433e8d09..7b32abe0d4f582eea1fbbacad48c84199be3fa23 100644
--- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
+++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
@@ -484,8 +484,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 	return 0;
 }
 
-#define CLK_TOLERANCE_HZ 50
-
 static enum drm_mode_status
 dw_mipi_dsi_stm_mode_valid(void *priv_data,
 			   const struct drm_display_mode *mode,
@@ -525,7 +523,7 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
 	}
 
 	if (!(mode_flags & MIPI_DSI_MODE_VIDEO_BURST)) {
-		unsigned int px_clock_hz, target_px_clock_hz, lane_mbps;
+		unsigned int px_clock_hz, lane_mbps;
 		int dsi_short_packet_size_px, hfp, hsync, hbp, delay_to_lp;
 		struct dw_mipi_dsi_dphy_timing dphy_timing;
 
@@ -533,14 +531,14 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
 		pll_out_khz = dsi_pll_get_clkout_khz(pll_in_khz, idf, ndiv, odf);
 
 		px_clock_hz = DIV_ROUND_CLOSEST_ULL(1000ULL * pll_out_khz * lanes, bpp);
-		target_px_clock_hz = mode->clock * 1000;
 		/*
 		 * Filter modes according to the clock value, particularly useful for
 		 * hdmi modes that require precise pixel clocks.
 		 */
-		if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ ||
-		    px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
-			return MODE_CLOCK_RANGE;
+
+		ret = drm_mode_validate_mode(mode, px_clock_hz);
+		if (ret)
+			return ret;
 
 		/* sync packets are codes as DSI short packets (4 bytes) */
 		dsi_short_packet_size_px = DIV_ROUND_UP(4 * BITS_PER_BYTE, bpp);

-- 
2.46.2

