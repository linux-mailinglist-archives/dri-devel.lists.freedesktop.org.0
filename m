Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516735BE141
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E814810E4A6;
	Tue, 20 Sep 2022 09:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD8A10E14D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:02:31 +0000 (UTC)
X-UUID: 643158f143fe4c5fa868e8e3e3dc39a1-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ee6ScweeW5bquaZmcmWx7Tv71h/rEFddh82fNTS9hZ8=; 
 b=PoI6LAw14lBS2dIRwM0d3eJHmnvthALXqjbrzk8Bctjj/ty2EfNuBPXAXWEhA7NCEzmaYgaQb62tAWh2Ageo1m0e/OUurBbAV1F1+Uw49AgVLXPlJ8WZ5ED3B62vwvAhJeRalpfsdShF6UAiIKZeG9O3K2bkI0AUMs80HoRyFIM=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11, REQID:19b6b493-a850-415d-b026-b834229d06a9, IP:0,
 U
 RL:0,TC:0,Content:43,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
 TION:quarantine,TS:163
X-CID-INFO: VERSION:1.1.11, REQID:19b6b493-a850-415d-b026-b834229d06a9, IP:0,
 URL
 :0,TC:0,Content:43,EDM:25,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_US65DF41,ACTI
 ON:quarantine,TS:163
X-CID-META: VersionHash:39a5ff1, CLOUDID:71fc03f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220920170227E0P8P4RJ,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:4,EDM:5,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,C
 OL:0
X-UUID: 643158f143fe4c5fa868e8e3e3dc39a1-20220920
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1223451580; Tue, 20 Sep 2022 17:02:26 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 08/18] phy: mediatek: hdmi: mt2701: use common helper to
 access registers
Date: Tue, 20 Sep 2022 17:00:28 +0800
Message-ID: <20220920090038.15133-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use MediaTek phy's common helper to access registers, then we can remove
hdmi's I/O helpers.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 146 ++++++++++-----------
 1 file changed, 71 insertions(+), 75 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index af6e8ed348cb..e51b2d13eab4 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -5,6 +5,7 @@
  */
 
 #include "phy-mtk-hdmi.h"
+#include "phy-mtk-io.h"
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
@@ -49,20 +50,21 @@
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	mtk_phy_set_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_EN);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 	return 0;
 }
@@ -70,20 +72,21 @@ static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
+	mtk_phy_clear_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
@@ -97,6 +100,7 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct mtk_hdmi_phy *hdmi_phy = to_mtk_hdmi_phy(hw);
+	void __iomem *base = hdmi_phy->regs;
 	u32 pos_div;
 
 	if (rate <= 64000000)
@@ -106,37 +110,25 @@ static int mtk_hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		pos_div = 1;
 
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_PREDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_IC_MASK, 0x1),
-			  RG_HTPLL_IC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_IR_MASK, 0x1),
-			  RG_HTPLL_IR_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON2, FIELD_PREP(RG_HDMITX_TX_POSDIV_MASK, pos_div),
-			  RG_HDMITX_TX_POSDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_FBKSEL_MASK, 1),
-			  RG_HTPLL_FBKSEL_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_FBKDIV_MASK, 19),
-			  RG_HTPLL_FBKDIV_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON7, FIELD_PREP(RG_HTPLL_DIVEN_MASK, 0x2),
-			  RG_HTPLL_DIVEN_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BP_MASK, 0xc),
-			  RG_HTPLL_BP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BC_MASK, 0x2),
-			  RG_HTPLL_BC_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON6, FIELD_PREP(RG_HTPLL_BR_MASK, 0x1),
-			  RG_HTPLL_BR_MASK);
-
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON1, RG_HDMITX_PRED_IMP);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, FIELD_PREP(RG_HDMITX_PRED_IBIAS_MASK, 0x3),
-			  RG_HDMITX_PRED_IBIAS_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON1, FIELD_PREP(RG_HDMITX_DRV_IMP_MASK, 0x28),
-			  RG_HDMITX_DRV_IMP_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON4, 0x28, RG_HDMITX_RESERVE_MASK);
-	mtk_hdmi_phy_mask(hdmi_phy, HDMI_CON0, FIELD_PREP(RG_HDMITX_DRV_IBIAS_MASK, 0xa),
-			  RG_HDMITX_DRV_IBIAS_MASK);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_PREDIV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_POSDIV);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_IC_MASK, 0x1);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_IR_MASK, 0x1);
+	mtk_phy_update_field(base + HDMI_CON2, RG_HDMITX_TX_POSDIV_MASK, pos_div);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_FBKSEL_MASK, 1);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_FBKDIV_MASK, 19);
+	mtk_phy_update_field(base + HDMI_CON7, RG_HTPLL_DIVEN_MASK, 0x2);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BP_MASK, 0xc);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BC_MASK, 0x2);
+	mtk_phy_update_field(base + HDMI_CON6, RG_HTPLL_BR_MASK, 0x1);
+
+	mtk_phy_clear_bits(base + HDMI_CON1, RG_HDMITX_PRED_IMP);
+	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_PRED_IBIAS_MASK, 0x3);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_IMP_MASK);
+	mtk_phy_update_field(base + HDMI_CON1, RG_HDMITX_DRV_IMP_MASK, 0x28);
+	mtk_phy_update_field(base + HDMI_CON4, RG_HDMITX_RESERVE_MASK, 0x28);
+	mtk_phy_update_field(base + HDMI_CON0, RG_HDMITX_DRV_IBIAS_MASK, 0xa);
 	return 0;
 }
 
@@ -184,37 +176,41 @@ static const struct clk_ops mtk_hdmi_phy_pll_ops = {
 
 static void mtk_hdmi_phy_enable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	void __iomem *base = hdmi_phy->regs;
+
+	mtk_phy_set_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	mtk_phy_set_bits(base + HDMI_CON6, RG_HTPLL_EN);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_set_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	mtk_phy_set_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	mtk_phy_set_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
 	usleep_range(80, 100);
 }
 
 static void mtk_hdmi_phy_disable_tmds(struct mtk_hdmi_phy *hdmi_phy)
 {
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SER_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
+	void __iomem *base = hdmi_phy->regs;
+
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_DRV_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_PRED_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SER_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_MBIAS_LPF_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_EN);
+	mtk_phy_clear_bits(base + HDMI_CON0, RG_HDMITX_EN_SLDO_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_TX_CKLDO);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_EN);
 	usleep_range(80, 100);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON2, RG_HDMITX_EN_MBIAS);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_POSDIV_MASK);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON6, RG_HTPLL_RLH_EN);
-	mtk_hdmi_phy_clear_bits(hdmi_phy, HDMI_CON7, RG_HTPLL_AUTOK_EN);
+	mtk_phy_clear_bits(base + HDMI_CON2, RG_HDMITX_EN_MBIAS);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_POSDIV_MASK);
+	mtk_phy_clear_bits(base + HDMI_CON6, RG_HTPLL_RLH_EN);
+	mtk_phy_clear_bits(base + HDMI_CON7, RG_HTPLL_AUTOK_EN);
 	usleep_range(80, 100);
 }
 
-- 
2.18.0

