Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B3122F65
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAEA46EA1E;
	Tue, 17 Dec 2019 14:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40F566EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id AB8882928AD
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 28/34] drm/komeda: Move to helper checking afbc buffer size
Date: Tue, 17 Dec 2019 15:50:14 +0100
Message-Id: <20191217145020.14645-29-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217145020.14645-1-andrzej.p@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
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
Cc: Ayan Halder <Ayan.Halder@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic helper code. Adapt struct komeda_fb users to new location
of respective data members.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../arm/display/komeda/d71/d71_component.c    |  6 +--
 .../arm/display/komeda/komeda_framebuffer.c   | 44 +++++--------------
 .../arm/display/komeda/komeda_framebuffer.h   | 14 ++----
 .../display/komeda/komeda_pipeline_state.c    | 14 +++---
 4 files changed, 26 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 8a02ade369db..5131e51e56d4 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -186,7 +186,7 @@ static void d71_layer_update_fb(struct komeda_component *c,
 				struct komeda_fb *kfb,
 				dma_addr_t *addr)
 {
-	struct drm_framebuffer *fb = &kfb->base;
+	struct drm_framebuffer *fb = &kfb->base.base;
 	const struct drm_format_info *info = fb->format;
 	u32 __iomem *reg = c->reg;
 	int block_h;
@@ -234,9 +234,9 @@ static void d71_layer_update(struct komeda_component *c,
 							     st->afbc_crop_b));
 		/* afbc 1.2 wants payload, afbc 1.0/1.1 wants end_addr */
 		if (fb->modifier & AFBC_FORMAT_MOD_TILED)
-			addr = st->addr[0] + kfb->offset_payload;
+			addr = st->addr[0] + kfb->base.offset_payload;
 		else
-			addr = st->addr[0] + kfb->afbc_size - 1;
+			addr = st->addr[0] + kfb->base.afbc_size - 1;
 
 		malidp_write32(reg, BLK_P1_PTR_LOW, lower_32_bits(addr));
 		malidp_write32(reg, BLK_P1_PTR_HIGH, upper_32_bits(addr));
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index bf4309b62d37..45318ed052a9 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -70,46 +70,26 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 	info = drm_get_format_info(dev, mode_cmd);
 
 	if (mode_cmd->modifier[0]) {
-		u32 alignment_w = 0, alignment_h = 0;
-		u32 alignment_header, n_blocks, bpp;
-
 		if (num_planes != 1) {
 			DRM_DEBUG_KMS("AFBC requires exactly 1 plane.\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &alignment_w, &alignment_h)) {
-			ret = -EINVAL;
-			goto err_cleanup;
-		}
-
 		/* tiled header afbc */
-		if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
-			alignment_w *= AFBC_TH_LAYOUT_ALIGNMENT;
-			alignment_h *= AFBC_TH_LAYOUT_ALIGNMENT;
-			alignment_header = AFBC_TH_BODY_START_ALIGNMENT;
-		} else {
-			alignment_header = AFBC_BODY_START_ALIGNMENT;
-		}
-
-		kfb->aligned_w = ALIGN(mode_cmd->width, alignment_w);
-		kfb->aligned_h = ALIGN(mode_cmd->height, alignment_h);
+		if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED)
+			kfb->base.alignment_header = AFBC_TH_BODY_START_ALIGNMENT;
+		else
+			kfb->base.alignment_header = AFBC_BODY_START_ALIGNMENT;
 
-		if (mode_cmd->offsets[0] % alignment_header) {
+		if (mode_cmd->offsets[0] % kfb->base.alignment_header) {
 			DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		n_blocks = (kfb->aligned_w * kfb->aligned_h) / AFBC_SUPERBLK_PIXELS;
-		kfb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE, alignment_header);
-
-		bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
-		kfb->afbc_size = kfb->offset_payload
-			       + n_blocks * ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8, AFBC_SUPERBLK_ALIGNMENT);
-		check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
-		check.use_min_size = true;
+		kfb->base.bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
+		check.data = &kfb->base;
 	} else {
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, mode_cmd->width,
 						 mode_cmd->height);
@@ -144,14 +124,14 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto err_cleanup;
 		}
 
