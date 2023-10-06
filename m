Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CA7BBB43
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:07:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8065010E50F;
	Fri,  6 Oct 2023 15:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACA510E516
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:07:20 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qomPy-00051v-7N; Fri, 06 Oct 2023 17:07:06 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 06 Oct 2023 17:07:05 +0200
Subject: [PATCH v2 3/5] drm/bridge: samsung-dsim: update PLL reference
 clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v2-3-846603df0e0a@pengutronix.de>
References: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
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
Cc: Marco Felsch <m.felsch@pengutronix.de>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PLL requires a clock frequency in a certain platform-dependent range
after the pre-divider. The reference clock for the PLL may change due to
changes to it's parent clock. Thus, the frequency may be out of range or
unsuited for generating the high speed clock for MIPI DSI.

Try to keep the pre-devider small, and set the reference clock close to
the upper limit before recalculating the PLL configuration. Use a
divider with a power of two for the reference clock as this seems to
work best in my tests.

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM + Waveshare 10.1inch HDMI LCD (E)
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

---
Changes in v2:
- Specify limits for the PLL input clock in samsung_dsim_driver_data
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++++++--
 include/drm/bridge/samsung-dsim.h     |  2 ++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 392c023c5925..16c8326d921b 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -410,6 +410,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
@@ -426,6 +428,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
@@ -440,6 +444,8 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
 	.reg_values = reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
@@ -455,6 +461,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5433_reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
@@ -470,6 +478,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
 	.reg_values = exynos5422_reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
 	.m_min = 41,
 	.m_max = 125,
 	.min_freq = 500,
@@ -489,6 +499,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 */
 	.pll_p_offset = 14,
 	.reg_values = imx8mm_dsim_reg_values,
+	.pll_fin_min = 2,
+	.pll_fin_max = 30,
 	.m_min = 64,
 	.m_max = 1023,
 	.min_freq = 1050,
@@ -612,10 +624,21 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	u16 m;
 	u32 reg;
 
-	if (dsi->pll_clk)
+	if (dsi->pll_clk) {
+		/*
+		 * Ensure that the reference clock is generated with a power of
+		 * two divider from its parent, but close to the PLLs upper
+		 * limit.
+		 */
+		fin = clk_get_rate(clk_get_parent(dsi->pll_clk));
+		while (fin > driver_data->pll_fin_max * MHZ)
+			fin /= 2;
+		clk_set_rate(dsi->pll_clk, fin);
+
 		fin = clk_get_rate(dsi->pll_clk);
-	else
+	} else {
 		fin = dsi->pll_clk_rate;
+	}
 	dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
 
 	fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 31ff88f152fb..3370f66ea80a 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -60,6 +60,8 @@ struct samsung_dsim_driver_data {
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;
 	const unsigned int *reg_values;
+	unsigned int pll_fin_min;
+	unsigned int pll_fin_max;
 	u16 m_min;
 	u16 m_max;
 };

-- 
2.39.2

