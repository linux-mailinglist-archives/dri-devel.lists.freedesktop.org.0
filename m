Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316728FE29D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 11:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16D210E899;
	Thu,  6 Jun 2024 09:26:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="gcS2W1en";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CBD10E894
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 09:26:47 +0000 (UTC)
X-UUID: e02a621a23e611efa54bbfbb386b949c-20240606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xCoh3ovKF/Idr/UGe0Fxgoi1Je3Lu5Kl/kdQOB7o+y8=; 
 b=gcS2W1enKGLiyQ0T5HrBjY7Umy4yF/KedArV6ozVDkcJ7Zrb50d3hcbm0gJE3UU3usFB/grcsjojpZd+MNtf864WFHSJFQHmOONWy6GASouDRYZIXC7RdIiEcKYOHvuyhRsjbzfPiNbJ38Jt12SI+qY4tgKT+Y06rhYoOCYgrcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:96771257-a466-413c-8964-de9c88767f19, IP:0,
 U
 RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-5
X-CID-META: VersionHash:393d96e, CLOUDID:363b4744-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e02a621a23e611efa54bbfbb386b949c-20240606
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw01.mediatek.com (envelope-from <shawn.sung@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 468873922; Thu, 06 Jun 2024 17:26:38 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 6 Jun 2024 17:26:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 6 Jun 2024 17:26:37 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bibby
 Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>, "Nancy . Lin"
 <nancy.lin@mediatek.com>, Sean Paul <sean@poorly.run>, Jason Chen
 <jason-ch.chen@mediatek.corp-partner.google.com>, Fei Shao
 <fshao@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, Hsiao Chien Sung
 <shawn.sung@mediatek.com>
Subject: [PATCH v8 11/16] drm/mediatek: Support "Pre-multiplied" blending in
 OVL
Date: Thu, 6 Jun 2024 17:26:30 +0800
Message-ID: <20240606092635.27981-12-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240606092635.27981-1-shawn.sung@mediatek.com>
References: <20240606092635.27981-1-shawn.sung@mediatek.com>
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

From: Hsiao Chien Sung <shawn.sung@mediatek.com>

Support "Pre-multiplied" alpha blending mode on in OVL.
Before this patch, only the "coverage" mode is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 40 +++++++++++++++++++++----
 1 file changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 54a6f11aa867..de1633988921 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -52,13 +52,16 @@
 #define GMC_THRESHOLD_HIGH	((1 << GMC_THRESHOLD_BITS) / 4)
 #define GMC_THRESHOLD_LOW	((1 << GMC_THRESHOLD_BITS) / 8)
 
+#define OVL_CON_CLRFMT_MAN	BIT(23)
 #define OVL_CON_BYTE_SWAP	BIT(24)
-#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+#define OVL_CON_RGB_SWAP	BIT(25)
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(2 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(3 << 12)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
+#define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
+#define OVL_CON_CLRFMT_PARGB8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_CLRFMT_MAN)
 #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
 					0 : OVL_CON_CLRFMT_RGB)
 #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
@@ -72,6 +75,8 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+#define OVL_COLOR_ALPHA		GENMASK(31, 24)
+
 static inline bool is_10bit_rgb(u32 fmt)
 {
 	switch (fmt) {
@@ -296,7 +301,13 @@ void mtk_ovl_config(struct device *dev, unsigned int w,
 	if (w != 0 && h != 0)
 		mtk_ddp_write_relaxed(cmdq_pkt, h << 16 | w, &ovl->cmdq_reg, ovl->regs,
 				      DISP_REG_OVL_ROI_SIZE);
-	mtk_ddp_write_relaxed(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_ROI_BGCLR);
+
+	/*
+	 * The background color must be opaque black (ARGB),
+	 * otherwise the alpha blending will have no effect
+	 */
+	mtk_ddp_write_relaxed(cmdq_pkt, OVL_COLOR_ALPHA, &ovl->cmdq_reg,
+			      ovl->regs, DISP_REG_OVL_ROI_BGCLR);
 
 	mtk_ddp_write(cmdq_pkt, 0x1, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
 	mtk_ddp_write(cmdq_pkt, 0x0, &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_RST);
@@ -372,7 +383,8 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
-static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
+static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt,
+				    unsigned int blend_mode)
 {
 	/* The return value in switch "MEM_MODE_INPUT_FORMAT_XXX"
 	 * is defined in mediatek HW data sheet.
@@ -391,21 +403,35 @@ static unsigned int ovl_fmt_convert(struct mtk_disp_ovl *ovl, unsigned int fmt)
 		return OVL_CON_CLRFMT_RGB888(ovl) | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_RGBX8888:
 	case DRM_FORMAT_RGBA8888:
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ARGB8888 :
+		       OVL_CON_CLRFMT_PARGB8888;
 	case DRM_FORMAT_RGBX1010102:
 	case DRM_FORMAT_RGBA1010102:
 		return OVL_CON_CLRFMT_ARGB8888;
 	case DRM_FORMAT_BGRX8888:
 	case DRM_FORMAT_BGRA8888:
+		return OVL_CON_BYTE_SWAP |
+		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_ARGB8888 :
+		       OVL_CON_CLRFMT_PARGB8888);
 	case DRM_FORMAT_BGRX1010102:
 	case DRM_FORMAT_BGRA1010102:
 		return OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP;
 	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_ARGB8888:
+		return blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_RGBA8888 :
+		       OVL_CON_CLRFMT_PARGB8888;
 	case DRM_FORMAT_XRGB2101010:
 	case DRM_FORMAT_ARGB2101010:
 		return OVL_CON_CLRFMT_RGBA8888;
 	case DRM_FORMAT_XBGR8888:
 	case DRM_FORMAT_ABGR8888:
+		return OVL_CON_RGB_SWAP |
+		       (blend_mode == DRM_MODE_BLEND_COVERAGE ?
+		       OVL_CON_CLRFMT_RGBA8888 :
+		       OVL_CON_CLRFMT_PARGB8888);
 	case DRM_FORMAT_XBGR2101010:
 	case DRM_FORMAT_ABGR2101010:
 		return OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP;
@@ -448,9 +474,11 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		return;
 	}
 
-	con = ovl_fmt_convert(ovl, fmt);
-	if (state->base.fb && state->base.fb->format->has_alpha)
-		con |= OVL_CON_AEN | OVL_CON_ALPHA;
+	con = ovl_fmt_convert(ovl, fmt, blend_mode);
+	if (state->base.fb) {
+		con |= OVL_CON_AEN;
+		con |= state->base.alpha & OVL_CON_ALPHA;
+	}
 
 	/* CONST_BLD must be enabled for XRGB formats although the alpha channel
 	 * can be ignored, or OVL will still read the value from memory.
-- 
2.18.0

