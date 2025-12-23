Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC96CDA679
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 20:47:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CFB10E09E;
	Tue, 23 Dec 2025 19:47:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aLtCQkC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F48510E09E
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766519244;
 bh=vD870d938nwYIyegPWMdbDmlJ2S2wI475Vgc02Kli+Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aLtCQkC3a5T2UWir+7wR8cn3YzmtoBembHI8xZ0fPYB2FyK5PSgwhT/3jj5pzRtNB
 MJyd0hRnE2bdzhOclDxEoamqa9KyiGSjMXWp6dqAw9TItMQpFiBVyuE8B7oXisjwdE
 pa7Nk4v6epgb4wuvDWeCuT2ISN1igstXhvUZsTYk89n/W3G9+LxMa3P+p9sxdIrAb1
 VeqOqHJRx2QapMHfCSqjTMKdflhOL3jCewsd5BaPS4IgHPqcXaskHbLcnN/Pv4X5sJ
 iYyZPxMRAtWWnzxMSVbVB9/UXEaBSajuuyIysyNtNJVTaRXQmhz2DPbphsqnBXlU9/
 CTnTcuF5X/WNw==
Received: from [127.0.1.1] (unknown
 [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E14F17E35DC;
 Tue, 23 Dec 2025 20:47:18 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:51 -0300
Subject: [PATCH 10/11] drm/mediatek: ovl: Enable support for R2R Color
 Space Conversion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-10-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
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

The OVL hardware allows applying a 3x3 matrix transformation for each
layer through the 'RGB to RGB Color Space Conversion' (R2R CSC) setting.
Implement support for it and expose it as a colorop through the DRM
plane color pipeline uAPI.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 55 ++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index a70092c792a9..c8a2b1b13035 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -4,6 +4,7 @@
  */
 
 #include <drm/drm_blend.h>
+#include <drm/drm_color_mgmt.h>
 #include <drm/drm_colorop.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -52,6 +53,7 @@
 #define OVL_CON_CLRFMT_10_BIT				(1)
 #define DISP_REG_OVL_WCG_CFG1			0x2d8
 #define IGAMMA_EN(layer)				BIT(0 + 4 * (layer))
+#define CSC_EN(layer)					BIT(1 + 4 * (layer))
 #define GAMMA_EN(layer)					BIT(2 + 4 * (layer))
 #define DISP_REG_OVL_WCG_CFG2			0x2dc
 #define IGAMMA_MASK(layer)				GENMASK((layer) * 4 + 1, (layer) * 4)
@@ -62,6 +64,7 @@
 #define GAMMA_BT709					1
 #define GAMMA_BT2020					2
 #define GAMMA_HLG					3
+#define DISP_REG_OVL_R2R_PARA(layer)		(0x500 + (layer) * 0x40)
 #define DISP_REG_OVL_ADDR_MT8173		0x0f40
 #define DISP_REG_OVL_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n))
 #define DISP_REG_OVL_HDR_ADDR(ovl, n)		((ovl)->data->addr + 0x20 * (n) + 0x04)
@@ -579,11 +582,44 @@ static void mtk_ovl_apply_igamma(struct mtk_disp_ovl *ovl, unsigned int idx,
 			   IGAMMA_EN(idx));
 }
 
+static void mtk_ovl_write_r2r_para(struct mtk_disp_ovl *ovl, unsigned int idx,
+				   struct drm_color_ctm *ctm,
+				   struct cmdq_pkt *cmdq_pkt)
+{
+	unsigned int i;
+	u64 val;
+
+	for (i = 0; i < ARRAY_SIZE(ctm->matrix); i++) {
+		val = drm_color_ctm_s31_32_to_qm_n(ctm->matrix[i], 5, 18);
+		mtk_ddp_write(cmdq_pkt, val, &ovl->cmdq_reg, ovl->regs,
+			      DISP_REG_OVL_R2R_PARA(idx) + i * 4);
+	}
+}
+
+static void mtk_ovl_apply_r2r_csc(struct mtk_disp_ovl *ovl, unsigned int idx,
+				  struct drm_colorop *colorop,
+				  struct cmdq_pkt *cmdq_pkt)
+{
+	struct drm_color_ctm *ctm;
+
+	if (colorop->state->data && colorop->state->data->data) {
+		ctm = (struct drm_color_ctm *)colorop->state->data->data;
+		mtk_ovl_write_r2r_para(ovl, idx, ctm, cmdq_pkt);
+	}
+
+	mtk_ddp_write_mask(cmdq_pkt, colorop->state->bypass ? 0 : CSC_EN(idx),
+			   &ovl->cmdq_reg, ovl->regs, DISP_REG_OVL_WCG_CFG1,
+			   CSC_EN(idx));
+}
+
 static void mtk_ovl_apply_colorop(struct mtk_disp_ovl *ovl, unsigned int idx,
 				  struct drm_colorop *colorop,
 				  struct cmdq_pkt *cmdq_pkt)
 {
 	switch (colorop->type) {
+	case DRM_COLOROP_CTM_3X3:
+		mtk_ovl_apply_r2r_csc(ovl, idx, colorop, cmdq_pkt);
+		break;
 	case DRM_COLOROP_1D_CURVE:
 		/* gamma is the last colorop in pipeline */
 		if (!colorop->next)
@@ -602,7 +638,7 @@ static void mtk_ovl_disable_colorops(struct mtk_disp_ovl *ovl, unsigned int idx,
 {
 	mtk_ddp_write_mask(cmdq_pkt, 0, &ovl->cmdq_reg, ovl->regs,
 			   DISP_REG_OVL_WCG_CFG1,
-			   IGAMMA_EN(idx) | GAMMA_EN(idx));
+			   IGAMMA_EN(idx) | CSC_EN(idx) | GAMMA_EN(idx));
 
 	/* igamma curve needs to be set to default when igamma is disabled */
 	mtk_ddp_write_mask(cmdq_pkt, IGAMMA_SCRGB, &ovl->cmdq_reg, ovl->regs,
@@ -771,6 +807,23 @@ mtk_ovl_initialize_plane_color_pipeline(struct drm_plane *plane,
 
 	i++;
 
+	/* 2nd op: OVL's R2R Color Space Conversion */
+	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
+	if (!ops[i]) {
+		ret = -ENOMEM;
+		goto err_alloc;
+	}
+
+	ret = drm_plane_colorop_ctm_3x3_init(dev, ops[i], plane,
+					     &mtk_ovl_colorop_funcs,
+					     DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	if (ret)
+		goto err_colorop_init;
+
+	drm_colorop_set_next_property(ops[i - 1], ops[i]);
+
+	i++;
+
 	/* 3rd op: OVL's Gamma */
 	ops[i] = kzalloc(sizeof(*ops[i]), GFP_KERNEL);
 	if (!ops[i]) {

-- 
2.51.0

