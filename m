Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29717122F4B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:52:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BEE6EA01;
	Tue, 17 Dec 2019 14:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56316EA00
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 0F8C42927C6
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 04/34] drm/gem-fb-helper: Add generic afbc size checks
Date: Tue, 17 Dec 2019 15:49:50 +0100
Message-Id: <20191217145020.14645-5-andrzej.p@collabora.com>
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

Extend the size-checking special function to handle afbc.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 49 +++++++++++++++++--
 include/drm/drm_framebuffer.h                | 50 ++++++++++++++++++++
 include/drm/drm_gem_framebuffer_helper.h     |  1 +
 3 files changed, 96 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index d2fce1ec8f37..5fe9032a5ee8 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -21,6 +21,11 @@
 #include <drm/drm_modeset_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 
+#define AFBC_HEADER_SIZE		16
+#define AFBC_TH_LAYOUT_ALIGNMENT	8
+#define AFBC_SUPERBLOCK_PIXELS		256
+#define AFBC_SUPERBLOCK_ALIGNMENT	128
+
 /**
  * DOC: overview
  *
@@ -299,6 +304,34 @@ int drm_gem_fb_lookup(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
 
+static int drm_gem_afbc_min_size(struct drm_device *dev,
+				 const struct drm_mode_fb_cmd2 *mode_cmd,
+				 struct drm_afbc_framebuffer *afbc_fb)
+{
+	u32 n_blocks;
+
+	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0], &afbc_fb->block_width, &afbc_fb->block_height))
+		return -EINVAL;
+
+	/* tiled header afbc */
+	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
+		afbc_fb->block_width *= AFBC_TH_LAYOUT_ALIGNMENT;
+		afbc_fb->block_height *= AFBC_TH_LAYOUT_ALIGNMENT;
+	}
+
+	afbc_fb->aligned_width = ALIGN(mode_cmd->width, afbc_fb->block_width);
+	afbc_fb->aligned_height = ALIGN(mode_cmd->height, afbc_fb->block_height);
+	afbc_fb->offset = mode_cmd->offsets[0];
+
+	n_blocks = (afbc_fb->aligned_width * afbc_fb->aligned_height) / AFBC_SUPERBLOCK_PIXELS;
+	afbc_fb->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE, afbc_fb->alignment_header);
+
+	afbc_fb->afbc_size = afbc_fb->offset_payload
+			   + n_blocks * ALIGN(afbc_fb->bpp * AFBC_SUPERBLOCK_PIXELS / 8, AFBC_SUPERBLOCK_ALIGNMENT);
+
+	return 0;
+}
+
 /**
  * drm_gem_fb_size_check2() - Helper function for use in
  *			      &drm_mode_config_funcs.fb_create implementations
@@ -334,19 +367,27 @@ int drm_gem_fb_size_check2(struct drm_device *dev,
 			    check->pitch_modulo)
 				return -EINVAL;
 
-		if (check && check->use_min_size)
+		if (check && check->use_min_size) {
 			min_size = check->min_size[i];
-		else
+		} else if (check && check->data && drm_is_afbc(mode_cmd->modifier[0])) {
+			struct drm_afbc_framebuffer *afbc_fb;
+			int ret;
+
+			afbc_fb = check->data;
+			ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc_fb);
+			if (ret < 0)
+				return ret;
+			min_size = ret;
+		} else {
 			min_size = (height - 1) * pitch
 				 + drm_format_info_min_pitch(info, i, width)
 				 + mode_cmd->offsets[i];
-
+		}
 		if (objs[i]->size < min_size)
 			return -EINVAL;
 	}
 
 	return 0;
-
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_size_check2);
 
diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index c0e0256e3e98..c8a06e37585a 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -297,4 +297,54 @@ int drm_framebuffer_plane_width(int width,
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
+	 * @alignment_header: required alignment for afbc headers
+	 */
+	u32 alignment_header;
+	/**
+	 * @afbc_size: minimum size of afbc buffer
+	 */
+	u32 afbc_size;
+	/**
+	 * @offset_payload: start of afbc body buffer
+	 */
+	u32 offset_payload;
+	/**
+	 * @bpp: bpp value for this afbc buffer
+	 */
+	u32 bpp;
+};
+
+#define fb_to_afbc_fb(x) container_of(x, struct drm_afbc_framebuffer, base)
+
 #endif
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 4955af96d6c3..17e3f849a0fb 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -22,6 +22,7 @@ struct drm_size_check {
 	u32 pitch_multiplier[4];
 	u32 pitch_modulo;
 	bool use_pitch_multiplier;
+	void *data;
 };
 
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
