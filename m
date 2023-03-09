Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FFD6B29DB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2E410E8B2;
	Thu,  9 Mar 2023 16:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED54910E86E
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:02:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AC3A72017C;
 Thu,  9 Mar 2023 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678377765; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6nOdyACdlp2+E7E8cMNwfz97h9DQ5BqN65CR4y0Dbo=;
 b=lQYJVy+mhC2ctbwQXeLl/39u2oV6GDl6doXRuE0K58xJgh4yJ8lYSd9Fvn0QdZaGXrgXhb
 BT9Q58D34KuI6piQCudvOYdu1LuRS53gBS+EAVNGc/IBIJ9UZUB63HXpeu3O/1ZVwnjawG
 JPrhXzKgUUApgMeEFSU7z+VMOgZ9c6g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678377765;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6nOdyACdlp2+E7E8cMNwfz97h9DQ5BqN65CR4y0Dbo=;
 b=Yo+F/nO3imM1VV8MOoD01kgpwd/AbpFgU6nrXqnWSDfc/cqr4DLUa8KuX01aJNtCmImYKi
 CGircmhCF23YFvDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39BD41391B;
 Thu,  9 Mar 2023 16:02:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SA/sDCUDCmQHbgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Mar 2023 16:02:45 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, geert+renesas@glider.be, timur@kernel.org,
 rdunlap@infradead.org, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, adaplas@gmail.com,
 s.hauer@pengutronix.de, shawnguo@kernel.org, mbroemme@libmpq.org,
 thomas@winischhofer.net, James.Bottomley@HansenPartnership.com,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, corbet@lwn.net
Subject: [PATCH v2 101/101] fbdev: Constify option strings
Date: Thu,  9 Mar 2023 17:02:01 +0100
Message-Id: <20230309160201.5163-102-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309160201.5163-1-tzimmermann@suse.de>
References: <20230309160201.5163-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return the option string as const char* from fb_get_options() to
enforce fbdev's ownership of the memory region. Also avoids memory
allocation within fb_get_options().

Callers that have to modify the option string must create their own
copy. As most drivers use struct option_iter, this already happens
transparently in many cases.

