Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE793985711
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:19:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7910E7DA;
	Wed, 25 Sep 2024 10:19:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="AaTMvVlr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D710E7DA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 10:19:37 +0000 (UTC)
X-UUID: a768fa3e7b2711efb66947d174671e26-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gK4kbmZwaNoMEuM4au4uD1TtySkTp7ZiLhvvgcuiZL0=; 
 b=AaTMvVlrMjtXjpow4e+3nWCeF5x8JkOBttx6z/hKt034I44UgoAvsEoqAOeQ/0XNpJrgdNy3c1gGqOsaKfm1rVJTxtuSwKFx7DI5eEa4ImImAFNgDFcg1KuIbS5J/ZtlJqYh65ze/Ow28xFci+TpXqSUrW8YVtVJNyArI+Emi64=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:ae574233-3f1f-4bd1-ad74-8b5f04b1e9cc, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:13f7bed0-7921-4900-88a1-3aef019a55ce,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a768fa3e7b2711efb66947d174671e26-20240925
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1225076555; Wed, 25 Sep 2024 18:19:31 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 18:19:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:19:29 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shawn Sung <shawn.sung@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Jason-JH . Lin"
 <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 2/2] drm/mediatek: Add blend_modes to mtk_plane_init() for
 different SoCs
Date: Wed, 25 Sep 2024 18:19:27 +0800
Message-ID: <20240925101927.17042-3-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
References: <20240925101927.17042-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--12.099800-8.000000
X-TMASE-MatchedRID: LFhZ4D3Qpaxe0FYiuVD/cPSZ/2axrnPBqQzUsXJNLuEGW3hFnC9N1R0h
 hGd4LdX+mSouTgBPZUd8ADwuiKcPjo6drwfS3MqJxQvMEFMAcCURvEpVd3vS1d9RlPzeVuQQIoh
 SIvsUL+/BfR/WU+6YOHOL9OTtf6MNg4jZH72x495c/msUC5wFQTFcf92WG8u/FLXUWU5hGiHu9+
 Mep8zDYi3HX1fgk1LKuKSvVO9Kzes3+hnFgqdP4oSvKOGqLLPK1xODifxSLQObKItl61J/yZ+in
 TK0bC9eKrauXd3MZDUzaXOJNfDG7eerR+zZRY2Vmvy5hPqBnT1A0AYJ6FdmlGui6oIEpU60
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.099800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7E0120F04BD04BAF96546765F76E0C0877D1DE509AEBE842A0334595B7E84D1D2000:8
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

Since some SoCs support premultiplied pixel formats but some do not,
the blend_modes parameter is added to mtk_plane_init(), which is
obtained from the mtk_ddp_comp_get_blend_modes function implemented
in different OVL components.

The OVL component can use driver data to set the blend mode
capabilities for different SoCs.

Fixes: 4225d5d5e779 ("drm/mediatek: Support alpha blending in display driver")
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c           |  1 +
 drivers/gpu/drm/mediatek/mtk_ddp_comp.c       |  2 ++
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h       | 10 ++++++++
 drivers/gpu/drm/mediatek/mtk_disp_drv.h       |  3 +++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       | 25 +++++++++++++++++++
 .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   |  7 ++++++
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c       |  8 ++++++
 drivers/gpu/drm/mediatek/mtk_plane.c          |  9 +++----
 drivers/gpu/drm/mediatek/mtk_plane.h          |  4 +--
 9 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 175b00e5a253..b65f196f2015 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -913,6 +913,7 @@ static int mtk_crtc_init_comp_planes(struct drm_device *drm_dev,
 				BIT(pipe),
 				mtk_crtc_plane_type(mtk_crtc->layer_nr, num_planes),
 				mtk_ddp_comp_supported_rotations(comp),
+				mtk_ddp_comp_get_blend_modes(comp),
 				mtk_ddp_comp_get_formats(comp),
 				mtk_ddp_comp_get_num_formats(comp), i);
 		if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
index be66d94be361..edc6417639e6 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.c
@@ -363,6 +363,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.layer_config = mtk_ovl_layer_config,
 	.bgclr_in_on = mtk_ovl_bgclr_in_on,
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
+	.get_blend_modes = mtk_ovl_get_blend_modes,
 	.get_formats = mtk_ovl_get_formats,
 	.get_num_formats = mtk_ovl_get_num_formats,
 };