-	ret = drm_gem_fb_init_with_funcs(&kfb->base, dev, mode_cmd, objs,
+	ret = drm_gem_fb_init_with_funcs(&kfb->base.base, dev, mode_cmd, objs,
 					 num_planes, &komeda_fb_funcs);
 	if (ret < 0)
 		goto err_cleanup;
 
 	kfb->is_va = mdev->iommu ? true : false;
 
-	return &kfb->base;
+	return &kfb->base.base;
 
 err_cleanup:
 	for (i = 0; i < num_planes; i++)
@@ -164,7 +144,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 int komeda_fb_check_src_coords(const struct komeda_fb *kfb,
 			       u32 src_x, u32 src_y, u32 src_w, u32 src_h)
 {
-	const struct drm_framebuffer *fb = &kfb->base;
+	const struct drm_framebuffer *fb = &kfb->base.base;
 	const struct drm_format_info *info = fb->format;
 	u32 block_w = drm_format_info_block_width(fb->format, 0);
 	u32 block_h = drm_format_info_block_height(fb->format, 0);
@@ -239,7 +219,7 @@ komeda_fb_get_pixel_addr_nofb(const struct drm_format_info *format,
 dma_addr_t
 komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 {
-	struct drm_framebuffer *fb = &kfb->base;
+	struct drm_framebuffer *fb = &kfb->base.base;
 	const struct drm_gem_cma_object *obj;
 
 	if (plane >= fb->format->num_planes) {
@@ -258,7 +238,7 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 bool komeda_fb_is_layer_supported(struct komeda_fb *kfb, u32 layer_type,
 				  u32 rot)
 {
-	struct drm_framebuffer *fb = &kfb->base;
+	struct drm_framebuffer *fb = &kfb->base.base;
 	struct komeda_dev *mdev = fb->dev->dev_private;
 	u32 fourcc = fb->format->format;
 	u64 modifier = fb->modifier;
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
index 2f1f421d3e7f..6cb9d321b6d4 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
@@ -14,8 +14,8 @@
  * struct komeda_fb - Entending drm_framebuffer with komeda attribute
  */
 struct komeda_fb {
-	/** @base: &drm_framebuffer */
-	struct drm_framebuffer base;
+	/** @base: &drm_afbc_framebuffer */
+	struct drm_afbc_framebuffer base;
 	/**
 	 * @format_caps:
 	 * extends drm_format_info for komeda specific information
@@ -23,17 +23,9 @@ struct komeda_fb {
 	const struct komeda_format_caps *format_caps;
 	/** @is_va: if smmu is enabled, it will be true */
 	bool is_va;
-	/** @aligned_w: aligned frame buffer width */
-	u32 aligned_w;
-	/** @aligned_h: aligned frame buffer height */
-	u32 aligned_h;
-	/** @afbc_size: minimum size of afbc */
-	u32 afbc_size;
-	/** @offset_payload: start of afbc body buffer */
-	u32 offset_payload;
 };
 
-#define to_kfb(dfb)	container_of(dfb, struct komeda_fb, base)
+#define to_kfb(dfb)	container_of(dfb, struct komeda_fb, base.base)
 
 struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index 0930234abb9d..f7721244edad 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -320,7 +320,7 @@ komeda_layer_check_cfg(struct komeda_layer *layer,
 	else
 		line_sz = dflow->in_w;
 
-	if (kfb->base.format->hsub > 1)
+	if (kfb->base.base.format->hsub > 1)
 		max_line_sz = layer->yuv_line_sz;
 	else
 		max_line_sz = layer->line_sz;
@@ -360,12 +360,14 @@ komeda_layer_validate(struct komeda_layer *layer,
 	st->rot = dflow->rot;
 
 	if (fb->modifier) {
-		st->hsize = kfb->aligned_w;
-		st->vsize = kfb->aligned_h;
+		st->hsize = kfb->base.aligned_width;
+		st->vsize = kfb->base.aligned_height;
 		st->afbc_crop_l = dflow->in_x;
-		st->afbc_crop_r = kfb->aligned_w - dflow->in_x - dflow->in_w;
+		st->afbc_crop_r = kfb->base.aligned_width
+				- dflow->in_x - dflow->in_w;
 		st->afbc_crop_t = dflow->in_y;
-		st->afbc_crop_b = kfb->aligned_h - dflow->in_y - dflow->in_h;
+		st->afbc_crop_b = kfb->base.aligned_height
+				- dflow->in_y - dflow->in_h;
 	} else {
 		st->hsize = dflow->in_w;
 		st->vsize = dflow->in_h;
@@ -419,7 +421,7 @@ komeda_wb_layer_validate(struct komeda_layer *wb_layer,
 	st->hsize = dflow->out_w;
 	st->vsize = dflow->out_h;
 
-	for (i = 0; i < kfb->base.format->num_planes; i++)
+	for (i = 0; i < kfb->base.base.format->num_planes; i++)
 		st->addr[i] = komeda_fb_get_pixel_addr(kfb, dflow->out_x,
 						       dflow->out_y, i);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
