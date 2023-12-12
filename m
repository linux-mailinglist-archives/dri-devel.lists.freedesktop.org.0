Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DAC80EB81
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 13:20:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0D510E5F6;
	Tue, 12 Dec 2023 12:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6AF10E5E0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 12:20:10 +0000 (UTC)
X-UUID: c6b7078698e811eeba30773df0976c77-20231212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ieYGvdKX/O8oWqSbJuyH2sRjtlQXogz01qgELDwpc6A=; 
 b=Pwk4570kvF2ndYzjojfqUVXjBqsGYeBBsAOFqbMTUIlO8QQJOMAgE+vlqoqew7NSEmbpIAur7X8FvJy5VHXr3+YrLWvrZNPTj5Obaj0CrcguqffUypyUxmaBfV8kt0bzruAQl0/aLjjLNYqXtLYun2v7dtRdwTkpAC1kZLy0V5g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35, REQID:c78da633-ee65-4734-b21a-87ad4ca76620, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:5d391d7, CLOUDID:4f3b1c61-c89d-4129-91cb-8ebfae4653fc,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
 DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c6b7078698e811eeba30773df0976c77-20231212
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 794778524; Tue, 12 Dec 2023 20:20:02 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Dec 2023 20:20:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Dec 2023 20:20:01 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v4 09/17] drm/mediatek: Support CSC in OVL
Date: Tue, 12 Dec 2023 20:19:49 +0800
Message-ID: <20231212121957.19231-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231212121957.19231-1-shawn.sung@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Fei Shao <fshao@chromium.org>,
 Sean Paul <sean@poorly.run>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support Color Transform Control (CSC) in Overlay to
do Y2R or R2R conversion.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 121 +++++++++++++++++++++++-
 1 file changed, 118 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 66074c2d917c..7e217142d0c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -31,6 +31,7 @@
 #define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define OVL_LAYER_AFBC_EN(n)				BIT(4+n)
+#define OVL_OUTPUT_CLAMP				BIT(26)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
@@ -44,6 +45,23 @@
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
 #define DISP_REG_OVL_CLRFMT_EXT			0x02D0
+#define DISP_REG_OVL_CLRFMT_EXT1		0x02D8
+#define OVL_CLRFMT_EXT1_CSC_EN(n)			(1 << (((n) * 4) + 1))
+#define DISP_REG_OVL_Y2R_PARA_R0(n)		(0x0134 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_RMY				(GENMASK(14, 0))
+#define DISP_REG_OVL_Y2R_PARA_G0(n)		(0x013c + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_GMU				(GENMASK(30, 16))
+#define DISP_REG_OVL_Y2R_PARA_B1(n)		(0x0148 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_BMV				(GENMASK(14, 0))
+#define DISP_REG_OVL_Y2R_PARA_YUV_A_0(n)	(0x014c + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_YA				(GENMASK(10, 0))
+#define OVL_Y2R_PARA_C_CF_UA				(GENMASK(26, 16))
+#define DISP_REG_OVL_Y2R_PARA_YUV_A_1(n)	(0x0150 + 0x28 * (n))
+#define OVL_Y2R_PARA_C_CF_VA				(GENMASK(10, 0))
+#define DISP_REG_OVL_Y2R_PRE_ADD2(n)		(0x0154 + 0x28 * (n))
+#define DISP_REG_OVL_R2R_R0(n)			(0x0500 + 0x40 * (n))
+#define DISP_REG_OVL_R2R_G1(n)			(0x0510 + 0x40 * (n))
+#define DISP_REG_OVL_R2R_B2(n)			(0x0520 + 0x40 * (n))
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -56,6 +74,8 @@
 #define OVL_CON_CLRFMT_MAN		BIT(23)
 #define OVL_CON_BYTE_SWAP		BIT(24)
 #define OVL_CON_RGB_SWAP		BIT(25)
+#define OVL_CON_MTX_AUTO_DIS		BIT(26)
+#define OVL_CON_MTX_EN			BIT(27)
 #define OVL_CON_CLRFMT_RGB		(1 << 12)
 #define OVL_CON_CLRFMT_RGBA8888		(2 << 12)
 #define OVL_CON_CLRFMT_ARGB8888		(3 << 12)
@@ -63,6 +83,7 @@
 #define OVL_CON_CLRFMT_UYVY		(4 << 12)
 #define OVL_CON_CLRFMT_YUYV		(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB		(6 << 16)
+#define OVL_CON_MTX_PROGRAMMABLE	(8 << 16)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -76,6 +97,22 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
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
 static const u32 mt8173_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
@@ -217,6 +254,14 @@ void mtk_ovl_start(struct device *dev)
 	if (ovl->data->smi_id_en)
 		reg |= OVL_LAYER_SMI_ID_EN;
 
