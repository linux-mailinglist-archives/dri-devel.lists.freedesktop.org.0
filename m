Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACCC96856A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4262610E28C;
	Mon,  2 Sep 2024 10:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3B110E106
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:55:51 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 805CD21B5A;
 Mon,  2 Sep 2024 10:55:50 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4965813AE5;
 Mon,  2 Sep 2024 10:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uOa0ELaZ1WZQcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Sep 2024 10:55:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 07/10] drm/bochs: Use regular atomic helpers
Date: Mon,  2 Sep 2024 12:53:45 +0200
Message-ID: <20240902105546.792625-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902105546.792625-1-tzimmermann@suse.de>
References: <20240902105546.792625-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 805CD21B5A
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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

Remove the simple display pipeline in favor of the regular atomic
helpers in bochs. The simple-pipe helpers are considered deprecated
in DRM.

This effectivly inlines the simple-pipe code for plane and CRTC
support. Instead of a single update helper, there's now a mode-set
helper for the CRTC and an update helper for the plane. The encoder
changes type from NONE ot VIRTUAL.

Removing simple-pipe helpers from bochs will allow for related
cleanups in GEM VRAM helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 177 ++++++++++++++++++++++++++---------
 1 file changed, 132 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 5679f1b090af..76e29950a807 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -4,6 +4,7 @@
 #include <linux/pci.h>
 
 #include <drm/drm_aperture.h>
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
@@ -14,8 +15,8 @@
 #include <drm/drm_gem_vram_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
+#include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
 
 #include <video/vga.h>
 
@@ -89,7 +90,9 @@ struct bochs_device {
 	u32 bpp;
 
 	/* drm */
-	struct drm_simple_display_pipe pipe;
+	struct drm_plane primary_plane;
+	struct drm_crtc crtc;
+	struct drm_encoder encoder;
 	struct drm_connector connector;
 };
 
@@ -396,11 +399,34 @@ static void bochs_hw_setbase(struct bochs_device *bochs, int x, int y, int strid
 
 /* ---------------------------------------------------------------------- */
 
-static const uint32_t bochs_formats[] = {
+static const uint32_t bochs_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_BGRX8888,
 };
 
+static int bochs_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						   struct drm_atomic_state *state)
+{
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
+
+	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
+						  DRM_PLANE_NO_SCALING,
+						  DRM_PLANE_NO_SCALING,
+						  false, false);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	return 0;
+}
+
 static void bochs_plane_update(struct bochs_device *bochs, struct drm_plane_state *state)
 {
 	struct drm_gem_vram_object *gbo;
@@ -422,37 +448,80 @@ static void bochs_plane_update(struct bochs_device *bochs, struct drm_plane_stat
 	bochs_hw_setformat(bochs, state->fb->format);
 }
 
-static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
-			      struct drm_crtc_state *crtc_state,
-			      struct drm_plane_state *plane_state)
+static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						     struct drm_atomic_state *state)
 {
-	struct bochs_device *bochs = to_bochs_device(pipe->crtc.dev);
+	struct bochs_device *bochs = to_bochs_device(plane->dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
 
-	bochs_hw_setmode(bochs, &crtc_state->mode);
 	bochs_plane_update(bochs, plane_state);
 }
 
-static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
+static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
+	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
+	.atomic_check = bochs_primary_plane_helper_atomic_check,
+	.atomic_update = bochs_primary_plane_helper_atomic_update,
+};
+
+static const struct drm_plane_funcs bochs_primary_plane_funcs = {
+	.update_plane		= drm_atomic_helper_update_plane,
+	.disable_plane		= drm_atomic_helper_disable_plane,
+	.destroy		= drm_plane_cleanup,
+	.reset			= drm_atomic_helper_plane_reset,
+	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
+	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+};
+
+static void bochs_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
+{
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
+	struct drm_crtc_state *crtc_state = crtc->state;
+
+	bochs_hw_setmode(bochs, &crtc_state->mode);
+}
+
+static int bochs_crtc_helper_atomic_check(struct drm_crtc *crtc,
+					  struct drm_atomic_state *state)
 {
-	struct bochs_device *bochs = to_bochs_device(pipe->crtc.dev);
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
 
-	bochs_hw_blank(bochs, true);
+	if (!crtc_state->enable)
+		return 0;
+
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
+}
+
+static void bochs_crtc_helper_atomic_enable(struct drm_crtc *crtc,
+					    struct drm_atomic_state *state)
+{
 }
 
-static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
-			      struct drm_plane_state *old_state)
+static void bochs_crtc_helper_atomic_disable(struct drm_crtc *crtc,
+					     struct drm_atomic_state *crtc_state)
 {
-	struct bochs_device *bochs = to_bochs_device(pipe->crtc.dev);
+	struct bochs_device *bochs = to_bochs_device(crtc->dev);
 
-	bochs_plane_update(bochs, pipe->plane.state);
+	bochs_hw_blank(bochs, true);
 }
 
