Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C5368374C
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 21:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AE510E395;
	Tue, 31 Jan 2023 20:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574AD10E393
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 20:08:59 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id w15so11899274qvs.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 12:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A1Nz94krEj8VbctDyMVZLNXTInk+FYjOJKqp7zS5LwU=;
 b=ePl83/15FDq2b+nWxaXLnSUdVmpmpsnCR/Epzp90zpr+8JXrwX1VDvtWZtlXR+Xmp0
 f9hJWEvAa9lZuZx6T72njvl+SMV9NP+926a5fe3j/uXhKTN61gKOfPKju+y6sFSYwWNH
 a7bTz5tvKvlyYUffwPIygHI+d86DwWufx3P1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A1Nz94krEj8VbctDyMVZLNXTInk+FYjOJKqp7zS5LwU=;
 b=k4cgWiYwND3qU29StFcyhg9gbo54tYGdvzPRsJPN+vFXkq2qmyNUVUH4irFfCokXop
 0OwZBGlXKi6m80dGT1Dqaw+PvW5te6u/9flR9YG2F3VEDzccI53v2cN9duMfSNj74+xz
 8lH6Vh15vQNNwLglMREPd9MuohJ1OxEuI+WoePznunATjCR5+LOh7f863Bvzi10bT8bL
 C8fkltKNL9hzsLX2ElHlUCzQX1QiEN32jnFqsHvdtxV22SoQGuHagI6xydthRduzdLiv
 VtnL3+9+QmRTmp/wPb3IU0QRbhGDpiDDBF+ijhLvEt0gN6sEQue+iXLdCbk+n8AZuR/z
 jeoQ==
X-Gm-Message-State: AO0yUKWEa5i5wXUNu6RFmH0SxuSU9YCp+9v9TJnO9bOcwlpDsE5K36X1
 6NkzVMTNAu0TFI8g+R30hG5bAA==
X-Google-Smtp-Source: AK7set8cnK3+9VGgTbx1zWO95ZXUxQjs3tkdPhsAcpBrSe2va5pam0XGo/wQ737eQ+ZeTwYJysNlwA==
X-Received: by 2002:a05:6214:19c9:b0:537:4c1f:1d17 with SMTP id
 j9-20020a05621419c900b005374c1f1d17mr393054qvc.40.1675195738234; 
 Tue, 31 Jan 2023 12:08:58 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com
 ([2620:0:1003:314:502d:723:d741:14cd])
 by smtp.gmail.com with ESMTPSA id
 m186-20020a37bcc3000000b007068b49b8absm10658782qkf.62.2023.01.31.12.08.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 12:08:57 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/mediatek: Refactor pixel format logic
Date: Tue, 31 Jan 2023 15:08:41 -0500
Message-Id: <20230131200842.341272-2-greenjustin@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230131200842.341272-1-greenjustin@chromium.org>
References: <20230131200842.341272-1-greenjustin@chromium.org>
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

edit1
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

