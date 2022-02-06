Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529494AB1AA
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A4D10E241;
	Sun,  6 Feb 2022 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817D710E241
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:29:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 182EB210F0;
 Sun,  6 Feb 2022 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644175780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aE0WfX1J1NvBNCGniqikmYmuiPKDTkt+WqGxa9i5B0=;
 b=aAHSkSvEGjSS8hOfAY/pSPLuCUWwhd7nLADEzrVq4VG0c/xoUa7a/FE6XcHIM3wTzEglPt
 L8Qu8Xy0SyADfZ7GH1gATo02buicLkuXTWvapLTuzLmXsJB92sSA+whMqQXrEANKlzejkx
 mZv4ROf4vZoBc6FN4eQXVC8Yzic/Jyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644175780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+aE0WfX1J1NvBNCGniqikmYmuiPKDTkt+WqGxa9i5B0=;
 b=jhcaZUZreRAoo8lWy7aDMK0xx619Oxkm4BuiL0dj42qkleDiefaDIHkgXTQSEgpaAhtsRL
 Y0ESsQPxK6XfRVDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CF9B3139EF;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YHJlMaMhAGLlJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Feb 2022 19:29:39 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 4/5] drm/fb-helper: Clip damage area to written memory range
Date: Sun,  6 Feb 2022 20:29:34 +0100
Message-Id: <20220206192935.24645-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220206192935.24645-1-tzimmermann@suse.de>
References: <20220206192935.24645-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Write helpers used to mark the complete screen as dirty. This is
wasteful for writes that only change a small portion of the screen.
Fix the problem by computing the damaged area from the written
memory range and perform damage handling accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index ae98990c7b66..bed58be1b205 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -754,11 +754,18 @@ EXPORT_SYMBOL(drm_fb_helper_sys_read);
 ssize_t drm_fb_helper_sys_write(struct fb_info *info, const char __user *buf,
 				size_t count, loff_t *ppos)
 {
+	loff_t pos = *ppos;
 	ssize_t ret;
+	struct drm_rect damage_area;
 
 	ret = fb_sys_write(info, buf, count, ppos);
-	if (ret > 0)
-		drm_fb_helper_damage(info, 0, 0, info->var.xres, info->var.yres);
+	if (ret <= 0)
+		return ret;
+
+	drm_fb_helper_clip_to_memory_range(info, pos, ret, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
 
 	return ret;
 }
@@ -2237,6 +2244,7 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 	loff_t pos = *ppos;
 	size_t total_size;
 	ssize_t ret;
+	struct drm_rect damage_area;
 	int err = 0;
 
 	if (info->screen_size)
@@ -2265,13 +2273,19 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *info, const char __user *buf,
 	else
 		ret = fb_write_screen_buffer(info, buf, count, pos);
 
-	if (ret > 0)
-		*ppos += ret;
+	if (ret < 0)
+		return ret; /* return last error, if any */
+	else if (!ret)
+		return err; /* return previous error, if any */
 
-	if (ret > 0)
-		drm_fb_helper_damage(info, 0, 0, info->var.xres_virtual, info->var.yres_virtual);
+	*ppos += ret;
 
-	return ret ? ret : err;
+	drm_fb_helper_clip_to_memory_range(info, pos, ret, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+
+	return ret;
 }
 
 static void drm_fbdev_fb_fillrect(struct fb_info *info,
-- 
2.34.1

