Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC1855ED7
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:11:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E4C10E572;
	Thu, 15 Feb 2024 10:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="J3V/kIyT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D3A10E295
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:11:29 +0000 (UTC)
X-UUID: 931f1762cbea11ee9e680517dc993faa-20240215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W1QykbO/3midtkgKGs9LD2x16gmbkyHWS/UTAl4SFzQ=; 
 b=J3V/kIyTXLhYJtpgYQMgHw/hzlq/x3+sdRCnkAuCcpg5CjucElbEZSZHbGGVdl2Sz2bYutulUXjYt4noJfqi9234d8eN+jrDxisb+3dY6UiGzdW4amoxpRUDm/f9AhanDfsf9JHWtabiJnQxv9PHy/10VAFGtddtbI54es02THY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:296dbec4-b394-4286-8b07-428954a623ee, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6f543d0, CLOUDID:1570eb83-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 931f1762cbea11ee9e680517dc993faa-20240215
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2129356478; Thu, 15 Feb 2024 18:11:24 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 15 Feb 2024 18:11:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 15 Feb 2024 18:11:23 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Sean Paul
 <seanpaul@chromium.org>, Fei Shao <fshao@chromium.org>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 11/13] drm/mediatek: Support CRC in OVL
Date: Thu, 15 Feb 2024 18:11:17 +0800
Message-ID: <20240215101119.12629-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240215101119.12629-1-shawn.sung@mediatek.com>
References: <20240215101119.12629-1-shawn.sung@mediatek.com>
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

We choose OVL as the CRC generator from other hardware
components that are also capable of calculating CRCs,
since its frame done event triggers vblanks, it can be
used as a signal to know when is safe to retrieve CRC of
the frame.

Please note that position of the hardware component
that is chosen as CRC generator in the display path is
significant. For example, while OVL is the first module
in VDOSYS0, its CRC won't be affected by the modules
after it, which means effects applied by PQ, Gamma,
Dither or any other components after OVL won't be
calculated in CRC generation.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   3 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 197 +++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   3 +
 3 files changed, 193 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index cd5ca5359b0f0..7ef8dbb07c2db 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -104,6 +104,9 @@ void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
+size_t mtk_ovl_crc_cnt(struct device *dev);
+u32 *mtk_ovl_crc_entry(struct device *dev);
+void mtk_ovl_crc_read(struct device *dev);
 
 void mtk_ovl_adaptor_add_comp(struct device *dev, struct mtk_mutex *mutex);
 void mtk_ovl_adaptor_remove_comp(struct device *dev, struct mtk_mutex *mutex);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 98c989fddcc08..cf35783ad4b02 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -25,12 +25,20 @@
 #define OVL_FME_CPL_INT					BIT(1)
 #define DISP_REG_OVL_INTSTA			0x0008
 #define DISP_REG_OVL_EN				0x000c
+#define OVL_EN						BIT(0)
+#define OVL_OP_8BIT_MODE				BIT(4)
+#define OVL_HG_FOVL_CK_ON				BIT(8)
+#define OVL_HF_FOVL_CK_ON				BIT(10)
+#define DISP_REG_OVL_TRIG			0x0010
+#define OVL_CRC_EN					BIT(8)
+#define OVL_CRC_CLR					BIT(9)
 #define DISP_REG_OVL_RST			0x0014
 #define DISP_REG_OVL_ROI_SIZE			0x0020
 #define DISP_REG_OVL_DATAPATH_CON		0x0024
 #define OVL_LAYER_SMI_ID_EN				BIT(0)
 #define OVL_BGCLR_SEL_IN				BIT(2)
 #define OVL_LAYER_AFBC_EN(n)				BIT(4+n)
+#define OVL_OUTPUT_CLAMP				BIT(26)
 #define DISP_REG_OVL_ROI_BGCLR			0x0028
 #define DISP_REG_OVL_SRC_CON			0x002c
 #define DISP_REG_OVL_CON(n)			(0x0030 + 0x20 * (n))
