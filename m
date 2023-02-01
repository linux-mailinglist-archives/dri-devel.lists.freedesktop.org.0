Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC493686C5B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AFB210E42E;
	Wed,  1 Feb 2023 17:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E6E10E42C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 17:02:25 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id s4so17637317qtx.6
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Feb 2023 09:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FvVBHvYo5PCvL4M3dFLxsMPnjamk2TTn3KNNyLW5LSk=;
 b=M0a1pmBer5GIgXXylsq3Cm7BSd2VfrNxQrjGOBLNUAy3DglS5mXejimyxKmDQdd5oI
 aEI8gr5yC2v8m5AelHuJF+U8aYYOgmyrfiLAXuvwcZ9cGxAsgSAlw4TvPZxizjtwHdgE
 5hB2BQyzDcCGAi7Y91ZKV8Ey5eLKp5igIWUfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FvVBHvYo5PCvL4M3dFLxsMPnjamk2TTn3KNNyLW5LSk=;
 b=G6v7+i8tJrVxYDsQRFw2VCdIQOQTvbEyICaG7cd+cCLbNNByMBpeRgsgsDofrC52IF
 urb5jfocEKzJDHx6cFl7QSpVqrLs6leEkDw0OHwrnVoJrKuWx/nFZDSELb2tQxip+3NP
 aj+vhV1AzXsWYwWX1Q7vZkVyv1M51/0PJSlKYVckPMmMKBloLixcCatLrB0B8Rc2OSdC
 Sa5dN6iwwqCjbSDhK+1O7jgad+AZM5Suj1AiMGmPSRBDZ6V6qd96NOpCxg4jZbJ+6b0g
 X7l3Ff6UzkNwpery7pRJpkG6/z6j4gKQaiapmGA5FbnmF9QYv8JIWH2dgWcCVqKocI5Y
 Hthw==
X-Gm-Message-State: AO0yUKUWc01+Si+l+4m1qgEtan8iviVMJBfTFN5dm8KyVMW53Rps3spC
 EXJP1+OI+/d1HNN8TWypzZBf+g==
X-Google-Smtp-Source: AK7set/o+yvday5QZEd3+f0ht/eH1BBnG1upe8lTmKFq34hKLevJqngBEuWMzf7yN8KzOYgxlQAuEQ==
X-Received: by 2002:ac8:4559:0:b0:3b9:bc8c:c200 with SMTP id
 z25-20020ac84559000000b003b9bc8cc200mr1591800qtn.11.1675270944262; 
 Wed, 01 Feb 2023 09:02:24 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:9334:99d8:1f91:70a])
 by smtp.gmail.com with ESMTPSA id
 z15-20020ac8430f000000b003b646a99aa6sm5549543qtm.77.2023.02.01.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 09:02:23 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Date: Wed,  1 Feb 2023 12:02:08 -0500
Message-Id: <20230201170210.1253505-2-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230201170210.1253505-1-greenjustin@chromium.org>
References: <20230201170210.1253505-1-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, Justin Green <greenjustin@chromium.org>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, justin.yeh@mediatek.com,
 wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an DDP component interface for querying pixel format support and move list
of supported pixel formats into DDP components instead of mtk_drm_plane.c

Tested by running Chrome on an MT8195.

