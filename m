Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA1B30DAAB
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366C6EAB4;
	Wed,  3 Feb 2021 13:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF8B6EAA5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 13:10:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE307B12B;
 Wed,  3 Feb 2021 13:10:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, kraxel@redhat.com, hdegoede@redhat.com,
 sean@poorly.run, sam@ravnborg.org, noralf@tronnes.org
Subject: [PATCH 2/6] drm/shmem-helper: Add additional KMS helpers
Date: Wed,  3 Feb 2021 14:10:42 +0100
Message-Id: <20210203131046.22371-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210203131046.22371-1-tzimmermann@suse.de>
References: <20210203131046.22371-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several drivers use GEM SHMEM buffer objects as shadow buffers for
the actual framebuffer memory. Right now, drivers do these vmap
operations in their commit tail, which is actually not allowed by the
locking rules for the dma-buf reservation lock. The involved SHMEM
BO has to be vmapped in the plane's prepare_fb callback and vunmapped
in cleanup_fb.

This patch introduces a DRM library that implements KMS helpers for
GEM SHMEM buffer objects. The first set of helpers is the plane state
for shadow planes. The provided implementations for prepare_fb and
cleanup_fb vmap and vunmap all BOs of struct drm_plane_state.fb. The
mappings are afterwards available in the plane's commit-tail functions.

All rsp drivers use the simple KMS helpers, so we add the plane callbacks
and wrappers for simple KMS.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                    |   7 +
 drivers/gpu/drm/Makefile                   |   1 +
 drivers/gpu/drm/drm_gem_shmem_kms_helper.c | 159 +++++++++++++++++++++
 include/drm/drm_gem_shmem_kms_helper.h     |  56 ++++++++
 4 files changed, 223 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_gem_shmem_kms_helper.c
 create mode 100644 include/drm/drm_gem_shmem_kms_helper.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8bf103de1594..b8d8b00ab5d4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -214,6 +214,13 @@ config DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this if you need the GEM shmem helper functions
 
