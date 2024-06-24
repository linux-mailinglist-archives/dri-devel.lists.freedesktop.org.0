Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3394991434F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE5A10E375;
	Mon, 24 Jun 2024 07:14:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvKM9MWD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A4710E371
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213231; x=1750749231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HXyK1qOa1ip0XXuv5kcsFQd/Q9LrHUNkbudGcQk4EJc=;
 b=cvKM9MWDJ56z1+R6W90UKVbZ3yJc35rWGDsvWDDF6C/8hSr9NT30dUv5
 F71FHoeniSE2a0eR7oYHluyg4rlM0UbvHhKq53TlTh4f3+qAftA6es4oF
 Z+3GiWG8csb4mjXUUfMMZneS5F0n3Jj1LQor2biWWq30do/mIoTc5Dg1o
 W/zIwrTiSv0lTaHB86HWur/F0UKyBQBaudFR/MROwigx+wKPYs/b/znOx
 ZtC09Mm9Pj1QV40XbqZcUqPJNDUWZcO4rlhLwpDkBK4GgMBdpkgnmbmSH
 oMAhDrRRIly7CekWyinHvr3/SJB0pu1bJ5sByUxn/0+Njf7LLs520CMGW w==;
X-CSE-ConnectionGUID: 8ZeJh/1LTu23JpZObqXyoQ==
X-CSE-MsgGUID: cY/ecAYyTnmLQrPGC5xdcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16136018"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16136018"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:51 -0700
X-CSE-ConnectionGUID: mS3ROmTLRhK0UothpYirOQ==
X-CSE-MsgGUID: QlK/xOmpRti5ffZC417/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73960061"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 2/5] drm/virtio: Add a helper to map and note the dma addrs
 and lengths
Date: Sun, 23 Jun 2024 23:43:31 -0700
Message-ID: <20240624064841.1572452-3-vivek.kasireddy@intel.com>
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

This helper would be used when first initializing the object as
part of import and also when updating the plane where we need to
ensure that the imported object's backing is valid.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  5 +++
 drivers/gpu/drm/virtio/virtgpu_prime.c | 42 ++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 961490f59169..aef80c3100d6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,6 +89,7 @@ struct virtio_gpu_object_params {
 
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
+	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
@@ -470,6 +471,10 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
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

