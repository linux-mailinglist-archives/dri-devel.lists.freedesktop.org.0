Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BEAA7780B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 11:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84EF10E54A;
	Tue,  1 Apr 2025 09:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AA5B10E547
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 09:45:01 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0186B1F456;
 Tue,  1 Apr 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BC72A13A43;
 Tue,  1 Apr 2025 09:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id AMe2LH2162dSBgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Apr 2025 09:44:29 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, jani.nikula@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 11/18] drm/sysfb: Merge primary-plane functions
Date: Tue,  1 Apr 2025 11:37:14 +0200
Message-ID: <20250401094056.32904-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401094056.32904-1-tzimmermann@suse.de>
References: <20250401094056.32904-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 0186B1F456
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Merge the primary plane code of ofdrm and simpledrm. Replace the
plane implementation in each driver with the shared helpers. Set
up driver callbacks and format modifiers with initializer macros.

The plane code in ofdrm and simpledrm is very similar. Ofdrm has a
more sophisticated implementation of atomic_disable, which clears
individual scanlines. The code in simpledrm clears the whole buffer
at once. Take the ofdrm version.

Simpledrm supports get_scanout_buffer. Import it into the shared
helpers, which makes it available in ofdrm.

The supported formats are all native formats plus an optional enulated
XRGB8888 if that's not already a native format. Provide an initializer
macro that computes the size of the formats array.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/sysfb/drm_sysfb_helper.c | 145 +++++++++++++++++++++++
 drivers/gpu/drm/sysfb/drm_sysfb_helper.h |  32 +++++
 drivers/gpu/drm/sysfb/ofdrm.c            | 134 +--------------------
 drivers/gpu/drm/sysfb/simpledrm.c        | 126 +-------------------
 4 files changed, 187 insertions(+), 250 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
index ed9139f56e590..b48e06b253051 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.c
@@ -7,6 +7,13 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_damage_helper.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_panic.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
@@ -39,6 +46,144 @@ struct drm_display_mode drm_sysfb_mode(unsigned int width,
 }
 EXPORT_SYMBOL(drm_sysfb_mode);
 
+/*
+ * Plane
+ */
+
+int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *new_state)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
+	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
+	struct drm_shadow_plane_state *new_shadow_plane_state =
+		to_drm_shadow_plane_state(new_plane_state);
+	struct drm_framebuffer *new_fb = new_plane_state->fb;
+	struct drm_crtc *new_crtc = new_plane_state->crtc;
+	struct drm_crtc_state *new_crtc_state = NULL;
+	struct drm_sysfb_crtc_state *new_sysfb_crtc_state;
+	int ret;
+
+	if (new_crtc)
+		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
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
+	if (new_fb->format != sysfb->fb_format) {
+		void *buf;
+
+		/* format conversion necessary; reserve buffer */
+		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
+						    sysfb->fb_pitch, GFP_KERNEL);
+		if (!buf)
+			return -ENOMEM;
+	}
+
+	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
+
+	new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
+	new_sysfb_crtc_state->format = new_fb->format;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sysfb_plane_helper_atomic_check);
+
+void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	unsigned int dst_pitch = sysfb->fb_pitch;
+	const struct drm_format_info *dst_format = sysfb->fb_format;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+	int ret, idx;
+
+	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
+	if (ret)
+		return;
+
+	if (!drm_dev_enter(dev, &idx))
+		goto out_drm_gem_fb_end_cpu_access;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct iosys_map dst = sysfb->fb_addr;
+		struct drm_rect dst_clip = plane_state->dst;
+
+		if (!drm_rect_intersect(&dst_clip, &damage))
+			continue;
+
+		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
+		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
+			    &damage, &shadow_plane_state->fmtcnv_state);
+	}
+
+	drm_dev_exit(idx);
+out_drm_gem_fb_end_cpu_access:
+	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
+}
+EXPORT_SYMBOL(drm_sysfb_plane_helper_atomic_update);
+
+void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
+					   struct drm_atomic_state *state)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
+	struct iosys_map dst = sysfb->fb_addr;
+	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
+	unsigned int dst_pitch = sysfb->fb_pitch;
+	const struct drm_format_info *dst_format = sysfb->fb_format;
+	struct drm_rect dst_clip;
+	unsigned long lines, linepixels, i;
+	int idx;
+
+	drm_rect_init(&dst_clip,
+		      plane_state->src_x >> 16, plane_state->src_y >> 16,
+		      plane_state->src_w >> 16, plane_state->src_h >> 16);
+
+	lines = drm_rect_height(&dst_clip);
+	linepixels = drm_rect_width(&dst_clip);
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
+	/* Clear buffer to black if disabled */
+	dst_vmap += drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip);
+	for (i = 0; i < lines; ++i) {
+		memset_io(dst_vmap, 0, linepixels * dst_format->cpp[0]);
+		dst_vmap += dst_pitch;
+	}
+
+	drm_dev_exit(idx);
+}
+EXPORT_SYMBOL(drm_sysfb_plane_helper_atomic_disable);
+
+int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+					      struct drm_scanout_buffer *sb)
+{
+	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
+
+	sb->width = sysfb->fb_mode.hdisplay;
+	sb->height = sysfb->fb_mode.vdisplay;
+	sb->format = sysfb->fb_format;
+	sb->pitch[0] = sysfb->fb_pitch;
+	sb->map[0] = sysfb->fb_addr;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_sysfb_plane_helper_get_scanout_buffer);
+
 /*
  * CRTC
  */
