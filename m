Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9C381187
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 22:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96A6F45B;
	Fri, 14 May 2021 20:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1FF6F45B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 May 2021 20:12:03 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 2/3] drm: Add and export function drm_gem_cma_sync_data
Date: Fri, 14 May 2021 21:11:37 +0100
Message-Id: <20210514201138.162230-3-paul@crapouillou.net>
In-Reply-To: <20210514201138.162230-1-paul@crapouillou.net>
References: <20210514201138.162230-1-paul@crapouillou.net>
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
Cc: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, od@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be used by drivers that use damage clips and have
CMA GEM objects backed by non-coherent memory. Calling this function
in a plane's .atomic_update ensures that all the data in the backing
memory have been written to RAM.

v3: - Only sync data if using GEM objects backed by non-coherent memory.
    - Use a drm_device pointer instead of device pointer in prototype

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 55 ++++++++++++++++++++++++++++
 include/drm/drm_gem_cma_helper.h     |  5 +++
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 81a31bcf7d68..9dbe766c3177 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -17,9 +17,14 @@
 #include <linux/slab.h>
 
 #include <drm/drm.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_fourcc.h>
+#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
+#include <drm/drm_plane.h>
 #include <drm/drm_vma_manager.h>
 
 /**
@@ -589,3 +594,53 @@ int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 	return drm_gem_prime_mmap(obj, vma);
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_mmap);
+
+/**
+ * drm_gem_cma_sync_data - Sync GEM object to non-coherent backing memory
+ * @drm: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_gem_cma_sync_data(struct drm_device *drm,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	const struct drm_gem_cma_object *cma_obj;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
+
+	for (i = 0; i < finfo->num_planes; i++) {
+		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
+
+		if (cma_obj->map_noncoherent)
+			break;
+	}
+
+	/* No non-coherent buffers - no need to sync anything. */
+	if (i == finfo->num_planes)
+		return;
+
+	drm_atomic_helper_damage_iter_init(&iter, old_state, state);
+
+	drm_atomic_for_each_plane_damage(&iter, &clip) {
+		for (i = 0; i < finfo->num_planes; i++) {
+			daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+
+			/* Ignore x1/x2 values, invalidate complete lines */
+			offset = clip.y1 * state->fb->pitches[i];
+
+			dma_sync_single_for_device(drm->dev, daddr + offset,
+				       (clip.y2 - clip.y1) * state->fb->pitches[i],
+				       DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_sync_data);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index b597e00fd5f6..4ccc8c69e594 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -7,6 +7,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_mode_create_dumb;
+struct drm_plane_state;
 
 /**
  * struct drm_gem_cma_object - GEM object backed by CMA memory allocations
@@ -187,4 +188,8 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
 			   struct vm_area_struct *vma);
 
+void drm_gem_cma_sync_data(struct drm_device *drm,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state);
+
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.30.2

