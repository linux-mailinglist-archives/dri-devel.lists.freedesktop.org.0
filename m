Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CBCC0D6A7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 13:10:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6A6710E45A;
	Mon, 27 Oct 2025 12:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="yX0Eg6fB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOcQeHI8";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yX0Eg6fB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="wOcQeHI8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82DAE10E459
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 12:10:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B3421F451;
 Mon, 27 Oct 2025 12:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY4JNKTqP0se5EEkTTBFuonAIlqmdzarMqpwp5XMvgM=;
 b=yX0Eg6fBvgX7Gs7d1cFW5l5MYXNQMj0YaUz4zOZKjsBXsqKESfzNIeOy3NM9wWbDyUWW22
 nOCpRIKgzDtcbvLxhuc58ZJWE9h3gIO0oZT2f2CdyEc4I8ZAvyKsdndF+RhUc6o8a75Mjw
 oyDdguAlY7gbxSaVfSyPA2482mG4a2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY4JNKTqP0se5EEkTTBFuonAIlqmdzarMqpwp5XMvgM=;
 b=wOcQeHI8mEPoiAw6mJPFIK4B/2uIDOJywHNXHG7UT93RNFXfrj1fNOtNkTYY60JtwfauWC
 tHvkJUeli2BAWbAg==
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yX0Eg6fB;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wOcQeHI8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1761567051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY4JNKTqP0se5EEkTTBFuonAIlqmdzarMqpwp5XMvgM=;
 b=yX0Eg6fBvgX7Gs7d1cFW5l5MYXNQMj0YaUz4zOZKjsBXsqKESfzNIeOy3NM9wWbDyUWW22
 nOCpRIKgzDtcbvLxhuc58ZJWE9h3gIO0oZT2f2CdyEc4I8ZAvyKsdndF+RhUc6o8a75Mjw
 oyDdguAlY7gbxSaVfSyPA2482mG4a2I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1761567051;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UY4JNKTqP0se5EEkTTBFuonAIlqmdzarMqpwp5XMvgM=;
 b=wOcQeHI8mEPoiAw6mJPFIK4B/2uIDOJywHNXHG7UT93RNFXfrj1fNOtNkTYY60JtwfauWC
 tHvkJUeli2BAWbAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0748E13A9A;
 Mon, 27 Oct 2025 12:10:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oOFaAEth/2gDAwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Oct 2025 12:10:51 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, rrameshbabu@nvidia.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, francesco@valla.it,
 airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 1/7] drm/client: Remove pitch from struct drm_client_buffer
Date: Mon, 27 Oct 2025 13:09:12 +0100
Message-ID: <20251027121042.143588-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027121042.143588-1-tzimmermann@suse.de>
References: <20251027121042.143588-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4B3421F451
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_TO(0.00)[redhat.com,nvidia.com,linux.intel.com,kernel.org,valla.it,gmail.com];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[9];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Only the client-buffer setup uses the pitch field from struct
drm_client_buffer. Remove the field and pass the value among setup
helpers.

Clients that need the pitch should rather look at the framebuffer's
pitches[0] directly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_client.c | 14 +++++++-------
 include/drm/drm_client.h     |  5 -----
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index fe9c6d7083ea..82b871d62313 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -188,7 +188,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
 
 static struct drm_client_buffer *
 drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
-			 u32 format, u32 *handle)
+			 u32 format, u32 *handle, u32 *pitch)
 {
 	const struct drm_format_info *info = drm_format_info(format);
 	struct drm_mode_create_dumb dumb_args = { };
@@ -216,9 +216,9 @@ drm_client_buffer_create(struct drm_client_dev *client, u32 width, u32 height,
 		goto err_delete;
 	}
 
-	buffer->pitch = dumb_args.pitch;
 	buffer->gem = obj;
 	*handle = dumb_args.handle;
+	*pitch = dumb_args.pitch;
 
 	return buffer;
 
@@ -353,7 +353,7 @@ static void drm_client_buffer_rmfb(struct drm_client_buffer *buffer)
 
 static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 				   u32 width, u32 height, u32 format,
-				   u32 handle)
+				   u32 handle, u32 pitch)
 {
 	struct drm_client_dev *client = buffer->client;
 	struct drm_mode_fb_cmd2 fb_req = { };
@@ -363,7 +363,7 @@ static int drm_client_buffer_addfb(struct drm_client_buffer *buffer,
 	fb_req.height = height;
 	fb_req.pixel_format = format;
 	fb_req.handles[0] = handle;
-	fb_req.pitches[0] = buffer->pitch;
+	fb_req.pitches[0] = pitch;
 
 	ret = drm_mode_addfb2(client->dev, &fb_req, client->file);
 	if (ret)
@@ -399,15 +399,15 @@ struct drm_client_buffer *
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
index 715b422952ee..c674464f7e74 100644
--- a/include/drm/drm_client.h
+++ b/include/drm/drm_client.h
@@ -173,11 +173,6 @@ struct drm_client_buffer {
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
2.51.1

