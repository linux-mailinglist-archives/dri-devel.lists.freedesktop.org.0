Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ECBB39647
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7594110E6CB;
	Thu, 28 Aug 2025 08:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="E1n0aDoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79C610E6CC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:13 +0000 (UTC)
X-UUID: 44e5cd5683e611f0bd5779446731db89-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6zdN5XIK0MYXkgHVGNGNSGrB6uDi77vv8Zny4Y9mD/k=; 
 b=E1n0aDohuR6KZTV7UFLExYkqq6kxPFp5zorEnxeRUKa1f6a7JLC3etRhwc0ydNgmR46AfgYABEgjBKqiGi3Y3TgDZv1MqkFcLn3zFjJGwHA7kWSxW49B6fhFERnQWDcOASA05MeA7yqTW6PeNia//3ZiqACyOyrAXogqqdphPDE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:ad232d09-41a7-44a3-91ed-5e1405ee7633, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:f1326cf, CLOUDID:170b9920-786d-4870-a017-e7b4f3839b3f,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44e5cd5683e611f0bd5779446731db89-20250828
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 252870783; Thu, 28 Aug 2025 16:09:07 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 28 Aug 2025 16:09:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 28 Aug 2025 16:09:05 +0800
From: Paul Chen <paul-pl.chen@mediatek.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <chunkuang.hu@kernel.org>, <angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <xiandong.wang@mediatek.com>,
 <sirius.wang@mediatek.com>, <paul-pl.chen@mediatek.com>,
 <sunny.shen@mediatek.com>, <fshao@chromium.org>, <treapking@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 14/19] drm/mediatek: add EXDMA support for MT8196
Date: Thu, 28 Aug 2025 16:07:09 +0800
Message-ID: <20250828080855.3502514-15-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

From: Nancy Lin <nancy.lin@mediatek.com>

EXDMA is a DMA engine for reading data from DRAM with
various DRAM footprints and data formats. For input
sources in certain color formats and color domains,
EXDMA also includes a color transfer function to
process pixels into a consistent color domain.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile         |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c | 359 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
 7 files changed, 373 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 43afd0a26d14..92d2ce25ebc4 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -5,6 +5,7 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_disp_aal.o \
 		  mtk_disp_ccorr.o \
 		  mtk_disp_color.o \
+		  mtk_disp_exdma.o \
 		  mtk_disp_gamma.o \
 		  mtk_disp_merge.o \
 		  mtk_disp_ovl.o \
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index ac6620e10262..d9b771b03233 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -446,6 +446,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DP_INTF] = "dp-intf",
 	[MTK_DPI] = "dpi",
 	[MTK_DSI] = "dsi",
