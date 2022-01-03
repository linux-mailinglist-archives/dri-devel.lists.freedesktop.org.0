Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8650D4833C7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 15:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D3F896E5;
	Mon,  3 Jan 2022 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910EF896E5
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 14:53:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A3B351F40247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641221610;
 bh=KNDgYj/v6+jaTkZ8Rn4Wl6JYx+VXECbwIobGfbzAPq8=;
 h=From:To:Cc:Subject:Date:From;
 b=oYEbArqBCFhqJwxH/ARfOTlXCfQ/p/uPDxqb6P3BYqewjJ40fkJYP/r68hPGmOAgV
 uSvfUHbxtbOX/BuZEzmaG1NrGHBYegOIeSc8s+PX3uR5/WpgsSpHiUzqlKsbG28brq
 r1vksfgTzBjyi+fCWVqE9jG3t9eGdFFBlgRPe6Yxj6eC0OBaJKtKU6Cd/+0Vi1BdLN
 uriwGnMz0DouJR/IC6dEWahIcyR2nVJfkD1MMsfcEfldYV79fagU4LgGr77Zjt5uge
 d8oRnRrSt40SXXZCpSzLn4Gm0TNvAMX+kl9TPZ4MKrqFMkBxWli5fXYbcZPxiFn3tG
 1Ih7yY10X91iA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 1/3] phy: mediatek: phy-mtk-mipi-dsi: Switch to regmap for
 mmio access
Date: Mon,  3 Jan 2022 15:53:22 +0100
Message-Id: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
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
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 45 ++++++-------
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8183.c    | 63 ++++++++++---------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c       | 43 +++++--------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h       |  6 +-
 4 files changed, 72 insertions(+), 85 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 7a847954594f..95a0d9a3cca7 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -4,6 +4,7 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/regmap.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_DSI_CON		0x00
@@ -145,7 +146,7 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_BG_CON,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_BG_CON,
 				RG_DSI_VOUT_MSK |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
 				(4 << 20) | (4 << 17) | (4 << 14) |
@@ -154,22 +155,22 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 
 	usleep_range(30, 100);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_TOP_CON,
 				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
 				(8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_CON,
+	regmap_set_bits(mipi_tx->regmap, MIPITX_DSI_CON,
 			     RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_PWR,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_PLL_PWR,
 				RG_DSI_MPPLL_SDM_PWR_ON |
 				RG_DSI_MPPLL_SDM_ISO_EN,
 				RG_DSI_MPPLL_SDM_PWR_ON);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON0,
 			       RG_DSI_MPPLL_PLL_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON0,
 				RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
 				RG_DSI_MPPLL_PREDIV,
 				(txdiv0 << 3) | (txdiv1 << 5));
@@ -184,19 +185,19 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	 */
 	pcw = div_u64(((u64)mipi_tx->data_rate * 2 * txdiv) << 24,
 		      26000000);
-	writel(pcw, mipi_tx->regs + MIPITX_DSI_PLL_CON2);
+	regmap_write(mipi_tx->regmap, MIPITX_DSI_PLL_CON2, pcw);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
+	regmap_set_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON1,
 			     RG_DSI_MPPLL_SDM_FRA_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON0, RG_DSI_MPPLL_PLL_EN);
 
 	usleep_range(20, 100);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON1,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON1,
 			       RG_DSI_MPPLL_SDM_SSC_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_TOP,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_PLL_TOP,
 				RG_DSI_MPPLL_PRESERVE,
 				mipi_tx->driver_data->mppll_preserve);
 
@@ -209,27 +210,27 @@ static void mtk_mipi_tx_pll_unprepare(struct clk_hw *hw)
 
 	dev_dbg(mipi_tx->dev, "unprepare\n");
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON0,
 			       RG_DSI_MPPLL_PLL_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_TOP,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_PLL_TOP,
 				RG_DSI_MPPLL_PRESERVE, 0);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_PWR,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_DSI_PLL_PWR,
 				RG_DSI_MPPLL_SDM_ISO_EN |
 				RG_DSI_MPPLL_SDM_PWR_ON,
 				RG_DSI_MPPLL_SDM_ISO_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_TOP_CON,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_TOP_CON,
 			       RG_DSI_LNT_HS_BIAS_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_CON,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_CON,
 			       RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_BG_CON,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_BG_CON,
 			       RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_PLL_CON0,
 			       RG_DSI_MPPLL_DIV_MSK);
 }
 
