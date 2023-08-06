Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D11E97714D7
	for <lists+dri-devel@lfdr.de>; Sun,  6 Aug 2023 14:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C1110E0D5;
	Sun,  6 Aug 2023 12:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92A510E0BD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Aug 2023 12:09:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7179D21889;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691323770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj0c3XtWbkwgiza4jlIv81QmRjo1K38L75J5G4O6hnk=;
 b=ADYtsDtmlJ/M55AlWYtOBZ/uGd6N2CyP5QI52p6fPg76WkoBY3smUbXlfkP03Z/UqE9thI
 2HHv5ox6w7VpuSxLOE95z60ZbEOcUoeNgh1iRZy/8Ez3+cHw1xiVD47250T42LMPwryQql
 guSujI3RdRolo0D9vKVVkBWleDjnuno=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691323770;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cj0c3XtWbkwgiza4jlIv81QmRjo1K38L75J5G4O6hnk=;
 b=PrdgoL7ur/c5RoUPJ8KALIawBZ904OJPSE4V8KMr6ZuHsJuDaKNjIRLwRD5WB0iD0VpYxl
 Vu/c0TLMWHKg/tBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46783139C4;
 Sun,  6 Aug 2023 12:09:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2G5YEHqNz2QvSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Aug 2023 12:09:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, sam@ravnborg.org, javierm@redhat.com, davem@davemloft.net
Subject: [PATCH 08/11] fbdev/ffb: Use initializer macro for struct fb_ops
Date: Sun,  6 Aug 2023 13:58:59 +0200
Message-ID: <20230806120926.5368-9-tzimmermann@suse.de>
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
as ffb provides its own implementation of fb_fillrect, fb_copyarea,
and fb_imageblit. Hence we also avoid FB_SBUS_HELPERS, but let the
driver select its dependencies individually instead.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/ffb.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index e3a9bb7e9dea..2a0f5337e091 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -37,16 +37,18 @@ static void ffb_imageblit(struct fb_info *, const struct fb_image *);
 static void ffb_fillrect(struct fb_info *, const struct fb_fillrect *);
 static void ffb_copyarea(struct fb_info *, const struct fb_copyarea *);
 static int ffb_sync(struct fb_info *);
-static int ffb_mmap(struct fb_info *, struct vm_area_struct *);
-static int ffb_ioctl(struct fb_info *, unsigned int, unsigned long);
 static int ffb_pan_display(struct fb_var_screeninfo *, struct fb_info *);
 
+static int ffb_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma);
+static int ffb_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg);
+
 /*
  *  Frame buffer operations
  */
 
 static const struct fb_ops ffb_ops = {
 	.owner			= THIS_MODULE,
+	__FB_DEFAULT_SBUS_OPS_RDWR(ffb),
 	.fb_setcolreg		= ffb_setcolreg,
 	.fb_blank		= ffb_blank,
 	.fb_pan_display		= ffb_pan_display,
@@ -54,11 +56,8 @@ static const struct fb_ops ffb_ops = {
 	.fb_copyarea		= ffb_copyarea,
 	.fb_imageblit		= ffb_imageblit,
 	.fb_sync		= ffb_sync,
-	.fb_mmap		= ffb_mmap,
-	.fb_ioctl		= ffb_ioctl,
-#ifdef CONFIG_COMPAT
-	.fb_compat_ioctl	= sbusfb_compat_ioctl,
-#endif
+	__FB_DEFAULT_SBUS_OPS_IOCTL(ffb),
+	__FB_DEFAULT_SBUS_OPS_MMAP(ffb),
 };
 
 /* Register layout and definitions */
@@ -850,7 +849,7 @@ static struct sbus_mmap_map ffb_mmap_map[] = {
 	{ .size = 0 }
 };
 
-static int ffb_mmap(struct fb_info *info, struct vm_area_struct *vma)
+static int ffb_sbusfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct ffb_par *par = (struct ffb_par *)info->par;
 
@@ -859,7 +858,7 @@ static int ffb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 				  0, vma);
 }
 
-static int ffb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
+static int ffb_sbusfb_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	struct ffb_par *par = (struct ffb_par *)info->par;
 
-- 
2.41.0

