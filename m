Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA61122F6B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8006EA26;
	Tue, 17 Dec 2019 14:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04E46EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:52:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id C74642928D7
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 31/34] drm/arm/malidp: Factor in afbc framebuffer
 verification
Date: Tue, 17 Dec 2019 15:50:17 +0100
Message-Id: <20191217145020.14645-32-andrzej.p@collabora.com>
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

Prepare for using generic afbc-aware helpers.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 142 +++++++++++++++----------------
 1 file changed, 68 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index e1502666bce0..b53fc01baf2b 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -269,94 +269,88 @@ static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
 	.atomic_commit_tail = malidp_atomic_commit_tail,
 };
 
-static bool
-malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
-			       const struct drm_mode_fb_cmd2 *mode_cmd)
+static struct drm_framebuffer *
+malidp_fb_create(struct drm_device *dev, struct drm_file *file,
+		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
-	int n_superblocks = 0;
-	const struct drm_format_info *info;
-	struct drm_gem_object *objs = NULL;
-	u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
-	u32 afbc_superblock_width = 0, afbc_size = 0;
-	int bpp = 0;
-
-	if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
-					mode_cmd->modifier[0]) == false)
-		return false;
-
-	if (mode_cmd->offsets[0] != 0) {
-		DRM_DEBUG_KMS("AFBC buffers' plane offset should be 0\n");
-		return false;
-	}
+	if (mode_cmd->modifier[0]) {
+		int n_superblocks = 0;
+		const struct drm_format_info *info;
+		struct drm_gem_object *objs = NULL;
+		u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
+		u32 afbc_superblock_width = 0, afbc_size = 0;
+		int bpp = 0;
+
+		if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
+						mode_cmd->modifier[0]) == false)
+			return ERR_PTR(-EINVAL);
 
-	switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
-	case AFBC_SIZE_16X16:
-		if ((mode_cmd->width % 16) || (mode_cmd->height % 16)) {
-			DRM_DEBUG_KMS("AFBC buffers must be aligned to 16 pixels\n");
-			return false;
+		if (mode_cmd->offsets[0] != 0) {
+			DRM_DEBUG_KMS("AFBC buffers' plane offset should be 0\n");
+			return ERR_PTR(-EINVAL);
 		}
-		break;
-	default:
-		DRM_DEBUG_KMS("Unsupported AFBC block size\n");
-		return false;
-	}
 
-	switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
-	case AFBC_SIZE_16X16:
-		afbc_superblock_height = 16;
-		afbc_superblock_width = 16;
-		break;
-	default:
-		DRM_DEBUG_KMS("AFBC superblock size is not supported\n");
-		return false;
-	}
+		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
+		case AFBC_SIZE_16X16:
+			if ((mode_cmd->width % 16) || (mode_cmd->height % 16)) {
+				DRM_DEBUG_KMS("AFBC buffers must be aligned to 16 pixels\n");
+				return ERR_PTR(-EINVAL);
+			}
+			break;
+		default:
+			DRM_DEBUG_KMS("Unsupported AFBC block size\n");
+			return ERR_PTR(-EINVAL);
+		}
 
-	info = drm_get_format_info(dev, mode_cmd);
+		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
+		case AFBC_SIZE_16X16:
+			afbc_superblock_height = 16;
+			afbc_superblock_width = 16;
+			break;
+		default:
+			DRM_DEBUG_KMS("AFBC superblock size is not supported\n");
+			return ERR_PTR(-EINVAL);
+		}
 
-	n_superblocks = (mode_cmd->width / afbc_superblock_width) *
-		(mode_cmd->height / afbc_superblock_height);
+		info = drm_get_format_info(dev, mode_cmd);
 
-	bpp = malidp_format_get_bpp(info->format);
+		n_superblocks = (mode_cmd->width / afbc_superblock_width) *
+			(mode_cmd->height / afbc_superblock_height);
 
-	afbc_superblock_size = (bpp * afbc_superblock_width * afbc_superblock_height)
-				/ BITS_PER_BYTE;
+		bpp = malidp_format_get_bpp(info->format);
 
-	afbc_size = ALIGN(n_superblocks * AFBC_HEADER_SIZE, AFBC_SUPERBLK_ALIGNMENT);
-	afbc_size += n_superblocks * ALIGN(afbc_superblock_size, AFBC_SUPERBLK_ALIGNMENT);
+		afbc_superblock_size =
+			(bpp * afbc_superblock_width * afbc_superblock_height)
+			/ BITS_PER_BYTE;
 
-	if ((mode_cmd->width * bpp) != (mode_cmd->pitches[0] * BITS_PER_BYTE)) {
-		DRM_DEBUG_KMS("Invalid value of (pitch * BITS_PER_BYTE) (=%u) "
-			      "should be same as width (=%u) * bpp (=%u)\n",
-			      (mode_cmd->pitches[0] * BITS_PER_BYTE),
-			      mode_cmd->width, bpp);
-		return false;
-	}
+		afbc_size = ALIGN(n_superblocks * AFBC_HEADER_SIZE,
+				  AFBC_SUPERBLK_ALIGNMENT);
+		afbc_size += n_superblocks
+			* ALIGN(afbc_superblock_size, AFBC_SUPERBLK_ALIGNMENT);
 
-	objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
-	if (!objs) {
-		DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-		return false;
-	}
-
-	if (objs->size < afbc_size) {
-		DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
-			      objs->size, afbc_size);
-		drm_gem_object_put_unlocked(objs);
-		return false;
-	}
-
-	drm_gem_object_put_unlocked(objs);
+		if ((mode_cmd->width * bpp) !=
+			(mode_cmd->pitches[0] * BITS_PER_BYTE)) {
+			DRM_DEBUG_KMS("Invalid value of (pitch * BITS_PER_BYTE) (=%u) "
+				      "should be same as width (=%u) * bpp (=%u)\n",
+				      (mode_cmd->pitches[0] * BITS_PER_BYTE),
+				      mode_cmd->width, bpp);
+			return ERR_PTR(-EINVAL);
+		}
 
-	return true;
-}
+		objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
+		if (!objs) {
+			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
+			return ERR_PTR(-EINVAL);
+		}
 
-static struct drm_framebuffer *
-malidp_fb_create(struct drm_device *dev, struct drm_file *file,
-		 const struct drm_mode_fb_cmd2 *mode_cmd)
-{
-	if (mode_cmd->modifier[0]) {
-		if (!malidp_verify_afbc_framebuffer(dev, file, mode_cmd))
+		if (objs->size < afbc_size) {
+			DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
+				      objs->size, afbc_size);
+			drm_gem_object_put_unlocked(objs);
 			return ERR_PTR(-EINVAL);
+		}
+
+		drm_gem_object_put_unlocked(objs);
 	}
 
 	return drm_gem_fb_create(dev, file, mode_cmd);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
