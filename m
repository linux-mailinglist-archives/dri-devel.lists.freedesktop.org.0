Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38F40A1B9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0D66E2E3;
	Mon, 13 Sep 2021 23:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5176E2C8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516276"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516276"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534435"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC v1 6/6] drm/virtio: Add a fence to set_scanout_blob
Date: Mon, 13 Sep 2021 16:35:29 -0700
Message-Id: <20210913233529.3194401-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 63 +++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a49fd9480381..ab39254c19e5 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -27,6 +27,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_vblank.h>
 
 #include "virtgpu_drv.h"
 
@@ -163,6 +164,60 @@ static void virtio_gpu_resource_flush(struct drm_plane *plane,
 	}
 }
 
+static void virtio_gpu_set_scanout_blob(struct drm_plane *plane,
+					struct virtio_gpu_output *output)
+{
+	struct drm_device *dev = plane->dev;
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_framebuffer *vgfb;
+	struct virtio_gpu_object *bo;
+
+	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
+	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
+	if (bo->guest_blob && vgdev->ddev->mode_config.release_fence) {
+		struct drm_crtc_state *crtc_state;
+		struct drm_pending_event *e;
+		struct virtio_gpu_object_array *objs;
+		struct virtio_gpu_fence *fence;
+
+		crtc_state = output->crtc.state;
+		if (!crtc_state || !crtc_state->event)
+			return;
+
+		e = &crtc_state->event->base;
+		if (!e->release_fence)
+			return;
+
+		fence = virtio_gpu_fence_alloc(vgdev);
+		if (!fence)
+			return;
+
+		objs = virtio_gpu_array_alloc(1);
+		if (!objs)
+			return;
+
+		fence->release_fence = e->release_fence;
+		virtio_gpu_array_add_obj(objs, vgfb->base.obj[0]);
+		virtio_gpu_array_lock_resv(objs);
+		virtio_gpu_cmd_set_scanout_blob(vgdev, output->index, bo,
+						plane->state->fb,
+						plane->state->src_w >> 16,
+						plane->state->src_h >> 16,
+						plane->state->src_x >> 16,
+						plane->state->src_y >> 16,
+						objs, fence);
+	} else {
+		virtio_gpu_cmd_set_scanout_blob(vgdev, output->index, bo,
+						plane->state->fb,
+						plane->state->src_w >> 16,
+						plane->state->src_h >> 16,
+						plane->state->src_x >> 16,
+						plane->state->src_y >> 16,
+						NULL, NULL);
+	}
+}
+
+
 static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 					    struct drm_atomic_state *state)
 {
@@ -215,13 +270,7 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 			  plane->state->src_y >> 16);
 
 		if (bo->host3d_blob || bo->guest_blob) {
-			virtio_gpu_cmd_set_scanout_blob
-						(vgdev, output->index, bo,
-						 plane->state->fb,
-						 plane->state->src_w >> 16,
-						 plane->state->src_h >> 16,
-						 plane->state->src_x >> 16,
-						 plane->state->src_y >> 16);
+			virtio_gpu_set_scanout_blob(plane, output);
 		} else {
 			virtio_gpu_cmd_set_scanout(vgdev, output->index,
 						   bo->hw_res_handle,
-- 
2.30.2

