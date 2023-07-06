Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060B674A09A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFAE10E43A;
	Thu,  6 Jul 2023 15:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960D110E436
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFEF21FDDE;
 Thu,  6 Jul 2023 15:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656474; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQo6aolElvvRcJn1/52a83zykwUTIrP8B81NEDQhyik=;
 b=q9swbigEJyWiCEsvcIKmYNw86mQlweyGII4bQQzfZ4eTzm8SKCK1Uk/rs8GmWy9wVWVFOV
 o9nqpco7g6G6q5J/PixCV3+i2eR0T/Ijp7oVQ0GJ1x7yv1Z7qWakzvbfaJUIvqkJ6dAvxn
 IZQ/zGarRKLT/yOhbG/JNpUd694Cr8I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656474;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jQo6aolElvvRcJn1/52a83zykwUTIrP8B81NEDQhyik=;
 b=D7iCDoiDtjNyCSe1bA/zXML6m16xHIkRShmiYBDqA6rFClS+h8xnReCgOxtonp1AqDG/FY
 IWPYUwhXlWlbwDCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE1311390F;
 Thu,  6 Jul 2023 15:14:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +HJFMVrapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 02/10] fbdev/broadsheetfb: Generate deferred I/O ops
Date: Thu,  6 Jul 2023 17:08:45 +0200
Message-ID: <20230706151432.20674-3-tzimmermann@suse.de>
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
for broadsheetfb and set them in the fb_ops structure. Functions
for damage handling on memory ranges and areas are provided by
the driver.

Broadsheedfb's implementation of fb_write writes to system memory,
so the generated code can use the respective helper internally.
This also fixes a long-standing bug where fb_write returned an
errno code instead of the number of written bytes. See the commit
message of commit 921b7383f348 ("fbdev: Return number of bytes
read or written") for more details.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/broadsheetfb.c | 78 +++---------------------------
 1 file changed, 8 insertions(+), 70 deletions(-)

diff --git a/drivers/video/fbdev/broadsheetfb.c b/drivers/video/fbdev/broadsheetfb.c
index 5a5fe4bbc10b..cb725a91b6bb 100644
--- a/drivers/video/fbdev/broadsheetfb.c
+++ b/drivers/video/fbdev/broadsheetfb.c
@@ -970,90 +970,28 @@ static void broadsheetfb_dpy_deferred_io(struct fb_info *info, struct list_head
 	}
 }
 
-static void broadsheetfb_fillrect(struct fb_info *info,
-				   const struct fb_fillrect *rect)
+static void broadsheetfb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct broadsheetfb_par *par = info->par;
 
-	sys_fillrect(info, rect);
-
 	broadsheetfb_dpy_update(par);
 }
 
-static void broadsheetfb_copyarea(struct fb_info *info,
-				   const struct fb_copyarea *area)
+static void broadsheetfb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
+					   u32 width, u32 height)
 {
 	struct broadsheetfb_par *par = info->par;
 
-	sys_copyarea(info, area);
-
 	broadsheetfb_dpy_update(par);
 }
 
-static void broadsheetfb_imageblit(struct fb_info *info,
-				const struct fb_image *image)
-{
-	struct broadsheetfb_par *par = info->par;
-
-	sys_imageblit(info, image);
-
-	broadsheetfb_dpy_update(par);
-}
-
-/*
- * this is the slow path from userspace. they can seek and write to
- * the fb. it's inefficient to do anything less than a full screen draw
- */
-static ssize_t broadsheetfb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct broadsheetfb_par *par = info->par;
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
-	broadsheetfb_dpy_update(par);
-
-	return (err) ? err : count;
-}
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(broadsheetfb,
+				broadsheetfb_defio_damage_range,
+				broadsheetfb_defio_damage_area)
 
 static const struct fb_ops broadsheetfb_ops = {
-	.owner		= THIS_MODULE,
-	.fb_read        = fb_sys_read,
-	.fb_write	= broadsheetfb_write,
-	.fb_fillrect	= broadsheetfb_fillrect,
-	.fb_copyarea	= broadsheetfb_copyarea,
-	.fb_imageblit	= broadsheetfb_imageblit,
-	.fb_mmap	= fb_deferred_io_mmap,
+	.owner	= THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(broadsheetfb),
 };
 
 static struct fb_deferred_io broadsheetfb_defio = {
-- 
2.41.0

