Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 737679D2037
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:26:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A1410E198;
	Tue, 19 Nov 2024 06:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmyb4QOT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6815A10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731997585; x=1763533585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WH5ZYTfeN7aKw1tdpnnq1SK2rquBbNN2yGhWOe/2rv4=;
 b=cmyb4QOTHdsvCByTkt7GWyY45hP4yHktR8hiNVn4S1FZ2FxE0uzBvplp
 Uxin9Suxe6AxwaDhX+RABquwQMOrvvoWjJgL8nQN+5pdQuxkt81yefgeu
 pkKNU0jRuhzwIlROXt810uPh1ccABzqmLSBJSKZuW3cSSxdcZqa9z99Rd
 2Cj82PwVYWn3yEeVermUuE/ryYkN4+6D7bpMpHKh30hCS7iANmNQsICJw
 C61l1yHI5GuaYv7nhpymsEkkAhegIFQdIg0tS17CThECD+/qgc2pYecIe
 tDT495FxdFgXXUvFntAeopjj1tp7Aqtesl96OcLDzAyPR+RhAq3RBwJV0 g==;
X-CSE-ConnectionGUID: pZuifjLtTPOpK1/ripMXJQ==
X-CSE-MsgGUID: eJ0XVBrcTXGNNIkKS3bcyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32038784"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32038784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:25 -0800
X-CSE-ConnectionGUID: Ia48l8gYTmSjzj/4Qsknew==
X-CSE-MsgGUID: H4KKpmqkRjmXFyGa1YlrFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94531824"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:24 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v3 5/5] drm/virtio: Add prepare and cleanup routines for
 imported dmabuf obj
Date: Mon, 18 Nov 2024 21:59:40 -0800
Message-ID: <20241119060248.3312553-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
References: <20241119060248.3312553-1-vivek.kasireddy@intel.com>
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
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 65 +++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 2add67c6b66d..42aa554eca9f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -27,6 +27,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
+#include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
 
@@ -259,6 +260,44 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
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
@@ -267,6 +306,8 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	struct virtio_gpu_framebuffer *vgfb;
 	struct virtio_gpu_plane_state *vgplane_st;
 	struct virtio_gpu_object *bo;
+	struct drm_gem_object *obj;
+	int ret;
 
 	if (!new_state->fb)
 		return 0;
@@ -280,7 +321,14 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 	if (!bo || (plane->type == DRM_PLANE_TYPE_PRIMARY && !bo->guest_blob))
 		return 0;
 
-	if (bo->dumb) {
+	obj = new_state->fb->obj[0];
+	if (obj->import_attach) {
+		ret = virtio_gpu_prepare_imported_obj(plane, new_state, obj);
+		if (ret)
+			return ret;
+	}
+
+	if (bo->dumb || obj->import_attach) {
 		vgplane_st->fence = virtio_gpu_fence_alloc(vgdev,
 						     vgdev->fence_drv.context,
 						     0);
@@ -291,10 +339,21 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
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
 	struct virtio_gpu_plane_state *vgplane_st;
+	struct drm_gem_object *obj;
 
 	if (!state->fb)
 		return;
@@ -304,6 +363,10 @@ static void virtio_gpu_plane_cleanup_fb(struct drm_plane *plane,
 		dma_fence_put(&vgplane_st->fence->f);
 		vgplane_st->fence = NULL;
 	}
+
+	obj = state->fb->obj[0];
+	if (obj->import_attach)
+		virtio_gpu_cleanup_imported_obj(obj);
 }
 
 static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
-- 
2.45.1

