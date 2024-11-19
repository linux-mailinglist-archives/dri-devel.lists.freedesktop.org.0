Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B215D9D203B
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0691F10E5C0;
	Tue, 19 Nov 2024 06:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J81yDzuZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2659A10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731997585; x=1763533585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NX5Zzrg03afDUAVeBANgSjkoTb1eZbwCF/1nPF8FDOk=;
 b=J81yDzuZALaE5byCUd9VeQr96sef0N5MZRrsom+4P7zepqVSwZIOTON1
 PKoRTqpB8YI6Q3FyasaZjU+6mw1LdIg15Fh0drd2eENJEdXesPW1UhN5I
 S0Wh2Cca0W3hjTe1NFqYbC9OA3NZ9P0fdaRGaAtvX97zVBL21LlxRQK0z
 e2RPam5Ufbbx7B1Ihv/QqXcsY4zOv5FjM9TF0ce+V73eEt8H64QcwuiOh
 thgoKBYSi7G2q8y1ZZN/uLeH0rFtVOF9iKrCTLF0ZFLosNjwsZvjLWY+5
 MuG9btzS5O3Dcjj6GR9SoZhQIjywsxqyMAPiH/o03L9rbej07XfwaSHWl g==;
X-CSE-ConnectionGUID: TyW1W+8RReO/Ski1mrggUw==
X-CSE-MsgGUID: 825fYy12SkWKJLl8f4Kpjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32038769"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32038769"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:24 -0800
X-CSE-ConnectionGUID: BFi9avI1QTuZUZSZtAXYOg==
X-CSE-MsgGUID: CWa71m6SR/aQ8qT1ATw0Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94531815"
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
Subject: [PATCH v3 2/5] drm/virtio: Add a helper to map and note the dma addrs
 and lengths
Date: Mon, 18 Nov 2024 21:59:37 -0800
Message-ID: <20241119060248.3312553-3-vivek.kasireddy@intel.com>
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

This helper would be used when first initializing the object as
part of import and also when updating the plane where we need to
ensure that the imported object's backing is valid.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 +++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 42 ++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5982c41c9ed8..b5851e139114 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,6 +89,7 @@ struct virtio_gpu_object_params {
 
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
+	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
@@ -480,6 +481,10 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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
index 44425f20d91a..c2ae59146ac9 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -27,6 +27,8 @@
 
 #include "virtgpu_drv.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 				   uuid_t *uuid)
 {
@@ -142,6 +144,46 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
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
+	return 0;
+}
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
-- 
2.45.1

