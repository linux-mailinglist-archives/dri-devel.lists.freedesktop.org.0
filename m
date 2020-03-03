Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3816B177596
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 13:01:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 952776E987;
	Tue,  3 Mar 2020 12:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4FD6E855
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 12:01:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 05C6729132C
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv6 2/6] drm/core: Add drm_afbc_framebuffer and a corresponding
 helper
Date: Tue,  3 Mar 2020 13:01:32 +0100
Message-Id: <20200303120136.18294-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303120136.18294-1-andrzej.p@collabora.com>
References: <20200303120136.18294-1-andrzej.p@collabora.com>
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

The new struct contains afbc-specific data.

The new function can be used by drivers which support afbc to complete
the preparation of struct drm_afbc_framebuffer. It must be called after
allocating the said struct and calling drm_gem_fb_init_with_funcs().

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 121 +++++++++++++++++++
 include/drm/drm_framebuffer.h                |  45 +++++++
 include/drm/drm_gem_framebuffer_helper.h     |  11 ++
 3 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 388a080cd2df..2a30f5b6829f 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -21,6 +21,13 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#define AFBC_HEADER_SIZE		16
+#define AFBC_TH_LAYOUT_ALIGNMENT	8
+#define AFBC_HDR_ALIGN			64
+#define AFBC_SUPERBLOCK_PIXELS		256
+#define AFBC_SUPERBLOCK_ALIGNMENT	128
+#define AFBC_TH_BODY_START_ALIGNMENT	4096
+
 /**
  * DOC: overview
  *
@@ -302,6 +309,120 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
 
+/**
+ * drm_afbc_get_superblock_wh - extract afbc block width/height from modifier
+ * @modifier: the modifier to be looked at
+ * @w: address of a place to store the block width
+ * @h: address of a place to store the block height
+ *
+ * Returns: true if the modifier describes a supported block size
+ */
+bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h)
+{
+	switch (modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
+		*w = 16;
+		*h = 16;
+		break;
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
+		*w = 32;
+		*h = 8;
+		break;
+	/* no user exists yet - fall through */
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
+	default:
+		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
+			      modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
+		return false;
+	}
+	return true;
+}
+EXPORT_SYMBOL_GPL(drm_afbc_get_superblock_wh);
+
+static int drm_gem_afbc_min_size(struct drm_device *dev,
+				 const struct drm_mode_fb_cmd2 *mode_cmd,
+				 struct drm_afbc_framebuffer *afbc_fb)
+{
+	const struct drm_format_info *info;
+	u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
+	u32 tmp_bpp; /* remove when all users properly encode cpp in drm_format_info */
+
+	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &afbc_fb->block_width, &afbc_fb->block_height))
+		return -EINVAL;
+
+	/* tiled header afbc */
+	w_alignment = afbc_fb->block_width;
+	h_alignment = afbc_fb->block_height;
+	hdr_alignment = AFBC_HDR_ALIGN;
+	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
+		w_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
+		h_alignment *= AFBC_TH_LAYOUT_ALIGNMENT;
+		hdr_alignment = AFBC_TH_BODY_START_ALIGNMENT;
+	}
+
+	afbc_fb->aligned_width = ALIGN(mode_cmd->width, w_alignment);
+	afbc_fb->aligned_height = ALIGN(mode_cmd->height, h_alignment);
+	afbc_fb->offset = mode_cmd->offsets[0];
+
+	/* Change to always using info->cpp[0] when all users properly encode it */
+	info = drm_get_format_info(dev, mode_cmd);
+	tmp_bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
+
+	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height) / AFBC_SUPERBLOCK_PIXELS;
+	afbc_fb->afbc_size = ALIGN(n_blocks * AFBC_HEADER_SIZE, hdr_alignment);
+	afbc_fb->afbc_size += n_blocks * ALIGN(tmp_bpp * AFBC_SUPERBLOCK_PIXELS / 8, AFBC_SUPERBLOCK_ALIGNMENT);
+
+	return 0;
+}
+
+/**
+ * drm_gem_fb_afbc_init() - Helper function for drivers using afbc to
+ *			    fill and validate all the afbc-specific
+ *			    struct drm_afbc_framebuffer members
+ *
+ * @dev: DRM device
+ * @afbc_fb: afbc-specific framebuffer
+ * @mode_cmd: Metadata from the userspace framebuffer creation request
+ * @afbc_fb: afbc framebuffer
+ *
+ * This function can be used by drivers which support afbc to complete
+ * the preparation of struct drm_afbc_framebuffer. It must be called after
+ * allocating the said struct and calling drm_gem_fb_init_with_funcs().
+ *
+ * Returns:
+ * Zero on success or a negative error value on failure.
+ */
+int drm_gem_fb_afbc_init(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
+			 struct drm_afbc_framebuffer *afbc_fb)
+{
+	const struct drm_format_info *info;
+	struct drm_gem_object **objs;
+	int ret = -EINVAL, i;
+
+	objs = afbc_fb->base.obj;
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		goto error;
+
+	ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
+	if (ret < 0)
+		goto error;
+
+	if (objs[0]->size < afbc_fb->afbc_size) {
+		ret = -EINVAL;
+		goto error;
+	}
+
+	return 0;
+
+error:
+	for (i = 0; i < info->num_planes; i++)
+		drm_gem_object_put_unlocked(objs[i]);
+
+	return ret;
+}
+
 /**
  * drm_gem_fb_prepare_fb() - Prepare a GEM backed framebuffer
  * @plane: Plane
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index c0e0256e3e98..e9f1b0e2968d 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -297,4 +297,49 @@ int drm_framebuffer_plane_width(int width,
 int drm_framebuffer_plane_height(int height,
 				 const struct drm_framebuffer *fb, int plane);
 
+/**
+ * struct drm_afbc_framebuffer - a special afbc frame buffer object
+ *
+ * A derived class of struct drm_framebuffer, dedicated for afbc use cases.
+ */
+struct drm_afbc_framebuffer {
+	/**
+	 * @base: base framebuffer structure.
+	 */
+	struct drm_framebuffer base;
+	/**
+	 * @block_widht: width of a single afbc block
+	 */
+	u32 block_width;
+	/**
+	 * @block_widht: height of a single afbc block
+	 */
+	u32 block_height;
+	/**
+	 * @aligned_width: aligned frame buffer width
+	 */
+	u32 aligned_width;
+	/**
+	 * @aligned_height: aligned frame buffer height
+	 */
+	u32 aligned_height;
+	/**
+	 * @offset: offset of the first afbc header
+	 */
+	u32 offset;
+	/**
+	 * @afbc_size: minimum size of afbc buffer
+	 */
+	u32 afbc_size;
+	/**
+	 * @bpp: bpp value for this afbc buffer
+	 * To be removed when users such as malidp
+	 * properly store the cpp in drm_format_info.
+	 * New users should not start using this field.
+	 */
+	u32 bpp;
+};
+
+#define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
+
 #endif
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 3f61d9f832ee..c17bf0ebbe55 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -1,6 +1,7 @@
 #ifndef __DRM_GEM_FB_HELPER_H__
 #define __DRM_GEM_FB_HELPER_H__
 
+struct drm_afbc_framebuffer;
 struct drm_device;
 struct drm_fb_helper_surface_size;
 struct drm_file;
@@ -12,6 +13,8 @@ struct drm_plane;
 struct drm_plane_state;
 struct drm_simple_display_pipe;
 
+#define AFBC_VENDOR_AND_TYPE_MASK	GENMASK_ULL(63, 52)
+
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
 					  unsigned int plane);
 void drm_gem_fb_destroy(struct drm_framebuffer *fb);
@@ -34,6 +37,14 @@ struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
+#define drm_is_afbc(modifier) \
+	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
+
+bool drm_afbc_get_superblock_wh(u64 modifier, u32 *w, u32 *h);
+
+int drm_gem_fb_afbc_init(struct drm_device *dev, const struct drm_mode_fb_cmd2 *mode_cmd,
+			 struct drm_afbc_framebuffer *afbc_fb);
+
 int drm_gem_fb_prepare_fb(struct drm_plane *plane,
 			  struct drm_plane_state *state);
 int drm_gem_fb_simple_display_pipe_prepare_fb(struct drm_simple_display_pipe *pipe,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
