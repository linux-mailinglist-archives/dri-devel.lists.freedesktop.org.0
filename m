Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4437714D9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F2F10E0BD;
	Sun,  6 Aug 2023 12:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FADC10E089
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CC8612188A;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+1HJaDGhhWNRrx4AOpdqsGLKjCpKoKiNMbN++GMzB0=;
 b=OYf++maj/lRRJSnLWPd7o/Cx/KLXczWlBPQ1ia/X9SQ/d0rkD9mZrIOZCn216cWV/eUA2S
 W512FHn2/Nli6vV0EFdnlFXCfhzlo0eyz90lp9PSA5Lt+BOR9HVj4LEoV1+VIE/tLOEO3b
 fCo/YCIQ0DDXeHLmMEZLbF90OpNB2Iw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+1HJaDGhhWNRrx4AOpdqsGLKjCpKoKiNMbN++GMzB0=;
 b=85vMmCOVDWuXo6WOmhUQhZWv0a6qOBiyawqmyq7oDj5Fr+tiwwuIhg4K9nMqcgxp9tE1jg
 tfcWOgLBAI/65sCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A2F92139C4;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ALvcJnqNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 10/11] fbdev/p9100: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:59:01 +0200
Message-ID: <20230806120926.5368-11-tzimmermann@suse.de>
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
 drivers/video/fbdev/p9100.c | 18 +++++-------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 3bade062ac3f..ae2b0c07223f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -577,9 +577,7 @@ config FB_CG14
 config FB_P9100
 	bool "P9100 (Sparcbook 3 only) support"
 	depends on FB_SBUS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the P9100 card
 	  supported on Sparcbook 3 machines.
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index ca06886d9578..e1356f8a866e 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -31,8 +31,8 @@ static int p9100_setcolreg(unsigned, unsigned, unsigned, unsigned,
 			   unsigned, struct fb_info *);
 static int p9100_blank(int, struct fb_info *);
 
-static int p9100_mmap(struct fb_info *, struct vm_area_struct *);
-static int p9100_ioctl(struct fb_info *, unsigned int, unsigned long);
+static int p9100_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int p9100_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
 
 /*
  *  Frame buffer operations
@@ -40,16 +40,9 @@ static int p9100_ioctl(struct fb_info *, unsigned int, unsigned long);
 
 static const struct fb_ops p9100_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(p9100),
 	.fb_setcolreg		= p9100_setcolreg,
 	.fb_blank		= p9100_blank,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= p9100_mmap,
-	.fb_ioctl		= p9100_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 /* P9100 control registers */
@@ -218,7 +211,7 @@ static struct sbus_mmap_map p9100_mmap_map[] = {
 	{ 0,			0,		0		    }
 };
 
-static int p9100_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int p9100_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct p9100_par *par = (struct p9100_par *)info->par;
 
@@ -227,8 +220,7 @@ static int p9100_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  par->which_io, vma);
 }
 
-static int p9100_ioctl(struct fb_info *info, unsigned int cmd,
-		       unsigned long arg)
+static int p9100_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	/* Make it look like a cg3. */
 	return sbusfb_ioctl_helper(cmd, arg, info,
-- 
2.41.0

