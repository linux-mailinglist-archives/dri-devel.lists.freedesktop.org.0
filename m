Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AB66A086E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 13:17:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D367210EB63;
	Thu, 23 Feb 2023 12:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B257710EB3F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 12:17:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 46E8D5D624;
 Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677154659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7ojr/SMp5Bbxtsx9U8p5YFE28sZA3wTV5xUrXFy2pw=;
 b=n1j3IPuX7O5LVPhzg+cBg57zCEJGdqyxvK+tjdtkguTFKkPXJZiBHCHbWVS3Ofh+4yp3Rk
 UkwFHz2C6pRCr8Xf9aTjHNfr6puewuk7xX9sPldbJHK1AZflHN+c820JpaN7vtq+Op/Fb0
 QJ4bPK4U5NXLB3E6rovh/xxpPkm6HC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677154659;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U7ojr/SMp5Bbxtsx9U8p5YFE28sZA3wTV5xUrXFy2pw=;
 b=8FYlcpa3OW8WI/MhA3zw8SEWJMWoZBqsEO6VRtZG1j7XOYo+yNY+oCJKb9qo9jYIoaRoYi
 1Legvstthl9bR3Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 261AB139C7;
 Thu, 23 Feb 2023 12:17:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kPleCGNZ92OhSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Feb 2023 12:17:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH 5/7] drm/gma500: Inline psbfb_create() into psbfb_probe()
Date: Thu, 23 Feb 2023 13:17:31 +0100
Message-Id: <20230223121733.12549-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223121733.12549-1-tzimmermann@suse.de>
References: <20230223121733.12549-1-tzimmermann@suse.de>
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
the color-depth selection.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/fbdev.c | 65 ++++++++++++++--------------------
 1 file changed, 26 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/gma500/fbdev.c b/drivers/gpu/drm/gma500/fbdev.c
index 2c511359a7c6..083233692c55 100644
--- a/drivers/gpu/drm/gma500/fbdev.c
+++ b/drivers/gpu/drm/gma500/fbdev.c
@@ -137,31 +137,49 @@ static const struct fb_ops psb_fbdev_ops = {
  * struct drm_fb_helper_funcs
  */
 
-static int psbfb_create(struct drm_fb_helper *fb_helper,
-			struct drm_fb_helper_surface_size *sizes)
+static int psbfb_probe(struct drm_fb_helper *fb_helper,
+		       struct drm_fb_helper_surface_size *sizes)
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
+
+	if (size > dev_priv->vram_stolen_size) {
+		sizes->surface_bpp = 16;
+		sizes->surface_depth = 16;
+	}
+	bpp = sizes->surface_bpp;
+	depth = sizes->surface_depth;
 
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
@@ -217,35 +233,6 @@ static int psbfb_create(struct drm_fb_helper *fb_helper,
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
 static const struct drm_fb_helper_funcs psb_fb_helper_funcs = {
 	.fb_probe = psbfb_probe,
 };
-- 
2.39.2

