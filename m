Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9729483439
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 16:31:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BE89C61;
	Mon,  3 Jan 2022 15:31:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7205899E9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 15:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E08201F42531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223860;
 bh=OCATAr76pxucOWHqX8fcBcrgOZAy/R1mrCCO8GiW+uY=;
 h=From:To:Cc:Subject:Date:From;
 b=kggixzlZaAY5HMlTEAQw68iKWoWdyYCyn+ZUlgGGKNJrz5c8KR4vDX1m2ed1xJn/x
 kWiPQhkN76wQgEpeVLmGjoYt/GdjIXBBvV9qBcBd/8Uo5Tj31diRaLJCqvu2ytQ/Jz
 kA2vZT4fSrLnHVs5fueI/tkub13ug0H5809sVx+3NsMZixWgoP2Hh0som2tgW9LAI4
 tbCfJuecAdxlSRqtx76ywoFDLNj2/L5G6Y/iR2tp+KGXMw/qE7Cr2f4S+9XpKtThoL
 QkOzymMYXSiATaWnyCkwPTsOcppRasR8xBIEvJXMTTnXoS7ZjvGRfZ/uZsrozFSc4V
 CdXjPVSQ8OicQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 1/4] phy: mediatek: phy-mtk-hdmi: Switch to regmap for mmio
 access
Date: Mon,  3 Jan 2022 16:30:52 +0100
Message-Id: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, matthias.bgg@gmail.com,
 vkoul@kernel.org, linux-mediatek@lists.infradead.org,
 chunfeng.yun@mediatek.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Switch to using the generic regmap API instead of calls to readl/writel
for MMIO register access, removing custom crafted update/set/clear_bits
functions and also allowing us to reduce code size.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 165 ++++++++++-----------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 126 ++++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi.c        |  51 ++-----
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   9 +-
 4 files changed, 158 insertions(+), 193 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index b74c65a1762c..09e0dd7499d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -69,19 +69,19 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 	return 0;
 }
@@ -90,19 +90,19 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
@@ -125,37 +125,34 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		pos_div = 1;
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IC),
-			  RG_HTPLL_IC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_IR),
-			  RG_HTPLL_IR_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON2, (pos_div << RG_HDMITX_TX_POSDIV),
-			  RG_HDMITX_TX_POSDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (1 << RG_HTPLL_FBKSEL),
-			  RG_HTPLL_FBKSEL_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (19 << RG_HTPLL_FBKDIV),
-			  RG_HTPLL_FBKDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON7, (0x2 << RG_HTPLL_DIVEN),
-			  RG_HTPLL_DIVEN_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0xc << RG_HTPLL_BP),
-			  RG_HTPLL_BP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x2 << RG_HTPLL_BC),
-			  RG_HTPLL_BC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, (0x1 << RG_HTPLL_BR),
-			  RG_HTPLL_BR_MASK);
-
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PRED_IMP);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, (0x3 << RG_HDMITX_PRED_IBIAS),
-			  RG_HDMITX_PRED_IBIAS_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, (0x28 << RG_HDMITX_DRV_IMP),
-			  RG_HDMITX_DRV_IMP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4, 0x28, RG_HDMITX_RESERVE_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0, (0xa << RG_HDMITX_DRV_IBIAS),
-			  RG_HDMITX_DRV_IBIAS_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_IC_MASK, BIT(RG_HTPLL_IC));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_IR_MASK, BIT(RG_HTPLL_IR));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK,
+			   (pos_div << RG_HDMITX_TX_POSDIV));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_FBKSEL_MASK,
+			   (1 << RG_HTPLL_FBKSEL));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_FBKDIV_MASK,
+			   (19 << RG_HTPLL_FBKDIV));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON7, RG_HTPLL_DIVEN_MASK,
+			   (0x2 << RG_HTPLL_DIVEN));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_BP_MASK,
+			   (0xc << RG_HTPLL_BP));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_BC_MASK,
+			   (0x2 << RG_HTPLL_BC));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_BR_MASK, BIT(RG_HTPLL_BR));
+
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PRED_IMP);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK,
+			   (0x3 << RG_HDMITX_PRED_IBIAS));
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_DRV_IMP_MASK,
+			   (0x28 << RG_HDMITX_DRV_IMP));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK,
+			   (0xa << RG_HDMITX_DRV_IBIAS));
 	return 0;
 }
 
