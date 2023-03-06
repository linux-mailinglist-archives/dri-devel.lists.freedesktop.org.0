Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B166AC70C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 17:03:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 177D310E3E7;
	Mon,  6 Mar 2023 16:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4433E10E39F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 16:01:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3FE01FF16;
 Mon,  6 Mar 2023 16:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678118463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXai0tXnhsrWHlNkhv/7Ht5WujOnGX+SqDiXb2FAn/g=;
 b=oqzz+Zx4USaXLXCHHTejLyrlL6HmGFK4Sm8oby6z3kHEMNHVdXaSV1kOtvzXSbDmzIAKy1
 T9R0F0u+zFeO+grBSvPEp2RNVvwPOmfP8o7p5WZQDHXcaneZyzH/8XB4rEQ8mxrJDHTiWV
 xC5QJGVHovj4oX1eP4DAP0KQT5A6918=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678118463;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nXai0tXnhsrWHlNkhv/7Ht5WujOnGX+SqDiXb2FAn/g=;
 b=wu4mwcx+Ec2lfTeN+k0515s86k79yTS93XEJ4AX+k9kb1KwmhYscJNdqfHX7d3gBTAU1bj
 tfph8stTq8raF3Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8C11813513;
 Mon,  6 Mar 2023 16:01:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2L1NIT4OBmQ/PwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 06 Mar 2023 16:01:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, paulus@samba.org, benh@kernel.crashing.org,
 linux@armlinux.org.uk, pjones@redhat.com, timur@kernel.org,
 adaplas@gmail.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
 mbroemme@libmpq.org, thomas@winischhofer.net,
 James.Bottomley@HansenPartnership.com, spock@gentoo.org,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 geert+renesas@glider.be, corbet@lwn.net
