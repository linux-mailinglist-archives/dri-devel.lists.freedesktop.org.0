Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D106181BD1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204C06E99E;
	Wed, 11 Mar 2020 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6616E999
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:55:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 76F50296153
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv7 2/6] drm/core: Add drm_afbc_framebuffer and a corresponding
 helper
Date: Wed, 11 Mar 2020 15:55:37 +0100
Message-Id: <20200311145541.29186-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311145541.29186-1-andrzej.p@collabora.com>
References: <20200311145541.29186-1-andrzej.p@collabora.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
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
 Documentation/gpu/todo.rst                   |  15 +++
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 108 +++++++++++++++++++
 include/drm/drm_framebuffer.h                |  45 ++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  10 ++
 4 files changed, 178 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 439656f55c5d..37a3a023c114 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -404,6 +404,21 @@ Contact: Laurent Pinchart, respective driver maintainers
 
 Level: Intermediate
 
+Encode cpp properly in malidp
+-----------------------------
+
+cpp (chars per pixel) is not encoded properly in malidp, zero is
+used instead. afbc implementation needs bpp or cpp, but if it is
+zero it needs to be provided elsewhere, and so the bpp field exists
+in struct drm_afbc_framebuffer.
+
+Properly encode cpp in malidp and remove the bpp field in struct
+drm_afbc_framebuffer.
+
+Contact: malidp maintainers
+
+Level: Intermediate
+
 Core refactorings
 =================
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 86c1907c579a..7e3982c36baa 100644
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
@@ -302,6 +309,107 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
 
+static int drm_gem_afbc_min_size(struct drm_device *dev,
+				 const struct drm_mode_fb_cmd2 *mode_cmd,
+				 struct drm_afbc_framebuffer *afbc_fb)
+{
+	const struct drm_format_info *info;
+	__u32 n_blocks, w_alignment, h_alignment, hdr_alignment;
+	/* remove bpp when all users properly encode cpp in drm_format_info */
+	__u32 bpp;
+
+	switch (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK) {
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_16x16:
+		afbc_fb->block_width = 16;
+		afbc_fb->block_height = 16;
+		break;
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8:
+		afbc_fb->block_width = 32;
+		afbc_fb->block_height = 8;
+		break;
+	/* no user exists yet - fall through */
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_64x4:
+	case AFBC_FORMAT_MOD_BLOCK_SIZE_32x8_64x4:
+	default:
+		DRM_DEBUG_KMS("Invalid AFBC_FORMAT_MOD_BLOCK_SIZE: %lld.\n",
+			      mode_cmd->modifier[0]
+			      & AFBC_FORMAT_MOD_BLOCK_SIZE_MASK);
+		return -EINVAL;
+	}
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
+	info = drm_get_format_info(dev, mode_cmd);
+	/*
+	 * Change to always using info->cpp[0]
+	 * when all users properly encode it
+	 */
+	bpp = info->cpp[0] ? info->cpp[0] * 8 : afbc_fb->bpp;
+
+	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height)
+		   / AFBC_SUPERBLOCK_PIXELS;
+	afbc_fb->afbc_size = ALIGN(n_blocks * AFBC_HEADER_SIZE, hdr_alignment);
+	afbc_fb->afbc_size += n_blocks * ALIGN(bpp * AFBC_SUPERBLOCK_PIXELS / 8,
+					       AFBC_SUPERBLOCK_ALIGNMENT);
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
+ * It is caller's responsibility to put afbc_fb->base.obj objects in case
+ * the call is unsuccessful.
+ *
+ * Returns:
+ * Zero on success or a negative error value on failure.
+ */
+int drm_gem_fb_afbc_init(struct drm_device *dev,
+			 const struct drm_mode_fb_cmd2 *mode_cmd,
+			 struct drm_afbc_framebuffer *afbc_fb)
+{
+	const struct drm_format_info *info;
+	struct drm_gem_object **objs;
+	int ret;
+
+	objs = afbc_fb->base.obj;
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return -EINVAL;
+
+	ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
+	if (ret < 0)
+		return ret;
+
+	if (objs[0]->size < afbc_fb->afbc_size)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_gem_fb_afbc_init);
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
index c029c1618661..6b013154911d 100644
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
@@ -34,6 +37,13 @@ struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
+#define drm_is_afbc(modifier) \
+	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
+
+int drm_gem_fb_afbc_init(struct drm_device *dev,
+			 const struct drm_mode_fb_cmd2 *mode_cmd,
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
