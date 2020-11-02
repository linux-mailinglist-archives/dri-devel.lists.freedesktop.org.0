Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1DA2A3E7F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 371EE6EC18;
	Tue,  3 Nov 2020 08:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49036E58A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 22:07:41 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 4/5] drm: Add and export function drm_gem_cma_sync_data
Date: Mon,  2 Nov 2020 22:06:50 +0000
Message-Id: <20201102220651.22069-5-paul@crapouillou.net>
In-Reply-To: <20201102220651.22069-1-paul@crapouillou.net>
References: <20201102220651.22069-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function can be used by drivers that use damage clips and have
CMA GEM objects backed by non-coherent memory. Calling this function
in a plane's .atomic_update ensures that all the data in the backing
memory have been written to RAM.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 43 ++++++++++++++++++++++++++++
 include/drm/drm_gem_cma_helper.h     |  5 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 4ed63f4896bd..74bff6d45d4e 100644
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
@@ -742,3 +747,41 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *dev,
 	return obj;
 }
 EXPORT_SYMBOL(drm_gem_cma_prime_import_sg_table_vmap);
+
+/**
+ * drm_gem_cma_sync_data - Sync GEM object to non-coherent backing memory
+ * @dev: DRM device
+ * @old_state: Old plane state
+ * @state: New plane state
+ *
+ * This function can be used by drivers that use damage clips and have
+ * CMA GEM objects backed by non-coherent memory. Calling this function
+ * in a plane's .atomic_update ensures that all the data in the backing
+ * memory have been written to RAM.
+ */
+void drm_gem_cma_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state)
+{
+	const struct drm_format_info *finfo = state->fb->format;
+	struct drm_atomic_helper_damage_iter iter;
+	unsigned int offset, i;
+	struct drm_rect clip;
+	dma_addr_t daddr;
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
+			dma_sync_single_for_device(dev, daddr + offset,
+				       (clip.y2 - clip.y1) * state->fb->pitches[i],
+				       DMA_TO_DEVICE);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(drm_gem_cma_sync_data);
diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
index 6b01ad5581c3..9bdba4ce65ba 100644
--- a/include/drm/drm_gem_cma_helper.h
+++ b/include/drm/drm_gem_cma_helper.h
@@ -7,6 +7,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_mode_create_dumb;
+struct drm_plane_state;
 
 /**
  * struct drm_gem_cma_object - GEM object backed by CMA memory allocations
@@ -200,4 +201,8 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
 				       struct dma_buf_attachment *attach,
 				       struct sg_table *sgt);
 
+void drm_gem_cma_sync_data(struct device *dev,
+			   struct drm_plane_state *old_state,
+			   struct drm_plane_state *state);
+
 #endif /* __DRM_GEM_CMA_HELPER_H__ */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
