Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CD74A09F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C310E442;
	Thu,  6 Jul 2023 15:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042CC10E435
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99B661FDD8;
 Thu,  6 Jul 2023 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656475; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAcsa10uv3EiV7S+XtXQF0w8NZrWo/NANzWi+Iocj7A=;
 b=XK5VFfILZ2CcwaU+ySc66wZoJ2OcRtXjht+EpWqjwPiPNsHxYXk8oFpFJy5GtDe0DFAJus
 Rjsdxq7lCrCYTw//n5T8W9otzlXQfr5m1UVqJr2MWwfhe2pRDvbthvvCYyx/XXNb0dw2Ih
 Rj5cUg+E+cGMT897TNjfxVPVHQSrCmI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656475;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FAcsa10uv3EiV7S+XtXQF0w8NZrWo/NANzWi+Iocj7A=;
 b=nrsA1OE+v8Kzp5NwlKhGloesQEmwK1LNi9zAPjg4hIAHEv58QoWbN2toshdmRdrnqLmA1M
 PQcqHuUfRHWP6qCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 76A871390F;
 Thu,  6 Jul 2023 15:14:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qB/gG1vapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 06/10] fbdev/metronomefb: Generate deferred I/O ops
Date: Thu,  6 Jul 2023 17:08:49 +0200
Message-ID: <20230706151432.20674-7-tzimmermann@suse.de>
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
for metronomefb and set them in the fb_ops structure. Functions
for damage handling on memory ranges and areas are provided by
the driver.

Metronomefb's implementation of fb_write writes to system memory,
so the generated code can use the respective helper internally.
This also fixes a long-standing bug where fb_write returned an
errno code instead of the number of written bytes. See the commit
message of commit 921b7383f348 ("fbdev: Return number of bytes
read or written") for more details.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/metronomefb.c | 74 ++++---------------------------
 1 file changed, 8 insertions(+), 66 deletions(-)

diff --git a/drivers/video/fbdev/metronomefb.c b/drivers/video/fbdev/metronomefb.c
index 3e1daca76e11..667bef10738c 100644
--- a/drivers/video/fbdev/metronomefb.c
+++ b/drivers/video/fbdev/metronomefb.c
@@ -483,86 +483,28 @@ static void metronomefb_dpy_deferred_io(struct fb_info *info, struct list_head *
 	metronome_display_cmd(par);
 }
 
-static void metronomefb_fillrect(struct fb_info *info,
-				   const struct fb_fillrect *rect)
+static void metronomefb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct metronomefb_par *par = info->par;
 
-	sys_fillrect(info, rect);
 	metronomefb_dpy_update(par);
 }
 
-static void metronomefb_copyarea(struct fb_info *info,
-				   const struct fb_copyarea *area)
+static void metronomefb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
+					  u32 width, u32 height)
 {
 	struct metronomefb_par *par = info->par;
 
-	sys_copyarea(info, area);
 	metronomefb_dpy_update(par);
 }
 
-static void metronomefb_imageblit(struct fb_info *info,
-				const struct fb_image *image)
-{
-	struct metronomefb_par *par = info->par;
-
-	sys_imageblit(info, image);
-	metronomefb_dpy_update(par);
-}
-
-/*
- * this is the slow path from userspace. they can seek and write to
- * the fb. it is based on fb_sys_write
- */
-static ssize_t metronomefb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct metronomefb_par *par = info->par;
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
-	metronomefb_dpy_update(par);
-
-	return (err) ? err : count;
-}
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(metronomefb,
+				metronomefb_defio_damage_range,
+				metronomefb_defio_damage_area)
 
 static const struct fb_ops metronomefb_ops = {
-	.owner		= THIS_MODULE,
-	.fb_write	= metronomefb_write,
-	.fb_fillrect	= metronomefb_fillrect,
-	.fb_copyarea	= metronomefb_copyarea,
-	.fb_imageblit	= metronomefb_imageblit,
-	.fb_mmap	= fb_deferred_io_mmap,
+	.owner	= THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(metronomefb),
 };
 
 static struct fb_deferred_io metronomefb_defio = {
-- 
2.41.0

