Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D74CC76C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFFB10E797;
	Thu,  3 Mar 2022 20:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0BD10E7DB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:58:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9BA461F384;
 Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646341122; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz+EWuGOcCKlWNC8BpC4SVb2gqsU7CykcjXYw0GYeHs=;
 b=UDnc5xL2HKjxfEO/VBwFEuv2e7tXEFGXbB6waE86361jRzfW9/eN0cbICa6zUMm4vO0hcY
 a0fbvqCzCXOBUbo6pPLmYwDCxr2f9k783gPrd3JK5SB1G8PGhCld29IP9vpYrB8qxiKvYv
 2xoRA9o6n4+odN2GY+2QH+ZuLz+EhUU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646341122;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xz+EWuGOcCKlWNC8BpC4SVb2gqsU7CykcjXYw0GYeHs=;
 b=1D9IW2gnLLzIifygDyWQGH6khUFAfSpjtmYjp44afBSulpPiCpMQnJOpm3pc7MBKkna69F
 x8xFghfciN/yZVAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69D1513AEE;
 Thu,  3 Mar 2022 20:58:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8ErUGAIsIWJoHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 20:58:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, deller@gmx.de, javierm@redhat.com
Subject: [PATCH 5/9] drm/fb-helper: Separate deferred I/O from shadow buffers
Date: Thu,  3 Mar 2022 21:58:35 +0100
Message-Id: <20220303205839.28484-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303205839.28484-1-tzimmermann@suse.de>
References: <20220303205839.28484-1-tzimmermann@suse.de>
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

DRM drivers will be able to handle deferred I/O by themselves. So
a driver will be able to use deferred I/O without an intermediate
shadow buffer.

Prepare fbdev emulation by separating shadow buffers and deferred
I/O from each other.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 35 ++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index dd1d72d58b35..660ec5038c4e 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -660,6 +660,19 @@ static bool drm_fbdev_use_shadow_fb(struct drm_fb_helper *fb_helper)
 	       fb->funcs->dirty;
 }
 
+static bool drm_fbdev_use_deferred_io(struct drm_fb_helper *fb_helper)
+{
+	struct drm_framebuffer *fb = fb_helper->fb;
+
+	/*
+	 * Any driver with damage handling requires deferred I/O to
+	 * keep track of the updated screen areas. Drivers with shadow
+	 * buffers need deferred I/O to forward screen updates to the
+	 * buffer object.
+	 */
+	return fb->funcs->dirty || drm_fbdev_use_shadow_fb(fb_helper);
+}
+
 static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 				 u32 width, u32 height)
 {
@@ -667,7 +680,7 @@ static void drm_fb_helper_damage(struct fb_info *info, u32 x, u32 y,
 	struct drm_clip_rect *clip = &helper->damage_clip;
 	unsigned long flags;
 
-	if (!drm_fbdev_use_shadow_fb(helper))
+	if (!drm_fbdev_use_deferred_io(helper))
 		return;
 
 	spin_lock_irqsave(&helper->damage_lock, flags);
@@ -2119,8 +2132,16 @@ static int drm_fbdev_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct drm_fb_helper *fb_helper = info->par;
 
 	if (drm_fbdev_use_shadow_fb(fb_helper))
+		/*
+		 * Drivers with shadow buffer use fbdev's implementation of
+		 * deferred I/O.
+		 */
 		return fb_deferred_io_mmap(info, vma);
 	else if (fb_helper->dev->driver->gem_prime_mmap)
+		/*
+		 * Either directly mmap'ed or with deferred I/O; drivers
+		 * without shadow buffer handle mmap themselves.
+		 */
 		return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
 	else
 		return -ENODEV;
@@ -2131,7 +2152,9 @@ static bool drm_fbdev_use_iomem(struct fb_info *info)
 	struct drm_fb_helper *fb_helper = info->par;
 	struct drm_client_buffer *buffer = fb_helper->buffer;
 
-	return !drm_fbdev_use_shadow_fb(fb_helper) && buffer->map.is_iomem;
+	if (drm_fbdev_use_shadow_fb(fb_helper))
+		return false;
+	return buffer->map.is_iomem;
 }
 
 static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
@@ -2396,9 +2419,6 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 		if (!fbi->screen_buffer)
 			return -ENOMEM;
 		fbi->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-
-		fbi->fbdefio = &drm_fbdev_defio;
-		fb_deferred_io_init(fbi);
 	} else {
 		/* buffer is mapped for HW framebuffer */
 		ret = drm_client_buffer_vmap(fb_helper->buffer, &map);
@@ -2424,6 +2444,11 @@ static int drm_fb_helper_generic_probe(struct drm_fb_helper *fb_helper,
 #endif
 	}
 
+	if (drm_fbdev_use_deferred_io(fb_helper)) {
+		fbi->fbdefio = &drm_fbdev_defio;
+		fb_deferred_io_init(fbi);
+	}
+
 	return 0;
 }
 
-- 
2.35.1

