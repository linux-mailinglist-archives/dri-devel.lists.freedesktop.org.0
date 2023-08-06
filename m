Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A117714CD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3FD10E0C3;
	Sun,  6 Aug 2023 12:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC35C10E0B0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9E0B11F898;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpAFNVy5WNN1yht6et9dDx13v8ArFEslLtfT53kIf3o=;
 b=HbukGDQDlhs8/GmHeQuCbRsUgeR7KbksnBmY0sRwmJoQsvqGuL9QL1vXolgqMicCJI5reo
 G2WPlQB1i3hOCK0+u27x0jecsvg+AhRk6OxIEm9UFDxk8KVvU7UppgI3OTCmcgt269xE93
 iSqZO5k1/LBdh0MGPNPIcfCcWNlMoto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dpAFNVy5WNN1yht6et9dDx13v8ArFEslLtfT53kIf3o=;
 b=5FQapBC1foYHpay4YYoxZ+QWabt32oZT8jnoJ8be/GzwAwWLMNh4AE+1eiGL1arow/ri7/
 i6XSOJ3gH5z6T/Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 74BE1139D1;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YGSYG3qNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 09/11] fbdev/leo: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:59:00 +0200
Message-ID: <20230806120926.5368-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230806120926.5368-1-tzimmermann@suse.de>
References: <20230806120926.5368-1-tzimmermann@suse.de>
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
Cc: sparclinux@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize struct fb_ops to the correct default values with the
macro FB_DEFAULT_SBUS_OPS(). Rename the ioctl and mmap callbacks
to use the infix _sbusfb_. This makes them fit the SBUS helpers'
naming pattern. Also make the driver depend on FB_SBUS_HELPERS,
which selects the correct modules.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/Kconfig |  4 +---
 drivers/video/fbdev/leo.c   | 19 ++++++-------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index dfc601db65a4..3bade062ac3f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -587,9 +587,7 @@ config FB_P9100
 config FB_LEO
 	bool "Leo (ZX) support"
 	depends on FB_SBUS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the SBUS-based Sun ZX
 	  (leo) frame buffer cards.
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 2f725cd7633a..7cf525c76079 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -31,28 +31,21 @@
 static int leo_setcolreg(unsigned, unsigned, unsigned, unsigned,
 			 unsigned, struct fb_info *);
 static int leo_blank(int, struct fb_info *);
-
-static int leo_mmap(struct fb_info *, struct vm_area_struct *);
-static int leo_ioctl(struct fb_info *, unsigned int, unsigned long);
 static int leo_pan_display(struct fb_var_screeninfo *, struct fb_info *);
 
+static int leo_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int leo_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
+
 /*
  *  Frame buffer operations
  */
 
 static const struct fb_ops leo_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(leo),
 	.fb_setcolreg		= leo_setcolreg,
 	.fb_blank		= leo_blank,
 	.fb_pan_display		= leo_pan_display,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= leo_mmap,
-	.fb_ioctl		= leo_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 #define LEO_OFF_LC_SS0_KRN	0x00200000UL
@@ -414,7 +407,7 @@ static struct sbus_mmap_map leo_mmap_map[] = {
 	{ .size = 0 }
 };
 
-static int leo_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int leo_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct leo_par *par = (struct leo_par *)info->par;
 
@@ -423,7 +416,7 @@ static int leo_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  par->which_io, vma);
 }
 
-static int leo_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int leo_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	return sbusfb_ioctl_helper(cmd, arg, info,
 				   FBTYPE_SUNLEO, 32, info->fix.smem_len);
-- 
2.41.0