Subject: [PATCH 99/99] fbdev: Constify option strings
Date: Mon,  6 Mar 2023 17:00:16 +0100
Message-Id: <20230306160016.4459-100-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306160016.4459-1-tzimmermann@suse.de>
References: <20230306160016.4459-1-tzimmermann@suse.de>
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
index 2eb223f0631e..fe5c18e00ac8 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -1167,7 +1167,7 @@ static struct pci_driver lynxfb_driver = {
 
 static int __init lynxfb_init(void)
 {
-	char *option;
+	const char *option;
 
 	if (fb_modesetting_disabled("sm750fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/acornfb.c b/drivers/video/fbdev/acornfb.c
index 1d6dec45615c..be4aafb23a5c 100644
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
index b968cf2c5f06..ef8518fd4fdc 100644
--- a/drivers/video/fbdev/amifb.c
+++ b/drivers/video/fbdev/amifb.c
@@ -3546,7 +3546,7 @@ static int __init amifb_probe(struct platform_device *pdev)
 	u_int defmode;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("amifb", &option)) {
 		amifb_video_off();
diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index f83fcdaec7a0..5c39b872e52d 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1186,7 +1186,7 @@ static int __init arkfb_init(void)
 {
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("arkfb"))
diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 82d5567f2ffb..a77794ad18a7 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2999,7 +2999,7 @@ static int __init atafb_probe(struct platform_device *pdev)
 	int pad, detected_mode, error;
 	unsigned int defmode = 0;
 	unsigned long mem_req;
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("atafb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/aty/aty128fb.c b/drivers/video/fbdev/aty/aty128fb.c
index 4a200eabe80b..40b42dcd00bb 100644
--- a/drivers/video/fbdev/aty/aty128fb.c
+++ b/drivers/video/fbdev/aty/aty128fb.c
@@ -2514,7 +2514,7 @@ static int __maybe_unused aty128_pci_resume(struct device *dev)
 static int aty128fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("aty128fb"))
diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index 1920ee5c9a2a..fe3742cf4eb8 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3970,7 +3970,7 @@ static int __init atyfb_init(void)
 {
 	int err1 = 1, err2 = 1;
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("atyfb"))
diff --git a/drivers/video/fbdev/aty/radeon_base.c b/drivers/video/fbdev/aty/radeon_base.c
index 185cd98ad59d..1d19a4b664ab 100644
--- a/drivers/video/fbdev/aty/radeon_base.c
+++ b/drivers/video/fbdev/aty/radeon_base.c
@@ -2616,7 +2616,7 @@ static int __init radeonfb_setup (const char *options)
 static int __init radeonfb_init (void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("radeonfb"))
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 17dae92ac53f..6976b201a3aa 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -366,7 +366,7 @@ static const struct fb_ops au1100fb_ops =
 
 static int au1100fb_setup(struct au1100fb_device *fbdev)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	const char *this_opt;
 	int num_panels = ARRAY_SIZE(known_lcd_panels);
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 31a3f6afd8aa..c39bf715abad 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1578,7 +1578,7 @@ static int au1200fb_init_fbinfo(struct au1200fb_device *fbdev)
 
 static int au1200fb_setup(struct au1200fb_platdata *pd)
 {
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	const char *this_opt;
 	char *endptr;
diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index c6882bff3862..28526af217c2 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2369,7 +2369,7 @@ static int __init cirrusfb_init(void)
 	int error = 0;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("cirrusfb"))
diff --git a/drivers/video/fbdev/controlfb.c b/drivers/video/fbdev/controlfb.c
index 3633e874ab2e..dc1d1c7ebeee 100644
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
index 939dde664b53..4c147d1500bc 100644
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
index 1ae7574aaa82..669b259b78ab 100644
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
index 4f17bc8e6c1d..a466e8ddfe8a 100644
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
index c97a9c04e8e8..8341332b52a8 100644
--- a/drivers/video/fbdev/fsl-diu-fb.c
+++ b/drivers/video/fbdev/fsl-diu-fb.c
@@ -1908,7 +1908,7 @@ static int __init fsl_diu_init(void)
 #endif
 	int ret;
 #ifndef MODULE
-	char *option;
+	const char *option;
 
 	/*
 	 * For kernel boot options (in 'video=xxxfb:<options>' format)
diff --git a/drivers/video/fbdev/gbefb.c b/drivers/video/fbdev/gbefb.c
index 36651bb6006d..d7fd55405169 100644
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
index dd1dc7ee7f83..174c0dd8f389 100644
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
index f5e88e92ba16..3d70e13e1f7a 100644
--- a/drivers/video/fbdev/geode/gxfb_core.c
+++ b/drivers/video/fbdev/geode/gxfb_core.c
@@ -517,7 +517,7 @@ static int __init gxfb_setup(const char *options)
 static int __init gxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("gxfb"))
diff --git a/drivers/video/fbdev/geode/lxfb_core.c b/drivers/video/fbdev/geode/lxfb_core.c
index d687054cdb09..2d529ad6a391 100644
--- a/drivers/video/fbdev/geode/lxfb_core.c
+++ b/drivers/video/fbdev/geode/lxfb_core.c
@@ -653,7 +653,7 @@ static int __init lxfb_setup(const char *options)
 static int __init lxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("lxfb"))
diff --git a/drivers/video/fbdev/grvga.c b/drivers/video/fbdev/grvga.c
index f803dc37c891..727a8f793877 100644
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
 	const char *this_opt;
 
diff --git a/drivers/video/fbdev/gxt4500.c b/drivers/video/fbdev/gxt4500.c
index 61bc714693f5..d9c0aea36719 100644
--- a/drivers/video/fbdev/gxt4500.c
+++ b/drivers/video/fbdev/gxt4500.c
@@ -780,7 +780,7 @@ static struct pci_driver gxt4500_driver = {
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
index cf45d6280f38..89455ce69c41 100644
--- a/drivers/video/fbdev/i740fb.c
+++ b/drivers/video/fbdev/i740fb.c
@@ -1294,7 +1294,7 @@ static int  __init i740fb_setup(const char *options)
 static int __init i740fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("i740fb"))
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 3e624522fe7a..77d784261c6a 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -2155,7 +2155,7 @@ static void i810fb_remove_pci(struct pci_dev *dev)
 #ifndef MODULE
 static int i810fb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_modesetting_disabled("i810fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index fc046886599c..3edb7b752553 100644
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
index 950df484e5be..b62767553b29 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -846,7 +846,7 @@ static struct lcd_ops imxfb_lcd_ops = {
 
 static int imxfb_setup(void)
 {
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	const char *opt;
 
diff --git a/drivers/video/fbdev/intelfb/intelfbdrv.c b/drivers/video/fbdev/intelfb/intelfbdrv.c
index 2d4e03b9e7fd..bff36914b62f 100644
--- a/drivers/video/fbdev/intelfb/intelfbdrv.c
+++ b/drivers/video/fbdev/intelfb/intelfbdrv.c
@@ -390,7 +390,7 @@ static int __init intelfb_setup(const char *options)
 static int __init intelfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	DBG_MSG("intelfb_init\n");
diff --git a/drivers/video/fbdev/kyro/fbdev.c b/drivers/video/fbdev/kyro/fbdev.c
index c2c6e1bba3a0..eb15b26bdffc 100644
--- a/drivers/video/fbdev/kyro/fbdev.c
+++ b/drivers/video/fbdev/kyro/fbdev.c
@@ -797,7 +797,7 @@ static void kyrofb_remove(struct pci_dev *pdev)
 static int __init kyrofb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("kyrofb"))
diff --git a/drivers/video/fbdev/macfb.c b/drivers/video/fbdev/macfb.c
index a72edb98b170..c05e790f223b 100644
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
index f690ee0c9b1f..20d42ddc021f 100644
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
index cb9f5ac69e79..9c561b3bb508 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -1654,7 +1654,7 @@ static struct platform_driver mx3fb_driver = {
 static int __init mx3fb_setup(void)
 {
 #ifndef MODULE
-	char *options = NULL;
+	const char *options = NULL;
 	struct option_iter iter;
 	const char *opt;
 
diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index e9b132d660ab..55b47961c03e 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -2218,7 +2218,7 @@ static int __init neofb_setup(const char *options)
 static int __init neofb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("neofb"))
diff --git a/drivers/video/fbdev/nvidia/nvidia.c b/drivers/video/fbdev/nvidia/nvidia.c
index 58b1b13f09dd..9986e9f61458 100644
--- a/drivers/video/fbdev/nvidia/nvidia.c
+++ b/drivers/video/fbdev/nvidia/nvidia.c
@@ -1537,7 +1537,7 @@ static struct pci_driver nvidiafb_driver = {
 static int nvidiafb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("nvidiafb"))
diff --git a/drivers/video/fbdev/ocfb.c b/drivers/video/fbdev/ocfb.c
index 546230483f53..26222e0c46ca 100644
--- a/drivers/video/fbdev/ocfb.c
+++ b/drivers/video/fbdev/ocfb.c
@@ -417,7 +417,7 @@ static struct platform_driver ocfb_driver = {
 static int __init ocfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("ocfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index 464a667708db..b490fe342200 100644
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
index 71d5b7c169e7..5840c6e385a5 100644
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
index a6a793efb0fe..8e9b9c7b4787 100644
--- a/drivers/video/fbdev/pm2fb.c
+++ b/drivers/video/fbdev/pm2fb.c
@@ -1814,7 +1814,7 @@ static int __init pm2fb_setup(const char *options)
 static int __init pm2fb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pm2fb"))
diff --git a/drivers/video/fbdev/pm3fb.c b/drivers/video/fbdev/pm3fb.c
index 4eec0ad1e984..598200143a0d 100644
--- a/drivers/video/fbdev/pm3fb.c
+++ b/drivers/video/fbdev/pm3fb.c
@@ -1550,7 +1550,7 @@ static int __init pm3fb_init(void)
 	 *  For kernel boot options (in 'video=pm3fb:<options>' format)
 	 */
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pm3fb"))
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index d7c287089c64..2b54460c5bfe 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -1256,7 +1256,7 @@ static struct ps3_system_bus_driver ps3fb_driver = {
 
 static int __init ps3fb_setup(void)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	const char *this_opt;
 
diff --git a/drivers/video/fbdev/pvr2fb.c b/drivers/video/fbdev/pvr2fb.c
index 9255b3506b81..7a62e5048703 100644
--- a/drivers/video/fbdev/pvr2fb.c
+++ b/drivers/video/fbdev/pvr2fb.c
@@ -1090,7 +1090,7 @@ static int __init pvr2fb_init(void)
 	int i, ret = -ENODEV;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("pvr2fb"))
diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 1937a58e47a1..b856e268f3b2 100644
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
index d95319bb93cc..0cbff9c43ca4 100644
--- a/drivers/video/fbdev/riva/fbdev.c
+++ b/drivers/video/fbdev/riva/fbdev.c
@@ -2172,7 +2172,7 @@ static struct pci_driver rivafb_driver = {
 static int rivafb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("rivafb"))
diff --git a/drivers/video/fbdev/s3fb.c b/drivers/video/fbdev/s3fb.c
index f3bd7b1c2c9a..7745801b4ff4 100644
--- a/drivers/video/fbdev/s3fb.c
+++ b/drivers/video/fbdev/s3fb.c
@@ -1566,7 +1566,7 @@ static int __init s3fb_init(void)
 {
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("s3fb"))
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 94026848d67d..e08ae210ad5c 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2564,7 +2564,7 @@ static int __init savagefb_setup(const char *options)
 
 static int __init savagefb_init(void)
 {
-	char *option;
+	const char *option;
 
 	DBG("savagefb_init");
 
diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 7e6e2251e62f..3ab07e6795cf 100644
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
index 1e876ad2a261..0d24620836bf 100644
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
index b0f3898125f4..19ebbf2b019d 100644
--- a/drivers/video/fbdev/sm712fb.c
+++ b/drivers/video/fbdev/sm712fb.c
@@ -1754,7 +1754,7 @@ static struct pci_driver smtcfb_driver = {
 
 static int __init sm712fb_init(void)
 {
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_modesetting_disabled("sm712fb"))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/sstfb.c b/drivers/video/fbdev/sstfb.c
index 6c3769062d50..d20dbd881133 100644
--- a/drivers/video/fbdev/sstfb.c
+++ b/drivers/video/fbdev/sstfb.c
@@ -1512,7 +1512,7 @@ static struct pci_driver sstfb_driver = {
 
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
index 54b19ce40bff..96f8a511a24f 100644
--- a/drivers/video/fbdev/tdfxfb.c
+++ b/drivers/video/fbdev/tdfxfb.c
@@ -1640,7 +1640,7 @@ static void tdfxfb_remove(struct pci_dev *pdev)
 static int __init tdfxfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tdfxfb"))
diff --git a/drivers/video/fbdev/tgafb.c b/drivers/video/fbdev/tgafb.c
index 704909edf89d..cf7e08c1523e 100644
--- a/drivers/video/fbdev/tgafb.c
+++ b/drivers/video/fbdev/tgafb.c
@@ -1605,7 +1605,7 @@ static int tgafb_init(void)
 {
 	int status;
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tgafb"))
diff --git a/drivers/video/fbdev/tridentfb.c b/drivers/video/fbdev/tridentfb.c
index 0b8d4bc514e2..07ac9232a6ae 100644
--- a/drivers/video/fbdev/tridentfb.c
+++ b/drivers/video/fbdev/tridentfb.c
@@ -1823,7 +1823,7 @@ static int __init tridentfb_setup(const char *options)
 static int __init tridentfb_init(void)
 {
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 #endif
 
 	if (fb_modesetting_disabled("tridentfb"))
diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index aada6a44380c..a9ac1f111f37 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1891,7 +1891,7 @@ static int uvesafb_init(void)
 	int err;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("uvesafb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index a787b0142d00..8756f0690b09 100644
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
index 0310a3db2b10..6bba8759b9c4 100644
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
index ef22a6815e70..ddab307c4073 100644
--- a/drivers/video/fbdev/vfb.c
+++ b/drivers/video/fbdev/vfb.c
@@ -518,7 +518,7 @@ static int __init vfb_init(void)
 	int ret = 0;
 
 #ifndef MODULE
-	char *option = NULL;
+	const char *option = NULL;
 
 	if (fb_get_options("vfb", &option))
 		return -ENODEV;
diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 4f39319e21f8..3704dbfa21df 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -1923,7 +1923,7 @@ void via_fb_pci_remove(struct pci_dev *pdev)
 #ifndef MODULE
 static int __init viafb_setup(void)
 {
-	char *options;
+	const char *options;
 	struct option_iter iter;
 	const char *this_opt;
 
diff --git a/drivers/video/fbdev/vt8623fb.c b/drivers/video/fbdev/vt8623fb.c
index cbdca42d1708..b68dc71e9791 100644
--- a/drivers/video/fbdev/vt8623fb.c
+++ b/drivers/video/fbdev/vt8623fb.c
@@ -917,9 +917,8 @@ static void __exit vt8623fb_cleanup(void)
 
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

