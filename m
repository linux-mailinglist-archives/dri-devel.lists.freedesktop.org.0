Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C904553D329
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 23:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D026510EB28;
	Fri,  3 Jun 2022 21:23:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEBF10E8C3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 21:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654291438; x=1685827438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2OI/lUpRFaGvH5YH9yIv5iDegl4gTjh+yhdOmEsk8oM=;
 b=fGPePEuDYA6nt+Fl0bDje8/cEk+PDwviuplvNMKDeCbnzia3CLK0kZNl
 6US3eM9vrkuq1O10g6M9tdfoQBhQcXZMHKuGuxw07T5uwylI4CrmfkM4G
 fbjzRQuXqAzOgNwAWOes04c3p7rsZXordxi6xurmvHRE6ufNBA/dQiXeR
 3d7Raj1sttipvcBjAY3oVF0K3ic7lNSfwmUM7tPQ8NQ14L0XslcVX+Eny
 X6Nxn96vXCIFJd0Z+l3wTmIWK0DXyZlNW6hSvSAEeCpZfiUki2AD/wlzY
 uvC0ZVxz7Gm5+0xsb48OvozX3CciAi3yu+DhV0l3pdIpfjWrdBzdJu3ST A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="256209625"
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="256209625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2022 14:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,275,1647327600"; d="scan'208";a="668629860"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Jun 2022 14:23:58 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/virtio: fence created per cursor/plane update
Date: Fri,  3 Jun 2022 14:18:49 -0700
Message-Id: <20220603211849.27703-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220603211849.27703-1-dongwon.kim@intel.com>
References: <20220603211849.27703-1-dongwon.kim@intel.com>
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
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Having one fence for a vgfb would cause conflict in case there are
multiple planes referencing the same vgfb (e.g. Xorg screen covering
two displays in extended mode) being flushed simultaneously. So it makes
sence to use a separated fence for each plane update to prevent this.

vgfb->fence is not required anymore with the suggested code change so
both prepare_fb and cleanup_fb are removed since only fence creation/
freeing are done in there.

v2: - use the fence always as long as guest_blob is enabled on the
      scanout object
    - obj and fence initialized as NULL ptrs to avoid uninitialzed
      ptr problem (Reported by Dan Carpenter/kernel-test-robot)

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |   1 -
 drivers/gpu/drm/virtio/virtgpu_plane.c | 103 ++++++++++---------------
 2 files changed, 39 insertions(+), 65 deletions(-)

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
index 6d3cc9e238a4..821023b7d57d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -137,29 +137,37 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	struct virtio_gpu_object_array *objs = NULL;
+	struct virtio_gpu_fence *fence = NULL;
 
 	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
-	if (vgfb->fence) {
-		struct virtio_gpu_object_array *objs;
 
+	if (!bo)
+		return;
+
+	if (bo->dumb && bo->guest_blob)
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
 
@@ -239,47 +247,6 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
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
@@ -290,6 +257,8 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo = NULL;
+	struct virtio_gpu_object_array *objs = NULL;
+	struct virtio_gpu_fence *fence = NULL;
 	uint32_t handle;
 
 	if (plane->state->crtc)
@@ -309,22 +278,32 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (bo && bo->dumb && (plane->state->fb != old_state->fb)) {
 		/* new cursor -- update & wait */
-		struct virtio_gpu_object_array *objs;
+		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+					       0);
+		if (!fence)
+			return;
 
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
@@ -358,15 +337,11 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
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

