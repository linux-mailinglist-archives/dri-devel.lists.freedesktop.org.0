Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4927511E763
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 17:00:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC50F6EAEE;
	Fri, 13 Dec 2019 16:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1E286E9B9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 15:59:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B45F0292C63
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv4 05/36] drm/gem-fb-helper: Add generic afbc size checks
Date: Fri, 13 Dec 2019 16:58:36 +0100
Message-Id: <20191213155907.16581-6-andrzej.p@collabora.com>
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

Extend the size-checking special function to handle afbc.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/drm_fourcc.c                 | 10 +++-
 drivers/gpu/drm/drm_framebuffer.c            |  3 +
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 60 ++++++++++++++++++--
 include/drm/drm_gem_framebuffer_helper.h     | 16 ++++++
 4 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index d14dd7c86020..9ac2175c5bee 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -323,8 +323,14 @@ drm_get_format_info(struct drm_device *dev,
 {
 	const struct drm_format_info *info = NULL;
 
-	if (dev->mode_config.funcs->get_format_info)
-		info = dev->mode_config.funcs->get_format_info(mode_cmd);
+	/* bypass driver callback if afbc */
+	if (!drm_is_afbc(mode_cmd->modifier[0]))
+		if (dev->mode_config.funcs->get_format_info) {
+			const struct drm_mode_config_funcs *funcs;
+
+			funcs = dev->mode_config.funcs;
+			info = funcs->get_format_info(mode_cmd);
+		}
 
 	if (!info)
 		info = drm_format_info(mode_cmd->pixel_format);
diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 57564318ceea..33b741cc73e8 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -204,6 +204,9 @@ static int framebuffer_check(struct drm_device *dev,
 		unsigned int block_size = info->char_per_block[i];
 		u64 min_pitch = drm_format_info_min_pitch(info, i, width);
 
+		if (drm_is_afbc(r->modifier[i]))
+			block_size = 0;
+
 		if (!block_size && (r->modifier[i] == DRM_FORMAT_MOD_LINEAR)) {
 			DRM_DEBUG_KMS("Format requires non-linear modifier for plane %d\n", i);
 			return -EINVAL;
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 4201dc1f32a5..e20f4d00b0a5 100644
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
@@ -200,6 +205,40 @@ int drm_gem_fb_lookup(struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_lookup);
 
+static int drm_gem_afbc_min_size(struct drm_device *dev,
+				 const struct drm_mode_fb_cmd2 *mode_cmd,
+				 struct drm_afbc *afbc)
+{
+	u32 n_blocks;
+
+	if (!drm_afbc_get_superblock_wh(mode_cmd->modifier[0],
+					&afbc->block_width,
+					&afbc->block_height)) {
+		return -EINVAL;
+	}
+
+	/* tiled header afbc */
+	if (mode_cmd->modifier[0] & AFBC_FORMAT_MOD_TILED) {
+		afbc->block_width *= AFBC_TH_LAYOUT_ALIGNMENT;
+		afbc->block_height *= AFBC_TH_LAYOUT_ALIGNMENT;
+	}
+
+	afbc->aligned_width = ALIGN(mode_cmd->width, afbc->block_width);
+	afbc->aligned_height = ALIGN(mode_cmd->height, afbc->block_height);
+	afbc->offset = mode_cmd->offsets[0];
+
+	n_blocks = (afbc->aligned_width * afbc->aligned_height)
+		 / AFBC_SUPERBLOCK_PIXELS;
+	afbc->offset_payload = ALIGN(n_blocks * AFBC_HEADER_SIZE,
+				     afbc->alignment_header);
+
+	afbc->afbc_size = afbc->offset_payload + n_blocks *
+			  ALIGN(afbc->bpp * AFBC_SUPERBLOCK_PIXELS / 8,
+				AFBC_SUPERBLOCK_ALIGNMENT);
+
+	return 0;
+}
+
 /**
  * drm_gem_fb_size_check_special() - Helper function for use in
  *				     &drm_mode_config_funcs.fb_create
@@ -218,6 +257,7 @@ int drm_gem_fb_size_check_special(struct drm_device *dev,
 				  const struct drm_size_check *check,
 				  struct drm_gem_object **objs)
 {
+#define CHECK_HAS(field) (check && check->field)
 	const struct drm_format_info *info;
 	int i;
 
@@ -231,24 +271,34 @@ int drm_gem_fb_size_check_special(struct drm_device *dev,
 		unsigned int min_size;
 		u32 pitch = mode_cmd->pitches[i];
 
-		if (check && check->use_pitch_multiplier)
+		if (CHECK_HAS(use_pitch_multiplier))
 			if ((pitch * check->pitch_multiplier[i]) %
 			    check->pitch_modulo)
 				return -EINVAL;
 
-		if (check && check->use_min_size)
+		if (CHECK_HAS(use_min_size)) {
 			min_size = check->min_size[i];
-		else
+		} else if (CHECK_HAS(data) &&
+				drm_is_afbc(mode_cmd->modifier[0])) {
+			struct drm_afbc *afbc;
+			int ret;
+
+			afbc = check->data;
+			ret = drm_gem_afbc_min_size(dev, mode_cmd, afbc);
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
+#undef CHECK_HAS
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_size_check_special);
 
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 74304a268694..3d6015194b3c 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -22,6 +22,22 @@ struct drm_size_check {
 	u32 pitch_multiplier[4];
 	u32 pitch_modulo;
 	bool use_pitch_multiplier;
+	void *data;
+};
+
+/**
+ * struct drm_afbc - AFBC-specific data.
+ */
+struct drm_afbc {
+	u32 block_width;
+	u32 block_height;
+	u32 aligned_width;
+	u32 aligned_height;
+	u32 offset;
+	u32 alignment_header;
+	u32 afbc_size;
+	u32 offset_payload;
+	u32 bpp;
 };
 
 struct drm_gem_object *drm_gem_fb_get_obj(struct drm_framebuffer *fb,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
