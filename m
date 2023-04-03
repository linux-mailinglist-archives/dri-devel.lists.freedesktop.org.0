Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519BD6D4251
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F34E610E3C7;
	Mon,  3 Apr 2023 10:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67D810E171
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:40:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E80AA1FDD6;
 Mon,  3 Apr 2023 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3KRgtzXNnN0XdAk0RUH3zOJy3/TibVGkbQTB7FIzeY=;
 b=Mi9ZUQqZUna/h8R0BhZUqco0VPQfLcm/83ewq7SDLVgBvlsf3t+lMxPb5BoV1MWtzWIWHa
 Y4kj7I/g7t6nIHkHyB8J8s2czs8GBakWw71cCkmUcxOLdhw/frQAOlZ7K3zi30lM5CwSa/
 l3mN7zNLELS/na5nvdvF9xX8yqTw3V0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518437;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3KRgtzXNnN0XdAk0RUH3zOJy3/TibVGkbQTB7FIzeY=;
 b=ZFC8rdElpY3zmBySYtOl/24XVEqXK0I+2kL4/BWQkmeIZ7CGgwaLzPw+BTJNnzpKxWJPU3
 GUwZhs7t+LRSmFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BD0781331A;
 Mon,  3 Apr 2023 10:40:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wOxmLSWtKmQsDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:40:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 2/5] drm/omapdrm: Remove fb from struct omap_fbdev
Date: Mon,  3 Apr 2023 12:40:32 +0200
Message-Id: <20230403104035.15288-3-tzimmermann@suse.de>
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

Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
struct omap_fbdev.fb, which contains the same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_fbdev.c b/drivers/gpu/drm/omapdrm/omap_fbdev.c
index a6c8542087ec..b3d57fe4e6ac 100644
--- a/drivers/gpu/drm/omapdrm/omap_fbdev.c
+++ b/drivers/gpu/drm/omapdrm/omap_fbdev.c
@@ -25,7 +25,6 @@ module_param_named(ywrap, ywrap_enabled, bool, 0644);
 
 struct omap_fbdev {
 	struct drm_fb_helper base;
-	struct drm_framebuffer *fb;
 	struct drm_gem_object *bo;
 	bool ywrap_enabled;
 
@@ -170,7 +169,6 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 	DBG("fbi=%p, dev=%p", fbi, dev);
 
-	fbdev->fb = fb;
 	helper->fb = fb;
 
 	fbi->fbops = &omap_fb_ops;
@@ -193,7 +191,7 @@ static int omap_fbdev_create(struct drm_fb_helper *helper,
 
 
 	DBG("par=%p, %dx%d", fbi->par, fbi->var.xres, fbi->var.yres);
-	DBG("allocated %dx%d fb", fbdev->fb->width, fbdev->fb->height);
+	DBG("allocated %dx%d fb", fb->width, fb->height);
 
 	return 0;
 
@@ -266,6 +264,7 @@ void omap_fbdev_fini(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
 	struct drm_fb_helper *helper = priv->fbdev;
+	struct drm_framebuffer *fb;
 	struct omap_fbdev *fbdev;
 
 	DBG();
@@ -273,6 +272,8 @@ void omap_fbdev_fini(struct drm_device *dev)
 	if (!helper)
 		return;
 
+	fb = helper->fb;
+
 	drm_fb_helper_unregister_info(helper);
 
 	drm_fb_helper_fini(helper);
@@ -284,8 +285,8 @@ void omap_fbdev_fini(struct drm_device *dev)
 		omap_gem_unpin(fbdev->bo);
 
 	/* this will free the backing object */
-	if (fbdev->fb)
-		drm_framebuffer_remove(fbdev->fb);
+	if (fb)
+		drm_framebuffer_remove(fb);
 
 	drm_fb_helper_unprepare(helper);
 	kfree(fbdev);
-- 
2.40.0

