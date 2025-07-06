Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B755EAFA71A
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 20:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E4A10E3C7;
	Sun,  6 Jul 2025 18:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="cOem0uTu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B7610E3C7
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Jul 2025 18:28:10 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 48D7125B63;
 Sun,  6 Jul 2025 20:28:09 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZOZ-bn7qsTrC; Sun,  6 Jul 2025 20:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1751826488; bh=rdvOHTwEYMIGYf2BU402AK0xb5Ny1TbepuIZM7PW2P8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=cOem0uTup6Eypof+O/hS+s6uh0iz+oE+q7gLJ2Kmc7FaKDLOcpiAMQYuiU0f3V8fP
 YB6gdXaq+C6gIR6gMoFtHCkRXJEJetUkuk6CpGEGkP8+dGKR+D71Z14k1dR6PQWVxC
 ZymCpQP6HIu352uVrhcfzyns201XUjYeoNv0/n06GJLJZChg6W9GPrRWc4aYO/8Tfe
 ssR4JDaeZJX47MMje77chCg+QiRHUw1rXIgriKN9cqaEEeuuUYyNX1qf5Y2JJo3Wx+
 2dyUjxObZwT7aO9kAQojBlUsA1Otlnog9qLWekLA30wJFr9FfbmldMgcpjZWAsqoRE
 6EfwiR5Pocb1g==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Sun, 06 Jul 2025 23:55:46 +0530
Subject: [PATCH v3 12/13] drm/bridge: samsung-dsim: add driver support for
 exynos7870 DSIM bridge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-exynos7870-dsim-v3-12-9879fb9a644d@disroot.org>
References: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
In-Reply-To: <20250706-exynos7870-dsim-v3-0-9879fb9a644d@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751826342; l=4847;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=rdvOHTwEYMIGYf2BU402AK0xb5Ny1TbepuIZM7PW2P8=;
 b=eocA6E3lZ1Ho6yUG9/Hdx1mmN2ceovg/v6WUkS/EpfgCDxtUipMyXURQtBjFWeNSmaI2O4Qkf
 KScS0VbdFYhBc8FzqbwqKZ/YliTzUNo+L/k4MEx5YvD89+b9UK5Jv0q
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

Add support for Exynos7870's DSIM IP block in the bridge driver.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 82 +++++++++++++++++++++++++++++++++++
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b6b3bbcbd0f438e5e1d3faf18f8c2d532a4ecc93..a51c473545f02a543b88f5b52eed6427c7313ec2 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -244,6 +244,13 @@ static struct clk_bulk_data exynos5433_clk_bulk_data[] = {
 	{ .id = "sclk_rgb_vclk_to_dsim0" },
 };
 
