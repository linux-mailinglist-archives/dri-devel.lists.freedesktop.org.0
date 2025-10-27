Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48142C0D6BC
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:11:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C80810E473;
	Mon, 27 Oct 2025 12:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="kVIoysEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dzVI0JcU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kVIoysEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dzVI0JcU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E26B10E464
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:11:13 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD1D41F45B;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IiiRApY7cwRY0SmUSVKBMNvF0NeW6xo3oxflQMkGD8=;
 b=kVIoysEOJGH7q2rpFp5oAkEAu1UhlBtk8z5a/My5W33C/AwU6LwdNNzYfKkG4SkNVg69pY
 c0Pb0mtI6ntaW2wmhTHg1di/hz1mDEblNIlulerBIQMjCg9RBkODrqNplYEmYy9xhjIMe9
 katr4ffkAUiouGerMJuP9+6sgHw2jF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IiiRApY7cwRY0SmUSVKBMNvF0NeW6xo3oxflQMkGD8=;
 b=dzVI0JcUanZjEik95dTdeJSdh6JNiJ1vZXGtY2ECNS8WNzjDKRj6yu/noaibo3RoBlnCDk
 niF4qChyfN+zwVAA==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kVIoysEO;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=dzVI0JcU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IiiRApY7cwRY0SmUSVKBMNvF0NeW6xo3oxflQMkGD8=;
 b=kVIoysEOJGH7q2rpFp5oAkEAu1UhlBtk8z5a/My5W33C/AwU6LwdNNzYfKkG4SkNVg69pY
 c0Pb0mtI6ntaW2wmhTHg1di/hz1mDEblNIlulerBIQMjCg9RBkODrqNplYEmYy9xhjIMe9
 katr4ffkAUiouGerMJuP9+6sgHw2jF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567052;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/IiiRApY7cwRY0SmUSVKBMNvF0NeW6xo3oxflQMkGD8=;
 b=dzVI0JcUanZjEik95dTdeJSdh6JNiJ1vZXGtY2ECNS8WNzjDKRj6yu/noaibo3RoBlnCDk
 niF4qChyfN+zwVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6CD7F13A9A;
 Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id INJOGUxh/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:52 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/7] drm/client: Create client buffers with
 drm_client_buffer_create_dumb()
Date: Mon, 27 Oct 2025 13:09:17 +0100
Message-ID: <20251027121042.143588-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: AD1D41F45B
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 MIME_TRACE(0.00)[0:+]; FUZZY_RATELIMITED(0.00)[rspamd.com];
 TO_DN_SOME(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -3.01
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

Rename drm_client_framebuffer_create() to drm_client_buffer_create_dump()
and adapt callers. The new name reflects the function's purpose. Using
dumb buffers is the easiest way for creating a GEM buffer in a drivers-
independent way.

There's also drm_client_buffer_create(), which creates the client buffer
from a preexisting buffer object. This helper can be exported for drivers
that create their own GEM buffer object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 drivers/gpu/drm/drm_client.c      | 6 +++---
 drivers/gpu/drm/drm_fbdev_dma.c   | 2 +-
 drivers/gpu/drm/drm_fbdev_shmem.c | 2 +-
 drivers/gpu/drm/drm_fbdev_ttm.c   | 2 +-
 include/drm/drm_client.h          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index c2ddc57b538e..48636bb1a21e 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -204,7 +204,7 @@ static int drm_log_setup_modeset(struct drm_client_dev *client,
 	if (format == DRM_FORMAT_INVALID)
 		return -EINVAL;
 
-	scanout->buffer = drm_client_framebuffer_create(client, width, height, format);
+	scanout->buffer = drm_client_buffer_create_dumb(client, width, height, format);
 	if (IS_ERR(scanout->buffer)) {
 		drm_warn(client->dev, "drm_log can't create framebuffer %d %d %p4cc\n",
 			 width, height, &format);
diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index b4e37bb2041b..e7dfbdeca45a 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -377,7 +377,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
 /**
- * drm_client_framebuffer_create - Create a client framebuffer
+ * drm_client_buffer_create_dumb - Create a client buffer backed by a dumb buffer
  * @client: DRM client
  * @width: Framebuffer width
  * @height: Framebuffer height
@@ -391,7 +391,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
  * Pointer to a client buffer or an error pointer on failure.
  */
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
+drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_device *dev = client->dev;
@@ -427,7 +427,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(drm_client_framebuffer_create);
+EXPORT_SYMBOL(drm_client_buffer_create_dumb);
 
 /**
  * drm_client_framebuffer_flush - Manually flush client framebuffer
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 6216de1446c1..876bd8cfc5ea 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -281,7 +281,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
 					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index 520c2218e5dc..46e43b60b3f9 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -147,7 +147,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_bpp);
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 7f7c88461228..c7ad779ba590 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -187,7 +187,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
 					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index ffc4013b2e18..690ef04fccce 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -194,7 +194,7 @@ struct drm_client_buffer {
 };
 
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
+drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_buffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
-- 
2.51.1

