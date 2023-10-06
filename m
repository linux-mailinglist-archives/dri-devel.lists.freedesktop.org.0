Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AFF7BBB41
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 17:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377DF10E518;
	Fri,  6 Oct 2023 15:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876C810E516
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 15:07:21 +0000 (UTC)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <m.tretter@pengutronix.de>)
 id 1qomPy-00051v-5B; Fri, 06 Oct 2023 17:07:06 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 06 Oct 2023 17:07:04 +0200
Subject: [PATCH v2 2/5] drm/bridge: samsung-dsim: reread ref clock before
 configuring PLL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230818-samsung-dsim-v2-2-846603df0e0a@pengutronix.de>
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

The PLL reference clock may change at runtime when its parent clock
changes. For example, this may happen on the i.MX8M Nano if the
reference clock is a child of the Video PLL. If the pixel clock changes,
this may propagate to the Video PLL and as a side effect change the
reference clock. Thus, reading the clock rate during probe is not
sufficient to correctly configure the PLL for the expected hs clock.

Read the actual rate of the reference clock before calculating the PLL
configuration parameters.

Note that the "samsung,pll-clock-frequency" is always preferred and PLL
reference clock is only read from the clock tree if that device tree
property is not set.

Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de> # Kontron BL i.MX8MM + Waveshare 10.1inch HDMI LCD (E)
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

---
Changes in v2:
- Clarify commit message
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 16 +++++++++-------
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 3e8ee9d73a72..392c023c5925 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -612,7 +612,12 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
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
@@ -1822,18 +1827,15 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
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

