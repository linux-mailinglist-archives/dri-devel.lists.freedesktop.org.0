Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 725C5314EB3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135086EAD3;
	Tue,  9 Feb 2021 12:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1C96E971
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:10:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2193AAF2B;
 Tue,  9 Feb 2021 12:10:46 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: hdegoede@redhat.com, daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v3 1/2] drm/gem: Export helpers for shadow-buffered planes
Date: Tue,  9 Feb 2021 13:10:41 +0100
Message-Id: <20210209121042.24098-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209121042.24098-1-tzimmermann@suse.de>
References: <20210209121042.24098-1-tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Export the helpers for shadow-buffered planes. These will be used by
several drivers.

v3:
	* fix documentation typos and formatting (Daniel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 148 +++++++++++++++++++++++-
 include/drm/drm_gem_atomic_helper.h     |  32 +++++
 2 files changed, 174 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e27762cef360..fa4eae492b81 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -14,13 +14,101 @@
  * functions for drivers that use GEM objects. Currently, it provides
  * plane state and framebuffer BO mappings for planes with shadow
  * buffers.
+ *
+ * A driver using a shadow buffer copies the content of the shadow buffers
+ * into the HW's framebuffer memory during an atomic update. This requires
+ * a mapping of the shadow buffer into kernel address space. The mappings
+ * cannot be established by commit-tail functions, such as atomic_update,
+ * as this would violate locking rules around dma_buf_vmap().
+ *
+ * The helpers for shadow-buffered planes establish and release mappings,
+ * and provide struct drm_shadow_plane_state, which stores the plane's mapping
+ * for commit-tail functons.
+ *
+ * Shadow-buffered planes can easily be enabled by using the provided macros
+ * %DRM_GEM_SHADOW_PLANE_FUNCS and %DRM_GEM_SHADOW_PLANE_HELPER_FUNCS.
+ * These macros set up the plane and plane-helper callbacks to point to the
+ * shadow-buffer helpers.
+ *
+ * .. code-block:: c
+ *
+ *	#include <drm/drm/gem_atomic_helper.h>
+ *
+ *	struct drm_plane_funcs driver_plane_funcs = {
+ *		...,
+ *		DRM_GEM_SHADOW_PLANE_FUNCS,
+ *	};
+ *
+ *	struct drm_plane_helper_funcs driver_plane_helper_funcs = {
+ *		...,
+ *		DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
+ *	};
+ *
+ * In the driver's atomic-update function, shadow-buffer mappings are available
+ * from the plane state. Use to_drm_shadow_plane_state() to upcast from
+ * struct drm_plane_state.
+ *
+ * .. code-block:: c
+ *
+ *	void driver_plane_atomic_update(struct drm_plane *plane,
+ *					struct drm_plane_state *old_plane_state)
+ *	{
+ *		struct drm_plane_state *plane_state = plane->state;
+ *		struct drm_shadow_plane_state *shadow_plane_state =
+ *			to_drm_shadow_plane_state(plane_state);
+ *
+ *		// access shadow buffer via shadow_plane_state->map
+ *	}
+ *
+ * A mapping address for each of the framebuffer's buffer object is stored in
+ * struct &drm_shadow_plane_state.map. The mappings are valid while the state
+ * is being used.
+ *
+ * Drivers that use struct drm_simple_display_pipe can use
+ * %DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS to initialize the rsp
+ * callbacks. Access to shadow-buffer mappings is similar to regular
+ * atomic_update.
+ *
+ * .. code-block:: c
+ *
+ *	struct drm_simple_display_pipe_funcs driver_pipe_funcs = {
+ *		...,
+ *		DRM_GEM_SIMPLE_DISPLAY_PIPE_SHADOW_PLANE_FUNCS,
+ *	};
+ *
+ *	void driver_pipe_enable(struct drm_simple_display_pipe *pipe,
+ *				struct drm_crtc_state *crtc_state,
+ *				struct drm_plane_state *plane_state)
+ *	{
+ *		struct drm_shadow_plane_state *shadow_plane_state =
+ *			to_drm_shadow_plane_state(plane_state);
+ *
+ *		// access shadow buffer via shadow_plane_state->map
+ *	}
  */
 
 /*
  * Shadow-buffered Planes
  */
 
-static struct drm_plane_state *
+/**
+ * drm_gem_duplicate_shadow_plane_state - duplicates shadow-buffered plane state
+ * @plane: the plane
+ *
+ * This function implements struct &drm_plane_funcs.atomic_duplicate_state for
+ * shadow-buffered planes. It assumes the existing state to be of type
+ * struct drm_shadow_plane_state and it allocates the new state to be of this
+ * type.
+ *
+ * The function does not duplicate existing mappings of the shadow buffers.
+ * Mappings are maintained during the atomic commit by the plane's prepare_fb
+ * and cleanup_fb helpers. See drm_gem_prepare_shadow_fb() and drm_gem_cleanup_shadow_fb()
+ * for corresponding helpers.
+ *
+ * Returns:
+ * A pointer to a new plane state on success, or NULL otherwise.
+ */
+struct drm_plane_state *
 drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
 {
 	struct drm_plane_state *plane_state = plane->state;
@@ -36,9 +124,19 @@ drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane)
 
 	return &new_shadow_plane_state->base;
 }
+EXPORT_SYMBOL(drm_gem_duplicate_shadow_plane_state);
 
