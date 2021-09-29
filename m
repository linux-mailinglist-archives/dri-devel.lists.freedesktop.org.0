Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030DD41C1ED
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 11:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F7C6EA1E;
	Wed, 29 Sep 2021 09:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C84106EA1C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 09:46:58 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x20so3156052wrg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 02:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KRSt2sfsAY9omoTYcB9wEOj27eA3B+kGhIcOMyqHRR4=;
 b=KGGeaS29B4LTC95O0JTXoa7jw+I4kWKl5NkBJjcXkfLZHQQsy/JzUxO/w0w4aBlPcT
 PsmjIGc91ATX0V2r4ISQYwG+9R6NrVYHSF4z86ZSkGd095hMrcsQfDlzwaHte18ZLToS
 De7qhdvvnZ6s75svJZXaBIPV805+w4nLo+p8/xJngyjRBawXRmdgoRMyOnl5DjR8o515
 kHLooeu9pN/SeA898UcEd6LOK+L5bgdv/mAzc/AiXbP3KGLDRFO/Bm1WiNxvxq7ifiuG
 HQNuByFupNn/5rK/Od1GQq7B00yWkCRCHfv9Wa9REUU1JccURTYyN+ixcZPBq/G8DxgM
 fLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KRSt2sfsAY9omoTYcB9wEOj27eA3B+kGhIcOMyqHRR4=;
 b=scmnq1pEqK0+iEP5hw0CGJgKBh6p2V3mWlSrvjdG6msaloALtZ1TKiua85xWdVeFaj
 QAJtUTC30WTFGNpOBl4fy5ID+nDh3aCe4YPFuRmbOiIJFRFIx2kwkG6g/KyiaF1rnUZZ
 KOiRpySJ51dtydrJagbhOOEKRNTMauj154V7qVXYstrWJCqOBuZRelVZMlgJdW2sK/lz
 Gj4Yfn+k7q9qLap1C/dVr4xyt5+I4JnsKdR+NyhZQguxPmEHwzwB14ToLnXHT3VcXO/I
 Y2UNHToeq8voJ5E45qp9oqP/ckCs+KVfzkpeBw0bWDA+0M4uCm705TBEdfE2jhq5Fw0T
 7qcg==
X-Gm-Message-State: AOAM532jLdMXYDLilqbGWCr8cBH3ZzIhY/e2GoxRrqHoIVYEVbqYpy+t
 b/zhnz6UCQMoFOXtpjJJpx0K/g==
X-Google-Smtp-Source: ABdhPJw5ixSo+EWDes3+Y6qzttQv95Y8B+ADI1wITEaFOow7mI6Ww+D3bEROchgssLSKLLwny6nJ0w==
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr5682974wrd.356.1632908817008; 
 Wed, 29 Sep 2021 02:46:57 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-2cf3-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6240:2cf3:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h7sm1751938wrx.14.2021.09.29.02.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:46:56 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/4] phy: mediatek: add support for phy-mtk-hdmi-mt8195
Date: Wed, 29 Sep 2021 11:44:24 +0200
Message-Id: <20210929094425.745-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929094425.745-1-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add basic support for the mediatek hdmi phy on MT8195 SoC

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/Makefile              |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 793 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h | 204 ++++++
 3 files changed, 998 insertions(+)
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
 create mode 100644 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h

diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
index ace660fbed3a1..8024961160ad9 100644
--- a/drivers/phy/mediatek/Makefile
+++ b/drivers/phy/mediatek/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
 phy-mtk-hdmi-drv-y			:= phy-mtk-hdmi.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt2701.o
 phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8173.o
