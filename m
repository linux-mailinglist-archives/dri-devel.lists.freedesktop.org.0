Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9997714DB
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA71C10E0EE;
	Sun,  6 Aug 2023 12:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42B10E0BB
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 42BC121880;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5e6M7ooxbUsgwz+grJQfs5o8CWxzWOjaaUBBfvIb+LU=;
 b=ICsutHNjZwn9UAbC9hoVvlt8bbrDPNWZEt2taDQGcGMoVg6MIufPLrucy5Eo8n7VvCEpmw
 FzhY9BJCvrKHJ62VnJ9lzNY2c4IcfZo0rAnUkHwl8V8GU3d/B1Pp2HhtBHHVXwQKtC18Co
 z+qD3qhJwN044P3S5RUsNH3sSZAbcbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5e6M7ooxbUsgwz+grJQfs5o8CWxzWOjaaUBBfvIb+LU=;
 b=bhF6jEYP8HI5+WLWIKNPlhym3oDlwjmkHaB8B4d/TbiVNZfzKtFP4PhPffZtujppjjWOBJ
 fR4jaXWJREwSiYAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 181DA139D1;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QPvnBHqNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 07/11] fbdev/cg6: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:58:58 +0200
Message-ID: <20230806120926.5368-8-tzimmermann@suse.de>
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
internal __FB_DEFAULT_SBUS_OPS_*() macros. Rename the ioctl and
mmap callbacks to use the infix _sbusfb_. This makes them fit the
SBUS helpers' naming pattern.

It is not possible to use set all defaults via FB_DEAFULT_SBUS_OPS(),
as cg6 provides its own implementation of fb_fillrect, fb_copyarea,
and fb_imageblit. Hence we also avoid FB_SBUS_HELPERS, but let the
driver select its dependencies individually instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/cg6.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 8ef6ac9132f3..69d3ce50948d 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -37,16 +37,18 @@ static void cg6_imageblit(struct fb_info *, const struct fb_image *);
 static void cg6_fillrect(struct fb_info *, const struct fb_fillrect *);
 static void cg6_copyarea(struct fb_info *info, const struct fb_copyarea *area);
 static int cg6_sync(struct fb_info *);
-static int cg6_mmap(struct fb_info *, struct vm_area_struct *);
-static int cg6_ioctl(struct fb_info *, unsigned int, unsigned long);
 static int cg6_pan_display(struct fb_var_screeninfo *, struct fb_info *);
 
+static int cg6_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int cg6_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
+
 /*
  *  Frame buffer operations
  */
 
 static const struct fb_ops cg6_ops = {
 	.owner			= THIS_MODULE,
+	__FB_DEFAULT_SBUS_OPS_RDWR(cg6),
 	.fb_setcolreg		= cg6_setcolreg,
 	.fb_blank		= cg6_blank,
 	.fb_pan_display		= cg6_pan_display,
@@ -54,11 +56,8 @@ static const struct fb_ops cg6_ops = {
 	.fb_copyarea		= cg6_copyarea,
 	.fb_imageblit		= cg6_imageblit,
 	.fb_sync		= cg6_sync,
-	.fb_mmap		= cg6_mmap,
-	.fb_ioctl		= cg6_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
+	__FB_DEFAULT_SBUS_OPS_IOCTL(cg6),
+	__FB_DEFAULT_SBUS_OPS_MMAP(cg6),
 };
 
 /* Offset of interesting structures in the OBIO space */
@@ -590,7 +589,7 @@ static struct sbus_mmap_map cg6_mmap_map[] = {
 	{ .size	= 0 }
 };
 
-static int cg6_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int cg6_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct cg6_par *par = (struct cg6_par *)info->par;
 
@@ -599,7 +598,7 @@ static int cg6_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  par->which_io, vma);
 }
 
-static int cg6_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int cg6_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	return sbusfb_ioctl_helper(cmd, arg, info,
 				   FBTYPE_SUNFAST_COLOR, 8, info->fix.smem_len);
-- 
2.41.0

