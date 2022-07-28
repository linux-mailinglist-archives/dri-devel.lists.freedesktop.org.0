Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C82583F16
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68A094851;
	Thu, 28 Jul 2022 12:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98D0090A13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jul 2022 12:41:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17CCF20273;
 Thu, 28 Jul 2022 12:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659012066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxQAR/HAiHCBMuUUpTDWZvrURD+vRh0ReB03g/0ahaM=;
 b=NVxzbq7gJP/yIw5DB/5o1NG3WZwySXRfHd+Aiy99dVyZEDFpJijKCqYwqp3dp4fMnR5huf
 tk+/gBE1RqWDt94R7R4aRxEzVp0vHOfRKZlI6XzkP5M1p2+hxlpC2YAwZu7i9ckKkzLCfq
 Nu8M/moMYEOfM5/WINku4M0rTIIquqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659012066;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WxQAR/HAiHCBMuUUpTDWZvrURD+vRh0ReB03g/0ahaM=;
 b=zbRCNIfLd/OR4qC3Sy1qNImGKqzQCngj9psOcw6lUlCKvEURWsHH+NyCV3CVKPWpBwxIN/
 mxlIG7696wTA8iBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1EFC13A7E;
 Thu, 28 Jul 2022 12:41:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eFZLNuGD4mJwMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Jul 2022 12:41:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, sam@ravnborg.org, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 06/14] drm/mgag200: Reorganize before dropping simple-KMS
 helpers
Date: Thu, 28 Jul 2022 14:40:55 +0200
Message-Id: <20220728124103.30159-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728124103.30159-1-tzimmermann@suse.de>
References: <20220728124103.30159-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move around some modesetting code before dropping simple-KMS helpers.
Makes the next patch more readable. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Jocelyn Falempe <jfalempe@redhat.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 95 +++++++++++++-------------
 1 file changed, 47 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 93e55f820eb5..67795135d4dd 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -603,42 +603,31 @@ static void mgag200_disable_display(struct mga_device *mdev)
 	WREG_ECRT(0x01, crtcext1);
 }
 
-/*
- * Connector
- */
-
-static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
+static void mgag200_handle_damage(struct mga_device *mdev, const struct iosys_map *vmap,
+				  struct drm_framebuffer *fb, const struct drm_rect *clip)
 {
-	struct mga_device *mdev = to_mga_device(connector->dev);
-	int ret;
-
-	/*
-	 * Protect access to I/O registers from concurrent modesetting
-	 * by acquiring the I/O-register lock.
-	 */
-	mutex_lock(&mdev->rmmio_lock);
-	ret = drm_connector_helper_get_modes_from_ddc(connector);
-	mutex_unlock(&mdev->rmmio_lock);
+	void __iomem *dst = mdev->vram;
+	void *vaddr = vmap[0].vaddr; /* TODO: Use mapping abstraction properly */
 
-	return ret;
+	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
+	drm_fb_memcpy_toio(dst, fb->pitches[0], vaddr, fb, clip);
 }
 
-static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
-	.get_modes  = mgag200_vga_connector_helper_get_modes,
-};
-
-static const struct drm_connector_funcs mga_vga_connector_funcs = {
-	.reset                  = drm_atomic_helper_connector_reset,
-	.fill_modes             = drm_helper_probe_single_connector_modes,
-	.destroy                = drm_connector_cleanup,
-	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
-	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
-};
-
 /*
  * Simple Display Pipe
  */
 
+static const uint32_t mgag200_simple_display_pipe_formats[] = {
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_RGB888,
+};
+
+static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	DRM_FORMAT_MOD_INVALID
+};
+
 static enum drm_mode_status
 mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 				       const struct drm_display_mode *mode)
@@ -670,17 +659,6 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 	return MODE_OK;
 }
 
-static void
-mgag200_handle_damage(struct mga_device *mdev, struct drm_framebuffer *fb,
-		      struct drm_rect *clip, const struct iosys_map *map)
-{
-	void __iomem *dst = mdev->vram;
-	void *vmap = map->vaddr; /* TODO: Use mapping abstraction properly */
-
-	dst += drm_fb_clip_offset(fb->pitches[0], fb->format, clip);
-	drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, clip);
-}
-
 static void
 mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 				   struct drm_crtc_state *crtc_state,
@@ -728,7 +706,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	mgag200_enable_display(mdev);
 
-	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
+	mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &fullscreen);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
@@ -809,7 +787,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 
 	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
+		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
 	}
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
@@ -877,15 +855,36 @@ mgag200_simple_display_pipe_funcs = {
 	DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
 };
 
-static const uint32_t mgag200_simple_display_pipe_formats[] = {
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
+/*
+ * Connector
+ */
+
+static int mgag200_vga_connector_helper_get_modes(struct drm_connector *connector)
+{
+	struct mga_device *mdev = to_mga_device(connector->dev);
+	int ret;
+
+	/*
+	 * Protect access to I/O registers from concurrent modesetting
+	 * by acquiring the I/O-register lock.
+	 */
+	mutex_lock(&mdev->rmmio_lock);
+	ret = drm_connector_helper_get_modes_from_ddc(connector);
+	mutex_unlock(&mdev->rmmio_lock);
+
+	return ret;
+}
+
+static const struct drm_connector_helper_funcs mga_vga_connector_helper_funcs = {
+	.get_modes  = mgag200_vga_connector_helper_get_modes,
 };
 
-static const uint64_t mgag200_simple_display_pipe_fmtmods[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
+static const struct drm_connector_funcs mga_vga_connector_funcs = {
+	.reset                  = drm_atomic_helper_connector_reset,
+	.fill_modes             = drm_helper_probe_single_connector_modes,
+	.destroy                = drm_connector_cleanup,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state   = drm_atomic_helper_connector_destroy_state,
 };
 
 /*
-- 
2.37.1