diff --git a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
index c8e5ac6b9b63a..45e396bf74b73 100644
--- a/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
+++ b/drivers/gpu/drm/sysfb/drm_sysfb_helper.h
@@ -39,6 +39,38 @@ static inline struct drm_sysfb_device *to_drm_sysfb_device(struct drm_device *de
 	return container_of(dev, struct drm_sysfb_device, dev);
 }
 
+/*
+ * Plane
+ */
+
+int drm_sysfb_plane_helper_atomic_check(struct drm_plane *plane,
+					struct drm_atomic_state *new_state);
+void drm_sysfb_plane_helper_atomic_update(struct drm_plane *plane,
+					  struct drm_atomic_state *state);
+void drm_sysfb_plane_helper_atomic_disable(struct drm_plane *plane,
+					   struct drm_atomic_state *state);
+int drm_sysfb_plane_helper_get_scanout_buffer(struct drm_plane *plane,
+					      struct drm_scanout_buffer *sb);
+
+#define DRM_SYSFB_PLANE_NFORMATS(_num_native) \
+	((_num_native) + 1)
+
+#define DRM_SYSFB_PLANE_FORMAT_MODIFIERS \
+	DRM_FORMAT_MOD_LINEAR, \
+	DRM_FORMAT_MOD_INVALID
+
+#define DRM_SYSFB_PLANE_HELPER_FUNCS \
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS, \
+	.atomic_check = drm_sysfb_plane_helper_atomic_check, \
+	.atomic_update = drm_sysfb_plane_helper_atomic_update, \
+	.atomic_disable = drm_sysfb_plane_helper_atomic_disable, \
+	.get_scanout_buffer = drm_sysfb_plane_helper_get_scanout_buffer
+
+#define DRM_SYSFB_PLANE_FUNCS \
+	.update_plane = drm_atomic_helper_update_plane, \
+	.disable_plane = drm_atomic_helper_disable_plane, \
+	DRM_GEM_SHADOW_PLANE_FUNCS
+
 /*
  * CRTC
  */
