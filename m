Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF687714DC
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FB210E0E7;
	Sun,  6 Aug 2023 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2710E089
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8B831F895;
 Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJzRpXUWDQIcsnTPKwRHUooJdIQvZGz3Ef/Mhgy7bWA=;
 b=xWsaY2m3bHuxFwFuPG50tVS9afrZG2ekSSORxb91K7S3aEpKVR0UUhnHIjoaaboV5AW66/
 xhIm25DYvWJcBKPzkWHbvVSwBz4bY3AxFxOVr+Ini9wSAUZjgoSujmB3+hNduotGAFYcL2
 b7fXa2mLJi2QVaRyijjlxK0mvYjMQLc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJzRpXUWDQIcsnTPKwRHUooJdIQvZGz3Ef/Mhgy7bWA=;
 b=luF+jO3fZsOsI1A2h6ZON45rWRpWP2e2crF2doLGcO+lpCZnw0uOM4hNUjgn/eXRWEuFq+
 HsoZXGBb3vdrObBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABB12139D1;
 Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iKcVKXmNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 05/11] fbdev/cg14: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:58:56 +0200
Message-ID: <20230806120926.5368-6-tzimmermann@suse.de>
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
 drivers/video/fbdev/cg14.c  | 19 ++++++-------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 7e4710defc32..02f163984679 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -571,9 +571,7 @@ config FB_TCX
 config FB_CG14
 	bool "CGfourteen (SX) support"
 	depends on FB_SBUS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the CGfourteen frame
 	  buffer on Desktop SPARCsystems with the SX graphics option.
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index c0336c051c24..c161b2af8933 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -31,27 +31,20 @@
 
 static int cg14_setcolreg(unsigned, unsigned, unsigned, unsigned,
 			 unsigned, struct fb_info *);
-
-static int cg14_mmap(struct fb_info *, struct vm_area_struct *);
-static int cg14_ioctl(struct fb_info *, unsigned int, unsigned long);
 static int cg14_pan_display(struct fb_var_screeninfo *, struct fb_info *);
 
+static int cg14_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int cg14_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
+
 /*
  *  Frame buffer operations
  */
 
 static const struct fb_ops cg14_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(cg14),
 	.fb_setcolreg		= cg14_setcolreg,
 	.fb_pan_display		= cg14_pan_display,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= cg14_mmap,
-	.fb_ioctl		= cg14_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 #define CG14_MCR_INTENABLE_SHIFT	7
@@ -265,7 +258,7 @@ static int cg14_setcolreg(unsigned regno,
 	return 0;
 }
 
-static int cg14_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int cg14_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct cg14_par *par = (struct cg14_par *) info->par;
 
@@ -274,7 +267,7 @@ static int cg14_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  par->iospace, vma);
 }
 
-static int cg14_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int cg14_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	struct cg14_par *par = (struct cg14_par *) info->par;
 	struct cg14_regs __iomem *regs = par->regs;
-- 
2.41.0

