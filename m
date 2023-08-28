Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C573D78B188
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8D210E2D9;
	Mon, 28 Aug 2023 13:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A7C10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C0EEF1FD6E;
 Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldw1MdaRpEpS7svygzNDrqBtCJfAtQHJJvySgzI7rd0=;
 b=bcNT1BK9I1tD98v3xdWzr0bMmjekx6ajdgM5vXUCRtjaKZztqQ7k1nK70+SpIt+MLG65IK
 HYwm56YO7FlLJn9NZyZXvk5Eu5buoljh51svd5F/sV9X55WLC9M5DokQhaRMGojzLKL39G
 G/uY2g0gnB0ZoJsbLcOOE/f8i5hhBH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228896;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ldw1MdaRpEpS7svygzNDrqBtCJfAtQHJJvySgzI7rd0=;
 b=GbOqHAoa1Omaq6Uq6ROcQ8XZwpHs3Pr4RkEfZQ9zoUWDXiqMCHwOAK1exQoNUuzU066jK6
 MD68OPa6h1u3enDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B05213A1C;
 Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gDQ8GWCf7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 6/8] hid/picolcd: Use fb_ops helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:22 +0200
Message-ID: <20230828132131.29295-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828132131.29295-1-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-fbdev@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 linux-staging@lists.linux.dev, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate callback functions for struct fb_ops with the fbdev macro
FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
the generated functions with an fbdev initializer macro.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: "Bruno Prémont" <bonbons@linux-vserver.org>
---
 drivers/hid/Kconfig          |  6 +--
 drivers/hid/hid-picolcd_fb.c | 73 ++++++++++--------------------------
 2 files changed, 20 insertions(+), 59 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index b50054a41c10..dbf632bb7e26 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -871,11 +871,7 @@ config HID_PICOLCD_FB
 	default !EXPERT
 	depends on HID_PICOLCD
 	depends on HID_PICOLCD=FB || FB=y
-	select FB_DEFERRED_IO
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_SYSMEM_HELPERS_DEFERRED
 	help
 	  Provide access to PicoLCD's 256x64 monochrome display via a
 	  framebuffer device.
diff --git a/drivers/hid/hid-picolcd_fb.c b/drivers/hid/hid-picolcd_fb.c
index d726aaafb146..a4dccdcda26f 100644
--- a/drivers/hid/hid-picolcd_fb.c
+++ b/drivers/hid/hid-picolcd_fb.c
@@ -283,54 +283,6 @@ static void picolcd_fb_update(struct fb_info *info)
 	mutex_unlock(&info->lock);
 }
 
-/* Stub to call the system default and update the image on the picoLCD */
-static void picolcd_fb_fillrect(struct fb_info *info,
-		const struct fb_fillrect *rect)
-{
-	if (!info->par)
-		return;
-	sys_fillrect(info, rect);
-
-	schedule_delayed_work(&info->deferred_work, 0);
-}
-
-/* Stub to call the system default and update the image on the picoLCD */
-static void picolcd_fb_copyarea(struct fb_info *info,
-		const struct fb_copyarea *area)
-{
-	if (!info->par)
-		return;
-	sys_copyarea(info, area);
-
-	schedule_delayed_work(&info->deferred_work, 0);
-}
-
-/* Stub to call the system default and update the image on the picoLCD */
-static void picolcd_fb_imageblit(struct fb_info *info, const struct fb_image *image)
-{
-	if (!info->par)
-		return;
-	sys_imageblit(info, image);
-
-	schedule_delayed_work(&info->deferred_work, 0);
-}
-
-/*
- * this is the slow path from userspace. they can seek and write to
- * the fb. it's inefficient to do anything less than a full screen draw
- */
-static ssize_t picolcd_fb_write(struct fb_info *info, const char __user *buf,
-		size_t count, loff_t *ppos)
-{
-	ssize_t ret;
-	if (!info->par)
-		return -ENODEV;
-	ret = fb_sys_write(info, buf, count, ppos);
-	if (ret >= 0)
-		schedule_delayed_work(&info->deferred_work, 0);
-	return ret;
-}
-
 static int picolcd_fb_blank(int blank, struct fb_info *info)
 {
 	/* We let fb notification do this for us via lcd/backlight device */
@@ -417,18 +369,31 @@ static int picolcd_set_par(struct fb_info *info)
 	return 0;
 }
 
+static void picolcdfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	if (!info->par)
+		return;
+	schedule_delayed_work(&info->deferred_work, 0);
+}
+
+static void picolcdfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	if (!info->par)
+		return;
+	schedule_delayed_work(&info->deferred_work, 0);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(picolcdfb_ops,
+				   picolcdfb_ops_damage_range,
+				   picolcdfb_ops_damage_area)
+
 static const struct fb_ops picolcdfb_ops = {
 	.owner        = THIS_MODULE,
+	FB_DEFAULT_DEFERRED_OPS(picolcdfb_ops),
 	.fb_destroy   = picolcd_fb_destroy,
-	.fb_read      = fb_sys_read,
-	.fb_write     = picolcd_fb_write,
 	.fb_blank     = picolcd_fb_blank,
-	.fb_fillrect  = picolcd_fb_fillrect,
-	.fb_copyarea  = picolcd_fb_copyarea,
-	.fb_imageblit = picolcd_fb_imageblit,
 	.fb_check_var = picolcd_fb_check_var,
 	.fb_set_par   = picolcd_set_par,
-	.fb_mmap      = fb_deferred_io_mmap,
 };
 
 
-- 
2.41.0

