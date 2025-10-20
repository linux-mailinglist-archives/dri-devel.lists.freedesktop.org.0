Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF79BF20A7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111F010E470;
	Mon, 20 Oct 2025 15:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="IH7T9gQF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Fe/FaSdG";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="U2P2LzlM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L4mEtxTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8A510E470
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E1162115D;
 Mon, 20 Oct 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973273; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkxFDAFCJSwhRxVma1XoSbZII/CA66HA8aU90lFXyhg=;
 b=IH7T9gQFaUE16EzfYSrG7DpzxnCKhdURgHbDeBRrO8gbxCdfmGqLiD5nC6uSygX5GUuOJ+
 D/HM1Lf5sgud5VZAqqiz0aD8hDkvvjUZMe59UzqWBxkJNQeI2tSjlOm0YwhtdjcOYH23rd
 7cA3GHxpYJp4bzepRHaPaK+yhTAcmpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973273;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkxFDAFCJSwhRxVma1XoSbZII/CA66HA8aU90lFXyhg=;
 b=Fe/FaSdGmRmBkQyBvOulLVxH6CeFTiJLprs+c36/+Qzyo0eigzWDlwunaN3va/D7wRzzOP
 AsuEfscDrfbK9yAQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973269; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkxFDAFCJSwhRxVma1XoSbZII/CA66HA8aU90lFXyhg=;
 b=U2P2LzlM+UabZ3vpv0OoaZ4lwNEKxPW1YscMlv9cDvDLWggAa30Uh4y4o30+uay2yOIvwE
 QLru89cOpJ/mRUT3LysnrSQpq+olAJE0FJ6R4Kv8ZF8npBKXyvy7EokSW+Qvs5tgxAmCnr
 EkuW5/DrY0z0h7KAoSHn+ahaASwhSRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973269;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nkxFDAFCJSwhRxVma1XoSbZII/CA66HA8aU90lFXyhg=;
 b=L4mEtxTHMHJFwfxJsFVSqfet4pGsBRQxzcXxm7bfo+gx+Qo2a06GRKi8pdW820UKzVeDWQ
 wioV8WFAzNl06mAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6274413AEF;
 Mon, 20 Oct 2025 15:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id WFjUFtFR9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 6/7] drm/client: Create client buffers with
 drm_client_buffer_create_dumb()
Date: Mon, 20 Oct 2025 17:04:22 +0200
Message-ID: <20251020151402.53013-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020151402.53013-1-tzimmermann@suse.de>
References: <20251020151402.53013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCPT_COUNT_SEVEN(0.00)[9];
 R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Rename drm_client_framebuffer_create() to drm_client_buffer_create_dump()
and adapt callers. The new name reflects the function's purpose. Using
dumb buffers is the easiest way for creating a GEM buffer in a drivers-
independent way.

There's also drm_client_buffer_create(), which creates the client buffer
from a preexisting buffer object. This helper can be exported for drivers
that create their own GEM buffer object.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 drivers/gpu/drm/drm_client.c      | 6 +++---
 drivers/gpu/drm/drm_fbdev_dma.c   | 2 +-
 drivers/gpu/drm/drm_fbdev_shmem.c | 2 +-
 drivers/gpu/drm/drm_fbdev_ttm.c   | 2 +-
 include/drm/drm_client.h          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 2d748ab318fe..b8fb9ee9fcf0 100644
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
index d4c424ff44a9..9105a0b5f468 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -372,7 +372,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
 /**
- * drm_client_framebuffer_create - Create a client framebuffer
+ * drm_client_buffer_create_dumb - Create a client buffer backed by a dumb buffer
  * @client: DRM client
  * @width: Framebuffer width
  * @height: Framebuffer height
@@ -386,7 +386,7 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap);
  * Pointer to a client buffer or an error pointer on failure.
  */
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
+drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_device *dev = client->dev;
@@ -422,7 +422,7 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(drm_client_framebuffer_create);
+EXPORT_SYMBOL(drm_client_buffer_create_dumb);
 
 /**
  * drm_client_framebuffer_flush - Manually flush client framebuffer
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index 17fef288e86b..7d4e557d6a5d 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -285,7 +285,7 @@ int drm_fbdev_dma_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
 					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
index f7966b8c51cd..b9e48a0bd39f 100644
--- a/drivers/gpu/drm/drm_fbdev_shmem.c
+++ b/drivers/gpu/drm/drm_fbdev_shmem.c
@@ -149,7 +149,7 @@ int drm_fbdev_shmem_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 		    sizes->surface_bpp);
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp, sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/drivers/gpu/drm/drm_fbdev_ttm.c b/drivers/gpu/drm/drm_fbdev_ttm.c
index 54f9a46b96c2..b1188692399a 100644
--- a/drivers/gpu/drm/drm_fbdev_ttm.c
+++ b/drivers/gpu/drm/drm_fbdev_ttm.c
@@ -189,7 +189,7 @@ int drm_fbdev_ttm_driver_fbdev_probe(struct drm_fb_helper *fb_helper,
 
 	format = drm_driver_legacy_fb_format(dev, sizes->surface_bpp,
 					     sizes->surface_depth);
-	buffer = drm_client_framebuffer_create(client, sizes->surface_width,
+	buffer = drm_client_buffer_create_dumb(client, sizes->surface_width,
 					       sizes->surface_height, format);
 	if (IS_ERR(buffer))
 		return PTR_ERR(buffer);
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 6019f2712448..e4df404a9645 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -184,7 +184,7 @@ struct drm_client_buffer {
 };
 
 struct drm_client_buffer *
-drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format);
+drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 height, u32 format);
 void drm_client_buffer_delete(struct drm_client_buffer *buffer);
 int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struct drm_rect *rect);
 int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
-- 
2.51.0

