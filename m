Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3953659FE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CF06E81D;
	Tue, 20 Apr 2021 13:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 022B56E81D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 13:26:46 +0000 (UTC)
X-UUID: 67b4741ee606471bb1f9e905ed906884-20210420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=F/Ns6WIK2Dy0aPedbYy3llJMXtmG+SMNazBAvgRMihY=; 
 b=o0UFIGtF7B5l+zpZ/eonUMjp4IyVrBz4SJ+o6C1z6gZde/pSxgrVv04K313rlg+ePenX7Dlg1KHOp9jf8PVjKNBIJJJ8KWRe84pjKGf9dWuDqGTJ++lgzPRMwQmg56W91edZA3uBAjqgKD0bLYzKZwpxs8qbs4Zbps07DkEuBCk=;
X-UUID: 67b4741ee606471bb1f9e905ed906884-20210420
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 369354208; Tue, 20 Apr 2021 21:26:29 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 21:26:21 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 20 Apr 2021 21:26:20 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/4] drm/mediatek: add dsi module reset driver
Date: Tue, 20 Apr 2021 21:26:13 +0800
Message-ID: <20210420132614.150242-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420132614.150242-1-jitao.shi@mediatek.com>
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CDD0EDBC07D217E939DC5558E2076778B137CA9F9ABA7EDE162356D70FBDF6E02000:8
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reset dsi HW to default when power on. Prevent the setting differet
between bootloader and kernel.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 36 +++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 455fe582c6b5..113438ddd4cc 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -7,10 +7,12 @@
 #include <linux/component.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 #include <video/mipi_display.h>
 #include <video/videomode.h>
@@ -143,6 +145,8 @@
 #define DATA_0				(0xff << 16)
 #define DATA_1				(0xff << 24)
 
+#define MMSYS_SW_RST_DSI_B BIT(25)
+
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
 
 #define MTK_DSI_HOST_IS_READ(type) \
@@ -186,7 +190,8 @@ struct mtk_dsi {
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct phy *phy;
-
+	struct regmap *mmsys_sw_rst_b;
+	u32 sw_rst_b;
 	void __iomem *regs;
 
 	struct clk *engine_clk;
@@ -272,6 +277,16 @@ static void mtk_dsi_disable(struct mtk_dsi *dsi)
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_EN, 0);
 }
 
+static void mtk_dsi_reset_all(struct mtk_dsi *dsi)
+{
+	regmap_update_bits(dsi->mmsys_sw_rst_b, dsi->sw_rst_b,
+			   MMSYS_SW_RST_DSI_B, 0);
+	usleep_range(1000, 1100);
+
+	regmap_update_bits(dsi->mmsys_sw_rst_b, dsi->sw_rst_b,
+			   MMSYS_SW_RST_DSI_B, MMSYS_SW_RST_DSI_B);
+}
+
 static void mtk_dsi_reset_engine(struct mtk_dsi *dsi)
 {
 	mtk_dsi_mask(dsi, DSI_CON_CTRL, DSI_RESET, DSI_RESET);
@@ -985,6 +1000,8 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
 
 	ret = mtk_dsi_encoder_init(drm, dsi);
 
+	mtk_dsi_reset_all(dsi);
+
 	return ret;
 }
 
@@ -1007,6 +1024,7 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct drm_panel *panel;
 	struct resource *regs;
+	struct regmap *regmap;
 	int irq_num;
 	int ret;
 
@@ -1022,6 +1040,22 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	regmap = syscon_regmap_lookup_by_phandle(dev->of_node,
+						 "mediatek,syscon-dsi");
+	ret = of_property_read_u32_index(dev->of_node, "mediatek,syscon-dsi", 1,
+					 &dsi->sw_rst_b);
+
+	if (IS_ERR(regmap))
+		ret = PTR_ERR(regmap);
+
+	if (ret) {
+		ret = PTR_ERR(regmap);
+		dev_err(dev, "Failed to get mmsys registers: %d\n", ret);
+		return ret;
+	}
+
+	dsi->mmsys_sw_rst_b = regmap;
+
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0,
 					  &panel, &dsi->next_bridge);
 	if (ret)
-- 
2.25.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
