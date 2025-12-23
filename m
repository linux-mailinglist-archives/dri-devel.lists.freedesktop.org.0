Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE641CDA36F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 19:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E5510E23B;
	Tue, 23 Dec 2025 18:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="G7YsJBXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41410E23B
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 18:03:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1766512987; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g/sfCdcZ/tgp3E/l5fqDsNkNWuGu0Ft4YHOSI1GQgzG8jZEpk8366ZVrED9f3WG9dDzT6KJ2Fz71HqpFgbGILj1tgI1va/MxqWF/r0zvkebLX7tkOkL7ajIaD0EWXFKmkBw1rYvWH0r/sarRV8Fc8vF5XACPcHAr/3ECJOKCDzo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1766512987;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nb+gEPCr8F82DTkR11MBRe/Lv8xGwtjPI5Ua+28MACE=; 
 b=HCUE8sQvA3HARqEZV8IWFuJgvhWukB65Bjs9SNCyYXwocG22jeOvhrtPHgA+ktc0l4HwmYhBDizdOov0qO1UeHiwt2oOjq0IAAyHybb+4b1R7YfhLAsYRW7lAHNqdis0Z+F+mwXhd/rIglfS/rAlll+eJVKMg+YKWdOKAg39Onk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512987; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=nb+gEPCr8F82DTkR11MBRe/Lv8xGwtjPI5Ua+28MACE=;
 b=G7YsJBXqkS/a5qFgpH5lC6yRuVMJK4IQTGxL+23p62MyuNkcUO/v27PSux60fb0x
 z1/0TrVxHLzTPvq1I+0UKTnim2LiQGhGyOOhXEKefORz67NfuJjR0nK4329p1n0ScI3
 Sp+HhJF0kgmt/DOryYi+/Yid67HWDYicmZAq++7Y=
Received: by mx.zohomail.com with SMTPS id 1766512985092186.15868862539787;
 Tue, 23 Dec 2025 10:03:05 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:32 -0300
Subject: [PATCH v3 12/21] drm/mediatek: Support CRTC colorops for gamma and ctm
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-12-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=11104;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=YBRzERxZRrYsGEOPl6eSbZ33DBmseed2ZOwtkArP2uM=;
 b=4ZAxfIg/77L+QAf2Rm03NRDtQCTJMOsnldva/NzYaCEFOl7rmZyS3vHSRvPs1VpuaViJWQmMk
 RaaBeZyg0/HAANTXmDQdx4EwtM8eDhb+wqf5UIMHEaB/npx+mXC2MTm
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Allow configuring the gamma and ccorr blocks through the CRTC color
pipeline API instead of the GAMMA_LUT and CTM properties.

In order to achieve this, initialize the color pipeline property and
colorops on the CRTC based on the DDP components available in the CRTC
path. Then introduce a struct mtk_drm_colorop that extends drm_colorop
and tracks the mtk_ddp_comp that implements it in hardware, and include
new ddp_comp helper functions for setting gamma and ctm through the new
API. These helpers will then be called during commit flush for every
updated colorop if the DRM client supports the CRTC (post-blend) color
pipeline API.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c     | 222 +++++++++++++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_ddp_comp.h |   2 +
 2 files changed, 219 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 991cdb3d7d5fd..1ed3157fa91f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -83,6 +83,12 @@ struct mtk_crtc_state {
 	unsigned int			pending_vrefresh;
 };
 
+struct mtk_drm_colorop {
+	struct drm_colorop colorop;
+	struct mtk_ddp_comp *comp;
+	uint32_t data_id;
+};
+
 static inline struct mtk_crtc *to_mtk_crtc(struct drm_crtc *c)
 {
 	return container_of(c, struct mtk_crtc, base);
@@ -93,6 +99,11 @@ static inline struct mtk_crtc_state *to_mtk_crtc_state(struct drm_crtc_state *s)
 	return container_of(s, struct mtk_crtc_state, base);
 }
 
+static inline struct mtk_drm_colorop *to_mtk_colorop(struct drm_colorop *colorop)
+{
+	return container_of(colorop, struct mtk_drm_colorop, colorop);
+}
+
 static void mtk_crtc_finish_page_flip(struct mtk_crtc *mtk_crtc)
 {
 	struct drm_crtc *crtc = &mtk_crtc->base;
@@ -126,6 +137,19 @@ static void mtk_drm_finish_page_flip(struct mtk_crtc *mtk_crtc)
 	spin_unlock_irqrestore(&mtk_crtc->config_lock, flags);
 }
 
+static void mtk_drm_colorop_pipeline_destroy(struct drm_device *dev)
+{
+	struct drm_mode_config *config = &dev->mode_config;
+	struct drm_colorop *colorop, *next;
+	struct mtk_drm_colorop *mtk_colorop;
+
+	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
+		drm_colorop_cleanup(colorop);
+		mtk_colorop = to_mtk_colorop(colorop);
+		kfree(mtk_colorop);
+	}
+}
+
 static void mtk_crtc_destroy(struct drm_crtc *crtc)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
