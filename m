Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EA288FA92
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19C411237A;
	Thu, 28 Mar 2024 09:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F8eGXweu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13C112374
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZLevj/OjmhfV4rZUv+DlBsumNlKZPNXGupqqcKwe/Bw=;
 b=F8eGXweuQxFE6tkfY4lrY4B8MG/lJMEeJykqQCq9qjNZ1EduVeeNcm75
 rAnE/OqEUa0R5MNMe9nO+gtt0fSooP+10I31uhfwYyX/UYfsjWL4fMHKs
 1cOXQDgnt7YhfTxds/Iq+1Zbt2I4RcnQGa0ij0fLheGlZfrpiaToPZ45J
 MdIcGf14ipiF8GLiBFzuXwZzmcUxm40JXVUEPj2Zf1IPFoUi9zgIaLp8K
 K7tEHkcCFVsibZMvFFH+zNi2IeRVyO1wAM6+wO9RIt0l9BqHjrHQK3kg5
 ukWQUrPkvWQjgB+J1A1lGYYdFAk2TkK0HRXEWhyUAQ0sB44Ik4JXmFm0P g==;
X-CSE-ConnectionGUID: 2kVHWYD8SguoJF0Ssg2Qgg==
X-CSE-MsgGUID: XGMDdV4NQWyYSRu8MTS21A==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355693"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355693"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078217"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 2/7] drm/virtio: Add a helper to map and note the dma addrs and
 lengths
Date: Thu, 28 Mar 2024 01:32:55 -0700
Message-ID: <20240328083615.2662516-3-vivek.kasireddy@intel.com>
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

This helper would be used when first initializing the object as
part of import and also when updating the plane where we need to
ensure that the imported object's backing is valid.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  6 ++++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 44 ++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 7347835e4fbe..ca4cb166b509 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,9 +89,11 @@ struct virtio_gpu_object_params {
 
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
+	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool has_backing;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -470,6 +472,10 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
+long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
+				unsigned int *nents,
+				struct virtio_gpu_object *bo,
+				struct dma_buf_attachment *attach);
 
 /* virtgpu_debugfs.c */
 void virtio_gpu_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..2a90df39c5de 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -27,6 +27,8 @@
 
 #include "virtgpu_drv.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 				   uuid_t *uuid)
 {
@@ -142,6 +144,48 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 	return buf;
 }
 
+long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
+				unsigned int *nents,
+				struct virtio_gpu_object *bo,
+				struct dma_buf_attachment *attach)
+{
+	struct scatterlist *sl;
+	struct sg_table *sgt;
+	long i, ret;
+
+	dma_resv_assert_held(attach->dmabuf->resv);
+
+	ret = dma_resv_wait_timeout(attach->dmabuf->resv,
+				    DMA_RESV_USAGE_KERNEL,
+				    false, MAX_SCHEDULE_TIMEOUT);
+	if (ret < 0)
+		return ret;
+
+	sgt = dma_buf_map_attachment(attach, DMA_BIDIRECTIONAL);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	*ents = kvmalloc_array(sgt->nents,
+			       sizeof(struct virtio_gpu_mem_entry),
+			       GFP_KERNEL);
+	if (!(*ents)) {
+		dma_buf_unmap_attachment(attach, sgt, DMA_BIDIRECTIONAL);
+		return -ENOMEM;
+	}
+
+	*nents = sgt->nents;
+	for_each_sgtable_dma_sg(sgt, sl, i) {
+		(*ents)[i].addr = cpu_to_le64(sg_dma_address(sl));
+		(*ents)[i].length = cpu_to_le32(sg_dma_len(sl));
+		(*ents)[i].padding = 0;
+	}
+
+	bo->sgt = sgt;
+	bo->has_backing = true;
+
+	return 0;
+}
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
-- 
2.43.0

