Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D553EAEBBE3
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 17:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20A0910EA61;
	Fri, 27 Jun 2025 15:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="DnZJaUiF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLrDyZ+Q";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DnZJaUiF";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KLrDyZ+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4163E10EA61
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 15:24:27 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F34812115E;
 Fri, 27 Jun 2025 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751037866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sog9F9/UqJ7qUMPwP0LqtPCTIMbhzXb5OQpFCVNG2vE=;
 b=DnZJaUiFXq+I54GyNp4AgfNxYaurE6FARpmRwykDDOd0aHnouruEHX1w9lXcIEfXQ2QexC
 tTMvrF1wVHAC9VCdGYHKQG9dNIgEz4Vmp1xPAa0A3loGNme5e6BdAWdGv4zpEVCtXrxQz8
 1GQUYcsvbwjdHcZsJo7dmCxU5p8T4FI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751037866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sog9F9/UqJ7qUMPwP0LqtPCTIMbhzXb5OQpFCVNG2vE=;
 b=KLrDyZ+QnZFpy7jDudhLzXsz3nNj84F+EaoVpZTT47Oop7lxCNCs4OT176z7R6ghKA1A0S
 QBM/XH9HqBWBf2DA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1751037866; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sog9F9/UqJ7qUMPwP0LqtPCTIMbhzXb5OQpFCVNG2vE=;
 b=DnZJaUiFXq+I54GyNp4AgfNxYaurE6FARpmRwykDDOd0aHnouruEHX1w9lXcIEfXQ2QexC
 tTMvrF1wVHAC9VCdGYHKQG9dNIgEz4Vmp1xPAa0A3loGNme5e6BdAWdGv4zpEVCtXrxQz8
 1GQUYcsvbwjdHcZsJo7dmCxU5p8T4FI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1751037866;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=sog9F9/UqJ7qUMPwP0LqtPCTIMbhzXb5OQpFCVNG2vE=;
 b=KLrDyZ+QnZFpy7jDudhLzXsz3nNj84F+EaoVpZTT47Oop7lxCNCs4OT176z7R6ghKA1A0S
 QBM/XH9HqBWBf2DA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AFE80138A7;
 Fri, 27 Jun 2025 15:24:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id xp2NKam3XmjRYAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jun 2025 15:24:25 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/repaper: Do not access GEM-DMA vaddr directly
Date: Fri, 27 Jun 2025 17:24:08 +0200
Message-ID: <20250627152422.8399-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 TAGGED_RCPT(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.30
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

The repaper driver currently reads the vaddr field from the GME buffer
object directly. This only works because GEM code 'automagically' sets
vaddr.

Shadow-plane helpers perform the same steps, but with correct abstraction
behind drm_gem_vmap(). The shadow-plane state provides the buffer address
in kernel address space and the format-conversion state.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/repaper.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 5c3b51eb0a97..4824f863fdba 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -510,13 +510,12 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 	epd->factored_stage_time = epd->stage_time * factor10x / 10;
 }
 
-static int repaper_fb_dirty(struct drm_framebuffer *fb,
+static int repaper_fb_dirty(struct drm_framebuffer *fb, const struct iosys_map *vmap,
 			    struct drm_format_conv_state *fmtcnv_state)
 {
-	struct drm_gem_dma_object *dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
 	unsigned int dst_pitch = 0;
-	struct iosys_map dst, vmap;
+	struct iosys_map dst;
 	struct drm_rect clip;
 	int idx, ret = 0;
 	u8 *buf = NULL;
@@ -546,8 +545,7 @@ static int repaper_fb_dirty(struct drm_framebuffer *fb,
 		goto out_free;
 
 	iosys_map_set_vaddr(&dst, buf);
-	iosys_map_set_vaddr(&vmap, dma_obj->vaddr);
-	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, &vmap, fb, &clip, fmtcnv_state);
+	drm_fb_xrgb8888_to_mono(&dst, &dst_pitch, vmap, fb, &clip, fmtcnv_state);
 
 	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
 
@@ -832,16 +830,15 @@ static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
 				struct drm_plane_state *old_state)
 {
 	struct drm_plane_state *state = pipe->plane.state;
-	struct drm_format_conv_state fmtcnv_state = DRM_FORMAT_CONV_STATE_INIT;
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(state);
 	struct drm_rect rect;
 
 	if (!pipe->crtc.state->active)
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
-		repaper_fb_dirty(state->fb, &fmtcnv_state);
-
-	drm_format_conv_state_release(&fmtcnv_state);
+		repaper_fb_dirty(state->fb, shadow_plane_state->data,
+				 &shadow_plane_state->fmtcnv_state);
 }
 
 static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
@@ -849,6 +846,7 @@ static const struct drm_simple_display_pipe_funcs repaper_pipe_funcs = {
 	.enable = repaper_pipe_enable,
 	.disable = repaper_pipe_disable,
 	.update = repaper_pipe_update,
+	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
 static int repaper_connector_get_modes(struct drm_connector *connector)
-- 
2.50.0

