Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9458F4AF64F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 17:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC5F68996E;
	Wed,  9 Feb 2022 16:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A609F898A7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 16:16:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 287E32110B;
 Wed,  9 Feb 2022 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644423381; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Apgvh7dttE8egy+eHGh0K3Is6gG+TM+jzT0jXLUMMY=;
 b=zhOdIfbfD89hZ1YVrFF1TH2yv9BZenhNR9X5baeKtDGVkLDfzdUE2O0JMEARq3VyPahzI4
 ZaJSH+8NKIKwClPe1To5JHIAlOuMH95XNSODuwEDmdCPSWht6TIXYXrUzIwv6S9a3XTzgi
 CiFRfKCqWljwy1pfbtvd3x8JPthx/4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644423381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Apgvh7dttE8egy+eHGh0K3Is6gG+TM+jzT0jXLUMMY=;
 b=m6p/+7ZFfQzX5wkB+FAlGkMubEBrfh430g7HqsOxcsxRKWJSHMoazCgXrgE94p1f6Mxiq6
 rgpxHjOktKV1PeBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EB7B113B0C;
 Wed,  9 Feb 2022 16:16:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0OSUONToA2KfJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 16:16:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH v2 4/5] drm/fb-helper: Clip damage area to written memory range
Date: Wed,  9 Feb 2022 17:16:16 +0100
Message-Id: <20220209161617.3553-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209161617.3553-1-tzimmermann@suse.de>
References: <20220209161617.3553-1-tzimmermann@suse.de>
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
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 3d6d0b1464e7..4d5410dd96c5 100644
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
+	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
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
+	drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
+	drm_fb_helper_damage(info, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+
+	return ret;
 }
 
 static void drm_fbdev_fb_fillrect(struct fb_info *info,
-- 
2.34.1

