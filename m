Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4463E8D25
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 11:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27CD6E0E5;
	Wed, 11 Aug 2021 09:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D6E6E08E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 09:19:37 +0000 (UTC)
X-UUID: b280bb955fdd4e68b47b27edf64da361-20210811
X-UUID: b280bb955fdd4e68b47b27edf64da361-20210811
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 740005110; Wed, 11 Aug 2021 17:19:32 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 17:19:31 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 17:19:30 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 4/9] phy: phy-mtk-tphy: print error log using child device
Date: Wed, 11 Aug 2021 17:18:35 +0800
Message-ID: <1628673520-23537-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628673520-23537-1-git-send-email-chunfeng.yun@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Print error log using child devices instead of parent device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/phy/mediatek/phy-mtk-tphy.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/phy-mtk-tphy.c
index a6502058a1a5..9d4b34298137 100644
--- a/drivers/phy/mediatek/phy-mtk-tphy.c
+++ b/drivers/phy/mediatek/phy-mtk-tphy.c
@@ -1278,6 +1278,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 	for_each_child_of_node(np, child_np) {
 		struct mtk_phy_instance *instance;
 		struct clk_bulk_data *clks;
+		struct device *subdev;
 		struct phy *phy;
 
 		instance = devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
@@ -1295,16 +1296,17 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 			goto put_child;
 		}
 
+		subdev = &phy->dev;
 		retval = of_address_to_resource(child_np, 0, &res);
 		if (retval) {
-			dev_err(dev, "failed to get address resource(id-%d)\n",
+			dev_err(subdev, "failed to get address resource(id-%d)\n",
 				port);
 			goto put_child;
 		}
 
-		instance->port_base = devm_ioremap_resource(&phy->dev, &res);
+		instance->port_base = devm_ioremap_resource(subdev, &res);
 		if (IS_ERR(instance->port_base)) {
-			dev_err(dev, "failed to remap phy regs\n");
+			dev_err(subdev, "failed to remap phy regs\n");
 			retval = PTR_ERR(instance->port_base);
 			goto put_child;
 		}
@@ -1317,7 +1319,7 @@ static int mtk_tphy_probe(struct platform_device *pdev)
 		clks = instance->clks;
 		clks[0].id = "ref";     /* digital (& analog) clock */
 		clks[1].id = "da_ref";  /* analog clock */
-		retval = devm_clk_bulk_get_optional(&phy->dev, TPHY_CLKS_CNT, clks);
+		retval = devm_clk_bulk_get_optional(subdev, TPHY_CLKS_CNT, clks);
 		if (retval)
 			goto put_child;
 
-- 
2.25.1

