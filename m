Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E1E17759A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 13:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9B56E99C;
	Tue,  3 Mar 2020 12:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8E66E855
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 12:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id C2A35292B57
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv6 5/6] drm/arm/malidp: Switch to afbc helpers
Date: Tue,  3 Mar 2020 13:01:35 +0100
Message-Id: <20200303120136.18294-6-andrzej.p@collabora.com>
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

Use available afbc helpers.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 44 +++-----------------------------
 1 file changed, 4 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index c076d0fd5b28..d50b246ce42b 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -291,12 +291,8 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (mode_cmd->modifier[0]) {
-		int n_superblocks = 0;
+	if (drm_is_afbc(mode_cmd->modifier[0])) {
 		const struct drm_format_info *info;
-		struct drm_gem_object *objs = NULL;
-		u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
-		u32 afbc_superblock_width = 0, afbc_size = 0;
 		int bpp = 0;
 
 		if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
@@ -320,32 +316,9 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto free_fb;
 		}
 
-		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
-		case AFBC_SIZE_16X16:
-			afbc_superblock_height = 16;
-			afbc_superblock_width = 16;
-			break;
-		default:
-			DRM_DEBUG_KMS("AFBC superblock size is not supported\n");
-			goto free_fb;
-		}
-
 		info = drm_get_format_info(dev, mode_cmd);
-
-		n_superblocks = (mode_cmd->width / afbc_superblock_width) *
-			(mode_cmd->height / afbc_superblock_height);
-
 		bpp = malidp_format_get_bpp(info->format);
 
-		afbc_superblock_size =
-			(bpp * afbc_superblock_width * afbc_superblock_height)
-			/ BITS_PER_BYTE;
-
-		afbc_size = ALIGN(n_superblocks * AFBC_HEADER_SIZE,
-				  AFBC_SUPERBLK_ALIGNMENT);
-		afbc_size += n_superblocks
-			* ALIGN(afbc_superblock_size, AFBC_SUPERBLK_ALIGNMENT);
-
 		if ((mode_cmd->width * bpp) !=
 			(mode_cmd->pitches[0] * BITS_PER_BYTE)) {
 			DRM_DEBUG_KMS("Invalid value of (pitch * BITS_PER_BYTE) (=%u) "
@@ -355,20 +328,11 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			goto free_fb;
 		}
 
-		objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
-		if (!objs) {
-			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-			goto free_fb;
-		}
+		/* eliminate when cpp is properly encoded in drm_format_info */
+		afbc_fb->bpp = bpp;
 
-		if (objs->size < afbc_size) {
-			DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
-				      objs->size, afbc_size);
-			drm_gem_object_put_unlocked(objs);
+		if (drm_gem_fb_afbc_init(dev, mode_cmd, afbc_fb))
 			goto free_fb;
-		}
-
-		drm_gem_object_put_unlocked(objs);
 	}
 
 	return ret;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
