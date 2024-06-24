Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB56291434C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA11F10E371;
	Mon, 24 Jun 2024 07:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nDynNLsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEFF10E04F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213232; x=1750749232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iSu7QINu18r9vQ+1oK+UdsJ3Nl14mo+ULHVxcIRnZK8=;
 b=nDynNLsmf9PguoH5PlV7u13EzVvrB871AnIIurEsfYoaVOxW0m7ZBedP
 oxsnmE36hjv0kAe2+L/xQAAymkgIHuQyhOSK8ehoWqhOgAfeGQ5tpowzv
 955oTf+k9qNKwW9Pw+2DPJORltpXmPLrJcNOrRu1fM3Ko7cqfoVw1zIVS
 X598fVGD3QVnarkCHHgbUKQWoi19kwH3b/q/6EY02qAyvYmkNCqOrOtPH
 jowZebvWyN89n1pX3x55g0NBYSK7N3kX7CCC6Qx6oW5R9Q+vgrhBufoQs
 Ay8Dl/N9Ayu7pb0TRSSNKcF9mHz79+YVstFL7Z2GK+DSUpXyBMbw+RSkc A==;
X-CSE-ConnectionGUID: zRKC6V8rTwCCrjch6IfIjQ==
X-CSE-MsgGUID: nDzFC54GRAqGNxaYHKvNWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16136024"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16136024"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:51 -0700
X-CSE-ConnectionGUID: e9P3trBpRBS1zdvZGZFcng==
X-CSE-MsgGUID: 34UWcODeSDCjlKIeRpA0PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73960072"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 5/5] drm/virtio: Add prepare and cleanup routines for
 imported dmabuf obj
Date: Sun, 23 Jun 2024 23:43:34 -0700
Message-ID: <20240624064841.1572452-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
References: <20240624064841.1572452-1-vivek.kasireddy@intel.com>
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

When an imported dmabuf obj is used as part of an atomic commit, we
need to pin it as part of prepare and unpin it during cleanup of
the associated FB, to make sure that it does not move until the
commit is completed (and also while it is being used on the Host).

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 71 +++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a72a2dbda031..5ab0741b67cd 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -25,7 +25,9 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_fourcc.h>
+#include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
 
@@ -241,6 +243,48 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				  rect.y2 - rect.y1);
 }
 
+static int virtio_gpu_prepare_imported_obj(struct drm_plane *plane,
+					   struct drm_plane_state *new_state,
+					   struct drm_gem_object *obj)
+{
+	struct virtio_gpu_device *vgdev = plane->dev->dev_private;
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct dma_buf_attachment *attach = obj->import_attach;
+	struct dma_resv *resv = attach->dmabuf->resv;
+	struct virtio_gpu_mem_entry *ents = NULL;
+	unsigned int nents;
+	int ret;
+
+	dma_resv_lock(resv, NULL);
+
+	ret = dma_buf_pin(attach);
+	if (ret) {
+		dma_resv_unlock(resv);
+		return ret;
+	}
+
+	ret = drm_gem_plane_helper_prepare_fb(plane, new_state);
+	if (ret)
+		goto err;
+
+	if (!bo->sgt) {
+		ret = virtgpu_dma_buf_import_sgt(&ents, &nents,
+						 bo, attach);
+		if (ret)
+			goto err;
+
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	}
+
+	dma_resv_unlock(resv);
+	return 0;
+
+err:
+	dma_buf_unpin(attach);
+	dma_resv_unlock(resv);
+	return ret;
+}
+
 static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 				       struct drm_plane_state *new_state)
 {
@@ -248,6 +292,8 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_object *bo;
+	struct drm_gem_object *obj;
+	int ret;
 
 	if (!new_state->fb)
 		return 0;
@@ -257,7 +303,15 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
 		return 0;
 
-	if (bo->dumb && (plane->state->fb != new_state->fb)) {
+	obj = new_state->fb->obj[0];
+	if (obj->import_attach) {
+		ret = virtio_gpu_prepare_imported_obj(plane, new_state, obj);
+		if (ret)
+			return ret;
+	}
+
+	if ((bo->dumb || obj->import_attach) &&
+	    (plane->state->fb != new_state->fb)) {
 		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
 						     0);
 		if (!vgfb->fence)
@@ -267,10 +321,21 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	return 0;
 }
 
+static void virtio_gpu_cleanup_imported_obj(struct drm_gem_object *obj)
+{
+	struct dma_buf_attachment *attach = obj->import_attach;
+	struct dma_resv *resv = attach->dmabuf->resv;
+
+	dma_resv_lock(resv, NULL);
+	dma_buf_unpin(attach);
+	dma_resv_unlock(resv);
+}
+
 static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 					struct drm_plane_state *state)
 {
 	struct virtio_gpu_framebuffer *vgfb;
+	struct drm_gem_object *obj;
 
 	if (!state->fb)
 		return;
@@ -280,6 +345,10 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 		dma_fence_put(&vgfb->fence->f);
 		vgfb->fence = NULL;
 	}
+
+	obj = state->fb->obj[0];
+	if (obj->import_attach)
+		virtio_gpu_cleanup_imported_obj(obj);
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
-- 
2.45.1

