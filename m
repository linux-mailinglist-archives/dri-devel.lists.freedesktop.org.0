Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F783AC50BE
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA16C10E2AB;
	Tue, 27 May 2025 14:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3B010E2AB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:22:15 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uJvBp-00048s-7E; Tue, 27 May 2025 16:22:01 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Tue, 27 May 2025 16:21:48 +0200
Subject: [PATCH 2/2] drm/bridge: samsung-dsim: Use HZ_PER_MHZ macro from
 units.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-samsung-dsim-v1-2-5be520d84fbb@pengutronix.de>
References: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
In-Reply-To: <20250527-samsung-dsim-v1-0-5be520d84fbb@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop the custom MHZ macro and replace it with HZ_PER_MHZ.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 1dfc9710bee5134e0e0114ce52f673c21564b11b..b7fd5870eba7e4bef3f420ae7cf6de1a700eb41d 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 #include <video/mipi_display.h>
 
@@ -557,10 +558,6 @@ static void samsung_dsim_reset(struct samsung_dsim *dsi)
 	samsung_dsim_write(dsi, DSIM_SWRST_REG, reset_val);
 }
 
-#ifndef MHZ
-#define MHZ	(1000 * 1000)
-#endif
-
 static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 					       unsigned long fin,
 					       unsigned long fout,
@@ -574,8 +571,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 	u16 _m, best_m;
 	u8 _s, best_s;
 
-	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * MHZ));
-	p_max = fin / (driver_data->pll_fin_min * MHZ);
+	p_min = DIV_ROUND_UP(fin, (driver_data->pll_fin_max * HZ_PER_MHZ));
+	p_max = fin / (driver_data->pll_fin_min * HZ_PER_MHZ);
 
 	for (_p = p_min; _p <= p_max; ++_p) {
 		for (_s = 0; _s <= 5; ++_s) {
@@ -590,8 +587,8 @@ static unsigned long samsung_dsim_pll_find_pms(struct samsung_dsim *dsi,
 
 			tmp = (u64)_m * fin;
 			do_div(tmp, _p);
-			if (tmp < driver_data->min_freq  * MHZ ||
-			    tmp > driver_data->max_freq * MHZ)
+			if (tmp < driver_data->min_freq  * HZ_PER_MHZ ||
+			    tmp > driver_data->max_freq * HZ_PER_MHZ)
 				continue;
 
 			tmp = (u64)_m * fin;
@@ -634,7 +631,7 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 		 * limit.
 		 */
 		fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
-		while (fin > driver_data->pll_fin_max * MHZ)
+		while (fin > driver_data->pll_fin_max * HZ_PER_MHZ)
 			fin /= 2;
 		clk_set_rate(dsi->pll_clk, fin);
 
@@ -660,10 +657,11 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
-			100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
-			270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
-			510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
-			770 * MHZ, 870 * MHZ, 950 * MHZ,
+			100 * HZ_PER_MHZ, 120 * HZ_PER_MHZ, 160 * HZ_PER_MHZ,
+			200 * HZ_PER_MHZ, 270 * HZ_PER_MHZ, 320 * HZ_PER_MHZ,
+			390 * HZ_PER_MHZ, 450 * HZ_PER_MHZ, 510 * HZ_PER_MHZ,
+			560 * HZ_PER_MHZ, 640 * HZ_PER_MHZ, 690 * HZ_PER_MHZ,
+			770 * HZ_PER_MHZ, 870 * HZ_PER_MHZ, 950 * HZ_PER_MHZ,
 		};
 		int band;
 
@@ -723,7 +721,7 @@ static int samsung_dsim_enable_clock(struct samsung_dsim *dsi)
 	esc_div = DIV_ROUND_UP(byte_clk, dsi->esc_clk_rate);
 	esc_clk = byte_clk / esc_div;
 
-	if (esc_clk > 20 * MHZ) {
+	if (esc_clk > 20 * HZ_PER_MHZ) {
 		++esc_div;
 		esc_clk = byte_clk / esc_div;
 	}

-- 
2.39.5

