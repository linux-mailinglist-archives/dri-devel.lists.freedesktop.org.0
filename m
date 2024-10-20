Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E19C9A576C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 01:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037BA10E131;
	Sun, 20 Oct 2024 23:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="WMq6dWaU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6DE10E131
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 23:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1729465707; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=d/H/pOGfCSEFfRKwoys+TLlZo7n1Lae+zWnmdaSDT/O7HPAfJTJolW4Abo9m9M/LVN5G2fj3P1vKP1DId8V9VMwxXvuCMCufB1ntWlHm6vhGbbeKCuQZ/SAnYFNtpZ7xX0DTQKJAKY1hoaIZ+BMVVm+x9957PXgwQKNvnPSrmwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1729465707;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=NSMo1G/5mzlO6sSUsZnRrHjoUcA/glI1EUTfxStqJa0=; 
 b=IYEC5kav78yWOWSs7wFbOoc48wxJJeoN2jSnqPv4/PEnHa9MSBezgwIdqst3bBZza4E7yTrgRaDMTQ6J4p1CcIxEypI+HCqqOP829OfvX4oj/eTWdyeX53ez18dYQxJB8MlTspa5jbaY9ZX4PpJjQrGRLq6ijO83mjl2UK/Ness=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729465707; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=NSMo1G/5mzlO6sSUsZnRrHjoUcA/glI1EUTfxStqJa0=;
 b=WMq6dWaU7D5GB2HEZs2emoYjNzUIEVdCjH/ODFj5w+cd6sHpxB6/9X8d/3iWDiy3
 VT6xAdBavi8td7mwrinN7/iUTscKBiVnXqdLdEYY0z6WsdjWcwrGEOBrXglHRxSAd6n
 DBCK/jpVr03gSFBGJNOdNFwqVQeKdRPAcLcE2uqk=
Received: by mx.zohomail.com with SMTPS id 172946570460449.947607983647686;
 Sun, 20 Oct 2024 16:08:24 -0700 (PDT)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Kim Dongwon <dongwon.kim@intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH v3 2/2] drm/virtio: New fence for every plane update
Date: Mon, 21 Oct 2024 02:08:03 +0300
Message-ID: <20241020230803.247419-2-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
References: <20241020230803.247419-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dongwon Kim <dongwon.kim@intel.com>

Having a fence linked to a virtio_gpu_framebuffer in the plane update
sequence would cause conflict when several planes referencing the same
framebuffer (e.g. Xorg screen covering multi-displays configured for an
extended mode) and those planes are updated concurrently. So it is needed
to allocate a fence for every plane state instead of the framebuffer.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
[dmitry.osipenko@collabora.com: rebase, fix up, edit commit message]
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  7 ++++
 drivers/gpu/drm/virtio/virtgpu_plane.c | 58 +++++++++++++++++---------
 2 files changed, 46 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..5dc8eeaf7123 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -194,6 +194,13 @@ struct virtio_gpu_framebuffer {
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
index ab7232921cb7..2add67c6b66d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -67,11 +67,28 @@ uint32_t virtio_gpu_translate_format(uint32_t drm_fourcc)
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
 static const struct drm_plane_funcs virtio_gpu_plane_funcs = {
 	.update_plane		= drm_atomic_helper_update_plane,
 	.disable_plane		= drm_atomic_helper_disable_plane,
 	.reset			= drm_atomic_helper_plane_reset,
-	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
+	.atomic_duplicate_state = virtio_gpu_plane_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
@@ -139,11 +156,13 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
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
@@ -152,13 +171,11 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
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
 	} else {
 		virtio_gpu_cmd_resource_flush(vgdev, bo->hw_res_handle, x, y,
 					      width, height, NULL, NULL);
@@ -248,12 +265,14 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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
 
 	drm_gem_plane_helper_prepare_fb(plane, new_state);
@@ -261,10 +280,11 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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
 
@@ -274,15 +294,15 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
-	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_plane_state *vgplane_st;
 
 	if (!state->fb)
 		return;
 
-	vgfb = to_virtio_gpu_framebuffer(state->fb);
-	if (vgfb->fence) {
-		dma_fence_put(&vgfb->fence->f);
-		vgfb->fence = NULL;
+	vgplane_st = to_virtio_gpu_plane_state(state);
+	if (vgplane_st->fence) {
+		dma_fence_put(&vgplane_st->fence->f);
+		vgplane_st->fence = NULL;
 	}
 }
 
@@ -295,6 +315,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_plane_state *vgplane_st;
 	struct virtio_gpu_object *bo = NULL;
 	uint32_t handle;
 
@@ -307,6 +328,7 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
 
 	if (plane->state->fb) {
 		vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+		vgplane_st = to_virtio_gpu_plane_state(plane->state);
 		bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 		handle = bo->hw_res_handle;
 	} else {
@@ -326,11 +348,9 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
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
 	}
 
 	if (plane->state->fb != old_state->fb) {
-- 
2.47.0

