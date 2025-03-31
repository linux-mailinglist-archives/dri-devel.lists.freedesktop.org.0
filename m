Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C1DA76B78
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 17:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB8C10E44B;
	Mon, 31 Mar 2025 15:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B7B10E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 15:59:38 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B6141F749;
 Mon, 31 Mar 2025 15:59:03 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 019DB13A1F;
 Mon, 31 Mar 2025 15:59:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id +LKrOsa76mfdVQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 31 Mar 2025 15:59:02 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/18] drm/sysfb: Merge CRTC functions
Date: Mon, 31 Mar 2025 17:52:13 +0200
Message-ID: <20250331155538.1173333-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331155538.1173333-1-tzimmermann@suse.de>
References: <20250331155538.1173333-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 3B6141F749
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

Merge the CRTC functions of ofdrm and simpledrm. Replace the code
in each driver with the shared helpers. Set up callbacks with
initializer macros.

Ofdrm supports a gamma LUT, while simpledrm does not. So far ofdrm's
LUT size has been hard-coded in the driver CRTC's atomic_check helper.
Now pass the size of the LUT to the sysfb device. Ofdrm's custom
atomic_flush is still required to apply changes to the LUT. Simpledrm
passes a LUT size of 0, which disables the gamma LUT.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 40 ++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  9 ++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 53 ++++--------------------
 drivers/gpu/drm/sysfb/simpledrm.c        | 17 +-------
 4 files changed, 57 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index 368061b6f5146..ed9139f56e590 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -4,6 +4,8 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -48,6 +50,44 @@ static void drm_sysfb_crtc_state_destroy(struct drm_sysfb_crtc_state *sysfb_crtc
 	kfree(sysfb_crtc_state);
 }
 
+enum drm_mode_status drm_sysfb_crtc_helper_mode_valid(struct drm_crtc *crtc,
+						      const struct drm_display_mode *mode)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
+
+	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sysfb->fb_mode);
+}
+EXPORT_SYMBOL(drm_sysfb_crtc_helper_mode_valid);
+
+int drm_sysfb_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
+	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
+	int ret;
+
+	if (!new_crtc_state->enable)
+		return 0;
+
+	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
+	if (ret)
+		return ret;
+
+	if (new_crtc_state->color_mgmt_changed) {
+		const size_t gamma_lut_length =
+			sysfb->fb_gamma_lut_size * sizeof(struct drm_color_lut);
+		const struct drm_property_blob *gamma_lut = new_crtc_state->gamma_lut;
+
+		if (gamma_lut && (gamma_lut->length != gamma_lut_length)) {
+			drm_dbg(dev, "Incorrect gamma_lut length %zu\n", gamma_lut->length);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sysfb_crtc_helper_atomic_check);
+
 void drm_sysfb_crtc_reset(struct drm_crtc *crtc)
 {
 	struct drm_sysfb_crtc_state *sysfb_crtc_state;
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index 91da27405a46d..c8e5ac6b9b63a 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -28,6 +28,7 @@ struct drm_sysfb_device {
 	struct drm_display_mode fb_mode;
 	const struct drm_format_info *fb_format;
 	unsigned int fb_pitch;
+	unsigned int fb_gamma_lut_size;
 
 	/* hardware-framebuffer kernel address */
 	struct iosys_map fb_addr;
@@ -55,6 +56,14 @@ to_drm_sysfb_crtc_state(struct drm_crtc_state *base)
 	return container_of(base, struct drm_sysfb_crtc_state, base);
 }
 
+enum drm_mode_status drm_sysfb_crtc_helper_mode_valid(struct drm_crtc *crtc,
+						      const struct drm_display_mode *mode);
+int drm_sysfb_crtc_helper_atomic_check(struct drm_crtc *crtc, struct drm_atomic_state *new_state);
+
+#define DRM_SYSFB_CRTC_HELPER_FUNCS \
+	.mode_valid = drm_sysfb_crtc_helper_mode_valid, \
+	.atomic_check = drm_sysfb_crtc_helper_atomic_check
+
 void drm_sysfb_crtc_reset(struct drm_crtc *crtc);
 struct drm_crtc_state *drm_sysfb_crtc_atomic_duplicate_state(struct drm_crtc *crtc);
 void drm_sysfb_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state);
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index faaf35ba17f36..29dbb69dd7ac0 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -862,42 +862,6 @@ static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
-static enum drm_mode_status ofdrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
-							 const struct drm_display_mode *mode)
-{
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
-
-	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sysfb->fb_mode);
-}
-
-static int ofdrm_crtc_helper_atomic_check(struct drm_crtc *crtc,
-					  struct drm_atomic_state *new_state)
-{
-	static const size_t gamma_lut_length = OFDRM_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut);
-
-	struct drm_device *dev = crtc->dev;
-	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-	int ret;
-
-	if (!new_crtc_state->enable)
-		return 0;
-
-	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-	if (ret)
-		return ret;
-
-	if (new_crtc_state->color_mgmt_changed) {
-		struct drm_property_blob *gamma_lut = new_crtc_state->gamma_lut;
-
-		if (gamma_lut && (gamma_lut->length != gamma_lut_length)) {
-			drm_dbg(dev, "Incorrect gamma_lut length %zu\n", gamma_lut->length);
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
 static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct ofdrm_device *odev = ofdrm_device_of_dev(crtc->dev);
@@ -914,14 +878,8 @@ static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_ato
 	}
 }
 