+config DRM_GEM_SHMEM_KMS_HELPER
+	bool
+	depends on DRM_GEM_SHMEM_HELPER
+	help
+	help
+	  Choose this if you need the GEM SHMEM helper functions for KMS
+
 config DRM_SCHED
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 926adef289db..37a73dee5baf 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -53,6 +53,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_kms_helper-$(CONFIG_DRM_GEM_SHMEM_KMS_HELPER) += drm_gem_shmem_kms_helper.o
 
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
diff --git a/drivers/gpu/drm/drm_gem_shmem_kms_helper.c b/drivers/gpu/drm/drm_gem_shmem_kms_helper.c
new file mode 100644
index 000000000000..8843c5837f98
--- /dev/null
+++ b/drivers/gpu/drm/drm_gem_shmem_kms_helper.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_gem_framebuffer_helper.h>
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_gem_shmem_kms_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
+/*
+ * Helpers for struct drm_plane_funcs
+ *
+ */
+
+static struct drm_plane_state *
+drm_gem_shmem_duplicate_shadow_plane_state(struct drm_plane *plane,
+					   struct drm_plane_state *plane_state)
+{
+	struct drm_gem_shmem_shadow_plane_state *new_shadow_plane_state;
+
+	if (!plane_state)
+		return NULL;
+
+	new_shadow_plane_state = kzalloc(sizeof(*new_shadow_plane_state), GFP_KERNEL);
+	if (!new_shadow_plane_state)
+		return NULL;
+	__drm_atomic_helper_plane_duplicate_state(plane, &new_shadow_plane_state->base);
+
+	return &new_shadow_plane_state->base;
+}
+
+static void drm_gem_shmem_destroy_shadow_plane_state(struct drm_plane *plane,
+						     struct drm_plane_state *plane_state)
+{
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(plane_state);
+
+	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
+	kfree(shadow_plane_state);
+}
+
+static void drm_gem_shmem_reset_shadow_plane(struct drm_plane *plane)
+{
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state;
+
+	if (plane->state) {
+		drm_gem_shmem_destroy_shadow_plane_state(plane, plane->state);
+		plane->state = NULL; /* must be set to NULL here */
+	}
+
+	shadow_plane_state = kzalloc(sizeof(*shadow_plane_state), GFP_KERNEL);
+	if (!shadow_plane_state)
+		return;
+	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
+}
+
+/*
+ * Helpers for struct drm_plane_helper_funcs
+ */
+
+static int drm_gem_shmem_prepare_shadow_fb(struct drm_plane *plane,
+					   struct drm_plane_state *plane_state)
+{
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_gem_object *obj;
+	struct dma_buf_map map;
+	int ret;
+	size_t i;
+
+	if (!fb)
+		return 0;
+
+	ret = drm_gem_fb_prepare_fb(plane, plane_state);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(shadow_plane_state->map); ++i) {
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		ret = drm_gem_shmem_vmap(obj, &map);
+		if (ret)
+			goto err_drm_gem_shmem_vunmap;
+		shadow_plane_state->map[i] = map;
+	}
+
+	return 0;
+
+err_drm_gem_shmem_vunmap:
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_shmem_vunmap(obj, &shadow_plane_state->map[i]);
+	}
+	return ret;
+}
+
+static void drm_gem_shmem_cleanup_shadow_fb(struct drm_plane *plane,
+					    struct drm_plane_state *plane_state)
+{
+	struct drm_gem_shmem_shadow_plane_state *shadow_plane_state =
+		to_drm_gem_shmem_shadow_plane_state(plane_state);
+	struct drm_framebuffer *fb = plane_state->fb;
+	size_t i = ARRAY_SIZE(shadow_plane_state->map);
+	struct drm_gem_object *obj;
+
+	if (!fb)
+		return;
+
+	while (i) {
+		--i;
+		obj = drm_gem_fb_get_obj(fb, i);
+		if (!obj)
+			continue;
+		drm_gem_shmem_vunmap(obj, &shadow_plane_state->map[i]);
+	}
+}
+
+/*
+ * Simple KMS helpers
+ */
+
+int drm_gem_shmem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
+					       struct drm_plane_state *plane_state)
+{
+	return drm_gem_shmem_prepare_shadow_fb(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_shmem_simple_kms_prepare_shadow_fb);
+
+void drm_gem_shmem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
+						struct drm_plane_state *plane_state)
+{
+	drm_gem_shmem_cleanup_shadow_fb(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_shmem_simple_kms_cleanup_shadow_fb);
+
+void drm_gem_shmem_simple_kms_reset_shadow_plane(struct drm_simple_display_pipe *pipe)
+{
+	drm_gem_shmem_reset_shadow_plane(&pipe->plane);
+}
+EXPORT_SYMBOL(drm_gem_shmem_simple_kms_reset_shadow_plane);
+
+struct drm_plane_state *
+drm_gem_shmem_simple_kms_duplicate_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						      struct drm_plane_state *plane_state)
+{
+	return drm_gem_shmem_duplicate_shadow_plane_state(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_shmem_simple_kms_duplicate_shadow_plane_state);
+
+void drm_gem_shmem_simple_kms_destroy_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+							 struct drm_plane_state *plane_state)
+{
+	drm_gem_shmem_destroy_shadow_plane_state(&pipe->plane, plane_state);
+}
+EXPORT_SYMBOL(drm_gem_shmem_simple_kms_destroy_shadow_plane_state);
diff --git a/include/drm/drm_gem_shmem_kms_helper.h b/include/drm/drm_gem_shmem_kms_helper.h
new file mode 100644
index 000000000000..bd42c9c0a39e
--- /dev/null
+++ b/include/drm/drm_gem_shmem_kms_helper.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __DRM_GEM_SHMEM_KMS_HELPER_H__
+#define __DRM_GEM_SHMEM_KMS_HELPER_H__
+
+#include <linux/dma-buf-map.h>
+
+#include <drm/drm_plane.h>
+
+struct drm_simple_display_pipe;
+
+struct drm_gem_shmem_shadow_plane_state {
+	struct drm_plane_state base;
+
+	/* Transitional state - do not export or duplicate */
+
+	struct dma_buf_map map[4];
+};
+
+static inline struct drm_gem_shmem_shadow_plane_state *
+to_drm_gem_shmem_shadow_plane_state(struct drm_plane_state *state)
+{
+	return container_of(state, struct drm_gem_shmem_shadow_plane_state, base);
+}
+
+/*
+ * Simple KMS helpers
+ */
+
+int drm_gem_shmem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
+					       struct drm_plane_state *plane_state);
+void drm_gem_shmem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
+						struct drm_plane_state *plane_state);
+void drm_gem_shmem_simple_kms_reset_shadow_plane(struct drm_simple_display_pipe *pipe);
+struct drm_plane_state *
+drm_gem_shmem_simple_kms_duplicate_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						      struct drm_plane_state *plane_state);
+void
+drm_gem_shmem_simple_kms_destroy_shadow_plane_state(struct drm_simple_display_pipe *pipe,
+						    struct drm_plane_state *plane_state);
+
+/**
+ * DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS -
+ *	Initializes struct drm_simple_display_pipe_funcs for SHMEM shadow planes
+ *
+ * Drivers may use GEM SHMEM BOs as shadow buffers over the framebuffer memory. This
+ * macro initializes struct drm_simple_display_pipe_funcs to use the rsp helper functions.
+ */
+#define DRM_GEM_SHMEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS \
+	.prepare_fb = drm_gem_shmem_simple_kms_prepare_shadow_fb, \
+	.cleanup_fb = drm_gem_shmem_simple_kms_cleanup_shadow_fb, \
+	.reset_plane = drm_gem_shmem_simple_kms_reset_shadow_plane, \
+	.duplicate_plane_state = drm_gem_shmem_simple_kms_duplicate_shadow_plane_state, \
+	.destroy_plane_state   = drm_gem_shmem_simple_kms_destroy_shadow_plane_state
+
+#endif /* __DRM_GEM_SHMEM_KMS_HELPER_H__ */
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
