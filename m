Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C4F78B187
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:21:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099BF10E2DB;
	Mon, 28 Aug 2023 13:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C2B10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FD1E1FD70;
 Mon, 28 Aug 2023 13:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgOkmwaDCdX79FmTrsLWYaG//CQZqP82TAKVwlCr3kE=;
 b=yJIeQCFZ5kxm42rvYFBC2mg/Agu2SjPDBWMbH0l+pt46A9w1JxMIjPqRIwRnm9GKjKl7Ri
 5rRDptoQdRHk8aWVia5LWVCZWq2alkQ10cD4YurQoJsIe/cutOpGN7YYJvaufHd1HWpjEw
 Zj0tUAy8aonb3ZsAmPzFj0ME1ih+noE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sgOkmwaDCdX79FmTrsLWYaG//CQZqP82TAKVwlCr3kE=;
 b=xMEU56P0grfJ7Jfc/22p7IuYcN+j9uk08jxvGCNY90JIoMIR7PcXh6pGJGTfbLp8Eziya8
 pa2Z/xXPO21yrKDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF36F13A1C;
 Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iN98OWCf7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 8/8] staging/fbtft: Use fb_ops helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:24 +0200
Message-ID: <20230828132131.29295-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828132131.29295-1-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate callback functions for struct fb_ops with the fbdev macro
FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
the generated functions with an fbdev initializer macro.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/staging/fbtft/Kconfig      |  6 +--
 drivers/staging/fbtft/fbtft-core.c | 87 ++++++++----------------------
 2 files changed, 24 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfig
index 5dda3c65a38e..77ab44362f16 100644
--- a/drivers/staging/fbtft/Kconfig
+++ b/drivers/staging/fbtft/Kconfig
@@ -4,12 +4,8 @@ menuconfig FB_TFT
 	depends on FB && SPI
 	depends on FB_DEVICE
 	depends on GPIOLIB || COMPILE_TEST
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
-	select FB_DEFERRED_IO
 	select FB_BACKLIGHT
+	select FB_SYSMEM_HELPERS_DEFERRED
 
 config FB_TFT_AGM1264K_FL
 	tristate "FB driver for the AGM1264K-FL LCD display"
diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index e4a77a4e7be6..3626f429b002 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -357,61 +357,6 @@ static void fbtft_deferred_io(struct fb_info *info, struct list_head *pagereflis
 					dirty_lines_start, dirty_lines_end);
 }
 
-static void fbtft_fb_fillrect(struct fb_info *info,
-			      const struct fb_fillrect *rect)
-{
-	struct fbtft_par *par = info->par;
-
-	dev_dbg(info->dev,
-		"%s: dx=%d, dy=%d, width=%d, height=%d\n",
-		__func__, rect->dx, rect->dy, rect->width, rect->height);
-	sys_fillrect(info, rect);
-
-	par->fbtftops.mkdirty(info, rect->dy, rect->height);
-}
-
-static void fbtft_fb_copyarea(struct fb_info *info,
-			      const struct fb_copyarea *area)
-{
-	struct fbtft_par *par = info->par;
-
-	dev_dbg(info->dev,
-		"%s: dx=%d, dy=%d, width=%d, height=%d\n",
-		__func__,  area->dx, area->dy, area->width, area->height);
-	sys_copyarea(info, area);
-
-	par->fbtftops.mkdirty(info, area->dy, area->height);
-}
-
-static void fbtft_fb_imageblit(struct fb_info *info,
-			       const struct fb_image *image)
-{
-	struct fbtft_par *par = info->par;
-
-	dev_dbg(info->dev,
-		"%s: dx=%d, dy=%d, width=%d, height=%d\n",
-		__func__,  image->dx, image->dy, image->width, image->height);
-	sys_imageblit(info, image);
-
-	par->fbtftops.mkdirty(info, image->dy, image->height);
-}
-
-static ssize_t fbtft_fb_write(struct fb_info *info, const char __user *buf,
-			      size_t count, loff_t *ppos)
-{
-	struct fbtft_par *par = info->par;
-	ssize_t res;
-
-	dev_dbg(info->dev,
-		"%s: count=%zd, ppos=%llu\n", __func__,  count, *ppos);
-	res = fb_sys_write(info, buf, count, ppos);
-
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
-
-	return res;
-}
-
 /* from pxafb.c */
 static unsigned int chan_to_field(unsigned int chan, struct fb_bitfield *bf)
 {
@@ -473,16 +418,30 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	return ret;
 }
 
+static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct fbtft_par *par = info->par;
+
+	/* TODO: only mark changed area update all for now */
+	par->fbtftops.mkdirty(info, -1, 0);
+}
+
+static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	struct fbtft_par *par = info->par;
+
+	par->fbtftops.mkdirty(info, y, height);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(fbtft_ops,
+				   fbtft_ops_damage_range,
+				   fbtft_ops_damage_area)
+
 static const struct fb_ops fbtft_ops = {
-	.owner        = THIS_MODULE;
-	.fb_read      = fb_sys_read;
-	.fb_write     = fbtft_fb_write;
-	.fb_fillrect  = fbtft_fb_fillrect;
-	.fb_copyarea  = fbtft_fb_copyarea;
-	.fb_imageblit = fbtft_fb_imageblit;
-	.fb_setcolreg = fbtft_fb_setcolreg;
-	.fb_blank     = fbtft_fb_blank;
-	.fb_mmap      = fb_deferred_io_mmap;
+	.owner        = THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(fbtft_ops),
+	.fb_setcolreg = fbtft_fb_setcolreg,
+	.fb_blank     = fbtft_fb_blank,
 };
 
 static void fbtft_merge_fbtftops(struct fbtft_ops *dst, struct fbtft_ops *src)
-- 
2.41.0

