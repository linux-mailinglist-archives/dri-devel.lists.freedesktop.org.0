Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E3CA09EF9
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 01:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7A010E53E;
	Sat, 11 Jan 2025 00:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="MOvq6+Zs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4C10F0A9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 12:38:53 +0000 (UTC)
X-UUID: d69b67a2cf4f11efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0u1wQO2zufZ0kzmCLTDdwhe8X9DVVLmXTHkddiqRkDI=; 
 b=MOvq6+ZsR5UU+vfG1tObV3STcGWcUnR9c6gun45y9DwnB8UG5O6QiWZGSMRbIq7h4kaQrNdOzirqwtp6UfQJn0BCH6kk9qFlPNzttbX5OsZck+e25iuk0vIdTEW1DAwEqd3hagnRs2PkpadVv+W1LoTRARqOkpboS80uPnTa2Jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46, REQID:854c240a-c5c6-43b1-987b-fa682d70eb64, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:60aa074, CLOUDID:ba6f4e13-8831-4185-8e40-f83b1917e828,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
 IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
 0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d69b67a2cf4f11efbd192953cf12861f-20250110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 442665570; Fri, 10 Jan 2025 20:38:48 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 20:38:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 20:38:46 +0800
From: paul-pl.chen <paul-pl.chen@mediatek.com>
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
Subject: [PATCH 08/12] drm/mediatek: add EXDMA support for MT8196
Date: Fri, 10 Jan 2025 20:34:04 +0800
Message-ID: <20250110123835.2719824-10-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Sat, 11 Jan 2025 00:10:20 +0000
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

From: "Nancy.Lin" <nancy.lin@mediatek.com>

EXDMA is a DMA engine for reading data from DRAM with
various DRAM footprints and data formats. For input
sources in certain color formats and color domains,
EXDMA also includes a color transfer function to
process pixels into a consistent color domain.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile         |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   9 +
 drivers/gpu/drm/mediatek/mtk_disp_exdma.c | 447 ++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
 7 files changed, 461 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_exdma.c

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 32a2ed6c0cfe..db92f4fb353d 100644
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
index edc6417639e6..3e0739d8e6f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -445,6 +445,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DP_INTF] = "dp-intf",
 	[MTK_DPI] = "dpi",
 	[MTK_DSI] = "dsi",
