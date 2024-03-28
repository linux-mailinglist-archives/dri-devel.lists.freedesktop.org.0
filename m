Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F688FA98
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5602E112385;
	Thu, 28 Mar 2024 09:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bam6dXt1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFA911237B
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=beWUsaWB/DnP65fBEVBr266dc3wxk+XJ3t4STXQsvcM=;
 b=bam6dXt1MuMFhz5YVGRL3LMcrjr0t9xXASH1j8EyLBPR3UgunzubZGTD
 gY26vL80o9PWvr90wBJW4tNIAtoF+PbYnu79htRGhRrN0fwl/7UQHf5WO
 f9pdM35p8S5srYMkfYgq4fobt5EKpI+0i618BE+59gZQBPQi8cEObkg03
 MhCbbY7+L1e35bLD3E87CwX28W6s5hyX9C7K+IEca9eFoOrksJ3ZNEWE9
 WD8dOOospD7QfLrhkqz8XBTdf8oZC1jrPW0y89LETjs/y9im+1V+0z8CF
 MyW52mkOe7D3vDwCwmjKTwAK8+ojE7DhP8TrGpAtEuTqNSVe3tDf6EzxL g==;
X-CSE-ConnectionGUID: lkUAg+K/QImP5/q1D8E72w==
X-CSE-MsgGUID: lT/TM+3dRyaUggob7mcN5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355702"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355702"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078235"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 5/7] drm/virtio: Ensure that bo's backing store is valid while
 updating plane
Date: Thu, 28 Mar 2024 01:32:58 -0700
Message-ID: <20240328083615.2662516-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
References: <20240328083615.2662516-1-vivek.kasireddy@intel.com>
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

To make sure that the imported bo's backing store is valid, we first
pin the associated dmabuf, import the sgt if need be and then unpin
it after the update is complete. Note that we pin/unpin the dmabuf
even when the backing store is valid to ensure that it does not move
when the host update (resource_flush) is in progress.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_plane.c | 56 +++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a72a2dbda031..3ccf88f9addc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -26,6 +26,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_fourcc.h>
+#include <linux/virtio_dma_buf.h>
 
 #include "virtgpu_drv.h"
 
@@ -131,6 +132,45 @@ static void virtio_gpu_update_dumb_bo(struct virtio_gpu_device *vgdev,
 					   objs, NULL);
 }
 
+static bool virtio_gpu_update_dmabuf_bo(struct virtio_gpu_device *vgdev,
+					struct drm_gem_object *obj)
+{
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
+		return false;
+	}
+
+	if (!bo->has_backing) {
+		if (bo->sgt)
+			dma_buf_unmap_attachment(attach,
+						 bo->sgt,
+						 DMA_BIDIRECTIONAL);
+
+		ret = virtgpu_dma_buf_import_sgt(&ents, &nents,
+						 bo, attach);
+		if (ret)
+			goto err_import;
+
+		virtio_gpu_object_attach(vgdev, bo, ents, nents);
+	}
+	return true;
+
+err_import:
+	dma_buf_unpin(attach);
+	dma_resv_unlock(resv);
+	return false;
+}
+
 static void virtio_gpu_resource_flush(struct drm_plane *plane,
 				      uint32_t x, uint32_t y,
 				      uint32_t width, uint32_t height)
@@ -174,7 +214,9 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	struct virtio_gpu_device *vgdev = dev->dev_private;
 	struct virtio_gpu_output *output = NULL;
 	struct virtio_gpu_object *bo;
+	struct drm_gem_object *obj;
 	struct drm_rect rect;
+	bool updated = false;
 
 	if (plane->state->crtc)
 		output = drm_crtc_to_virtio_gpu_output(plane->state->crtc);
@@ -196,10 +238,17 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 	if (!drm_atomic_helper_damage_merged(old_state, plane->state, &rect))
 		return;
 
-	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
+	obj = plane->state->fb->obj[0];
+	bo = gem_to_virtio_gpu_obj(obj);
 	if (bo->dumb)
 		virtio_gpu_update_dumb_bo(vgdev, plane->state, &rect);
 
+	if (obj->import_attach) {
+		updated = virtio_gpu_update_dmabuf_bo(vgdev, obj);
+		if (!updated)
+			return;
+	}
+
 	if (plane->state->fb != old_state->fb ||
 	    plane->state->src_w != old_state->src_w ||
 	    plane->state->src_h != old_state->src_h ||
@@ -239,6 +288,11 @@ static void virtio_gpu_primary_plane_update(struct drm_plane *plane,
 				  rect.y1,
 				  rect.x2 - rect.x1,
 				  rect.y2 - rect.y1);
+
+	if (obj->import_attach && updated) {
+		dma_buf_unpin(obj->import_attach);
+		dma_resv_unlock(obj->import_attach->dmabuf->resv);
+	}
 }
 
 static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
-- 
2.43.0

