Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B27EAEA6F1
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 21:40:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823CE10E904;
	Thu, 26 Jun 2025 19:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="Ij3dw30m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A810E904
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 19:40:44 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 1C6AE261C7;
 Thu, 26 Jun 2025 21:40:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCl5Bdgl6G49; Thu, 26 Jun 2025 21:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1750966838; bh=SZdpbmuTnNSaDkrbEB80BbAgBeO4jzpQtyMa80/qRwM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=Ij3dw30m7+jFFonLueRm454wyMM2qjAoeB4Y9UnoNHzggg9u2W8nUDeUwWIWepz2M
 LI7HLp7ipgj6E2NBZSNJReedgD+gqJVjTnz4s5uTq8T21N1Zcalw1KQBO4SA7ODdKB
 aX7cbEsEMbIOZnpzoJIFOkWdCGN53+GEzlod1KmaV1NP0PA+RpQKTHZvZKjQqOto/9
 W47A8eTfIfoS3mtU3NPbQSbgOENnHJ6YCS/5T0GFM34o0rcMF1O/tCwYl7V0LMwELu
 XYAZG4mLv80Bn/hHNqQxnAl2p1jVkj9raWtNFP2VmEJBPyvn2Fmlye85um6/5xfeEA
 YDOH9NjXHt5fg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Fri, 27 Jun 2025 01:08:56 +0530
Subject: [PATCH v2 07/13] drm/bridge: samsung-dsim: allow configuring PLL_M
 and PLL_S offsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-exynos7870-dsim-v2-7-1433b67378d3@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750966738; l=4314;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=SZdpbmuTnNSaDkrbEB80BbAgBeO4jzpQtyMa80/qRwM=;
 b=zckw0S5hIyzMT8o6FAKQftzk+8ACK0xyI1pkad/UmINSc3FPQXC7zUjA1B7+gbWmHp02boVqL
 tUMHAtp5JGbByr7WdnwzbcsrzmlDnGi2oK7AOBWBPYdFylt0QNpT/G/
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

Currently, PLL_P offset of DSIM_PLLCTRL is configurable in the driver
data, while PLL_M and PLL_S offsets are hardcoded as 4-bit and 1-bit
offsets respectively, but Exynos7870's DSIM have them at 3-bit and 0-bit
offsets as per downstream kernel sources.

In order to support both, move both offset values to the driver data
struct and define it for every driver compatible. Reference the values
from there instead, in functions wherever required.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 21 ++++++++++++++++-----
 include/drm/bridge/samsung-dsim.h     |  2 ++
 2 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0ebf0037d181ff6a4c54df1048593c97cc89f2eb..5993f8ef5d3641f69e557a79819ce0ba54762efb 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -190,9 +190,7 @@
 #define DSIM_PLL_DPDNSWAP_DAT		(1 << 24)
 #define DSIM_FREQ_BAND(x)		((x) << 24)
 #define DSIM_PLL_EN			BIT(23)
-#define DSIM_PLL_P(x, offset)		((x) << (offset))
-#define DSIM_PLL_M(x)			((x) << 4)
-#define DSIM_PLL_S(x)			((x) << 1)
+#define DSIM_PLL(x, offset)		((x) << (offset))
 
 /* DSIM_PHYCTRL */
 #define DSIM_PHYCTRL_ULPS_EXIT(x)	(((x) & 0x1ff) << 0)
@@ -422,6 +420,8 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -449,6 +449,8 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -474,6 +476,8 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = reg_values,
 	.pll_fin_min = 6,
@@ -499,6 +503,8 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5433_reg_values,
 	.pll_fin_min = 6,
@@ -524,6 +530,8 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.lane_esc_clk_bit = 19,
 	.lane_esc_data_offset = 20,
 	.pll_p_offset = 13,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = exynos5422_reg_values,
 	.pll_fin_min = 6,
@@ -553,6 +561,8 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	 * downstream driver - drivers/gpu/drm/bridge/sec-dsim.c
 	 */
 	.pll_p_offset = 14,
+	.pll_m_offset = 4,
+	.pll_s_offset = 1,
 	.main_vsa_offset = 22,
 	.reg_values = imx8mm_dsim_reg_values,
 	.pll_fin_min = 2,
@@ -708,8 +718,9 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
 	writel(driver_data->reg_values[PLL_TIMER],
 	       dsi->reg_base + driver_data->plltmr_reg);
 
-	reg = DSIM_PLL_EN | DSIM_PLL_P(p, driver_data->pll_p_offset) |
-	      DSIM_PLL_M(m) | DSIM_PLL_S(s);
+	reg = DSIM_PLL_EN | DSIM_PLL(p, driver_data->pll_p_offset)
+			  | DSIM_PLL(m, driver_data->pll_m_offset)
+			  | DSIM_PLL(s, driver_data->pll_s_offset);
 
 	if (driver_data->has_freqband) {
 		static const unsigned long freq_bands[] = {
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index f364fd2703c3644e822df30408d82cc3d6206b05..def9b4c6ef28eede8175aaa84c495c5444d0f103 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -70,6 +70,8 @@ struct samsung_dsim_driver_data {
 	unsigned int lane_esc_clk_bit;
 	unsigned int lane_esc_data_offset;
 	unsigned int pll_p_offset;
+	unsigned int pll_m_offset;
+	unsigned int pll_s_offset;
 	unsigned int main_vsa_offset;
 	const unsigned int *reg_values;
 	unsigned int pll_fin_min;

-- 
2.49.0

