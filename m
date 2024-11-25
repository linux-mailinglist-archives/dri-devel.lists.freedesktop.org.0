Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA7C9D7C37
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 08:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14ACE10E38E;
	Mon, 25 Nov 2024 07:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CaZiXpV7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D29C10E38E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732521366; x=1764057366;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OrS0bB2kJRk8ZQms5iE6wug8qaZNdeaXVbMP+hl6TBI=;
 b=CaZiXpV7MNM6iBJY4iHXwRdQO4SboZe7sIHus/Wm5DTVb47YaiKp+wzy
 Lup0eCIkVOFXWNqjtSq2b5a9lXEN4FFokbdjFjfZT7reCw1qivKeuXyUu
 goy9194zRJDVIOteppyXNlPJ016ANz1fw5mYBp56vCe1C7shS40Mpt2F8
 QB+SQL/JiR6fpnbRBVXrL83vf7BmNR8mMc4RUabkzqaLc4GOMiMNqD5ij
 LhePU30m56Z1fa3sddwClBrwHVKxOH51mCdj1l+Uhiz6agjf0pXSyaeAj
 KbhSx4ISVY+sL4l2212TLTam85/xdsnL5mhw8lOGRhN10/bDlb5ONv9QX g==;
X-CSE-ConnectionGUID: Hqs1IUbBTkmV1T6+O4oA/Q==
X-CSE-MsgGUID: ISobIrQXQT+ZEmlwYLrRtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43270784"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="43270784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:56:05 -0800
X-CSE-ConnectionGUID: JFLodtc3TbqequOgDXkwxg==
X-CSE-MsgGUID: vwFHspK3T0ev1hRahgSsrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="96244609"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 23:56:06 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma addrs
 and lengths
Date: Sun, 24 Nov 2024 23:31:03 -0800
Message-ID: <20241125073313.3361612-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/virtio/virtgpu_prime.c | 43 ++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 6584f7984b1e..ad6960aa464e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -89,6 +89,7 @@ struct virtio_gpu_object_params {
 
 struct virtio_gpu_object {
 	struct drm_gem_shmem_object base;
+	struct sg_table *sgt;
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
@@ -477,6 +478,10 @@ struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 struct drm_gem_object *virtgpu_gem_prime_import_sg_table(
 	struct drm_device *dev, struct dma_buf_attachment *attach,
 	struct sg_table *sgt);
+int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
+			       unsigned int *nents,
+			       struct virtio_gpu_object *bo,
+			       struct dma_buf_attachment *attach);
 
 /* virtgpu_debugfs.c */
 void virtio_gpu_debugfs_init(struct drm_minor *minor);
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 44425f20d91a..2d644240a2b7 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -27,6 +27,8 @@
 
 #include "virtgpu_drv.h"
 
+MODULE_IMPORT_NS(DMA_BUF);
+
 static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 				   uuid_t *uuid)
 {
@@ -142,6 +144,47 @@ struct dma_buf *virtgpu_gem_prime_export(struct drm_gem_object *obj,
 	return buf;
 }
 
+int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
+			       unsigned int *nents,
+			       struct virtio_gpu_object *bo,
+			       struct dma_buf_attachment *attach)
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
+	if (ret <= 0)
+		return ret < 0 ? ret : -ETIMEDOUT;
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
+	bo->detached = false;
+	return 0;
+}
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
-- 
2.45.1

