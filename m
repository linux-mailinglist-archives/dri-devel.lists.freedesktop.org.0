Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2611CA7BDD0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 15:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15E010EBC1;
	Fri,  4 Apr 2025 13:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="L3GVJvn8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a0SDD3Vq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="L3GVJvn8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="a0SDD3Vq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900AB10EBC1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 13:30:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B212211C6;
 Fri,  4 Apr 2025 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgt4WmYfb3T4v+mLbbGk/1q81GK5YdHfpv5NrenIMEM=;
 b=L3GVJvn8aAmA3zid4qO7a7KYE2HEL3dRd/I0TYXQhUVKfcXyd8BiRPNIFlUM1oo4Lyj/1X
 50iGl3yN0wSuCg6D6YQzlWefqGquJxIWQGMTDoIyyLq9pjt6HPc2w2Nt56XXif9+f7vQxP
 3ytO4xMJW2aVJugsEqfZj29Stok4oq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgt4WmYfb3T4v+mLbbGk/1q81GK5YdHfpv5NrenIMEM=;
 b=a0SDD3VqzYxC5U0htHqpUp2L+GNcS2Yx40s56/sdhhxJ3t4mgCNO2d+Z1aEoMg8zpYsv70
 TdvVMz9YFylHMKCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1743773403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgt4WmYfb3T4v+mLbbGk/1q81GK5YdHfpv5NrenIMEM=;
 b=L3GVJvn8aAmA3zid4qO7a7KYE2HEL3dRd/I0TYXQhUVKfcXyd8BiRPNIFlUM1oo4Lyj/1X
 50iGl3yN0wSuCg6D6YQzlWefqGquJxIWQGMTDoIyyLq9pjt6HPc2w2Nt56XXif9+f7vQxP
 3ytO4xMJW2aVJugsEqfZj29Stok4oq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1743773403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgt4WmYfb3T4v+mLbbGk/1q81GK5YdHfpv5NrenIMEM=;
 b=a0SDD3VqzYxC5U0htHqpUp2L+GNcS2Yx40s56/sdhhxJ3t4mgCNO2d+Z1aEoMg8zpYsv70
 TdvVMz9YFylHMKCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 01F5D13A84;
 Fri,  4 Apr 2025 13:30:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id GKXkOtre72eYXAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Apr 2025 13:30:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/4] drm/gem: Inline drm_gem_pin() into PRIME helpers
Date: Fri,  4 Apr 2025 15:23:34 +0200
Message-ID: <20250404132907.225803-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250404132907.225803-1-tzimmermann@suse.de>
References: <20250404132907.225803-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLwtd9qf4a971hssh5godp6qbx)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
X-Spam-Flag: NO
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

Inline drm_gem_pin() into its only caller drm_gem_map_attach()
and update the documentation in the callback's purpose. Do the
equivalent for drm_gem_unpin(). Also add stricter error checking
on the involved locking.

The pin operation in the GEM object functions is a helper for
PRIME-exported buffer objects. Having drm_gem_pin() gives the
impression of a general-purpose interface, which is not the case.
Removing it makes the pin callback a bit harder to misuse.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem.c      | 32 --------------------------------
 drivers/gpu/drm/drm_internal.h |  4 ----
 drivers/gpu/drm/drm_prime.c    | 22 ++++++++++++++++++++--
 include/drm/drm_gem.h          |  3 ++-
 4 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f73..a0a3b6baa5690 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1184,38 +1184,6 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 		obj->funcs->print_info(p, indent, obj);
 }
 
-int drm_gem_pin_locked(struct drm_gem_object *obj)
-{
-	if (obj->funcs->pin)
-		return obj->funcs->pin(obj);
-
-	return 0;
-}
-
-void drm_gem_unpin_locked(struct drm_gem_object *obj)
-{
-	if (obj->funcs->unpin)
-		obj->funcs->unpin(obj);
-}
-
-int drm_gem_pin(struct drm_gem_object *obj)
-{
-	int ret;
-
-	dma_resv_lock(obj->resv, NULL);
-	ret = drm_gem_pin_locked(obj);
-	dma_resv_unlock(obj->resv);
-
-	return ret;
-}
-
-void drm_gem_unpin(struct drm_gem_object *obj)
-{
-	dma_resv_lock(obj->resv, NULL);
-	drm_gem_unpin_locked(obj);
-	dma_resv_unlock(obj->resv);
-}
-
 int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	int ret;
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index e44f28fd81d34..442eb31351ddd 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -175,10 +175,6 @@ void drm_gem_release(struct drm_device *dev, struct drm_file *file_private);
 void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 			const struct drm_gem_object *obj);
 
-int drm_gem_pin_locked(struct drm_gem_object *obj);
-void drm_gem_unpin_locked(struct drm_gem_object *obj);
-int drm_gem_pin(struct drm_gem_object *obj);
-void drm_gem_unpin(struct drm_gem_object *obj);
 int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
 void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d828502268b8e..a1852c02f5123 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -599,6 +599,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 		       struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
+	int ret;
 
 	/*
 	 * drm_gem_map_dma_buf() requires obj->get_sg_table(), but drivers
@@ -608,7 +609,16 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 	    !obj->funcs->get_sg_table)
 		return -ENOSYS;
 
-	return drm_gem_pin(obj);
+	if (!obj->funcs->pin)
+		return 0;
+
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (ret)
+		return ret;
+	ret = obj->funcs->pin(obj);
+	dma_resv_unlock(obj->resv);
+
+	return ret;
 }
 EXPORT_SYMBOL(drm_gem_map_attach);
 
@@ -625,8 +635,16 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
 			struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
+	int ret;
 
-	drm_gem_unpin(obj);
+	if (!obj->funcs->unpin)
+		return;
+
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ON(obj->dev, ret))
+		return;
+	obj->funcs->unpin(obj);
+	dma_resv_unlock(obj->resv);
 }
 EXPORT_SYMBOL(drm_gem_map_detach);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 9b71f7a9f3f8a..498485f4501f9 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -126,7 +126,8 @@ struct drm_gem_object_funcs {
 	/**
 	 * @pin:
 	 *
-	 * Pin backing buffer in memory. Used by the drm_gem_map_attach() helper.
+	 * Pin backing buffer in memory, such that importers can access it.
+	 * Used by the drm_gem_map_attach() helper.
 	 *
 	 * This callback is optional.
 	 */
-- 
2.49.0

