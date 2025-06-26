Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C1AEA6FE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A0810E905;
	Thu, 26 Jun 2025 19:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Y5SByB2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8871D10E905
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:41:20 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 69B0425AFA;
 Thu, 26 Jun 2025 21:41:19 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjfJXHmbRw_q; Thu, 26 Jun 2025 21:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750966877; bh=P+oErjB5DqPKHfm6dCIyk7UHEQ3wliClUoFgadW5LlQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Y5SByB2TanllvQh0SSyIRACVY5SW0DkhjZK1sIijBnzEZkvJd9pOLUCM+wXYnViVK
 ufyO2/UURP4j0CTXRangKvY3uMxEZQTbn1HqKKSQWYJYDW1itzvmLa9+8l5S4khRaR
 iDve2WIqbgA+kniOeyqZBh6Mckmm9Pn8knrPqm7AeHyIdo6UZ8oIj9fPRtGgtbUjKc
 9ane0aP/dpCYuzd1Lv6dN1XeiTJUQVPVGTJzIpYXZ5LEsAvlppiWH20f/PvtyYxpkc
 nyRwVKCVX5RukVd3JPaoQhP1eWjE9xTRnxId/suYb5PS9j1MTAL83+s3/99lyYM3ki
 O9dP/JFcQkdQw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:59 +0530
Subject: [PATCH v2 10/13] drm/bridge: samsung-dsim: add ability to define
 clock names for every variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-10-1433b67378d3@disroot.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
In-Reply-To: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=8047;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=P+oErjB5DqPKHfm6dCIyk7UHEQ3wliClUoFgadW5LlQ=;
 b=bSWbeHdKS1VOfTexjbgCF1GA8SKOp+N2PkBDiJTdbhJVj7PeZiKICSEFSURHh+BLgpKXwqcDM
 ncj7caPeI5lCbMFEMd9SGufW+3abdclE9fvMvlMXeKfbwfayohjinJc
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Presently, all devices refer to clock names from a single array. The
only controlling parameter is the number of clocks (num_clks field of
samsung_dsim_driver_data) which uses the first n clocks of that array.
As new devices are added, this approach turns out to be cumbersome.

Separate the clock names in individual arrays required by each variant,
in a struct clk_bulk_data. Add a pointer field to the driver data struct
which points to their respective clock names, and rework the clock usage
code to use the clk_bulk_* API instead.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 88 +++++++++++++++++------------------
 include/drm/bridge/samsung-dsim.h     |  2 +-
 2 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 5b96a5a1c78d212aca4e4fb057952927eb90f0d4..6eddaa7e3ee6cb733d005169f5573eeba2a70f0a 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -218,23 +218,31 @@
 #define DSI_XFER_TIMEOUT_MS		100
 #define DSI_RX_FIFO_EMPTY		0x30800002
 
-#define OLD_SCLK_MIPI_CLK_NAME		"pll_clk"
-
 #define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
 
-static const char *const clk_names[5] = {
-	"bus_clk",
-	"sclk_mipi",
-	"phyclk_mipidphy0_bitclkdiv8",
-	"phyclk_mipidphy0_rxclkesc0",
-	"sclk_rgb_vclk_to_dsim0"
-};
-
 enum samsung_dsim_transfer_type {
 	EXYNOS_DSI_TX,
 	EXYNOS_DSI_RX,
 };
 
+static struct clk_bulk_data exynos3_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "pll_clk" },
+};
+
+static struct clk_bulk_data exynos4_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "sclk_mipi" },
+};
+
+static struct clk_bulk_data exynos5433_clk_bulk_data[] = {
+	{ .id = "bus_clk" },
+	{ .id = "sclk_mipi" },
+	{ .id = "phyclk_mipidphy0_bitclkdiv8" },
+	{ .id = "phyclk_mipidphy0_rxclkesc0" },
+	{ .id = "sclk_rgb_vclk_to_dsim0" },
+};
+
 enum reg_idx {
 	DSIM_LINK_STATUS_REG,	/* Link status register */
 	DSIM_DPHY_STATUS_REG,	/* D-PHY status register */
@@ -407,7 +415,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -437,7 +446,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.plltmr_reg = 0x50,
 	.has_freqband = 1,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos4_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos4_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -465,7 +475,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.reg_ofs = exynos_reg_ofs,
 	.plltmr_reg = 0x58,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1000,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -493,7 +504,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
-	.num_clks = 5,
+	.clk_data = exynos5433_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos5433_clk_bulk_data),
 	.max_freq = 1500,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
