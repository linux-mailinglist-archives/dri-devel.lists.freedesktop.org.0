Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C5B11E759
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3456EA8F;
	Fri, 13 Dec 2019 16:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10C26EA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id CDCA3292DA1
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 30/36] drm/komeda: Move to helper checking afbc buffer size
Date: Fri, 13 Dec 2019 16:59:01 +0100
Message-Id: <20191213155907.16581-31-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213155907.16581-1-andrzej.p@collabora.com>
References: <20191213155907.16581-1-andrzej.p@collabora.com>
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
 .../arm/display/komeda/d71/d71_component.c    |  7 ++-
 .../arm/display/komeda/komeda_framebuffer.c   | 60 +++++++++----------
 .../arm/display/komeda/komeda_framebuffer.h   |  8 ---
 .../display/komeda/komeda_pipeline_state.c    | 11 ++--
 4 files changed, 39 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
index 8a02ade369db..bab015f13ef3 100644
--- a/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
+++ b/drivers/gpu/drm/arm/display/komeda/d71/d71_component.c
@@ -4,6 +4,8 @@
  * Author: James.Qian.Wang <james.qian.wang@arm.com>
  *
  */
+#include <linux/types.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include "d71_dev.h"
 #include "komeda_kms.h"
 #include "malidp_io.h"
@@ -234,9 +236,10 @@ static void d71_layer_update(struct komeda_component *c,
 							     st->afbc_crop_b));
 		/* afbc 1.2 wants payload, afbc 1.0/1.1 wants end_addr */
 		if (fb->modifier & AFBC_FORMAT_MOD_TILED)
-			addr = st->addr[0] + kfb->offset_payload;
+			addr = st->addr[0]
+			     + kfb->base.afbc_info->offset_payload;
 		else
-			addr = st->addr[0] + kfb->afbc_size - 1;
+			addr = st->addr[0] + kfb->base.afbc_info->afbc_size - 1;
 
 		malidp_write32(reg, BLK_P1_PTR_LOW, lower_32_bits(addr));
 		malidp_write32(reg, BLK_P1_PTR_HIGH, upper_32_bits(addr));
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 385df1fd776d..d3e0f2c0d924 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -40,6 +40,13 @@ struct drm_framebuffer *
 komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
+#define KFB_ALIGN_MASK(type) \
+	(__alignof__(type) - 1)
+#define KFB_INFO_OFFSET(type1, type2)	\
+	((sizeof(type1) + KFB_ALIGN_MASK(type2)) & ~KFB_ALIGN_MASK(type2))
+#define KFB_COMPOUND_SIZE(type1, type2) \
+	(KFB_INFO_OFFSET(type1, type2) + sizeof(type2))
+
 	struct komeda_dev *mdev = dev->dev_private;
 	struct drm_gem_object *objs[4];
 	struct komeda_fb *kfb;
@@ -48,9 +55,13 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 	int ret = 0, i, num_planes;
 
-	kfb = kzalloc(sizeof(*kfb), GFP_KERNEL);
+	/* alloc in one chunk to ease freeing */
+	kfb = kzalloc(KFB_COMPOUND_SIZE(struct komeda_fb, struct drm_afbc),
+					GFP_KERNEL);
 	if (!kfb)
 		return ERR_PTR(-ENOMEM);
+	kfb->base.modifier_info =
+		kfb + KFB_INFO_OFFSET(struct komeda_fb, struct drm_afbc);
 
 	kfb->format_caps = komeda_get_format_caps(&mdev->fmt_tbl,
 						  mode_cmd->pixel_format,
@@ -70,50 +81,30 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
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
 
-		if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0],
-						&alignment_w, &alignment_h)) {
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
-
-		if (mode_cmd->offsets[0] % alignment_header) {
+		if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED)
+			kfb->base.afbc_info->alignment_header =
+				AFBC_TH_BODY_START_ALIGNMENT;
+		else
+			kfb->base.afbc_info->alignment_header =
+				AFBC_BODY_START_ALIGNMENT;
+
+		if (mode_cmd->offsets[0] %
+			kfb->base.afbc_info->alignment_header) {
 			DRM_DEBUG_KMS("afbc offset alignment check failed.\n");
 			ret = -EINVAL;
 			goto err_cleanup;
 		}
 
-		n_blocks = (kfb->aligned_w * kfb->aligned_h)
-			 / AFBC_SUPERBLK_PIXELS;
-		kfb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE,
-					    alignment_header);
-
-		bpp = komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
-		kfb->afbc_size = kfb->offset_payload + n_blocks *
-				 ALIGN(bpp * AFBC_SUPERBLK_PIXELS / 8,
-				       AFBC_SUPERBLK_ALIGNMENT);
-		check.min_size[0] = kfb->afbc_size + mode_cmd->offsets[0];
-		check.use_min_size = true;
+		kfb->base.afbc_info->bpp =
+			komeda_get_afbc_format_bpp(info, mode_cmd->modifier[0]);
+		check.data = kfb->base.afbc_info;
 	} else {
 		ret = komeda_fb_check_src_coords(kfb, 0, 0, mode_cmd->width,
 						 mode_cmd->height);
@@ -163,6 +154,9 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 err_free:
 	kfree(kfb);
 	return ERR_PTR(ret);
+#undef KFB_ALIGN_MASK
+#undef KFB_INFO_OFFSET
+#undef KFB_COMPOUND_SIZE
 }
 
 int komeda_fb_check_src_coords(const struct komeda_fb *kfb,
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
index 2f1f421d3e7f..9e7af1cc0f12 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.h
@@ -23,14 +23,6 @@ struct komeda_fb {
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
 
 #define to_kfb(dfb)	container_of(dfb, struct komeda_fb, base)
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
index 0930234abb9d..281ec5b8d722 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline_state.c
@@ -6,6 +6,7 @@
  */
 
 #include <drm/drm_print.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <linux/clk.h>
 #include "komeda_dev.h"
 #include "komeda_kms.h"
@@ -360,12 +361,14 @@ komeda_layer_validate(struct komeda_layer *layer,
 	st->rot = dflow->rot;
 
 	if (fb->modifier) {
-		st->hsize = kfb->aligned_w;
-		st->vsize = kfb->aligned_h;
+		st->hsize = kfb->base.afbc_info->aligned_width;
+		st->vsize = kfb->base.afbc_info->aligned_height;
 		st->afbc_crop_l = dflow->in_x;
-		st->afbc_crop_r = kfb->aligned_w - dflow->in_x - dflow->in_w;
+		st->afbc_crop_r = kfb->base.afbc_info->aligned_width
+				- dflow->in_x - dflow->in_w;
 		st->afbc_crop_t = dflow->in_y;
-		st->afbc_crop_b = kfb->aligned_h - dflow->in_y - dflow->in_h;
+		st->afbc_crop_b = kfb->base.afbc_info->aligned_height
+				- dflow->in_y - dflow->in_h;
 	} else {
 		st->hsize = dflow->in_w;
 		st->vsize = dflow->in_h;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
