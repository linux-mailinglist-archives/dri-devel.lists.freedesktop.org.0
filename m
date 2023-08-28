Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587778B181
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E507410E2D2;
	Mon, 28 Aug 2023 13:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F6510E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49E73219E8;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GJmmvfwBrAhX80vy9z3XmR9U1soXnui0Gq8I5hETh4=;
 b=aDMxuHdYAtgtwCiMpngP+xUirP9sNewsDx8jCjryGF6r0cFnKlB94mf39dB2lvs/L+JrSo
 axsSbB3YDAA9PdU44E1dzxlrfERqsPEgVBRY6K2xAafehOPxQzpjWiTut3klsGTPH7ip1Q
 nBhkHkgRgpuksq9UIYIzTW6TuyMnpY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8GJmmvfwBrAhX80vy9z3XmR9U1soXnui0Gq8I5hETh4=;
 b=g5flVod5dpKEV8gcf7hYE67LzXQdJojcSfCoxLxYnB7FGltw2ct6Assa4LVWJEe6PqZWU9
 GsvXxvvuUoYKARCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 11C4513A11;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +JVuA1+f7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 1/8] fbdev/smscufx: Use fb_ops helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:17 +0200
Message-ID: <20230828132131.29295-2-tzimmermann@suse.de>
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
Cc: Steve Glendinning <steve.glendinning@shawell.net>,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate callback functions for struct fb_ops with the fbdev macro
FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
the generated functions with fbdev initializer macros.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Steve Glendinning <steve.glendinning@shawell.net>
---
 drivers/video/fbdev/smscufx.c | 85 +++++++++--------------------------
 1 file changed, 22 insertions(+), 63 deletions(-)

diff --git a/drivers/video/fbdev/smscufx.c b/drivers/video/fbdev/smscufx.c
index 387d18706fec..90a77d19b236 100644
--- a/drivers/video/fbdev/smscufx.c
+++ b/drivers/video/fbdev/smscufx.c
@@ -894,64 +894,6 @@ static int ufx_handle_damage(struct ufx_data *dev, int x, int y,
 	return 0;
 }
 
-/* Path triggered by usermode clients who write to filesystem
- * e.g. cat filename > /dev/fb1
- * Not used by X Windows or text-mode console. But useful for testing.
- * Slow because of extra copy and we must assume all pixels dirty. */
-static ssize_t ufx_ops_write(struct fb_info *info, const char __user *buf,
-			  size_t count, loff_t *ppos)
-{
-	ssize_t result;
-	struct ufx_data *dev = info->par;
-	u32 offset = (u32) *ppos;
-
-	result = fb_sys_write(info, buf, count, ppos);
-
-	if (result > 0) {
-		int start = max((int)(offset / info->fix.line_length), 0);
-		int lines = min((u32)((result / info->fix.line_length) + 1),
-				(u32)info->var.yres);
-
-		ufx_handle_damage(dev, 0, start, info->var.xres, lines);
-	}
-
-	return result;
-}
-
-static void ufx_ops_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area)
-{
-
-	struct ufx_data *dev = info->par;
-
-	sys_copyarea(info, area);
-
-	ufx_handle_damage(dev, area->dx, area->dy,
-			area->width, area->height);
-}
-
-static void ufx_ops_imageblit(struct fb_info *info,
-				const struct fb_image *image)
-{
-	struct ufx_data *dev = info->par;
-
-	sys_imageblit(info, image);
-
-	ufx_handle_damage(dev, image->dx, image->dy,
-			image->width, image->height);
-}
-
-static void ufx_ops_fillrect(struct fb_info *info,
-			  const struct fb_fillrect *rect)
-{
-	struct ufx_data *dev = info->par;
-
-	sys_fillrect(info, rect);
-
-	ufx_handle_damage(dev, rect->dx, rect->dy, rect->width,
-			      rect->height);
-}
-
 /* NOTE: fb_defio.c is holding info->fbdefio.mutex
  *   Touching ANY framebuffer memory that triggers a page fault
  *   in fb_defio will cause a deadlock, when it also tries to
@@ -1279,14 +1221,31 @@ static int ufx_ops_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
+static void ufx_ops_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct ufx_data *dev = info->par;
+	int start = max((int)(off / info->fix.line_length), 0);
+	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
+
+	ufx_handle_damage(dev, 0, start, info->var.xres, lines);
+}
+
+static void ufx_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	struct ufx_data *dev = info->par;
+
+	ufx_handle_damage(dev, x, y, width, height);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(ufx_ops,
+				   ufx_ops_damage_range,
+				   ufx_ops_damage_area)
+
 static const struct fb_ops ufx_ops = {
 	.owner = THIS_MODULE,
-	.fb_read = fb_sys_read,
-	.fb_write = ufx_ops_write,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(ufx_ops),
 	.fb_setcolreg = ufx_ops_setcolreg,
-	.fb_fillrect = ufx_ops_fillrect,
-	.fb_copyarea = ufx_ops_copyarea,
-	.fb_imageblit = ufx_ops_imageblit,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(ufx_ops),
 	.fb_mmap = ufx_ops_mmap,
 	.fb_ioctl = ufx_ops_ioctl,
 	.fb_open = ufx_ops_open,
-- 
2.41.0

