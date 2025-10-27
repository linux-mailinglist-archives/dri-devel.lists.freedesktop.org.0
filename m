Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45CC0D6B3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B3E10E463;
	Mon, 27 Oct 2025 12:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="c+8oLz8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bXQsDRpA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="c+8oLz8C";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bXQsDRpA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD27E10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:11:08 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 660E91F457;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdmbXtQ27gr6mMovthDS+C+O3kfjIsY5nQFn1r36Sok=;
 b=c+8oLz8CiQ51Oan1dgMs+/cwKtXAyr21dmvkgPRuK5HL3bL4Tg4PmxSYozelpycMf8FRmS
 P3HvMwwdjqpATbb1piIJqLb/cfHph8rTxl2Ow8QP4zdo188uC/4IFW4Ef6xCpe1Y7uC2ai
 FNiUK8+QmJFXWZKVUgoAtgrogFCFJ5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdmbXtQ27gr6mMovthDS+C+O3kfjIsY5nQFn1r36Sok=;
 b=bXQsDRpAm9I6tJJVKR4rIiM0GDLjA1vZLjXceg/JC12kmZLkSNlpElTDRpYXF7lbTN8kUI
 KHvvG+KKMaFyjZAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdmbXtQ27gr6mMovthDS+C+O3kfjIsY5nQFn1r36Sok=;
 b=c+8oLz8CiQ51Oan1dgMs+/cwKtXAyr21dmvkgPRuK5HL3bL4Tg4PmxSYozelpycMf8FRmS
 P3HvMwwdjqpATbb1piIJqLb/cfHph8rTxl2Ow8QP4zdo188uC/4IFW4Ef6xCpe1Y7uC2ai
 FNiUK8+QmJFXWZKVUgoAtgrogFCFJ5s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdmbXtQ27gr6mMovthDS+C+O3kfjIsY5nQFn1r36Sok=;
 b=bXQsDRpAm9I6tJJVKR4rIiM0GDLjA1vZLjXceg/JC12kmZLkSNlpElTDRpYXF7lbTN8kUI
 KHvvG+KKMaFyjZAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2886213693;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6J+wCExh/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/7] drm/client: Remove drm_client_framebuffer_delete()
Date: Mon, 27 Oct 2025 13:09:16 +0100
Message-ID: <20251027121042.143588-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -2.80
X-Spam-Level: 
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

v2:
- test for !buffer before deref-ing pointer (Jocelyn, Dan)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/clients/drm_log.c |  4 ++--
 drivers/gpu/drm/drm_client.c      | 28 ++++++++++++----------------
 drivers/gpu/drm/drm_fbdev_dma.c   |  6 +++---
 drivers/gpu/drm/drm_fbdev_shmem.c |  4 ++--
 drivers/gpu/drm/drm_fbdev_ttm.c   |  8 ++++----
 include/drm/drm_client.h          |  2 +-
 6 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 24b08fdcb57a..c2ddc57b538e 100644
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
index 0aa56c4b912b..b4e37bb2041b 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -177,11 +177,19 @@ void drm_client_release(struct drm_client_dev *client)
 }
 EXPORT_SYMBOL(drm_client_release);
 
-static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
+/**
+ * drm_client_buffer_delete - Delete a client buffer
+ * @buffer: DRM client buffer
+ */
+void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
-	struct drm_gem_object *gem = buffer->fb->obj[0];
+	struct drm_gem_object *gem;
 	int ret;
 
+	if (!buffer)
+		return;
+
+	gem = buffer->fb->obj[0];
 	drm_gem_vunmap(gem, &buffer->map);
 
 	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
@@ -193,6 +201,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 
 	kfree(buffer);
 }
+EXPORT_SYMBOL(drm_client_buffer_delete);
 
 static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
@@ -376,7 +385,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
  *
  * This function creates a &drm_client_buffer which consists of a
  * &drm_framebuffer backed by a dumb buffer.
- * Call drm_client_framebuffer_delete() to free the buffer.
+ * Call drm_client_buffer_delete() to free the buffer.
  *
  * Returns:
  * Pointer to a client buffer or an error pointer on failure.
@@ -420,19 +429,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
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
index c6196293e424..6216de1446c1 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -55,7 +55,7 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 	drm_fb_helper_fini(fb_helper);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 }
 
@@ -88,7 +88,7 @@ static void drm_fbdev_dma_shadowed_fb_destroy(struct fb_info *info)
 	vfree(shadow);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 }
 
@@ -324,7 +324,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = NULL;
 	drm_client_buffer_vunmap(buffer);
 err_drm_client_buffer_delete:
-	drm_client_framebuffer_delete(buffer);
+	drm_client_buffer_delete(buffer);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_dma_driver_fbdev_probe);
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 51573058df6f..520c2218e5dc 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -63,7 +63,7 @@ static void drm_fbdev_shmem_fb_destroy(struct fb_info *info)
 	drm_fb_helper_fini(fb_helper);
 
 	drm_client_buffer_vunmap(fb_helper->buffer);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 	drm_client_release(&fb_helper->client);
 }
 
@@ -204,7 +204,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	fb_helper->buffer = NULL;
 	drm_client_buffer_vunmap(buffer);
 err_drm_client_buffer_delete:
-	drm_client_framebuffer_delete(buffer);
+	drm_client_buffer_delete(buffer);
 	return ret;
 }
 EXPORT_SYMBOL(drm_fbdev_shmem_driver_fbdev_probe);
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index ccf460fbc1f0..7f7c88461228 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -50,7 +50,7 @@ static void drm_fbdev_ttm_fb_destroy(struct fb_info *info)
 	fb_deferred_io_cleanup(info);
 	drm_fb_helper_fini(fb_helper);
 	vfree(shadow);
-	drm_client_framebuffer_delete(fb_helper->buffer);
+	drm_client_buffer_delete(fb_helper->buffer);
 
 	drm_client_release(&fb_helper->client);
 }
@@ -200,7 +200,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 	screen_buffer = vzalloc(screen_size);
 	if (!screen_buffer) {
 		ret = -ENOMEM;
-		goto err_drm_client_framebuffer_delete;
+		goto err_drm_client_buffer_delete;
 	}
 
 	info = drm_fb_helper_alloc_info(fb_helper);
@@ -233,10 +233,10 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
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
index b01fc2a21f09..ffc4013b2e18 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -195,7 +195,7 @@ struct drm_client_buffer {
 
 struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
-void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
+void drm_client_buffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy);
-- 
2.51.1

