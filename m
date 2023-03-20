Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164C6C16B3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:08:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B137710E586;
	Mon, 20 Mar 2023 15:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75AD510E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 15:07:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 094E221AD2;
 Mon, 20 Mar 2023 15:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679324875; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNvG15Q952Ad44DsKZLXnoyoh4oOpFvzAPicGCV6u0=;
 b=ivfOL9K1vs6U2z9fT05EHYDNFKn+n9mU/Hey/FqTEFCmTYnHm/F4KVkb4D7pOGYlLyYr/Y
 PJk+3jEwbofX6lVzH1JoCyJCyzLuJASg4Lb2l/cGqwQfefF7N+jDkL3VaabDwMpACHaAtP
 PDBiaNQDAraH8x1OAexn/7g2pSFiEjg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679324875;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pCNvG15Q952Ad44DsKZLXnoyoh4oOpFvzAPicGCV6u0=;
 b=naJRwvqJgwOg6PhSNWR6ic6ak1BWq8rtsEmKTEnNNrcCaTAjEuQnxqYtd46mF3i9ySNzEf
 gaqN9rIGdfZcarAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4B3C13A00;
 Mon, 20 Mar 2023 15:07:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AAkdL8p2GGTXOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Mar 2023 15:07:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2 6/8] drm/fbdev-generic: Clean up after failed probing
Date: Mon, 20 Mar 2023 16:07:49 +0100
Message-Id: <20230320150751.20399-7-tzimmermann@suse.de>
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

Clean up fbdev and client state if the probe function fails. It
used to leak allocated resources. Also reorder the individual steps
to simplify cleanup.

v2:
	* move screen_size update into separate patches

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/drm_fbdev_generic.c | 40 ++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_fbdev_generic.c b/drivers/gpu/drm/drm_fbdev_generic.c
index 73834a3cc6b0..e7eeba0c44b4 100644
--- a/drivers/gpu/drm/drm_fbdev_generic.c
+++ b/drivers/gpu/drm/drm_fbdev_generic.c
@@ -77,6 +77,7 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 	struct drm_client_buffer *buffer;
 	struct fb_info *info;
 	size_t screen_size;
+	void *screen_buffer;
 	u32 format;
 	int ret;
 
@@ -92,36 +93,51 @@ static int drm_fbdev_fb_probe(struct drm_fb_helper *fb_helper,
 
 	fb_helper->buffer = buffer;
 	fb_helper->fb = buffer->fb;
+
 	screen_size = buffer->gem->size;
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
-	info->screen_size = screen_size;
-	info->fix.smem_len = screen_size;
 	info->flags = FBINFO_DEFAULT;
 
-	drm_fb_helper_fill_info(info, fb_helper, sizes);
-
-	info->screen_buffer = vzalloc(screen_size);
-	if (!info->screen_buffer)
-		return -ENOMEM;
+	/* screen */
 	info->flags |= FBINFO_VIRTFB | FBINFO_READS_FAST;
-
+	info->screen_buffer = screen_buffer;
 	info->fix.smem_start = page_to_phys(vmalloc_to_page(info->screen_buffer));
+	info->fix.smem_len = screen_size;
 
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
2.40.0

