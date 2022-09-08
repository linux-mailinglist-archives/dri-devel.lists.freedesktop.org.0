Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF485B1959
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 11:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75BE10EA09;
	Thu,  8 Sep 2022 09:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6A10EA04
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 09:51:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2D2401F95E;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662630680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKUXq1jU9fscS0vxvobwVD3laVK0Jy7Al5cuhXXmtfI=;
 b=yjq74h8nwMLjCX9zPVtSvidVKso5T086izRSLJThLbpzx+yK8jsvU/tzW4h21SaDL42zUb
 5GyVWrt7yeyk/+ZHMjCvnTqAMAT1IUe/aw39sI4TcEMYU3FBee24GJI5dT66KjXHLfIbSk
 mnbuiKhpfkUqy/5MSeEOxtaxxIarTVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662630680;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TKUXq1jU9fscS0vxvobwVD3laVK0Jy7Al5cuhXXmtfI=;
 b=VfkbVJtcyewX9kAP26gH9HfmqMjDzJ7smhLzUpfK52h2LigNtZlr6+ea5wgOeljQcK4trN
 mEx11d0MsUfCf/Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0C55F13A72;
 Thu,  8 Sep 2022 09:51:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EBtzAhi7GWNrUgAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 08 Sep 2022 09:51:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 08/12] drm/udl: Pass rectangle directly to
 udl_handle_damage()
Date: Thu,  8 Sep 2022 11:51:11 +0200
Message-Id: <20220908095115.23396-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220908095115.23396-1-tiwai@suse.de>
References: <20220908095115.23396-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just for some code simplification.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/udl/udl_modeset.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index c9b837ac26a7..0142fc6a478a 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -244,14 +244,13 @@ static long udl_log_cpp(unsigned int cpp)
 
 static int udl_handle_damage(struct drm_framebuffer *fb,
 			     const struct iosys_map *map,
-			     int x, int y, int width, int height)
+			     struct drm_rect *clip)
 {
 	struct drm_device *dev = fb->dev;
 	void *vaddr = map->vaddr; /* TODO: Use mapping abstraction properly */
 	int i, ret;
 	char *cmd;
 	struct urb *urb;
-	struct drm_rect clip;
 	int log_bpp;
 
 	ret = udl_log_cpp(fb->format->cpp[0]);
@@ -259,8 +258,6 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 		return ret;
 	log_bpp = ret;
 
-	drm_rect_init(&clip, x, y, width, height);
-
 	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
 	if (ret)
 		return ret;
@@ -272,11 +269,11 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 	}
 	cmd = urb->transfer_buffer;
 
-	for (i = clip.y1; i < clip.y2; i++) {
+	for (i = clip->y1; i < clip->y2; i++) {
 		const int line_offset = fb->pitches[0] * i;
-		const int byte_offset = line_offset + (clip.x1 << log_bpp);
-		const int dev_byte_offset = (fb->width * i + clip.x1) << log_bpp;
-		const int byte_width = (clip.x2 - clip.x1) << log_bpp;
+		const int byte_offset = line_offset + (clip->x1 << log_bpp);
+		const int dev_byte_offset = (fb->width * i + clip->x1) << log_bpp;
+		const int byte_width = (clip->x2 - clip->x1) << log_bpp;
 		ret = udl_render_hline(dev, log_bpp, &urb, (char *)vaddr,
 				       &cmd, byte_offset, dev_byte_offset,
 				       byte_width);
@@ -329,6 +326,7 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct udl_device *udl = to_udl(dev);
 	struct drm_display_mode *mode = &crtc_state->mode;
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_rect clip;
 	char *buf;
 	char *wrptr;
 	int color_depth = UDL_COLOR_DEPTH_16BPP;
@@ -354,7 +352,8 @@ udl_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	udl->mode_buf_len = wrptr - buf;
 
-	udl_handle_damage(fb, &shadow_plane_state->data[0], 0, 0, fb->width, fb->height);
+	drm_rect_init(&clip, 0, 0, fb->width, fb->height);
+	udl_handle_damage(fb, &shadow_plane_state->data[0], &clip);
 
 	/* enable display */
 	udl_crtc_write_mode_to_hw(crtc);
@@ -396,8 +395,7 @@ udl_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	if (drm_atomic_helper_damage_merged(old_plane_state, state, &rect))
-		udl_handle_damage(fb, &shadow_plane_state->data[0], rect.x1, rect.y1,
-				  rect.x2 - rect.x1, rect.y2 - rect.y1);
+		udl_handle_damage(fb, &shadow_plane_state->data[0], &rect);
 }
 
 static const struct drm_simple_display_pipe_funcs udl_simple_display_pipe_funcs = {
-- 
2.35.3