+	[MTK_OVL_EXDMA] = "exdma",
 };
 
 struct mtk_ddp_comp_match {
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 39720b27f4e9..86dc0ee3924c 100644
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
index 04217a36939c..f8291651dc80 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -39,6 +39,15 @@ void mtk_color_config(struct device *dev, unsigned int w,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
 void mtk_color_start(struct device *dev);
 
+int mtk_disp_exdma_clk_enable(struct device *dev);
+void mtk_disp_exdma_clk_disable(struct device *dev);
+void mtk_disp_exdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_exdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
+void mtk_disp_exdma_config(struct device *dev, struct mtk_plane_state *state,
+			   struct cmdq_pkt *cmdq_pkt);
+const u32 *mtk_disp_exdma_get_formats(struct device *dev);
+size_t mtk_disp_exdma_get_num_formats(struct device *dev);
+
 void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 			   unsigned int bpc, unsigned int cfg,
 			   unsigned int dither_en, struct cmdq_pkt *cmdq_pkt);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_exdma.c b/drivers/gpu/drm/mediatek/mtk_disp_exdma.c
new file mode 100644
index 000000000000..e1d7bda22972
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_disp_exdma.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
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
+
+#define DISP_REG_OVL_EN_CON			0xc
+#define OVL_OP_8BIT_MODE				BIT(4)
+#define OVL_HG_FOVL_CK_ON				BIT(8)
+#define OVL_HF_FOVL_CK_ON				BIT(10)
+#define DISP_REG_OVL_DATAPATH_CON		0x014
+#define DATAPATH_CON_LAYER_SMI_ID_EN			BIT(0)
+#define DATAPATH_CON_GCLAST_EN				BIT(24)
+#define DATAPATH_CON_HDR_GCLAST_EN			BIT(25)
+#define DISP_REG_OVL_EN				0x020
+#define DISP_OVL_EN					BIT(0)
+#define DISP_REG_OVL_RST			0x024
+#define DISP_OVL_RST					BIT(0)
+#define DISP_REG_OVL_ROI_SIZE			0x030
+#define DISP_REG_OVL_L0_EN			0x040
+#define DISP_OVL_L0_EN					BIT(0)
+#define DISP_REG_OVL_OFFSET			0x044
+#define DISP_REG_OVL_SRC_SIZE			0x048
+#define DISP_REG_OVL_L0_CLRFMT			0x050
+#define OVL_CON_FLD_CLRFMT				GENMASK(3, 0)
+#define OVL_CON_CLRFMT_MAN				BIT(4)
+#define OVL_CON_FLD_CLRFMT_NB				GENMASK(9, 8)
+#define OVL_CON_CLRFMT_NB_10_BIT			BIT(8)
+#define OVL_CON_BYTE_SWAP				BIT(16)
+#define OVL_CON_RGB_SWAP				BIT(17)
+#define OVL_CON_CLRFMT_RGB565				0x000
+#define OVL_CON_CLRFMT_BGR888				0x001
+#define OVL_CON_CLRFMT_BGRA8888				0x002
+#define OVL_CON_CLRFMT_ABGRB8888			0x003
+#define OVL_CON_CLRFMT_UYVY				0x004
+#define OVL_CON_CLRFMT_YUYV				0x005
+#define OVL_CON_CLRFMT_BGR565				(0x000 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_RGB888				(0x001 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_RGBA8888				(0x002 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_ARGB8888				(0x003 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_VYUY				(0x004 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_YVYU				(0x005 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_PBGRA8888			(0x003 | OVL_CON_CLRFMT_MAN)
+#define OVL_CON_CLRFMT_PARGB8888			(OVL_CON_CLRFMT_PBGRA8888 | \
+							OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_PRGBA8888			(OVL_CON_CLRFMT_PBGRA8888 | \
+							OVL_CON_RGB_SWAP)
+#define OVL_CON_CLRFMT_PABGR8888			(OVL_CON_CLRFMT_PBGRA8888 | \
+							OVL_CON_RGB_SWAP | \
+							OVL_CON_BYTE_SWAP)
+#define DISP_REG_OVL_RDMA0_CTRL			0x100
+#define DISP_RDMA0_EN					BIT(0)
+#define DISP_REG_OVL_RDMA_BURST_CON1		0x1f4
+#define DISP_RDMA_BURST_CON1_BURST16_EN			BIT(28)
+#define DISP_RDMA_BURST_CON1_DDR_EN			BIT(30)
+#define DISP_RDMA_BURST_CON1_DDR_ACK_EN			BIT(31)
+#define DISP_REG_OVL_DUMMY_REG			0x200
+#define DISP_OVL_EXT_DDR_EN_OPT				BIT(2)
+#define DISP_OVL_FORCE_EXT_DDR_EN			BIT(3)
+#define DISP_REG_OVL_GDRDY_PRD			0x208
+#define DISP_REG_OVL_PITCH_MSB			0x2f0
+#define DISP_REG_OVL_PITCH			0x2f4
+#define OVL_L0_SRC_PITCH				GENMASK(15, 0)
+#define OVL_L0_CONST_BLD				BIT(28)
+#define OVL_L0_SRC_PITCH_MASK				GENMASK(15, 0)
+#define DISP_REG_OVL_L0_GUSER_EXT		0x2fc
+#define OVL_RDMA0_L0_VCSEL				BIT(5)
+#define OVL_RDMA0_HDR_L0_VCSEL				BIT(21)
+#define DISP_REG_OVL_CON			0x300
+#define DISP_OVL_CON_FLD_INT_MTX_SEL			GENMASK(19, 16)
+#define DISP_OVL_CON_INT_MTX_BT601_TO_RGB		(6 << 16)
+#define DISP_OVL_CON_INT_MTX_BT709_TO_RGB		(7 << 16)
+#define DISP_OVL_CON_INT_MTX_EN				BIT(27)
+#define DISP_REG_OVL_ADDR			0xf40
+#define DISP_REG_OVL_MOUT			0xff0
+#define OVL_MOUT_OUT_DATA				BIT(0)
+#define OVL_MOUT_BGCLR_OUT				BIT(1)
+
+static const u32 formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGBX8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_ARGB2101010,
+	DRM_FORMAT_RGBX1010102,
+	DRM_FORMAT_RGBA1010102,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_ABGR2101010,
+	DRM_FORMAT_BGRX1010102,
+	DRM_FORMAT_BGRA1010102,
+};
+
+struct mtk_disp_exdma {
+	void __iomem		*regs;
+	struct clk		*clk;
+	struct cmdq_client_reg	cmdq_reg;
+	struct device		*larb;
+};
+
+static inline bool is_10bit_rgb(u32 fmt)
+{
+	switch (fmt) {
+	case DRM_FORMAT_XRGB2101010:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_RGBX1010102:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_XBGR2101010:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_BGRX1010102:
+	case DRM_FORMAT_BGRA1010102:
+		return true;
+	}
+	return false;
+}
+
+static unsigned int mtk_disp_exdma_fmt_convert(unsigned int fmt, unsigned int blend_mode)
+{
+	/*
+	 * DRM_FORMAT: bit 32->0, OVL_FMT: bit 0->32,
+	 * so DRM_FORMAT_RGB888 = OVL_CON_CLRFMT_BGR888
+	 */
+	switch (fmt) {
+	default:
+	case DRM_FORMAT_BGR565:
+		return OVL_CON_CLRFMT_RGB565;
+	case DRM_FORMAT_RGB565:
+		return OVL_CON_CLRFMT_BGR565;
+	case DRM_FORMAT_RGB888:
+		return OVL_CON_CLRFMT_BGR888;
+	case DRM_FORMAT_BGR888:
+		return OVL_CON_CLRFMT_RGB888;
+	case DRM_FORMAT_RGBX8888:
+	case DRM_FORMAT_RGBA8888:
+	case DRM_FORMAT_RGBA1010102:
+	case DRM_FORMAT_RGBX1010102:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_CON_CLRFMT_PABGR8888 : OVL_CON_CLRFMT_ABGRB8888) |
+			(is_10bit_rgb(fmt) ? OVL_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_BGRX8888:
+	case DRM_FORMAT_BGRA8888:
+	case DRM_FORMAT_BGRA1010102:
+	case DRM_FORMAT_BGRX1010102:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_CON_CLRFMT_PARGB8888 : OVL_CON_CLRFMT_ARGB8888) |
+			(is_10bit_rgb(fmt) ? OVL_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_XRGB8888:
+	case DRM_FORMAT_ARGB8888:
+	case DRM_FORMAT_ARGB2101010:
+	case DRM_FORMAT_XRGB2101010:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_CON_CLRFMT_PBGRA8888 : OVL_CON_CLRFMT_BGRA8888) |
+			(is_10bit_rgb(fmt) ? OVL_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_XBGR8888:
+	case DRM_FORMAT_ABGR8888:
+	case DRM_FORMAT_ABGR2101010:
+	case DRM_FORMAT_XBGR2101010:
+		return ((blend_mode == DRM_MODE_BLEND_PREMULTI) ?
+			OVL_CON_CLRFMT_PRGBA8888 : OVL_CON_CLRFMT_RGBA8888) |
+			(is_10bit_rgb(fmt) ? OVL_CON_CLRFMT_NB_10_BIT : 0);
+	case DRM_FORMAT_UYVY:
+		return OVL_CON_CLRFMT_UYVY;
+	case DRM_FORMAT_YUYV:
+		return OVL_CON_CLRFMT_YUYV;
+	}
+}
+
+static unsigned int exdma_color_convert(unsigned int color_encoding)
+{
+	switch (color_encoding) {
+	default:
+	case DRM_COLOR_YCBCR_BT709:
+		return DISP_OVL_CON_INT_MTX_BT709_TO_RGB;
+	case DRM_COLOR_YCBCR_BT601:
+		return DISP_OVL_CON_INT_MTX_BT601_TO_RGB;
+	}
+}
+
+void mtk_disp_exdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+	unsigned int value = 0, mask = 0;
+
+	value = DISP_RDMA_BURST_CON1_BURST16_EN | DISP_RDMA_BURST_CON1_DDR_ACK_EN;
+	mask = DISP_RDMA_BURST_CON1_BURST16_EN | DISP_RDMA_BURST_CON1_DDR_EN |
+	       DISP_RDMA_BURST_CON1_DDR_ACK_EN;
+	mtk_ddp_write_mask(cmdq_pkt, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_RDMA_BURST_CON1, mask);
+	/*
+	 * The dummy register is used in the configuration of the EXDMA engine to
+	 * write commands to DRAM, ensuring that data transfers occur normally.
+	 */
+	value = DISP_OVL_EXT_DDR_EN_OPT | DISP_OVL_FORCE_EXT_DDR_EN;
+	mask = DISP_OVL_EXT_DDR_EN_OPT | DISP_OVL_FORCE_EXT_DDR_EN;
+	mtk_ddp_write_mask(cmdq_pkt, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_DUMMY_REG, mask);
+
+	value = DATAPATH_CON_LAYER_SMI_ID_EN | DATAPATH_CON_HDR_GCLAST_EN | DATAPATH_CON_GCLAST_EN;
+	mask = DATAPATH_CON_LAYER_SMI_ID_EN | DATAPATH_CON_HDR_GCLAST_EN | DATAPATH_CON_GCLAST_EN;
+	mtk_ddp_write_mask(cmdq_pkt, value, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_DATAPATH_CON, mask);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_MOUT_BGCLR_OUT, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_MOUT, OVL_MOUT_BGCLR_OUT | OVL_MOUT_OUT_DATA);
+
+	mtk_ddp_write(cmdq_pkt, ~0, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_GDRDY_PRD);
+
+	mtk_ddp_write_mask(cmdq_pkt, DISP_RDMA0_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_RDMA0_CTRL, DISP_RDMA0_EN);
+	mtk_ddp_write_mask(cmdq_pkt, DISP_OVL_L0_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_L0_EN, DISP_OVL_L0_EN);
+
+	mtk_ddp_write_mask(cmdq_pkt, DISP_OVL_EN, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_EN, DISP_OVL_EN);
+}
+
+void mtk_disp_exdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_EN, DISP_OVL_EN);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_RDMA0_CTRL, DISP_RDMA0_EN);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_DATAPATH_CON, DATAPATH_CON_LAYER_SMI_ID_EN);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_L0_EN, DISP_OVL_L0_EN);
+	mtk_ddp_write_mask(cmdq_pkt, DISP_OVL_RST, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_RST, DISP_OVL_RST);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_RST, DISP_OVL_RST);
+}
+
+void mtk_disp_exdma_config(struct device *dev, struct mtk_plane_state *state,
+			   struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_disp_exdma *priv = dev_get_drvdata(dev);
+	struct mtk_plane_pending_state *pending = &state->pending;
+	const struct drm_format_info *fmt_info = drm_format_info(pending->format);
+	unsigned int align_width = 0;
+	bool csc_enable = fmt_info->is_yuv ? true : false;
+	unsigned int blend_mode = DRM_MODE_BLEND_PIXEL_NONE;
+	unsigned int clrfmt = 0;
+	unsigned int clrfmt_mask = OVL_CON_RGB_SWAP |
+				   OVL_CON_BYTE_SWAP |
+				   OVL_CON_CLRFMT_MAN |
+				   OVL_CON_FLD_CLRFMT |
+				   OVL_CON_FLD_CLRFMT_NB;
+
+	/* OVLSYS is in 1T2P domain, width needs to be 2 pixels align */
+	align_width = ALIGN_DOWN(pending->width, 2);
+
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_ROI_SIZE);
+
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_SRC_SIZE);
+	mtk_ddp_write(cmdq_pkt, pending->height << 16 | align_width, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_SRC_SIZE);
+	mtk_ddp_write(cmdq_pkt, pending->addr, &priv->cmdq_reg,
+		      priv->regs, DISP_REG_OVL_ADDR);
+	mtk_ddp_write_mask(cmdq_pkt, pending->pitch, &priv->cmdq_reg, priv->regs, OVL_L0_SRC_PITCH,
+			   OVL_L0_SRC_PITCH_MASK);
+	mtk_ddp_write_mask(cmdq_pkt, pending->pitch >> 16, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_PITCH_MSB, 0xf);
+
+	if (csc_enable)
+		mtk_ddp_write_mask(cmdq_pkt, exdma_color_convert(pending->color_encoding) |
+				   DISP_OVL_CON_INT_MTX_EN, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_CON, DISP_OVL_CON_FLD_INT_MTX_SEL |
+				   DISP_OVL_CON_INT_MTX_EN);
+	else
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_REG_OVL_CON,
+				   DISP_OVL_CON_INT_MTX_EN);
+
+	/* alpha blend setting */
+	if (state->base.fb && state->base.fb->format->has_alpha)
+		blend_mode = state->base.pixel_blend_mode;
+
+	clrfmt = mtk_disp_exdma_fmt_convert(pending->format, blend_mode);
+
+	mtk_ddp_write_mask(cmdq_pkt, clrfmt, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_OVL_L0_CLRFMT, clrfmt_mask);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_OP_8BIT_MODE | OVL_HG_FOVL_CK_ON | OVL_HF_FOVL_CK_ON,
+			   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_EN_CON,
+			   OVL_OP_8BIT_MODE | OVL_HG_FOVL_CK_ON | OVL_HF_FOVL_CK_ON);
+
+	mtk_ddp_write_mask(cmdq_pkt, OVL_RDMA0_L0_VCSEL | OVL_RDMA0_HDR_L0_VCSEL,
+			   &priv->cmdq_reg, priv->regs, DISP_REG_OVL_L0_GUSER_EXT,
+			   OVL_RDMA0_L0_VCSEL | OVL_RDMA0_HDR_L0_VCSEL);
+
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
+		mtk_ddp_write_mask(cmdq_pkt, OVL_L0_CONST_BLD | pending->pitch,
+				   &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_PITCH, OVL_L0_CONST_BLD | OVL_L0_SRC_PITCH);
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, pending->pitch, &priv->cmdq_reg, priv->regs,
+				   DISP_REG_OVL_PITCH, OVL_L0_CONST_BLD | OVL_L0_SRC_PITCH);
+	}
+}
+
+const u32 *mtk_disp_exdma_get_formats(struct device *dev)
+{
+	return formats;
+}
+
+size_t mtk_disp_exdma_get_num_formats(struct device *dev)
+{
+	return ARRAY_SIZE(formats);
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
+static const struct of_device_id mtk_disp_exdma_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-exdma", },
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
index 8c8da188df09..ccbf46d0707a 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1261,6 +1261,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
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
2.34.1

