Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6478B4F0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 17:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D7D10E309;
	Mon, 28 Aug 2023 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E84210E306
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 15:59:13 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qaedz-0005pk-GH; Mon, 28 Aug 2023 17:59:11 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 28 Aug 2023 17:59:07 +0200
Subject: [PATCH 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v1-2-b39716db6b7a@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
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
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
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
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Michael Tretter <m.tretter@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PLL reference clock may change at runtime. Thus, reading the clock
rate during probe is not sufficient to correctly configure the PLL for
the expected hs clock.

Read the actual rate of the reference clock before calculating the PLL
configuration parameters.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6778f1751faa..da90c2038042 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -611,7 +611,12 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	u16 m;
 	u32 reg;
 
-	fin = dsi->pll_clk_rate;
+	if (dsi->pll_clk)
+		fin = clk_get_rate(dsi->pll_clk);
+	else
+		fin = dsi->pll_clk_rate;
+	dev_dbg(dsi->dev, "PLL ref clock freq %lu\n", fin);
+
 	fout = samsung_dsim_pll_find_pms(dsi, fin, freq, &p, &m, &s);
 	if (!fout) {
 		dev_err(dsi->dev,
@@ -1821,18 +1826,15 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 	u32 lane_polarities[5] = { 0 };
 	struct device_node *endpoint;
 	int i, nr_lanes, ret;
-	struct clk *pll_clk;
 
 	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
 				       &dsi->pll_clk_rate, 1);
 	/* If it doesn't exist, read it from the clock instead of failing */
 	if (ret < 0) {
 		dev_dbg(dev, "Using sclk_mipi for pll clock frequency\n");
-		pll_clk = devm_clk_get(dev, "sclk_mipi");
-		if (!IS_ERR(pll_clk))
-			dsi->pll_clk_rate = clk_get_rate(pll_clk);
-		else
-			return PTR_ERR(pll_clk);
+		dsi->pll_clk = devm_clk_get(dev, "sclk_mipi");
+		if (IS_ERR(dsi->pll_clk))
+			return PTR_ERR(dsi->pll_clk);
 	}
 
 	/* If it doesn't exist, use pixel clock instead of failing */
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 05100e91ecb9..31ff88f152fb 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -87,6 +87,7 @@ struct samsung_dsim {
 	void __iomem *reg_base;
 	struct phy *phy;
 	struct clk **clks;
+	struct clk *pll_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;
 	struct gpio_desc *te_gpio;

-- 
2.39.2

