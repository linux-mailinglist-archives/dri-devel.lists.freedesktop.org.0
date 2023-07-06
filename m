Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7274A099
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2E4810E437;
	Thu,  6 Jul 2023 15:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14C910E437
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49ABE22853;
 Thu,  6 Jul 2023 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NagF6vJZmPBPjZYwJAr2QCnSInNpMOX6TMIQwcD5js=;
 b=yCk36NuvH4UXAfBO5Jz3A1Gb0FR1n+g6fyQ8nmWB/QSuTCmJSd61Mu+bUxciNZNr9ZyJ6U
 DGDf/h0NHOfIXLutWBbipUijjCnIBd0ElJyZqgVdqXB/1sohOXynXH2JjYtb5OClPT0RZo
 C//ypRUuYifbsY9yw1ucAdTljgsyw2s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5NagF6vJZmPBPjZYwJAr2QCnSInNpMOX6TMIQwcD5js=;
 b=92pjfVp72qDxllbfvTQsh9O2ewHKTs8zTcdLRmAxKbWoLTz/y22ApMDrq0CiP6OgPkEJuR
 YARBTyJxVr1/c8AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2882F1390F;
 Thu,  6 Jul 2023 15:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yB/iCFvapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 04/10] fbdev/hecubafb: Generate deferred I/O ops
Date: Thu,  6 Jul 2023 17:08:47 +0200
Message-ID: <20230706151432.20674-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706151432.20674-1-tzimmermann@suse.de>
References: <20230706151432.20674-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the existing generator macros to create deferred-I/O helpers
for hecubafb and set them in the fb_ops structure. Functions
for damage handling on memory ranges and areas are provided by
the driver.

Hecubafb's implementation of fb_write writes to system memory,
so the generated code can use the respective helper internally.
This also fixes a long-standing bug where fb_write returned an
errno code instead of the number of written bytes. See the commit
message of commit 921b7383f348 ("fbdev: Return number of bytes
read or written") for more details.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/hecubafb.c | 78 ++++------------------------------
 1 file changed, 8 insertions(+), 70 deletions(-)

diff --git a/drivers/video/fbdev/hecubafb.c b/drivers/video/fbdev/hecubafb.c
index 7ce0a16ce8b9..5043d08ade54 100644
--- a/drivers/video/fbdev/hecubafb.c
+++ b/drivers/video/fbdev/hecubafb.c
@@ -120,90 +120,28 @@ static void hecubafb_dpy_deferred_io(struct fb_info *info, struct list_head *pag
 	hecubafb_dpy_update(info->par);
 }
 
-static void hecubafb_fillrect(struct fb_info *info,
-				   const struct fb_fillrect *rect)
+static void hecubafb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct hecubafb_par *par = info->par;
 
-	sys_fillrect(info, rect);
-
 	hecubafb_dpy_update(par);
 }
 
-static void hecubafb_copyarea(struct fb_info *info,
-				   const struct fb_copyarea *area)
+static void hecubafb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
+				       u32 width, u32 height)
 {
 	struct hecubafb_par *par = info->par;
 
-	sys_copyarea(info, area);
-
 	hecubafb_dpy_update(par);
 }
 
-static void hecubafb_imageblit(struct fb_info *info,
-				const struct fb_image *image)
-{
-	struct hecubafb_par *par = info->par;
-
-	sys_imageblit(info, image);
-
-	hecubafb_dpy_update(par);
-}
-
-/*
- * this is the slow path from userspace. they can seek and write to
- * the fb. it's inefficient to do anything less than a full screen draw
- */
-static ssize_t hecubafb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct hecubafb_par *par = info->par;
-	unsigned long p = *ppos;
-	void *dst;
-	int err = 0;
-	unsigned long total_size;
-
-	if (!info->screen_buffer)
-		return -ENODEV;
-
-	total_size = info->fix.smem_len;
-
-	if (p > total_size)
-		return -EFBIG;
-
-	if (count > total_size) {
-		err = -EFBIG;
-		count = total_size;
-	}
-
-	if (count + p > total_size) {
-		if (!err)
-			err = -ENOSPC;
-
-		count = total_size - p;
-	}
-
-	dst = info->screen_buffer + p;
-
-	if (copy_from_user(dst, buf, count))
-		err = -EFAULT;
-
-	if  (!err)
-		*ppos += count;
-
-	hecubafb_dpy_update(par);
-
-	return (err) ? err : count;
-}
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(hecubafb,
+				hecubafb_defio_damage_range,
+				hecubafb_defio_damage_area)
 
 static const struct fb_ops hecubafb_ops = {
-	.owner		= THIS_MODULE,
-	.fb_read        = fb_sys_read,
-	.fb_write	= hecubafb_write,
-	.fb_fillrect	= hecubafb_fillrect,
-	.fb_copyarea	= hecubafb_copyarea,
-	.fb_imageblit	= hecubafb_imageblit,
-	.fb_mmap	= fb_deferred_io_mmap,
+	.owner	= THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(hecubafb),
 };
 
 static struct fb_deferred_io hecubafb_defio = {
-- 
2.41.0

