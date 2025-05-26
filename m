Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CD1AC4074
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 15:30:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D6210E37C;
	Mon, 26 May 2025 13:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Un+ZFDcL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="izamxxP7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Un+ZFDcL";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="izamxxP7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001CA10E326
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 13:30:10 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 315A121F7F;
 Mon, 26 May 2025 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHoK+1Dj0DM0rWKrIqSjqkEaALvAF4Jt5oeW6E9s+GE=;
 b=Un+ZFDcLVGxInm+2ZaTCvDhgVvYMq+xMm6IC5OeNrCSR+/PG0RhJsvY7iONq/6osm/duPN
 WTRv7sPCHEyzbWoYm/aoB3ubtZAtL47NCwBsb4zhI8/yS2AUPxlbxOzvvZhGHEu/geM6Pj
 VR/kJI4AoF3A6+UuGgPBgjqOUA/IffE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHoK+1Dj0DM0rWKrIqSjqkEaALvAF4Jt5oeW6E9s+GE=;
 b=izamxxP79/VKS0MpFj9HrgKQ7yi85gwwdmTZ4de5j11CTvayZ3FD8TbM0JEmvmdtxDEapL
 z52nXY0s444ExdDA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Un+ZFDcL;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=izamxxP7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1748266205; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHoK+1Dj0DM0rWKrIqSjqkEaALvAF4Jt5oeW6E9s+GE=;
 b=Un+ZFDcLVGxInm+2ZaTCvDhgVvYMq+xMm6IC5OeNrCSR+/PG0RhJsvY7iONq/6osm/duPN
 WTRv7sPCHEyzbWoYm/aoB3ubtZAtL47NCwBsb4zhI8/yS2AUPxlbxOzvvZhGHEu/geM6Pj
 VR/kJI4AoF3A6+UuGgPBgjqOUA/IffE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1748266205;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHoK+1Dj0DM0rWKrIqSjqkEaALvAF4Jt5oeW6E9s+GE=;
 b=izamxxP79/VKS0MpFj9HrgKQ7yi85gwwdmTZ4de5j11CTvayZ3FD8TbM0JEmvmdtxDEapL
 z52nXY0s444ExdDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E94511397F;
 Mon, 26 May 2025 13:30:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id kJS3N9xsNGgTOQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 26 May 2025 13:30:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: boris.brezillon@collabora.com, dmitry.osipenko@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 4/4] drm/gem: Inline drm_gem_pin() into PRIME helpers
Date: Mon, 26 May 2025 15:25:20 +0200
Message-ID: <20250526132634.531789-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526132634.531789-1-tzimmermann@suse.de>
References: <20250526132634.531789-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.01 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 MID_CONTAINS_FROM(1.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 R_MISSING_CHARSET(0.50)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[]; TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 TO_DN_SOME(0.00)[];
 FREEMAIL_TO(0.00)[collabora.com,gmail.com,ffwll.ch,kernel.org,linux.intel.com];
 RCVD_TLS_ALL(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,suse.de:dkim,collabora.com:email];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCPT_COUNT_SEVEN(0.00)[8];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -3.01
X-Rspamd-Queue-Id: 315A121F7F
X-Spam-Level: 
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

v2:
- clarify comment on pin callback (Dmitry)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/drm_gem.c      | 32 --------------------------------
 drivers/gpu/drm/drm_internal.h |  4 ----
 drivers/gpu/drm/drm_prime.c    | 22 ++++++++++++++++++++--
 include/drm/drm_gem.h          |  3 ++-
 4 files changed, 22 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 1e659d2660f7..a0a3b6baa569 100644
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
index e44f28fd81d3..442eb31351dd 100644
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
index d828502268b8..a1852c02f512 100644
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
index a3133a08267c..1a79ec3fe45c 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -126,7 +126,8 @@ struct drm_gem_object_funcs {
 	/**
 	 * @pin:
 	 *
-	 * Pin backing buffer in memory. Used by the drm_gem_map_attach() helper.
+	 * Pin backing buffer in memory, such that dma-buf importers can
+	 * access it. Used by the drm_gem_map_attach() helper.
 	 *
 	 * This callback is optional.
 	 */
-- 
2.49.0

