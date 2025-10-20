Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ACCBF20AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 17:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CC410E473;
	Mon, 20 Oct 2025 15:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="ZZ5xb0mk";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8mJiGBZJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o8uR0Bvg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="boCcxThM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17BB810E472
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 15:14:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 466762119D;
 Mon, 20 Oct 2025 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973268; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqpv80HQxDykET/esBjf7CL6uamtD/jo0M3nOorfD4Q=;
 b=ZZ5xb0mkztH7wnjZ4FY811OlxOXsLS0RymcVczqp5jGOuwFzR0GYlS4oTV9hy/J7c+1ORk
 j+BKacpDPG1f22GL4n+iXNotsM2EYg9HkjTelSr9bmJXm69ZQyx9F6kW8EHgUy6dod6MJk
 s8TDgNKPDn8+Lx1/QlDUsdHxCVp9RYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973268;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqpv80HQxDykET/esBjf7CL6uamtD/jo0M3nOorfD4Q=;
 b=8mJiGBZJX6rBdqVLD+RwLAnZC9hTJch3k/y3OufZjiYhCQhaSXESRRQ5llspLtPaLKA0de
 VlI7nd7+JjguGPAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1760973264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqpv80HQxDykET/esBjf7CL6uamtD/jo0M3nOorfD4Q=;
 b=o8uR0BvgNfgKwKWeCJJERfY0tlrOqtSx23uDac7vk80eXRzJ9lF1pEGnyim3MBOS6BViEW
 hSgLRs/um1TgSgS4xl+NRa5JEAz/I3/4c2T5LFB9rGB12V9VRg71EpM+cJWVYHE8il0Em7
 CJL6h1VqOWKOw8xnoo5TDbxF4n95Ilw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1760973264;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yqpv80HQxDykET/esBjf7CL6uamtD/jo0M3nOorfD4Q=;
 b=boCcxThMgP8PO3v0SRXm2xPGuIVRFt3Y2FJACDhBmzJSpN2gzSvh6fLh7VUtAxXDzhjk3K
 kdAi4sV7AGhtRdBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01A9C13AAD;
 Mon, 20 Oct 2025 15:14:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gCTGOs9R9mjtTgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Oct 2025 15:14:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/7] drm/client: Remove pitch from struct drm_client_buffer
Date: Mon, 20 Oct 2025 17:04:17 +0200
Message-ID: <20251020151402.53013-2-tzimmermann@suse.de>
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

Only the client-buffer setup uses the pitch field from struct
drm_client_buffer. Remove the field and pass the value among setup
helpers.

Clients that need the pitch should rather look at the framebuffer's
pitches[0] directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 14 +++++++-------
 include/drm/drm_client.h     |  5 -----
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 3fa38d4ac70b..5fa8a1628563 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -184,7 +184,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 
 static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
-			 u32 format, u32 *handle)
+			 u32 format, u32 *handle, u32 *pitch)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_mode_create_dumb dumb_args = { };
@@ -212,9 +212,9 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 		goto err_delete;
 	}
 
-	buffer->pitch = dumb_args.pitch;
 	buffer->gem = obj;
 	*handle = dumb_args.handle;
+	*pitch = dumb_args.pitch;
 
 	return buffer;
 
@@ -349,7 +349,7 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
 
 static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 				   u32 width, u32 height, u32 format,
-				   u32 handle)
+				   u32 handle, u32 pitch)
 {
 	struct drm_client_dev *client = buffer->client;
 	struct drm_mode_fb_cmd2 fb_req = { };
@@ -359,7 +359,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 	fb_req.height = height;
 	fb_req.pixel_format = format;
 	fb_req.handles[0] = handle;
-	fb_req.pitches[0] = buffer->pitch;
+	fb_req.pitches[0] = pitch;
 
 	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
 	if (ret)
@@ -395,15 +395,15 @@ struct drm_client_buffer *
 drm_client_framebuffer_create(struct drm_client_dev *client, u32 width, u32 height, u32 format)
 {
 	struct drm_client_buffer *buffer;
-	u32 handle;
+	u32 handle, pitch;
 	int ret;
 
 	buffer = drm_client_buffer_create(client, width, height, format,
-					  &handle);
+					  &handle, &pitch);
 	if (IS_ERR(buffer))
 		return buffer;
 
-	ret = drm_client_buffer_addfb(buffer, width, height, format, handle);
+	ret = drm_client_buffer_addfb(buffer, width, height, format, handle, pitch);
 
 	/*
 	 * The handle is only needed for creating the framebuffer, destroy it
diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
index 3556928d3938..db0665263a10 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -163,11 +163,6 @@ struct drm_client_buffer {
 	 */
 	struct drm_client_dev *client;
 
-	/**
-	 * @pitch: Buffer pitch
-	 */
-	u32 pitch;
-
 	/**
 	 * @gem: GEM object backing this buffer
 	 *
-- 
2.51.0