@@ -254,9 +255,9 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 
 	for (reg = MIPITX_DSI_CLOCK_LANE;
 	     reg <= MIPITX_DSI_DATA_LANE3; reg += 4)
-		mtk_mipi_tx_set_bits(mipi_tx, reg, RG_DSI_LNTx_LDOOUT_EN);
+		regmap_set_bits(mipi_tx->regmap, reg, RG_DSI_LNTx_LDOOUT_EN);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_DSI_TOP_CON,
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_DSI_TOP_CON,
 			       RG_DSI_PAD_TIE_LOW_EN);
 }
 
@@ -265,12 +266,12 @@ static void mtk_mipi_tx_power_off_signal(struct phy *phy)
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
 	u32 reg;
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_TOP_CON,
+	regmap_set_bits(mipi_tx->regmap, MIPITX_DSI_TOP_CON,
 			     RG_DSI_PAD_TIE_LOW_EN);
 
 	for (reg = MIPITX_DSI_CLOCK_LANE;
 	     reg <= MIPITX_DSI_DATA_LANE3; reg += 4)
-		mtk_mipi_tx_clear_bits(mipi_tx, reg, RG_DSI_LNTx_LDOOUT_EN);
+		regmap_clear_bits(mipi_tx->regmap, reg, RG_DSI_LNTx_LDOOUT_EN);
 }
 
 const struct mtk_mipitx_data mt2701_mipitx_data = {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 99108426d57c..01b59527669e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -4,6 +4,7 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/regmap.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_LANE_CON		0x000c
@@ -70,17 +71,17 @@ static int mtk_mipi_tx_pll_enable(struct clk_hw *hw)
 		return -EINVAL;
 	}
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_PLL_CON4, RG_DSI_PLL_IBIAS);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_PLL_CON4, RG_DSI_PLL_IBIAS);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
 	udelay(1);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
 	pcw = div_u64(((u64)mipi_tx->data_rate * txdiv) << 24, 26000000);
-	writel(pcw, mipi_tx->regs + MIPITX_PLL_CON0);
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_PLL_CON1, RG_DSI_PLL_POSDIV,
+	regmap_write(mipi_tx->regmap, MIPITX_PLL_CON0, pcw);
+	regmap_update_bits(mipi_tx->regmap, MIPITX_PLL_CON1, RG_DSI_PLL_POSDIV,
 				txdiv0 << 8);
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
 
 	return 0;
 }
@@ -89,10 +90,10 @@ static void mtk_mipi_tx_pll_disable(struct clk_hw *hw)
 {
 	struct mtk_mipi_tx *mipi_tx = mtk_mipi_tx_from_clk_hw(hw);
 
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_PLL_CON1, RG_DSI_PLL_EN);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_ISO_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_PLL_PWR, AD_DSI_PLL_SDM_PWR_ON);
 }
 
 static long mtk_mipi_tx_pll_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -121,7 +122,7 @@ static void mtk_mipi_tx_config_calibration_data(struct mtk_mipi_tx *mipi_tx)
 			mipi_tx->rt_code[i] |= 0x10 << 5;
 
 		for (j = 0; j < 10; j++)
-			mtk_mipi_tx_update_bits(mipi_tx,
+			regmap_update_bits(mipi_tx->regmap,
 				MIPITX_D2P_RTCODE * (i + 1) + j * 4,
 				1, mipi_tx->rt_code[i] >> j & 1);
 	}
@@ -132,26 +133,26 @@ static void mtk_mipi_tx_power_on_signal(struct phy *phy)
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
 
 	/* BG_LPF_EN / BG_CORE_EN */
-	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN,
-	       mipi_tx->regs + MIPITX_LANE_CON);
+	regmap_write(mipi_tx->regmap, MIPITX_LANE_CON,
+		    (RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN));
 	usleep_range(30, 100);