@@ -163,10 +160,11 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
-	unsigned long out_rate, val;
+	unsigned long out_rate;
+	u32 val;
 
-	val = (readl(hdmi_phy->regs + HDMI_CON6)
-	       & RG_HTPLL_PREDIV_MASK) >> RG_HTPLL_PREDIV;
+	regmap_read(hdmi_phy->regmap, HDMI_CON6, &val);
+	val = (val & RG_HTPLL_PREDIV_MASK) >> RG_HTPLL_PREDIV;
 	switch (val) {
 	case 0x00:
 		out_rate = parent_rate;
@@ -179,14 +177,15 @@ static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
 		break;
 	}
 
-	val = (readl(hdmi_phy->regs + HDMI_CON6)
-	       & RG_HTPLL_FBKDIV_MASK) >> RG_HTPLL_FBKDIV;
+	regmap_read(hdmi_phy->regmap, HDMI_CON6, &val);
+	val = (val & RG_HTPLL_FBKDIV_MASK) >> RG_HTPLL_FBKDIV;
 	out_rate *= (val + 1) * 2;
-	val = (readl(hdmi_phy->regs + HDMI_CON2)
-	       & RG_HDMITX_TX_POSDIV_MASK);
+	regmap_read(hdmi_phy->regmap, HDMI_CON2, &val);
+	val &= RG_HDMITX_TX_POSDIV_MASK;
 	out_rate >>= (val >> RG_HDMITX_TX_POSDIV);
 
-	if (readl(hdmi_phy->regs + HDMI_CON2) & RG_HDMITX_EN_TX_POSDIV)
+	regmap_read(hdmi_phy->regmap, HDMI_CON2, &val);
+	if (val & RG_HDMITX_EN_TX_POSDIV)
 		out_rate /= 5;
 
 	return out_rate;
@@ -202,37 +201,37 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON6, RG_HTPLL_RLH_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index 6cdfdf5a698a..e317bf4a9db9 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -111,15 +111,15 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3, RG_HDMITX_MHLCK_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON3, RG_HDMITX_MHLCK_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
 
 	return 0;
 }
@@ -128,14 +128,14 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
 
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_TXDIV_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_BIAS_LPF_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_EN);
 	usleep_range(100, 150);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_BIAS_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_AUTOK_EN);
 	usleep_range(100, 150);
 }
 
