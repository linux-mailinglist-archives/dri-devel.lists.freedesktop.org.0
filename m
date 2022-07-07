Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0404056A71A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 17:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9919510FD1F;
	Thu,  7 Jul 2022 15:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCA210FD1F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 15:40:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C59852216C;
 Thu,  7 Jul 2022 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657208398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uZh/mb0lXvuuZKPB/mOmCHtRcAzVf536X0Ud6AFPQ=;
 b=e7n7I9vH7kEhMJUdF0RGtIU8fIgjbVRsaSIn5Jkuaq06Wk0B+ALgKS/M18qWXqAgtjShM+
 41iixvwVdJiMUe+BJqGeLrTqxKC8hWWqsOYq2NYCSqpSle13ibpMPo1u0afJ+SJKkcoWbK
 4KzzYSk+xiMFBYiUL2DIffHcx608Bk0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657208398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=J8uZh/mb0lXvuuZKPB/mOmCHtRcAzVf536X0Ud6AFPQ=;
 b=y5DUq/My++X0Oi4JAC/PW3eTIykpm0Z9CqfTRXUiLNGrkEvkvnY+1SW8HtoJpWBsHTyoum
 9pYFBfOQZLgK3/AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8924E13B4E;
 Thu,  7 Jul 2022 15:39:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eAaJIE7+xmI9UQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Jul 2022 15:39:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, deller@gmx.de, daniel@ffwll.ch, sam@ravnborg.org,
 maxime@cerno.tech
Subject: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
Date: Thu,  7 Jul 2022 17:39:43 +0200
Message-Id: <20220707153952.32264-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707153952.32264-1-tzimmermann@suse.de>
References: <20220707153952.32264-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move the device-creation from vga16fb to sysfb code. Move the few
extra videomode checks into vga16fb's probe function.

The vga16fb driver requires a screen_info for type VIDEO_TYPE_VGAC
or VIDEO_TYPE_EGAC. Such code is nowhere present in the kernel, except
for some MIPS systems. It's not clear if the vga16fb driver actually
works in practice.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/firmware/sysfb.c      |  4 +++
 drivers/video/fbdev/vga16fb.c | 59 +++++++++++++++++------------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 1f276f108cc9..3fd3563d962b 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -94,6 +94,10 @@ static __init int sysfb_init(void)
 		name = "efi-framebuffer";
 	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
 		name = "vesa-framebuffer";
+	else if (si->orig_video_isVGA == VIDEO_TYPE_VGAC)
+		name = "vga-framebuffer";
+	else if (si->orig_video_isVGA == VIDEO_TYPE_EGAC)
+		name = "ega-framebuffer";
 	else
 		name = "platform-framebuffer";
 
diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
index faf76972114d..f7c1bb018843 100644
--- a/drivers/video/fbdev/vga16fb.c
+++ b/drivers/video/fbdev/vga16fb.c
@@ -185,19 +185,19 @@ static inline void setindex(int index)
 }
 
 /* Check if the video mode is supported by the driver */
-static inline int check_mode_supported(void)
+static inline int check_mode_supported(const struct screen_info *si)
 {
 	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
 #if defined(CONFIG_X86)
 	/* only EGA and VGA in 16 color graphic mode are supported */
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EGAC &&
-	    screen_info.orig_video_isVGA != VIDEO_TYPE_VGAC)
+	if (si->orig_video_isVGA != VIDEO_TYPE_EGAC &&
+	    si->orig_video_isVGA != VIDEO_TYPE_VGAC)
 		return -ENODEV;
 
-	if (screen_info.orig_video_mode != 0x0D &&	/* 320x200/4 (EGA) */
-	    screen_info.orig_video_mode != 0x0E &&	/* 640x200/4 (EGA) */
-	    screen_info.orig_video_mode != 0x10 &&	/* 640x350/4 (EGA) */
-	    screen_info.orig_video_mode != 0x12)	/* 640x480/4 (VGA) */
+	if (si->orig_video_mode != 0x0D &&	/* 320x200/4 (EGA) */
+	    si->orig_video_mode != 0x0E &&	/* 640x200/4 (EGA) */
+	    si->orig_video_mode != 0x10 &&	/* 640x350/4 (EGA) */
+	    si->orig_video_mode != 0x12)	/* 640x480/4 (VGA) */
 		return -ENODEV;
 #endif
 	return 0;
@@ -1321,11 +1321,20 @@ static int __init vga16fb_setup(char *options)
 
 static int vga16fb_probe(struct platform_device *dev)
 {
+	struct screen_info *si;
 	struct fb_info *info;
 	struct vga16fb_par *par;
 	int i;
 	int ret = 0;
 
+	si = dev_get_platdata(&dev->dev);
+	if (!si)
+		return -ENODEV;
+
+	ret = check_mode_supported(si);
+	if (ret)
+		return ret;
+
 	printk(KERN_DEBUG "vga16fb: initializing\n");
 	info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
 
@@ -1352,10 +1361,10 @@ static int vga16fb_probe(struct platform_device *dev)
 	par = info->par;
 
 #if defined(CONFIG_X86)
-	par->isVGA = screen_info.orig_video_isVGA == VIDEO_TYPE_VGAC;
+	par->isVGA = si->orig_video_isVGA == VIDEO_TYPE_VGAC;
 #else
 	/* non-x86 architectures treat orig_video_isVGA as a boolean flag */
-	par->isVGA = screen_info.orig_video_isVGA;
+	par->isVGA = si->orig_video_isVGA;
 #endif
 	par->palette_blanked = 0;
 	par->vesa_blanked = 0;
@@ -1425,16 +1434,21 @@ static int vga16fb_remove(struct platform_device *dev)
 	return 0;
 }
 
+static const struct platform_device_id vga16fb_driver_id_table[] = {
+	{"ega-framebuffer", 0},
+	{"vga-framebuffer", 0},
+	{ }
+};
+
 static struct platform_driver vga16fb_driver = {
 	.probe = vga16fb_probe,
 	.remove = vga16fb_remove,
 	.driver = {
-		.name = "vga16fb",
+		.name = "vga-framebuffer",
 	},
+	.id_table = vga16fb_driver_id_table,
 };
 
-static struct platform_device *vga16fb_device;
-
 static int __init vga16fb_init(void)
 {
 	int ret;
@@ -1447,32 +1461,15 @@ static int __init vga16fb_init(void)
 	vga16fb_setup(option);
 #endif
 
-	ret = check_mode_supported();
+	ret = platform_driver_register(&vga16fb_driver);
 	if (ret)
 		return ret;
 
-	ret = platform_driver_register(&vga16fb_driver);
-
-	if (!ret) {
-		vga16fb_device = platform_device_alloc("vga16fb", 0);
-
-		if (vga16fb_device)
-			ret = platform_device_add(vga16fb_device);
-		else
-			ret = -ENOMEM;
-
-		if (ret) {
-			platform_device_put(vga16fb_device);
-			platform_driver_unregister(&vga16fb_driver);
-		}
-	}
-
-	return ret;
+	return 0;
 }
 
 static void __exit vga16fb_exit(void)
 {
-	platform_device_unregister(vga16fb_device);
 	platform_driver_unregister(&vga16fb_driver);
 }
 
-- 
2.36.1

