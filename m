Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5619EA7BDC9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103DD10EBB6;
	Fri,  4 Apr 2025 13:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="K4ytjHCi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tF5COZlh";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="K4ytjHCi";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tF5COZlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CA10EBBD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:30:12 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 791BB1F385;
 Fri,  4 Apr 2025 13:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4KKAoycx3eR5RbKsJ0yUpGm+l+Vbg6Ri+SorbKj1Bw=;
 b=K4ytjHCivaOulT6LXGhADJOFBN8fMSheEug5hmbYEFeE9TN7oItJhcc0TosK3KQqT40qIz
 vyVhM5X/x1fK4BpYEoZATJ5l3SXWDKer9rXMYmojF55hsI81RvOKSe2KGlbBu6b8s4mlLN
 H2UspcadUMj0efjbkc02kcvPVsUvT2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4KKAoycx3eR5RbKsJ0yUpGm+l+Vbg6Ri+SorbKj1Bw=;
 b=tF5COZlhC/SMFJh0cdfqL4E5qeMr5Pumq0KjEFPJ1FBS7KZaWNfefCbJdxFBjMcbrdjCNl
 zwrgNbz07KyfKNDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4KKAoycx3eR5RbKsJ0yUpGm+l+Vbg6Ri+SorbKj1Bw=;
 b=K4ytjHCivaOulT6LXGhADJOFBN8fMSheEug5hmbYEFeE9TN7oItJhcc0TosK3KQqT40qIz
 vyVhM5X/x1fK4BpYEoZATJ5l3SXWDKer9rXMYmojF55hsI81RvOKSe2KGlbBu6b8s4mlLN
 H2UspcadUMj0efjbkc02kcvPVsUvT2k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773402;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l4KKAoycx3eR5RbKsJ0yUpGm+l+Vbg6Ri+SorbKj1Bw=;
 b=tF5COZlhC/SMFJh0cdfqL4E5qeMr5Pumq0KjEFPJ1FBS7KZaWNfefCbJdxFBjMcbrdjCNl
 zwrgNbz07KyfKNDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3DD0513A82;
 Fri,  4 Apr 2025 13:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id QPPcDdre72eYXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 13:30:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm/client: Do not pin in drm_client_buffer_vmap()
Date: Fri,  4 Apr 2025 15:23:31 +0200
Message-ID: <20250404132907.225803-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404132907.225803-1-tzimmermann@suse.de>
References: <20250404132907.225803-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -6.80
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 RCVD_COUNT_TWO(0.00)[2]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCPT_COUNT_SEVEN(0.00)[8];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 TO_DN_SOME(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Flag: NO
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

Pin and vmap are two distict operations. Do not mix them.

The helper drm_client_buffer_vmap() maps the pages for fbdev-dma
and fbdev-shmem. In both cases, the vmap operation ensures that
the pages are available until the vunmap happens. And as the pages
in DMA or SHMEM areas cannot be moved, there is no reason to call
pin. Hence remove the pin call.

Update drm_client_buffer_vunmap() accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_client.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index f1de7faf9fb45..154693066a127 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -303,34 +303,23 @@ EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
  * Returns:
  *	0 on success, or a negative errno code otherwise.
  */
-int
-drm_client_buffer_vmap(struct drm_client_buffer *buffer,
-		       struct iosys_map *map_copy)
+int drm_client_buffer_vmap(struct drm_client_buffer *buffer,
+			   struct iosys_map *map_copy)
 {
 	struct drm_gem_object *gem = buffer->gem;
 	struct iosys_map *map = &buffer->map;
 	int ret;
 
 	drm_gem_lock(gem);
-
-	ret = drm_gem_pin_locked(gem);
-	if (ret)
-		goto err_drm_gem_pin_locked;
 	ret = drm_gem_vmap_locked(gem, map);
-	if (ret)
-		goto err_drm_gem_vmap;
-
 	drm_gem_unlock(gem);
 
+	if (ret)
+		return ret;
+
 	*map_copy = *map;
 
 	return 0;
-
-err_drm_gem_vmap:
-	drm_gem_unpin_locked(buffer->gem);
-err_drm_gem_pin_locked:
-	drm_gem_unlock(gem);
-	return ret;
 }
 EXPORT_SYMBOL(drm_client_buffer_vmap);
 
@@ -349,7 +338,6 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
 
 	drm_gem_lock(gem);
 	drm_gem_vunmap_locked(gem, map);
-	drm_gem_unpin_locked(gem);
 	drm_gem_unlock(gem);
 }
 EXPORT_SYMBOL(drm_client_buffer_vunmap);
-- 
2.49.0

