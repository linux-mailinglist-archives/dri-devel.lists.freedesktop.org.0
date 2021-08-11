Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D463E8D1A
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 11:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5556E0EC;
	Wed, 11 Aug 2021 09:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8846E0EA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 09:19:38 +0000 (UTC)
X-UUID: ac8284193d7c4ed6b55d8a22ca622d19-20210811
X-UUID: ac8284193d7c4ed6b55d8a22ca622d19-20210811
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1710534228; Wed, 11 Aug 2021 17:19:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 17:19:33 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 11 Aug 2021 17:19:33 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 17:19:32 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 7/9] phy: phy-mtk-hdmi: convert to
 devm_platform_ioremap_resource
Date: Wed, 11 Aug 2021 17:18:38 +0800
Message-ID: <1628673520-23537-7-git-send-email-chunfeng.yun@mediatek.com>
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

Use devm_platform_ioremap_resource to simplify code

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add acked-by CK
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index 8ad8f717ef43..5fb4217fb8e0 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -100,7 +100,6 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_hdmi_phy *hdmi_phy;
-	struct resource *mem;
 	struct clk *ref_clk;
 	const char *ref_clk_name;
 	struct clk_init_data clk_init = {
@@ -116,11 +115,9 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
 	if (!hdmi_phy)
 		return -ENOMEM;
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hdmi_phy->regs = devm_ioremap_resource(dev, mem);
-	if (IS_ERR(hdmi_phy->regs)) {
+	hdmi_phy->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hdmi_phy->regs))
 		return PTR_ERR(hdmi_phy->regs);
-	}
 
 	ref_clk = devm_clk_get(dev, "pll_ref");
 	if (IS_ERR(ref_clk)) {
-- 
2.25.1