+	/*
+	 * When doing Y2R conversion, it's common to get an output
+	 * that is larger than 10 bits (negative numbers).
+	 * Enable this bit to clamp the output to 10 bits per channel
+	 * (should always be enabled)
+	 */
+	reg |= OVL_OUTPUT_CLAMP;
+
 	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
 }
@@ -256,9 +301,7 @@ static void mtk_ovl_set_bit_depth(struct device *dev, int idx, u32 format,
 	reg = readl(ovl->regs + DISP_REG_OVL_CLRFMT_EXT);
 	reg &= ~OVL_CON_CLRFMT_BIT_DEPTH_MASK(idx);
 
-	if (format == DRM_FORMAT_RGBA1010102 ||
-	    format == DRM_FORMAT_BGRA1010102 ||
-	    format == DRM_FORMAT_ARGB2101010)
+	if (is_10bit_rgb(format))
 		bit_depth = OVL_CON_CLRFMT_10_BIT;
 
 	reg |= OVL_CON_CLRFMT_BIT_DEPTH(bit_depth, idx);
@@ -458,6 +501,78 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	    (state->base.fb && !state->base.fb->format->has_alpha))
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
+	/* need to do Y2R and R2R to reduce 10bit data to 8bit for CRC calculation */
+	if (ovl->data->supports_clrfmt_ext) {
+		u32 y2r_coef = 0, y2r_offset = 0, r2r_coef = 0, csc_en = 0;
+
+		if (is_10bit_rgb(fmt)) {
+			con |= OVL_CON_MTX_AUTO_DIS | OVL_CON_MTX_EN | OVL_CON_MTX_PROGRAMMABLE;
+
+			/*
+			 * Y2R coef setting
+			 * bit 13 is 2^1, bit 12 is 2^0, bit 11 is 2^-1,
+			 * bit 10 is 2^-2 = 0.25
+			 */
+			y2r_coef = BIT(10);
+
+			/* -1 in 10bit */
+			y2r_offset = GENMASK(10, 0) - 1;
+
+			/*
+			 * R2R coef setting
+			 * bit 19 is 2^1, bit 18 is 2^0, bit 17 is 2^-1,
+			 * bit 20 is 2^2 = 4
+			 */
+			r2r_coef = BIT(20);
+
+			/* CSC_EN is for R2R */
+			csc_en = OVL_CLRFMT_EXT1_CSC_EN(idx);
+
+			/*
+			 * 1. YUV input data - 1 and shift right for 2 bits to remove it
+			 * [R']   [0.25    0    0]   [Y in - 1]
+			 * [G'] = [   0 0.25    0] * [U in - 1]
+			 * [B']   [   0    0 0.25]   [V in - 1]
+			 *
+			 * 2. shift left for 2 bit letting the last 2 bits become 0
+			 * [R out]   [ 4  0  0]   [R']
+			 * [G out] = [ 0  4  0] * [G']
+			 * [B out]   [ 0  0  4]   [B']
+			 */
+		}
+
+		mtk_ddp_write_mask(cmdq_pkt, y2r_coef,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_R0(idx),
+				   OVL_Y2R_PARA_C_CF_RMY);
+		mtk_ddp_write_mask(cmdq_pkt, (y2r_coef << 16),
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_G0(idx),
+				   OVL_Y2R_PARA_C_CF_GMU);
+		mtk_ddp_write_mask(cmdq_pkt, y2r_coef,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_B1(idx),
+				   OVL_Y2R_PARA_C_CF_BMV);
+
+		mtk_ddp_write_mask(cmdq_pkt, y2r_offset,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_0(idx),
+				   OVL_Y2R_PARA_C_CF_YA);
+		mtk_ddp_write_mask(cmdq_pkt, (y2r_offset << 16),
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_0(idx),
+				   OVL_Y2R_PARA_C_CF_UA);
+		mtk_ddp_write_mask(cmdq_pkt, y2r_offset,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_Y2R_PARA_YUV_A_1(idx),
+				   OVL_Y2R_PARA_C_CF_VA);
+
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_R0(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_G1(idx));
+		mtk_ddp_write_relaxed(cmdq_pkt, r2r_coef,
+				      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_R2R_B2(idx));
+
+		mtk_ddp_write_mask(cmdq_pkt, csc_en,
+				   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_CLRFMT_EXT1,
+				   OVL_CLRFMT_EXT1_CSC_EN(idx));
+	}
+
 	if (pending->rotation & DRM_MODE_REFLECT_Y) {
 		con |= OVL_CON_VIRT_FLIP;
 		addr += (pending->height - 1) * pending->pitch;
-- 
2.18.0

