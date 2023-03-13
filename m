Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FC6B7BB7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 16:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437110E57B;
	Mon, 13 Mar 2023 15:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28A910E0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 15:16:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6973422ACC;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678720572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNH6SkRr3pg8wvgZbbtcDIIRTK4vz32IZKWtLPwrFjw=;
 b=1tGevOGGs2dfxjaWs+3/pIbGZoWNKV8YkuQN18xwK5Qxp212bMZpwbNvJA9FrWOk9Tdcxm
 kzm64+7EX2/v/uYdWVFEumLJEn9nYwqds88x63laVXkG8uGV0TUo2lN9QpmzB0jMBKSt5K
 c77NIwL62FO+xXY6UxbadIXzXoGw+Rs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678720572;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YNH6SkRr3pg8wvgZbbtcDIIRTK4vz32IZKWtLPwrFjw=;
 b=UionwKzhAhBpFcKrl0MjbZXtHvFe3z9isaZNASzZezmEnp8IL4dOh4oPyON6viswlTUo/a
 EeBMZN3TM0KlCDBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CC2113582;
 Mon, 13 Mar 2023 15:16:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gF33ETw+D2Q5ZgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 13 Mar 2023 15:16:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2 5/7] drm/gma500: Inline psbfb_create() into psbfb_probe()
Date: Mon, 13 Mar 2023 16:16:08 +0100
Message-Id: <20230313151610.14367-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313151610.14367-1-tzimmermann@suse.de>
References: <20230313151610.14367-1-tzimmermann@suse.de>
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

Inline psbfb_create() into its only caller psbfb_probe(). Streamline
the color-depth selection. Also clean up the naming around struct
drm_fb_helper_funcs.

v2:
	* rename psbfb_probe() (Patrik)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 71 ++++++++++++++--------------------
 1 file changed, 29 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index f5c4c89a7c47..74e843f8e64d 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -137,31 +137,49 @@ static const struct fb_ops psb_fbdev_fb_ops = {
  * struct drm_fb_helper_funcs
  */
 
-static int psbfb_create(struct drm_fb_helper *fb_helper,
-			struct drm_fb_helper_surface_size *sizes)
+static int psb_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
+			      struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct fb_info *info;
 	struct drm_framebuffer *fb;
-	struct drm_mode_fb_cmd2 mode_cmd;
+	struct drm_mode_fb_cmd2 mode_cmd = { };
 	int size;
 	int ret;
 	struct psb_gem_object *backing;
 	struct drm_gem_object *obj;
 	u32 bpp, depth;
 
-	mode_cmd.width = sizes->surface_width;
-	mode_cmd.height = sizes->surface_height;
+	/* No 24-bit packed mode */
+	if (sizes->surface_bpp == 24) {
+		sizes->surface_bpp = 32;
+		sizes->surface_depth = 24;
+	}
 	bpp = sizes->surface_bpp;
 	depth = sizes->surface_depth;
 
-	/* No 24bit packed */
-	if (bpp == 24)
-		bpp = 32;
+	/*
+	 * If the mode does not fit in 32 bit then switch to 16 bit to get
+	 * a console on full resolution. The X mode setting server will
+	 * allocate its own 32-bit GEM framebuffer.
+	 */
+	size = ALIGN(sizes->surface_width * DIV_ROUND_UP(bpp, 8), 64) *
+		     sizes->surface_height;
+	size = ALIGN(size, PAGE_SIZE);
 
+	if (size > dev_priv->vram_stolen_size) {
+		sizes->surface_bpp = 16;
+		sizes->surface_depth = 16;
+	}
+	bpp = sizes->surface_bpp;
+	depth = sizes->surface_depth;
+
+	mode_cmd.width = sizes->surface_width;
+	mode_cmd.height = sizes->surface_height;
 	mode_cmd.pitches[0] = ALIGN(mode_cmd.width * DIV_ROUND_UP(bpp, 8), 64);
+	mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
 
 	size = mode_cmd.pitches[0] * mode_cmd.height;
 	size = ALIGN(size, PAGE_SIZE);
@@ -180,8 +198,6 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 		goto err_drm_gem_object_put;
 	}
 
-	mode_cmd.pixel_format = drm_mode_legacy_fb_format(bpp, depth);
-
 	fb = psb_framebuffer_create(dev, &mode_cmd, obj);
 	if (IS_ERR(fb)) {
 		ret = PTR_ERR(fb);
@@ -217,37 +233,8 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
 	return ret;
 }
 
-static int psbfb_probe(struct drm_fb_helper *fb_helper,
-				struct drm_fb_helper_surface_size *sizes)
-{
-	struct drm_device *dev = fb_helper->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	unsigned int fb_size;
-	int bytespp;
-
-	bytespp = sizes->surface_bpp / 8;
-	if (bytespp == 3)	/* no 24bit packed */
-		bytespp = 4;
-
-	/*
-	 * If the mode will not fit in 32bit then switch to 16bit to get
-	 * a console on full resolution. The X mode setting server will
-	 * allocate its own 32bit GEM framebuffer
-	 */
-	fb_size = ALIGN(sizes->surface_width * bytespp, 64) *
-		  sizes->surface_height;
-	fb_size = ALIGN(fb_size, PAGE_SIZE);
-
-	if (fb_size > dev_priv->vram_stolen_size) {
-		sizes->surface_bpp = 16;
-		sizes->surface_depth = 16;
-	}
-
-	return psbfb_create(fb_helper, sizes);
-}
-
-static const struct drm_fb_helper_funcs psb_fb_helper_funcs = {
-	.fb_probe = psbfb_probe,
+static const struct drm_fb_helper_funcs psb_fbdev_fb_helper_funcs = {
+	.fb_probe = psb_fbdev_fb_probe,
 };
 
 static int psb_fbdev_destroy(struct drm_device *dev,
@@ -280,7 +267,7 @@ int psb_fbdev_init(struct drm_device *dev)
 
 	dev_priv->fb_helper = fb_helper;
 
-	drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fb_helper_funcs);
+	drm_fb_helper_prepare(dev, fb_helper, 32, &psb_fbdev_fb_helper_funcs);
 
 	ret = drm_fb_helper_init(dev, fb_helper);
 	if (ret)
-- 
2.39.2