diff --git a/drivers/gpu/drm/sysfb/ofdrm.c b/drivers/gpu/drm/sysfb/ofdrm.c
index 29dbb69dd7ac0..71e661ba93299 100644
--- a/drivers/gpu/drm/sysfb/ofdrm.c
+++ b/drivers/gpu/drm/sysfb/ofdrm.c
@@ -299,7 +299,7 @@ struct ofdrm_device {
 	void __iomem *cmap_base;
 
 	/* modesetting */
-	uint32_t formats[8];
+	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -725,141 +725,17 @@ static void ofdrm_device_set_gamma(struct ofdrm_device *odev,
  * Modesetting
  */
 
-static const uint64_t ofdrm_primary_plane_format_modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
+static const u64 ofdrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
 };
 
-static int ofdrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						   struct drm_atomic_state *new_state)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(new_state, plane);
-	struct drm_shadow_plane_state *new_shadow_plane_state =
-		to_drm_shadow_plane_state(new_plane_state);
-	struct drm_framebuffer *new_fb = new_plane_state->fb;
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-	struct drm_sysfb_crtc_state *new_sysfb_crtc_state;
-	int ret;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
-
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	if (ret)
-		return ret;
-	else if (!new_plane_state->visible)
-		return 0;
-
-	if (new_fb->format != sysfb->fb_format) {
-		void *buf;
-
-		/* format conversion necessary; reserve buffer */
-		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
-						    sysfb->fb_pitch, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-	}
-
-	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
-
-	new_sysfb_crtc_state = to_drm_sysfb_crtc_state(new_crtc_state);
-	new_sysfb_crtc_state->format = new_fb->format;
-
-	return 0;
-}
-
-static void ofdrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						     struct drm_atomic_state *state)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
-	unsigned int dst_pitch = sysfb->fb_pitch;
-	const struct drm_format_info *dst_format = sysfb->fb_format;
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect damage;
-	int ret, idx;
-
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return;
-
-	if (!drm_dev_enter(dev, &idx))
-		goto out_drm_gem_fb_end_cpu_access;
-
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
-	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct iosys_map dst = sysfb->fb_addr;
-		struct drm_rect dst_clip = plane_state->dst;
-
-		if (!drm_rect_intersect(&dst_clip, &damage))
-			continue;
-
-		iosys_map_incr(&dst, drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip));
-		drm_fb_blit(&dst, &dst_pitch, dst_format->format, shadow_plane_state->data, fb,
-			    &damage, &shadow_plane_state->fmtcnv_state);
-	}
-
-	drm_dev_exit(idx);
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-}
-
-static void ofdrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-						      struct drm_atomic_state *state)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	struct iosys_map dst = sysfb->fb_addr;
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	void __iomem *dst_vmap = dst.vaddr_iomem; /* TODO: Use mapping abstraction */
-	unsigned int dst_pitch = sysfb->fb_pitch;
-	const struct drm_format_info *dst_format = sysfb->fb_format;
-	struct drm_rect dst_clip;
-	unsigned long lines, linepixels, i;
-	int idx;
-
-	drm_rect_init(&dst_clip,
-		      plane_state->src_x >> 16, plane_state->src_y >> 16,
-		      plane_state->src_w >> 16, plane_state->src_h >> 16);
-
-	lines = drm_rect_height(&dst_clip);
-	linepixels = drm_rect_width(&dst_clip);
-
-	if (!drm_dev_enter(dev, &idx))
-		return;
-
-	/* Clear buffer to black if disabled */
-	dst_vmap += drm_fb_clip_offset(dst_pitch, dst_format, &dst_clip);
-	for (i = 0; i < lines; ++i) {
-		memset_io(dst_vmap, 0, linepixels * dst_format->cpp[0]);
-		dst_vmap += dst_pitch;
-	}
-
-	drm_dev_exit(idx);
-}
-
 static const struct drm_plane_helper_funcs ofdrm_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = ofdrm_primary_plane_helper_atomic_check,
-	.atomic_update = ofdrm_primary_plane_helper_atomic_update,
-	.atomic_disable = ofdrm_primary_plane_helper_atomic_disable,
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
 };
 
 static const struct drm_plane_funcs ofdrm_primary_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
+	DRM_SYSFB_PLANE_FUNCS,
 	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static void ofdrm_crtc_helper_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 9616e67ea42c6..cfb1fe07704d7 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -25,7 +25,6 @@
 #include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
-#include <drm/drm_panic.h>
 #include <drm/drm_probe_helper.h>
 
 #include "drm_sysfb_helper.h"
