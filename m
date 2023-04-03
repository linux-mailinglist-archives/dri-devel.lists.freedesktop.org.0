Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E166D44AF
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4249C10E448;
	Mon,  3 Apr 2023 12:45:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5956310E448;
 Mon,  3 Apr 2023 12:45:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D11A521CBF;
 Mon,  3 Apr 2023 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680525941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3xOgZ1zB6XHmsdTTIvRQ+18DhES086z/jD6JZDBTQw=;
 b=X/TckpTdR4wGaUBHhNMB+R6cOJw8xllGChhjbBPPl/Bi8WgWaRsvoxTSbxQHI4iKLjrxxf
 BbbliO27yizrTYbyBkJnktPJgYHDT/rMSyUwglSl6c/ai8lH+O3UeO4ihKraSmVd+sdKxz
 U7BLLWmE7gbQF43/tTgh9ExI+M1E2Jw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680525941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3xOgZ1zB6XHmsdTTIvRQ+18DhES086z/jD6JZDBTQw=;
 b=BIkkooK7o99RkeVx3fa9uVM2SYDtwrUDBBDqCraMwe8xGPO8+nH1cK7FErz3i9YZgsSoFb
 j4PVNU81zjO2G/BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FB971331A;
 Mon,  3 Apr 2023 12:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CL0xInXKKmTRVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:41 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 3/8] drm/msm: Remove fb from struct msm_fbdev
Date: Mon,  3 Apr 2023 14:45:33 +0200
Message-Id: <20230403124538.8497-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403124538.8497-1-tzimmermann@suse.de>
References: <20230403124538.8497-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
struct msm_fbdev.fb, which contains thre same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_fbdev.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index fc7d0406a9f9..323a79d9ef83 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -14,8 +14,6 @@
 #include "msm_gem.h"
 #include "msm_kms.h"
 
-static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
-
 /*
  * fbdev funcs, to implement legacy fbdev interface on top of drm driver
  */
@@ -24,9 +22,16 @@ static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma);
 
 struct msm_fbdev {
 	struct drm_fb_helper base;
-	struct drm_framebuffer *fb;
 };
 
+static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
+{
+	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
+	struct drm_gem_object *bo = msm_framebuffer_bo(helper->fb, 0);
+
+	return drm_gem_prime_mmap(bo, vma);
+}
+
 static const struct fb_ops msm_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
@@ -42,19 +47,9 @@ static const struct fb_ops msm_fb_ops = {
 	.fb_mmap = msm_fbdev_mmap,
 };
 
-static int msm_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
-{
-	struct drm_fb_helper *helper = (struct drm_fb_helper *)info->par;
-	struct msm_fbdev *fbdev = to_msm_fbdev(helper);
-	struct drm_gem_object *bo = msm_framebuffer_bo(fbdev->fb, 0);
-
-	return drm_gem_prime_mmap(bo, vma);
-}
-
 static int msm_fbdev_create(struct drm_fb_helper *helper,
 		struct drm_fb_helper_surface_size *sizes)
 {
-	struct msm_fbdev *fbdev = to_msm_fbdev(helper);
 	struct drm_device *dev = helper->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_framebuffer *fb = NULL;
@@ -101,7 +96,6 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
-	fbdev->fb = fb;
 	helper->fb = fb;
 
 	fbi->fbops = &msm_fb_ops;
@@ -118,7 +112,7 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	fbi->fix.smem_len = bo->size;
 
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
-	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
+	DBG("allocated %dx%d fb", fb->width, fb->height);
 
 	return 0;
 
@@ -173,6 +167,7 @@ void msm_fbdev_free(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_framebuffer *fb = helper->fb;
 	struct msm_fbdev *fbdev;
 
 	DBG();
@@ -184,11 +179,10 @@ void msm_fbdev_free(struct drm_device *dev)
 	fbdev = to_msm_fbdev(priv->fbdev);
 
 	/* this will free the backing object */
-	if (fbdev->fb) {
-		struct drm_gem_object *bo =
-			msm_framebuffer_bo(fbdev->fb, 0);
+	if (fb) {
+		struct drm_gem_object *bo = msm_framebuffer_bo(fb, 0);
 		msm_gem_put_vaddr(bo);
-		drm_framebuffer_remove(fbdev->fb);
+		drm_framebuffer_remove(fb);
 	}
 
 	drm_fb_helper_unprepare(helper);
-- 
2.40.0