-static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
-					       struct drm_plane_state *plane_state)
+/**
+ * drm_gem_destroy_shadow_plane_state - deletes shadow-buffered plane state
+ * @plane: the plane
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct &drm_plane_funcs.atomic_destroy_state
+ * for shadow-buffered planes. It expects that mappings of shadow buffers
+ * have been released already.
+ */
+void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
+					struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state =
 		to_drm_shadow_plane_state(plane_state);
@@ -46,8 +144,18 @@ static void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
 	__drm_atomic_helper_plane_destroy_state(&shadow_plane_state->base);
 	kfree(shadow_plane_state);
 }
+EXPORT_SYMBOL(drm_gem_destroy_shadow_plane_state);
 
-static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
+/**
+ * drm_gem_reset_shadow_plane - resets a shadow-buffered plane
+ * @plane: the plane
+ *
+ * This function implements struct &drm_plane_funcs.reset_plane for
+ * shadow-buffered planes. It assumes the current plane state to be
+ * of type struct drm_shadow_plane and it allocates the new state of
+ * this type.
+ */
+void drm_gem_reset_shadow_plane(struct drm_plane *plane)
 {
 	struct drm_shadow_plane_state *shadow_plane_state;
 
@@ -61,8 +169,24 @@ static void drm_gem_reset_shadow_plane(struct drm_plane *plane)
 		return;
 	__drm_atomic_helper_plane_reset(plane, &shadow_plane_state->base);
 }
+EXPORT_SYMBOL(drm_gem_reset_shadow_plane);
 
-static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+/**
+ * drm_gem_prepare_shadow_fb - prepares shadow framebuffers
+ * @plane: the plane
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct &drm_plane_helper_funcs.prepare_fb. It
+ * maps all buffer objects of the plane's framebuffer into kernel address
+ * space and stores them in &struct drm_shadow_plane_state.map. The
+ * framebuffer will be synchronized as part of the atomic commit.
+ *
+ * See drm_gem_cleanup_shadow_fb() for cleanup.
+ *
+ * Returns:
+ * 0 on success, or a negative errno code otherwise.
+ */
+int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
@@ -100,8 +224,19 @@ static int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_s
 	}
 	return ret;
 }
+EXPORT_SYMBOL(drm_gem_prepare_shadow_fb);
 
-static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
+/**
+ * drm_gem_cleanup_shadow_fb - releases shadow framebuffers
+ * @plane: the plane
+ * @plane_state: the plane state of type struct drm_shadow_plane_state
+ *
+ * This function implements struct &drm_plane_helper_funcs.cleanup_fb.
+ * This function unmaps all buffer objects of the plane's framebuffer.
+ *
+ * See drm_gem_prepare_shadow_fb() for more inforamtion.
+ */
+void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state)
 {
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
@@ -119,6 +254,7 @@ static void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_
 		drm_gem_vunmap(obj, &shadow_plane_state->map[i]);
 	}
 }
+EXPORT_SYMBOL(drm_gem_cleanup_shadow_fb);
 
 /**
  * drm_gem_simple_kms_prepare_shadow_fb - prepares shadow framebuffers
diff --git a/include/drm/drm_gem_atomic_helper.h b/include/drm/drm_gem_atomic_helper.h
index 08b96ccea325..7abf40bdab3d 100644
--- a/include/drm/drm_gem_atomic_helper.h
+++ b/include/drm/drm_gem_atomic_helper.h
@@ -45,6 +45,38 @@ to_drm_shadow_plane_state(struct drm_plane_state *state)
 	return container_of(state, struct drm_shadow_plane_state, base);
 }
 
+void drm_gem_reset_shadow_plane(struct drm_plane *plane);
+struct drm_plane_state *drm_gem_duplicate_shadow_plane_state(struct drm_plane *plane);
+void drm_gem_destroy_shadow_plane_state(struct drm_plane *plane,
+					struct drm_plane_state *plane_state);
+
+/**
+ * DRM_GEM_SHADOW_PLANE_FUNCS -
+ *	Initializes struct drm_plane_funcs for shadow-buffered planes
+ *
+ * Drivers may use GEM BOs as shadow buffers over the framebuffer memory. This
+ * macro initializes struct drm_plane_funcs to use the rsp helper functions.
+ */
+#define DRM_GEM_SHADOW_PLANE_FUNCS \
+	.reset = drm_gem_reset_shadow_plane, \
+	.atomic_duplicate_state = drm_gem_duplicate_shadow_plane_state, \
+	.atomic_destroy_state = drm_gem_destroy_shadow_plane_state
+
+int drm_gem_prepare_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
+void drm_gem_cleanup_shadow_fb(struct drm_plane *plane, struct drm_plane_state *plane_state);
+
+/**
+ * DRM_GEM_SHADOW_PLANE_HELPER_FUNCS -
+ *	Initializes struct drm_plane_helper_funcs for shadow-buffered planes
+ *
+ * Drivers may use GEM BOs as shadow buffers over the framebuffer memory. This
+ * macro initializes struct drm_plane_helper_funcs to use the rsp helper
+ * functions.
+ */
+#define DRM_GEM_SHADOW_PLANE_HELPER_FUNCS \
+	.prepare_fb = drm_gem_prepare_shadow_fb, \
+	.cleanup_fb = drm_gem_cleanup_shadow_fb
+
 int drm_gem_simple_kms_prepare_shadow_fb(struct drm_simple_display_pipe *pipe,
 					 struct drm_plane_state *plane_state);
 void drm_gem_simple_kms_cleanup_shadow_fb(struct drm_simple_display_pipe *pipe,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
