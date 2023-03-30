Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2386CFE53
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:32:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF74810ED30;
	Thu, 30 Mar 2023 08:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582F010E1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:32:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 06D2A1FEA8;
 Thu, 30 Mar 2023 08:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680165128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxA7GwDmWbNOum09iWV5aNCcEIPi6j/jTNkbnVKoDxY=;
 b=S2OKw89DDU3b/JhKByFsSaHV0kKmI6LdR1xv/OSgnaEvhuvZnfjmSx/7waD4GqejcsICpn
 R0NQFDA/y2O0jAtu93Iwn91xn2FMXvL69Ms9u7/L6wyuO4ISNoUa6nrzU0ZcKdetsFRhml
 ewIGdM47Aeh20ecvqz0cwm9KlBUtpb8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680165128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qxA7GwDmWbNOum09iWV5aNCcEIPi6j/jTNkbnVKoDxY=;
 b=IdGwrqlf8JoTmgY0Jm+HxRX2WPDTvmGRTS1yk3C41igY8waf5bcP2r6uFazBTan3CmnLPB
 ev9zrjc7xZ2BnbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD3CA138FF;
 Thu, 30 Mar 2023 08:32:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IGXlMAdJJWTlGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:32:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 2/6] drm/omapdrm: Remove fb from struct omap_fbdev
Date: Thu, 30 Mar 2023 10:32:01 +0200
Message-Id: <20230330083205.12621-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083205.12621-1-tzimmermann@suse.de>
References: <20230330083205.12621-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fbdev's struct fb_helper stores a pointer to the framebuffer. Remove
struct omap_fbdev.fb, which contains the same value. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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

