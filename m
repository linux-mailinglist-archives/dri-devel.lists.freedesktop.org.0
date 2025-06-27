Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DA6AEBB95
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 17:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E1210E9DE;
	Fri, 27 Jun 2025 15:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="lycZtdtj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jnbznMtl";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="lycZtdtj";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jnbznMtl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EDD10E9DE
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 15:23:31 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7143C1F38C;
 Fri, 27 Jun 2025 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751037810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yEdeWZ/YCeoEj65dUGvOfLC+hui9FMse5eQTaYcj4vI=;
 b=lycZtdtjyjiJpFzWkgLQxCC6sdcsPQtymsDznrXt25BBQb1RQuCwvLRSOgsTFAlAjZ8w2t
 0qU0oq72nlRtOXENBdno1IPzy032GF5YadySURG44mfdWXFKdptfXx4WqZ7l5vuGc8BcoT
 kU31B0UwmQZfVbDSNUn//gjXx2DpgIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751037810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yEdeWZ/YCeoEj65dUGvOfLC+hui9FMse5eQTaYcj4vI=;
 b=jnbznMtlnYnqyPg2CjQzqqAZ5FaOMVoA1cG0Cy3SvMyBARoVz0PU1+tN4faHhYcQAtM7w2
 yuioR3DLH7iyAoBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751037810; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yEdeWZ/YCeoEj65dUGvOfLC+hui9FMse5eQTaYcj4vI=;
 b=lycZtdtjyjiJpFzWkgLQxCC6sdcsPQtymsDznrXt25BBQb1RQuCwvLRSOgsTFAlAjZ8w2t
 0qU0oq72nlRtOXENBdno1IPzy032GF5YadySURG44mfdWXFKdptfXx4WqZ7l5vuGc8BcoT
 kU31B0UwmQZfVbDSNUn//gjXx2DpgIc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751037810;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yEdeWZ/YCeoEj65dUGvOfLC+hui9FMse5eQTaYcj4vI=;
 b=jnbznMtlnYnqyPg2CjQzqqAZ5FaOMVoA1cG0Cy3SvMyBARoVz0PU1+tN4faHhYcQAtM7w2
 yuioR3DLH7iyAoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 38255138A7;
 Fri, 27 Jun 2025 15:23:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id B3VJDHK3XmiSYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 15:23:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/sharp-memory: Do not access GEM-DMA vaddr directly
Date: Fri, 27 Jun 2025 17:23:09 +0200
Message-ID: <20250627152327.8244-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 SUSPICIOUS_RECIPS(1.50)[]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,ffwll.ch];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; ARC_NA(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_TLS_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Use DRM's shadow-plane helper to map and access the GEM object's buffer
within kernel address space. Encasulates the vmap logic in the GEM-DMA
helpers.

The sharp-memory driver currently reads the vaddr field from the GME
buffer object directly. This only works because GEM code 'automagically'
sets vaddr.

Shadow-plane helpers perform the same steps, but with correct abstraction
behind drm_gem_vmap(). The shadow-plane state provides the buffer address
in kernel address space and the format-conversion state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 03d2850310c4..64272cd0f6e2 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -126,28 +126,28 @@ static inline void sharp_memory_set_tx_buffer_addresses(u8 *buffer,
 
 static void sharp_memory_set_tx_buffer_data(u8 *buffer,
 					    struct drm_framebuffer *fb,
+					    const struct iosys_map *vmap,
 					    struct drm_rect clip,
 					    u32 pitch,
 					    struct drm_format_conv_state *fmtcnv_state)
 {
 	int ret;
-	struct iosys_map dst, vmap;
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
+	struct iosys_map dst;
 
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return;
 
 	iosys_map_set_vaddr(&dst, buffer);
-	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
 
-	drm_fb_xrgb8888_to_mono(&dst, &pitch, &vmap, fb, &clip, fmtcnv_state);
+	drm_fb_xrgb8888_to_mono(&dst, &pitch, vmap, fb, &clip, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 }
 
 static int sharp_memory_update_display(struct sharp_memory_device *smd,
 				       struct drm_framebuffer *fb,
+				       const struct iosys_map *vmap,
 				       struct drm_rect clip,
 				       struct drm_format_conv_state *fmtcnv_state)
 {
@@ -163,7 +163,7 @@ static int sharp_memory_update_display(struct sharp_memory_device *smd,
 	sharp_memory_set_tx_buffer_mode(&tx_buffer[0],
 					SHARP_MEMORY_DISPLAY_UPDATE_MODE, vcom);
 	sharp_memory_set_tx_buffer_addresses(&tx_buffer[1], clip, pitch);
-	sharp_memory_set_tx_buffer_data(&tx_buffer[2], fb, clip, pitch, fmtcnv_state);
+	sharp_memory_set_tx_buffer_data(&tx_buffer[2], fb, vmap, clip, pitch, fmtcnv_state);
 
 	ret = sharp_memory_spi_write(smd->spi, tx_buffer, tx_buffer_size);
 
@@ -206,7 +206,8 @@ static int sharp_memory_clear_display(struct sharp_memory_device *smd)
 	return ret;
 }
 
-static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect,
+static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *vmap,
+				  struct drm_rect *rect,
 				  struct drm_format_conv_state *fmtconv_state)
 {
 	struct drm_rect clip;
@@ -218,7 +219,7 @@ static void sharp_memory_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *r
 	clip.y1 = rect->y1;
 	clip.y2 = rect->y2;
 
-	sharp_memory_update_display(smd, fb, clip, fmtconv_state);
+	sharp_memory_update_display(smd, fb, vmap, clip, fmtconv_state);
 }
 
 static int sharp_memory_plane_atomic_check(struct drm_plane *plane,
@@ -242,7 +243,7 @@ static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
 {
 	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state, plane);
 	struct drm_plane_state *plane_state = plane->state;
-	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct sharp_memory_device *smd;
 	struct drm_rect rect;
 
@@ -251,15 +252,15 @@ static void sharp_memory_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, plane_state, &rect))
-		sharp_memory_fb_dirty(plane_state->fb, &rect, &fmtcnv_state);
-
-	drm_format_conv_state_release(&fmtcnv_state);
+		sharp_memory_fb_dirty(plane_state->fb, shadow_plane_state->data,
+				      &rect, &shadow_plane_state->fmtcnv_state);
 }
 
 static const struct drm_plane_helper_funcs sharp_memory_plane_helper_funcs = {
 	.prepare_fb = drm_gem_plane_helper_prepare_fb,
 	.atomic_check = sharp_memory_plane_atomic_check,
 	.atomic_update = sharp_memory_plane_atomic_update,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 };
 
 static bool sharp_memory_format_mod_supported(struct drm_plane *plane,
@@ -273,9 +274,7 @@ static const struct drm_plane_funcs sharp_memory_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
 	.destroy = drm_plane_cleanup,
-	.reset = drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
+	DRM_GEM_SHADOW_PLANE_FUNCS,
 	.format_mod_supported = sharp_memory_format_mod_supported,
 };
 
-- 
2.50.0

