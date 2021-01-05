Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82802EA673
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35F26E083;
	Tue,  5 Jan 2021 08:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id 470FA89EBD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 03:06:55 +0000 (UTC)
X-UUID: 9342f36fcf2e44e0bff4b85541e3cdbc-20210105
X-UUID: 9342f36fcf2e44e0bff4b85541e3cdbc-20210105
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 873346089; Tue, 05 Jan 2021 11:06:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 11:06:46 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 11:06:45 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4,
 05/10] soc: mediatek: mmsys: add mt8183 function call for setting the
 routing registers
Date: Tue, 5 Jan 2021 11:06:28 +0800
Message-ID: <1609815993-22744-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Mailman-Approved-At: Tue, 05 Jan 2021 08:21:09 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add mt8183 function call for setting the routing registers

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 110 ++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    |   1 +
 include/linux/soc/mediatek/mtk-mmsys.h    |   1 +
 4 files changed, 113 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index ac03025..25eeb9e5 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mt8183-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
new file mode 100644
index 0000000..8311f89
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
@@ -0,0 +1,110 @@
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
+static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
+				  enum mtk_ddp_comp_id cur,
+				  enum mtk_ddp_comp_id next,
+				  bool enable)
+{
+	unsigned int addr, value, reg;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0) {
+		addr = DISP_OVL0_MOUT_EN;
+		value = OVL0_MOUT_EN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		addr = DISP_OVL0_2L_MOUT_EN;
+		value = OVL0_2L_MOUT_EN_DISP_PATH0;
+	} else if (cur == DDP_COMPONENT_OVL_2L1 && next == DDP_COMPONENT_RDMA1) {
+		addr = DISP_OVL1_2L_MOUT_EN;
+		value = OVL1_2L_MOUT_EN_RDMA1;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		addr = DISP_DITHER0_MOUT_EN;
+		value = DITHER0_MOUT_IN_DSI0;
+	} else {
+		value = 0;
+	}
+
+	if (value) {
+		reg = readl_relaxed(config_regs + addr);
+
+		if (enable)
+			reg |= value;
+		else
+			reg &= ~value;
+
+		writel_relaxed(reg, config_regs + addr);
+	}
+}
+
+static void mtk_mmsys_ddp_sel_in(void __iomem *config_regs,
+				 enum mtk_ddp_comp_id cur,
+				 enum mtk_ddp_comp_id next,
+				 bool enable)
+{
+	unsigned int addr, value, reg;
+
+	if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		addr = DISP_PATH0_SEL_IN;
+		value = DISP_PATH0_SEL_IN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
+		addr = DISP_DPI0_SEL_IN;
+		value = DPI0_SEL_IN_RDMA1;
+	} else {
+		value = 0;
+	}
+
+	if (value) {
+		reg = readl_relaxed(config_regs + addr);
+
+		if (enable)
+			reg |= value;
+		else
+			reg &= ~value;
+
+		writel_relaxed(reg, config_regs + addr);
+	}
+}
+
+static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
+				   enum mtk_ddp_comp_id cur,
+				   enum mtk_ddp_comp_id next)
+{
+	if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_COLOR0) {
+		writel_relaxed(RDMA0_SOUT_COLOR0, config_regs + DISP_RDMA0_SOUT_SEL_IN);
+	}
+}
+
+struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index 4ca72f8..075d356 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -47,6 +47,7 @@ struct mtk_mmsys {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.funcs = &mt8183_mmsys_funcs,
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 89000a9..7e2c0fe 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -57,6 +57,7 @@ struct mtk_mmsys_conn_funcs {
 };
 
 extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
+extern struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs;
 
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
