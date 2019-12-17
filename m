Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B061122F6A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 15:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20316EA23;
	Tue, 17 Dec 2019 14:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8596EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 14:53:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id EAB09292803
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCHv5 32/34] drm/arm/malidp: Use generic helpers for afbc checks
Date: Tue, 17 Dec 2019 15:50:18 +0100
Message-Id: <20191217145020.14645-33-andrzej.p@collabora.com>
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

Helpers are now available for checking afbc buffer properties. Use those.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 71 ++++++++++++++------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index b53fc01baf2b..4cbd920b48cd 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -273,12 +273,17 @@ static struct drm_framebuffer *
 malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 		 const struct drm_mode_fb_cmd2 *mode_cmd)
 {
+	struct drm_size_check check = { 0 };
+	struct drm_gem_object *objs[4];
+	struct drm_afbc_framebuffer *afbc_fb;
+	int ret, i, num_planes;
+
+	afbc_fb = kzalloc(sizeof(*afbc_fb), GFP_KERNEL);
+	if (!afbc_fb)
+		return ERR_PTR(-ENOMEM);
+
 	if (mode_cmd->modifier[0]) {
-		int n_superblocks = 0;
 		const struct drm_format_info *info;
-		struct drm_gem_object *objs = NULL;
-		u32 afbc_superblock_size = 0, afbc_superblock_height = 0;
-		u32 afbc_superblock_width = 0, afbc_size = 0;
 		int bpp = 0;
 
 		if (malidp_format_mod_supported(dev, mode_cmd->pixel_format,
@@ -302,32 +307,9 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 			return ERR_PTR(-EINVAL);
 		}
 
-		switch (mode_cmd->modifier[0] & AFBC_SIZE_MASK) {
-		case AFBC_SIZE_16X16:
-			afbc_superblock_height = 16;
-			afbc_superblock_width = 16;
-			break;
-		default:
-			DRM_DEBUG_KMS("AFBC superblock size is not supported\n");
-			return ERR_PTR(-EINVAL);
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
@@ -336,24 +318,31 @@ malidp_fb_create(struct drm_device *dev, struct drm_file *file,
 				      mode_cmd->width, bpp);
 			return ERR_PTR(-EINVAL);
 		}
+		afbc_fb->bpp = bpp;
+		check.data = afbc_fb;
+	}
 
-		objs = drm_gem_object_lookup(file, mode_cmd->handles[0]);
-		if (!objs) {
-			DRM_DEBUG_KMS("Failed to lookup GEM object\n");
-			return ERR_PTR(-EINVAL);
-		}
+	ret = drm_gem_fb_lookup(dev, file, mode_cmd, objs);
+	if (ret < 0)
+		goto err_free;
+	num_planes = ret;
 
-		if (objs->size < afbc_size) {
-			DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
-				      objs->size, afbc_size);
-			drm_gem_object_put_unlocked(objs);
-			return ERR_PTR(-EINVAL);
-		}
+	ret = drm_gem_fb_size_check2(dev, mode_cmd, &check, objs);
+	if (ret < 0)
+		goto err_cleanup;
 
-		drm_gem_object_put_unlocked(objs);
-	}
+	ret = drm_gem_fb_init(&afbc_fb->base, dev, mode_cmd, objs, num_planes);
+	if (ret < 0)
+		goto err_cleanup;
+
+	return &afbc_fb->base;
 
-	return drm_gem_fb_create(dev, file, mode_cmd);
+err_cleanup:
+	for (i = 0; i < num_planes; ++i)
+		drm_gem_object_put_unlocked(objs[i]);
+err_free:
+	kfree(afbc_fb);
+	return ERR_PTR(ret);
 }
 
 static const struct drm_mode_config_funcs malidp_mode_config_funcs = {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
