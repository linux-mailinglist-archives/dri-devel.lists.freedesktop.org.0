Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F6C78B184
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22B810E2D6;
	Mon, 28 Aug 2023 13:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617FB10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1CF611FD6A;
 Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np2n/3f7wv/S/kDMs5Rr9B6sjnw66d5OMm93AjkRpsU=;
 b=QTVm6bOR3zmH+CIzbHsZ6TD4HZJv9H1pvQNI3uu5Azh9W7cFKXR8V7ttRK5YIPYwk4R17h
 8oL3RkBAlZt5Vwv8hQaXQsP8+1LFyCU8foIDzkvYxxcom7O5hvft6BeWGq6COER8t/TJ8/
 HK4aNy59hCXaWBCnqN6ikoCLy8DPNqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=np2n/3f7wv/S/kDMs5Rr9B6sjnw66d5OMm93AjkRpsU=;
 b=oruP81rNuoPU/F8cTR/cz+qD79elKgaUAaF+BY+nIMhTDgxnF2ERlZjC8W6iCkAwLp9qAZ
 65P1RRo+4yPipcCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA19E13A1C;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YPtpMF+f7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 4/8] fbdev/hyperv_fb: Use fb_ops helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:20 +0200
Message-ID: <20230828132131.29295-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828132131.29295-1-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wei Liu <wei.liu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate callback functions for struct fb_ops with the fbdev macro
FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(). Initialize struct fb_ops to
the generated functions with fbdev initializer macros.

The hyperv_fb driver is incomplete in its handling of deferred I/O
and damage framebuffers. Write operations do no trigger damage handling.
Fixing this is beyond the scope of this patch.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
---
 drivers/video/fbdev/Kconfig     |  5 +---
 drivers/video/fbdev/hyperv_fb.c | 48 ++++++++++-----------------------
 2 files changed, 15 insertions(+), 38 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 79b1e4e542e7..4455bfd57f0e 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1905,11 +1905,8 @@ config FB_BROADSHEET
 config FB_HYPERV
 	tristate "Microsoft Hyper-V Synthetic Video support"
 	depends on FB && HYPERV
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
-	select FB_DEFERRED_IO
 	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
+	select FB_IOMEM_HELPERS_DEFERRED
 	select VIDEO_NOMODESET
 	help
 	  This framebuffer driver supports Microsoft Hyper-V Synthetic Video.
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index b9965cbdd764..2e27c6bd8044 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -848,58 +848,38 @@ static int hvfb_blank(int blank, struct fb_info *info)
 	return 1;	/* get fb_blank to set the colormap to all black */
 }
 
-static void hvfb_cfb_fillrect(struct fb_info *p,
-			      const struct fb_fillrect *rect)
+static void hvfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
-	struct hvfb_par *par = p->par;
-
-	cfb_fillrect(p, rect);
-	if (par->synchronous_fb)
-		synthvid_update(p, 0, 0, INT_MAX, INT_MAX);
-	else
-		hvfb_ondemand_refresh_throttle(par, rect->dx, rect->dy,
-					       rect->width, rect->height);
+	/* TODO: implement damage handling */
 }
 
-static void hvfb_cfb_copyarea(struct fb_info *p,
-			      const struct fb_copyarea *area)
+static void hvfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
 {
-	struct hvfb_par *par = p->par;
+	struct hvfb_par *par = info->par;
 
-	cfb_copyarea(p, area);
 	if (par->synchronous_fb)
-		synthvid_update(p, 0, 0, INT_MAX, INT_MAX);
+		synthvid_update(info, 0, 0, INT_MAX, INT_MAX);
 	else
-		hvfb_ondemand_refresh_throttle(par, area->dx, area->dy,
-					       area->width, area->height);
+		hvfb_ondemand_refresh_throttle(par, x, y, width, height);
 }
 
-static void hvfb_cfb_imageblit(struct fb_info *p,
-			       const struct fb_image *image)
-{
-	struct hvfb_par *par = p->par;
-
-	cfb_imageblit(p, image);
-	if (par->synchronous_fb)
-		synthvid_update(p, 0, 0, INT_MAX, INT_MAX);
-	else
-		hvfb_ondemand_refresh_throttle(par, image->dx, image->dy,
-					       image->width, image->height);
-}
+/*
+ * TODO: GEN1 codepaths allocate from system or DMA-able memory. Fix the
+ *       driver to use the _SYSMEM_ or _DMAMEM_ helpers in these cases.
+ */
+FB_GEN_DEFAULT_DEFERRED_IOMEM_OPS(hvfb_ops,
+				  hvfb_ops_damage_range,
+				  hvfb_ops_damage_area)
 
 static const struct fb_ops hvfb_ops = {
 	.owner = THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(hvfb_ops),
 	.fb_check_var = hvfb_check_var,
 	.fb_set_par = hvfb_set_par,
 	.fb_setcolreg = hvfb_setcolreg,
-	.fb_fillrect = hvfb_cfb_fillrect,
-	.fb_copyarea = hvfb_cfb_copyarea,
-	.fb_imageblit = hvfb_cfb_imageblit,
 	.fb_blank = hvfb_blank,
-	.fb_mmap = fb_deferred_io_mmap,
 };
 
-
 /* Get options from kernel paramenter "video=" */
 static void hvfb_get_option(struct fb_info *info)
 {
-- 
2.41.0

