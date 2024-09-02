Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F0968566
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 12:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7A310E106;
	Mon,  2 Sep 2024 10:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="Nw0aX67J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ekxoDDMB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Nw0aX67J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ekxoDDMB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B0710E286
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 10:55:52 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BD9331FBA9;
 Mon,  2 Sep 2024 10:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725274550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF6UN+r7guDF4EBCUmHfrQ7EWv3ISljasrjOYz1OglI=;
 b=Nw0aX67J/IlBcYkscuTR4qTr1KMXUy8W+OQWs3ISokx6WIRtrBP0sZOqIbbkw8qQwcAeDx
 /SeA7iZ+sx/i3XQNhvsf/R27rQg9gNeyXFxwWVJW/McvV7PkZwv7trTebZZUwB08Dk2pvA
 Cv/7VHoXqLXUyvUMaIph+JMwI3f8yw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725274550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF6UN+r7guDF4EBCUmHfrQ7EWv3ISljasrjOYz1OglI=;
 b=ekxoDDMBM/ixvPy9EmgqJU8i1fAQd75teLcFGG7xrU+ylWv0DzvWDm4gv93h2MVo4V93Rh
 /Piwh0b7D/XOgiAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1725274550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF6UN+r7guDF4EBCUmHfrQ7EWv3ISljasrjOYz1OglI=;
 b=Nw0aX67J/IlBcYkscuTR4qTr1KMXUy8W+OQWs3ISokx6WIRtrBP0sZOqIbbkw8qQwcAeDx
 /SeA7iZ+sx/i3XQNhvsf/R27rQg9gNeyXFxwWVJW/McvV7PkZwv7trTebZZUwB08Dk2pvA
 Cv/7VHoXqLXUyvUMaIph+JMwI3f8yw8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1725274550;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mF6UN+r7guDF4EBCUmHfrQ7EWv3ISljasrjOYz1OglI=;
 b=ekxoDDMBM/ixvPy9EmgqJU8i1fAQd75teLcFGG7xrU+ylWv0DzvWDm4gv93h2MVo4V93Rh
 /Piwh0b7D/XOgiAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 85FDB13A7C;
 Mon,  2 Sep 2024 10:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id gAZzH7aZ1WZQcAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Sep 2024 10:55:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kraxel@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 08/10] drm/bochs: Use GEM SHMEM helpers for memory
 management
Date: Mon,  2 Sep 2024 12:53:46 +0200
Message-ID: <20240902105546.792625-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902105546.792625-1-tzimmermann@suse.de>
References: <20240902105546.792625-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00]; REPLY(-4.00)[];
 BAYES_HAM(-3.00)[100.00%]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000]; R_MISSING_CHARSET(0.50)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 FROM_EQ_ENVFROM(0.00)[];
 FREEMAIL_TO(0.00)[redhat.com,ffwll.ch,gmail.com,kernel.org,linux.intel.com];
 RCPT_COUNT_SEVEN(0.00)[8]; RCVD_COUNT_TWO(0.00)[2];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_TLS_ALL(0.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 R_RATELIMIT(0.00)[to_ip_from(RLw9gjjhh8cousxs3wi4trssza)];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -6.80
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

Replace GEM VRAM with GEM SHMEM in bochs. The new memory manager
stores buffer objects in system memory. Makes the driver's memory
management more reliably.

Most of the changes are hidden in external helpers that allocate
buffers. Replacing DRM_GEM_VRAM_DRIVER with DRM_GEM_SHMEM_DRIVER_OPS
swaps these. With GEM VRAM, the video memory was updated directly by
the DRM client. The biggest change within bochs is in atomic_update,
which now updates video memory via memcpy() from the BO in system
memory. Shadow-plane helpers maintaining the pointers to the buffer's
data, so bochs doesn't have to. The update is triggered by each page
flip's call to the framebuffer's dirty helper. The driver supports
damage clipping to minimize memcpy() overhead.

The advantage of GEM SHMEM is that it makes memory management
more reliable. Given DRM's double buffering during page flips, the
minimum amount of video memory is three times the maximum consumption
in some pathological cases. For example, if the maximum size of a GEM
buffer is 1920x1080-32 (i.e., 32-bit FullHD), the buffer size is
8 MiB. Display hardware has to provide at lease 24 MiB to reliably
page flip such configurations. This cannot always be guaranteed and
bochs already contains code to rule out <4 MiB configurations. With
GEM SHMEM, only 8 MiB of video memory are required for the given
example. Unsupported modes can be sorted out easily.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 drivers/gpu/drm/tiny/Kconfig |  4 +-
 drivers/gpu/drm/tiny/bochs.c | 78 +++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index f6889f649bc1..8f206c6387ec 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -13,10 +13,8 @@ config DRM_ARCPGU
 config DRM_BOCHS
 	tristate "DRM Support for bochs dispi vga interface (qemu stdvga)"
 	depends on DRM && PCI && MMU
+	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
-	select DRM_VRAM_HELPER
-	select DRM_TTM
-	select DRM_TTM_HELPER
 	help
 	  This is a KMS driver for qemu's stdvga output. Choose this option
 	  for qemu.
diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 76e29950a807..bde70a6075ec 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -6,13 +6,15 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fbdev_ttm.h>
+#include <drm/drm_fbdev_shmem.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
-#include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_module.h>
 #include <drm/drm_plane_helper.h>
@@ -427,49 +429,49 @@ static int bochs_primary_plane_helper_atomic_check(struct drm_plane *plane,
 	return 0;
 }
 
-static void bochs_plane_update(struct bochs_device *bochs, struct drm_plane_state *state)
+static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
+						     struct drm_atomic_state *state)
 {
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
-
-	if (!state->fb || !bochs->stride)
+	struct drm_device *dev = plane->dev;
+	struct bochs_device *bochs = to_bochs_device(dev);
+	struct drm_plane_state *plane_state = plane->state;
+	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
+	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_atomic_helper_damage_iter iter;
+	struct drm_rect damage;
+
+	if (!fb || !bochs->stride)
 		return;
 
-	gbo = drm_gem_vram_of_gem(state->fb->obj[0]);
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (WARN_ON_ONCE(gpu_addr < 0))
-		return; /* Bug: we didn't pin the BO to VRAM in prepare_fb. */
+	drm_atomic_helper_damage_iter_init(&iter, old_plane_state, plane_state);
+	drm_atomic_for_each_plane_damage(&iter, &damage) {
+		struct iosys_map dst = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
 
-	bochs_hw_setbase(bochs,
-			 state->crtc_x,
-			 state->crtc_y,
-			 state->fb->pitches[0],
-			 state->fb->offsets[0] + gpu_addr);
-	bochs_hw_setformat(bochs, state->fb->format);
-}
-
-static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
-						     struct drm_atomic_state *state)
-{
-	struct bochs_device *bochs = to_bochs_device(plane->dev);
-	struct drm_plane_state *plane_state = drm_atomic_get_new_plane_state(state, plane);
+		iosys_map_incr(&dst, drm_fb_clip_offset(fb->pitches[0], fb->format, &damage));
+		drm_fb_memcpy(&dst, fb->pitches, shadow_plane_state->data, fb, &damage);
+	}
 
