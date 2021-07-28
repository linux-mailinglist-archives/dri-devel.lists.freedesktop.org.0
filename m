Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9963D893A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE746E128;
	Wed, 28 Jul 2021 07:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775976E0FB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 07:59:12 +0000 (UTC)
X-UUID: 2f212d9a80fe4dae90f0a6737a9b5976-20210728
X-UUID: 2f212d9a80fe4dae90f0a6737a9b5976-20210728
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 542538601; Wed, 28 Jul 2021 15:59:07 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 15:59:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 15:59:05 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH 4/9] phy: phy-mtk-tphy: print error log using child device
Date: Wed, 28 Jul 2021 15:58:26 +0800
Message-ID: <1627459111-2907-4-git-send-email-chunfeng.yun@mediatek.com>
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

Print error log using child devices instead of parent device.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
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
2.18.0

