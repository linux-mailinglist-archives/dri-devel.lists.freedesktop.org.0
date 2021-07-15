Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78D53CA4EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 20:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1B36E88E;
	Thu, 15 Jul 2021 18:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6EF96E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 18:01:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5742422AE4;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626372096; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Daz4D90dEhbinmJTgEjoFQxfaqyesDPiQAQpyS3FfeY=;
 b=R5FxBtf57x9Bl2xtnBs+4vy01z0OZnpdq3B0TnRs1tv1SFryr5/9R3u3hBx7k1JTgVPNna
 2xY4vHUTXYmkJJZGBQ6CpPKsRwDSgr9fMk7MGeK7k0UX1zXoZHAjWUvaex+rsRkLBFIMVG
 kY7/s3USA8wogVjcznpIxtmPjP/2wcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626372096;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Daz4D90dEhbinmJTgEjoFQxfaqyesDPiQAQpyS3FfeY=;
 b=yIOPntrM1ARcdcCJKGZqgXSxDgrs6AUwdAAIv+kbURPvPaIwJIwjXIFpAW3kBUmTG+QkZA
 /0uX8UZdFk49nYBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B0E013C41;
 Thu, 15 Jul 2021 18:01:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6GuhBQB48GBoIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 18:01:36 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Subject: [PATCH 2/5] drm/gem: Provide drm_gem_fb_{vmap,vunmap}()
Date: Thu, 15 Jul 2021 20:01:30 +0200
Message-Id: <20210715180133.3675-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715180133.3675-1-tzimmermann@suse.de>
References: <20210715180133.3675-1-tzimmermann@suse.de>
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

Move framebuffer vmap code from shadow-buffered plane state into the new
interfaces drm_gem_fb_vmap() and drm_gem_fb_vunmap(). These functions
provide mappings of a framebuffer's BOs into kernel address space. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c      | 37 +----------
 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 70 ++++++++++++++++++++
 include/drm/drm_gem_atomic_helper.h          |  1 +
 include/drm/drm_gem_framebuffer_helper.h     |  5 ++
 4 files changed, 79 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index 26af09b959d4..b1cc19e47165 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -330,10 +330,7 @@ int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *p
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	struct drm_gem_object *obj;
-	struct dma_buf_map map;
 	int ret;
-	size_t i;
 
 	if (!fb)
 		return 0;
@@ -342,27 +339,7 @@ int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *p
 	if (ret)
 		return ret;
 
-	for (i = 0; i < ARRAY_SIZE(shadow_plane_state->map); ++i) {
-		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
-		ret = drm_gem_vmap(obj, &map);
-		if (ret)
-			goto err_drm_gem_vunmap;
-		shadow_plane_state->map[i] = map;
-	}
-
-	return 0;
-
-err_drm_gem_vunmap:
-	while (i) {
-		--i;
-		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
-		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
-	}
-	return ret;
+	return drm_gem_fb_vmap(fb, shadow_plane_state->map);
 }
 EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
 
@@ -374,25 +351,17 @@ EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
  * This function implements struct &drm_plane_helper_funcs.cleanup_fb.
  * This function unmaps all buffer objects of the plane's framebuffer.
  *
- * See drm_gem_prepare_shadow_fb() for more inforamtion.
+ * See drm_gem_prepare_shadow_fb() for more information.
  */
 void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
-	size_t i = ARRAY_SIZE(shadow_plane_state->map);
-	struct drm_gem_object *obj;
 
 	if (!fb)
 		return;
 
-	while (i) {
-		--i;
-		obj = drm_gem_fb_get_obj(fb, i);
-		if (!obj)
-			continue;
-		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
-	}
+	drm_gem_fb_vunmap(fb, shadow_plane_state->map);
 }
 EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
 
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 975a3df0561e..cc4465100cc2 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -15,6 +15,8 @@
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
 
+#include "drm_internal.h"
+
 #define AFBC_HEADER_SIZE		16
 #define AFBC_TH_LAYOUT_ALIGNMENT	8
 #define AFBC_HDR_ALIGN			64
@@ -308,6 +310,74 @@ drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 }
 EXPORT_SYMBOL_GPL(drm_gem_fb_create_with_dirty);
 
+/**
+ * drm_gem_fb_vmap - maps all framebuffer BOs into kernel address space
+ * @fb: the framebuffer
+ * @map: returns the mapping's address for each BO
+ *
+ * This function maps all buffer objects of the given framebuffer into
+ * kernel address space and stores them in struct dma_buf_map. If the
+ * mapping operation fails for one of the BOs, the function unmaps the
+ * already established mappings automatically.
+ *
+ * See drm_gem_fb_vunmap() for unmapping.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FORMAT_MAX_PLANES])
+{
+	struct drm_gem_object *obj;
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < DRM_FORMAT_MAX_PLANES; ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		ret = drm_gem_vmap(obj, &map[i]);
+		if (ret)
+			goto err_drm_gem_vunmap;
+	}
+
+	return 0;
+
+err_drm_gem_vunmap:
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_vunmap(obj, &map[i]);
+	}
+	return ret;
+}
+EXPORT_SYMBOL(drm_gem_fb_vmap);
+
+/**
+ * drm_gem_fb_vunmap - unmaps framebuffer BOs from kernel address space
+ * @fb: the framebuffer
+ * @map: mapping addresses as returned by drm_gem_fb_vmap()
+ *
+ * This function unmaps all buffer objects of the given framebuffer.
+ *
+ * See drm_gem_fb_vmap() for more information.
+ */
+void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FORMAT_MAX_PLANES])
+{
+	unsigned int i = DRM_FORMAT_MAX_PLANES;
+	struct drm_gem_object *obj;
+
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_vunmap(obj, &map[i]);
+	}
+}
+EXPORT_SYMBOL(drm_gem_fb_vunmap);
+
 static __u32 drm_gem_afbc_get_bpp(struct drm_device *dev,
 				  const struct drm_mode_fb_cmd2 *mode_cmd)
 {
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index b2b441361051..f9f8b6f0494a 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -5,6 +5,7 @@
 
 #include <linux/dma-buf-map.h>
 
+#include <drm/drm_fourcc.h>
 #include <drm/drm_plane.h>
 
 struct drm_simple_display_pipe;
diff --git a/include/drm/drm_gem_framebuffer_helper.h b/include/drm/drm_gem_framebuffer_helper.h
index 6bdffc7aa124..485617b54221 100644
--- a/include/drm/drm_gem_framebuffer_helper.h
+++ b/include/drm/drm_gem_framebuffer_helper.h
@@ -1,6 +1,8 @@
 #ifndef __DRM_GEM_FB_HELPER_H__
 #define __DRM_GEM_FB_HELPER_H__
 
+#include <linux/dma-buf-map.h>
+
 struct drm_afbc_framebuffer;
 struct drm_device;
 struct drm_fb_helper_surface_size;
@@ -34,6 +36,9 @@ struct drm_framebuffer *
 drm_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
 			     const struct drm_mode_fb_cmd2 *mode_cmd);
 
+int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FORMAT_MAX_PLANES]);
+void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct dma_buf_map map[DRM_FORMAT_MAX_PLANES]);
+
 #define drm_is_afbc(modifier) \
 	(((modifier) & AFBC_VENDOR_AND_TYPE_MASK) == DRM_FORMAT_MOD_ARM_AFBC(0))
 
-- 
2.32.0

