Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 815FEBF209E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128110E46F;
	Mon, 20 Oct 2025 15:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180610E46E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B73A1F443;
 Mon, 20 Oct 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1FFAE13AEB;
 Mon, 20 Oct 2025 15:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GMxgBtFR9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 5/7] drm/client: Remove drm_client_framebuffer_delete()
Date: Mon, 20 Oct 2025 17:04:21 +0200
Message-ID: <20251020151402.53013-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020151402.53013-1-tzimmermann@suse.de>
References: <20251020151402.53013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: 5B73A1F443
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Release client buffers with drm_client_buffer_delete() instead of
drm_client_framebuffer_delete(). The latter is just a tiny wrapper
around the former.

Move the test for !buffer into drm_client_buffer_delete(), although
all callers appear to always have a valid pointer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c |  4 ++--
 drivers/gpu/drm/drm_client.c      | 25 ++++++++++---------------
 drivers/gpu/drm/drm_fbdev_dma.c   |  6 +++---
 drivers/gpu/drm/drm_fbdev_shmem.c |  4 ++--
 drivers/gpu/drm/drm_fbdev_ttm.c   |  8 ++++----
 include/drm/drm_client.h          |  2 +-
 6 files changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index fd8556dd58ed..2d748ab318fe 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -272,7 +272,7 @@ static void drm_log_init_client(struct drm_log *dlog)
 
 err_failed_commit:
 	for (i = 0; i < n_modeset; i++)
-		drm_client_framebuffer_delete(dlog->scanout[i].buffer);
+		drm_client_buffer_delete(dlog->scanout[i].buffer);
 
 err_nomodeset:
 	kfree(dlog->scanout);
@@ -286,7 +286,7 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
 
 	if (dlog->n_scanout) {
 		for (i = 0; i < dlog->n_scanout; i++)
-			drm_client_framebuffer_delete(dlog->scanout[i].buffer);
+			drm_client_buffer_delete(dlog->scanout[i].buffer);
 		dlog->n_scanout = 0;
 		kfree(dlog->scanout);
 		dlog->scanout = NULL;
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 29ed5f55b5f9..d4c424ff44a9 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -173,11 +173,18 @@ void drm_client_release(struct drm_client_dev *client)
 }
 EXPORT_SYMBOL(drm_client_release);
 
-static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
+/**
+ * drm_client_buffer_delete - Delete a client buffer
+ * @buffer: DRM client buffer
+ */
+void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
 	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
 	int ret;
 
+	if (!buffer)
+		return;
+
 	drm_gem_vunmap(gem, &buffer->map);
 
 	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
@@ -189,6 +196,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 
 	kfree(buffer);
 }
+EXPORT_SYMBOL(drm_client_buffer_delete);
 
 static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
@@ -372,7 +380,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
  *
  * This function creates a &drm_client_buffer which consists of a
  * &drm_framebuffer backed by a dumb buffer.
- * Call drm_client_framebuffer_delete() to free the buffer.
+ * Call drm_client_buffer_delete() to free the buffer.
  *
  * Returns:
  * Pointer to a client buffer or an error pointer on failure.
@@ -416,19 +424,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 }
 EXPORT_SYMBOL(drm_client_framebuffer_create);
 
-/**
- * drm_client_framebuffer_delete - Delete a client framebuffer
- * @buffer: DRM client buffer (can be NULL)
- */
-void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
-{
-	if (!buffer)
-		return;
-
-	drm_client_buffer_delete(buffer);
-}
-EXPORT_SYMBOL(drm_client_framebuffer_delete);
-
 /**
  * drm_client_framebuffer_flush - Manually flush client framebuffer
  * @buffer: DRM client buffer (can be NULL)
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 8bd626ef16c7..17fef288e86b 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -55,7 +55,7 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 	drm_fb_helper_fini(fb_helper);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 	drm_fb_helper_unprepare(fb_helper);
 	kfree(fb_helper);
@@ -90,7 +90,7 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb_info *info)
 	vfree(shadow);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 	drm_fb_helper_unprepare(fb_helper);
 	kfree(fb_helper);
@@ -328,7 +328,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = NULL;
 	drm_client_buffer_vunmap(buffer);
 err_drm_client_buffer_delete:
-	drm_client_framebuffer_delete(buffer);
+	drm_client_buffer_delete(buffer);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_dma_driver_fbdev_probe);
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 1e827bf8b815..f7966b8c51cd 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -63,7 +63,7 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
 	drm_fb_helper_fini(fb_helper);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 	drm_fb_helper_unprepare(fb_helper);
 	kfree(fb_helper);
@@ -206,7 +206,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = NULL;
 	drm_client_buffer_vunmap(buffer);
 err_drm_client_buffer_delete:
-	drm_client_framebuffer_delete(buffer);
+	drm_client_buffer_delete(buffer);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_shmem_driver_fbdev_probe);
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 85feb55bba11..54f9a46b96c2 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -50,7 +50,7 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
 	fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(fb_helper);
 	vfree(shadow);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 
 	drm_client_release(&fb_helper->client);
 	drm_fb_helper_unprepare(fb_helper);
@@ -202,7 +202,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	screen_buffer = vzalloc(screen_size);
 	if (!screen_buffer) {
 		ret = -ENOMEM;
-		goto err_drm_client_framebuffer_delete;
+		goto err_drm_client_buffer_delete;
 	}
 
 	info = drm_fb_helper_alloc_info(fb_helper);
@@ -235,10 +235,10 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	drm_fb_helper_release_info(fb_helper);
 err_vfree:
 	vfree(screen_buffer);
-err_drm_client_framebuffer_delete:
+err_drm_client_buffer_delete:
 	fb_helper->fb = NULL;
 	fb_helper->buffer = NULL;
-	drm_client_framebuffer_delete(buffer);
+	drm_client_buffer_delete(buffer);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_ttm_driver_fbdev_probe);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 5909664d4d43..6019f2712448 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -185,7 +185,7 @@ struct drm_client_buffer {
 
 struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
-void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
+void drm_client_buffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy);
-- 
2.51.0