@@ -521,7 +533,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos3_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos3_clk_bulk_data),
 	.max_freq = 1500,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
@@ -549,7 +562,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
 	.has_clklane_stop = 1,
-	.num_clks = 2,
+	.clk_data = exynos4_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos4_clk_bulk_data),
 	.max_freq = 2100,
 	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
@@ -2023,7 +2037,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct samsung_dsim *dsi;
-	int ret, i;
+	int ret;
 
 	dsi = devm_drm_bridge_alloc(dev, struct samsung_dsim, bridge, &samsung_dsim_bridge_funcs);
 	if (IS_ERR(dsi))
@@ -2047,23 +2061,11 @@ int samsung_dsim_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
-	dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
-				 sizeof(*dsi->clks), GFP_KERNEL);
-	if (!dsi->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < dsi->driver_data->num_clks; i++) {
-		dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
-		if (IS_ERR(dsi->clks[i])) {
-			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
-				dsi->clks[i] = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
-				if (!IS_ERR(dsi->clks[i]))
-					continue;
-			}
-
-			dev_info(dev, "failed to get the clock: %s\n", clk_names[i]);
-			return PTR_ERR(dsi->clks[i]);
-		}
+	ret = devm_clk_bulk_get(dev, dsi->driver_data->num_clks,
+				dsi->driver_data->clk_data);
+	if (ret) {
+		dev_err(dev, "failed to get clocks in bulk (%d)\n", ret);
+		return ret;
 	}
 
 	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -2136,7 +2138,7 @@ static int samsung_dsim_suspend(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
+	int ret;
 
 	usleep_range(10000, 20000);
 
@@ -2152,8 +2154,7 @@ static int samsung_dsim_suspend(struct device *dev)
 
 	phy_power_off(dsi->phy);
 
-	for (i = driver_data->num_clks - 1; i > -1; i--)
-		clk_disable_unprepare(dsi->clks[i]);
+	clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->clk_data);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0)
@@ -2166,7 +2167,7 @@ static int samsung_dsim_resume(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
-	int ret, i;
+	int ret;
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 	if (ret < 0) {
@@ -2174,11 +2175,9 @@ static int samsung_dsim_resume(struct device *dev)
 		return ret;
 	}
 
-	for (i = 0; i < driver_data->num_clks; i++) {
-		ret = clk_prepare_enable(dsi->clks[i]);
-		if (ret < 0)
-			goto err_clk;
-	}
+	ret = clk_bulk_prepare_enable(driver_data->num_clks, driver_data->clk_data);
+	if (ret < 0)
+		goto err_clk;
 
 	ret = phy_power_on(dsi->phy);
 	if (ret < 0) {
@@ -2189,8 +2188,7 @@ static int samsung_dsim_resume(struct device *dev)
 	return 0;
 
 err_clk:
-	while (--i > -1)
-		clk_disable_unprepare(dsi->clks[i]);
+	clk_bulk_disable_unprepare(driver_data->num_clks, driver_data->clk_data);
 	regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
 
 	return ret;
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index 2dd63032d83ab5df0e1780a692789c340c2126dc..ed05763b523ceab6956ed875baa9b460a3df5bbd 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -57,6 +57,7 @@ struct samsung_dsim_driver_data {
 	unsigned int has_clklane_stop:1;
 	unsigned int has_broken_fifoctrl_emptyhdr:1;
 	unsigned int has_sfrctrl:1;
+	struct clk_bulk_data *clk_data;
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
@@ -103,7 +104,6 @@ struct samsung_dsim {
 
 	void __iomem *reg_base;
 	struct phy *phy;
-	struct clk **clks;
 	struct clk *pll_clk;
 	struct regulator_bulk_data supplies[2];
 	int irq;

-- 
2.49.0

