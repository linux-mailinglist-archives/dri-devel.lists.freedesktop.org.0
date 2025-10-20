Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0F5BF20A4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CDC10E477;
	Mon, 20 Oct 2025 15:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="mfUHDW/k";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="QLeVXjAr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="uFEhgyOj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="w/CylwbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5099E10E475
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:42 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C8AB5211CB;
 Mon, 20 Oct 2025 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXS2glXny+kR1Brmip4YIAi8dWst+xZn6JZfJnVvp68=;
 b=mfUHDW/kfajAa53uLIVqFXHPGJjHNonOWVF1eqMg0P7Kot4+2550Cs2kVWbfXqjg9TJrZv
 mekEhYgFzT635o/wMsIwfGfRvzkSdCWXf4OgPRita7RlJegyf1+mzOJEYoMpDFlIpvvNG6
 rg+rCITcRqMPxyGSDERDskTw2vbhRG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXS2glXny+kR1Brmip4YIAi8dWst+xZn6JZfJnVvp68=;
 b=QLeVXjAr45QYIyb+ZVlt1UlLyWoMTjQ6FLduyRH6E2De1mz8cS3ZrHAkg+gtrR8pfmjgQa
 /POk6nd0iAMLYYAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXS2glXny+kR1Brmip4YIAi8dWst+xZn6JZfJnVvp68=;
 b=uFEhgyOjuXjHuTmy7glWmKP8WT79git+yZ5gWtP0N6D+eMwi+O3j4wqj3xhN2r5OeM5df1
 w9nlJ64qX8fo/Zq1MKU41yxgmYPyp4juTSjqClpkrCDSAfmapvd5Fc1/Y9RpKO63EJFtZT
 1YK+ybvyjbqQ1ruZOnSVPNwfhcnKtxE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GXS2glXny+kR1Brmip4YIAi8dWst+xZn6JZfJnVvp68=;
 b=w/CylwbMB4bRYPHxc+oB0TnIm+e2tEWEm77ZnyQ06yeKxmW6rh0U4aeYb/DuY4jvEqq2MG
 bPvdLUBSkO5Y/0DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 89B5313AE2;
 Mon, 20 Oct 2025 15:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id iP/pH9BR9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/7] drm/client: Inline drm_client_buffer_addfb() and _rmfb()
Date: Mon, 20 Oct 2025 17:04:19 +0200
Message-ID: <20251020151402.53013-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020151402.53013-1-tzimmermann@suse.de>
References: <20251020151402.53013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
X-Spam-Score: -6.80
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

Creating and deleting a client buffer always creates and deletes
the underlying DRM framebuffer. Inline the helper functions into
their callers.

With the _addfb code being inlined into drm_client_buffer_create(),
clean up the function's error rollback to release the framebuffer's
handle and GEM buffer object as needed.

Move the _rmfb code into drm_client_buffer_delete() rather than its
current location in drm_client_framebuffer_delete(). The former is
now the inverse of drm_client_buffer_create(). Makes no difference
for cleaning up. Also prepares for the removal of
drm_client_framebuffer_delete().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 93 ++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 9bf2edfb7b64..73ae63f856a0 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -174,6 +174,13 @@ EXPORT_SYMBOL(drm_client_release);
 
 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 {
+	int ret;
+
+	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
+	if (ret)
+		drm_err(buffer->client->dev,
+			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
+
 	if (buffer->gem) {
 		drm_gem_vunmap(buffer->gem, &buffer->map);
 		drm_gem_object_put(buffer->gem);
@@ -186,8 +193,21 @@ static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 			 u32 format, u32 handle, u32 pitch)
 {
+	struct drm_mode_fb_cmd2 fb_req = {
+		.width = width,
+		.height = height,
+		.pixel_format = format,
+		.handles = {
+			handle,
+		},
+		.pitches = {
+			pitch,
+		},
+	};
+	struct drm_device *dev = client->dev;
 	struct drm_client_buffer *buffer;
 	struct drm_gem_object *obj;
+	struct drm_framebuffer *fb;
 	int ret;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -202,10 +222,30 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 		goto err_delete;
 	}
 
+	ret = drm_mode_addfb2(dev, &fb_req, client->file);
+	if (ret)
+		goto err_drm_gem_object_put;
+
+	fb = drm_framebuffer_lookup(dev, client->file, fb_req.fb_id);
+	if (drm_WARN_ON(dev, !fb)) {
+		ret = -ENOENT;
+		goto err_drm_mode_rmfb;
+	}
+
+	/* drop the reference we picked up in framebuffer lookup */
+	drm_framebuffer_put(fb);
+
+	strscpy(fb->comm, client->name, TASK_COMM_LEN);
+
 	buffer->gem = obj;
+	buffer->fb = fb;
 
 	return buffer;
 
+err_drm_mode_rmfb:
+	drm_mode_rmfb(dev, fb_req.fb_id, client->file);
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
 err_delete:
 	kfree(buffer);
 	return ERR_PTR(ret);
@@ -319,51 +359,6 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
 
-static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
-{
-	int ret;
-
-	if (!buffer->fb)
-		return;
-
-	ret = drm_mode_rmfb(buffer->client->dev, buffer->fb->base.id, buffer->client->file);
-	if (ret)
-		drm_err(buffer->client->dev,
-			"Error removing FB:%u (%d)\n", buffer->fb->base.id, ret);
-
-	buffer->fb = NULL;
-}
-
-static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
-				   u32 width, u32 height, u32 format,
-				   u32 handle, u32 pitch)
-{
-	struct drm_client_dev *client = buffer->client;
-	struct drm_mode_fb_cmd2 fb_req = { };
-	int ret;
-
-	fb_req.width = width;
-	fb_req.height = height;
-	fb_req.pixel_format = format;
-	fb_req.handles[0] = handle;
-	fb_req.pitches[0] = pitch;
-
-	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
-	if (ret)
-		return ret;
-
-	buffer->fb = drm_framebuffer_lookup(client->dev, buffer->client->file, fb_req.fb_id);
-	if (WARN_ON(!buffer->fb))
-		return -ENOENT;
-
-	/* drop the reference we picked up in framebuffer lookup */
-	drm_framebuffer_put(buffer->fb);
-
-	strscpy(buffer->fb->comm, client->name, TASK_COMM_LEN);
-
-	return 0;
-}
-
 /**
  * drm_client_framebuffer_create - Create a client framebuffer
  * @client: DRM client
@@ -401,11 +396,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 		goto err_drm_mode_destroy_dumb;
 	}
 
-	ret = drm_client_buffer_addfb(buffer, width, height, format,
-				      dumb_args.handle, dumb_args.pitch);
-	if (ret)
-		goto err_drm_client_buffer_delete;
-
 	/*
 	 * The handle is only needed for creating the framebuffer, destroy it
 	 * again to solve a circular dependency should anybody export the GEM
@@ -416,8 +406,6 @@ drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 heig
 
 	return buffer;
 
-err_drm_client_buffer_delete:
-	drm_client_buffer_delete(buffer);
 err_drm_mode_destroy_dumb:
 	drm_mode_destroy_dumb(client->dev, dumb_args.handle, client->file);
 	return ERR_PTR(ret);
@@ -433,7 +421,6 @@ void drm_client_framebuffer_delete(struct drm_client_buffer *buffer)
 	if (!buffer)
 		return;
 
-	drm_client_buffer_rmfb(buffer);
 	drm_client_buffer_delete(buffer);
 }
 EXPORT_SYMBOL(drm_client_framebuffer_delete);
-- 
2.51.0

