Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AC522846
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 02:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C937510E44B;
	Wed, 11 May 2022 00:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F109010E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652227843; x=1683763843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hQERbqxYO4QPGFr6BAiKznCLu4mhW9VxKKbA37bj8T4=;
 b=lez80eKdjX+UoxMYKUUmXZGnRokzsn9uTzXHDUJB/EuHgVVkl6duTwGi
 rNEFP/2KDwlm+R815wDWUzfzQT2/vm9nFOH/W8OOECbYAEtgFVWwpsozu
 yzWmBOQbX2QIL9+GMOMtFuPcewclHDdO9lsD7HhODj0nshVRsx81qi0on
 fwctrn+yBEZXZPsISyAG+AGDMfYNkrSdWEvXbcOy2EXZ17LPb6Z52F+9g
 4f2W1/izBUxIapnzlAR0hMLr1/QVcNdN/VFqUp4loNkZ3aLEDrFn3yt1f
 TP05oXl0ZB4UMq1qb0Z8qtmMz4jmUUWPMxvS/erL3lvDc4aoIWXa7AW5T g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269203214"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="269203214"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 17:10:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; d="scan'208";a="623707919"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2022 17:10:42 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: fence created per cursor/plane update
Date: Tue, 10 May 2022 17:06:22 -0700
Message-Id: <20220511000623.12938-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220511000623.12938-1-dongwon.kim@intel.com>
References: <20220511000623.12938-1-dongwon.kim@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having one fence for a vgfb would cause conflict in case there are
multiple planes referencing the same vgfb (e.g. Xorg screen covering
two displays in extended mode) being flushed simultaneously. So it makes
sence to use a separated fence for each plane update to prevent this.

vgfb->fence is not required anymore with the suggested code change so
both prepare_fb and cleanup_fb are removed since only fence creation/
freeing are done in there.

Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 -
 drivers/gpu/drm/virtio/virtgpu_plane.c | 98 +++++++++-----------------
 2 files changed, 35 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 0a194aaad419..4c59c1e67ca5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -186,7 +186,6 @@ struct virtio_gpu_output {
 
 struct virtio_gpu_framebuffer {
 	struct drm_framebuffer base;
-	struct virtio_gpu_fence *fence;
 };
 #define to_virtio_gpu_framebuffer(x) \
 	container_of(x, struct virtio_gpu_framebuffer, base)
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 6d3cc9e238a4..9856e9941e37 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -137,29 +137,36 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_array *objs;
+	struct virtio_gpu_fence *fence;
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (vgfb->fence) {
-		struct virtio_gpu_object_array *objs;
 
+	if (bo && bo->dumb && (plane->state->fb != new_state->fb) &&
+	    ((plane->type == DRM_PLANE_TYPE_PRIMARY && bo->guest_blob) ||
+	    plane->type != DRM_PLANE_TYPE_PRIMARY))
+		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+					       0);
+
+	if (fence) {
 		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
+		if (!objs) {
+			kfree(fence);
 			return;
+		}
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 		virtio_gpu_array_lock_resv(objs);
-		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
-					      width, height, objs, vgfb->fence);
-		virtio_gpu_notify(vgdev);
+	}
+
+	virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
+				      width, height, objs, fence);
+	virtio_gpu_notify(vgdev);
 
-		dma_fence_wait_timeout(&vgfb->fence->f, true,
+	if (fence) {
+		dma_fence_wait_timeout(&fence->f, true,
 				       msecs_to_jiffies(50));
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
-	} else {
-		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
-					      width, height, NULL, NULL);
-		virtio_gpu_notify(vgdev);
+		dma_fence_put(&fence->f);
 	}
 }
 
@@ -239,47 +246,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				  rect.y2 - rect.y1);
 }
 
-static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
-				       struct drm_plane_state *new_state)
-{
-	struct drm_device *dev = plane->dev;
-	struct virtio_gpu_device *vgdev = dev->dev_private;
-	struct virtio_gpu_framebuffer *vgfb;
-	struct virtio_gpu_object *bo;
-
-	if (!new_state->fb)
-		return 0;
-
-	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
-	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
-		return 0;
-
-	if (bo->dumb && (plane->state->fb != new_state->fb)) {
-		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
-						     0);
-		if (!vgfb->fence)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
-					struct drm_plane_state *old_state)
-{
-	struct virtio_gpu_framebuffer *vgfb;
-
-	if (!plane->state->fb)
-		return;
-
-	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
-	if (vgfb->fence) {
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
-	}
-}
-
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 					   struct drm_atomic_state *state)
 {
@@ -310,21 +276,31 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
 		/* new cursor -- update & wait */
 		struct virtio_gpu_object_array *objs;
+		struct virtio_gpu_fence *fence;
 
+		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+					       0);
 		objs = virtio_gpu_array_alloc(1);
-		if (!objs)
+		if (!objs) {
+			if (fence)
+				kfree(fence);
+
 			return;
+		}
+
 		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
 		virtio_gpu_array_lock_resv(objs);
 		virtio_gpu_cmd_transfer_to_host_2d
 			(vgdev, 0,
 			 plane->state->crtc_w,
 			 plane->state->crtc_h,
-			 0, 0, objs, vgfb->fence);
+			 0, 0, objs, fence);
 		virtio_gpu_notify(vgdev);
-		dma_fence_wait(&vgfb->fence->f, true);
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
+
+		if (fence) {
+			dma_fence_wait(&fence->f, true);
+			dma_fence_put(&fence->f);
+		}
 	}
 
 	if (plane->state->fb != old_state->fb) {
@@ -358,15 +334,11 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 }
 
 static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
-	.prepare_fb		= virtio_gpu_plane_prepare_fb,
-	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_primary_plane_update,
 };
 
 static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
-	.prepare_fb		= virtio_gpu_plane_prepare_fb,
-	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
 	.atomic_check		= virtio_gpu_plane_atomic_check,
 	.atomic_update		= virtio_gpu_cursor_plane_update,
 };
-- 
2.20.1

