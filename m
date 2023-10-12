Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E541D7C6A23
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB6AD10E48F;
	Thu, 12 Oct 2023 09:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD27110E470
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:57:46 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C58AC6607349;
 Thu, 12 Oct 2023 10:57:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697104665;
 bh=TqBJY4PHT/VYc7wBwLRF/5K/UOCZ4Qx+aT1eGgixpOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FqIQwytIg7ajQ/9Rs5e2g59WF3nLgnGiqr+UV8kCADanl9SXaEONkrk8PKq6bYuB+
 T+acOl4/QeidRv7gHT31w8BwQSfCcDhokRkUQ+3NRChHKj2V5iGmCzsMJqZBxmLvsD
 KVTkWvlTnfL7v1qDPehN37GYtdJENPsWW5br6WiIP0kziRv/o232neiwsSBwGEZ9+Y
 0Bq8NiOQrEwXGtumt1w7Lp8ed7iNUUJRqrva3OVoJnMqaZYHI6/Lz+O9c/wzgSM7J+
 mkltd99mEuHmpCZhVMMl9RtFvSVHjFJQ/pUUE0f7THZGlf7b4paDjnAFgSXyQIThr0
 ilMKruMgA/pEg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v11 03/16] drm/mediatek: gamma: Support SoC specific LUT size
Date: Thu, 12 Oct 2023 11:57:23 +0200
Message-ID: <20231012095736.100784-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
References: <20231012095736.100784-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: nfraprado@collabora.com, Alexandre Mergnat <amergnat@baylibre.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 ehristev@collabora.com, wenst@chromium.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Newer SoCs support a bigger Gamma LUT table: wire up a callback
to retrieve the correct LUT size for each different Gamma IP.

Co-developed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
[Angelo: Rewritten commit message/description + porting]
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 17 +++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 22 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  8 ++++++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 +++++++++
 7 files changed, 54 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 662c5d03ee43..dc26ddce0c6e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -19,7 +19,7 @@
 #define AAL_EN						BIT(0)
 #define DISP_AAL_SIZE				0x0030
 #define DISP_AAL_OUTPUT_SIZE			0x04d8
