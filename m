Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDDD6C16A1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334EB10E1C0;
	Mon, 20 Mar 2023 15:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A21A10E00C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C141A1F894;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324874; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqwli5v2zHnqsLMb/1Vpyr1bNtttt0sBI50GKZI7Vdg=;
 b=pSVQ7jh6T12rDZOx45NAbtjwV6PtkP0pcJyyjyrALle82z4HQ4OUkCLRWcctnvM0dNTmBo
 +iSN5xsIux3uZF0it3kgQ5QQbriudJvnI33tV5RMywGDAnB4yLjPerYVEXAemBJ+zhkN/c
 dlZEqXM5F2SXZSh80jE+CJcLcaryNxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324874;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lqwli5v2zHnqsLMb/1Vpyr1bNtttt0sBI50GKZI7Vdg=;
 b=VuDGNPbup7WiyYi99L+ad71kQYYi62q0H/I6yF3kOsRuajP+SBd0OtkCUG2iXOPl7RdFwW
 c2r5KCI7Wem//OCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87D6D13A2F;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IBJEIMp2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 5/8] drm/fbdev-generic: Set screen size to size of GEM
 buffer
Date: Mon, 20 Mar 2023 16:07:48 +0100
Message-Id: <20230320150751.20399-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230320150751.20399-1-tzimmermann@suse.de>
References: <20230320150751.20399-1-tzimmermann@suse.de>
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

The size of the screen memory should be equivalent to the size of
the screen's GEM buffer. Don't recalculate the value.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index e48a8e82378d..73834a3cc6b0 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -7,6 +7,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include <drm/drm_fbdev_generic.h>
@@ -74,8 +75,8 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_client_buffer *buffer;
-	struct drm_framebuffer *fb;
 	struct fb_info *info;
+	size_t screen_size;
 	u32 format;
 	int ret;
 
@@ -91,20 +92,20 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 
 	fb_helper->buffer = buffer;
 	fb_helper->fb = buffer->fb;
-	fb = buffer->fb;
+	screen_size = buffer->gem->size;
 
 	info = drm_fb_helper_alloc_info(fb_helper);
 	if (IS_ERR(info))
 		return PTR_ERR(info);
 
 	info->fbops = &drm_fbdev_fb_ops;
-	info->screen_size = sizes->surface_height * fb->pitches[0];
-	info->fix.smem_len = info->screen_size;
+	info->screen_size = screen_size;
+	info->fix.smem_len = screen_size;
 	info->flags = FBINFO_DEFAULT;
 
 	drm_fb_helper_fill_info(info, fb_helper, sizes);
 
-	info->screen_buffer = vzalloc(info->screen_size);
+	info->screen_buffer = vzalloc(screen_size);
 	if (!info->screen_buffer)
 		return -ENOMEM;
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-- 
2.40.0

