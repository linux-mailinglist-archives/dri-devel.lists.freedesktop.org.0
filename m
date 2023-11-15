Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD187EC09D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300C10E522;
	Wed, 15 Nov 2023 10:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A5A10E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:29:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 98DB2204FA;
 Wed, 15 Nov 2023 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700044197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8LrEBuOCgFoDnCs2D8zwX5X8PiT1yhbO83aT1Bv410=;
 b=b/xaDjT8QbZOfM74m4gex0NYieVq6XQXvbjszG7YtcJjigKr1GIV0uF8+7NNyVQi/zNous
 nHe9uLrpNbW4+CIXIgTbkUprjE6EjA7NwCA+OrzoihSVMu3yzRZT6s4T1jOJ9pdpPIU3YX
 wJFS49MF766Os0VgwdXophYxWTbFEB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700044197;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/8LrEBuOCgFoDnCs2D8zwX5X8PiT1yhbO83aT1Bv410=;
 b=W2zybD24yOfLykNMRlb+JH28t/b6moZcnJ9jeXlHGOHzRijJcF67vh/LwkWdqN5UxCr2wj
 bYGHvgrqWdqkkRDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B3C5139B7;
 Wed, 15 Nov 2023 10:29:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AKhIGaWdVGV+UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:29:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 06/32] fbdev/arcfb: Use generator macros for deferred I/O
Date: Wed, 15 Nov 2023 11:19:11 +0100
Message-ID: <20231115102954.7102-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.10
X-Spamd-Result: default: False [-6.10 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 R_MISSING_CHARSET(2.50)[]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCPT_COUNT_FIVE(0.00)[6];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO
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
---
 drivers/video/fbdev/Kconfig |   5 +-
 drivers/video/fbdev/arcfb.c | 113 +++++++++---------------------------
 2 files changed, 27 insertions(+), 91 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index e897bf3976bc2..e789e5c1973cb 100644
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
2.42.0

