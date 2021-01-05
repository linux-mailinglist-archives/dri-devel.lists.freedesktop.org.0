Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F652EA66E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 09:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DE86E08A;
	Tue,  5 Jan 2021 08:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D1A8C89F5F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 03:06:54 +0000 (UTC)
X-UUID: 8a1b81a8e3a54edebd49e1f3975f5db2-20210105
X-UUID: 8a1b81a8e3a54edebd49e1f3975f5db2-20210105
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2032767481; Tue, 05 Jan 2021 11:06:52 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 11:06:50 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 11:06:49 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4, 10/10] soc: mediatek: mmsys: add mt8192 mmsys support
Date: Tue, 5 Jan 2021 11:06:33 +0800
Message-ID: <1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com>
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

add mt8192 mmsys support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 149 ++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    |   9 ++
 include/linux/soc/mediatek/mtk-mmsys.h    |   1 +
 4 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 25eeb9e5..7508cd3 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mt8183-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mt8192-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
new file mode 100644
index 0000000..2e350d1
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -0,0 +1,149 @@
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
+#define MMSYS_OVL_MOUT_EN		0xf04
+#define DISP_OVL0_GO_BLEND			BIT(0)
+#define DISP_OVL0_GO_BG				BIT(1)
+#define DISP_OVL0_2L_GO_BLEND			BIT(2)
+#define DISP_OVL0_2L_GO_BG			BIT(3)
+#define DISP_OVL1_2L_MOUT_EN		0xf08
+#define OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define DISP_OVL0_2L_MOUT_EN		0xf18
+#define DISP_OVL0_MOUT_EN		0xf1c
+#define OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
+#define OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define DISP_RDMA0_SEL_IN		0xf2c
+#define RDMA0_SEL_IN_OVL0_2L			0x3
+#define DISP_RDMA0_SOUT_SEL		0xf30
+#define RDMA0_SOUT_COLOR0			0x1
+#define DISP_CCORR0_SOUT_SEL		0xf34
+#define CCORR0_SOUT_AAL0			0x1
+#define DISP_AAL0_SEL_IN		0xf38
+#define AAL0_SEL_IN_CCORR0			0x1
+#define DISP_DITHER0_MOUT_EN		0xf3c
+#define DITHER0_MOUT_DSI0			BIT(0)
+#define DISP_DSI0_SEL_IN		0xf40
+#define DSI0_SEL_IN_DITHER0			0x1
+#define DISP_OVL2_2L_MOUT_EN		0xf4c
+#define OVL2_2L_MOUT_RDMA4			BIT(0)
+
+static void mtk_mmsys_ddp_mout_en(void __iomem *config_regs,
+				  enum mtk_ddp_comp_id cur,
+				  enum mtk_ddp_comp_id next,
+				  bool enable)
+{
+	unsigned int addr, value, reg;
+
+	if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		addr = DISP_OVL0_2L_MOUT_EN;
+		value = OVL0_MOUT_EN_DISP_RDMA0;
+	} else if (cur == DDP_COMPONENT_OVL_2L2 && next == DDP_COMPONENT_RDMA4) {
+		addr = DISP_OVL2_2L_MOUT_EN;
+		value = OVL2_2L_MOUT_RDMA4;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		addr = DISP_DITHER0_MOUT_EN;
+		value = DITHER0_MOUT_DSI0;
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
+		addr = DISP_RDMA0_SEL_IN;
+		value = RDMA0_SEL_IN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_CCORR && next == DDP_COMPONENT_AAL0) {
+		addr = DISP_AAL0_SEL_IN;
+		value = AAL0_SEL_IN_CCORR0;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		addr = DISP_DSI0_SEL_IN;
+		value = DSI0_SEL_IN_DITHER0;
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
+		writel_relaxed(RDMA0_SOUT_COLOR0, config_regs + DISP_RDMA0_SOUT_SEL);
+	} else if (cur == DDP_COMPONENT_CCORR && next == DDP_COMPONENT_AAL0) {
+		writel_relaxed(CCORR0_SOUT_AAL0, config_regs + DISP_CCORR0_SOUT_SEL);
+	}
+}
+
+static void mtk_mmsys_ovl_mout_en(void __iomem *config_regs,
+				  enum mtk_ddp_comp_id cur,
+				  enum mtk_ddp_comp_id next,
+				  bool enable)
+{
+	unsigned int addr, value, reg;
+
+	addr = MMSYS_OVL_MOUT_EN;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_2L_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_GO_BLEND;
+	else if (cur == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_2L_GO_BLEND;
+	else
+		value = 0;
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
+struct mtk_mmsys_conn_funcs mt8192_mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.ovl_mout_en = mtk_mmsys_ovl_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index 34728ed..2c72607 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -50,6 +50,11 @@ struct mtk_mmsys {
 	.funcs = &mt8183_mmsys_funcs,
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.clk_driver = "clk-mt8192-mm",
+	.funcs = &mt8192_mmsys_funcs,
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -157,6 +162,10 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8192-mmsys",
+		.data = &mt8192_mmsys_driver_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 19318d2..eeec96a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -65,6 +65,7 @@ struct mtk_mmsys_conn_funcs {
 
 extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
 extern struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs;
+extern struct mtk_mmsys_conn_funcs mt8192_mmsys_funcs;
 
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
-- 
1.8.1.1.dirty

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
