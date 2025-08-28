Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E13B39653
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6734410E1B8;
	Thu, 28 Aug 2025 08:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="oNq5VIK7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0C510E6CA
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:09:14 +0000 (UTC)
X-UUID: 44ca64b283e611f0b33aeb1e7f16c2b6-20250828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=91unXKrGbTDeKulmVuy2IpfFgxjMO7TgUgeAB/op83w=; 
 b=oNq5VIK73QozqL1gB+UyH1oF6am1nUwWDvyrQRhIYaK/bSl+vWg+UWYGmuqim9t9iPfC5OCYy0kBXzSLVJf0myh2Yb1dIrYG3Jw59NC9IIFAWhhFBsIVZAVCg2ZyN/x0mSe9/6PmRVSYhHwFaNmbUnDbWXjQmPJeMs1yit0zlXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3, REQID:889ad49d-bacb-454f-852e-a041dcb38528, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:f1326cf, CLOUDID:1f1bf544-18c5-4075-a135-4c0afe29f9d6,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
 -3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
 AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44ca64b283e611f0b33aeb1e7f16c2b6-20250828
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <paul-pl.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1029624847; Thu, 28 Aug 2025 16:09:06 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH v4 13/19] drm/mediatek: Export OVL Blend function
Date: Thu, 28 Aug 2025 16:07:08 +0800
Message-ID: <20250828080855.3502514-14-paul-pl.chen@mediatek.com>
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

From: Paul-pl Chen <paul-pl.chen@mediatek.com>

For the new BLENDER component, the OVL ignore pixel alpha logic
should be exported as a function and reused it.

Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 68 +++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_disp_ovl.h |  8 +++
 2 files changed, 56 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index e3ee3f60f4ba..7cd3978beb98 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -228,6 +228,23 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode)
+{
+	if (!state->base.fb)
+		return false;
+
+	/*
+	 * Although the alpha channel can be ignored, CONST_BLD must be enabled
+	 * for XRGB format, otherwise OVL will still read the value from memory.
+	 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
+	 * affect the result. Therefore we use !has_alpha as the condition.
+	 */
+	if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
+		return true;
+
+	return false;
+}
+
 u32 mtk_ovl_get_blend_modes(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -414,6 +431,29 @@ void mtk_ovl_layer_off(struct device *dev, unsigned int idx,
 		      DISP_REG_OVL_RDMA_CTRL(idx));
 }
 
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
+{
+	unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
+
+	/*
+	 * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
+	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
+	 * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
+	 *
+	 * Check blend_modes in the driver data to see if premultiplied mode is supported.
+	 * If not, use coverage mode instead to set it to the supported color formats.
+	 *
+	 * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
+	 * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
+	 * will get an error return from drm_plane_create_blend_mode_property() and
+	 * state->base.pixel_blend_mode should not be used.
+	 */
+	if (blend_modes & BIT(DRM_MODE_BLEND_PREMULTI))
+		blend_mode = state->base.pixel_blend_mode;
+
+	return blend_mode;
+}
+
 unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
 				 bool fmt_rgb565_is_0, bool color_convert,
 				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap)
@@ -541,7 +581,7 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 	unsigned int rotation = pending->rotation;
 	unsigned int offset = (pending->y << 16) | pending->x;
 	unsigned int src_size = (pending->height << 16) | pending->width;
-	unsigned int blend_mode = state->base.pixel_blend_mode;
+	unsigned int blend_mode = mtk_ovl_get_blend_mode(state, ovl->data->blend_modes);
 	unsigned int ignore_pixel_alpha = 0;
 	unsigned int con;
 
@@ -566,17 +606,8 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 		 * For blend_modes supported SoCs, always enable alpha blending.
 		 * For blend_modes unsupported SoCs, enable alpha blending when has_alpha is set.
 		 */
-		if (blend_mode || state->base.fb->format->has_alpha)
+		if (state->base.pixel_blend_mode || state->base.fb->format->has_alpha)
 			con |= OVL_CON_AEN;
-
-		/*
-		 * Although the alpha channel can be ignored, CONST_BLD must be enabled
-		 * for XRGB format, otherwise OVL will still read the value from memory.
-		 * For RGB888 related formats, whether CONST_BLD is enabled or not won't
-		 * affect the result. Therefore we use !has_alpha as the condition.
-		 */
-		if (blend_mode == DRM_MODE_BLEND_PIXEL_NONE || !state->base.fb->format->has_alpha)
-			ignore_pixel_alpha = OVL_CONST_BLEND;
 	}
 
 	/*
@@ -602,6 +633,9 @@ void mtk_ovl_layer_config(struct device *dev, unsigned int idx,
 
 	mtk_ddp_write_relaxed(cmdq_pkt, con, &ovl->cmdq_reg, ovl->regs,
 			      DISP_REG_OVL_CON(idx));
+
+	if (mtk_ovl_is_ignore_pixel_alpha(state, blend_mode))
+		ignore_pixel_alpha = OVL_CONST_BLEND;
 	mtk_ddp_write_relaxed(cmdq_pkt, pitch_lsb | ignore_pixel_alpha,
 			      &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_PITCH(idx));
 	mtk_ddp_write_relaxed(cmdq_pkt, src_size, &ovl->cmdq_reg, ovl->regs,
@@ -751,9 +785,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8173_ovl_formats,
 	.num_formats = mt8173_ovl_formats_len,
 };
@@ -764,9 +796,7 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8173_ovl_formats,
 	.num_formats = mt8173_ovl_formats_len,
 };
@@ -778,9 +808,7 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
-	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
-		       BIT(DRM_MODE_BLEND_COVERAGE) |
-		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
+	.blend_modes = MTK_OVL_SUPPORT_BLEND_MODES,
 	.formats = mt8195_ovl_formats,
 	.num_formats = mt8195_ovl_formats_len,
 	.supports_clrfmt_ext = true,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
index 4f446d2e0712..431567538eb5 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.h
@@ -6,14 +6,22 @@
 #ifndef __MTK_DISP_OVL_H__
 #define __MTK_DISP_OVL_H__
 
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 
+#define MTK_OVL_SUPPORT_BLEND_MODES \
+	(BIT(DRM_MODE_BLEND_PREMULTI) | \
+	 BIT(DRM_MODE_BLEND_COVERAGE) | \
+	 BIT(DRM_MODE_BLEND_PIXEL_NONE))
+
 extern const u32 mt8173_ovl_formats[];
 extern const size_t mt8173_ovl_formats_len;
 extern const u32 mt8195_ovl_formats[];
 extern const size_t mt8195_ovl_formats_len;
 
 bool mtk_ovl_is_10bit_rgb(unsigned int fmt);
+bool mtk_ovl_is_ignore_pixel_alpha(struct mtk_plane_state *state, unsigned int blend_mode);
+unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes);
 unsigned int mtk_ovl_fmt_convert(unsigned int fmt, unsigned int blend_mode,
 				 bool fmt_rgb565_is_0, bool color_convert,
 				 u8 clrfmt_shift, u32 clrfmt_man, u32 byte_swap, u32 rgb_swap);
-- 
2.45.2

