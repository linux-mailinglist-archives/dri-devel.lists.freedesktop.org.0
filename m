Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF016181BD3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9A86E9A0;
	Wed, 11 Mar 2020 14:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2106E99B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 14:55:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id BA6C3296167
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv7 4/6] drm/arm/malidp: Allocate an afbc-specific
 drm_framebuffer
Date: Wed, 11 Mar 2020 15:55:39 +0100
Message-Id: <20200311145541.29186-5-andrzej.p@collabora.com>
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

Prepare for using generic afbc helpers.

Use an existing helper which allows allocating a struct drm_framebuffer
in the driver.

afbc-specific checks should go after drm_gem_fb_init_with_funcs().

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 50 +++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index cafbd81e4c1e..b9715b19af94 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -269,13 +269,36 @@ static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
 	.atomic_commit_tail = malidp_atomic_commit_tail,
 };
 
+static const struct drm_framebuffer_funcs malidp_fb_funcs = {
+	.destroy	= drm_gem_fb_destroy,
+	.create_handle	= drm_gem_fb_create_handle,
+};
+
 static struct drm_framebuffer *
 malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
+	struct drm_afbc_framebuffer *afbc_fb;
+	const struct drm_format_info *info;
+	int ret, i;
+
+	info = drm_get_format_info(dev, mode_cmd);
+	if (!info)
+		return ERR_PTR(-ENOMEM);
+
+	afbc_fb = kzalloc(sizeof(*afbc_fb), GFP_KERNEL);
+	if (!afbc_fb)
+		return ERR_PTR(-ENOMEM);
+
+	ret = drm_gem_fb_init_with_funcs(dev, &afbc_fb->base, file, mode_cmd,
+					 &malidp_fb_funcs);
+	if (ret) {
+		kfree(afbc_fb);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	if (mode_cmd->modifier[0]) {
 		int n_superblocks = 0;
-		const struct drm_format_info *info;
 		struct drm_gem_object *objs = NULL;
 		u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
 		u32 afbc_superblock_width = 0, afbc_size = 0;
@@ -283,23 +306,23 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 
 		if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
 						mode_cmd->modifier[0]) == false)
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 
 		if (mode_cmd->offsets[0] != 0) {
 			DRM_DEBUG_KMS("AFBC buffer plane offset should be 0\n");
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
 		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
 		case AFBC_SIZE_16X16:
 			if ((mode_cmd->width % 16) || (mode_cmd->height % 16)) {
 				DRM_DEBUG_KMS("AFBC buffers must be aligned to 16 pixels\n");
-				return ERR_PTR(-EINVAL);
+				goto free_fb;
 			}
 			break;
 		default:
 			DRM_DEBUG_KMS("Unsupported AFBC block size\n");
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
 		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
@@ -309,10 +332,9 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			break;
 		default:
 			DRM_DEBUG_KMS("AFBC superblock size not supported\n");
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
-		info = drm_get_format_info(dev, mode_cmd);
 
 		n_superblocks = (mode_cmd->width / afbc_superblock_width) *
 			(mode_cmd->height / afbc_superblock_height);
@@ -333,26 +355,32 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			DRM_DEBUG_KMS("Invalid value of (pitch * BITS_PER_BYTE) (=%u) should be same as width (=%u) * bpp (=%u)\n",
 				      (mode_cmd->pitches[0] * BITS_PER_BYTE),
 				      mode_cmd->width, bpp);
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
 		objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
 		if (!objs) {
 			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
 		if (objs->size < afbc_size) {
 			DRM_DEBUG_KMS("buffer size %zu/%u too small for AFBC\n",
 				      objs->size, afbc_size);
 			drm_gem_object_put_unlocked(objs);
-			return ERR_PTR(-EINVAL);
+			goto free_fb;
 		}
 
 		drm_gem_object_put_unlocked(objs);
 	}
 
-	return drm_gem_fb_create(dev, file, mode_cmd);
+	return &afbc_fb->base;
+
+free_fb:
+	for (i = 0; i < info->num_planes; ++i)
+		drm_gem_object_put_unlocked(afbc_fb->base.obj[i]);
+	kfree(afbc_fb);
+	return ERR_PTR(-EINVAL);
 }
 
 static const struct drm_mode_config_funcs malidp_mode_config_funcs = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