Adapt all callers of fb_get_options().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/sm750fb/sm750.c              |  2 +-
 drivers/video/fbdev/acornfb.c                |  2 +-
 drivers/video/fbdev/amifb.c                  |  2 +-
 drivers/video/fbdev/arkfb.c                  |  2 +-
 drivers/video/fbdev/atafb.c                  |  2 +-
 drivers/video/fbdev/aty/aty128fb.c           |  2 +-
 drivers/video/fbdev/aty/atyfb_base.c         |  2 +-
 drivers/video/fbdev/aty/radeon_base.c        |  2 +-
 drivers/video/fbdev/au1100fb.c               |  2 +-
 drivers/video/fbdev/au1200fb.c               |  2 +-
 drivers/video/fbdev/cirrusfb.c               |  2 +-
 drivers/video/fbdev/controlfb.c              |  2 +-
 drivers/video/fbdev/core/fb_cmdline.c        | 13 +++----------
 drivers/video/fbdev/core/modedb.c            |  8 ++------
 drivers/video/fbdev/cyber2000fb.c            |  2 +-
 drivers/video/fbdev/efifb.c                  |  2 +-
 drivers/video/fbdev/ep93xx-fb.c              |  2 +-
 drivers/video/fbdev/fm2fb.c                  |  2 +-
 drivers/video/fbdev/fsl-diu-fb.c             |  2 +-
 drivers/video/fbdev/gbefb.c                  |  2 +-
 drivers/video/fbdev/geode/gx1fb_core.c       |  2 +-
 drivers/video/fbdev/geode/gxfb_core.c        |  2 +-
 drivers/video/fbdev/geode/lxfb_core.c        |  2 +-
 drivers/video/fbdev/grvga.c                  |  3 ++-
 drivers/video/fbdev/gxt4500.c                |  2 +-
 drivers/video/fbdev/hyperv_fb.c              |  2 +-
 drivers/video/fbdev/i740fb.c                 |  2 +-
 drivers/video/fbdev/i810/i810_main.c         |  2 +-
 drivers/video/fbdev/imsttfb.c                |  2 +-
 drivers/video/fbdev/imxfb.c                  |  2 +-
 drivers/video/fbdev/intelfb/intelfbdrv.c     |  2 +-
 drivers/video/fbdev/kyro/fbdev.c             |  2 +-
 drivers/video/fbdev/macfb.c                  |  2 +-
 drivers/video/fbdev/matrox/matroxfb_base.c   |  2 +-
 drivers/video/fbdev/mx3fb.c                  |  2 +-
 drivers/video/fbdev/neofb.c                  |  2 +-
 drivers/video/fbdev/nvidia/nvidia.c          |  2 +-
 drivers/video/fbdev/ocfb.c                   |  2 +-
 drivers/video/fbdev/omap/omapfb_main.c       |  2 +-
 drivers/video/fbdev/platinumfb.c             |  2 +-
 drivers/video/fbdev/pm2fb.c                  |  2 +-
 drivers/video/fbdev/pm3fb.c                  |  2 +-
 drivers/video/fbdev/ps3fb.c                  |  2 +-
 drivers/video/fbdev/pvr2fb.c                 |  2 +-
 drivers/video/fbdev/pxafb.c                  |  2 +-
 drivers/video/fbdev/riva/fbdev.c             |  2 +-
 drivers/video/fbdev/s3fb.c                   |  2 +-
 drivers/video/fbdev/savage/savagefb_driver.c |  2 +-
 drivers/video/fbdev/sis/sis_main.c           |  2 +-
 drivers/video/fbdev/skeletonfb.c             |  2 +-
 drivers/video/fbdev/sm712fb.c                |  2 +-
 drivers/video/fbdev/sstfb.c                  |  2 +-
 drivers/video/fbdev/stifb.c                  |  2 +-
 drivers/video/fbdev/tdfxfb.c                 |  2 +-
 drivers/video/fbdev/tgafb.c                  |  2 +-
 drivers/video/fbdev/tridentfb.c              |  2 +-
 drivers/video/fbdev/uvesafb.c                |  2 +-
 drivers/video/fbdev/valkyriefb.c             |  2 +-
 drivers/video/fbdev/vesafb.c                 |  2 +-
 drivers/video/fbdev/vfb.c                    |  2 +-
 drivers/video/fbdev/via/viafbdev.c           |  2 +-
 drivers/video/fbdev/vt8623fb.c               |  3 +--
 include/linux/fb.h                           |  2 +-
 63 files changed, 67 insertions(+), 78 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 0e3712fcf0e0..3d7cde9add4e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1165,7 +1165,7 @@ static struct pci_driver lynxfb_driver = {
 
 static int __init lynxfb_init(void)
 {
-	char *option;
+	const char *option;
 
 	if (fb_modesetting_disabled("sm750fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index 3fed89e03554..27e6796b27b6 100644
--- a/drivers/video/fbdev/acornfb.c
+++ b/drivers/video/fbdev/acornfb.c
@@ -926,7 +926,7 @@ static int acornfb_probe(struct platform_device *dev)
 	unsigned long size;
 	u_int h_sync, v_sync;
 	int rc, i;
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("acornfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/amifb.c b/drivers/video/fbdev/amifb.c
index a09edc576437..f0ed718a4f3c 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3539,7 +3539,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 	u_int defmode;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("amifb", &option)) {
 		amifb_video_off();
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 98c710cadaab..7e9f5b37fd50 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1188,7 +1188,7 @@ static int __init arkfb_init(void)
 {
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("arkfb"))
diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 6e625ac020b5..2ede6ce0ec0e 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2991,7 +2991,7 @@ static int __init atafb_probe(struct platform_device *pdev)
 	int pad, detected_mode, error;
 	unsigned int defmode = 0;
 	unsigned long mem_req;
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("atafb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index ee2be122de2d..e7e1c7c0da92 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2509,7 +2509,7 @@ static int __maybe_unused aty128_pci_resume(struct device *dev)
 static int aty128fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("aty128fb"))
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index f4b22d2f0d3d..73a54738f58c 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3965,7 +3965,7 @@ static int __init atyfb_init(void)
 {
 	int err1 = 1, err2 = 1;
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("atyfb"))
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 975323e82f52..a44f9c423703 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2611,7 +2611,7 @@ static int __init radeonfb_setup (const char *options)
 static int __init radeonfb_init (void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("radeonfb"))
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 0c063c8e6312..4034aeb37d45 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -366,7 +366,7 @@ static const struct fb_ops au1100fb_ops =
 
 static int au1100fb_setup(struct au1100fb_device *fbdev)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	char *this_opt;
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 43b6a9dfeec4..9e84a1095d2f 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1578,7 +1578,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 
 static int au1200fb_setup(struct au1200fb_platdata *pd)
 {
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	char *this_opt;
 	char *endptr;
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index a5e99a8feadd..dc900f2fcd01 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2363,7 +2363,7 @@ static int __init cirrusfb_init(void)
 	int error = 0;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("cirrusfb"))
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 65e2f9949420..a02a5ea99a7a 100644
--- a/drivers/video/fbdev/controlfb.c
+++ b/drivers/video/fbdev/controlfb.c
@@ -1004,7 +1004,7 @@ static int __init control_of_init(struct device_node *dp)
 static int __init control_init(void)
 {
 	struct device_node *dp;
-	char *option = NULL;
+	const char *option = NULL;
 	int ret = -ENXIO;
 
 	if (fb_get_options("controlfb", &option))
diff --git a/drivers/video/fbdev/core/fb_cmdline.c b/drivers/video/fbdev/core/fb_cmdline.c
index 4d1634c492ec..67f9df7096f1 100644
--- a/drivers/video/fbdev/core/fb_cmdline.c
+++ b/drivers/video/fbdev/core/fb_cmdline.c
@@ -28,12 +28,9 @@
  *          (video=<name>:<options>)
  * @option: the option will be stored here
  *
- * The caller owns the string returned in @option and is
- * responsible for releasing the memory.
- *
  * NOTE: Needed to maintain backwards compatibility
  */
-int fb_get_options(const char *name, char **option)
+int fb_get_options(const char *name, const char **option)
 {
 	const char *options = NULL;
 	bool is_of = false;
@@ -49,12 +46,8 @@ int fb_get_options(const char *name, char **option)
 			enabled = false;
 	}
 
-	if (option) {
-		if (options)
-			*option = kstrdup(options, GFP_KERNEL);
-		else
-			*option = NULL;
-	}
+	if (option)
+		*option = options;
 
 	return enabled ? 0 : 1; // 0 on success, 1 otherwise
 }
diff --git a/drivers/video/fbdev/core/modedb.c b/drivers/video/fbdev/core/modedb.c
index 23cf8eba785d..5ff5a56925cc 100644
--- a/drivers/video/fbdev/core/modedb.c
+++ b/drivers/video/fbdev/core/modedb.c
@@ -620,7 +620,6 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 		 const struct fb_videomode *default_mode,
 		 unsigned int default_bpp)
 {
-	char *mode_option_buf = NULL;
 	int i;
 
 	/* Set up defaults */
@@ -636,10 +635,8 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 		default_bpp = 8;
 
 	/* Did the user specify a video mode? */
-	if (!mode_option) {
-		fb_get_options(NULL, &mode_option_buf);
-		mode_option = mode_option_buf;
-	}
+	if (!mode_option)
+		fb_get_options(NULL, &mode_option);
 	if (mode_option) {
 		const char *name = mode_option;
 		unsigned int namelen = strlen(name);
@@ -718,7 +715,6 @@ int fb_find_mode(struct fb_var_screeninfo *var,
 			res_specified = 1;
 		}
 done:
-		kfree(mode_option_buf);
 		if (cvt) {
 			struct fb_videomode cvt_mode;
 			int ret;
diff --git a/drivers/video/fbdev/cyber2000fb.c b/drivers/video/fbdev/cyber2000fb.c
index f21d11a73455..c6a46e870e98 100644
--- a/drivers/video/fbdev/cyber2000fb.c
+++ b/drivers/video/fbdev/cyber2000fb.c
@@ -1877,7 +1877,7 @@ static int __init cyber2000fb_init(void)
 	int ret = -1, err;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("CyberPro"))
diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index be77a76f7d1d..1fc1dee75552 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -366,7 +366,7 @@ static int efifb_probe(struct platform_device *dev)
 	unsigned int size_vmode;
 	unsigned int size_remap;
 	unsigned int size_total;
-	char *option = NULL;
+	const char *option = NULL;
 	efi_memory_desc_t md;
 
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI || pci_dev_disabled)
diff --git a/drivers/video/fbdev/ep93xx-fb.c b/drivers/video/fbdev/ep93xx-fb.c
index 305f1587bd89..33a9aa2ecc3b 100644
--- a/drivers/video/fbdev/ep93xx-fb.c
+++ b/drivers/video/fbdev/ep93xx-fb.c
@@ -464,7 +464,7 @@ static int ep93xxfb_probe(struct platform_device *pdev)
 	struct fb_info *info;
 	struct ep93xx_fbi *fbi;
 	struct resource *res;
-	char *video_mode;
+	const char *video_mode;
 	int err;
 
 	if (!mach_info)
diff --git a/drivers/video/fbdev/fm2fb.c b/drivers/video/fbdev/fm2fb.c
index a787884a6a7f..79607301e176 100644
--- a/drivers/video/fbdev/fm2fb.c
+++ b/drivers/video/fbdev/fm2fb.c
@@ -315,7 +315,7 @@ static int __init fm2fb_setup(const char *options)
 
 static int __init fm2fb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("fm2fb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/fsl-diu-fb.c b/drivers/video/fbdev/fsl-diu-fb.c
index 78996995568c..c0c13135a6e1 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1903,7 +1903,7 @@ static int __init fsl_diu_init(void)
 #endif
 	int ret;
 #ifndef MODULE
-	char *option;
+	const char *option;
 
 	/*
 	 * For kernel boot options (in 'video=xxxfb:<options>' format)
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index d20ef48263f3..a5e480964fa4 100644
--- a/drivers/video/fbdev/gbefb.c
+++ b/drivers/video/fbdev/gbefb.c
@@ -1125,7 +1125,7 @@ static int gbefb_probe(struct platform_device *p_dev)
 	struct fb_info *info;
 	struct gbefb_par *par;
 #ifndef MODULE
-	char *options = NULL;
+	const char *options = NULL;
 #endif
 
 	info = framebuffer_alloc(sizeof(struct gbefb_par), &p_dev->dev);
diff --git a/drivers/video/fbdev/geode/gx1fb_core.c b/drivers/video/fbdev/geode/gx1fb_core.c
index 6f1e9aadc192..c51e69b98ba8 100644
--- a/drivers/video/fbdev/geode/gx1fb_core.c
+++ b/drivers/video/fbdev/geode/gx1fb_core.c
@@ -445,7 +445,7 @@ static struct pci_driver gx1fb_driver = {
 static int __init gx1fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("gx1fb"))
diff --git a/drivers/video/fbdev/geode/gxfb_core.c b/drivers/video/fbdev/geode/gxfb_core.c
index aede22566775..6a1391f88599 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -512,7 +512,7 @@ static int __init gxfb_setup(const char *options)
 static int __init gxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("gxfb"))
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index 855dc96b5669..2496bf85b6f3 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -650,7 +650,7 @@ static int __init lxfb_setup(const char *options)
 static int __init lxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("lxfb"))
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index 742331d0f08b..e39997a36ccc 100644
--- a/drivers/video/fbdev/grvga.c
+++ b/drivers/video/fbdev/grvga.c
@@ -334,7 +334,8 @@ static int grvga_probe(struct platform_device *dev)
 	unsigned long physical_start = 0;
 	unsigned long grvga_mem_size = 0;
 	struct grvga_par *par = NULL;
-	char *options = NULL, *mode_opt = NULL;
+	const char *options = NULL;
+	const *mode_opt = NULL;
 	struct option_iter iter;
 	char *this_opt;
 
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 65cb44c281c1..21c0fbddcbdb 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -781,7 +781,7 @@ static struct pci_driver gxt4500_driver = {
 static int gxt4500_init(void)
 {
 #ifndef MODULE
-	char *options;
+	const char *options;
 #endif
 
 	if (fb_modesetting_disabled("gxt4500"))
diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index edb0555239c6..c7956626eed0 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -903,7 +903,7 @@ static const struct fb_ops hvfb_ops = {
 static void hvfb_get_option(struct fb_info *info)
 {
 	struct hvfb_par *par = info->par;
-	char *options = NULL;
+	const char *options = NULL;
 	char *optbuf, *opt, *p;
 	uint x = 0, y = 0;
 
diff --git a/drivers/video/fbdev/i740fb.c b/drivers/video/fbdev/i740fb.c
index 6da2f3b7846d..2c852f3ce450 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1289,7 +1289,7 @@ static int  __init i740fb_setup(const char *options)
 static int __init i740fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("i740fb"))
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 952d1a69dfb9..428bd5b53e98 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -2150,7 +2150,7 @@ static void i810fb_remove_pci(struct pci_dev *dev)
 #ifndef MODULE
 static int i810fb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_modesetting_disabled("i810fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index 1e2b45faa26b..98a9a5891822 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1620,7 +1620,7 @@ imsttfb_setup(const char *options)
 static int __init imsttfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("imsttfb"))
diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index d4e347aca0b0..ca67b32a29dd 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -846,7 +846,7 @@ static struct lcd_ops imxfb_lcd_ops = {
 
 static int imxfb_setup(struct platform_device *pdev)
 {
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	char *opt;
 
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 43d677897392..664a8625e25c 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -385,7 +385,7 @@ static int __init intelfb_setup(const char *options)
 static int __init intelfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	DBG_MSG("intelfb_init\n");
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index ccfec4e55ecf..903f0ac03bca 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -792,7 +792,7 @@ static void kyrofb_remove(struct pci_dev *pdev)
 static int __init kyrofb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("kyrofb"))
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index c7e17a14daf1..dbddf9e83b2f 100644
--- a/drivers/video/fbdev/macfb.c
+++ b/drivers/video/fbdev/macfb.c
@@ -541,7 +541,7 @@ static int __init macfb_init(void)
 {
 	int video_cmap_len, video_is_nubus = 0;
 	struct nubus_rsrc *ndev = NULL;
-	char *option = NULL;
+	const char *option = NULL;
 	int err;
 
 	if (fb_get_options("macfb", &option))
diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index 4c2086136e9b..c1d1076bc172 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -2475,7 +2475,7 @@ static int __initdata initialized = 0;
 
 static int __init matroxfb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 	int err = 0;
 
 	DBG(__func__)
diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index ca58afe366b4..04818f352eea 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1655,7 +1655,7 @@ static struct platform_driver mx3fb_driver = {
 static int __init mx3fb_setup(void)
 {
 #ifndef MODULE
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	char *opt;
 
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index 01ed78d987b1..21e8a72cda90 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -2213,7 +2213,7 @@ static int __init neofb_setup(const char *options)
 static int __init neofb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("neofb"))
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index d779163f919a..bd649539181f 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1532,7 +1532,7 @@ static struct pci_driver nvidiafb_driver = {
 static int nvidiafb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("nvidiafb"))
diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index fa15b932b323..07b7d5e61895 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -412,7 +412,7 @@ static struct platform_driver ocfb_driver = {
 static int __init ocfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("ocfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index db5256c71f5b..8715eaf8ddf6 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1905,7 +1905,7 @@ static int __init omapfb_setup(const char *options)
 static int __init omapfb_init(void)
 {
 #ifndef MODULE
-	char *option;
+	const char *option;
 
 	if (fb_get_options("omapfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/platinumfb.c b/drivers/video/fbdev/platinumfb.c
index 33bf75309815..ab75df9d0bb6 100644
--- a/drivers/video/fbdev/platinumfb.c
+++ b/drivers/video/fbdev/platinumfb.c
@@ -683,7 +683,7 @@ static struct platform_driver platinum_driver =
 static int __init platinumfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("platinumfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/pm2fb.c b/drivers/video/fbdev/pm2fb.c
index 38c5c57ce2b0..d87ceaaf529d 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1809,7 +1809,7 @@ static int __init pm2fb_setup(const char *options)
 static int __init pm2fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pm2fb"))
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index c4d4f08b4114..500a8c1130c6 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -1545,7 +1545,7 @@ static int __init pm3fb_init(void)
 	 *  For kernel boot options (in 'video=pm3fb:<options>' format)
 	 */
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pm3fb"))
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 575b2911977a..62236bbb02b5 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -1257,7 +1257,7 @@ static struct ps3_system_bus_driver ps3fb_driver = {
 
 static int __init ps3fb_setup(void)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	char *this_opt;
 
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index c332f2c38114..acc81fb11da1 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1085,7 +1085,7 @@ static int __init pvr2fb_init(void)
 	int i, ret = -ENODEV;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pvr2fb"))
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index d2db9c20d515..0699710b0beb 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2040,7 +2040,7 @@ static char g_options[256] = "";
 #ifndef MODULE
 static int __init pxafb_setup_options(void)
 {
-	char *options = NULL;
+	const char *options = NULL;
 
 	if (fb_get_options("pxafb", &options))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/riva/fbdev.c b/drivers/video/fbdev/riva/fbdev.c
index 7f35edad249e..934c6e30109b 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2167,7 +2167,7 @@ static struct pci_driver rivafb_driver = {
 static int rivafb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("rivafb"))
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index 37f5ea25efd6..824325eb9fbe 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1562,7 +1562,7 @@ static int __init s3fb_init(void)
 {
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("s3fb"))
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 4650688fd23c..a6e573b2d996 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2560,7 +2560,7 @@ static int __init savagefb_setup(const char *options)
 
 static int __init savagefb_init(void)
 {
-	char *option;
+	const char *option;
 
 	DBG("savagefb_init");
 
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 9f63812a5f66..d8109dd20bc6 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -6587,7 +6587,7 @@ static struct pci_driver sisfb_driver = {
 static int __init sisfb_init(void)
 {
 #ifndef MODULE
-	char *options = NULL;
+	const char *options = NULL;
 #endif
 
 	if (fb_modesetting_disabled("sisfb"))
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index ee6944d0ebc1..f6efad18e4d7 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -899,7 +899,7 @@ static int __init xxxfb_init(void)
 	 *  For kernel boot options (in 'video=xxxfb:<options>' format)
 	 */
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("xxxfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/sm712fb.c b/drivers/video/fbdev/sm712fb.c
index a83f48fce5b1..c6232bc688ea 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1755,7 +1755,7 @@ static struct pci_driver smtcfb_driver = {
 
 static int __init sm712fb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_modesetting_disabled("sm712fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index b509020fed74..7a0a612a7658 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1507,7 +1507,7 @@ static struct pci_driver sstfb_driver = {
 
 static int sstfb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_modesetting_disabled("sstfb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 304ce8fcb9f8..c1f28bb046d3 100644
--- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1401,7 +1401,7 @@ static int __init stifb_init(void)
 	int i;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("stifb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/tdfxfb.c b/drivers/video/fbdev/tdfxfb.c
index 1fdaf328f03e..3158644454d7 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1635,7 +1635,7 @@ static void tdfxfb_remove(struct pci_dev *pdev)
 static int __init tdfxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tdfxfb"))
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 0862d9a54aef..ad88fc0cd01e 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -1600,7 +1600,7 @@ static int tgafb_init(void)
 {
 	int status;
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tgafb"))
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 3299806c0f58..2a70b48e6d15 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1818,7 +1818,7 @@ static int __init tridentfb_setup(const char *options)
 static int __init tridentfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tridentfb"))
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 13bd8503a06b..98e074d3e61b 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1886,7 +1886,7 @@ static int uvesafb_init(void)
 	int err;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("uvesafb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index 3c20f392370a..daf218632d53 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -304,7 +304,7 @@ static int __init valkyriefb_init(void)
 	struct fb_info_valkyrie	*p;
 	unsigned long frame_buffer_phys, cmap_regs_phys;
 	int err;
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("valkyriefb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
index 7299cebb6962..5d909d88a251 100644
--- a/drivers/video/fbdev/vesafb.c
+++ b/drivers/video/fbdev/vesafb.c
@@ -253,7 +253,7 @@ static int vesafb_probe(struct platform_device *dev)
 	unsigned int size_vmode;
 	unsigned int size_remap;
 	unsigned int size_total;
-	char *option = NULL;
+	const char *option = NULL;
 
 	/* ignore error return of fb_get_options */
 	fb_get_options("vesafb", &option);
diff --git a/drivers/video/fbdev/vfb.c b/drivers/video/fbdev/vfb.c
index 7694e5026155..b68c0dd747cf 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -513,7 +513,7 @@ static int __init vfb_init(void)
 	int ret = 0;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("vfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 749aee9f6c56..40a4739ff060 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -1923,7 +1923,7 @@ void via_fb_pci_remove(struct pci_dev *pdev)
 #ifndef MODULE
 static int __init viafb_setup(void)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	char *this_opt;
 
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index 321b1813cf3c..9bd908dace15 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -919,9 +919,8 @@ static void __exit vt8623fb_cleanup(void)
 
 static int __init vt8623fb_init(void)
 {
-
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("vt8623fb"))
diff --git a/include/linux/fb.h b/include/linux/fb.h
index d96529caa35e..0bebdd03f287 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -601,7 +601,7 @@ extern void fb_pad_aligned_buffer(u8 *dst, u32 d_pitch, u8 *src, u32 s_pitch, u3
 extern void fb_set_suspend(struct fb_info *info, int state);
 extern int fb_get_color_depth(struct fb_var_screeninfo *var,
 			      struct fb_fix_screeninfo *fix);
-extern int fb_get_options(const char *name, char **option);
+extern int fb_get_options(const char *name, const char **option);
 extern int fb_new_modelist(struct fb_info *info);
 
 extern bool fb_center_logo;
-- 
2.39.2

