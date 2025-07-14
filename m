Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 639DBB04357
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 17:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C7410E4B3;
	Mon, 14 Jul 2025 15:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C9C10E4B9
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 15:18:37 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C6F832125F;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A4A6F13A57;
 Mon, 14 Jul 2025 15:18:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cGSbJsAfdWhbMgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 14 Jul 2025 15:18:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 9/9] drm/vesadrm: Support DRM_FORMAT_C8
Date: Mon, 14 Jul 2025 17:13:09 +0200
Message-ID: <20250714151513.309475-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714151513.309475-1-tzimmermann@suse.de>
References: <20250714151513.309475-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: C6F832125F
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Score: -4.00
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

Add support for DRM_FORMAT_C8 to vesadrm. The new pixel-format
description PIXEL_FORMAT_C8 describes the layout. Vesadrm's helpers
vesadrm_fill_palette_lut() and vesadrm_load_palette_lut() set the
hardware palette according to the CRTC's output format.

The driver emulates XRGB8888 by converting the source buffer to
RGB332 and using the resulting 256 colors as index into the hardware
palette. The hardware palette converts back to RGB during scanout.
This has no overhead compared to other format conversion, but allows
common userspace, such as Wayland compositors, to operate on the
display.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/vesadrm.c | 114 +++++++++++++++++++++++++++++++-
 include/video/pixel_format.h    |   3 +
 2 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
index b6e5ed1863f9..1170e71e4208 100644
--- a/drivers/gpu/drm/sysfb/vesadrm.c
+++ b/drivers/gpu/drm/sysfb/vesadrm.c
@@ -46,6 +46,7 @@ static const struct drm_format_info *vesadrm_get_format_si(struct drm_device *de
 		{ PIXEL_FORMAT_RGB888, DRM_FORMAT_RGB888, },
 		{ PIXEL_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, },
 		{ PIXEL_FORMAT_XBGR8888, DRM_FORMAT_XBGR8888, },
+		{ PIXEL_FORMAT_C8, DRM_FORMAT_C8, },
 	};
 
 	return drm_sysfb_get_format_si(dev, formats, ARRAY_SIZE(formats), si);
@@ -192,6 +193,44 @@ static void vesadrm_load_gamma_lut(struct vesadrm_device *vesa,
 	}
 }
 
+static void vesadrm_fill_palette_lut(struct vesadrm_device *vesa,
+				     const struct drm_format_info *format)
+{
+	struct drm_device *dev = &vesa->sysfb.dev;
+	struct drm_crtc *crtc = &vesa->crtc;
+
+	switch (format->format) {
+	case DRM_FORMAT_C8:
+		drm_crtc_fill_palette_8(crtc, vesadrm_set_color_lut);
+		break;
+	case DRM_FORMAT_RGB332:
+		drm_crtc_fill_palette_332(crtc, vesadrm_set_color_lut);
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for palette\n",
+			      &format->format);
+		break;
+	}
+}
+
+static void vesadrm_load_palette_lut(struct vesadrm_device *vesa,
+				     const struct drm_format_info *format,
+				     struct drm_color_lut *lut)
+{
+	struct drm_device *dev = &vesa->sysfb.dev;
+	struct drm_crtc *crtc = &vesa->crtc;
+
+	switch (format->format) {
+	case DRM_FORMAT_C8:
+		drm_crtc_load_palette_8(crtc, lut, vesadrm_set_color_lut);
+		break;
+	default:
+		drm_warn_once(dev, "Unsupported format %p4cc for gamma correction\n",
+			      &format->format);
+		break;
+	}
+}
+
 /*
  * Modesetting
  */
@@ -200,8 +239,67 @@ static const u64 vesadrm_primary_plane_format_modifiers[] = {
 	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
 };
 
+static int vesadrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
+						     struct drm_atomic_state *new_state)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_sysfb_crtc_state *new_sysfb_crtc_state;
+	int ret;
+
+	ret = drm_sysfb_plane_helper_atomic_check(plane, new_state);
+	if (ret)
+		return ret;
+	else if (!new_plane_state->visible)
+		return 0;
+
+	/*
+	 * Fix up format conversion for specific cases
+	 */
+
+	switch (sysfb->fb_format->format) {
+	case DRM_FORMAT_C8:
+		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
+		new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
+
+		switch (new_fb->format->format) {
+		case DRM_FORMAT_XRGB8888:
+			/*
+			 * Reduce XRGB8888 to RGB332. Each resulting pixel is an index
+			 * into the C8 hardware palette, which stores RGB332 colors.
+			 */
+			if (new_sysfb_crtc_state->format->format != DRM_FORMAT_RGB332) {
+				new_sysfb_crtc_state->format =
+					drm_format_info(DRM_FORMAT_RGB332);
+				new_crtc_state->color_mgmt_changed = true;
+			}
+			break;
+		case DRM_FORMAT_C8:
+			/*
+			 * Restore original output. Emulation of XRGB8888 set RBG332
+			 * output format and hardware palette. This needs to be undone
+			 * when we switch back to DRM_FORMAT_C8.
+			 */
+			if (new_sysfb_crtc_state->format->format == DRM_FORMAT_RGB332) {
+				new_sysfb_crtc_state->format = sysfb->fb_format;
+				new_crtc_state->color_mgmt_changed = true;
+			}
+			break;
+		}
+		break;
+	};
+
+	return 0;
+}
+
 static const struct drm_plane_helper_funcs vesadrm_primary_plane_helper_funcs = {
-	DRM_SYSFB_PLANE_HELPER_FUNCS,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+	.atomic_check = vesadrm_primary_plane_helper_atomic_check,
+	.atomic_update = drm_sysfb_plane_helper_atomic_update,
+	.atomic_disable = drm_sysfb_plane_helper_atomic_disable,
+	.get_scanout_buffer = drm_sysfb_plane_helper_get_scanout_buffer,
 };
 
 static const struct drm_plane_funcs vesadrm_primary_plane_funcs = {
@@ -224,6 +322,20 @@ static void vesadrm_crtc_helper_atomic_flush(struct drm_crtc *crtc,
 	 */
 	if (crtc_state->enable && crtc_state->color_mgmt_changed) {
 		switch (sysfb->fb_format->format) {
+		/*
+		 * Index formats
+		 */
+		case DRM_FORMAT_C8:
+			if (sysfb_crtc_state->format->format == DRM_FORMAT_RGB332) {
+				vesadrm_fill_palette_lut(vesa, sysfb_crtc_state->format);
+			} else if (crtc->state->gamma_lut) {
+				vesadrm_load_palette_lut(vesa,
+							 sysfb_crtc_state->format,
+							 crtc_state->gamma_lut->data);
+			} else {
+				vesadrm_fill_palette_lut(vesa, sysfb_crtc_state->format);
+			}
+			break;
 		/*
 		 * Component formats
 		 */
diff --git a/include/video/pixel_format.h b/include/video/pixel_format.h
index c57019cd6ea8..6874754b0474 100644
--- a/include/video/pixel_format.h
+++ b/include/video/pixel_format.h
@@ -20,6 +20,9 @@ struct pixel_format {
 	};
 };
 
+#define PIXEL_FORMAT_C8 \
+	{ 8, true, { .index = {0, 8}, } }
+
 #define PIXEL_FORMAT_XRGB1555 \
 	{ 16, false, { .alpha = {0, 0}, .red = {10, 5}, .green = {5, 5}, .blue = {0, 5} } }
 
-- 
2.50.0

