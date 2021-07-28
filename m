Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E53D893D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53436E154;
	Wed, 28 Jul 2021 07:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A026E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:59:13 +0000 (UTC)
X-UUID: 39d2ffd073da434c8c06c7e04c9a09a9-20210728
X-UUID: 39d2ffd073da434c8c06c7e04c9a09a9-20210728
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 150082954; Wed, 28 Jul 2021 15:59:10 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 15:59:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 15:59:07 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 6/9] phy: phy-mtk-ufs: use clock bulk to get clocks
Date: Wed, 28 Jul 2021 15:58:28 +0800
Message-ID: <1627459111-2907-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627459111-2907-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use clock bulk helpers to get/enable/disable clocks

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-ufs.c | 44 ++++++++----------------------
 1 file changed, 11 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-ufs.c b/drivers/phy/mediatek/phy-mtk-ufs.c
index 769b00b038d8..a6af06941203 100644
--- a/drivers/phy/mediatek/phy-mtk-ufs.c
+++ b/drivers/phy/mediatek/phy-mtk-ufs.c
@@ -31,11 +31,12 @@
 #define FRC_CDR_ISO_EN              BIT(19)
 #define CDR_ISO_EN                  BIT(20)
 
+#define UFSPHY_CLKS_CNT    2
+
 struct ufs_mtk_phy {
 	struct device *dev;
 	void __iomem *mmio;
-	struct clk *mp_clk;
-	struct clk *unipro_clk;
+	struct clk_bulk_data clks[UFSPHY_CLKS_CNT];
 };
 
 static inline u32 mphy_readl(struct ufs_mtk_phy *phy, u32 reg)
@@ -74,20 +75,11 @@ static struct ufs_mtk_phy *get_ufs_mtk_phy(struct phy *generic_phy)
 static int ufs_mtk_phy_clk_init(struct ufs_mtk_phy *phy)
 {
 	struct device *dev = phy->dev;
+	struct clk_bulk_data *clks = phy->clks;
 
-	phy->unipro_clk = devm_clk_get(dev, "unipro");
-	if (IS_ERR(phy->unipro_clk)) {
-		dev_err(dev, "failed to get clock: unipro");
-		return PTR_ERR(phy->unipro_clk);
-	}
-
-	phy->mp_clk = devm_clk_get(dev, "mp");
-	if (IS_ERR(phy->mp_clk)) {
-		dev_err(dev, "failed to get clock: mp");
-		return PTR_ERR(phy->mp_clk);
-	}
-
-	return 0;
+	clks[0].id = "unipro";
+	clks[1].id = "mp";
+	return devm_clk_bulk_get(dev, UFSPHY_CLKS_CNT, clks);
 }
 
 static void ufs_mtk_phy_set_active(struct ufs_mtk_phy *phy)
@@ -150,26 +142,13 @@ static int ufs_mtk_phy_power_on(struct phy *generic_phy)
 	struct ufs_mtk_phy *phy = get_ufs_mtk_phy(generic_phy);
 	int ret;
 
-	ret = clk_prepare_enable(phy->unipro_clk);
-	if (ret) {
-		dev_err(phy->dev, "unipro_clk enable failed %d\n", ret);
-		goto out;
-	}
-
-	ret = clk_prepare_enable(phy->mp_clk);
-	if (ret) {
-		dev_err(phy->dev, "mp_clk enable failed %d\n", ret);
-		goto out_unprepare_unipro_clk;
-	}
+	ret = clk_bulk_prepare_enable(UFSPHY_CLKS_CNT, phy->clks);
+	if (ret)
+		return ret;
 
 	ufs_mtk_phy_set_active(phy);
 
 	return 0;
-
-out_unprepare_unipro_clk:
-	clk_disable_unprepare(phy->unipro_clk);
-out:
-	return ret;
 }
 
 static int ufs_mtk_phy_power_off(struct phy *generic_phy)
@@ -178,8 +157,7 @@ static int ufs_mtk_phy_power_off(struct phy *generic_phy)
 
 	ufs_mtk_phy_set_deep_hibern(phy);
 
-	clk_disable_unprepare(phy->unipro_clk);
-	clk_disable_unprepare(phy->mp_clk);
+	clk_bulk_disable_unprepare(UFSPHY_CLKS_CNT, phy->clks);
 
 	return 0;
 }
-- 
2.18.0

