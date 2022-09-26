Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7767F5EB557
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 01:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146B110E811;
	Mon, 26 Sep 2022 23:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3523810E810
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 23:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664234249; x=1695770249;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FNsMF+se2FdHaX/WIF/+RllXG/lg9wTLTLcI2yhBucY=;
 b=KrxvJ2NKlkDav99Npy0lp9EvBdX5CZ+LguvVk7a4itXkp7aDOPNB+aAa
 wzSLpYzuUYbZCTJV/MsAjzMcM2hK8r4JDLrMv8D+jx9xd0Oyx6OQOyIPn
 lw8b7a06Wyp4CUzjr76a61OG+ArX1qNbjoEdmV/WTabYs/tmgBgpuuOPn
 limjswJC+/IFEV2hVsgbj6TrUzYxHAnQzlcoJjob0Cr4oJi7mXmp13p3+
 ENn3j1Jm3hainfMeXfftIyMC9mTW0jEJEL5Rw5xdnTd3OXbFsCP/HaL8F
 RaTTv08hL550TEJorHglSbvoSPEVCFI9CBftczN+xxY9uO4qmy0JLx3te Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="302638880"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="302638880"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2022 16:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="763649729"
X-IronPort-AV: E=Sophos;i="5.93,347,1654585200"; d="scan'208";a="763649729"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 26 Sep 2022 16:17:24 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/virtio: new fence for every plane update
Date: Mon, 26 Sep 2022 16:06:54 -0700
Message-Id: <20220926230655.2565-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220926230655.2565-1-dongwon.kim@intel.com>
References: <20220926230655.2565-1-dongwon.kim@intel.com>
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
Cc: dongwon.kim@intel.com, vivek.kasireddy@intel.com, kraxel@redhat.com,
 gurchetansingh@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having a fence linked to a virtio_gpu_framebuffer in plane update sequence
would cause conflict when several planes referencing the same framebuffer
especially when those planes are updated concurrently (e.g. Xorg screen
covering multi-displays configured for an extended mode). So it is better
for the fence to be created for every plane update event then link it to
the plane state since each plane update comes with a new plane state obj.

The plane state for virtio-gpu, "struct virtio_gpu_plane_state" is added for
this. This structure represents drm_plane_state and it contains the reference
to virtio_gpu_fence, which was previously in
"struct virtio_gpu_framebuffer".

"virtio_gpu_plane_duplicate_state" and "virtio_gpu_plane_destroy_state" were
added as well to manage virtio_gpu_plane_state.

Several drm helpers were slightly modified accordingly to use the fence in new
plane state structure. virtio_gpu_plane_cleanup_fb was completely removed as
none of code in the function are not required.

Also, the condition for adding fence, (plane->state->fb != new_state->fb) was
removed for the sychronous FB update even when the same FB is flushed again
consecutively.

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 76 +++++++++++++++-----------
 2 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9b98470593b0..20a418f64533 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -190,6 +190,13 @@ struct virtio_gpu_framebuffer {
 #define to_virtio_gpu_framebuffer(x) \
 	container_of(x, struct virtio_gpu_framebuffer, base)
 
+struct virtio_gpu_plane_state {
+	struct drm_plane_state base;
+	struct virtio_gpu_fence *fence;
+};
+#define to_virtio_gpu_plane_state(x) \
+	container_of(x, struct virtio_gpu_plane_state, base)
+
 struct virtio_gpu_queue {
 	struct virtqueue *vq;
 	spinlock_t qlock;
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 4c09e313bebc..fd5e170dcb22 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -66,12 +66,36 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
 	return format;
 }
 
+static struct
+drm_plane_state *virtio_gpu_plane_duplicate_state(struct drm_plane *plane)
+{
+	struct virtio_gpu_plane_state *new;
+
+	if (WARN_ON(!plane->state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	__drm_atomic_helper_plane_duplicate_state(plane, &new->base);
+
+	return &new->base;
+}
+
+static void virtio_gpu_plane_destroy_state(struct drm_plane *plane,
+					   struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_destroy_state(state);
+	kfree(to_virtio_gpu_plane_state(state));
+}
+
 static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
-	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
+	.atomic_duplicate_state = virtio_gpu_plane_duplicate_state,
+	.atomic_destroy_state	= virtio_gpu_plane_destroy_state,
 };
 
 static int virtio_gpu_plane_atomic_check(struct drm_plane *plane,
@@ -128,11 +152,13 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_plane_state *vgplane_st;
 	struct virtio_gpu_object *bo;
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	vgplane_st = to_virtio_gpu_plane_state(plane->state);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (vgfb->fence) {
+	if (vgplane_st->fence) {
 		struct virtio_gpu_object_array *objs;
 
 		objs = virtio_gpu_array_alloc(1);
@@ -141,13 +167,12 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 		virtio_gpu_array_lock_resv(objs);
 		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
-					      width, height, objs, vgfb->fence);
+					      width, height, objs,
+					      vgplane_st->fence);
 		virtio_gpu_notify(vgdev);
-
-		dma_fence_wait_timeout(&vgfb->fence->f, true,
+		dma_fence_wait_timeout(&vgplane_st->fence->f, true,
 				       msecs_to_jiffies(50));
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
+		dma_fence_put(&vgplane_st->fence->f);
 	} else {
 		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
 					      width, height, NULL, NULL);
@@ -237,41 +262,29 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	struct drm_device *dev = plane->dev;
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_plane_state *vgplane_st;
 	struct virtio_gpu_object *bo;
 
 	if (!new_state->fb)
 		return 0;
 
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
+	vgplane_st = to_virtio_gpu_plane_state(new_state);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
 		return 0;
 
-	if (bo->dumb && (plane->state->fb != new_state->fb)) {
-		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+	if (bo->dumb) {
+		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
+						     vgdev->fence_drv.context,
 						     0);
-		if (!vgfb->fence)
+		if (!vgplane_st->fence)
 			return -ENOMEM;
 	}
 
 	return 0;
 }
 
-static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
-					struct drm_plane_state *state)
-{
-	struct virtio_gpu_framebuffer *vgfb;
-
-	if (!state->fb)
-		return;
-
-	vgfb = to_virtio_gpu_framebuffer(state->fb);
-	if (vgfb->fence) {
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
-	}
-}
-
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 					   struct drm_atomic_state *state)
 {
@@ -281,6 +294,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_plane_state *vgplane_st;
 	struct virtio_gpu_object *bo = NULL;
 	uint32_t handle;
 
@@ -293,6 +307,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (plane->state->fb) {
 		vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+		vgplane_st = to_virtio_gpu_plane_state(plane->state);
 		bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 		handle = bo->hw_res_handle;
 	} else {
@@ -312,11 +327,10 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 			(vgdev, 0,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
-			 0, 0, objs, vgfb->fence);
+			 0, 0, objs, vgplane_st->fence);
 		virtio_gpu_notify(vgdev);
-		dma_fence_wait(&vgfb->fence->f, true);
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
+		dma_fence_wait(&vgplane_st->fence->f, true);
+		dma_fence_put(&vgplane_st->fence->f);
 	}
 
 	if (plane->state->fb != old_state->fb) {
@@ -351,14 +365,12 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
 	.prepare_fb		= virtio_gpu_plane_prepare_fb,
-	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
 	.prepare_fb		= virtio_gpu_plane_prepare_fb,
-	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_cursor_plane_update,
 };
-- 
2.20.1