@@ -147,6 +171,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 		mtk_ddp_comp_unregister_vblank_cb(comp);
 	}
 
+	mtk_drm_colorop_pipeline_destroy(crtc->dev);
+
 	drm_crtc_cleanup(crtc);
 }
 
@@ -862,20 +888,103 @@ static void mtk_crtc_atomic_begin(struct drm_crtc *crtc,
 	}
 }
 
+static bool colorop_data_update_flush_status(struct drm_colorop_state *colorop_state)
+{
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct mtk_drm_colorop *mtk_colorop = to_mtk_colorop(colorop);
+	struct drm_property_blob *data_blob = colorop_state->data;
+	uint32_t data_id = colorop_state->bypass ? 0 : data_blob->base.id;
+	bool needs_flush = mtk_colorop->data_id != data_id;
+
+	mtk_colorop->data_id = data_id;
+
+	return needs_flush;
+}
+
+static void mtk_crtc_ddp_comp_apply_colorop(struct drm_colorop_state *colorop_state)
+{
+	struct drm_colorop *colorop = colorop_state->colorop;
+	struct mtk_drm_colorop *mtk_colorop = to_mtk_colorop(colorop);
+	struct drm_property_blob *data_blob = colorop_state->data;
+	struct mtk_ddp_comp *ddp_comp = mtk_colorop->comp;
+	struct drm_color_ctm_3x4 *ctm = NULL;
+	struct drm_color_lut32 *lut = NULL;
+
+	switch (colorop->type) {
+	case DRM_COLOROP_1D_LUT:
+		if (!colorop_data_update_flush_status(colorop_state))
+			return;
+
+		if (!colorop_state->bypass)
+			lut = (struct drm_color_lut32 *)data_blob->data;
+
+		ddp_comp->funcs->gamma_set_color_pipeline(ddp_comp->dev, lut);
+		break;
+	case DRM_COLOROP_CTM_3X4:
+		if (!colorop_data_update_flush_status(colorop_state))
+			return;
+
+		if (!colorop_state->bypass)
+			ctm = (struct drm_color_ctm_3x4 *)data_blob->data;
+
+		ddp_comp->funcs->ctm_set_color_pipeline(ddp_comp->dev, ctm);
+		break;
+	default:
+		/* If this happens the driver is broken */
+		drm_WARN(colorop->dev, 1,
+			 "Trying to atomic flush COLOROP of type unsupported by driver: %d\n",
+			 colorop->type);
+		break;
+	}
+}
+
 static void mtk_crtc_atomic_flush(struct drm_crtc *crtc,
 				  struct drm_atomic_state *state)
 {
 	struct mtk_crtc *mtk_crtc = to_mtk_crtc(crtc);
+	struct drm_colorop_state *new_colorop_state;
+	struct drm_colorop *colorop;
 	int i;
 
-	if (crtc->state->color_mgmt_changed)
-		for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
-			mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
-			mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
-		}
+	if (state->crtc_color_pipeline) {
+		for_each_new_colorop_in_state(state, colorop, new_colorop_state, i)
+			mtk_crtc_ddp_comp_apply_colorop(new_colorop_state);
+	} else {
+		if (crtc->state->color_mgmt_changed)
+			for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
+				mtk_ddp_gamma_set(mtk_crtc->ddp_comp[i], crtc->state);
+				mtk_ddp_ctm_set(mtk_crtc->ddp_comp[i], crtc->state);
+			}
+	}
 	mtk_crtc_update_config(mtk_crtc, !!mtk_crtc->event);
 }
 
