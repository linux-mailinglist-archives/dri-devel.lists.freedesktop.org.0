Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81906AB82C9
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 11:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A4E10E7DF;
	Thu, 15 May 2025 09:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="pDRCgd+A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCEA10E7E2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 09:35:15 +0000 (UTC)
X-UUID: e54b0726316f11f082f7f7ac98dee637-20250515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u/+0dwJEixmbwzYEuP2QfiyZsxMQa+r+ZFjKbyOO3Rs=; 
 b=pDRCgd+AohafdBjCw9ogFIfIdjzFx5Q4khv2/BxTx8+VEhYluKLachaLJ3LSdWxNtdbvv1K6ItCFsxW5fq3TEZLZ1rSlQRzSBm3E7pid0NXoWjj2IBkwlC/W4HljzShn6+GcoCSOjCQGk8J+7VqsNXEOdTDqIkG6stcIn0Svb2Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1, REQID:5119fa08-23f6-4ce4-bbe5-5bb11ac5b293, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:0ef645f, CLOUDID:abe504c0-eade-4d5b-9f81-31d7b5452436,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
 ,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
 :0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e54b0726316f11f082f7f7ac98dee637-20250515
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1771164103; Thu, 15 May 2025 17:35:10 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 15 May 2025 17:35:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 15 May 2025 17:35:09 +0800
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
Subject: [PATCH v3 11/17] drm/mediatek: drm/mediatek: Export OVL ignore pixel
 alpha function
Date: Thu, 15 May 2025 17:34:23 +0800
Message-ID: <20250515093454.1729720-12-paul-pl.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
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

For the new BLENDER component, the OVL ignore pixel alpha logic
should be exported as a function and reused it.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a516b7c82b5a..747898a574da 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -211,6 +211,23 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode)
+{
+	if (!state->base.fb)
+		return false;
+	/*
+	 * Although the alpha channel can be ignored, CONST_BLD must be enabled
+	 * for XRGB format, otherwise OVL will still read the value from memory.
+	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+	 * affect the result. Therefore we use !has_alpha as the condition.
+	 */
+
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
+		return true;
+
+	return false;
+}
+
 u32 mtk_ovl_get_blend_modes(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -539,7 +556,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int rotation = pending->rotation;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
-	unsigned int blend_mode = state->base.pixel_blend_mode;
+	unsigned int blend_mode = mtk_ovl_get_blend_mode(state, ovl->data->blend_modes);
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 
@@ -557,7 +574,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		 * For blend_modes supported SoCs, always enable alpha blending.
 		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
 		 */
-		if (blend_mode || state->base.fb->format->has_alpha)
+		if (state->base.pixel_blend_mode || state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
 	}
 
@@ -584,6 +601,9 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
+
+	if (mtk_ovl_is_ignore_pixel_alpha(state, blend_mode))
+		ignore_pixel_alpha = OVL_CONST_BLEND;
 	mtk_ddp_write_relaxed(cmdq_pkt, pitch_lsb | ignore_pixel_alpha,
 			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
index 3f7d7d54479d..431567538eb5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -20,6 +20,7 @@ extern const u32 mt8195_ovl_formats[];
 extern const size_t mt8195_ovl_formats_len;
 
 bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode);
 unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes);
 unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
 				 bool fmt_rgb565_is_0, bool color_convert,
-- 
2.45.2

