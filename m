Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560986BCB1E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C1F10EA75;
	Thu, 16 Mar 2023 09:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37C1610E09F;
 Thu, 16 Mar 2023 09:37:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B7E61FE0E;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7IRvDpGuVeE8RDJ8VMJCiCfCgQ9rRG0fTl+8OwI7sc=;
 b=tau7cZL3508Kfb8/4OSbKT2ycEGs0ApItlXTwb7USUDwgnEMex0qCIV2N+xwJGXryqiFbK
 Z6PJJt0eBYQtHvie72igEql7k1YAd/eii0c/daWeEQDPvKT/XxLMUfnFPlEpwsnATCVKpQ
 KA8OqwPS2whAqJBY3GdOEqugl/fH5Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959461;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7IRvDpGuVeE8RDJ8VMJCiCfCgQ9rRG0fTl+8OwI7sc=;
 b=JrtolE6iOOul3NHQTv5FoYp+zFn8OG4Nkcg4zGsj2rTmPz5LsPrxU9KDGXrqiCN4cQ1b/T
 gyE4+OEmqQ8hf6CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F96713A71;
 Thu, 16 Mar 2023 09:37:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sAx9FmXjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 08/10] drm/radeon: Correctly clean up failed display probing
Date: Thu, 16 Mar 2023 10:37:36 +0100
Message-Id: <20230316093738.28866-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316093738.28866-1-tzimmermann@suse.de>
References: <20230316093738.28866-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the fbdev probing function to fully clean up if it failed.
Allows to remove special cases from fb_destroy as well.

This change is reorders the operations within radeonfb_probe(). It
first allocates a buffer object, then builds a DRM framebuffer for
the object and finally creates the fbdev device. If every step
succeeded, the probe function clears the framebuffer memory. This
is the optimal order to rollback any changes if any of the steps
fails.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 72 ++++++++++++++----------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index d85f99b5aa49..2b629bb23be8 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -177,17 +177,14 @@ static void radeon_fbdev_fb_destroy(struct fb_info *info)
 {
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_framebuffer *fb = fb_helper->fb;
+	struct drm_gem_object *gobj = drm_gem_fb_get_obj(fb, 0);
 
-	if (fb) {
-		if (fb->obj[0]) {
-			radeon_fbdev_destroy_pinned_object(fb->obj[0]);
-			fb->obj[0] = NULL;
-			drm_framebuffer_unregister_private(fb);
-			drm_framebuffer_cleanup(fb);
-		}
-		kfree(fb);
-		fb_helper->fb = NULL;
-	}
+	drm_framebuffer_unregister_private(fb);
+	drm_framebuffer_cleanup(fb);
+	kfree(fb);
+	fb_helper->fb = NULL;
+
+	radeon_fbdev_destroy_pinned_object(gobj);
 
 	drm_fb_helper_fini(fb_helper);
 }
@@ -213,11 +210,11 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 					   struct drm_fb_helper_surface_size *sizes)
 {
 	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	struct drm_mode_fb_cmd2 mode_cmd = { };
 	struct fb_info *info;
-	struct drm_framebuffer *fb = NULL;
-	struct drm_mode_fb_cmd2 mode_cmd;
-	struct drm_gem_object *gobj = NULL;
-	struct radeon_bo *rbo = NULL;
+	struct drm_gem_object *gobj;
+	struct radeon_bo *rbo;
+	struct drm_framebuffer *fb;
 	int ret;
 	unsigned long tmp;
 
@@ -236,45 +233,43 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 		DRM_ERROR("failed to create fbcon object %d\n", ret);
 		return ret;
 	}
-
 	rbo = gem_to_radeon_bo(gobj);
 
-	/* okay we have an object now allocate the framebuffer */
-	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info)) {
-		ret = PTR_ERR(info);
-		goto out;
-	}
-
-	/* radeon resume is fragile and needs a vt switch to help it along */
-	info->skip_vt_switch = false;
-
 	fb = kzalloc(sizeof(*fb), GFP_KERNEL);
 	if (!fb) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_radeon_fbdev_destroy_pinned_object;
 	}
-
 	ret = radeon_framebuffer_init(rdev->ddev, fb, &mode_cmd, gobj);
 	if (ret) {
 		DRM_ERROR("failed to initialize framebuffer %d\n", ret);
-		goto out;
+		goto err_kfree;
 	}
 
 	/* setup helper */
 	fb_helper->fb = fb;
 
-	memset_io(rbo->kptr, 0x0, radeon_bo_size(rbo));
+	/* okay we have an object now allocate the framebuffer */
+	info = drm_fb_helper_alloc_info(fb_helper);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_drm_framebuffer_unregister_private;
+	}
 
 	info->fbops = &radeon_fbdev_fb_ops;
+	info->flags = FBINFO_DEFAULT;
+	/* radeon resume is fragile and needs a vt switch to help it along */
+	info->skip_vt_switch = false;
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	tmp = radeon_bo_gpu_offset(rbo) - rdev->mc.vram_start;
 	info->fix.smem_start = rdev->mc.aper_base + tmp;
 	info->fix.smem_len = radeon_bo_size(rbo);
-	info->screen_base = rbo->kptr;
+	info->screen_base = (__force void __iomem *)rbo->kptr;
 	info->screen_size = radeon_bo_size(rbo);
 
-	drm_fb_helper_fill_info(info, fb_helper, sizes);
+	memset_io(info->screen_base, 0, info->screen_size);
 
 	/* Use default scratch pixmap (info->pixmap.flags = FB_PIXMAP_SYSTEM) */
 
@@ -287,13 +282,14 @@ static int radeon_fbdev_fb_helper_fb_probe(struct drm_fb_helper *fb_helper,
 	vga_switcheroo_client_fb_set(rdev->pdev, info);
 	return 0;
 
-out:
-	if (fb && ret) {
-		drm_gem_object_put(gobj);
-		drm_framebuffer_unregister_private(fb);
-		drm_framebuffer_cleanup(fb);
-		kfree(fb);
-	}
+err_drm_framebuffer_unregister_private:
+	fb_helper->fb = NULL;
+	drm_framebuffer_unregister_private(fb);
+	drm_framebuffer_cleanup(fb);
+err_kfree:
+	kfree(fb);
+err_radeon_fbdev_destroy_pinned_object:
+	radeon_fbdev_destroy_pinned_object(gobj);
 	return ret;
 }
 
-- 
2.39.2