@@ -238,7 +237,7 @@ struct simpledrm_device {
 #endif
 
 	/* modesetting */
-	uint32_t formats[8];
+	u32 formats[DRM_SYSFB_PLANE_NFORMATS(1)];
 	struct drm_plane primary_plane;
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
@@ -567,132 +566,17 @@ static int simpledrm_device_attach_genpd(struct simpledrm_device *sdev)
  * Modesetting
  */
 
-static const uint64_t simpledrm_primary_plane_format_modifiers[] = {
-	DRM_FORMAT_MOD_LINEAR,
-	DRM_FORMAT_MOD_INVALID
+static const u64 simpledrm_primary_plane_format_modifiers[] = {
+	DRM_SYSFB_PLANE_FORMAT_MODIFIERS,
 };
 
-static int simpledrm_primary_plane_helper_atomic_check(struct drm_plane *plane,
-						       struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_shadow_plane_state *new_shadow_plane_state =
-		to_drm_shadow_plane_state(new_plane_state);
-	struct drm_framebuffer *new_fb = new_plane_state->fb;
-	struct drm_crtc *new_crtc = new_plane_state->crtc;
-	struct drm_crtc_state *new_crtc_state = NULL;
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	int ret;
-
-	if (new_crtc)
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
-
-	ret = drm_atomic_helper_check_plane_state(new_plane_state, new_crtc_state,
-						  DRM_PLANE_NO_SCALING,
-						  DRM_PLANE_NO_SCALING,
-						  false, false);
-	if (ret)
-		return ret;
-	else if (!new_plane_state->visible)
-		return 0;
-
-	if (new_fb->format != sysfb->fb_format) {
-		void *buf;
-
-		/* format conversion necessary; reserve buffer */
-		buf = drm_format_conv_state_reserve(&new_shadow_plane_state->fmtcnv_state,
-						    sysfb->fb_pitch, GFP_KERNEL);
-		if (!buf)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void simpledrm_primary_plane_helper_atomic_update(struct drm_plane *plane,
-							 struct drm_atomic_state *state)
-{
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
-	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
-	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
-	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(dev);
-	struct drm_atomic_helper_damage_iter iter;
-	struct drm_rect damage;
-	int ret, idx;
-
-	ret = drm_gem_fb_begin_cpu_access(fb, DMA_FROM_DEVICE);
-	if (ret)
-		return;
-
-	if (!drm_dev_enter(dev, &idx))
-		goto out_drm_gem_fb_end_cpu_access;
-
-	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
-	drm_atomic_for_each_plane_damage(&iter, &damage) {
-		struct drm_rect dst_clip = plane_state->dst;
-		struct iosys_map dst = sysfb->fb_addr;
-
-		if (!drm_rect_intersect(&dst_clip, &damage))
-			continue;
-
-		iosys_map_incr(&dst, drm_fb_clip_offset(sysfb->fb_pitch, sysfb->fb_format,
-							&dst_clip));
-		drm_fb_blit(&dst, &sysfb->fb_pitch, sysfb->fb_format->format,
-			    shadow_plane_state->data,
-			    fb, &damage, &shadow_plane_state->fmtcnv_state);
-	}
-
-	drm_dev_exit(idx);
-out_drm_gem_fb_end_cpu_access:
-	drm_gem_fb_end_cpu_access(fb, DMA_FROM_DEVICE);
-}
-
-static void simpledrm_primary_plane_helper_atomic_disable(struct drm_plane *plane,
-							  struct drm_atomic_state *state)
-{
-	struct drm_device *dev = plane->dev;
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
-	int idx;
-
-	if (!drm_dev_enter(dev, &idx))
-		return;
-
-	/* Clear screen to black if disabled */
-	iosys_map_memset(&sysfb->fb_addr, 0, 0, sysfb->fb_pitch * sysfb->fb_mode.vdisplay);
-
-	drm_dev_exit(idx);
-}
-
-static int simpledrm_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
-							     struct drm_scanout_buffer *sb)
-{
-	struct drm_sysfb_device *sysfb = to_drm_sysfb_device(plane->dev);
-
-	sb->width = sysfb->fb_mode.hdisplay;
-	sb->height = sysfb->fb_mode.vdisplay;
-	sb->format = sysfb->fb_format;
-	sb->pitch[0] = sysfb->fb_pitch;
-	sb->map[0] = sysfb->fb_addr;
-
-	return 0;
-}
-
 static const struct drm_plane_helper_funcs simpledrm_primary_plane_helper_funcs = {
-	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
-	.atomic_check = simpledrm_primary_plane_helper_atomic_check,
-	.atomic_update = simpledrm_primary_plane_helper_atomic_update,
-	.atomic_disable = simpledrm_primary_plane_helper_atomic_disable,
-	.get_scanout_buffer = simpledrm_primary_plane_helper_get_scanout_buffer,
+	DRM_SYSFB_PLANE_HELPER_FUNCS,
 };
 
 static const struct drm_plane_funcs simpledrm_primary_plane_funcs = {
-	.update_plane = drm_atomic_helper_update_plane,
-	.disable_plane = drm_atomic_helper_disable_plane,
+	DRM_SYSFB_PLANE_FUNCS,
 	.destroy = drm_plane_cleanup,
-	DRM_GEM_SHADOW_PLANE_FUNCS,
 };
 
 static const struct drm_crtc_helper_funcs simpledrm_crtc_helper_funcs = {
-- 
2.49.0

