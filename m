Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B055D49F8EA
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 13:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E50E10E3F4;
	Fri, 28 Jan 2022 12:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B104510E2FD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 12:07:27 +0000 (UTC)
X-UUID: 6bd6658dfda64776ac3c51ea2d2a85a0-20220128
X-UUID: 6bd6658dfda64776ac3c51ea2d2a85a0-20220128
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 781101041; Fri, 28 Jan 2022 20:07:23 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 20:07:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 20:07:20 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH v1, 1/4] soc: mediatek: mmsys: Add mt8186 mmsys routing table
Date: Fri, 28 Jan 2022 20:07:15 +0800
Message-ID: <20220128120718.30545-2-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
References: <20220128120718.30545-1-yongqiang.niu@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mt8186 routing registers is different with other Soc

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mt8186-mmsys.h | 113 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  11 +++
 2 files changed, 124 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h

diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
new file mode 100644
index 000000000000..7de329f2d729
--- /dev/null
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
+#define __SOC_MEDIATEK_MT8186_MMSYS_H
+
+#define MT8186_MMSYS_OVL_CON			0xF04
+#define MT8186_MMSYS_OVL0_CON_MASK			0x3
+#define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
+#define MT8186_OVL0_GO_BLEND				BIT(0)
+#define MT8186_OVL0_GO_BG				BIT(1)
+#define MT8186_OVL0_2L_GO_BLEND				BIT(2)
+#define MT8186_OVL0_2L_GO_BG				BIT(3)
+#define MT8186_DISP_RDMA0_SOUT_SEL		0xF0C
+#define MT8186_RDMA0_SOUT_SEL_MASK			0xF
+#define MT8186_RDMA0_SOUT_TO_DSI0			(0)
+#define MT8186_RDMA0_SOUT_TO_COLOR0			(1)
+#define MT8186_RDMA0_SOUT_TO_DPI0			(2)
+#define MT8186_DISP_OVL0_2L_MOUT_EN		0xF14
+#define MT8186_OVL0_2L_MOUT_EN_MASK			0xF
+#define MT8186_OVL0_2L_MOUT_TO_RDMA0			BIT(0)
+#define MT8186_OVL0_2L_MOUT_TO_RDMA1			BIT(3)
+#define MT8186_DISP_OVL0_MOUT_EN		0xF18
+#define MT8186_OVL0_MOUT_EN_MASK			0xF
+#define MT8186_OVL0_MOUT_TO_RDMA0			BIT(0)
+#define MT8186_OVL0_MOUT_TO_RDMA1			BIT(3)
+#define MT8186_DISP_DITHER0_MOUT_EN		0xF20
+#define MT8186_DITHER0_MOUT_EN_MASK			0xF
+#define MT8186_DITHER0_MOUT_TO_DSI0			BIT(0)
+#define MT8186_DITHER0_MOUT_TO_RDMA1			BIT(2)
+#define MT8186_DITHER0_MOUT_TO_DPI0			BIT(3)
+#define MT8186_DISP_RDMA0_SEL_IN		0xF28
+#define MT8186_RDMA0_SEL_IN_MASK			0xF
+#define MT8186_RDMA0_FROM_OVL0				0
+#define MT8186_RDMA0_FROM_OVL0_2L			2
+#define MT8186_DISP_DSI0_SEL_IN			0xF30
+#define MT8186_DSI0_SEL_IN_MASK				0xF
+#define MT8186_DSI0_FROM_RDMA0				0
+#define MT8186_DSI0_FROM_DITHER0			1
+#define MT8186_DSI0_FROM_RDMA1				2
+#define MT8186_DISP_RDMA1_MOUT_EN		0xF3C
+#define MT8186_RDMA1_MOUT_EN_MASK			0xF
+#define MT8186_RDMA1_MOUT_TO_DPI0_SEL			BIT(0)
+#define MT8186_RDMA1_MOUT_TO_DSI0_SEL			BIT(2)
+#define MT8186_DISP_RDMA1_SEL_IN		0xF40
+#define MT8186_RDMA1_SEL_IN_MASK			0xF
+#define MT8186_RDMA1_FROM_OVL0				0
+#define MT8186_RDMA1_FROM_OVL0_2L			2
+#define MT8186_RDMA1_FROM_DITHER0			3
+#define MT8186_DISP_DPI0_SEL_IN			0xF44
+#define MT8186_DPI0_SEL_IN_MASK				0xF
+#define MT8186_DPI0_FROM_RDMA1				0
+#define MT8186_DPI0_FROM_DITHER0			1
+#define MT8186_DPI0_FROM_RDMA0				2
+
+static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_DISP_OVL0_MOUT_EN, MT8186_OVL0_MOUT_EN_MASK,
+		MT8186_OVL0_MOUT_TO_RDMA0
+	},
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_DISP_RDMA0_SEL_IN, MT8186_RDMA0_SEL_IN_MASK,
+		MT8186_RDMA0_FROM_OVL0
+	},
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_CON_MASK,
+		MT8186_OVL0_GO_BLEND
+	},
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8186_DISP_RDMA0_SOUT_SEL, MT8186_RDMA0_SOUT_SEL_MASK,
+		MT8186_RDMA0_SOUT_TO_COLOR0
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
+		MT8186_DITHER0_MOUT_TO_DSI0,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
+		MT8186_DSI0_FROM_DITHER0
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_DISP_OVL0_2L_MOUT_EN, MT8186_OVL0_2L_MOUT_EN_MASK,
+		MT8186_OVL0_2L_MOUT_TO_RDMA1
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_DISP_RDMA1_SEL_IN, MT8186_RDMA1_SEL_IN_MASK,
+		MT8186_RDMA1_FROM_OVL0_2L
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA1,
+		MT8186_MMSYS_OVL_CON, MT8186_MMSYS_OVL0_2L_CON_MASK,
+		MT8186_OVL0_2L_GO_BLEND
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8186_DISP_RDMA1_MOUT_EN, MT8186_RDMA1_MOUT_EN_MASK,
+		MT8186_RDMA1_MOUT_TO_DPI0_SEL
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8186_DISP_DPI0_SEL_IN, MT8186_DPI0_SEL_IN_MASK,
+		MT8186_DPI0_FROM_RDMA1
+	},
+};
+
+#endif /* __SOC_MEDIATEK_MT8186_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 1e448f1ffefb..0da25069ffb3 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -15,6 +15,7 @@
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
 #include "mt8183-mmsys.h"
+#include "mt8186-mmsys.h"
 #include "mt8192-mmsys.h"
 #include "mt8365-mmsys.h"
 
@@ -56,6 +57,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8186_mmsys_driver_data = {
+	.clk_driver = "clk-mt8186-mm",
+	.routes = mmsys_mt8186_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -242,6 +249,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8186-mmsys",
+		.data = &mt8186_mmsys_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
-- 
2.25.1

