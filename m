Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D62497FA0BF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE8A10E291;
	Mon, 27 Nov 2023 13:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76F2F10E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DFCD21DBF;
 Mon, 27 Nov 2023 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701091023; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGtlCCrQDHRvTgZHfjLzF69h05XzxLk7bdpiv/lvKTk=;
 b=F1CPMNYS0SbDQeZSvf6fQpPTc0P/+hoTMBxiilAIU18s6J/l7qGE7v97E6kwN+uRKsebor
 pvvrUofknUtAQVsd4/RN0z6Hr5Sa3AwrPvUO0kFKEi0B4/HRpaQPBaamKdsAnvyS2HmuKz
 HD+IaR7fUI/o098L4yeRJKGdOeoZXEk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701091023;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NGtlCCrQDHRvTgZHfjLzF69h05XzxLk7bdpiv/lvKTk=;
 b=e8kuIAgG71IgYnjZ3VS+SvtH8KbnaQ7yHn/YCiL4nFqO3HH2fMsbiDF72qjUB0zRdrUry8
 Ai51M8lMZXAFRmDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id EC91413B3A;
 Mon, 27 Nov 2023 13:17:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 0A6OOM6WZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 13/32] fbdev/sh_mobile_lcdcfb: Initialize fb_ops with fbdev
 macros
Date: Mon, 27 Nov 2023 14:15:42 +0100
Message-ID: <20231127131655.4020-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127131655.4020-1-tzimmermann@suse.de>
References: <20231127131655.4020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: *
X-Spam-Score: 1.90
X-Spamd-Result: default: False [1.90 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 R_MISSING_CHARSET(2.50)[]; MIME_GOOD(-0.10)[text/plain];
 FREEMAIL_ENVRCPT(0.00)[gmx.de]; BROKEN_CONTENT_TYPE(1.50)[];
 RCPT_COUNT_FIVE(0.00)[5]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FREEMAIL_TO(0.00)[redhat.com,gmx.de];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; RCVD_TLS_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%]
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize the instance of struct fb_ops with fbdev initializer
macros for framebuffers in DMA-able virtual address space. Set the
read/write, draw and mmap callbacks to the correct implementation
and avoid implicit defaults. Also select the necessary helpers in
Kconfig.

The driver uses a mixture of DMA helpers and deferred I/O. That
probably needs fixing by a driver maintainer.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default I/O-memory-based implementation to be invoked; hence
requiring the I/O helpers to be built in any case. Setting all
callbacks in all drivers explicitly will allow to make the I/O
helpers optional. This benefits systems that do not use these
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/Kconfig            |  7 ++-----
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 10 +++-------
 2 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 44bf622fc8d74..1eab89a07bbc5 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1634,12 +1634,9 @@ config FB_SH_MOBILE_LCDC
 	depends on FB && HAVE_CLK && HAS_IOMEM
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	depends on FB_DEVICE
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
-	select FB_DEFERRED_IO
 	select FB_BACKLIGHT
+	select FB_DEFERRED_IO
+	select FB_DMAMEM_HELPERS
 	help
 	  Frame buffer driver for the on-chip SH-Mobile LCD controller.
 
diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index 5c99fc8a409fd..d84628de51893 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1488,13 +1488,10 @@ sh_mobile_lcdc_overlay_mmap(struct fb_info *info, struct vm_area_struct *vma)
 
 static const struct fb_ops sh_mobile_lcdc_overlay_ops = {
 	.owner          = THIS_MODULE,
-	.fb_read        = fb_sys_read,
-	.fb_write       = fb_sys_write,
-	.fb_fillrect	= sys_fillrect,
-	.fb_copyarea	= sys_copyarea,
-	.fb_imageblit	= sys_imageblit,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	.fb_blank	= sh_mobile_lcdc_overlay_blank,
 	.fb_pan_display = sh_mobile_lcdc_overlay_pan,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_ioctl       = sh_mobile_lcdc_overlay_ioctl,
 	.fb_check_var	= sh_mobile_lcdc_overlay_check_var,
 	.fb_set_par	= sh_mobile_lcdc_overlay_set_par,
@@ -1966,8 +1963,7 @@ sh_mobile_lcdc_mmap(struct fb_info *info, struct vm_area_struct *vma)
 static const struct fb_ops sh_mobile_lcdc_ops = {
 	.owner          = THIS_MODULE,
 	.fb_setcolreg	= sh_mobile_lcdc_setcolreg,
-	.fb_read        = fb_sys_read,
-	.fb_write       = fb_sys_write,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	.fb_fillrect	= sh_mobile_lcdc_fillrect,
 	.fb_copyarea	= sh_mobile_lcdc_copyarea,
 	.fb_imageblit	= sh_mobile_lcdc_imageblit,
-- 
2.43.0