@@ -177,65 +177,59 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		div = 1;
 	}
 
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (pre_div << PREDIV_SHIFT), RG_HDMITX_PLL_PREDIV);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0x1 << PLL_IC_SHIFT) | (0x1 << PLL_IR_SHIFT),
-			  RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  (div << PLL_TXDIV_SHIFT), RG_HDMITX_PLL_TXDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0x1 << PLL_FBKSEL_SHIFT) | (19 << PLL_FBKDIV_SHIFT),
-			  RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1,
-			  (0x2 << PLL_DIVEN_SHIFT), RG_HDMITX_PLL_DIVEN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0,
-			  (0xc << PLL_BP_SHIFT) | (0x2 << PLL_BC_SHIFT) |
-			  (0x1 << PLL_BR_SHIFT),
-			  RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC |
-			  RG_HDMITX_PLL_BR);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_PREDIV,
+			   (pre_div << PREDIV_SHIFT));
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON0, RG_HDMITX_PLL_POSDIV);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON0,
+			   RG_HDMITX_PLL_IC | RG_HDMITX_PLL_IR,
+			   BIT(PLL_IC_SHIFT) | BIT(PLL_IR_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_TXDIV,
+			   (div << PLL_TXDIV_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON0,
+			   RG_HDMITX_PLL_FBKSEL | RG_HDMITX_PLL_FBKDIV,
+			  BIT(PLL_FBKSEL_SHIFT) | (19 << PLL_FBKDIV_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON1, RG_HDMITX_PLL_DIVEN,
+			   (0x2 << PLL_DIVEN_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON0,
+			   RG_HDMITX_PLL_BP | RG_HDMITX_PLL_BC | RG_HDMITX_PLL_BR,
+			   (0xc << PLL_BP_SHIFT) | (0x2 << PLL_BC_SHIFT) |
+			   (0x1 << PLL_BR_SHIFT));
 	if (rate < 165000000) {
-		mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3,
+		regmap_clear_bits(hdmi_phy->regmap, HDMI_CON3,
 					RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x3;
 		imp_en = 0x0;
 		hdmi_ibias = hdmi_phy->ibias;
 	} else {
-		mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON3,
+		regmap_set_bits(hdmi_phy->regmap, HDMI_CON3,
 				      RG_HDMITX_PRD_IMP_EN);
 		pre_ibias = 0x6;
 		imp_en = 0xf;
 		hdmi_ibias = hdmi_phy->ibias_up;
 	}
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4,
-			  (pre_ibias << PRD_IBIAS_CLK_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D2_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D1_SHIFT) |
-			  (pre_ibias << PRD_IBIAS_D0_SHIFT),
-			  RG_HDMITX_PRD_IBIAS_CLK |
-			  RG_HDMITX_PRD_IBIAS_D2 |
-			  RG_HDMITX_PRD_IBIAS_D1 |
-			  RG_HDMITX_PRD_IBIAS_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON3,
-			  (imp_en << DRV_IMP_EN_SHIFT),
-			  RG_HDMITX_DRV_IMP_EN);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6,
-			  (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
-			  (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
-			  (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
-			  (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT),
-			  RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
-			  RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON5,
-			  (hdmi_ibias << DRV_IBIAS_CLK_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D2_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D1_SHIFT) |
-			  (hdmi_ibias << DRV_IBIAS_D0_SHIFT),
-			  RG_HDMITX_DRV_IBIAS_CLK |
-			  RG_HDMITX_DRV_IBIAS_D2 |
-			  RG_HDMITX_DRV_IBIAS_D1 |
-			  RG_HDMITX_DRV_IBIAS_D0);
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON4,
+			   RG_HDMITX_PRD_IBIAS_CLK | RG_HDMITX_PRD_IBIAS_D2 |
+			   RG_HDMITX_PRD_IBIAS_D1 | RG_HDMITX_PRD_IBIAS_D0,
+			   (pre_ibias << PRD_IBIAS_CLK_SHIFT) |
+			   (pre_ibias << PRD_IBIAS_D2_SHIFT) |
+			   (pre_ibias << PRD_IBIAS_D1_SHIFT) |
+			   (pre_ibias << PRD_IBIAS_D0_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON3, RG_HDMITX_DRV_IMP_EN,
+			   (imp_en << DRV_IMP_EN_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON6,
+			   RG_HDMITX_DRV_IMP_CLK | RG_HDMITX_DRV_IMP_D2 |
+			   RG_HDMITX_DRV_IMP_D1 | RG_HDMITX_DRV_IMP_D0,
+			   (hdmi_phy->drv_imp_clk << DRV_IMP_CLK_SHIFT) |
+			   (hdmi_phy->drv_imp_d2 << DRV_IMP_D2_SHIFT) |
+			   (hdmi_phy->drv_imp_d1 << DRV_IMP_D1_SHIFT) |
+			   (hdmi_phy->drv_imp_d0 << DRV_IMP_D0_SHIFT));
+	regmap_update_bits(hdmi_phy->regmap, HDMI_CON5,
+			   RG_HDMITX_DRV_IBIAS_CLK | RG_HDMITX_DRV_IBIAS_D2 |
+			   RG_HDMITX_DRV_IBIAS_D1 | RG_HDMITX_DRV_IBIAS_D0,
+			   (hdmi_ibias << DRV_IBIAS_CLK_SHIFT) |
+			   (hdmi_ibias << DRV_IBIAS_D2_SHIFT) |
+			   (hdmi_ibias << DRV_IBIAS_D1_SHIFT) |
+			   (hdmi_ibias << DRV_IBIAS_D0_SHIFT));
 	return 0;
 }
 
@@ -257,17 +251,15 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON3,
-			      RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN |
-			      RG_HDMITX_DRV_EN);
+	regmap_set_bits(hdmi_phy->regmap, HDMI_CON3,
+			RG_HDMITX_SER_EN | RG_HDMITX_PRD_EN | RG_HDMITX_DRV_EN);
 	usleep_range(100, 150);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON3,
-				RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN |
-				RG_HDMITX_SER_EN);
+	regmap_clear_bits(hdmi_phy->regmap, HDMI_CON3,
+			  RG_HDMITX_DRV_EN | RG_HDMITX_PRD_EN | RG_HDMITX_SER_EN);
 }
 
 struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf = {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 5fb4217fb8e0..707e90691e6e 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -15,39 +15,6 @@ static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.owner = THIS_MODULE,
 };
 
-void mtk_hdmi_phy_clear_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-			     u32 bits)
-{
-	void __iomem *reg = hdmi_phy->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp &= ~bits;
-	writel(tmp, reg);
-}
-
-void mtk_hdmi_phy_set_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-			   u32 bits)
-{
-	void __iomem *reg = hdmi_phy->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp |= bits;
-	writel(tmp, reg);
-}
-
-void mtk_hdmi_phy_mask(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-		       u32 val, u32 mask)
-{
-	void __iomem *reg = hdmi_phy->regs + offset;
-	u32 tmp;
-
-	tmp = readl(reg);
-	tmp = (tmp & ~mask) | (val & mask);
-	writel(tmp, reg);
-}
-
 inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
 {
 	return container_of(hw, struct mtk_hdmi_phy, pll_hw);
@@ -96,6 +63,13 @@ static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,
 	clk_init->ops = hdmi_phy->conf->hdmi_phy_clk_ops;
 }
 
