Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331836BCB09
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 10:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFED010E0A4;
	Thu, 16 Mar 2023 09:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6532410E09F;
 Thu, 16 Mar 2023 09:37:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE75921A37;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678959460; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGvmyRmKpBmeWXZokeOsMukWPjHHgKocOENhTNx6SIs=;
 b=at/yMDJIk6Mni+r34u/Znd1FKY8umrZGzlgqGd7HwSqCBZ/slrAKbfIgcXv2cyynAxdxLq
 lg+NyMpf8z2F7orA3adjSEQhbtuPxCoaSgbHqWYo3H5ujRPQu6mp1qu2fB2XtvC4CuTXkH
 HKNicI2E1F0WZVjxSgY2yaBe3goAolc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678959460;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGvmyRmKpBmeWXZokeOsMukWPjHHgKocOENhTNx6SIs=;
 b=2IxAtqSfSRFUEMNcwhERfkpqLQAODzi4B7q2H8mL0OWpl+ENdpmPSJ+92achIEEPrSTd/R
 JdfMeSFSkyUImdBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4689133E0;
 Thu, 16 Mar 2023 09:37:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cGcmL2TjEmSORwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Mar 2023 09:37:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com
Subject: [PATCH 05/10] drm/radeon: Move fbdev object helpers before struct
 fb_ops et al
Date: Thu, 16 Mar 2023 10:37:33 +0100
Message-Id: <20230316093738.28866-6-tzimmermann@suse.de>
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

Move the helpers for creating and destroying fbdev GEM objects
to the top of the source file. Makes them available to fb_ops
functions. This will allow to implement framebuffer cleanup in
fb_destroy. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_fb.c | 76 +++++++++++++++---------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
index 7af038ed0d2d..152563c6e55a 100644
--- a/drivers/gpu/drm/radeon/radeon_fb.c
+++ b/drivers/gpu/drm/radeon/radeon_fb.c
@@ -40,44 +40,6 @@
 
 #include "radeon.h"
 
-static int
-radeonfb_open(struct fb_info *info, int user)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
-	int ret = pm_runtime_get_sync(rdev->ddev->dev);
-
-	if (ret < 0 && ret != -EACCES) {
-		pm_runtime_mark_last_busy(rdev->ddev->dev);
-		pm_runtime_put_autosuspend(rdev->ddev->dev);
-		return ret;
-	}
-	return 0;
-}
-
-static int
-radeonfb_release(struct fb_info *info, int user)
-{
-	struct drm_fb_helper *fb_helper = info->par;
-	struct radeon_device *rdev = fb_helper->dev->dev_private;
-
-	pm_runtime_mark_last_busy(rdev->ddev->dev);
-	pm_runtime_put_autosuspend(rdev->ddev->dev);
-	return 0;
-}
-
-static const struct fb_ops radeonfb_ops = {
-	.owner = THIS_MODULE,
-	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_open = radeonfb_open,
-	.fb_release = radeonfb_release,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-};
-
 static void radeonfb_destroy_pinned_object(struct drm_gem_object *gobj)
 {
 	struct radeon_bo *rbo = gem_to_radeon_bo(gobj);
@@ -178,6 +140,44 @@ static int radeonfb_create_pinned_object(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
+static int
+radeonfb_open(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
+	int ret = pm_runtime_get_sync(rdev->ddev->dev);
+
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_mark_last_busy(rdev->ddev->dev);
+		pm_runtime_put_autosuspend(rdev->ddev->dev);
+		return ret;
+	}
+	return 0;
+}
+
+static int
+radeonfb_release(struct fb_info *info, int user)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct radeon_device *rdev = fb_helper->dev->dev_private;
+
+	pm_runtime_mark_last_busy(rdev->ddev->dev);
+	pm_runtime_put_autosuspend(rdev->ddev->dev);
+	return 0;
+}
+
+static const struct fb_ops radeonfb_ops = {
+	.owner = THIS_MODULE,
+	DRM_FB_HELPER_DEFAULT_OPS,
+	.fb_open = radeonfb_open,
+	.fb_release = radeonfb_release,
+	.fb_read = drm_fb_helper_cfb_read,
+	.fb_write = drm_fb_helper_cfb_write,
+	.fb_fillrect = drm_fb_helper_cfb_fillrect,
+	.fb_copyarea = drm_fb_helper_cfb_copyarea,
+	.fb_imageblit = drm_fb_helper_cfb_imageblit,
+};
+
 static int radeonfb_create(struct drm_fb_helper *helper,
 			   struct drm_fb_helper_surface_size *sizes)
 {
-- 
2.39.2

