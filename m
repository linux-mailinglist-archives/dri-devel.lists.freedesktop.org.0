Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A88B5BE11D
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 11:01:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42B410E480;
	Tue, 20 Sep 2022 09:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE9510E480
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 09:01:40 +0000 (UTC)
X-UUID: d9acda657dbd4b6cb8dba5604997582c-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OZ5yWCfCFGj0IW0poLVG9cmmP/rdObK0cz6uy/0pSIs=; 
 b=Yos6JtFoouAwMdECVuBOx145NcXRaKvI0/joRVQer+8hcWpoaP9Bo/96NmUJ0bDYDj3QGquEO9jM8Aab42BNNbwk1LQKaw1Ez+ZH03+BcA9oSYfWxQqyS8vyLriSYwJF9YyDlYdHDvcmhk/4OHJ5PLhj/qh5rd8wI9i0Rpv8ep4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:564267fc-1ff0-4d15-b57f-cd76e7aa24b0, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:564267fc-1ff0-4d15-b57f-cd76e7aa24b0, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:9bf103f7-6e85-48d9-afd8-0504bbfe04cb,
 B
 ulkID:220920170136D61VEB9Q,BulkQuantity:0,Recheck:0,SF:28|17|19|48|823|824
 ,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: d9acda657dbd4b6cb8dba5604997582c-20220920
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020959420; Tue, 20 Sep 2022 17:01:35 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 14/18] phy: mediatek: mipi: mt8173: use FIELD_PREP to prepare
 bits field
Date: Tue, 20 Sep 2022 17:00:34 +0800
Message-ID: <20220920090038.15133-15-chunfeng.yun@mediatek.com>
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

Use FIELD_PREP() macro to prepare bits field value, then no need define
macros of bits offset.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 5c257d67d7be..1e2ad617e8e3 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -153,15 +153,20 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_BG_CON,
 				RG_DSI_VOUT_MSK |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
-				(4 << 20) | (4 << 17) | (4 << 14) |
-				(4 << 11) | (4 << 8) | (4 << 5) |
+				FIELD_PREP(RG_DSI_V02_SEL, 4) |
+				FIELD_PREP(RG_DSI_V032_SEL, 4) |
+				FIELD_PREP(RG_DSI_V04_SEL, 4) |
+				FIELD_PREP(RG_DSI_V072_SEL, 4) |
+				FIELD_PREP(RG_DSI_V10_SEL, 4) |
+				FIELD_PREP(RG_DSI_V12_SEL, 4) |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
 
 	usleep_range(30, 100);
 
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
 				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
-				(8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
+				FIELD_PREP(RG_DSI_LNT_IMP_CAL_CODE, 8) |
+				RG_DSI_LNT_HS_BIAS_EN);
 
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_CON,
 			     RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
@@ -177,7 +182,8 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
 				RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
 				RG_DSI_MPPLL_PREDIV,
-				(txdiv0 << 3) | (txdiv1 << 5));
+				FIELD_PREP(RG_DSI_MPPLL_TXDIV0, txdiv0) |
+				FIELD_PREP(RG_DSI_MPPLL_TXDIV1, txdiv1));
 
 	/*
 	 * PLL PCW config
-- 
2.18.0