+phy-mtk-hdmi-drv-y			+= phy-mtk-hdmi-mt8195.o
 obj-$(CONFIG_PHY_MTK_HDMI)		+= phy-mtk-hdmi-drv.o
 
 phy-mtk-mipi-dsi-drv-y			:= phy-mtk-mipi-dsi.o
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
new file mode 100644
index 0000000000000..a78ec8d83057d
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
@@ -0,0 +1,793 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre, SAS
+ */
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/nvmem-consumer.h>
+
+#include "phy-mtk-hdmi.h"
+#include "phy-mtk-hdmi-mt8195.h"
+
+static void mtk_hdmi_ana_fifo_en(struct mtk_hdmi_phy *hdmi_phy)
+{
+	/* make data fifo writable for hdmi2.0 */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_ANA_CTL, REG_ANA_HDMI20_FIFO_EN,
+			  REG_ANA_HDMI20_FIFO_EN);
+}
+
+static void
+mtk_mt8195_phy_tmds_high_bit_clk_ratio(struct mtk_hdmi_phy *hdmi_phy,
+				       bool enable)
+{
+	mtk_hdmi_ana_fifo_en(hdmi_phy);
+
+	/* HDMI 2.0 specification, 3.4Gbps <= TMDS Bit Rate <= 6G,
+	 * clock bit ratio 1:40, under 3.4Gbps, clock bit ratio 1:10
+	 */
+	if (enable)
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG,
+				  0x2 << REG_TXC_DIV_SHIFT, REG_TXC_DIV);
+	else
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI20_CLK_CFG, 0, REG_TXC_DIV);
+}
+
+static void mtk_hdmi_pll_select_source(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3, 0x0, REG_HDMITX_REF_XTAL_SEL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3, 0x0, REG_HDMITX_REF_RESPLL_SEL);
+
+	/* DA_HDMITX21_REF_CK for TXPLL input source */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10, 0x0,
+			  RG_HDMITXPLL_REF_CK_SEL);
+}
+
+static int mtk_hdmi_pll_performance_setting(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	/* BP2 */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
+			  0x1 << RG_HDMITXPLL_BP2_SHIFT, RG_HDMITXPLL_BP2);
+
+	/* BC */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x3 << RG_HDMITXPLL_BC_SHIFT, RG_HDMITXPLL_BC);
+
+	/* IC */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x1 << RG_HDMITXPLL_IC_SHIFT, RG_HDMITXPLL_IC);
+
+	/* BR */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x2 << RG_HDMITXPLL_BR_SHIFT, RG_HDMITXPLL_BR);
+
+	/* IR */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x2 << RG_HDMITXPLL_IR_SHIFT, RG_HDMITXPLL_IR);
+
+	/* BP */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0xf << RG_HDMITXPLL_BP_SHIFT, RG_HDMITXPLL_BP);
+
+	/* IBAND_FIX_EN, RESERVE[14] */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
+			  0x0 << RG_HDMITXPLL_IBAND_FIX_EN_SHIFT,
+			  RG_HDMITXPLL_IBAND_FIX_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT14);
+
+	/* HIKVCO */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x0 << RG_HDMITXPLL_HIKVCO_SHIFT,
+			  RG_HDMITXPLL_HIKVCO);
+
+	/* HREN */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
+			  0x1 << RG_HDMITXPLL_HREN_SHIFT, RG_HDMITXPLL_HREN);
+
+	/* LVR_SEL */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
+			  0x1 << RG_HDMITXPLL_LVR_SEL_SHIFT,
+			  RG_HDMITXPLL_LVR_SEL);
+
+	/* RG_HDMITXPLL_RESERVE[12:11] */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  0x3 << RG_HDMITXPLL_RESERVE_BIT12_11_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT12_11);
+
+	/* TCL_EN */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_0,
+			  0x1 << RG_HDMITXPLL_TCL_EN_SHIFT,
+			  RG_HDMITXPLL_TCL_EN);
+
+	/* disable read calibration impedance from efuse */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_1,
+			  0x1f << RG_INTR_IMP_RG_MODE_SHIFT,
+			  RG_INTR_IMP_RG_MODE);
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_set_hw(struct clk_hw *hw, unsigned char prediv,
+			       unsigned char fbkdiv_high,
+			       unsigned long fbkdiv_low,
+			       unsigned char fbkdiv_hs3, unsigned char posdiv1,
+			       unsigned char posdiv2, unsigned char txprediv,
+			       unsigned char txposdiv,
+			       unsigned char digital_div)
+{
+	unsigned char txposdiv_value = 0;
+	unsigned char div3_ctrl_value = 0;
+	unsigned char posdiv_vallue = 0;
+	unsigned char div_ctrl_value = 0;
+	unsigned char reserve_3_2_value = 0;
+	unsigned char prediv_value = 0;
+	unsigned char reserve13_value = 0;
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	mtk_hdmi_pll_select_source(hw);
+
+	mtk_hdmi_pll_performance_setting(hw);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
+			  0x2 << RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT,
+			  RG_HDMITX21_BIAS_PE_BG_VREF_SEL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
+			  0x0 << RG_HDMITX21_VREF_SEL_SHIFT,
+			  RG_HDMITX21_VREF_SEL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_9,
+			  0x2 << RG_HDMITX21_SLDO_VREF_SEL_SHIFT,
+			  RG_HDMITX21_SLDO_VREF_SEL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
+			  0x0 << RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT,
+			  RG_HDMITX21_BIAS_PE_VREF_SELB);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
+			  0x1 << RG_HDMITX21_SLDOLPF_EN_SHIFT,
+			  RG_HDMITX21_SLDOLPF_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x11 << RG_HDMITX21_INTR_CAL_SHIFT,
+			  RG_HDMITX21_INTR_CAL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x1 << RG_HDMITXPLL_PWD_SHIFT, RG_HDMITXPLL_PWD);
+
+	/* TXPOSDIV */
+	if (txposdiv == 1)
+		txposdiv_value = 0x0;
+	else if (txposdiv == 2)
+		txposdiv_value = 0x1;
+	else if (txposdiv == 4)
+		txposdiv_value = 0x2;
+	else if (txposdiv == 8)
+		txposdiv_value = 0x3;
+	else
+		return -EINVAL;
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  txposdiv_value << RG_HDMITX21_TX_POSDIV_SHIFT,
+			  RG_HDMITX21_TX_POSDIV);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
+			  RG_HDMITX21_TX_POSDIV_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_FRL_EN_SHIFT, RG_HDMITX21_FRL_EN);
+
+	/* TXPREDIV */
+	if (txprediv == 2) {
+		div3_ctrl_value = 0x0;
+		posdiv_vallue = 0x0;
+	} else if (txprediv == 4) {
+		div3_ctrl_value = 0x0;
+		posdiv_vallue = 0x1;
+	} else if (txprediv == 6) {
+		div3_ctrl_value = 0x1;
+		posdiv_vallue = 0x0;
+	} else if (txprediv == 12) {
+		div3_ctrl_value = 0x1;
+		posdiv_vallue = 0x1;
+	} else {
+		return -EINVAL;
+	}
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  div3_ctrl_value
+				  << RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT,
+			  RG_HDMITXPLL_POSDIV_DIV3_CTRL);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  posdiv_vallue << RG_HDMITXPLL_POSDIV_SHIFT,
+			  RG_HDMITXPLL_POSDIV);
+
+	/* POSDIV1 */
+	if (posdiv1 == 5)
+		div_ctrl_value = 0x0;
+	else if (posdiv1 == 10)
+		div_ctrl_value = 0x1;
+	else if (posdiv1 == (125 / 10))
+		div_ctrl_value = 0x2;
+	else if (posdiv1 == 15)
+		div_ctrl_value = 0x3;
+	else
+		return -EINVAL;
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  div_ctrl_value << RG_HDMITXPLL_DIV_CTRL_SHIFT,
+			  RG_HDMITXPLL_DIV_CTRL);
+
+	/* DE add new setting */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  0x0 << RG_HDMITXPLL_RESERVE_BIT14_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT14);
+
+	/* POSDIV2 */
+	if (posdiv2 == 1)
+		reserve_3_2_value = 0x0;
+	else if (posdiv2 == 2)
+		reserve_3_2_value = 0x1;
+	else if (posdiv2 == 4)
+		reserve_3_2_value = 0x2;
+	else if (posdiv2 == 6)
+		reserve_3_2_value = 0x3;
+	else
+		return -EINVAL;
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  reserve_3_2_value
+				  << RG_HDMITXPLL_RESERVE_BIT3_2_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT3_2);
+
+	/* DE add new setting */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  0x2 << RG_HDMITXPLL_RESERVE_BIT1_0_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT1_0);
+
+	/* PREDIV */
+	if (prediv == 1)
+		prediv_value = 0x0;
+	else if (prediv == 2)
+		prediv_value = 0x1;
+	else if (prediv == 4)
+		prediv_value = 0x2;
+	else
+		return -EINVAL;
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  prediv_value << RG_HDMITXPLL_PREDIV_SHIFT,
+			  RG_HDMITXPLL_PREDIV);
+
+	/* FBKDIV_HS3 */
+	if (fbkdiv_hs3 == 1)
+		reserve13_value = 0x0;
+	else if (fbkdiv_hs3 == 2)
+		reserve13_value = 0x1;
+	else
+		return -EINVAL;
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_1,
+			  reserve13_value << RG_HDMITXPLL_RESERVE_BIT13_SHIFT,
+			  RG_HDMITXPLL_RESERVE_BIT13);
+
+	/* FBDIV */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  fbkdiv_high << RG_HDMITXPLL_FBKDIV_high_SHIFT,
+			  RG_HDMITXPLL_FBKDIV_HIGH);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_3,
+			  fbkdiv_low << RG_HDMITXPLL_FBKDIV_low_SHIFT,
+			  RG_HDMITXPLL_FBKDIV_low);
+
+	/* Digital DIVIDER */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
+			  0x0 << REG_PIXEL_CLOCK_SEL_SHIFT,
+			  REG_PIXEL_CLOCK_SEL);
+
+	if (digital_div == 1) {
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
+				  0x0 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
+				  REG_HDMITX_PIXEL_CLOCK);
+	} else {
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
+				  0x1 << REG_HDMITX_PIXEL_CLOCK_SHIFT,
+				  REG_HDMITX_PIXEL_CLOCK);
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_CTL_3,
+				  (digital_div - 1) << REG_HDMITXPLL_DIV_SHIFT,
+				  REG_HDMITXPLL_DIV);
+	}
+
+	return 0;
+}
+
+#define PCW_DECIMAL_WIDTH 24
+
+static int mtk_hdmi_pll_calculate_params(struct clk_hw *hw, unsigned long rate,
+					 unsigned long parent_rate)
+{
+	int ret;
+	unsigned long long tmds_clk = 0;
+	unsigned long long pixel_clk = 0;
+	//pll input source frequency
+	unsigned long long da_hdmitx21_ref_ck = 0;
+	unsigned long long ns_hdmipll_ck = 0; //ICO output clk
+	//source clk for Display digital
+	unsigned long long ad_hdmipll_pixel_ck = 0;
+	unsigned char digital_div = 0;
+	unsigned long long pcw = 0; //FBDIV
+	unsigned char txprediv = 0;
+	unsigned char txposdiv = 0;
+	unsigned char fbkdiv_high = 0;
+	unsigned long fbkdiv_low = 0;
+	unsigned char posdiv1 = 0;
+	unsigned char posdiv2 = 0;
+	unsigned char prediv = 1; //prediv is always 1
+	unsigned char fbkdiv_hs3 = 1; //fbkdiv_hs3 is always 1
+	int i = 0;
+	unsigned char txpredivs[4] = { 2, 4, 6, 12 };
+
+	pixel_clk = rate;
+	tmds_clk = pixel_clk;
+
+	if ((tmds_clk < 25000000) || (tmds_clk > 594000000))
+		return -EINVAL;
+
+	da_hdmitx21_ref_ck = 26000000UL; //in HZ
+
+	/*  TXPOSDIV stage treatment:
+	 *	0M  <  TMDS clk  < 54M		  /8
+	 *	54M <= TMDS clk  < 148.35M    /4
+	 *	148.35M <=TMDS clk < 296.7M   /2
+	 *	296.7 <=TMDS clk <= 594M	  /1
+	 */
+	if (tmds_clk < 54000000UL)
+		txposdiv = 8;
+	else if (tmds_clk >= 54000000UL && tmds_clk < 148350000UL)
+		txposdiv = 4;
+	else if (tmds_clk >= 148350000UL && tmds_clk < 296700000UL)
+		txposdiv = 2;
+	else if (tmds_clk >= 296700000UL && tmds_clk <= 594000000UL)
+		txposdiv = 1;
+	else
+		return -EINVAL;
+
+	/* calculate txprediv: can be 2, 4, 6, 12
+	 * ICO clk = 5*TMDS_CLK*TXPOSDIV*TXPREDIV
+	 * ICO clk constraint: 5G =< ICO clk <= 12G
+	 */
+	for (i = 0; i < ARRAY_SIZE(txpredivs); i++) {
+		ns_hdmipll_ck = 5 * tmds_clk * txposdiv * txpredivs[i];
+		if (ns_hdmipll_ck >= 5000000000UL &&
+		    ns_hdmipll_ck <= 12000000000UL)
+			break;
+	}
+	if (i == (ARRAY_SIZE(txpredivs) - 1) &&
+	    (ns_hdmipll_ck < 5000000000UL || ns_hdmipll_ck > 12000000000UL)) {
+		return -EINVAL;
+	}
+	if (i == ARRAY_SIZE(txpredivs))
+		return -EINVAL;
+
+	txprediv = txpredivs[i];
+
+	/* PCW calculation: FBKDIV
+	 * formula: pcw=(frequency_out*2^pcw_bit) / frequency_in / FBKDIV_HS3;
+	 * RG_HDMITXPLL_FBKDIV[32:0]:
+	 * [32,24] 9bit integer, [23,0]:24bit fraction
+	 */
+	pcw = ns_hdmipll_ck;
+	pcw = pcw << PCW_DECIMAL_WIDTH;
+	pcw = pcw / da_hdmitx21_ref_ck;
+	pcw = pcw / fbkdiv_hs3;
+
+	if ((pcw / BIT(32)) > 1) {
+		return -EINVAL;
+	} else if ((pcw / BIT(32)) == 1) {
+		fbkdiv_high = 1;
+		fbkdiv_low = pcw % BIT(32);
+	} else {
+		fbkdiv_high = 0;
+		fbkdiv_low = pcw;
+	}
+
+	/* posdiv1:
+	 * posdiv1 stage treatment according to color_depth:
+	 * 24bit -> posdiv1 /10, 30bit -> posdiv1 /12.5,
+	 * 36bit -> posdiv1 /15, 48bit -> posdiv1 /10
+	 */
+	posdiv1 = 10; // div 10
+	posdiv2 = 1;
+	ad_hdmipll_pixel_ck = (ns_hdmipll_ck / 10) / 1;
+
+	/* Digital clk divider, max /32 */
+	digital_div = ad_hdmipll_pixel_ck / pixel_clk;
+	if (!(digital_div <= 32 && digital_div >= 1))
+		return -EINVAL;
+
+	ret = mtk_hdmi_pll_set_hw(hw, prediv, fbkdiv_high, fbkdiv_low,
+				  fbkdiv_hs3, posdiv1, posdiv2, txprediv,
+				  txposdiv, digital_div);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
+{
+	unsigned char data_channel_bias, clk_channel_bias;
+	unsigned char impedance, impedance_en;
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	unsigned long tmds_clk;
+	unsigned long pixel_clk = hdmi_phy->pll_rate;
+
+	tmds_clk = pixel_clk;
+
+	/* bias & impedance setting:
+	 * 3G < data rate <= 6G: enable impedance 100ohm,
+	 *      data channel bias 24mA, clock channel bias 20mA
+	 * pixel clk >= HD,  74.175MHZ <= pixel clk <= 300MHZ:
+	 *      enalbe impedance 100ohm
+	 *      data channel 20mA, clock channel 16mA
+	 * 27M =< pixel clk < 74.175: disable impedance
+	 *      data channel & clock channel bias 10mA
+	 */
+
+	/* 3G < data rate <= 6G, 300M < tmds rate <= 594M */
+	if (tmds_clk > 300000000UL && tmds_clk <= 594000000UL) {
+		data_channel_bias = 0x3c; //24mA
+		clk_channel_bias = 0x34; //20mA
+		impedance_en = 0xf;
+		impedance = 0x36; //100ohm
+	} else if (pixel_clk >= 74175000UL && pixel_clk <= 300000000UL) {
+		data_channel_bias = 0x34; //20mA
+		clk_channel_bias = 0x2c; //16mA
+		impedance_en = 0xf;
+		impedance = 0x36; //100ohm
+	} else if (pixel_clk >= 27000000UL && pixel_clk < 74175000UL) {
+		data_channel_bias = 0x14; //10mA
+		clk_channel_bias = 0x14; //10mA
+		impedance_en = 0x0;
+		impedance = 0x0;
+	} else {
+		return -EINVAL;
+	}
+
+	/* bias */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
+			  data_channel_bias << RG_HDMITX21_DRV_IBIAS_D0_SHIFT,
+			  RG_HDMITX21_DRV_IBIAS_D0);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
+			  data_channel_bias << RG_HDMITX21_DRV_IBIAS_D1_SHIFT,
+			  RG_HDMITX21_DRV_IBIAS_D1);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_1,
+			  data_channel_bias << RG_HDMITX21_DRV_IBIAS_D2_SHIFT,
+			  RG_HDMITX21_DRV_IBIAS_D2);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
+			  clk_channel_bias << RG_HDMITX21_DRV_IBIAS_CLK_SHIFT,
+			  RG_HDMITX21_DRV_IBIAS_CLK);
+
+	/* impedance */
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
+			  impedance_en << RG_HDMITX21_DRV_IMP_EN_SHIFT,
+			  RG_HDMITX21_DRV_IMP_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
+			  impedance << RG_HDMITX21_DRV_IMP_D0_EN1_SHIFT,
+			  RG_HDMITX21_DRV_IMP_D0_EN1);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
+			  impedance << RG_HDMITX21_DRV_IMP_D1_EN1_SHIFT,
+			  RG_HDMITX21_DRV_IMP_D1_EN1);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
+			  impedance << RG_HDMITX21_DRV_IMP_D2_EN1_SHIFT,
+			  RG_HDMITX21_DRV_IMP_D2_EN1);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_2,
+			  impedance << RG_HDMITX21_DRV_IMP_CLK_EN1_SHIFT,
+			  RG_HDMITX21_DRV_IMP_CLK_EN1);
+
+	return 0;
+}
+
+static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_TX_POSDIV_EN_SHIFT,
+			  RG_HDMITX21_TX_POSDIV_EN);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
+			  0xf << RG_HDMITX21_SER_EN_SHIFT, RG_HDMITX21_SER_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_D0_DRV_OP_EN_SHIFT,
+			  RG_HDMITX21_D0_DRV_OP_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_D1_DRV_OP_EN_SHIFT,
+			  RG_HDMITX21_D1_DRV_OP_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_D2_DRV_OP_EN_SHIFT,
+			  RG_HDMITX21_D2_DRV_OP_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_CK_DRV_OP_EN_SHIFT,
+			  RG_HDMITX21_CK_DRV_OP_EN);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_FRL_D0_EN_SHIFT,
+			  RG_HDMITX21_FRL_D0_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_FRL_D1_EN_SHIFT,
+			  RG_HDMITX21_FRL_D1_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_FRL_D2_EN_SHIFT,
+			  RG_HDMITX21_FRL_D2_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_FRL_CK_EN_SHIFT,
+			  RG_HDMITX21_FRL_CK_EN);
+
+	mtk_hdmi_pll_drv_setting(hw);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
+			  0x0 << RG_HDMITX21_BG_PWD_SHIFT, RG_HDMITX21_BG_PWD);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x1 << RG_HDMITX21_BIAS_EN_SHIFT,
+			  RG_HDMITX21_BIAS_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
+			  0x1 << RG_HDMITX21_CKLDO_EN_SHIFT,
+			  RG_HDMITX21_CKLDO_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
+			  0xf << RG_HDMITX21_SLDO_EN_SHIFT,
+			  RG_HDMITX21_SLDO_EN);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  0x1 << DA_HDMITXPLL_PWR_ON_SHIFT,
+			  DA_HDMITXPLL_PWR_ON);
+	usleep_range(5, 10);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  0x0 << DA_HDMITXPLL_ISO_EN_SHIFT,
+			  DA_HDMITXPLL_ISO_EN);
+	usleep_range(5, 10);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x0 << RG_HDMITXPLL_PWD_SHIFT, RG_HDMITXPLL_PWD);
+	usleep_range(30, 50);
+	return 0;
+}
+
+static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_10,
+			  0x1 << RG_HDMITX21_BG_PWD_SHIFT, RG_HDMITX21_BG_PWD);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_6,
+			  0x0 << RG_HDMITX21_BIAS_EN_SHIFT,
+			  RG_HDMITX21_BIAS_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
+			  0x0 << RG_HDMITX21_CKLDO_EN_SHIFT,
+			  RG_HDMITX21_CKLDO_EN);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_3,
+			  0x0 << RG_HDMITX21_SLDO_EN_SHIFT,
+			  RG_HDMITX21_SLDO_EN);
+
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_2,
+			  0x1 << RG_HDMITXPLL_PWD_SHIFT, RG_HDMITXPLL_PWD);
+	usleep_range(10, 20);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  0x1 << DA_HDMITXPLL_ISO_EN_SHIFT,
+			  DA_HDMITXPLL_ISO_EN);
+	usleep_range(10, 20);
+	mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_PLL_CFG_4,
+			  0x0 << DA_HDMITXPLL_PWR_ON_SHIFT,
+			  DA_HDMITXPLL_PWR_ON);
+}
+
+static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	int ret;
+
+	dev_dbg(hdmi_phy->dev, "%s: %lu Hz, parent: %lu Hz\n", __func__, rate,
+		parent_rate);
+
+	ret = mtk_hdmi_pll_calculate_params(hw, rate, parent_rate);
+	if (ret != 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	hdmi_phy->pll_rate = rate;
+	return rate;
+}
+
+static unsigned long mtk_hdmi_pll_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+
+	return hdmi_phy->pll_rate;
+}
+
+static const struct clk_ops mtk_hdmi_pll_ops = {
+	.prepare = mtk_hdmi_pll_prepare,
+	.unprepare = mtk_hdmi_pll_unprepare,
+	.set_rate = mtk_hdmi_pll_set_rate,
+	.round_rate = mtk_hdmi_pll_round_rate,
+	.recalc_rate = mtk_hdmi_pll_recalc_rate,
+};
+
+static void vtx_signal_en(struct mtk_hdmi_phy *hdmi_phy, bool on)
+{
+	if (on)
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0, RG_HDMITX21_DRV_EN,
+				  RG_HDMITX21_DRV_EN);
+	else
+		mtk_hdmi_phy_mask(hdmi_phy, HDMI_1_CFG_0,
+				  0x0 << RG_HDMITX21_DRV_EN_SHIFT,
+				  RG_HDMITX21_DRV_EN);
+}
+
+static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
+{
+	vtx_signal_en(hdmi_phy, true);
+	usleep_range(100, 150);
+}
+
+static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
+{
+	vtx_signal_en(hdmi_phy, false);
+}
+
+static int mtk_hdmi_phy_power_on(struct phy *phy)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret;
+
+	ret = clk_prepare_enable(hdmi_phy->pll);
+	if (ret < 0)
+		return ret;
+	usleep_range(10, 20);
+	mtk_hdmi_phy_enable_tmds(hdmi_phy);
+
+	return 0;
+}
+
+static int mtk_hdmi_phy_power_off(struct phy *phy)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	mtk_hdmi_phy_disable_tmds(hdmi_phy);
+	usleep_range(10, 20);
+	clk_disable_unprepare(hdmi_phy->pll);
+
+	return 0;
+}
+
+int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+	int ret = 0;
+	bool enable = 0;
+
+	ret = clk_set_rate(hdmi_phy->pll, dp_opts->link_rate);
+
+	if (ret)
+		goto out;
+
+	mtk_mt8195_phy_tmds_high_bit_clk_ratio(hdmi_phy, enable);
+
+out:
+	return ret;
+}
+
+static const struct phy_ops mtk_hdmi_phy_ops = {
+	.power_on = mtk_hdmi_phy_power_on,
+	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
+	.owner = THIS_MODULE,
+};
+
+static int mtk_hdmi_phy_get_all_clk(struct mtk_hdmi_phy *hdmi_phy,
+				    struct device *dev)
+{
+	int ret;
+	const char *ref_clk_name;
+	struct clk *xtal_sel;
+	struct clk_init_data clk_init = {
+		.ops = &mtk_hdmi_pll_ops,
+		.num_parents = 1,
+		.parent_names = (const char *const *)&ref_clk_name,
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
+	};
+
+	xtal_sel = of_clk_get_by_name(dev->of_node, "hdmi_xtal_sel");
+
+	if (IS_ERR(xtal_sel))
+		return PTR_ERR(xtal_sel);
+
+	ref_clk_name = __clk_get_name(xtal_sel);
+
+	ret = of_property_read_string(dev->of_node, "clock-output-names",
+				      &clk_init.name);
+	if (ret < 0)
+		return ret;
+
+	hdmi_phy->pll_hw.init = &clk_init;
+	hdmi_phy->pll = devm_clk_register(dev, &hdmi_phy->pll_hw);
+	if (IS_ERR(hdmi_phy->pll)) {
+		ret = PTR_ERR(hdmi_phy->pll);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_hdmi_phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_hdmi_phy *hdmi_phy;
+	struct resource *mem;
+	struct phy *phy;
+	struct phy_provider *phy_provider;
+	int ret;
+
+	hdmi_phy = devm_kzalloc(dev, sizeof(*hdmi_phy), GFP_KERNEL);
+	if (!hdmi_phy)
+		return -ENOMEM;
+
+	ret = mtk_hdmi_phy_get_all_clk(hdmi_phy, dev);
+	if (ret)
+		return ret;
+
+	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	hdmi_phy->regs = devm_ioremap_resource(dev, mem);
+	if (IS_ERR(hdmi_phy->regs)) {
+		ret = PTR_ERR(hdmi_phy->regs);
+		return ret;
+	}
+
+	phy = devm_phy_create(dev, NULL, &mtk_hdmi_phy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy_set_drvdata(phy, hdmi_phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	hdmi_phy->dev = dev;
+
+	return of_clk_add_provider(dev->of_node, of_clk_src_simple_get,
+				   hdmi_phy->pll);
+}
+
+static const struct of_device_id mtk_hdmi_phy_match[] = {
+	{
+		.compatible = "mediatek,mt8195-hdmi-phy",
+	},
+	{},
+};
+
+struct platform_driver mtk_hdmi_mt8195_phy_driver = {
+	.probe = mtk_hdmi_phy_probe,
+	.driver = {
+		.name = "mediatek-hdmi-phy-mt8195",
+		.of_match_table = mtk_hdmi_phy_match,
+	},
+};
+module_platform_driver(mtk_hdmi_mt8195_phy_driver);
+
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek MT8195 HDMI PHY Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
new file mode 100644
index 0000000000000..3cc51d8a18a41
--- /dev/null
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h
@@ -0,0 +1,204 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2021 BayLibre, SAS
+ */
+
+#ifndef _MTK_HDMI_PHY_8195_H
+#define _MTK_HDMI_PHY_8195_H
+
+#include <linux/types.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+
+#define DA_HDMITXPLL_ISO_EN BIT(1)
+#define DA_HDMITXPLL_ISO_EN_SHIFT (1)
+#define DA_HDMITXPLL_PWR_ON BIT(2)
+#define DA_HDMITXPLL_PWR_ON_SHIFT (2)
+
+#define HDMI20_CLK_CFG 0x70
+
+#define HDMI_1_CFG_0 0x00
+#define HDMI_1_CFG_1 0x04
+#define HDMI_1_CFG_10 0x40
+#define HDMI_1_CFG_2 0x08
+#define HDMI_1_CFG_21 0x84
+#define HDMI_1_CFG_22 0x88
+#define HDMI_1_CFG_3 0x0c
+#define HDMI_1_CFG_6 0x18
+#define HDMI_1_CFG_9 0x24
+#define HDMI_1_PLL_CFG_0 0x44
+#define HDMI_1_PLL_CFG_1 0x48
+#define HDMI_1_PLL_CFG_2 0x4c
+#define HDMI_1_PLL_CFG_3 0x50
+#define HDMI_1_PLL_CFG_4 0x54
+
+#define HDMI_ANA_CTL 0x7c
+
+#define HDMI_CTL_1 0xc4
+#define HDMI_CTL_3 0xcc
+
+#define REG_ANA_HDMI20_FIFO_EN BIT(16)
+
+#define REG_HDMITXPLL_DIV GENMASK(4, 0)
+#define REG_HDMITXPLL_DIV_SHIFT (0)
+#define REG_HDMITX_PIXEL_CLOCK BIT(23)
+#define REG_HDMITX_PIXEL_CLOCK_SHIFT (23)
+#define REG_HDMITX_REF_RESPLL_SEL BIT(9)
+#define REG_HDMITX_REF_RESPLL_SEL_SHIFT (9)
+#define REG_HDMITX_REF_XTAL_SEL BIT(7)
+#define REG_HDMITX_REF_XTAL_SEL_SHIFT (7)
+
+#define REG_PIXEL_CLOCK_SEL BIT(10)
+#define REG_PIXEL_CLOCK_SEL_SHIFT (10)
+
+#define REG_TXC_DIV GENMASK(31, 30)
+#define REG_TXC_DIV_SHIFT (30)
+
+#define RG_HDMITX21_BG_PWD BIT(20)
+#define RG_HDMITX21_BG_PWD_SHIFT (20)
+
+#define RG_HDMITX21_BIAS_EN BIT(29)
+#define RG_HDMITX21_BIAS_EN_SHIFT (29)
+#define RG_HDMITX21_BIAS_PE_BG_VREF_SEL GENMASK(16, 15)
+#define RG_HDMITX21_BIAS_PE_BG_VREF_SEL_SHIFT (15)
+#define RG_HDMITX21_BIAS_PE_VREF_SELB GENMASK(10, 10)
+#define RG_HDMITX21_BIAS_PE_VREF_SELB_SHIFT (10)
+
+#define RG_HDMITX21_CKLDO_EN BIT(3)
+#define RG_HDMITX21_CKLDO_EN_SHIFT (3)
+
+#define RG_HDMITX21_CK_DRV_OP_EN BIT(11)
+#define RG_HDMITX21_CK_DRV_OP_EN_SHIFT (11)
+
+#define RG_HDMITX21_D0_DRV_OP_EN BIT(10)
+#define RG_HDMITX21_D0_DRV_OP_EN_SHIFT (10)
+
+#define RG_HDMITX21_D1_DRV_OP_EN BIT(9)
+#define RG_HDMITX21_D1_DRV_OP_EN_SHIFT (9)
+
+#define RG_HDMITX21_D2_DRV_OP_EN BIT(8)
+#define RG_HDMITX21_D2_DRV_OP_EN_SHIFT (8)
+
+#define RG_HDMITX21_DRV_EN GENMASK(27, 24)
+#define RG_HDMITX21_DRV_EN_SHIFT (24)
+#define RG_HDMITX21_DRV_IBIAS_CLK GENMASK(10, 5)
+#define RG_HDMITX21_DRV_IBIAS_CLK_SHIFT (5)
+#define RG_HDMITX21_DRV_IBIAS_D0 GENMASK(19, 14)
+#define RG_HDMITX21_DRV_IBIAS_D0_FFE1 GENMASK(21, 17)
+#define RG_HDMITX21_DRV_IBIAS_D0_FFE1_SHIFT (17)
+#define RG_HDMITX21_DRV_IBIAS_D0_FFE2 GENMASK(23, 20)
+#define RG_HDMITX21_DRV_IBIAS_D0_FFE2_SHIFT (20)
+#define RG_HDMITX21_DRV_IBIAS_D0_SHIFT (14)
+#define RG_HDMITX21_DRV_IBIAS_D1 GENMASK(25, 20)
+#define RG_HDMITX21_DRV_IBIAS_D1_FFE1 GENMASK(26, 22)
+#define RG_HDMITX21_DRV_IBIAS_D1_FFE1_SHIFT (22)
+#define RG_HDMITX21_DRV_IBIAS_D1_FFE2 GENMASK(27, 24)
+#define RG_HDMITX21_DRV_IBIAS_D1_FFE2_SHIFT (24)
+#define RG_HDMITX21_DRV_IBIAS_D1_SHIFT (20)
+#define RG_HDMITX21_DRV_IBIAS_D2 GENMASK(31, 26)
+#define RG_HDMITX21_DRV_IBIAS_D2_FFE1 GENMASK(31, 27)
+#define RG_HDMITX21_DRV_IBIAS_D2_FFE1_SHIFT (27)
+#define RG_HDMITX21_DRV_IBIAS_D2_FFE2 GENMASK(31, 28)
+#define RG_HDMITX21_DRV_IBIAS_D2_FFE2_SHIFT (28)
+#define RG_HDMITX21_DRV_IBIAS_D2_SHIFT (26)
+#define RG_HDMITX21_DRV_IMP_CLK_EN1 GENMASK(31, 26)
+#define RG_HDMITX21_DRV_IMP_CLK_EN1_SHIFT (26)
+#define RG_HDMITX21_DRV_IMP_D0_EN1 GENMASK(13, 8)
+#define RG_HDMITX21_DRV_IMP_D0_EN1_SHIFT (8)
+#define RG_HDMITX21_DRV_IMP_D1_EN1 GENMASK(19, 14)
+#define RG_HDMITX21_DRV_IMP_D1_EN1_SHIFT (14)
+#define RG_HDMITX21_DRV_IMP_D2_EN1 GENMASK(25, 20)
+#define RG_HDMITX21_DRV_IMP_D2_EN1_SHIFT (20)
+#define RG_HDMITX21_DRV_IMP_EN GENMASK(23, 20)
+#define RG_HDMITX21_DRV_IMP_EN_SHIFT (20)
+
+#define RG_HDMITX21_FRL_CK_EN BIT(13)
+#define RG_HDMITX21_FRL_CK_EN_SHIFT (13)
+#define RG_HDMITX21_FRL_D0_EN BIT(14)
+#define RG_HDMITX21_FRL_D0_EN_SHIFT (14)
+#define RG_HDMITX21_FRL_D1_EN BIT(15)
+#define RG_HDMITX21_FRL_D1_EN_SHIFT (15)
+#define RG_HDMITX21_FRL_D2_EN BIT(16)
+#define RG_HDMITX21_FRL_D2_EN_SHIFT (16)
+#define RG_HDMITX21_FRL_EN BIT(12)
+#define RG_HDMITX21_FRL_EN_SHIFT (12)
+
+#define RG_HDMITX21_INTR_CAL GENMASK(22, 18)
+#define RG_HDMITX21_INTR_CAL_READOUT GENMASK(22, 18)
+#define RG_HDMITX21_INTR_CAL_READOUT_SHIFT (18)
+#define RG_HDMITX21_INTR_CAL_SHIFT (18)
+
+#define RG_HDMITX21_SER_EN GENMASK(31, 28)
+#define RG_HDMITX21_SER_EN_SHIFT (28)
+
+#define RG_HDMITX21_SLDOLPF_EN BIT(7)
+#define RG_HDMITX21_SLDOLPF_EN_SHIFT (7)
+#define RG_HDMITX21_SLDO_EN GENMASK(11, 8)
+#define RG_HDMITX21_SLDO_EN_SHIFT (8)
+#define RG_HDMITX21_SLDO_VREF_SEL GENMASK(5, 4)
+#define RG_HDMITX21_SLDO_VREF_SEL_SHIFT (4)
+
+#define RG_HDMITX21_TX_POSDIV GENMASK(27, 26)
+#define RG_HDMITX21_TX_POSDIV_EN GENMASK(28, 28)
+#define RG_HDMITX21_TX_POSDIV_EN_SHIFT (28)
+#define RG_HDMITX21_TX_POSDIV_SHIFT (26)
+
+#define RG_HDMITX21_VREF_SEL BIT(4)
+#define RG_HDMITX21_VREF_SEL_SHIFT (4)
+
+#define RG_HDMITXPLL_BC GENMASK(28, 27)
+#define RG_HDMITXPLL_BC_SHIFT (27)
+#define RG_HDMITXPLL_BP GENMASK(13, 10)
+#define RG_HDMITXPLL_BP2 BIT(30)
+#define RG_HDMITXPLL_BP2_SHIFT (30)
+#define RG_HDMITXPLL_BP_SHIFT (10)
+#define RG_HDMITXPLL_BR GENMASK(21, 19)
+#define RG_HDMITXPLL_BR_SHIFT (19)
+#define RG_HDMITXPLL_DIV_CTRL GENMASK(25, 24)
+#define RG_HDMITXPLL_DIV_CTRL_SHIFT (24)
+#define RG_HDMITXPLL_FBKDIV_HIGH BIT(31)
+#define RG_HDMITXPLL_FBKDIV_high_SHIFT (31)
+#define RG_HDMITXPLL_FBKDIV_low (0xffffffff)
+#define RG_HDMITXPLL_FBKDIV_low_SHIFT (0)
+#define RG_HDMITXPLL_HIKVCO GENMASK(29, 29)
+#define RG_HDMITXPLL_HIKVCO_SHIFT (29)
+#define RG_HDMITXPLL_HREN GENMASK(13, 12)
+#define RG_HDMITXPLL_HREN_SHIFT (12)
+#define RG_HDMITXPLL_IBAND_FIX_EN GENMASK(24, 24)
+#define RG_HDMITXPLL_IBAND_FIX_EN_SHIFT (24)
+#define RG_HDMITXPLL_IC GENMASK(26, 22)
+#define RG_HDMITXPLL_IC_SHIFT (22)
+#define RG_HDMITXPLL_IR GENMASK(18, 14)
+#define RG_HDMITXPLL_IR_SHIFT (14)
+#define RG_HDMITXPLL_LVR_SEL GENMASK(27, 26)
+#define RG_HDMITXPLL_LVR_SEL_SHIFT (26)
+#define RG_HDMITXPLL_POSDIV GENMASK(23, 22)
+#define RG_HDMITXPLL_POSDIV_DIV3_CTRL BIT(21)
+#define RG_HDMITXPLL_POSDIV_DIV3_CTRL_SHIFT (21)
+#define RG_HDMITXPLL_POSDIV_SHIFT (22)
+#define RG_HDMITXPLL_PREDIV GENMASK(29, 28)
+#define RG_HDMITXPLL_PREDIV_SHIFT (28)
+#define RG_HDMITXPLL_PWD BIT(31)
+#define RG_HDMITXPLL_PWD_SHIFT (31)
+#define RG_HDMITXPLL_REF_CK_SEL GENMASK(2, 1)
+#define RG_HDMITXPLL_REF_CK_SEL_SHIFT (1)
+#define RG_HDMITXPLL_RESERVE GENMASK(15, 0)
+#define RG_HDMITXPLL_RESERVE_BIT12_11 GENMASK(12, 11)
+#define RG_HDMITXPLL_RESERVE_BIT12_11_SHIFT (11)
+#define RG_HDMITXPLL_RESERVE_BIT13 BIT(13)
+#define RG_HDMITXPLL_RESERVE_BIT13_SHIFT (13)
+#define RG_HDMITXPLL_RESERVE_BIT14 BIT(14)
+#define RG_HDMITXPLL_RESERVE_BIT14_SHIFT (14)
+#define RG_HDMITXPLL_RESERVE_BIT1_0 GENMASK(1, 0)
+#define RG_HDMITXPLL_RESERVE_BIT1_0_SHIFT (0)
+#define RG_HDMITXPLL_RESERVE_BIT3_2 GENMASK(3, 2)
+#define RG_HDMITXPLL_RESERVE_BIT3_2_SHIFT (2)
+#define RG_HDMITXPLL_RESERVE_SHIFT (0)
+#define RG_HDMITXPLL_TCL_EN BIT(31)
+#define RG_HDMITXPLL_TCL_EN_SHIFT (31)
+
+#define RG_INTR_IMP_RG_MODE GENMASK(7, 3)
+#define RG_INTR_IMP_RG_MODE_SHIFT (3)
+
+#endif /* MTK_HDMI_PHY_8195_H */
-- 
2.32.0