+static int mtk_crtc_atomic_check(struct drm_crtc *crtc,
+				 struct drm_atomic_state *state)
+{
+	struct drm_colorop_state *new_colorop_state;
+	struct drm_colorop *colorop;
+	int i;
+
+	for_each_new_colorop_in_state(state, colorop, new_colorop_state, i) {
+		switch (colorop->type) {
+		case DRM_COLOROP_1D_LUT:
+		case DRM_COLOROP_CTM_3X4:
+			if (!new_colorop_state->bypass && !new_colorop_state->data) {
+				drm_dbg_atomic(crtc->dev,
+					       "Missing required DATA property for COLOROP:%d\n",
+					       colorop->base.id);
+				return -EINVAL;
+			}
+			break;
+		default:
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static const struct drm_crtc_funcs mtk_crtc_funcs = {
 	.set_config		= drm_atomic_helper_set_config,
 	.page_flip		= drm_atomic_helper_page_flip,
@@ -893,6 +1002,7 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 	.mode_valid	= mtk_crtc_mode_valid,
 	.atomic_begin	= mtk_crtc_atomic_begin,
 	.atomic_flush	= mtk_crtc_atomic_flush,
+	.atomic_check   = mtk_crtc_atomic_check,
 	.atomic_enable	= mtk_crtc_atomic_enable,
 	.atomic_disable	= mtk_crtc_atomic_disable,
 };
@@ -995,6 +1105,100 @@ struct device *mtk_crtc_dma_dev_get(struct drm_crtc *crtc)
 	return mtk_crtc->dma_dev;
 }
 
+#define MAX_COLOR_PIPELINE_OPS 2
+#define MAX_COLOR_PIPELINES 1
+
+static int mtk_colorop_init(struct mtk_crtc *mtk_crtc,
+			    struct mtk_drm_colorop *mtk_colorop,
+			    struct mtk_ddp_comp *ddp_comp)
+{
+	struct drm_colorop *colorop = &mtk_colorop->colorop;
+	int ret = 0;
+
+	if (ddp_comp->funcs->gamma_set_color_pipeline) {
+		unsigned int lut_sz = mtk_ddp_gamma_get_lut_size(ddp_comp);
+
+		ret = drm_crtc_colorop_curve_1d_lut_init(mtk_crtc->base.dev, colorop,
+							 &mtk_crtc->base,
+							 lut_sz,
+							 DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+							 DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	} else if (ddp_comp->funcs->ctm_set_color_pipeline) {
+		ret = drm_crtc_colorop_ctm_3x4_init(mtk_crtc->base.dev,
+						    colorop,
+						    &mtk_crtc->base,
+						    DRM_COLOROP_FLAG_ALLOW_BYPASS);
+	}
+
+	mtk_colorop->comp = ddp_comp;
+
+	return ret;
+}
+
+static int mtk_crtc_init_crtc_color_pipeline(struct mtk_crtc *mtk_crtc,
+					     unsigned int gamma_lut_size)
+{
+	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
+	struct drm_colorop *ops[MAX_COLOR_PIPELINE_OPS];
+	struct mtk_drm_colorop *mtk_colorop;
+	unsigned int num_pipelines = 0;
+	unsigned int op_idx = 0;
+	int ret;
+	int j;
+
+	memset(ops, 0, sizeof(ops));
+
+	for (unsigned int i = 0;
+	     i < mtk_crtc->ddp_comp_nr && op_idx < MAX_COLOR_PIPELINE_OPS;
+	     i++) {
+		struct mtk_ddp_comp *ddp_comp = mtk_crtc->ddp_comp[i];
+
+		if (!(ddp_comp->funcs->gamma_set_color_pipeline ||
+		      ddp_comp->funcs->ctm_set_color_pipeline))
+			continue;
+
+		mtk_colorop = kzalloc(sizeof(struct mtk_drm_colorop), GFP_KERNEL);
+		if (!mtk_colorop) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		ops[op_idx] = &mtk_colorop->colorop;
+
+		ret = mtk_colorop_init(mtk_crtc, mtk_colorop, ddp_comp);
+		if (ret)
+			goto cleanup;
+
+		if (op_idx > 0)
+			drm_colorop_set_next_property(ops[op_idx-1], ops[op_idx]);
+
+		op_idx++;
+	}
+
+	if (op_idx > 0) {
+		pipelines[0].type = ops[0]->base.id;
+		pipelines[0].name = kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[0]->base.id);
+		num_pipelines = 1;
+	}
+
+	/* Create COLOR_PIPELINE property and attach */
+	drm_crtc_create_color_pipeline_property(&mtk_crtc->base, pipelines, num_pipelines);
+
+	return 0;
+
+cleanup:
+	for (j = 0; j < op_idx; j++) {
+		if (ops[j]) {
+			drm_colorop_cleanup(ops[j]);
+			mtk_colorop = to_mtk_colorop(ops[j]);
+			kfree(mtk_colorop);
+			kfree(ops[j]);
+		}
+	}
+
+	return ret;
+}
+
 int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 		    unsigned int path_len, int priv_data_index,
 		    const struct mtk_drm_route *conn_routes,
@@ -1111,6 +1315,10 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 	if (ret < 0)
 		return ret;
 
+	ret = mtk_crtc_init_crtc_color_pipeline(mtk_crtc, gamma_lut_size);
+	if (ret < 0)
+		goto err_cleanup_crtc;
+
 	if (gamma_lut_size)
 		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
 	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, has_ctm, gamma_lut_size);
@@ -1183,4 +1391,8 @@ int mtk_crtc_create(struct drm_device *drm_dev, const unsigned int *path,
 	}
 
 	return 0;
+
+err_cleanup_crtc:
+	drm_crtc_cleanup(&mtk_crtc->base);
+	return ret;
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
index 3f3d43f4330da..93665b5d5358c 100644
--- a/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_ddp_comp.h
@@ -75,10 +75,12 @@ struct mtk_ddp_comp_funcs {
 	unsigned int (*gamma_get_lut_size)(struct device *dev);
 	void (*gamma_set)(struct device *dev,
 			  struct drm_crtc_state *state);
+	void (*gamma_set_color_pipeline)(struct device *dev, struct drm_color_lut32 *lut);
 	void (*bgclr_in_on)(struct device *dev);
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	void (*ctm_set_color_pipeline)(struct device *dev, struct drm_color_ctm_3x4 *ctm);
 	struct device * (*dma_dev_get)(struct device *dev);
 	u32 (*get_blend_modes)(struct device *dev);
 	const u32 *(*get_formats)(struct device *dev);

-- 
2.51.0

