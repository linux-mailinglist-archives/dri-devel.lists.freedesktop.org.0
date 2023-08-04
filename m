Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA7D76FB14
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1B310E6A7;
	Fri,  4 Aug 2023 07:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED35610E6A4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 07:29:00 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BE0D66071BD;
 Fri,  4 Aug 2023 08:28:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691134139;
 bh=dRCUBSAJhyuAuYLj+KM0no1asegc1IsekM6rzVKVlw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ODT9G6xSrIvb2+NRRlpwec2AuPstf9LawphxnZNN8jf707Ajmx9OoD+VHTuvb39yU
 +cZ/nWoJU1CstNpvm+oLJn2U1g2mN0auOPJ6f2pSUT0zSc8mMpuK54P5+EskE+FVrJ
 j61GFPIpNts8cWCUvE9emtp75zNY+YKPHY2j9stzgmbiyiKDLbBXeo4OKUVnIUxYUT
 pz4xFJk6pxItu7LjDxfabr5kwy3bayEBYG2DzdzyZl3qPS1LZpzlwWmOD0puBhcEr7
 zS0h740i4Q1Jbpu5myp5lrRy5dYTXl9VU9IV1TrdIx5tjVtzQjux+l+0ATnAlYYzI0
 3J/l0bjHkyG5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v10 03/16] drm/mediatek: gamma: Support SoC specific LUT size
Date: Fri,  4 Aug 2023 09:28:37 +0200
Message-ID: <20230804072850.89365-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
References: <20230804072850.89365-1-angelogioacchino.delregno@collabora.com>
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
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
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
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_aal.c     | 17 ++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  2 ++
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c   | 23 ++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  8 +++++--
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  2 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  9 ++++++++
 7 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 2f602f1f1c49..e2e4155faf01 100644
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
@@ -61,6 +61,21 @@ void mtk_aal_config(struct device *dev, unsigned int w,
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
index 47751864bd5c..7575237625d2 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -24,10 +24,12 @@
 #define DISP_GAMMA_LUT				0x0700
 
 #define LUT_10BIT_MASK				0x03ff
+#define LUT_SIZE_DEFAULT			512
 
 struct mtk_disp_gamma_data {
 	bool has_dither;
 	bool lut_diff;
+	u16 lut_size;
 };
 
 /*
@@ -54,6 +56,15 @@ void mtk_gamma_clk_disable(struct device *dev)
 	clk_disable_unprepare(gamma->clk);
 }
 
+unsigned int mtk_gamma_get_lut_size(struct device *dev)
+{
+	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
+
+	if (gamma && gamma->data)
+		return gamma->data->lut_size;
+	return LUT_SIZE_DEFAULT;
+}
+
 void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crtc_state *state)
 {
 	struct mtk_disp_gamma *gamma;
@@ -61,6 +72,7 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	struct drm_color_lut *lut;
 	void __iomem *lut_base;
 	bool lut_diff;
+	u16 lut_size;
 	u32 word;
 	u32 diff[3] = {0};
 
@@ -71,17 +83,20 @@ void mtk_gamma_set_common(struct device *dev, void __iomem *regs, struct drm_crt
 	/* If we're called from AAL, dev is NULL */
 	gamma = dev ? dev_get_drvdata(dev) : NULL;
 
-	if (gamma && gamma->data)
+	if (gamma && gamma->data) {
 		lut_diff = gamma->data->lut_diff;
-	else
+		lut_size = gamma->data->lut_size;
+	} else {
 		lut_diff = false;
+		lut_size = LUT_SIZE_DEFAULT;
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
@@ -198,10 +213,12 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 
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
index 8a43656ecc30..ebe0cc3a1a4c 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -959,8 +959,12 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
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
index f114da4d36a9..f3212e08f2cd 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -271,6 +271,7 @@ static void mtk_ufoe_start(struct device *dev)
 static const struct mtk_ddp_comp_funcs ddp_aal = {
 	.clk_enable = mtk_aal_clk_enable,
 	.clk_disable = mtk_aal_clk_disable,
+	.gamma_get_lut_size = mtk_aal_gamma_get_lut_size,
 	.gamma_set = mtk_aal_gamma_set,
 	.config = mtk_aal_config,
 	.start = mtk_aal_start,
@@ -322,6 +323,7 @@ static const struct mtk_ddp_comp_funcs ddp_dsi = {
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
2.41.0

