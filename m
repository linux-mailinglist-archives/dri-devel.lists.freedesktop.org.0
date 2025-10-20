Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E6BF2092
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEEC10E468;
	Mon, 20 Oct 2025 15:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACFE10E46C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69CC321175;
 Mon, 20 Oct 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A5D6813B03;
 Mon, 20 Oct 2025 15:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CPBJJ9FR9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 7/7] drm/client: Flush client buffers with
 drm_client_buffer_sync()
Date: Mon, 20 Oct 2025 17:04:23 +0200
Message-ID: <20251020151402.53013-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020151402.53013-1-tzimmermann@suse.de>
References: <20251020151402.53013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 69CC321175
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Rename drm_client_framebuffer_flush() to drm_cient_buffer_flush() and
adapt its callers. The old name was left over from previous naming
conventions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 4 ++--
 drivers/gpu/drm/drm_client.c      | 8 ++++----
 include/drm/drm_client.h          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index b8fb9ee9fcf0..3d4174c0d344 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -100,7 +100,7 @@ static void drm_log_clear_line(struct drm_log_scanout *scanout, u32 line)
 		return;
 	iosys_map_memset(&map, r.y1 * fb->pitches[0], 0, height * fb->pitches[0]);
 	drm_client_buffer_vunmap_local(scanout->buffer);
-	drm_client_framebuffer_flush(scanout->buffer, &r);
+	drm_client_buffer_flush(scanout->buffer, &r);
 }
 
 static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
@@ -133,7 +133,7 @@ static void drm_log_draw_line(struct drm_log_scanout *scanout, const char *s,
 	if (scanout->line >= scanout->rows)
 		scanout->line = 0;
 	drm_client_buffer_vunmap_local(scanout->buffer);
-	drm_client_framebuffer_flush(scanout->buffer, &r);
+	drm_client_buffer_flush(scanout->buffer, &r);
 }
 
 static void drm_log_draw_new_line(struct drm_log_scanout *scanout,
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 9105a0b5f468..1f1e73d3b026 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -425,8 +425,8 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
 EXPORT_SYMBOL(drm_client_buffer_create_dumb);
 
 /**
- * drm_client_framebuffer_flush - Manually flush client framebuffer
- * @buffer: DRM client buffer (can be NULL)
+ * drm_client_buffer_flush - Manually flush client buffer
+ * @buffer: DRM client buffer
  * @rect: Damage rectangle (if NULL flushes all)
  *
  * This calls &drm_framebuffer_funcs->dirty (if present) to flush buffer changes
@@ -435,7 +435,7 @@ EXPORT_SYMBOL(drm_client_buffer_create_dumb);
  * Returns:
  * Zero on success or negative error code on failure.
  */
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
+int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect)
 {
 	if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
 		return 0;
@@ -455,4 +455,4 @@ int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_re
 	return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
 					0, 0, NULL, 0);
 }
-EXPORT_SYMBOL(drm_client_framebuffer_flush);
+EXPORT_SYMBOL(drm_client_buffer_flush);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index e4df404a9645..eab4a51f8e79 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -186,7 +186,7 @@ struct drm_client_buffer {
 struct drm_client_buffer *
 drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_buffer_delete(struct drm_client_buffer *buffer);
-int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
+int drm_client_buffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy);
 void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
-- 
2.51.0