@@ -43,7 +51,26 @@
 #define DISP_REG_OVL_RDMA_CTRL(n)		(0x00c0 + 0x20 * (n))
 #define DISP_REG_OVL_RDMA_GMC(n)		(0x00c8 + 0x20 * (n))
 #define DISP_REG_OVL_ADDR_MT2701		0x0040
+#define DISP_REG_OVL_CRC			0x0270
+#define OVL_CRC_OUT_MASK				GENMASK(30, 0)
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
@@ -56,6 +83,8 @@
 #define OVL_CON_CLRFMT_MAN	BIT(23)
 #define OVL_CON_BYTE_SWAP	BIT(24)
 #define OVL_CON_RGB_SWAP	BIT(25)
+#define OVL_CON_MTX_AUTO_DIS	BIT(26)
+#define OVL_CON_MTX_EN		BIT(27)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
@@ -63,6 +92,7 @@
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
 #define OVL_CON_CLRFMT_PARGB8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_CLRFMT_MAN)
+#define OVL_CON_MTX_PROGRAMMABLE	(8 << 16)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -130,6 +160,10 @@ static const u32 mt8195_formats[] = {
 	DRM_FORMAT_YUYV,
 };
 
+static const u32 mt8195_ovl_crc_ofs[] = {
+	DISP_REG_OVL_CRC,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -140,12 +174,15 @@ struct mtk_disp_ovl_data {
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
+	const u32 *crc_ofs;
+	size_t crc_cnt;
 };
 
 /*
  * struct mtk_disp_ovl - DISP_OVL driver structure
  * @crtc: associated crtc to report vblank events to
  * @data: platform data
+ * @crc: crc related information
  */
 struct mtk_disp_ovl {
 	struct drm_crtc			*crtc;
@@ -155,8 +192,30 @@ struct mtk_disp_ovl {
 	const struct mtk_disp_ovl_data	*data;
 	void				(*vblank_cb)(void *data);
 	void				*vblank_cb_data;
+	struct mtk_drm_crc		crc;
 };
 
+size_t mtk_ovl_crc_cnt(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.cnt;
+}
+
+u32 *mtk_ovl_crc_entry(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->crc.va;
+}
+
+void mtk_ovl_crc_read(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_drm_crc_read(&ovl->crc, ovl->regs);
+}
+
 static irqreturn_t mtk_disp_ovl_irq_handler(int irq, void *dev_id)
 {
 	struct mtk_disp_ovl *priv = dev_id;
@@ -236,21 +295,40 @@ void mtk_ovl_clk_disable(struct device *dev)
 void mtk_ovl_start(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+	unsigned int reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 
-	if (ovl->data->smi_id_en) {
-		unsigned int reg;
+	if (ovl->data->smi_id_en)
+		reg |= OVL_LAYER_SMI_ID_EN;
 
-		reg = readl(ovl->regs + DISP_REG_OVL_DATAPATH_CON);
-		reg = reg | OVL_LAYER_SMI_ID_EN;
-		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+	/*
+	 * When doing Y2R conversion, it's common to get an output
+	 * that is larger than 10 bits (negative numbers).
+	 * Enable this bit to clamp the output to 10 bits per channel
+	 * (should always be enabled)
+	 */
+	reg |= OVL_OUTPUT_CLAMP;
+	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
+
+	reg = OVL_EN;
+	if (ovl->data->crc_cnt) {
+		/* enable crc  and its related clocks */
+		writel_relaxed(OVL_CRC_EN, ovl->regs + DISP_REG_OVL_TRIG);
+		reg |= OVL_OP_8BIT_MODE | OVL_HG_FOVL_CK_ON | OVL_HF_FOVL_CK_ON;
 	}
-	writel_relaxed(0x1, ovl->regs + DISP_REG_OVL_EN);
+	writel_relaxed(reg, ovl->regs + DISP_REG_OVL_EN);
+
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_start(&ovl->crc);
+#endif
 }
 
 void mtk_ovl_stop(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
 
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	mtk_drm_crc_cmdq_stop(&ovl->crc);
+#endif
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_EN);
 	if (ovl->data->smi_id_en) {
 		unsigned int reg;
@@ -485,6 +563,83 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	    (state->base.fb && !state->base.fb->format->has_alpha))
 		ignore_pixel_alpha = OVL_CONST_BLEND;
 
+	/*
+	 * OVL only supports 8 bits data in CRC calculation, transform 10-bit
+	 * RGB to 8-bit RGB by leveraging the ability of the Y2R (YUV-to-RGB)
+	 * hardware to multiply coefficients, although there is nothing to do
+	 * with the YUV format.
+	 */
+	if (ovl->data->supports_clrfmt_ext) {
+		u32 y2r_coef = 0, y2r_offset = 0, r2r_coef = 0, csc_en = 0;
+
+		if (is_10bit_rgb(fmt)) {
+			con |= OVL_CON_MTX_AUTO_DIS | OVL_CON_MTX_EN | OVL_CON_MTX_PROGRAMMABLE;
+
+			/*
+			 * Y2R coefficient setting
+			 * bit 13 is 2^1, bit 12 is 2^0, bit 11 is 2^-1,
+			 * bit 10 is 2^-2 = 0.25
+			 */
+			y2r_coef = BIT(10);
+
+			/* -1 in 10bit */
+			y2r_offset = GENMASK(10, 0) - 1;
+
+			/*
+			 * R2R coefficient setting
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
@@ -591,15 +746,31 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 		dev_err(dev, "failed to ioremap ovl\n");
 		return PTR_ERR(priv->regs);
 	}
+
+	priv->data = of_device_get_match_data(dev);
+	platform_set_drvdata(pdev, priv);
+
+	if (priv->data->crc_cnt) {
+		mtk_drm_crc_init(&priv->crc,
+				 priv->data->crc_ofs, priv->data->crc_cnt,
+				 DISP_REG_OVL_TRIG, OVL_CRC_CLR);
+	}
+
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
 	if (ret)
 		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
-#endif
-
-	priv->data = of_device_get_match_data(dev);
-	platform_set_drvdata(pdev, priv);
 
+	if (priv->data->crc_cnt) {
+		if (of_property_read_u32_index(dev->of_node,
+					       "mediatek,gce-events", 0,
+					       &priv->crc.cmdq_event)) {
+			dev_warn(dev, "failed to get gce-events for crc\n");
+		}
+		priv->crc.cmdq_reg = &priv->cmdq_reg;
+		mtk_drm_crc_cmdq_create(dev, &priv->crc);
+	}
+#endif
 	ret = devm_request_irq(dev, irq, mtk_disp_ovl_irq_handler,
 			       IRQF_TRIGGER_NONE, dev_name(dev), priv);
 	if (ret < 0) {
@@ -620,6 +791,10 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 static void mtk_disp_ovl_remove(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	mtk_drm_crc_destroy(&ovl->crc);
 	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -690,6 +865,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.formats = mt8195_formats,
 	.num_formats = ARRAY_SIZE(mt8195_formats),
 	.supports_clrfmt_ext = true,
+	.crc_ofs = mt8195_ovl_crc_ofs,
+	.crc_cnt = ARRAY_SIZE(mt8195_ovl_crc_ofs),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index b47be6955d9b8..ea04b2769ae8b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -349,6 +349,9 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.clk_enable = mtk_ovl_clk_enable,
 	.clk_disable = mtk_ovl_clk_disable,
 	.config = mtk_ovl_config,
+	.crc_cnt = mtk_ovl_crc_cnt,
+	.crc_entry = mtk_ovl_crc_entry,
+	.crc_read = mtk_ovl_crc_read,
 	.start = mtk_ovl_start,
 	.stop = mtk_ovl_stop,
 	.register_vblank_cb = mtk_ovl_register_vblank_cb,
-- 
2.18.0

