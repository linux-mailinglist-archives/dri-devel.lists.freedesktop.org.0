Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BBC7FA08C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:17:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5BC10E272;
	Mon, 27 Nov 2023 13:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D7810E26F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:17:05 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0CC8421DC4;
 Mon, 27 Nov 2023 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701091024; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx0ybonSLQhw/8oD6EALgmL06X6LKYe+99fwbncPc1w=;
 b=UehHq4pFHh4kgA9mb/x8ztQ6GfpV+I6D44JfUYbYepA4izs0yBd4QEr6u2XxNaKFxhbW3+
 IWSUbyBLq9MkRWrEShVUz+/4RM9f7KRh2dNomwMRrzvDnRkEw8fuGTsWmcmVXKJiaRNAJF
 DR8mxATCPSYRS/WDpz2O25okae/dcgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701091024;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vx0ybonSLQhw/8oD6EALgmL06X6LKYe+99fwbncPc1w=;
 b=mHnbVHy+6o0rdtf/1v+EwmAGmxJljc86FU2SF8I9jaXmBAN15i3s/RG/64I8wuFZcmBFzX
 tDgg046WRdkq/SDA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id DC69D132A6;
 Mon, 27 Nov 2023 13:17:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id gDi9NM+WZGUhLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Nov 2023 13:17:03 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH v2 17/32] fbdev/au1200fb: Initialize fb_ops with fbdev macros
Date: Mon, 27 Nov 2023 14:15:46 +0100
Message-ID: <20231127131655.4020-18-tzimmermann@suse.de>
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

Fbdev drivers sometimes rely on the callbacks being NULL for a
default I/O-memory-based implementation to be invoked; hence
requiring the I/O helpers to be built in any case. Setting all
callbacks in all drivers explicitly will allow to make the I/O
helpers optional. This benefits systems that do not use these
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/video/fbdev/Kconfig    | 5 +----
 drivers/video/fbdev/au1200fb.c | 7 ++-----
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index de57bf59e0179..4c82890887ba1 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1457,10 +1457,7 @@ config FB_AU1100
 config FB_AU1200
 	bool "Au1200/Au1300 LCD Driver"
 	depends on (FB = y) && MIPS_ALCHEMY
-	select FB_SYS_FILLRECT
-	select FB_SYS_COPYAREA
-	select FB_SYS_IMAGEBLIT
-	select FB_SYS_FOPS
+	select FB_DMAMEM_HELPERS
 	help
 	  This is the framebuffer driver for the Au1200/Au1300 SOCs.
 	  It can drive various panels and CRTs by passing in kernel cmd line
diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 817c1ebb625b6..16ebbab500972 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1488,15 +1488,12 @@ static int au1200fb_ioctl(struct fb_info *info, unsigned int cmd,
 
 static const struct fb_ops au1200fb_fb_ops = {
 	.owner		= THIS_MODULE,
+	__FB_DEFAULT_DMAMEM_OPS_RDWR,
 	.fb_check_var	= au1200fb_fb_check_var,
 	.fb_set_par	= au1200fb_fb_set_par,
 	.fb_setcolreg	= au1200fb_fb_setcolreg,
 	.fb_blank	= au1200fb_fb_blank,
-	.fb_fillrect	= sys_fillrect,
-	.fb_copyarea	= sys_copyarea,
-	.fb_imageblit	= sys_imageblit,
-	.fb_read	= fb_sys_read,
-	.fb_write	= fb_sys_write,
+	__FB_DEFAULT_DMAMEM_OPS_DRAW,
 	.fb_sync	= NULL,
 	.fb_ioctl	= au1200fb_ioctl,
 	.fb_mmap	= au1200fb_fb_mmap,
-- 
2.43.0

