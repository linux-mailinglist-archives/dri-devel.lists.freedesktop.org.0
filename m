Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F133224AFF3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:17:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021536E908;
	Thu, 20 Aug 2020 07:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id D2E906E8A6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:05:39 +0000 (UTC)
X-UUID: 7579fbe64d4448ad846b3f4afec627f4-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lFMgkncXYg8bkldshCfDIPngk3zXG9Y53QOyLpXvSOU=; 
 b=c9Zm+P15w1SFwRylrc2EVhmOP+lYvcKIynNdHhrcKcjdfM8KT7jkCJuV8lTnxpZzjmQi5eMABQnAiDB45HL6qpszn9m3rm+FqpaV0Gncg5mmO2bGrm7Eo1HlOjqboXbGu1/MYDmUtXNmotmLKwnR15zo/XXyL5Yg0Ya8pewxAIA=;
X-UUID: 7579fbe64d4448ad846b3f4afec627f4-20200820
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 731242442; Thu, 20 Aug 2020 14:05:36 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:34 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 04/21] mtk-mmsys: add mt8192 mmsys support
Date: Thu, 20 Aug 2020 14:04:01 +0800
Message-ID: <1597903458-8055-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add mt8192 mmsys support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 159 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 62cfedf..c4bb6be 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mt2701-mmsys.o
 obj-y += mt8183-mmsys.o
+obj-y += mt8192-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
new file mode 100644
index 0000000..006d41d
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
+#define DISP_OVL0_GO_BLEND				BIT(0)
+#define DISP_OVL0_GO_BG					BIT(1)
+#define DISP_OVL0_2L_GO_BLEND				BIT(2)
+#define DISP_OVL0_2L_GO_BG				BIT(3)
+#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
+#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
+#define OVL0_MOUT_EN_DISP_RDMA0				BIT(0)
+#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
+#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
+#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
+#define MT8192_RDMA0_SOUT_COLOR0			0x1
+#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
+#define MT8192_CCORR0_SOUT_AAL0				0x1
+#define MT8192_DISP_AAL0_SEL_IN			0xf38
+#define MT8192_AAL0_SEL_IN_CCORR0			0x1
+#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
+#define MT8192_DITHER0_MOUT_DSI0			BIT(0)
+#define MT8192_DISP_DSI0_SEL_IN			0xf40
+#define MT8192_DSI0_SEL_IN_DITHER0			0x1
+#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
+#define MT8192_OVL2_2L_MOUT_RDMA4			BIT(0)
+
+struct mmsys_path_sel {
+	enum mtk_ddp_comp_id cur;
+	enum mtk_ddp_comp_id next;
+	u32 addr;
+	u32 val;
+};
+
+static struct mmsys_path_sel mmsys_mout_en[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_DISP_RDMA0,
+	},
+	{
+		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
+		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_RDMA4,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_DSI0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sel_in[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sout_sel[] = {
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
+	},
+	{
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0,
+	}
+};
+
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	u32 i;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
+		path = &mmsys_mout_en[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			return path->val;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
+					 enum mtk_ddp_comp_id next,
+					 unsigned int *addr)
+{
+	u32 i;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
+		path = &mmsys_sel_in[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			return path->val;
+		}
+	}
+
+	return 0;
+}
+
+static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
+				   enum mtk_ddp_comp_id cur,
+				   enum mtk_ddp_comp_id next)
+{
+	u32 i;
+	u32 val = 0;
+	u32 addr = 0;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
+		path = &mmsys_sout_sel[i];
+		if (cur == path->cur && next == path->next) {
+			addr = path->addr;
+			writel_relaxed(path->val, config_regs + addr);
+			return;
+		}
+	}
+}
+
+static struct mtk_mmsys_conn_funcs mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
+
+static int mmsys_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	mtk_mmsys_register_conn_funcs(dev->parent, &mmsys_funcs);
+
+	return 0;
+}
+
+static struct platform_driver mmsys_drv = {
+	.probe = mmsys_probe,
+	.driver = {
+		.name = "mt8192-mmsys",
+	},
+};
+
+builtin_platform_driver(mmsys_drv);
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
