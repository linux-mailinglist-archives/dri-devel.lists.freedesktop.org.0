Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228147FA0B7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9441A10E289;
	Mon, 27 Nov 2023 13:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B90910E26E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:03 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E10C21DB3;
 Mon, 27 Nov 2023 13:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701091021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW7v1z8xmQoBIbKurwpBRrAQceWgcaTp/28hSGC/1gY=;
 b=yHLqo2R37XmglrdOOSo1iirb1PgQ6gqaUxGPmsPn0CIEr5PVJGeStbjCD2yH3YtcLdFEcx
 8RFvHUBoC1xfnMMqGZoXCUAGQfd9Vl1WGwub9UFnnkvnzWuow4ETTpUB74p6cp7wm2Iwk+
 06rr19KwfpqWIYQBwrpSNTp9nanlmqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701091021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CW7v1z8xmQoBIbKurwpBRrAQceWgcaTp/28hSGC/1gY=;
 b=AqG55K32kFx6AUtn9nMbh4E8gOdc3jaYx7UP8/aCGaQzTD2XcdY5gDWikd+6Zt5xOUWroY
 b6EDVzQ/qEYzjuAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 64625132A6;
 Mon, 27 Nov 2023 13:17:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cBdwF82WZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 06/32] fbdev/arcfb: Use generator macros for deferred I/O
Date: Mon, 27 Nov 2023 14:15:35 +0100
Message-ID: <20231127131655.4020-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [0.70 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_THREE(0.00)[3]; NEURAL_HAM_SHORT(-0.20)[-0.999];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 0.70
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
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implement the driver's fops with the generator macros for deferred
I/O. Only requires per-driver code for the on-scren scanout buffer.
The generated helpers implement reading, writing and drawing on top
of that. Also update the selected Kconfig tokens accordingly.

Actual support for deferred I/O is missing from the driver. So
writing to memory-mapped pages does not automatically update the
scanout buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jaya Kumar <jayalk@intworks.biz>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/Kconfig |   5 +-
 drivers/video/fbdev/arcfb.c | 113 +++++++++---------------------------
 2 files changed, 27 insertions(+), 91 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 63956382ffb65..44bf622fc8d74 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -272,10 +272,7 @@ config FB_FM2
 config FB_ARC
 	tristate "Arc Monochrome LCD board support"
 	depends on FB && (X86 || COMPILE_TEST)
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_HELPERS_DEFERRED
 	help
 	  This enables support for the Arc Monochrome LCD board. The board
 	  is based on the KS-108 lcd controller and is typically a matrix
diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 7344e825543af..b2408543277ce 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -363,39 +363,6 @@ static void arcfb_lcd_update(struct arcfb_par *par, unsigned int dx,
 	}
 }
 
-static void arcfb_fillrect(struct fb_info *info,
-			   const struct fb_fillrect *rect)
-{
-	struct arcfb_par *par = info->par;
-
-	sys_fillrect(info, rect);
-
-	/* update the physical lcd */
-	arcfb_lcd_update(par, rect->dx, rect->dy, rect->width, rect->height);
-}
-
-static void arcfb_copyarea(struct fb_info *info,
-			   const struct fb_copyarea *area)
-{
-	struct arcfb_par *par = info->par;
-
-	sys_copyarea(info, area);
-
-	/* update the physical lcd */
-	arcfb_lcd_update(par, area->dx, area->dy, area->width, area->height);
-}
-
-static void arcfb_imageblit(struct fb_info *info, const struct fb_image *image)
-{
-	struct arcfb_par *par = info->par;
-
-	sys_imageblit(info, image);
-
-	/* update the physical lcd */
-	arcfb_lcd_update(par, image->dx, image->dy, image->width,
-				image->height);
-}
-
 static int arcfb_ioctl(struct fb_info *info,
 			  unsigned int cmd, unsigned long arg)
 {
@@ -436,76 +403,48 @@ static int arcfb_ioctl(struct fb_info *info,
 	}
 }
 
-/*
- * this is the access path from userspace. they can seek and write to
- * the fb. it's inefficient for them to do anything less than 64*8
- * writes since we update the lcd in each write() anyway.
- */
-static ssize_t arcfb_write(struct fb_info *info, const char __user *buf,
-			   size_t count, loff_t *ppos)
+static void arcfb_damage_range(struct fb_info *info, off_t off, size_t len)
 {
-	/* modded from epson 1355 */
-
-	unsigned long p;
-	int err;
-	unsigned int fbmemlength,x,y,w,h, bitppos, startpos, endpos, bitcount;
-	struct arcfb_par *par;
-	unsigned int xres;
-
-	if (!info->screen_buffer)
-		return -ENODEV;
-
-	p = *ppos;
-	par = info->par;
-	xres = info->var.xres;
-	fbmemlength = (xres * info->var.yres)/8;
-
-	if (p > fbmemlength)
-		return -ENOSPC;
-
-	err = 0;
-	if ((count + p) > fbmemlength) {
-		count = fbmemlength - p;
-		err = -ENOSPC;
-	}
-
-	if (count) {
-		char *base_addr;
-
-		base_addr = info->screen_buffer;
-		count -= copy_from_user(base_addr + p, buf, count);
-		*ppos += count;
-		err = -EFAULT;
-	}
-
+	struct arcfb_par *par = info->par;
+	unsigned int xres = info->var.xres;
+	unsigned int bitppos, startpos, endpos, bitcount;
+	unsigned int x, y, width, height;
 
-	bitppos = p*8;
+	bitppos = off * 8;
 	startpos = floorXres(bitppos, xres);
-	endpos = ceilXres((bitppos + (count*8)), xres);
+	endpos = ceilXres((bitppos + (len * 8)), xres);
 	bitcount = endpos - startpos;
 
 	x = startpos % xres;
 	y = startpos / xres;
-	w = xres;
-	h = bitcount / xres;
-	arcfb_lcd_update(par, x, y, w, h);
+	width = xres;
+	height = bitcount / xres;
+
+	arcfb_lcd_update(par, x, y, width, height);
+}
 
-	if (count)
-		return count;
-	return err;
+static void arcfb_damage_area(struct fb_info *info, u32 x, u32 y,
+			      u32 width, u32 height)
+{
+	struct arcfb_par *par = info->par;
+
+	/* update the physical lcd */
+	arcfb_lcd_update(par, x, y, width, height);
 }
 
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(arcfb,
+				   arcfb_damage_range,
+				   arcfb_damage_area)
+
 static const struct fb_ops arcfb_ops = {
 	.owner		= THIS_MODULE,
 	.fb_open	= arcfb_open,
-	.fb_read        = fb_sys_read,
-	.fb_write	= arcfb_write,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(arcfb),
 	.fb_release	= arcfb_release,
 	.fb_pan_display	= arcfb_pan_display,
-	.fb_fillrect	= arcfb_fillrect,
-	.fb_copyarea	= arcfb_copyarea,
-	.fb_imageblit	= arcfb_imageblit,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(arcfb),
 	.fb_ioctl 	= arcfb_ioctl,
+	// .fb_mmap reqires deferred I/O
 };
 
 static int arcfb_probe(struct platform_device *dev)
-- 
2.43.0

