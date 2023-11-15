Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F327EC0A8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 11:30:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6D410E530;
	Wed, 15 Nov 2023 10:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6719A10E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 10:30:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F02D32291C;
 Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700044200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFNE6b8+vl7BKCZsdI0YbeSXc1u5X8/vlrUKevu+KGM=;
 b=fEaCXax+/M3fszhy4yB1zX0r2XIJMoIN+dovgCSZn4Jyq4aSKEC56MTrS3N/rkiY+WIX4X
 a7/YQ86qN7qQ+oaQxEKeadrpftHTORKUmWyO0hSBU6uX4XDN86pN4h2mGDbGFZb1dz33jy
 H7Wr2Ye675I60MWCwUg/47oba5ZvUEE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700044200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFNE6b8+vl7BKCZsdI0YbeSXc1u5X8/vlrUKevu+KGM=;
 b=FOjZDU+aiouMshR/ugyDGGJb5ji+XsYi1WvcPEw+BEtsrgbuepzb0EmO8BaX1ZATnFFJHm
 v9w0Pn7lCO5RwGDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEF3C13A6F;
 Wed, 15 Nov 2023 10:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YJm1LaidVGV+UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Nov 2023 10:30:00 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 26/32] staging/sm750fb: Initialize fb_ops with fbdev macros
Date: Wed, 15 Nov 2023 11:19:31 +0100
Message-ID: <20231115102954.7102-27-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231115102954.7102-1-tzimmermann@suse.de>
References: <20231115102954.7102-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -4.60
X-Spamd-Result: default: False [-4.60 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; REPLY(-4.00)[];
 BROKEN_CONTENT_TYPE(1.50)[]; R_MISSING_CHARSET(2.50)[];
 NEURAL_HAM_LONG(-3.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; BAYES_HAM(-3.00)[100.00%];
 RCPT_COUNT_SEVEN(0.00)[9]; MID_CONTAINS_FROM(1.00)[];
 FREEMAIL_TO(0.00)[gmx.de,redhat.com];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,gmail.com,siliconmotion.com,linuxfoundation.org,lists.linux.dev];
 RCVD_COUNT_TWO(0.00)[2]; SUSPICIOUS_RECIPS(1.50)[]
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
Cc: linux-fbdev@vger.kernel.org, Teddy Wang <teddy.wang@siliconmotion.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize all instances of struct fb_ops with fbdev initializer
macros for framebuffers in I/O address space. Set the read/write,
draw and mmap callbacks to the correct implementation and avoid
implicit defaults. Also select the necessary helpers in Kconfig.

Fbdev drivers sometimes rely on the callbacks being NULL for a
default I/O-memory-based implementation to be invoked; hence
requiring the I/O helpers to be built in any case. Setting all
callbacks in all drivers explicitly will allow to make the I/O
helpers optional. This benefits systems that do not use these
functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Teddy Wang <teddy.wang@siliconmotion.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/sm750fb/sm750.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 35098516f53c9..04c1b32a22c5e 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -665,31 +665,28 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 
 static const struct fb_ops lynxfb_ops = {
 	.owner = THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var =  lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
 	.fb_pan_display = lynxfb_ops_pan_display,
-	.fb_fillrect = cfb_fillrect,
-	.fb_imageblit = cfb_imageblit,
-	.fb_copyarea = cfb_copyarea,
 };
 
 static const struct fb_ops lynxfb_ops_with_cursor = {
 	.owner = THIS_MODULE,
+	FB_DEFAULT_IOMEM_OPS,
 	.fb_check_var =  lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
 	.fb_blank = lynxfb_ops_blank,
 	.fb_pan_display = lynxfb_ops_pan_display,
-	.fb_fillrect = cfb_fillrect,
-	.fb_copyarea = cfb_copyarea,
-	.fb_imageblit = cfb_imageblit,
 	.fb_cursor = lynxfb_ops_cursor,
 };
 
 static const struct fb_ops lynxfb_ops_accel = {
 	.owner = THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =  lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
@@ -698,10 +695,12 @@ static const struct fb_ops lynxfb_ops_accel = {
 	.fb_fillrect = lynxfb_ops_fillrect,
 	.fb_copyarea = lynxfb_ops_copyarea,
 	.fb_imageblit = lynxfb_ops_imageblit,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static const struct fb_ops lynxfb_ops_accel_with_cursor = {
 	.owner = THIS_MODULE,
+	__FB_DEFAULT_IOMEM_OPS_RDWR,
 	.fb_check_var =  lynxfb_ops_check_var,
 	.fb_set_par = lynxfb_ops_set_par,
 	.fb_setcolreg = lynxfb_ops_setcolreg,
@@ -711,6 +710,7 @@ static const struct fb_ops lynxfb_ops_accel_with_cursor = {
 	.fb_copyarea = lynxfb_ops_copyarea,
 	.fb_imageblit = lynxfb_ops_imageblit,
 	.fb_cursor = lynxfb_ops_cursor,
+	__FB_DEFAULT_IOMEM_OPS_MMAP,
 };
 
 static int lynxfb_set_fbinfo(struct fb_info *info, int index)
-- 
2.42.0

