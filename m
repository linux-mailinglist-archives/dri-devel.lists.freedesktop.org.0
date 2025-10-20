Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C1BF2095
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B590610E46C;
	Mon, 20 Oct 2025 15:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="w766FBzk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="0AH3izHu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162C10E468
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C98E1F38D;
 Mon, 20 Oct 2025 15:14:25 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6QGo3tgBcEQ+yD+4SPoyMKRMz4ja/7OQeES14pEaHw=;
 b=w766FBzka5Jd5moy6yUzY2e9WVlBdLnBTtI0MLkBpARPCtTQhmDNaHvW1tXhU0COH476bY
 aswE/W9/uxmAyy3EJPGtuom7NlcBFofWMSTPURwpi+18shMYt1FFwZZHNX0U3uvq0ltELs
 DkVN14wuynwPYtp8iaffzP3s0ZwYQ74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f6QGo3tgBcEQ+yD+4SPoyMKRMz4ja/7OQeES14pEaHw=;
 b=0AH3izHuhDuHyy99sOKugM2SuFuBXDV+LbEoS69yXdc2IhLkqWTtMRs9GzrD8UBwcgWDFM
 sQgigFR9BArMbyCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBDCA13AE7;
 Mon, 20 Oct 2025 15:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UMaVMNBR9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/7] drm/client: Deprecate struct drm_client_buffer.gem
Date: Mon, 20 Oct 2025 17:04:20 +0200
Message-ID: <20251020151402.53013-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020151402.53013-1-tzimmermann@suse.de>
References: <20251020151402.53013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1C98E1F38D
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

The client buffer's framebuffer holds a reference and pointer on
each of its GEM buffer objects. Thus the field gem in the client-
buffer struct is not necessary. Deprecated the field and convert
the client-buffer helpers to use the framebuffer's objects.

In drm_client_buffer_delete(), do a possible vunmap before releasing
the framebuffer. Otherwise we'd eventually release the framebuffer
before unmaping its buffer objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 20 ++++++++++++--------
 include/drm/drm_client.h     |  9 +++------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 73ae63f856a0..29ed5f55b5f9 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -17,6 +17,7 @@
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 
@@ -174,17 +175,17 @@ EXPORT_SYMBOL(drm_client_release);
 
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
 	int ret;
 
+	drm_gem_vunmap(gem, &buffer->map);
+
 	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
 	if (ret)
 		drm_err(buffer->client->dev,
 			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
 
-	if (buffer->gem) {
-		drm_gem_vunmap(buffer->gem, &buffer->map);
-		drm_gem_object_put(buffer->gem);
-	}
+	drm_gem_object_put(buffer->gem);
 
 	kfree(buffer);
 }
@@ -274,7 +275,7 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
 				 struct iosys_map *map_copy)
 {
-	struct drm_gem_object *gem = buffer->gem;
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
 	struct iosys_map *map = &buffer->map;
 	int ret;
 
@@ -303,7 +304,7 @@ EXPORT_SYMBOL(drm_client_buffer_vmap_local);
  */
 void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
 {
-	struct drm_gem_object *gem = buffer->gem;
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
 	struct iosys_map *map = &buffer->map;
 
 	drm_gem_vunmap_locked(gem, map);
@@ -334,9 +335,10 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
 int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
 			   struct iosys_map *map_copy)
 {
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
 	int ret;
 
-	ret = drm_gem_vmap(buffer->gem, &buffer->map);
+	ret = drm_gem_vmap(gem, &buffer->map);
 	if (ret)
 		return ret;
 	*map_copy = buffer->map;
@@ -355,7 +357,9 @@ EXPORT_SYMBOL(drm_client_buffer_vmap);
  */
 void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 {
-	drm_gem_vunmap(buffer->gem, &buffer->map);
+	struct drm_gem_object *gem = drm_gem_fb_get_obj(buffer->fb, 0);
+
+	drm_gem_vunmap(gem, &buffer->map);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index db0665263a10..5909664d4d43 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -166,12 +166,9 @@ struct drm_client_buffer {
 	/**
 	 * @gem: GEM object backing this buffer
 	 *
-	 * FIXME: The dependency on GEM here isn't required, we could
-	 * convert the driver handle to a dma-buf instead and use the
-	 * backend-agnostic dma-buf vmap support instead. This would
-	 * require that the handle2fd prime ioctl is reworked to pull the
-	 * fd_install step out of the driver backend hooks, to make that
-	 * final step optional for internal users.
+	 * FIXME: The DRM framebuffer holds a reference on its GEM
+	 * buffer objects. Do not use this field in new code and
+	 * update existing users.
 	 */
 	struct drm_gem_object *gem;
 
-- 
2.51.0

