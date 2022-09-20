Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4095BE131
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:02:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BBC410E494;
	Tue, 20 Sep 2022 09:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D062F10E480
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:41 +0000 (UTC)
X-UUID: c4f24cc92f3848ab899e0ed933b7325a-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QX+zsgCt4UHzplHNtbSC7dr/Ouj/pqLPeYAQTq2AnPI=; 
 b=B6L15IWQ2VyEyLJl25lxY+McAJLi6ztNFwg/i0VlvmE6oHrKL/0Ca71JZll2mE4R6lCVD3nWirptWvD0ZSUMh+7tYZQck6MpJHiWU00I+1CiaPyRNBIhlre/6WDRV92mJkMVKa5m91FHyJwSdARYAeuzatUfmKhcL5YzPF357h8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:de2b71e5-6d84-4979-a743-184406c13ac8, IP:0,
 U
 RL:0,TC:0,Content:46,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:46
X-CID-META: VersionHash:39a5ff1, CLOUDID:ccee435e-5ed4-4e28-8b00-66ed9f042fbd,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c4f24cc92f3848ab899e0ed933b7325a-20220920
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 795279891; Tue, 20 Sep 2022 17:01:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:45 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:44 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 06/18] phy: mediatek: hdmi: mt2701: use GENMASK and BIT to
 generate mask and bits
Date: Tue, 20 Sep 2022 17:00:26 +0800
Message-ID: <20220920090038.15133-7-chunfeng.yun@mediatek.com>
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

Use GENMASK() and BIT() macros to generate mask and bits

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 56 +++++++++++-----------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index b74c65a1762c..ce36f37c698d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -8,62 +8,62 @@
 
 #define HDMI_CON0	0x00
 #define RG_HDMITX_DRV_IBIAS		0
-#define RG_HDMITX_DRV_IBIAS_MASK	(0x3f << 0)
+#define RG_HDMITX_DRV_IBIAS_MASK	GENMASK(5, 0)
 #define RG_HDMITX_EN_SER		12
-#define RG_HDMITX_EN_SER_MASK		(0x0f << 12)
+#define RG_HDMITX_EN_SER_MASK		GENMASK(15, 12)
 #define RG_HDMITX_EN_SLDO		16
-#define RG_HDMITX_EN_SLDO_MASK		(0x0f << 16)
+#define RG_HDMITX_EN_SLDO_MASK		GENMASK(19, 16)
 #define RG_HDMITX_EN_PRED		20
-#define RG_HDMITX_EN_PRED_MASK		(0x0f << 20)
+#define RG_HDMITX_EN_PRED_MASK		GENMASK(23, 20)
 #define RG_HDMITX_EN_IMP		24
-#define RG_HDMITX_EN_IMP_MASK		(0x0f << 24)
+#define RG_HDMITX_EN_IMP_MASK		GENMASK(27, 24)
 #define RG_HDMITX_EN_DRV		28
-#define RG_HDMITX_EN_DRV_MASK		(0x0f << 28)
+#define RG_HDMITX_EN_DRV_MASK		GENMASK(31, 28)
 
 #define HDMI_CON1	0x04
 #define RG_HDMITX_PRED_IBIAS		18
-#define RG_HDMITX_PRED_IBIAS_MASK	(0x0f << 18)
-#define RG_HDMITX_PRED_IMP		(0x01 << 22)
+#define RG_HDMITX_PRED_IBIAS_MASK	GENMASK(21, 18)
+#define RG_HDMITX_PRED_IMP		BIT(22)
 #define RG_HDMITX_DRV_IMP		26
-#define RG_HDMITX_DRV_IMP_MASK		(0x3f << 26)
+#define RG_HDMITX_DRV_IMP_MASK		GENMASK(31, 26)
 
 #define HDMI_CON2	0x08
-#define RG_HDMITX_EN_TX_CKLDO		(0x01 << 0)
-#define RG_HDMITX_EN_TX_POSDIV		(0x01 << 1)
+#define RG_HDMITX_EN_TX_CKLDO		BIT(0)
+#define RG_HDMITX_EN_TX_POSDIV		BIT(1)
 #define RG_HDMITX_TX_POSDIV		3
-#define RG_HDMITX_TX_POSDIV_MASK	(0x03 << 3)
-#define RG_HDMITX_EN_MBIAS		(0x01 << 6)
-#define RG_HDMITX_MBIAS_LPF_EN		(0x01 << 7)
+#define RG_HDMITX_TX_POSDIV_MASK	GENMASK(4, 3)
+#define RG_HDMITX_EN_MBIAS		BIT(6)
+#define RG_HDMITX_MBIAS_LPF_EN		BIT(7)
 
 #define HDMI_CON4	0x10
-#define RG_HDMITX_RESERVE_MASK		(0xffffffff << 0)
+#define RG_HDMITX_RESERVE_MASK		GENMASK(31, 0)
 
 #define HDMI_CON6	0x18
 #define RG_HTPLL_BR			0
-#define RG_HTPLL_BR_MASK		(0x03 << 0)
+#define RG_HTPLL_BR_MASK		GENMASK(1, 0)
 #define RG_HTPLL_BC			2
-#define RG_HTPLL_BC_MASK		(0x03 << 2)
+#define RG_HTPLL_BC_MASK		GENMASK(3, 2)
 #define RG_HTPLL_BP			4
-#define RG_HTPLL_BP_MASK		(0x0f << 4)
+#define RG_HTPLL_BP_MASK		GENMASK(7, 4)
 #define RG_HTPLL_IR			8
-#define RG_HTPLL_IR_MASK		(0x0f << 8)
+#define RG_HTPLL_IR_MASK		GENMASK(11, 8)
 #define RG_HTPLL_IC			12
-#define RG_HTPLL_IC_MASK		(0x0f << 12)
+#define RG_HTPLL_IC_MASK		GENMASK(15, 12)
 #define RG_HTPLL_POSDIV			16
-#define RG_HTPLL_POSDIV_MASK		(0x03 << 16)
+#define RG_HTPLL_POSDIV_MASK		GENMASK(17, 16)
 #define RG_HTPLL_PREDIV			18
-#define RG_HTPLL_PREDIV_MASK		(0x03 << 18)
+#define RG_HTPLL_PREDIV_MASK		GENMASK(19, 18)
 #define RG_HTPLL_FBKSEL			20
-#define RG_HTPLL_FBKSEL_MASK		(0x03 << 20)
-#define RG_HTPLL_RLH_EN			(0x01 << 22)
+#define RG_HTPLL_FBKSEL_MASK		GENMASK(21, 20)
+#define RG_HTPLL_RLH_EN			BIT(22)
 #define RG_HTPLL_FBKDIV			24
-#define RG_HTPLL_FBKDIV_MASK		(0x7f << 24)
-#define RG_HTPLL_EN			(0x01 << 31)
+#define RG_HTPLL_FBKDIV_MASK		GENMASK(30, 24)
+#define RG_HTPLL_EN			BIT(31)
 
 #define HDMI_CON7	0x1c
-#define RG_HTPLL_AUTOK_EN		(0x01 << 23)
+#define RG_HTPLL_AUTOK_EN		BIT(23)
 #define RG_HTPLL_DIVEN			28
-#define RG_HTPLL_DIVEN_MASK		(0x07 << 28)
+#define RG_HTPLL_DIVEN_MASK		GENMASK(30, 28)
 
 static int mtk_hdmi_pll_prepare(struct clk_hw *hw)
 {
-- 
2.18.0

