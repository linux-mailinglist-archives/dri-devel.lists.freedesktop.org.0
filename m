Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D714D69D4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4C10E66A;
	Fri, 11 Mar 2022 21:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA8510E659
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 21:03:03 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C218E837F6;
 Fri, 11 Mar 2022 22:03:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647032582;
 bh=l2H/2VGaiEHVZ4Z0n53GysKYr3gPgzxXg4K5pA3KJm0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B/qBpD38PboUVUbgs0NQpkfRKTDHVGJfYYYD1mPy53aORwTgZGw22NfapBdof8O1E
 KmAXRBjZHNNuWQ9CV+SGyoSy6HUtw4MU7tX/VUlKh1I85U/AAL8Zze8Dgh3IBrfGZM
 gDjHdWyCyzHyIz0nwQQFpVmiX7asgwCVF9L/l5gzv3Ra7YQB3/aN29zbB5zqRm3ej4
 Mwz/O0wOG0ioKanPSEgSbcfMxnm73Dgrbz+l1jrq95NEd7ivKQmnMczyQobjNlUoRp
 +Ha+AbOcBt5y5BYt5RRhVUZ9OMxH500nWZSfGJA5YZrJo6GwXPRNuOs0rW8H4ZIAIj
 4Wi+uRUC8nhGQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 06/13] drm: bridge: icn6211: Add generic DSI-to-DPI PLL
 configuration
Date: Fri, 11 Mar 2022 22:02:20 +0100
Message-Id: <20220311210227.124331-7-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311210227.124331-1-marex@denx.de>
References: <20220311210227.124331-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The chip contains fractional PLL, however the driver currently hard-codes
one specific PLL setting. Implement generic PLL parameter calculation code,
so any DPI panel with arbitrary pixel clock can be attached to this bridge.

The datasheet for this bridge is not available, the PLL behavior has been
inferred from [1] and [2] and by analyzing the DPI pixel clock with scope.
The PLL limits might be wrong, but at least the calculated values match all
the example code available. This is better than one hard-coded pixel clock
value anyway.

[1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
[2] https://github.com/tdjastrzebski/ICN6211-Configurator

Acked-by: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
V3: Add AB from Maxime
V4: - Cache mipi_dsi_device pointer in struct chipone {}, this is moved
      here from drm: "bridge: icn6211: Add I2C configuration support"
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 89 +++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index fc99dae185dbc..c838d25c96ce2 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -136,6 +136,7 @@ struct chipone {
 	struct drm_bridge bridge;
 	struct drm_display_mode mode;
 	struct drm_bridge *panel_bridge;
+	struct mipi_dsi_device *dsi;
 	struct gpio_desc *enable_gpio;
 	struct regulator *vdd1;
 	struct regulator *vdd2;
@@ -162,6 +163,87 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
 		chipone_dsi_write(icn, d, ARRAY_SIZE(d));	\
 	}
 
+static void chipone_configure_pll(struct chipone *icn,
+				  const struct drm_display_mode *mode)
+{
+	unsigned int best_p = 0, best_m = 0, best_s = 0;
+	unsigned int delta, min_delta = 0xffffffff;
+	unsigned int freq_p, freq_s, freq_out;
+	unsigned int p_min, p_max;
+	unsigned int p, m, s;
+	unsigned int fin;
+
+	/*
+	 * DSI clock lane frequency (input into PLL) is calculated as:
+	 *  DSI_CLK = mode clock * bpp / dsi_data_lanes / 2
+	 * the 2 is there because the bus is DDR.
+	 *
+	 * DPI pixel clock frequency (output from PLL) is mode clock.
+	 *
+	 * The chip contains fractional PLL which works as follows:
+	 *  DPI_CLK = ((DSI_CLK / P) * M) / S
+	 * P is pre-divider, register PLL_REF_DIV[3:0] is 2^(n+1) divider
+	 *                   register PLL_REF_DIV[4] is extra 1:2 divider
+	 * M is integer multiplier, register PLL_INT(0) is multiplier
+	 * S is post-divider, register PLL_REF_DIV[7:5] is 2^(n+1) divider
+	 *
+	 * It seems the PLL input clock after applying P pre-divider have
+	 * to be lower than 20 MHz.
+	 */
+	fin = mode->clock * mipi_dsi_pixel_format_to_bpp(icn->dsi->format) /
+	      icn->dsi_lanes / 2; /* in kHz */
+
+	/* Minimum value of P predivider for PLL input in 5..20 MHz */
+	p_min = ffs(fin / 20000);
+	p_max = (fls(fin / 5000) - 1) & 0x1f;
+
+	for (p = p_min; p < p_max; p++) {	/* PLL_REF_DIV[4,3:0] */
+		freq_p = fin / BIT(p + 1);
+		if (freq_p == 0)		/* Divider too high */
+			break;
+
+		for (s = 0; s < 0x7; s++) {	/* PLL_REF_DIV[7:5] */
+			freq_s = freq_p / BIT(s + 1);
+			if (freq_s == 0)	/* Divider too high */
+				break;
+
+			m = mode->clock / freq_s;
+
+			/* Multiplier is 8 bit */
+			if (m > 0xff)
+				continue;
+
+			/* Limit PLL VCO frequency to 1 GHz */
+			freq_out = (fin * m) / BIT(p + 1);
+			if (freq_out > 1000000)
+				continue;
+
+			/* Apply post-divider */
+			freq_out /= BIT(s + 1);
+
+			delta = abs(mode->clock - freq_out);
+			if (delta < min_delta) {
+				best_p = p;
+				best_m = m;
+				best_s = s;
+				min_delta = delta;
+			}
+		}
+	}
+
+	dev_dbg(icn->dev,
+		"PLL: P[3:0]=2^%d P[4]=2*%d M=%d S[7:5]=2^%d delta=%d => DSI f_in=%d kHz ; DPI f_out=%ld kHz\n",
+		best_p, !!best_p, best_m, best_s + 1, min_delta, fin,
+		(fin * best_m) / BIT(best_p + best_s + 2));
+
+	/* Clock source selection fixed to MIPI DSI clock lane */
+	ICN6211_DSI(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
+	ICN6211_DSI(icn, PLL_REF_DIV,
+		    (best_p ? PLL_REF_DIV_Pe : 0) | /* Prefer /2 pre-divider */
+		    PLL_REF_DIV_P(best_p) | PLL_REF_DIV_S(best_s));
+	ICN6211_DSI(icn, PLL_INT(0), best_m);
+}
+
 static void chipone_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
@@ -227,9 +309,9 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 	      ((bus_flags & DRM_BUS_FLAG_DE_HIGH) ? BIST_POL_DE_POL : 0);
 	ICN6211_DSI(icn, BIST_POL, pol);
 
-	ICN6211_DSI(icn, PLL_CTRL(6), PLL_CTRL_6_MIPI_CLK);
-	ICN6211_DSI(icn, PLL_REF_DIV, 0x71);
-	ICN6211_DSI(icn, PLL_INT(0), 0x2b);
+	/* Configure PLL settings */
+	chipone_configure_pll(icn, mode);
+
 	ICN6211_DSI(icn, SYS_CTRL(0), 0x40);
 	ICN6211_DSI(icn, SYS_CTRL(1), 0x98);
 
@@ -397,6 +479,7 @@ static int chipone_probe(struct mipi_dsi_device *dsi)
 	icn->bridge.funcs = &chipone_bridge_funcs;
 	icn->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	icn->bridge.of_node = dev->of_node;
+	icn->dsi = dsi;
 
 	drm_bridge_add(&icn->bridge);
 
-- 
2.34.1