-	writel(RG_DSI_BG_CORE_EN | RG_DSI_BG_LPF_EN,
-	       mipi_tx->regs + MIPITX_LANE_CON);
+	regmap_write(mipi_tx->regmap, MIPITX_LANE_CON,
+		    (RG_DSI_BG_LPF_EN | RG_DSI_BG_CORE_EN));
 
 	/* Switch OFF each Lane */
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_clear_bits(mipi_tx, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_clear_bits(mipi_tx->regmap, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
 
-	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_VOLTAGE_SEL,
+	regmap_update_bits(mipi_tx->regmap, MIPITX_VOLTAGE_SEL,
 				RG_DSI_HSTX_LDO_REF_SEL,
 				(mipi_tx->mipitx_drive - 3000) / 200 << 6);
 
 	mtk_mipi_tx_config_calibration_data(mipi_tx);
 
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_CK_CKMODE_EN, DSI_CK_CKMODE_EN);
 }
 
 static void mtk_mipi_tx_power_off_signal(struct phy *phy)
@@ -159,15 +160,15 @@ static void mtk_mipi_tx_power_off_signal(struct phy *phy)
 	struct mtk_mipi_tx *mipi_tx = phy_get_drvdata(phy);
 
 	/* Switch ON each Lane */
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
-	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
-
-	writel(RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN,
-	       mipi_tx->regs + MIPITX_LANE_CON);
-	writel(RG_DSI_PAD_TIEL_SEL, mipi_tx->regs + MIPITX_LANE_CON);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_D0_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_D1_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_D2_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_D3_SW_CTL_EN, DSI_SW_CTL_EN);
+	regmap_set_bits(mipi_tx->regmap, MIPITX_CK_SW_CTL_EN, DSI_SW_CTL_EN);
+
+	regmap_write(mipi_tx->regmap, MIPITX_LANE_CON,
+		    (RG_DSI_PAD_TIEL_SEL | RG_DSI_BG_CORE_EN));
+	regmap_write(mipi_tx->regmap, MIPITX_LANE_CON, RG_DSI_PAD_TIEL_SEL);
 }
 
 const struct mtk_mipitx_data mt8183_mipitx_data = {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28ad9403c441..51b1b1d4ad38 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <linux/regmap.h>
 #include "phy-mtk-mipi-dsi.h"
 
 inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
@@ -10,30 +11,6 @@ inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
 	return container_of(hw, struct mtk_mipi_tx, pll_hw);
 }
 
-void mtk_mipi_tx_clear_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			    u32 bits)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel(temp & ~bits, mipi_tx->regs + offset);
-}
-
-void mtk_mipi_tx_set_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			  u32 bits)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel(temp | bits, mipi_tx->regs + offset);
-}
-
-void mtk_mipi_tx_update_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			     u32 mask, u32 data)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel((temp & ~mask) | (data & mask), mipi_tx->regs + offset);
-}
-
 int mtk_mipi_tx_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
@@ -126,6 +103,13 @@ static void mtk_mipi_tx_get_calibration_datal(struct mtk_mipi_tx *mipi_tx)
 	kfree(buf);
 }
 
+static const struct regmap_config mtk_mipi_tx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.disable_locking = true,
+};
+
 static int mtk_mipi_tx_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -139,6 +123,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 	};
 	struct phy *phy;
 	struct phy_provider *phy_provider;
+	void __iomem *regs;
 	int ret;
 
 	mipi_tx = devm_kzalloc(dev, sizeof(*mipi_tx), GFP_KERNEL);
@@ -147,9 +132,13 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 
 	mipi_tx->driver_data = of_device_get_match_data(dev);
 
-	mipi_tx->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mipi_tx->regs))
-		return PTR_ERR(mipi_tx->regs);
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	mipi_tx->regmap = devm_regmap_init_mmio(dev, regs, &mtk_mipi_tx_regmap_config);
+	if (IS_ERR(mipi_tx->regmap))
+		return PTR_ERR(mipi_tx->regmap);
 
 	ref_clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(ref_clk)) {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index c76f07c3fdeb..8d32e9027a15 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -27,7 +27,7 @@ struct mtk_mipitx_data {
 
 struct mtk_mipi_tx {
 	struct device *dev;
-	void __iomem *regs;
+	struct regmap *regmap;
 	u32 data_rate;
 	u32 mipitx_drive;
 	u32 rt_code[5];
@@ -37,10 +37,6 @@ struct mtk_mipi_tx {
 };
 
 struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw);
-void mtk_mipi_tx_clear_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 bits);
-void mtk_mipi_tx_set_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 bits);
-void mtk_mipi_tx_update_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 mask,
-			     u32 data);
 int mtk_mipi_tx_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate);
 unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
-- 
2.33.1

