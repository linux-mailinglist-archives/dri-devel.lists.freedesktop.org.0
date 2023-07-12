Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4941775141D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB76210E5E6;
	Wed, 12 Jul 2023 23:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E4410E5E6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 23:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689203226; x=1720739226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2TFWR9vPmUHU6eTAescV3auGVCXRde04RLPnatHt3Nw=;
 b=MgBSNhAt0kW/pTmptFlH9+3Bm3enzGZdDeFlvYyi3CSZBG+2mfVVrgGs
 GYZv6A9IWs18GjgVj/RbUV2v3z0SSJV2t1MHsqh9ZenoUol0ivXLCOGsG
 Drt5J2ZNikrPtPCrq5a3nny5I7BGAHAa92pdfyPUcGnELe8DY1RZpfBIS
 4t1BJ0ERQbt50OaaZZJuoT+vtEMTxxIEV+C6+6I8k2ie+iFGskylkQXX1
 LSGsrGG1h+C0dGbKrdVlaxuj9G6HxURJMuNK/7xOR4cDDxNsxWmsggeh0
 A2jAvKnhyniU7dR7dORTdvxZQrT9QXhE2PlkRxWQyQ8yq1zQYFtO4sRdn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="367654219"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="367654219"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 16:07:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895772024"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; d="scan'208";a="895772024"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 16:07:05 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/3] drm/virtio: new fence for every plane update
Date: Wed, 12 Jul 2023 15:44:23 -0700
Message-Id: <20230712224424.30158-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230712224424.30158-1-dongwon.kim@intel.com>
References: <20230712224424.30158-1-dongwon.kim@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, kraxel@redhat.com,
 Dongwon Kim <dongwon.kim@intel.com>
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

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 +++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 76 +++++++++++++++-----------
 2 files changed, 51 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 4126c384286b..61fd37f95fbd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -191,6 +191,13 @@ struct virtio_gpu_framebuffer {
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
index a2e045f3a000..a063f06ab6c5 100644
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