@@ -416,6 +417,7 @@ static const struct mtk_ddp_comp_funcs ddp_ovl_adaptor = {
 	.disconnect = mtk_ovl_adaptor_disconnect,
 	.add = mtk_ovl_adaptor_add_comp,
 	.remove = mtk_ovl_adaptor_remove_comp,
+	.get_blend_modes = mtk_ovl_adaptor_get_blend_modes,
 	.get_formats = mtk_ovl_adaptor_get_formats,
 	.get_num_formats = mtk_ovl_adaptor_get_num_formats,
 	.mode_valid = mtk_ovl_adaptor_mode_valid,
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index ecf6dc283cd7..79562af1180f 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -80,6 +80,7 @@ struct mtk_ddp_comp_funcs {
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
 	struct device * (*dma_dev_get)(struct device *dev);
+	const u32 (*get_blend_modes)(struct device *dev);
 	const u32 *(*get_formats)(struct device *dev);
 	size_t (*get_num_formats)(struct device *dev);
 	void (*connect)(struct device *dev, struct device *mmsys_dev, unsigned int next);
@@ -266,6 +267,15 @@ static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
 	return comp->dev;
 }
 
+static inline
+const u32 mtk_ddp_comp_get_blend_modes(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->get_blend_modes)
+		return comp->funcs->get_blend_modes(comp->dev);
+
+	return 0;
+}
+
 static inline
 const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
 {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 082ac18fe04a..ea07b3b55b1c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -103,6 +103,7 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
 void mtk_ovl_unregister_vblank_cb(struct device *dev);
 void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
+const u32 mtk_ovl_get_blend_modes(struct device *dev);
 const u32 *mtk_ovl_get_formats(struct device *dev);
 size_t mtk_ovl_get_num_formats(struct device *dev);
 
@@ -131,6 +132,7 @@ void mtk_ovl_adaptor_start(struct device *dev);
 void mtk_ovl_adaptor_stop(struct device *dev);
 unsigned int mtk_ovl_adaptor_layer_nr(struct device *dev);
 struct device *mtk_ovl_adaptor_dma_dev_get(struct device *dev);
+const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev);
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev);
 size_t mtk_ovl_adaptor_get_num_formats(struct device *dev);
 enum drm_mode_status mtk_ovl_adaptor_mode_valid(struct device *dev,
@@ -165,6 +167,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
 void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			 struct cmdq_pkt *cmdq_pkt);
+const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev);
 const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
 size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 8f7b7e07aeb1..864dc96aad01 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -147,6 +147,7 @@ struct mtk_disp_ovl_data {
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
+	const u32 blend_modes;
 	const u32 *formats;
 	size_t num_formats;
 	bool supports_clrfmt_ext;
@@ -215,6 +216,13 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+const u32 mtk_ovl_get_blend_modes(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->blend_modes;
+}
+
 const u32 *mtk_ovl_get_formats(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -674,6 +682,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = false,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -684,6 +694,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -694,6 +706,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -704,6 +718,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_convert = mtk_ovl_fmt_convert,
 	.fmt_rgb565_is_0 = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -715,6 +731,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -726,6 +745,9 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.fmt_convert = mtk_ovl_fmt_convert_with_blend,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8173_formats,
 	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
@@ -738,6 +760,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.blend_modes = BIT(DRM_MODE_BLEND_PREMULTI) |
+		       BIT(DRM_MODE_BLEND_COVERAGE) |
+		       BIT(DRM_MODE_BLEND_PIXEL_NONE),
 	.formats = mt8195_formats,
 	.num_formats = ARRAY_SIZE(mt8195_formats),
 	.supports_clrfmt_ext = true,
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index c6768210b08b..2d47b6eb4c19 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -400,6 +400,13 @@ void mtk_ovl_adaptor_disable_vblank(struct device *dev)
 	mtk_ethdr_disable_vblank(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_ETHDR0]);
 }
 
+const u32 mtk_ovl_adaptor_get_blend_modes(struct device *dev)
+{
+	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
+
+	return mtk_mdp_rdma_get_blend_modes(ovl_adaptor->ovl_adaptor_comp[OVL_ADAPTOR_MDP_RDMA0]);
+}
+
 const u32 *mtk_ovl_adaptor_get_formats(struct device *dev)
 {
 	struct mtk_disp_ovl_adaptor *ovl_adaptor = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index 7c1a8c796833..a011d2e664f4 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2021 MediaTek Inc.
  */
 
+#include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
 #include <linux/clk.h>
 #include <linux/component.h>
@@ -232,6 +233,13 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
 			   MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
 }
 
+const u32 mtk_mdp_rdma_get_blend_modes(struct device *dev)
+{
+	return BIT(DRM_MODE_BLEND_PREMULTI) |
+	       BIT(DRM_MODE_BLEND_COVERAGE) |
+	       BIT(DRM_MODE_BLEND_PIXEL_NONE);
+}
+
 const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
 {
 	return formats;
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index 7d2cb4e0fafa..eb545b81bf2f 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -320,8 +320,8 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats, unsigned int plane_idx)
+		   unsigned int supported_rotations, const u32 blend_modes,
+		   const u32 *formats, size_t num_formats, unsigned int plane_idx)
 {
 	int err;
 
@@ -366,10 +366,7 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 	if (err)
 		DRM_ERROR("failed to create property: alpha\n");
 
-	err = drm_plane_create_blend_mode_property(plane,
-						   BIT(DRM_MODE_BLEND_PREMULTI) |
-						   BIT(DRM_MODE_BLEND_COVERAGE) |
-						   BIT(DRM_MODE_BLEND_PIXEL_NONE));
+	err = drm_plane_create_blend_mode_property(plane, blend_modes);
 	if (err)
 		DRM_ERROR("failed to create property: blend_mode\n");
 
diff --git a/drivers/gpu/drm/mediatek/mtk_plane.h b/drivers/gpu/drm/mediatek/mtk_plane.h
index 5b177eac67b7..3b13b89989c7 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_plane.h
@@ -48,6 +48,6 @@ to_mtk_plane_state(struct drm_plane_state *state)
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations, const u32 *formats,
-		   size_t num_formats, unsigned int plane_idx);
+		   unsigned int supported_rotations, const u32 blend_modes,
+		   const u32 *formats, size_t num_formats, unsigned int plane_idx);
 #endif
-- 
2.43.0

