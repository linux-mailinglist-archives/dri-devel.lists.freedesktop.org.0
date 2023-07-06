Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3F674A0A0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 17:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3039610E459;
	Thu,  6 Jul 2023 15:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933BB10E435
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 15:14:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 380AE22860;
 Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688656476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36EIUUn7Yddtfbgxzy5lfozydt7DISbFzo5nF9ZHH3o=;
 b=zLnWrW8ENRb2PwLcNw6WSNL3uc0e9ZSBTCtqq3yGV1GR/LKwHvcm3ACeHy1i/1x8e7YX60
 4LmqzmmFhDVk5AoHyoc+i5fHW3ZGmwim0N0zXqTZK7BUy9ailLcqBKa2+jpcXD9dfjtMZQ
 YlZft7LdxzmF3VJp4/qqpDZ8O+XDeV4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688656476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=36EIUUn7Yddtfbgxzy5lfozydt7DISbFzo5nF9ZHH3o=;
 b=tXPFfkJQBzZ9NTBfXtMfi9QfaovS4qJv1KDKvtrBlLDQhsqZDfS4Sqvh+LGk9Nk1YiLHMP
 3o8OF9SLiCVz50BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 183E0138FC;
 Thu,  6 Jul 2023 15:14:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wMH7BFzapmRvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 15:14:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	deller@gmx.de
Subject: [PATCH 10/10] fbdev/xen-fbfront: Generate deferred I/O ops
Date: Thu,  6 Jul 2023 17:08:53 +0200
Message-ID: <20230706151432.20674-11-tzimmermann@suse.de>
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
for xen-fbfront and set them in the fb_ops structure. Functions
for damage handling on memory ranges and areas are provided by
the driver.

Xen-fbfront's implementation of fb_write writes to system memory,
so the generated code can use the respective helper internally.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/xen-fbfront.c | 61 ++++++++++---------------------
 1 file changed, 20 insertions(+), 41 deletions(-)

diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 9b2a786621a6..6664dc7a5a41 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -240,41 +240,6 @@ static int xenfb_setcolreg(unsigned regno, unsigned red, unsigned green,
 	return 0;
 }
 
-static void xenfb_fillrect(struct fb_info *p, const struct fb_fillrect *rect)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_fillrect(p, rect);
-	xenfb_refresh(info, rect->dx, rect->dy, rect->width, rect->height);
-}
-
-static void xenfb_imageblit(struct fb_info *p, const struct fb_image *image)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_imageblit(p, image);
-	xenfb_refresh(info, image->dx, image->dy, image->width, image->height);
-}
-
-static void xenfb_copyarea(struct fb_info *p, const struct fb_copyarea *area)
-{
-	struct xenfb_info *info = p->par;
-
-	sys_copyarea(p, area);
-	xenfb_refresh(info, area->dx, area->dy, area->width, area->height);
-}
-
-static ssize_t xenfb_write(struct fb_info *p, const char __user *buf,
-			size_t count, loff_t *ppos)
-{
-	struct xenfb_info *info = p->par;
-	ssize_t res;
-
-	res = fb_sys_write(p, buf, count, ppos);
-	xenfb_refresh(info, 0, 0, info->page->width, info->page->height);
-	return res;
-}
-
 static int
 xenfb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
 {
@@ -326,17 +291,31 @@ static int xenfb_set_par(struct fb_info *info)
 	return 0;
 }
 
+static void xenfb_defio_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct xenfb_info *xenfb_info = info->par;
+
+	xenfb_refresh(xenfb_info, 0, 0, xenfb_info->page->width, xenfb_info->page->height);
+}
+
+static void xenfb_defio_damage_area(struct fb_info *info, u32 x, u32 y,
+				    u32 width, u32 height)
+{
+	struct xenfb_info *xenfb_info = info->par;
+
+	xenfb_refresh(xenfb_info, x, y, width, height);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYS_OPS(xenfb,
+				xenfb_defio_damage_range,
+				xenfb_defio_damage_area)
+
 static const struct fb_ops xenfb_fb_ops = {
 	.owner		= THIS_MODULE,
-	.fb_read	= fb_sys_read,
-	.fb_write	= xenfb_write,
+	FB_DEFAULT_DEFERRED_OPS(xenfb),
 	.fb_setcolreg	= xenfb_setcolreg,
-	.fb_fillrect	= xenfb_fillrect,
-	.fb_copyarea	= xenfb_copyarea,
-	.fb_imageblit	= xenfb_imageblit,
 	.fb_check_var	= xenfb_check_var,
 	.fb_set_par     = xenfb_set_par,
-	.fb_mmap	= fb_deferred_io_mmap,
 };
 
 static irqreturn_t xenfb_event_handler(int rq, void *dev_id)
-- 
2.41.0