-static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
-	.enable	    = bochs_pipe_enable,
-	.disable    = bochs_pipe_disable,
-	.update	    = bochs_pipe_update,
-	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
-	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
+static const struct drm_crtc_helper_funcs bochs_crtc_helper_funcs = {
+	.mode_set_nofb = bochs_crtc_helper_mode_set_nofb,
+	.atomic_check = bochs_crtc_helper_atomic_check,
+	.atomic_enable = bochs_crtc_helper_atomic_enable,
+	.atomic_disable = bochs_crtc_helper_atomic_disable,
+};
+
+static const struct drm_crtc_funcs bochs_crtc_funcs = {
+	.reset = drm_atomic_helper_crtc_reset,
+	.destroy = drm_crtc_cleanup,
+	.set_config = drm_atomic_helper_set_config,
+	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+};
+
+static const struct drm_encoder_funcs bochs_encoder_funcs = {
+	.destroy = drm_encoder_cleanup,
 };
 
 static int bochs_connector_helper_get_modes(struct drm_connector *connector)
@@ -475,11 +544,11 @@ static int bochs_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 }
 
-static const struct drm_connector_helper_funcs bochs_connector_connector_helper_funcs = {
+static const struct drm_connector_helper_funcs bochs_connector_helper_funcs = {
 	.get_modes = bochs_connector_helper_get_modes,
 };
 
-static const struct drm_connector_funcs bochs_connector_connector_funcs = {
+static const struct drm_connector_funcs bochs_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = drm_connector_cleanup,
 	.reset = drm_atomic_helper_connector_reset,
@@ -487,18 +556,7 @@ static const struct drm_connector_funcs bochs_connector_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
-static void bochs_connector_init(struct bochs_device *bochs)
-{
-	struct drm_device *dev = &bochs->dev;
-	struct drm_connector *connector = &bochs->connector;
-
-	drm_connector_init(dev, connector, &bochs_connector_connector_funcs,
-			   DRM_MODE_CONNECTOR_VIRTUAL);
-	drm_connector_attach_edid_property(connector);
-	drm_connector_helper_add(connector, &bochs_connector_connector_helper_funcs);
-}
-
-static const struct drm_mode_config_funcs bochs_mode_funcs = {
+static const struct drm_mode_config_funcs bochs_mode_config_funcs = {
 	.fb_create = drm_gem_fb_create,
 	.mode_valid = drm_vram_helper_mode_valid,
 	.atomic_check = drm_atomic_helper_check,
@@ -508,6 +566,10 @@ static const struct drm_mode_config_funcs bochs_mode_funcs = {
 static int bochs_kms_init(struct bochs_device *bochs)
 {
 	struct drm_device *dev = &bochs->dev;
+	struct drm_plane *primary_plane;
+	struct drm_crtc *crtc;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -518,19 +580,44 @@ static int bochs_kms_init(struct bochs_device *bochs)
 	dev->mode_config.max_height = 8192;
 
 	dev->mode_config.preferred_depth = 24;
-	dev->mode_config.prefer_shadow = 0;
 	dev->mode_config.quirk_addfb_prefer_host_byte_order = true;
 
-	dev->mode_config.funcs = &bochs_mode_funcs;
+	dev->mode_config.funcs = &bochs_mode_config_funcs;
 
-	bochs_connector_init(bochs);
-	drm_simple_display_pipe_init(dev,
-				     &bochs->pipe,
-				     &bochs_pipe_funcs,
-				     bochs_formats,
-				     ARRAY_SIZE(bochs_formats),
-				     NULL,
-				     &bochs->connector);
+	primary_plane = &bochs->primary_plane;
+	ret = drm_universal_plane_init(dev, primary_plane, 0,
+				       &bochs_primary_plane_funcs,
+				       bochs_primary_plane_formats,
+				       ARRAY_SIZE(bochs_primary_plane_formats),
+				       NULL,
+				       DRM_PLANE_TYPE_PRIMARY, NULL);
+	if (ret)
+		return ret;
+	drm_plane_helper_add(primary_plane, &bochs_primary_plane_helper_funcs);
+	drm_plane_enable_fb_damage_clips(primary_plane);
+
+	crtc = &bochs->crtc;
+	ret = drm_crtc_init_with_planes(dev, crtc, primary_plane, NULL,
+					&bochs_crtc_funcs, NULL);
+	if (ret)
+		return ret;
+	drm_crtc_helper_add(crtc, &bochs_crtc_helper_funcs);
+
+	encoder = &bochs->encoder;
+	ret = drm_encoder_init(dev, encoder, &bochs_encoder_funcs,
+			       DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (ret)
+		return ret;
+	encoder->possible_crtcs = drm_crtc_mask(crtc);
+
+	connector = &bochs->connector;
+	ret = drm_connector_init(dev, connector, &bochs_connector_funcs,
+				 DRM_MODE_CONNECTOR_VIRTUAL);
+	if (ret)
+		return ret;
+	drm_connector_helper_add(connector, &bochs_connector_helper_funcs);
+	drm_connector_attach_edid_property(connector);
+	drm_connector_attach_encoder(connector, encoder);
 
 	drm_mode_config_reset(dev);
 
-- 
2.46.0