+	[MTK_OVL_EXDMA] = "exdma",
 };
 
 struct mtk_ddp_comp_match {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 7289b3dcf22f..5169a107e575 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -43,6 +43,7 @@ enum mtk_ddp_comp_type {
 	MTK_DPI,
 	MTK_DP_INTF,
 	MTK_DSI,
+	MTK_OVL_EXDMA,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 679d413bf10b..b9d8f17c4f31 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -39,6 +39,15 @@ void mtk_color_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_color_start(struct device *dev);
 
+int mtk_disp_exdma_clk_enable(struct device *dev);
+void mtk_disp_exdma_clk_disable(struct device *dev);
+void mtk_disp_exdma_start(struct device *dev);
+void mtk_disp_exdma_stop(struct device *dev);
+void mtk_disp_exdma_layer_config(struct device *dev, struct mtk_plane_state *state,
+				 struct cmdq_pkt *cmdq_pkt);
+const u32 *mtk_disp_exdma_get_formats(struct device *dev);
+size_t mtk_disp_exdma_get_num_formats(struct device *dev);
+
 void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_exdma.c b/drivers/gpu/drm/mediatek/mtk_disp_exdma.c
new file mode 100644
index 000000000000..9acb5da29712
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_exdma.c
@@ -0,0 +1,359 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <drm/drm_blend.h>
+#include <drm/drm_framebuffer.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_disp_drv.h"
+#include "mtk_drm_drv.h"
+#include "mtk_disp_ovl.h"
+
+#define DISP_REG_OVL_EXDMA_EN_CON		0xc
+#define OVL_EXDMA_OP_8BIT_MODE				BIT(4)
+#define OVL_EXDMA_HG_FOVL_EXDMA_CK_ON			BIT(8)
+#define OVL_EXDMA_HF_FOVL_EXDMA_CK_ON			BIT(10)
+#define DISP_REG_OVL_EXDMA_DATAPATH_CON		0x014
+#define OVL_EXDMA_DATAPATH_CON_LAYER_SMI_ID_EN		BIT(0)
+#define OVL_EXDMA_DATAPATH_CON_GCLAST_EN		BIT(24)
+#define OVL_EXDMA_DATAPATH_CON_HDR_GCLAST_EN		BIT(25)
+#define DISP_REG_OVL_EXDMA_EN			0x020
+#define OVL_EXDMA_EN					BIT(0)
+#define DISP_REG_OVL_EXDMA_RST			0x024
+#define OVL_EXDMA_RST					BIT(0)
+#define DISP_REG_OVL_EXDMA_ROI_SIZE		0x030
+#define DISP_REG_OVL_EXDMA_L0_EN		0x040
+#define OVL_EXDMA_L0_EN					BIT(0)
+#define DISP_REG_OVL_EXDMA_L0_OFFSET		0x044
+#define DISP_REG_OVL_EXDMA_SRC_SIZE		0x048
+#define DISP_REG_OVL_EXDMA_L0_CLRFMT		0x050
+#define OVL_EXDMA_CON_FLD_CLRFMT			GENMASK(3, 0)
+#define OVL_EXDMA_CON_CLRFMT_MAN			BIT(4)
+#define OVL_EXDMA_CON_FLD_CLRFMT_NB			GENMASK(9, 8)
+#define OVL_EXDMA_CON_CLRFMT_NB_10_BIT			BIT(8)
+#define OVL_EXDMA_CON_BYTE_SWAP				BIT(16)
+#define OVL_EXDMA_CON_RGB_SWAP				BIT(17)
+#define DISP_REG_OVL_EXDMA_RDMA0_CTRL		0x100
+#define OVL_EXDMA_RDMA0_EN				BIT(0)
+#define DISP_REG_OVL_EXDMA_RDMA_BURST_CON1	0x1f4
+#define OVL_EXDMA_RDMA_BURST_CON1_BURST16_EN		BIT(28)
+#define OVL_EXDMA_RDMA_BURST_CON1_DDR_EN		BIT(30)
+#define OVL_EXDMA_RDMA_BURST_CON1_DDR_ACK_EN		BIT(31)
+#define DISP_REG_OVL_EXDMA_DUMMY_REG		0x200
+#define OVL_EXDMA_EXT_DDR_EN_OPT			BIT(2)
+#define OVL_EXDMA_FORCE_EXT_DDR_EN			BIT(3)
+#define DISP_REG_OVL_EXDMA_GDRDY_PRD		0x208
+#define DISP_REG_OVL_EXDMA_PITCH_MSB		0x2f0
+#define OVL_EXDMA_L0_SRC_PITCH_MSB_MASK			GENMASK(3, 0)
+#define DISP_REG_OVL_EXDMA_PITCH		0x2f4
+#define OVL_EXDMA_L0_SRC_PITCH				GENMASK(15, 0)
+#define OVL_EXDMA_L0_CONST_BLD				BIT(28)
+#define OVL_EXDMA_L0_SRC_PITCH_MASK			GENMASK(15, 0)
+#define DISP_REG_OVL_EXDMA_L0_GUSER_EXT		0x2fc
+#define OVL_EXDMA_RDMA0_L0_VCSEL			BIT(5)
+#define OVL_EXDMA_RDMA0_HDR_L0_VCSEL			BIT(21)
+#define DISP_REG_OVL_EXDMA_CON			0x300
+#define OVL_EXDMA_CON_FLD_INT_MTX_SEL			GENMASK(19, 16)
+#define OVL_EXDMA_CON_INT_MTX_BT601_TO_RGB		(6 << 16)
+#define OVL_EXDMA_CON_INT_MTX_BT709_TO_RGB		(7 << 16)
+#define OVL_EXDMA_CON_INT_MTX_EN			BIT(27)
+#define DISP_REG_OVL_EXDMA_ADDR			0xf40
+#define DISP_REG_OVL_EXDMA_MOUT			0xff0
+#define OVL_EXDMA_MOUT_OUT_DATA				BIT(0)
+#define OVL_EXDMA_MOUT_BGCLR_OUT			BIT(1)
+
+struct mtk_disp_exdma_data {
+	unsigned int max_size;
+};
+
+struct mtk_disp_exdma {
+	void __iomem *regs;
+	struct clk *clk;
+	struct cmdq_client_reg cmdq_reg;
+	struct device *larb;
+	const struct mtk_disp_exdma_data *data;
+};
+
+static unsigned int  mtk_disp_exdma_color_convert(unsigned int color_encoding)
+{
+	switch (color_encoding) {
+	default:
+	case DRM_COLOR_YCBCR_BT709:
+		return OVL_EXDMA_CON_INT_MTX_BT709_TO_RGB;
+	case DRM_COLOR_YCBCR_BT601:
+		return OVL_EXDMA_CON_INT_MTX_BT601_TO_RGB;
+	}
+}
+
+void mtk_disp_exdma_start(struct device *dev)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+	unsigned int value = 0, mask = 0;
+
+	/*
+	 * This configuration enables dynamic power switching mechanism for EXDMA,
+	 * also known as "SRT mode".
+	 * Such configuration allows the system to achieve better power efficiency.
+	 */
+	value = OVL_EXDMA_RDMA_BURST_CON1_BURST16_EN | OVL_EXDMA_RDMA_BURST_CON1_DDR_ACK_EN;
+	mask = OVL_EXDMA_RDMA_BURST_CON1_BURST16_EN | OVL_EXDMA_RDMA_BURST_CON1_DDR_EN |
+	       OVL_EXDMA_RDMA_BURST_CON1_DDR_ACK_EN;
+	mtk_ddp_write_mask(NULL, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_RDMA_BURST_CON1, mask);
+
+	/*
+	 * The dummy register is used in the configuration of the EXDMA engine to
+	 * signal ddren_request, and get ddren_ack before accessing the DRAM to
+	 * ensure data transfers occur normally.
+	 * primarily functions as a DMA engine for reading data from DRAM with
+	 * various DRAM footprints and data formats.
+	 */
+	value = OVL_EXDMA_EXT_DDR_EN_OPT | OVL_EXDMA_FORCE_EXT_DDR_EN;
+
+	mtk_ddp_write_mask(NULL, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_DUMMY_REG, value);
+
+	value = OVL_EXDMA_DATAPATH_CON_LAYER_SMI_ID_EN |
+		OVL_EXDMA_DATAPATH_CON_HDR_GCLAST_EN |
+		OVL_EXDMA_DATAPATH_CON_GCLAST_EN;
+
+	mtk_ddp_write_mask(NULL, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_DATAPATH_CON, value);
+
+	mtk_ddp_write_mask(NULL, OVL_EXDMA_MOUT_BGCLR_OUT, &priv->cmdq_reg,
+			   priv->regs, DISP_REG_OVL_EXDMA_MOUT,
+			   OVL_EXDMA_MOUT_BGCLR_OUT | OVL_EXDMA_MOUT_OUT_DATA);
+
+	mtk_ddp_write(NULL, ~0, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_EXDMA_GDRDY_PRD);
+
+	value = OVL_EXDMA_HG_FOVL_EXDMA_CK_ON | OVL_EXDMA_HF_FOVL_EXDMA_CK_ON |
+		OVL_EXDMA_OP_8BIT_MODE;
+	mtk_ddp_write_mask(NULL, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_EN_CON, value);
+	mtk_ddp_write_mask(NULL, OVL_EXDMA_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_EN, OVL_EXDMA_EN);
+}
+
+void mtk_disp_exdma_stop(struct device *dev)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+	unsigned int mask;
+
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_EN, OVL_EXDMA_EN);
+	mask = OVL_EXDMA_HG_FOVL_EXDMA_CK_ON | OVL_EXDMA_HF_FOVL_EXDMA_CK_ON |
+		OVL_EXDMA_OP_8BIT_MODE;
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_EN_CON, mask);
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_DATAPATH_CON, OVL_EXDMA_DATAPATH_CON_LAYER_SMI_ID_EN);
+	mtk_ddp_write_mask(NULL, OVL_EXDMA_RST, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_RST, OVL_EXDMA_RST);
+	mtk_ddp_write_mask(NULL, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_RST, OVL_EXDMA_RST);
+}
+
+void mtk_disp_exdma_layer_config(struct device *dev, struct mtk_plane_state *state,
+				 struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	bool csc_enable = (fmt_info) ? fmt_info->is_yuv : false;
+	u32 blend_mode = mtk_ovl_get_blend_mode(state, MTK_OVL_SUPPORT_BLEND_MODES);
+	u32 val;
+
+	if (!pending->enable || pending->height == 0 || pending->width == 0 ||
+	    pending->x > priv->data->max_size || pending->y > priv->data->max_size) {
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_EXDMA_RDMA0_CTRL, OVL_EXDMA_RDMA0_EN);
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_EXDMA_L0_EN, OVL_EXDMA_L0_EN);
+		return;
+	}
+
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | pending->width, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_EXDMA_ROI_SIZE);
+
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | pending->width, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_EXDMA_SRC_SIZE);
+
+	mtk_ddp_write(cmdq_pkt, pending->y << 16 | pending->x, &priv->cmdq_reg, priv->regs,
+		      DISP_REG_OVL_EXDMA_L0_OFFSET);
+	mtk_ddp_write(cmdq_pkt, pending->addr, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_EXDMA_ADDR);
+
+	val = pending->pitch;
+	if (mtk_ovl_is_ignore_pixel_alpha(state, blend_mode))
+		val |= OVL_EXDMA_L0_CONST_BLD;
+
+	mtk_ddp_write_mask(cmdq_pkt, val, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_EXDMA_PITCH,
+			   OVL_EXDMA_L0_CONST_BLD | OVL_EXDMA_L0_SRC_PITCH);
+	mtk_ddp_write_mask(cmdq_pkt, pending->pitch >> 16, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_PITCH_MSB, OVL_EXDMA_L0_SRC_PITCH_MSB_MASK);
+
+	val = mtk_disp_exdma_color_convert(pending->color_encoding);
+	if (csc_enable)
+		val |= OVL_EXDMA_CON_INT_MTX_EN;
+	mtk_ddp_write_mask(cmdq_pkt, val, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_EXDMA_CON,
+			   OVL_EXDMA_CON_FLD_INT_MTX_SEL | OVL_EXDMA_CON_INT_MTX_EN);
+
+	val = mtk_ovl_fmt_convert(pending->format, blend_mode, true, false, 0,
+				  OVL_EXDMA_CON_CLRFMT_MAN, OVL_EXDMA_CON_BYTE_SWAP,
+				  OVL_EXDMA_CON_RGB_SWAP);
+	if (mtk_ovl_is_10bit_rgb(pending->format))
+		val |= OVL_EXDMA_CON_CLRFMT_NB_10_BIT;
+	mtk_ddp_write_mask(cmdq_pkt, val, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_L0_CLRFMT,
+			   OVL_EXDMA_CON_RGB_SWAP | OVL_EXDMA_CON_BYTE_SWAP |
+			   OVL_EXDMA_CON_CLRFMT_MAN | OVL_EXDMA_CON_FLD_CLRFMT |
+			   OVL_EXDMA_CON_FLD_CLRFMT_NB);
+
+	val = OVL_EXDMA_RDMA0_L0_VCSEL | OVL_EXDMA_RDMA0_HDR_L0_VCSEL;
+	mtk_ddp_write_mask(cmdq_pkt, val, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_L0_GUSER_EXT, val);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_EXDMA_RDMA0_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_RDMA0_CTRL, OVL_EXDMA_RDMA0_EN);
+	mtk_ddp_write_mask(cmdq_pkt, OVL_EXDMA_L0_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EXDMA_L0_EN, OVL_EXDMA_L0_EN);
+}
+
+const u32 *mtk_disp_exdma_get_formats(struct device *dev)
+{
+	return mt8195_ovl_formats;
+}
+
+size_t mtk_disp_exdma_get_num_formats(struct device *dev)
+{
+	return mt8195_ovl_formats_len;
+}
+
+int mtk_disp_exdma_clk_enable(struct device *dev)
+{
+	struct mtk_disp_exdma *exdma = dev_get_drvdata(dev);
+
+	return clk_prepare_enable(exdma->clk);
+}
+
+void mtk_disp_exdma_clk_disable(struct device *dev)
+{
+	struct mtk_disp_exdma *exdma = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(exdma->clk);
+}
+
+static int mtk_disp_exdma_bind(struct device *dev, struct device *master,
+			       void *data)
+{
+	return 0;
+}
+
+static void mtk_disp_exdma_unbind(struct device *dev, struct device *master,
+				  void *data)
+{
+}
+
+static const struct component_ops mtk_disp_exdma_component_ops = {
+	.bind	= mtk_disp_exdma_bind,
+	.unbind = mtk_disp_exdma_unbind,
+};
+
+static int mtk_disp_exdma_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct platform_device *larb_pdev = NULL;
+	struct device_node *larb_node = NULL;
+	struct resource *res;
+	struct mtk_disp_exdma *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->regs = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->regs)) {
+		dev_err(dev, "failed to ioremap exdma\n");
+		return PTR_ERR(priv->regs);
+	}
+
+	priv->clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(priv->clk)) {
+		dev_err(dev, "failed to get exdma clk\n");
+		return PTR_ERR(priv->clk);
+	}
+
+	larb_node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
+	if (larb_node) {
+		larb_pdev = of_find_device_by_node(larb_node);
+		if (larb_pdev)
+			priv->larb = &larb_pdev->dev;
+		of_node_put(larb_node);
+	}
+
+	if (!priv->larb) {
+		dev_dbg(dev, "not find larb dev");
+		return -EPROBE_DEFER;
+	}
+	device_link_add(dev, priv->larb, DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
+	if (ret)
+		dev_dbg(dev, "No mediatek,gce-client-reg\n");
+#endif
+	priv->data = of_device_get_match_data(dev);
+	platform_set_drvdata(pdev, priv);
+
+	pm_runtime_enable(dev);
+
+	ret = component_add(dev, &mtk_disp_exdma_component_ops);
+	if (ret != 0) {
+		pm_runtime_disable(dev);
+		dev_err(dev, "Failed to add component: %d\n", ret);
+	}
+	return ret;
+}
+
+static void mtk_disp_exdma_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_disp_exdma_component_ops);
+	pm_runtime_disable(&pdev->dev);
+}
+
+static const struct mtk_disp_exdma_data mt8196_disp_exdma_driver_data = {
+	.max_size = 8191,
+};
+
+static const struct of_device_id mtk_disp_exdma_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-exdma",
+	  .data = &mt8196_disp_exdma_driver_data},
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_disp_exdma_driver_dt_match);
+
+struct platform_driver mtk_disp_exdma_driver = {
+	.probe = mtk_disp_exdma_probe,
+	.remove = mtk_disp_exdma_remove,
+	.driver = {
+		.name = "mediatek-disp-exdma",
+		.owner = THIS_MODULE,
+		.of_match_table = mtk_disp_exdma_driver_dt_match,
+	},
+};
+
+MODULE_AUTHOR("Nancy Lin <nancy.lin@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek Exdma Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index d5e6bab36414..f9ae81cbd019 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1290,6 +1290,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_disp_aal_driver,
 	&mtk_disp_ccorr_driver,
 	&mtk_disp_color_driver,
+	&mtk_disp_exdma_driver,
 	&mtk_disp_gamma_driver,
 	&mtk_disp_merge_driver,
 	&mtk_disp_ovl_adaptor_driver,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 675cdc90a440..898a75898775 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -72,6 +72,7 @@ struct mtk_drm_private {
 extern struct platform_driver mtk_disp_aal_driver;
 extern struct platform_driver mtk_disp_ccorr_driver;
 extern struct platform_driver mtk_disp_color_driver;
+extern struct platform_driver mtk_disp_exdma_driver;
 extern struct platform_driver mtk_disp_gamma_driver;
 extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_disp_ovl_adaptor_driver;
-- 
2.45.2

