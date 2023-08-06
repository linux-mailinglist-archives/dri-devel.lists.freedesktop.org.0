Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C57714D6
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074910E0DC;
	Sun,  6 Aug 2023 12:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094310E0BB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 076F51F899;
 Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p53Ydv7KZuhONn+fURmWe0GhAj6jYparydyk8YJx4V0=;
 b=QsPTqvDotob8NajONQqnAJx0kX36JthnQbe6P0+mNolYXlR+YNSrJyPUV2Vnn5rahm/08t
 v3pV9hHXkAvGr+deTYLFO/zXTIkrMnPFj2vAYz2p3CtewT6USDUE4kyvKahHVzCwBhowgr
 y019AZ+5HSnUacMfBDdwbNPKIctSsa8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p53Ydv7KZuhONn+fURmWe0GhAj6jYparydyk8YJx4V0=;
 b=lSXGWeV+IZVKsFT6N6uuy/s6u96dgi7Mbr9jvT6LDDnduP4uyKbtYkAWxt/OjBQYgF0isc
 TEVjrdwTuuM0WrCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D0DB3139C4;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SJEcMnqNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 11/11] fbdev/tcx: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:59:02 +0200
Message-ID: <20230806120926.5368-12-tzimmermann@suse.de>
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
 drivers/video/fbdev/tcx.c   | 20 ++++++--------------
 2 files changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index ae2b0c07223f..79b1e4e542e7 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -559,9 +559,7 @@ config FB_FFB
 config FB_TCX
 	bool "TCX (SS4/SS5 only) support"
 	depends on FB_SBUS
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
+	select FB_SBUS_HELPERS
 	help
 	  This is the frame buffer device driver for the TCX 24/8bit frame
 	  buffer.
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 7fb8179a8f41..fe7b7bc77eda 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -32,28 +32,21 @@
 static int tcx_setcolreg(unsigned, unsigned, unsigned, unsigned,
 			 unsigned, struct fb_info *);
 static int tcx_blank(int, struct fb_info *);
-
-static int tcx_mmap(struct fb_info *, struct vm_area_struct *);
-static int tcx_ioctl(struct fb_info *, unsigned int, unsigned long);
 static int tcx_pan_display(struct fb_var_screeninfo *, struct fb_info *);
 
+static int tcx_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int tcx_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
+
 /*
  *  Frame buffer operations
  */
 
 static const struct fb_ops tcx_ops = {
 	.owner			= THIS_MODULE,
+	FB_DEFAULT_SBUS_OPS(tcx),
 	.fb_setcolreg		= tcx_setcolreg,
 	.fb_blank		= tcx_blank,
 	.fb_pan_display		= tcx_pan_display,
-	.fb_fillrect		= cfb_fillrect,
-	.fb_copyarea		= cfb_copyarea,
-	.fb_imageblit		= cfb_imageblit,
-	.fb_mmap		= tcx_mmap,
-	.fb_ioctl		= tcx_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
 };
 
 /* THC definitions */
@@ -299,7 +292,7 @@ static struct sbus_mmap_map __tcx_mmap_map[TCX_MMAP_ENTRIES] = {
 	{ .size = 0 }
 };
 
-static int tcx_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int tcx_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct tcx_par *par = (struct tcx_par *)info->par;
 
@@ -308,8 +301,7 @@ static int tcx_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  par->which_io, vma);
 }
 
-static int tcx_ioctl(struct fb_info *info, unsigned int cmd,
-		     unsigned long arg)
+static int tcx_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	struct tcx_par *par = (struct tcx_par *) info->par;
 
-- 
2.41.0

