Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD62577EA4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 11:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C5B8D1B6;
	Mon, 18 Jul 2022 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1FB8D79C
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 09:27:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1948F20D3C;
 Mon, 18 Jul 2022 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658136476; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vni44vf+rdlW0aEa8Wb2M4+aeiFAPyP/yXW/ysBOFic=;
 b=ZgDtU1vcITgLJDWsCt1e8hCH8GBXOz0DcU6tPLYEsP/Fko8gvhw0xaENoPq5Rw6DCv6QYP
 ipfQIudhqFfispVJRgwNBycVlhNbtoocEGaV3vwo/Ka9iLbYjQu4YO4JqluhruHWFqzFhP
 uFTVzqjFWH9c6uLWmr4rIDC2Klntc0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658136476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vni44vf+rdlW0aEa8Wb2M4+aeiFAPyP/yXW/ysBOFic=;
 b=CUvI9IyTcm+2Ru8JCb9+gk/I+/13JlFhkpqkWGznPVC0oraHMYGUcoXHLkVOcT3u6Dl07I
 u4rZ1+0JJdob6jDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E4C6B13754;
 Mon, 18 Jul 2022 09:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iIYFN5sn1WJ6LgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Jul 2022 09:27:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: sam@ravnborg.org, airlied@redhat.com, airlied@linux.ie,
 jfalempe@redhat.com, daniel@ffwll.ch
Subject: [PATCH v2 06/14] drm/mgag200: Reorganize before dropping simple-KMS
 helpers
Date: Mon, 18 Jul 2022 11:27:45 +0200
Message-Id: <20220718092753.9598-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718092753.9598-1-tzimmermann@suse.de>
References: <20220718092753.9598-1-tzimmermann@suse.de>
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
index bbd1d97a926f..fe11bb5d092e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -604,42 +604,31 @@ static void mgag200_disable_display(struct mga_device *mdev)
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
@@ -671,17 +660,6 @@ mgag200_simple_display_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
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
@@ -729,7 +707,7 @@ mgag200_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 
 	mgag200_enable_display(mdev);
 
-	mgag200_handle_damage(mdev, fb, &fullscreen, &shadow_plane_state->data[0]);
+	mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &fullscreen);
 
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
@@ -810,7 +788,7 @@ mgag200_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 
 	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
 	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		mgag200_handle_damage(mdev, fb, &damage, &shadow_plane_state->data[0]);
+		mgag200_handle_damage(mdev, shadow_plane_state->data, fb, &damage);
 	}
 	/* Always scanout image at VRAM offset 0 */
 	mgag200_set_startadd(mdev, (u32)0);
@@ -878,15 +856,36 @@ mgag200_simple_display_pipe_funcs = {
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
2.36.1