Signed-off-by: Justin Green <greenjustin@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 44 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 ++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 ++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++++-------
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 123 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 33e61a136bbc..0df6a06defb8 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -96,6 +96,8 @@ void mtk_ovl_register_vblank_cb(struct device *dev,
 void mtk_ovl_unregister_vblank_cb(struct device *dev);
 void mtk_ovl_enable_vblank(struct device *dev);
 void mtk_ovl_disable_vblank(struct device *dev);
+const u32 *mtk_ovl_get_formats(struct device *dev);
+size_t mtk_ovl_get_num_formats(struct device *dev);
 
 void mtk_rdma_bypass_shadow(struct device *dev);
 int mtk_rdma_clk_enable(struct device *dev);
@@ -115,6 +117,8 @@ void mtk_rdma_register_vblank_cb(struct device *dev,
 void mtk_rdma_unregister_vblank_cb(struct device *dev);
 void mtk_rdma_enable_vblank(struct device *dev);
 void mtk_rdma_disable_vblank(struct device *dev);
+const u32 *mtk_rdma_get_formats(struct device *dev);
+size_t mtk_rdma_get_num_formats(struct device *dev);
 
 int mtk_mdp_rdma_clk_enable(struct device *dev);
 void mtk_mdp_rdma_clk_disable(struct device *dev);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 84daeaffab6a..8743c8047dc9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -66,6 +66,20 @@
 #define	OVL_CON_VIRT_FLIP	BIT(9)
 #define	OVL_CON_HORZ_FLIP	BIT(10)
 
+static const u32 mt8173_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_ovl_data {
 	unsigned int addr;
 	unsigned int gmc_bits;
@@ -73,6 +87,8 @@ struct mtk_disp_ovl_data {
 	bool fmt_rgb565_is_0;
 	bool smi_id_en;
 	bool supports_afbc;
+	const u32 *formats;
+	size_t num_formats;
 };
 
 /*
@@ -138,6 +154,20 @@ void mtk_ovl_disable_vblank(struct device *dev)
 	writel_relaxed(0x0, ovl->regs + DISP_REG_OVL_INTEN);
 }
 
+const u32 *mtk_ovl_get_formats(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->formats;
+}
+
+size_t mtk_ovl_get_num_formats(struct device *dev)
+{
+	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
+
+	return ovl->data->num_formats;
+}
+
 int mtk_ovl_clk_enable(struct device *dev)
 {
 	struct mtk_disp_ovl *ovl = dev_get_drvdata(dev);
@@ -495,6 +525,8 @@ static const struct mtk_disp_ovl_data mt2701_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = false,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
@@ -502,6 +534,8 @@ static const struct mtk_disp_ovl_data mt8173_ovl_driver_data = {
 	.gmc_bits = 8,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
@@ -509,6 +543,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
@@ -516,6 +552,8 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.gmc_bits = 10,
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
@@ -524,6 +562,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
 	.layer_nr = 4,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
@@ -532,6 +572,8 @@ static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
 	.layer_nr = 2,
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
@@ -541,6 +583,8 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
 	.fmt_rgb565_is_0 = true,
 	.smi_id_en = true,
 	.supports_afbc = true,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 0ec2e4049e07..cf92df845160 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -54,8 +54,24 @@
 
 #define RDMA_MEM_GMC				0x40402020
 
+static const u32 mt8173_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_UYVY,
+	DRM_FORMAT_YUYV,
+};
+
 struct mtk_disp_rdma_data {
 	unsigned int fifo_size;
+	const u32 *formats;
+	size_t num_formats;
 };
 
 /*
@@ -126,6 +142,20 @@ void mtk_rdma_disable_vblank(struct device *dev)
 	rdma_update_bits(dev, DISP_REG_RDMA_INT_ENABLE, RDMA_FRAME_END_INT, 0);
 }
 
+const u32 *mtk_rdma_get_formats(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	return rdma->data->formats;
+}
+
+size_t mtk_rdma_get_num_formats(struct device *dev)
+{
+	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
+
+	return rdma->data->num_formats;
+}
+
 int mtk_rdma_clk_enable(struct device *dev)
 {
 	struct mtk_disp_rdma *rdma = dev_get_drvdata(dev);
@@ -360,18 +390,26 @@ static int mtk_disp_rdma_remove(struct platform_device *pdev)
 
 static const struct mtk_disp_rdma_data mt2701_rdma_driver_data = {
 	.fifo_size = SZ_4K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8173_rdma_driver_data = {
 	.fifo_size = SZ_8K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct mtk_disp_rdma_data mt8195_rdma_driver_data = {
 	.fifo_size = 1920,
+	.formats = mt8173_formats,
+	.num_formats = ARRAY_SIZE(mt8173_formats),
 };
 
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 112615817dcb..2ba01c484228 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -856,7 +856,9 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
 				BIT(pipe),
 				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
 							num_planes),
-				mtk_ddp_comp_supported_rotations(comp));
+				mtk_ddp_comp_supported_rotations(comp),
+				mtk_ddp_comp_get_formats(comp),
+				mtk_ddp_comp_get_num_formats(comp));
 		if (ret)
 			return ret;
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 6b6d5335c834..4a4c1928f83d 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -359,6 +359,8 @@ static const struct mtk_ddp_comp_funcs ddp_ovl = {
 	.layer_config = mtk_ovl_layer_config,
 	.bgclr_in_on = mtk_ovl_bgclr_in_on,
 	.bgclr_in_off = mtk_ovl_bgclr_in_off,
+	.get_formats = mtk_ovl_get_formats,
+	.get_num_formats = mtk_ovl_get_num_formats,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_postmask = {
@@ -381,6 +383,8 @@ static const struct mtk_ddp_comp_funcs ddp_rdma = {
 	.disable_vblank = mtk_rdma_disable_vblank,
 	.layer_nr = mtk_rdma_layer_nr,
 	.layer_config = mtk_rdma_layer_config,
+	.get_formats = mtk_rdma_get_formats,
+	.get_num_formats = mtk_rdma_get_num_formats,
 };
 
 static const struct mtk_ddp_comp_funcs ddp_ufoe = {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 2d0052c23dcb..7f2e638cfdc2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -71,6 +71,8 @@ struct mtk_ddp_comp_funcs {
 	void (*bgclr_in_off)(struct device *dev);
 	void (*ctm_set)(struct device *dev,
 			struct drm_crtc_state *state);
+	const u32 *(*get_formats)(struct device *dev);
+	size_t (*get_num_formats)(struct device *dev);
 };
 
 struct mtk_ddp_comp {
@@ -203,6 +205,24 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
 		comp->funcs->ctm_set(comp->dev, state);
 }
 
+static inline
+const u32 *mtk_ddp_comp_get_formats(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->get_formats)
+		return comp->funcs->get_formats(comp->dev);
+
+	return NULL;
+}
+
+static inline
+size_t mtk_ddp_comp_get_num_formats(struct mtk_ddp_comp *comp)
+{
+	if (comp->funcs && comp->funcs->get_num_formats)
+		return comp->funcs->get_num_formats(comp->dev);
+
+	return 0;
+}
+
 int mtk_ddp_comp_get_id(struct device_node *node,
 			enum mtk_ddp_comp_type comp_type);
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index d54fbf34b000..31f9420aff6f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -19,20 +19,6 @@
 #include "mtk_drm_gem.h"
 #include "mtk_drm_plane.h"
 
-static const u32 formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_BGRX8888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_UYVY,
-	DRM_FORMAT_YUYV,
-};
-
 static const u64 modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
@@ -315,13 +301,19 @@ static const struct drm_plane_helper_funcs mtk_plane_helper_funcs = {
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations)
+		   unsigned int supported_rotations, const u32 *formats,
+		   size_t num_formats)
 {
 	int err;
 
+	if (!formats || !num_formats) {
+		DRM_ERROR("no formats for plane\n");
+		return -EINVAL;
+	}
+
 	err = drm_universal_plane_init(dev, plane, possible_crtcs,
 				       &mtk_plane_funcs, formats,
-				       ARRAY_SIZE(formats), modifiers, type, NULL);
+				       num_formats, modifiers, type, NULL);
 	if (err) {
 		DRM_ERROR("failed to initialize plane\n");
 		return err;
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
index 8f39011cdbfc..99aff7da0831 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
@@ -48,6 +48,7 @@ to_mtk_plane_state(struct drm_plane_state *state)
 
 int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
 		   unsigned long possible_crtcs, enum drm_plane_type type,
-		   unsigned int supported_rotations);
+		   unsigned int supported_rotations, const u32 *formats,
+		   size_t num_formats);
 
 #endif
-- 
2.39.1.456.gfc5497dd1b-goog