-
+#define DISP_AAL_LUT_SIZE			512
 
 struct mtk_disp_aal_data {
 	bool has_gamma;
@@ -56,6 +56,21 @@ void mtk_aal_config(struct device *dev, unsigned int w,
 	mtk_ddp_write(cmdq_pkt, w << 16 | h, &aal->cmdq_reg, aal->regs, DISP_AAL_OUTPUT_SIZE);
 }
 
+/**
+ * mtk_aal_gamma_get_lut_size() - Get gamma LUT size for AAL
+ * @dev: Pointer to struct device
+ *
+ * Return: 0 if gamma control not supported in AAL or gamma LUT size
+ */
+unsigned int mtk_aal_gamma_get_lut_size(struct device *dev)
+{
+	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
+
+	if (aal->data && aal->data->has_gamma)
+		return DISP_AAL_LUT_SIZE;
+	return 0;
+}
+
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state)
 {
 	struct mtk_disp_aal *aal = dev_get_drvdata(dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 75045932353e..ca377265e5eb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -17,6 +17,7 @@ void mtk_aal_clk_disable(struct device *dev);
 void mtk_aal_config(struct device *dev, unsigned int w,
 		    unsigned int h, unsigned int vrefresh,
 		    unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_aal_gamma_get_lut_size(struct device *dev);
 void mtk_aal_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_aal_start(struct device *dev);
 void mtk_aal_stop(struct device *dev);
@@ -53,6 +54,7 @@ void mtk_gamma_clk_disable(struct device *dev);
 void mtk_gamma_config(struct device *dev, unsigned int w,
 		      unsigned int h, unsigned int vrefresh,
 		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+unsigned int mtk_gamma_get_lut_size(struct device *dev);
 void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state);
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state);
 void mtk_gamma_start(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 63840e25416b..bb237523d4b7 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -28,6 +28,7 @@
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_size;
 };
 
 /*
@@ -54,6 +55,15 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
+unsigned int mtk_gamma_get_lut_size(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	if (gamma && gamma->data)
+		return gamma->data->lut_size;
+	return 0;
+}
+
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma;
@@ -61,6 +71,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
+	u16 lut_size;
 	u32 word;
 	u32 diff[3] = {0};
 
@@ -71,17 +82,20 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* If we're called from AAL, dev is NULL */
 	gamma = dev ? dev_get_drvdata(dev) : NULL;
 
-	if (gamma && gamma->data)
+	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
-	else
+		lut_size = gamma->data->lut_size;
+	} else {
 		lut_diff = false;
+		lut_size = 512;
+	}
 
 	reg = readl(regs + DISP_GAMMA_CFG);
 	reg = reg | GAMMA_LUT_EN;
 	writel(reg, regs + DISP_GAMMA_CFG);
 	lut_base = regs + DISP_GAMMA_LUT;
 	lut = (struct drm_color_lut *)state->gamma_lut->data;
-	for (i = 0; i < MTK_LUT_SIZE; i++) {
+	for (i = 0; i < lut_size; i++) {
 		if (!lut_diff || (i % 2 == 0)) {
 			word = (((lut[i].red >> 6) & LUT_10BIT_MASK) << 20) +
 				(((lut[i].green >> 6) & LUT_10BIT_MASK) << 10) +
@@ -192,10 +206,12 @@ static void mtk_disp_gamma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
 	.has_dither = true,
+	.lut_size = 512,
 };
 
 static const struct mtk_disp_gamma_data mt8183_gamma_driver_data = {
 	.lut_diff = true,
+	.lut_size = 512,
 };
 
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 45d05b6b7071..18da16e5626b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -943,8 +943,12 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		mtk_crtc->ddp_comp[i] = comp;
 
 		if (comp->funcs) {
-			if (comp->funcs->gamma_set)
-				gamma_lut_size = MTK_LUT_SIZE;
+			if (comp->funcs->gamma_set && comp->funcs->gamma_get_lut_size) {
+				unsigned int lut_sz = mtk_ddp_gamma_get_lut_size(comp);
+
+				if (lut_sz)
+					gamma_lut_size = lut_sz;
+			}
 
 			if (comp->funcs->ctm_set)
 				has_ctm = true;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
index 3e9046993d09..b2e50292e57d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
@@ -10,7 +10,6 @@
 #include "mtk_drm_ddp_comp.h"
 #include "mtk_drm_plane.h"
 
-#define MTK_LUT_SIZE	512
 #define MTK_MAX_BPC	10
 #define MTK_MIN_BPC	3
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5d392ce96a14..51f802be8440 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -263,6 +263,7 @@ static void mtk_ufoe_start(struct device *dev)
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_aal_clk_enable,
 	.clk_disable = mtk_aal_clk_disable,
+	.gamma_get_lut_size = mtk_aal_gamma_get_lut_size,
 	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
@@ -314,6 +315,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsi = {
 static const struct mtk_ddp_comp_funcs ddp_gamma = {
 	.clk_enable = mtk_gamma_clk_enable,
 	.clk_disable = mtk_gamma_clk_disable,
+	.gamma_get_lut_size = mtk_gamma_get_lut_size,
 	.gamma_set = mtk_gamma_set,
 	.config = mtk_gamma_config,
 	.start = mtk_gamma_start,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index febcaeef16a1..c1355960e195 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -67,6 +67,7 @@ struct mtk_ddp_comp_funcs {
 	void (*layer_config)(struct device *dev, unsigned int idx,
 			     struct mtk_plane_state *state,
 			     struct cmdq_pkt *cmdq_pkt);
+	unsigned int (*gamma_get_lut_size)(struct device *dev);
 	void (*gamma_set)(struct device *dev,
 			  struct drm_crtc_state *state);
 	void (*bgclr_in_on)(struct device *dev);
@@ -186,6 +187,14 @@ static inline void mtk_ddp_comp_layer_config(struct mtk_ddp_comp *comp,
 		comp->funcs->layer_config(comp->dev, idx, state, cmdq_pkt);
 }
 
+static inline unsigned int mtk_ddp_gamma_get_lut_size(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->gamma_get_lut_size)
+		return comp->funcs->gamma_get_lut_size(comp->dev);
+
+	return 0;
+}
+
 static inline void mtk_ddp_gamma_set(struct mtk_ddp_comp *comp,
 				     struct drm_crtc_state *state)
 {
-- 
2.42.0