-/*
- * The CRTC is always enabled. Screen updates are performed by
- * the primary plane's atomic_update function. Disabling clears
- * the screen in the primary plane's atomic_disable function.
- */
 static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
-	.mode_valid = ofdrm_crtc_helper_mode_valid,
-	.atomic_check = ofdrm_crtc_helper_atomic_check,
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
 	.atomic_flush = ofdrm_crtc_helper_atomic_flush,
 };
 
@@ -1163,6 +1121,8 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 	sysfb->fb_mode = drm_sysfb_mode(width, height, 0, 0);
 	sysfb->fb_format = format;
 	sysfb->fb_pitch = linebytes;
+	if (odev->cmap_base)
+		sysfb->fb_gamma_lut_size = OFDRM_GAMMA_LUT_SIZE;
 
 	drm_dbg(dev, "display mode={" DRM_MODE_FMT "}\n", DRM_MODE_ARG(&sysfb->fb_mode));
 	drm_dbg(dev, "framebuffer format=%p4cc, size=%dx%d, linebytes=%d byte\n",
@@ -1211,9 +1171,10 @@ static struct ofdrm_device *ofdrm_device_create(struct drm_driver *drv,
 		return ERR_PTR(ret);
 	drm_crtc_helper_add(crtc, &ofdrm_crtc_helper_funcs);
 
-	if (odev->cmap_base) {
-		drm_mode_crtc_set_gamma_size(crtc, OFDRM_GAMMA_LUT_SIZE);
-		drm_crtc_enable_color_mgmt(crtc, 0, false, OFDRM_GAMMA_LUT_SIZE);
+	if (sysfb->fb_gamma_lut_size) {
+		ret = drm_mode_crtc_set_gamma_size(crtc, sysfb->fb_gamma_lut_size);
+		if (!ret)
+			drm_crtc_enable_color_mgmt(crtc, 0, false, sysfb->fb_gamma_lut_size);
 	}
 
 	/* Encoder */
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 986177e4a0f05..9616e67ea42c6 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -14,7 +14,6 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
-#include <drm/drm_crtc_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
@@ -696,22 +695,8 @@ static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
 	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
-static enum drm_mode_status simpledrm_crtc_helper_mode_valid(struct drm_crtc *crtc,
-							     const struct drm_display_mode *mode)
-{
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(crtc->dev);
-
-	return drm_crtc_helper_mode_valid_fixed(crtc, mode, &sysfb->fb_mode);
-}
-
-/*
- * The CRTC is always enabled. Screen updates are performed by
- * the primary plane's atomic_update function. Disabling clears
- * the screen in the primary plane's atomic_disable function.
- */
 static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
-	.mode_valid = simpledrm_crtc_helper_mode_valid,
-	.atomic_check = drm_crtc_helper_atomic_check,
+	DRM_SYSFB_CRTC_HELPER_FUNCS,
 };
 
 static const struct drm_crtc_funcs simpledrm_crtc_funcs = {
-- 
2.49.0

