Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E236BB951
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 17:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E65710EB4B;
	Wed, 15 Mar 2023 16:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481FB10E97C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 16:14:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BEF14219D3;
 Wed, 15 Mar 2023 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1678896884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbTADgv5f+ZEladv28RtQJnaTsz/F2C6EOsmEJjSkPk=;
 b=1n/BUqphpp74UnU+F3gZJm/DYIEDJ/M31s0Bp/z+DMqbCAmrPDhAcjPnEMJ+vIle2Uzlqg
 5l2DDVEYv6HuldK85ZhPKkx/42cSgn7wCI29Qj6DQ3WqTlit7+jam+bYiVyXAZ+w3r7ntq
 xtjZA/aI/EeYNRnlyQ38IpgmRZ442f8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1678896884;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbTADgv5f+ZEladv28RtQJnaTsz/F2C6EOsmEJjSkPk=;
 b=L0HMWm2/Iylvc8KB8E1rQ67CHbG32F7YCC/bOSnhwftXq8MHmQ5bowQRpGvcCRh9JMI9rU
 9o72guIT721XFVDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 827EB13A7A;
 Wed, 15 Mar 2023 16:14:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0JTqHvTuEWTrAwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Mar 2023 16:14:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH 4/6] drm/fbdev-generic: Clean up after failed probing
Date: Wed, 15 Mar 2023 17:14:40 +0100
Message-Id: <20230315161442.27318-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315161442.27318-1-tzimmermann@suse.de>
References: <20230315161442.27318-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clean up fbdev and client state if the probe function fails. It
used to leak allocated resources. Also reorder the individual steps
to simplify cleanup.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 46 ++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index e48a8e82378d..0d08ddbe9608 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -7,6 +7,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include <drm/drm_fbdev_generic.h>
@@ -74,8 +75,9 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_client_buffer *buffer;
-	struct drm_framebuffer *fb;
 	struct fb_info *info;
+	size_t screen_size;
+	void *screen_buffer;
 	u32 format;
 	int ret;
 
@@ -91,36 +93,52 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 
 	fb_helper->buffer = buffer;
 	fb_helper->fb = buffer->fb;
-	fb = buffer->fb;
+
+	screen_size = buffer->gem->size;
+	screen_buffer = vzalloc(screen_size);
+	if (!screen_buffer) {
+		ret = -ENOMEM;
+		goto err_drm_client_framebuffer_delete;
+	}
 
 	info = drm_fb_helper_alloc_info(fb_helper);
-	if (IS_ERR(info))
-		return PTR_ERR(info);
+	if (IS_ERR(info)) {
+		ret = PTR_ERR(info);
+		goto err_vfree;
+	}
+
+	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
 	info->fbops = &drm_fbdev_fb_ops;
-	info->screen_size = sizes->surface_height * fb->pitches[0];
-	info->fix.smem_len = info->screen_size;
 	info->flags = FBINFO_DEFAULT;
 
-	drm_fb_helper_fill_info(info, fb_helper, sizes);
-
-	info->screen_buffer = vzalloc(info->screen_size);
-	if (!info->screen_buffer)
-		return -ENOMEM;
+	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-
+	info->screen_size = screen_size;
+	info->screen_buffer = screen_buffer;
 	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
+	info->fix.smem_len = info->screen_size;
 
-	/* Set a default deferred I/O handler */
+	/* deferred I/O */
 	fb_helper->fbdefio.delay = HZ / 20;
 	fb_helper->fbdefio.deferred_io = drm_fb_helper_deferred_io;
 
 	info->fbdefio = &fb_helper->fbdefio;
 	ret = fb_deferred_io_init(info);
 	if (ret)
-		return ret;
+		goto err_drm_fb_helper_release_info;
 
 	return 0;
+
+err_drm_fb_helper_release_info:
+	drm_fb_helper_release_info(fb_helper);
+err_vfree:
+	vfree(screen_buffer);
+err_drm_client_framebuffer_delete:
+	fb_helper->fb = NULL;
+	fb_helper->buffer = NULL;
+	drm_client_framebuffer_delete(buffer);
+	return ret;
 }
 
 static void drm_fbdev_damage_blit_real(struct drm_fb_helper *fb_helper,
-- 
2.39.2

