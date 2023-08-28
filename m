Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA9378B182
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E12010E2D4;
	Mon, 28 Aug 2023 13:21:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26FC10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A6E21FD60;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEjIfU5qkBkLS6zCELI50VsWPShlN/pL6jvMkczxRoU=;
 b=LT2rFmi1XWFhXlVBekdYnBO4HjgbLNLN27jqTKW3v6l05aOeqA5R5TpJ2vC7zXWBJw2Gt1
 qlKVa9noO6GN9/Pc8zIfE+vPsiQXMqpdUE0IL3ipJWGkEOw7ElJnWhmGWBxzN1P5r82mjH
 UUvpntqPuA+PV61KXCBWyrpJ732HHKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SEjIfU5qkBkLS6zCELI50VsWPShlN/pL6jvMkczxRoU=;
 b=Q6E7Oj5b9gd6mmeJUJYGRCsRKQFlT8CC+/Ap3Hu7rBLJJfdk5NNwxZOX+tN4ezXjugxNWZ
 GUKWv3LadH1XexBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F09013A1C;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EKZkEl+f7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
Date: Mon, 28 Aug 2023 15:14:18 +0200
Message-ID: <20230828132131.29295-3-tzimmermann@suse.de>
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
 Bernie Thompson <bernie@plugable.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Generate callback functions for struct fb_ops with the fbdev macro
FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(). Initialize struct fb_ops to
the generated functions with fbdev initializer macros.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Bernie Thompson <bernie@plugable.com>
---
 drivers/video/fbdev/udlfb.c | 89 +++++++++----------------------------
 1 file changed, 22 insertions(+), 67 deletions(-)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index b70762ead13c..2460ff4ac86b 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -715,68 +715,6 @@ static void dlfb_offload_damage(struct dlfb_data *dlfb, int x, int y, int width,
 	schedule_work(&dlfb->damage_work);
 }
 
-/*
- * Path triggered by usermode clients who write to filesystem
- * e.g. cat filename > /dev/fb1
- * Not used by X Windows or text-mode console. But useful for testing.
- * Slow because of extra copy and we must assume all pixels dirty.
- */
-static ssize_t dlfb_ops_write(struct fb_info *info, const char __user *buf,
-			  size_t count, loff_t *ppos)
-{
-	ssize_t result;
-	struct dlfb_data *dlfb = info->par;
-	u32 offset = (u32) *ppos;
-
-	result = fb_sys_write(info, buf, count, ppos);
-
-	if (result > 0) {
-		int start = max((int)(offset / info->fix.line_length), 0);
-		int lines = min((u32)((result / info->fix.line_length) + 1),
-				(u32)info->var.yres);
-
-		dlfb_handle_damage(dlfb, 0, start, info->var.xres,
-			lines);
-	}
-
-	return result;
-}
-
-/* hardware has native COPY command (see libdlo), but not worth it for fbcon */
-static void dlfb_ops_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area)
-{
-
-	struct dlfb_data *dlfb = info->par;
-
-	sys_copyarea(info, area);
-
-	dlfb_offload_damage(dlfb, area->dx, area->dy,
-			area->width, area->height);
-}
-
-static void dlfb_ops_imageblit(struct fb_info *info,
-				const struct fb_image *image)
-{
-	struct dlfb_data *dlfb = info->par;
-
-	sys_imageblit(info, image);
-
-	dlfb_offload_damage(dlfb, image->dx, image->dy,
-			image->width, image->height);
-}
-
-static void dlfb_ops_fillrect(struct fb_info *info,
-			  const struct fb_fillrect *rect)
-{
-	struct dlfb_data *dlfb = info->par;
-
-	sys_fillrect(info, rect);
-
-	dlfb_offload_damage(dlfb, rect->dx, rect->dy, rect->width,
-			      rect->height);
-}
-
 /*
  * NOTE: fb_defio.c is holding info->fbdefio.mutex
  *   Touching ANY framebuffer memory that triggers a page fault
@@ -1186,14 +1124,31 @@ static int dlfb_ops_blank(int blank_mode, struct fb_info *info)
 	return 0;
 }
 
+static void dlfb_ops_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct dlfb_data *dlfb = info->par;
+	int start = max((int)(off / info->fix.line_length), 0);
+	int lines = min((u32)((len / info->fix.line_length) + 1), (u32)info->var.yres);
+
+	dlfb_handle_damage(dlfb, 0, start, info->var.xres, lines);
+}
+
+static void dlfb_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	struct dlfb_data *dlfb = info->par;
+
+	dlfb_offload_damage(dlfb, x, y, width, height);
+}
+
+FB_GEN_DEFAULT_DEFERRED_SYSMEM_OPS(dlfb_ops,
+				   dlfb_ops_damage_range,
+				   dlfb_ops_damage_area)
+
 static const struct fb_ops dlfb_ops = {
 	.owner = THIS_MODULE,
-	.fb_read = fb_sys_read,
-	.fb_write = dlfb_ops_write,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(dlfb_ops),
 	.fb_setcolreg = dlfb_ops_setcolreg,
-	.fb_fillrect = dlfb_ops_fillrect,
-	.fb_copyarea = dlfb_ops_copyarea,
-	.fb_imageblit = dlfb_ops_imageblit,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(dlfb_ops),
 	.fb_mmap = dlfb_ops_mmap,
 	.fb_ioctl = dlfb_ops_ioctl,
 	.fb_open = dlfb_ops_open,
-- 
2.41.0