+static struct clk_bulk_data exynos7870_clk_bulk_data[] = {
+	{ .id = "bus" },
+	{ .id = "pll" },
+	{ .id = "byte" },
+	{ .id = "esc" },
+};
+
 enum reg_idx {
 	DSIM_STATUS_REG,	/* Status register (legacy) */
 	DSIM_LINK_STATUS_REG,	/* Link status register */
@@ -320,6 +327,32 @@ static const unsigned int exynos5433_reg_ofs[] = {
 	[DSIM_PHYTIMING2_REG] = 0xBC,
 };
 
+static const unsigned int exynos7870_reg_ofs[] = {
+	[DSIM_LINK_STATUS_REG] = 0x04,
+	[DSIM_DPHY_STATUS_REG] = 0x08,
+	[DSIM_SWRST_REG] = 0x0C,
+	[DSIM_CLKCTRL_REG] = 0x10,
+	[DSIM_TIMEOUT_REG] = 0x14,
+	[DSIM_ESCMODE_REG] = 0x1C,
+	[DSIM_MDRESOL_REG] = 0x20,
+	[DSIM_MVPORCH_REG] = 0x24,
+	[DSIM_MHPORCH_REG] = 0x28,
+	[DSIM_MSYNC_REG] = 0x2C,
+	[DSIM_CONFIG_REG] = 0x30,
+	[DSIM_INTSRC_REG] = 0x34,
+	[DSIM_INTMSK_REG] = 0x38,
+	[DSIM_PKTHDR_REG] = 0x3C,
+	[DSIM_PAYLOAD_REG] = 0x40,
+	[DSIM_RXFIFO_REG] = 0x44,
+	[DSIM_SFRCTRL_REG] = 0x48,
+	[DSIM_FIFOCTRL_REG] = 0x4C,
+	[DSIM_PLLCTRL_REG] = 0x94,
+	[DSIM_PHYCTRL_REG] = 0xA4,
+	[DSIM_PHYTIMING_REG] = 0xB4,
+	[DSIM_PHYTIMING1_REG] = 0xB8,
+	[DSIM_PHYTIMING2_REG] = 0xBC,
+};
+
 enum reg_value_idx {
 	RESET_TYPE,
 	PLL_TIMER,
@@ -392,6 +425,24 @@ static const unsigned int exynos5433_reg_values[] = {
 	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
 };
 
+static const unsigned int exynos7870_reg_values[] = {
+	[RESET_TYPE] = DSIM_SWRST,
+	[PLL_TIMER] = 80000,
+	[STOP_STATE_CNT] = 0xa,
+	[PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x177),
+	[PHYCTRL_VREG_LP] = 0,
+	[PHYCTRL_SLEW_UP] = 0,
+	[PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
+	[PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
+	[PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x08),
+	[PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2b),
+	[PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
+	[PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
+	[PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
+	[PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0f),
+	[PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
+};
+
 static const unsigned int imx8mm_dsim_reg_values[] = {
 	[RESET_TYPE] = DSIM_SWRST,
 	[PLL_TIMER] = 500,
@@ -563,6 +614,36 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.min_freq = 500,
 };
 
+static const struct samsung_dsim_driver_data exynos7870_dsi_driver_data = {
+	.reg_ofs = exynos7870_reg_ofs,
+	.plltmr_reg = 0xa0,
+	.has_clklane_stop = 1,
+	.has_sfrctrl = 1,
+	.clk_data = exynos7870_clk_bulk_data,
+	.num_clks = ARRAY_SIZE(exynos7870_clk_bulk_data),
+	.max_freq = 1500,
+	.wait_for_hdr_fifo = 0,
+	.wait_for_reset = 1,
+	.num_bits_resol = 12,
+	.video_mode_bit = 18,
+	.pll_stable_bit = 24,
+	.esc_clken_bit = 16,
+	.byte_clken_bit = 17,
+	.tx_req_hsclk_bit = 20,
+	.lane_esc_clk_bit = 8,
+	.lane_esc_data_offset = 9,
+	.pll_p_offset = 13,
+	.pll_m_offset = 3,
+	.pll_s_offset = 0,
+	.main_vsa_offset = 16,
+	.reg_values = exynos7870_reg_values,
+	.pll_fin_min = 6,
+	.pll_fin_max = 12,
+	.m_min = 41,
+	.m_max = 125,
+	.min_freq = 500,
+};
+
 static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.reg_ofs = exynos5433_reg_ofs,
 	.plltmr_reg = 0xa0,
@@ -604,6 +685,7 @@ samsung_dsim_types[DSIM_TYPE_COUNT] = {
 	[DSIM_TYPE_EXYNOS5410] = &exynos5_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5422] = &exynos5422_dsi_driver_data,
 	[DSIM_TYPE_EXYNOS5433] = &exynos5433_dsi_driver_data,
+	[DSIM_TYPE_EXYNOS7870] = &exynos7870_dsi_driver_data,
 	[DSIM_TYPE_IMX8MM] = &imx8mm_dsi_driver_data,
 	[DSIM_TYPE_IMX8MP] = &imx8mm_dsi_driver_data,
 };
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index eb9fdbab1b34074923daa0aa0443c33c5b99ae42..31d7ed589233ce560767afa1877f4cc885bf41f3 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -29,6 +29,7 @@ enum samsung_dsim_type {
 	DSIM_TYPE_EXYNOS5410,
 	DSIM_TYPE_EXYNOS5422,
 	DSIM_TYPE_EXYNOS5433,
+	DSIM_TYPE_EXYNOS7870,
 	DSIM_TYPE_IMX8MM,
 	DSIM_TYPE_IMX8MP,
 	DSIM_TYPE_COUNT,

-- 
2.49.0

