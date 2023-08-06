Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D027714D8
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECC410E0C1;
	Sun,  6 Aug 2023 12:09:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD0810E0B0
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 13D5E1F896;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr+QdjgHcd4EcS2dE98hcFvMz+wFrYllF8iB8ASxmIk=;
 b=XF6V9+nJMkpGryatMigGYjnCM+hC2s1sK2SoS1NSESl7zyuwzC0YURoyh/wsPvdpXpl9Nw
 d/Q46ktpMinD07iEyJ/Aqcq14jESlmc1dwZ0b7QMkCFEdJ7pi0yzkU++Whdu1y6LYVOkXD
 m13Wy8Eo7ouEe8xNLralWFYgfSiXvs4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr+QdjgHcd4EcS2dE98hcFvMz+wFrYllF8iB8ASxmIk=;
 b=zgqt0eR9vMRM9imFTZjZcx+E5gCCcetBXzgVjLJa4YLfN2syrwiMbokWRYDfJ/oR793ce3
 z1mnzvG0hURoLLAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD52D139C4;
 Sun,  6 Aug 2023 12:09:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WBAmNXmNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 06/11] fbdev/cg3: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:58:57 +0200
Message-ID: <20230806120926.5368-7-tzimmermann@suse.de>
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
 drivers/video/fbdev/cg3.c   | 17 +++++------------
 2 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 02f163984679..dfc601db65a4 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -534,9 +534,7 @@ config FB_BW2
 config FB_CG3
 	bool "CGthree support"
 	depends on (FB = y) && (SPARC && FB_SBUS)
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the CGthree frame buffer.
 
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 0a897d5be334..5e1f1b9a81b6 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -33,8 +33,8 @@ static int cg3_setcolreg(unsigned, unsigned, unsigned, unsigned,
 			 unsigned, struct fb_info *);
 static int cg3_blank(int, struct fb_info *);
 
-static int cg3_mmap(struct fb_info *, struct vm_area_struct *);
-static int cg3_ioctl(struct fb_info *, unsigned int, unsigned long);
+static int cg3_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int cg3_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
 
 /*
  *  Frame buffer operations
@@ -42,16 +42,9 @@ static int cg3_ioctl(struct fb_info *, unsigned int, unsigned long);
 
 static const struct fb_ops cg3_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(cg3),
 	.fb_setcolreg		= cg3_setcolreg,
 	.fb_blank		= cg3_blank,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= cg3_mmap,
-	.fb_ioctl		= cg3_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 
@@ -225,7 +218,7 @@ static struct sbus_mmap_map cg3_mmap_map[] = {
 	{ .size = 0 }
 };
 
-static int cg3_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int cg3_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct cg3_par *par = (struct cg3_par *)info->par;
 
@@ -235,7 +228,7 @@ static int cg3_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  vma);
 }
 
-static int cg3_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int cg3_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	return sbusfb_ioctl_helper(cmd, arg, info,
 				   FBTYPE_SUN3COLOR, 8, info->fix.smem_len);
-- 
2.41.0

