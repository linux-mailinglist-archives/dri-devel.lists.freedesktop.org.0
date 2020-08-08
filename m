Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75252402CD
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F2F6E37C;
	Mon, 10 Aug 2020 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 484A36EA9A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Aug 2020 02:54:45 +0000 (UTC)
X-UUID: 79abee187e61478eba3db12305ebaced-20200808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=idHOUVrVZugVAKkni982q3yiPMjYf4/xnF0t90g2qp0=; 
 b=ByJpi7c7vIGhSvLsBvJcDbmE2CiE9+udvB7pKkf25fbeYWCe7a2izi96j8CGtyHfiNANS0aafsMWHf056rBarBkBIyZXZ50idsrpStXNyP0xe9op2NVbOf6/Yn6GS2WIYt3HcByWhdQjdNphYx2IktOAsubgDz9E8PpV8W00xyM=;
X-UUID: 79abee187e61478eba3db12305ebaced-20200808
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2082948566; Sat, 08 Aug 2020 10:54:43 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Aug 2020 10:54:42 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 10:54:42 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND v7, PATCH 4/7] mtk-mmsys: add mt8183 mmsys support
Date: Sat, 8 Aug 2020 10:53:48 +0800
Message-ID: <1596855231-5782-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:59 +0000
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

add mt8183 mmsys support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 154 ++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          |   1 +
 3 files changed, 156 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 33b0dab..62cfedf 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mt2701-mmsys.o
+obj-y += mt8183-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
new file mode 100644
index 0000000..e5170b5
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
@@ -0,0 +1,154 @@
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
+#define DISP_OVL0_MOUT_EN		0xf00
+#define DISP_OVL0_2L_MOUT_EN		0xf04
+#define DISP_OVL1_2L_MOUT_EN		0xf08
+#define DISP_DITHER0_MOUT_EN		0xf0c
+#define DISP_PATH0_SEL_IN		0xf24
+#define DISP_DSI0_SEL_IN		0xf2c
+#define DISP_DPI0_SEL_IN		0xf30
+#define DISP_RDMA0_SOUT_SEL_IN		0xf50
+#define DISP_RDMA1_SOUT_SEL_IN		0xf54
+
+#define OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define OVL0_2L_MOUT_EN_DISP_PATH0		BIT(0)
+#define OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define DITHER0_MOUT_IN_DSI0			BIT(0)
+#define DISP_PATH0_SEL_IN_OVL0_2L		0x1
+#define DSI0_SEL_IN_RDMA0			0x1
+#define DSI0_SEL_IN_RDMA1			0x3
+#define DPI0_SEL_IN_RDMA0			0x1
+#define DPI0_SEL_IN_RDMA1			0x2
+#define RDMA0_SOUT_COLOR0			0x1
+#define RDMA1_SOUT_DSI0				0x1
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
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
+		DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		DISP_OVL0_2L_MOUT_EN, OVL0_2L_MOUT_EN_DISP_PATH0,
+	},
+	{
+		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
+		DISP_OVL1_2L_MOUT_EN, OVL1_2L_MOUT_EN_RDMA1,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DISP_DITHER0_MOUT_EN, DITHER0_MOUT_IN_DSI0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sel_in[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		DISP_PATH0_SEL_IN, DISP_PATH0_SEL_IN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_DPI0_SEL_IN, DPI0_SEL_IN_RDMA1,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sout_sel[] = {
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		DISP_RDMA0_SOUT_SEL_IN, RDMA0_SOUT_COLOR0,
+	},
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
+		.name = "mt8183-mmsys",
+	},
+};
+
+builtin_platform_driver(mmsys_drv);
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 605b992..6a451ac 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -47,6 +47,7 @@ struct mtk_mmsys_private_data {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.mmsys_driver = "mt8183-mmsys",
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
-- 
1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
