Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7238DC20
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 19:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CBA6E529;
	Sun, 23 May 2021 17:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3676F6E527
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 17:12:38 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v5 2/3] drm: Add and export function
 drm_fb_cma_sync_non_coherent
Date: Sun, 23 May 2021 18:04:14 +0100
Message-Id: <20210523170415.90410-3-paul@crapouillou.net>
In-Reply-To: <20210523170415.90410-1-paul@crapouillou.net>
References: <20210523170415.90410-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be used by drivers that use damage clips and have
CMA GEM objects backed by non-coherent memory. Calling this function
in a plane's .atomic_update ensures that all the data in the backing
memory have been written to RAM.

v3: - Only sync data if using GEM objects backed by non-coherent memory.
    - Use a drm_device pointer instead of device pointer in prototype

v5: - Rename to drm_fb_cma_sync_non_coherent
    - Invert loops for better cache locality
    - Only sync BOs that have the non-coherent flag
    - Move to drm_fb_cma_helper.c to avoid circular dependency

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 46 +++++++++++++++++++++++++++++
 include/drm/drm_fb_cma_helper.h     |  4 +++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index cb2349ad338d..69c57273b184 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -9,12 +9,14 @@
  *  Copyright (C) 2012 Red Hat
  */
 
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_fb_cma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 
 /**
@@ -97,3 +99,47 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 	return paddr;
 }
 EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
+
+/**
+ * drm_fb_cma_sync_non_coherent - Sync GEM object to non-coherent backing
+ *	memory
+ * @drm: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+				  struct drm_plane_state *old_state,
+				  struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	const struct drm_gem_cma_object *cma_obj;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
+	size_t nb_bytes;
+
+	for (i = 0; i < finfo->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
+		if (!cma_obj->map_noncoherent)
+			continue;
+
+		daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+		drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+
+		drm_atomic_for_each_plane_damage(&iter, &clip) {
+			/* Ignore x1/x2 values, invalidate complete lines */
+			offset = clip.y1 * state->fb->pitches[i];
+
+			nb_bytes = (clip.y2 - clip.y1) * state->fb->pitches[i];
+			dma_sync_single_for_device(drm->dev, daddr + offset,
+						   nb_bytes, DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_fb_cma_sync_non_coherent);
diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_cma_helper.h
index 795aea1d0a25..3a177632b17e 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_cma_helper.h
@@ -14,5 +14,9 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
+void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+				  struct drm_plane_state *old_state,
+				  struct drm_plane_state *state);
+
 #endif
 
-- 
2.30.2