+static const struct regmap_config mtk_hdmi_phy_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.disable_locking = true,
+};
+
 static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -109,15 +83,20 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 
 	struct phy *phy;
 	struct phy_provider *phy_provider;
+	void __iomem *regs;
 	int ret;
 
 	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
 	if (!hdmi_phy)
 		return -ENOMEM;
 
-	hdmi_phy->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(hdmi_phy->regs))
-		return PTR_ERR(hdmi_phy->regs);
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	hdmi_phy->regmap = devm_regmap_init_mmio(dev, regs, &mtk_hdmi_phy_regmap_config);
+	if (IS_ERR(hdmi_phy->regmap))
+		return PTR_ERR(hdmi_phy->regmap);
 
 	ref_clk = devm_clk_get(dev, "pll_ref");
 	if (IS_ERR(ref_clk)) {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index dcf9bb13699b..a0571271d730 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -15,6 +15,7 @@
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/types.h>
 
 struct mtk_hdmi_phy;
@@ -28,7 +29,7 @@ struct mtk_hdmi_phy_conf {
 };
 
 struct mtk_hdmi_phy {
-	void __iomem *regs;
+	struct regmap *regmap;
 	struct device *dev;
 	struct mtk_hdmi_phy_conf *conf;
 	struct clk *pll;
@@ -42,12 +43,6 @@ struct mtk_hdmi_phy {
 	unsigned int ibias_up;
 };
 
-void mtk_hdmi_phy_clear_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-			     u32 bits);
-void mtk_hdmi_phy_set_bits(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-			   u32 bits);
-void mtk_hdmi_phy_mask(struct mtk_hdmi_phy *hdmi_phy, u32 offset,
-		       u32 val, u32 mask);
 struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw);
 
 extern struct mtk_hdmi_phy_conf mtk_hdmi_phy_8173_conf;
-- 
2.33.1

