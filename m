Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AB06D4253
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F14510E3D3;
	Mon,  3 Apr 2023 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9588310E3D3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:40:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 252CC21B62;
 Mon,  3 Apr 2023 10:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cl0FqONvAi/12IEt3gbFh+viYjTeUasqBFbhOnCDdw=;
 b=LI6ZFTsmZkR1ub8dWfxh61o4RYs2JqTw4FoSdDarsuDmpENecdwKyRABumvzKYBL/ccLzG
 Zaf8i3xPS6SukBvbXgWqeIIqs5wqskiq5Nlcs5j9qWASI2nngh8Xkbt20TXMKtLk5wXxHL
 cL8f3W9sZwa2hpb8BaGXMj5qN0dBo/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2cl0FqONvAi/12IEt3gbFh+viYjTeUasqBFbhOnCDdw=;
 b=XfJ7aIPfE0B/0fqUhN8E8rO1ZWyLFT1fkFqMLM1wTPpYbbGX2qD05jM5oxR5ya6voqsTlT
 lzIUjmvZAc33VrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA0BA13A0E;
 Mon,  3 Apr 2023 10:40:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MLgHOCWtKmQsDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:40:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 3/5] drm/omapdrm: Remove bo from struct omap_fbdev
Date: Mon,  3 Apr 2023 12:40:33 +0200
Message-Id: <20230403104035.15288-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230403104035.15288-1-tzimmermann@suse.de>
References: <20230403104035.15288-1-tzimmermann@suse.de>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbdev's framebuffer stores a pointer to the GEM object. Remove
struct omap_fbdev.bo, which contains the same value. No functional
changes.

v2:
	* fix commit message (Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 32 +++++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index b3d57fe4e6ac..d04a20f95e3d 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -10,6 +10,7 @@
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 
 #include "omap_drv.h"
 
@@ -25,7 +26,6 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
 
 struct omap_fbdev {
 	struct drm_fb_helper base;
-	struct drm_gem_object *bo;
 	bool ywrap_enabled;
 
 	/* for deferred dmm roll when getting called in atomic ctx */
@@ -37,12 +37,14 @@ static struct drm_fb_helper *get_fb(struct fb_info *fbi);
 static void pan_worker(struct work_struct *work)
 {
 	struct omap_fbdev *fbdev = container_of(work, struct omap_fbdev, work);
-	struct fb_info *fbi = fbdev->base.info;
+	struct drm_fb_helper *helper = &fbdev->base;
+	struct fb_info *fbi = helper->info;
+	struct drm_gem_object *bo = drm_gem_fb_get_obj(helper->fb, 0);
 	int npages;
 
 	/* DMM roll shifts in 4K pages: */
 	npages = fbi->fix.line_length >> PAGE_SHIFT;
-	omap_gem_roll(fbdev->bo, fbi->var.yoffset * npages);
+	omap_gem_roll(bo, fbi->var.yoffset * npages);
 }
 
 static int omap_fbdev_pan_display(struct fb_var_screeninfo *var,
@@ -97,6 +99,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	union omap_gem_size gsize;
 	struct fb_info *fbi = NULL;
 	struct drm_mode_fb_cmd2 mode_cmd = {0};
+	struct drm_gem_object *bo;
 	dma_addr_t dma_addr;
 	int ret;
 
@@ -127,20 +130,20 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 		.bytes = PAGE_ALIGN(mode_cmd.pitches[0] * mode_cmd.height),
 	};
 	DBG("allocating %d bytes for fb %d", gsize.bytes, dev->primary->index);
-	fbdev->bo = omap_gem_new(dev, gsize, OMAP_BO_SCANOUT | OMAP_BO_WC);
-	if (!fbdev->bo) {
+	bo = omap_gem_new(dev, gsize, OMAP_BO_SCANOUT | OMAP_BO_WC);
+	if (!bo) {
 		dev_err(dev->dev, "failed to allocate buffer object\n");
 		ret = -ENOMEM;
 		goto fail;
 	}
 
-	fb = omap_framebuffer_init(dev, &mode_cmd, &fbdev->bo);
+	fb = omap_framebuffer_init(dev, &mode_cmd, &bo);
 	if (IS_ERR(fb)) {
 		dev_err(dev->dev, "failed to allocate fb\n");
 		/* note: if fb creation failed, we can't rely on fb destroy
 		 * to unref the bo:
 		 */
-		drm_gem_object_put(fbdev->bo);
+		drm_gem_object_put(bo);
 		ret = PTR_ERR(fb);
 		goto fail;
 	}
@@ -153,7 +156,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 	 * to it).  Then we just need to be sure that we are able to re-
 	 * pin it in case of an opps.
 	 */
-	ret = omap_gem_pin(fbdev->bo, &dma_addr);
+	ret = omap_gem_pin(bo, &dma_addr);
 	if (ret) {
 		dev_err(dev->dev, "could not pin framebuffer\n");
 		ret = -ENOMEM;
@@ -175,10 +178,10 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
-	fbi->screen_buffer = omap_gem_vaddr(fbdev->bo);
-	fbi->screen_size = fbdev->bo->size;
+	fbi->screen_buffer = omap_gem_vaddr(bo);
+	fbi->screen_size = bo->size;
 	fbi->fix.smem_start = dma_addr;
-	fbi->fix.smem_len = fbdev->bo->size;
+	fbi->fix.smem_len = bo->size;
 
 	/* if we have DMM, then we can use it for scrolling by just
 	 * shuffling pages around in DMM rather than doing sw blit.
@@ -265,6 +268,7 @@ void omap_fbdev_fini(struct drm_device *dev)
 	struct omap_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
 	struct drm_framebuffer *fb;
+	struct drm_gem_object *bo;
 	struct omap_fbdev *fbdev;
 
 	DBG();
@@ -280,9 +284,11 @@ void omap_fbdev_fini(struct drm_device *dev)
 
 	fbdev = to_omap_fbdev(helper);
 
+	bo = drm_gem_fb_get_obj(fb, 0);
+
 	/* unpin the GEM object pinned in omap_fbdev_create() */
-	if (fbdev->bo)
-		omap_gem_unpin(fbdev->bo);
+	if (bo)
+		omap_gem_unpin(bo);
 
 	/* this will free the backing object */
 	if (fb)
-- 
2.40.0

