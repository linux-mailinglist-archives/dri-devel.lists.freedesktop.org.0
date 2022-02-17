Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6804B94F6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 01:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722F410E691;
	Thu, 17 Feb 2022 00:25:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3FA10E68C
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 00:25:56 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5061083A6B;
 Thu, 17 Feb 2022 01:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645057554;
 bh=vnLs6sMuFebV/pVz3ky972Bt6bN4exD3XAJgtRALZ6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vjwWyLnR0CGRcUjtZjM8OeHl3PLnuu59nyudJKfx+HulN7MUN2dfTQigub8wX/5ZM
 CKC3PjPL1oXpRcvDDGwLB/2Ou09iW1m4LXS7bpC+tyUUk1iDBB4M0aIg8AXkipNRSb
 KrMdZYaHMyycjeSCaYILZu6u9Gzqf+mEtAuGsUMRoHimARIVPYgUoCifJQDbyVOw1h
 SrFKwjSurhQMku/G7YXSK6xlX/he8N2UTLrUQix4WyevJ5PEKPXRT8H0UFF1qhZPQ8
 r+q8ACKdfSVTzqwZFVEwRbNQ9D+vuR4MV/l/T2XHqRR3anZIM/rC5zN56LW+SiHKkq
 Qb4qyXrXsBDbQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 05/12] drm: bridge: icn6211: Add generic DSI-to-DPI PLL
 configuration
Date: Thu, 17 Feb 2022 01:25:23 +0100
Message-Id: <20220217002530.396563-6-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217002530.396563-1-marex@denx.de>
References: <20220217002530.396563-1-marex@denx.de>
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
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
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

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
V2: Rebase on next-20220214
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 87 +++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 7c013a08c7b00..7cc1f0d0dcdfd 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -163,6 +163,87 @@ static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
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
@@ -228,9 +309,9 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
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
 
-- 
2.34.1