-	bochs_plane_update(bochs, plane_state);
+	/* Always scanout image at VRAM offset 0 */
+	bochs_hw_setbase(bochs,
+			 plane_state->crtc_x,
+			 plane_state->crtc_y,
+			 fb->pitches[0],
+			 0);
+	bochs_hw_setformat(bochs, fb->format);
 }
 
 static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
-	DRM_GEM_VRAM_PLANE_HELPER_FUNCS,
+	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
 	.atomic_check = bochs_primary_plane_helper_atomic_check,
 	.atomic_update = bochs_primary_plane_helper_atomic_update,
 };
 
 static const struct drm_plane_funcs bochs_primary_plane_funcs = {
-	.update_plane		= drm_atomic_helper_update_plane,
-	.disable_plane		= drm_atomic_helper_disable_plane,
-	.destroy		= drm_plane_cleanup,
-	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state	= drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.update_plane = drm_atomic_helper_update_plane,
+	.disable_plane = drm_atomic_helper_disable_plane,
+	.destroy = drm_plane_cleanup,
+	DRM_GEM_SHADOW_PLANE_FUNCS
 };
 
 static void bochs_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
@@ -557,8 +559,7 @@ static const struct drm_connector_funcs bochs_connector_funcs = {
 };
 
 static const struct drm_mode_config_funcs bochs_mode_config_funcs = {
-	.fb_create = drm_gem_fb_create,
-	.mode_valid = drm_vram_helper_mode_valid,
+	.fb_create = drm_gem_fb_create_with_dirty,
 	.atomic_check = drm_atomic_helper_check,
 	.atomic_commit = drm_atomic_helper_commit,
 };
@@ -629,17 +630,12 @@ static int bochs_kms_init(struct bochs_device *bochs)
 
 static int bochs_load(struct bochs_device *bochs)
 {
-	struct drm_device *dev = &bochs->dev;
 	int ret;
 
 	ret = bochs_hw_init(bochs);
 	if (ret)
 		return ret;
 
-	ret = drmm_vram_helper_init(dev, bochs->fb_base, bochs->fb_size);
-	if (ret)
-		return ret;
-
 	ret = bochs_kms_init(bochs);
 	if (ret)
 		return ret;
@@ -657,7 +653,7 @@ static const struct drm_driver bochs_driver = {
 	.date			= "20130925",
 	.major			= 1,
 	.minor			= 0,
-	DRM_GEM_VRAM_DRIVER,
+	DRM_GEM_SHMEM_DRIVER_OPS,
 };
 
 /* ---------------------------------------------------------------------- */
@@ -723,7 +719,7 @@ static int bochs_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	if (ret)
 		goto err_free_dev;
 
-	drm_fbdev_ttm_setup(dev, 32);
+	drm_fbdev_shmem_setup(dev, 32);
 	return ret;
 
 err_free_dev:
-- 
2.46.0

