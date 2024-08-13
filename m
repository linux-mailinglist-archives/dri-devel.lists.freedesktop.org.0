Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7694FC9D
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 06:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB80110E237;
	Tue, 13 Aug 2024 04:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XCHqPo7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B3410E245
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723522793; x=1755058793;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uCmYWZaWguGfF+tAcFFCZyuPn1sdPclunOT0umRZSlM=;
 b=XCHqPo7CXov216G4kx2um9Mygy4svb9wE8b6IkokBTUEgjS/xdAlfV3Z
 GMz40ddMRx/Nj7gOIEHivefsVvk92KVrvaev2Bwaur0LsiQW/LowjUDNJ
 ymOkmeCCHlT4ZUb5MSrpMako4axTgHfQ+sga1sQ2CJ5bQjIqG8KXMhbmu
 klaVU6r5GeH2FdO8op4arEE2y2aySiM5PYisIJAISB3bF2Ksskhb3wG0N
 moETjNW+hVuzgMK2ojuzQc44Qz9fmrq2q/HtixWKKOeZxemwiMfsnftq5
 WcNTsXh12h3/gtKvIxiXK5Z8jLmiBoeChvFK7n1VCF2w9YaskbvmI8V7r A==;
X-CSE-ConnectionGUID: 3+XzpfU7TcyBJ2ti+Vj6/A==
X-CSE-MsgGUID: h7RRPgsUT1+uLsfyLT7NUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44186504"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="44186504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:19:52 -0700
X-CSE-ConnectionGUID: 4WiybrsxRNuJBIBUUAdJMw==
X-CSE-MsgGUID: JN5lX2YETWO26xF9ocpMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="63486664"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 21:19:52 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v2 3/5] drm/virtio: Add helpers to initialize and free the
 imported object
Date: Mon, 12 Aug 2024 20:49:11 -0700
Message-ID: <20240813035509.3360760-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
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

The imported object can be considered a guest blob resource;
therefore, we use create_blob cmd while creating it. These helpers
are used in the next patch which does the actual import.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_object.c |  3 ++
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 71 +++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index 53bb02c8a135..2b19bb8c6ec3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -80,6 +80,9 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
 		drm_gem_free_mmap_offset(&vram->base.base.base);
 		drm_gem_object_release(&vram->base.base.base);
 		kfree(vram);
+	} else {
+		drm_gem_object_release(&bo->base.base);
+		kfree(bo);
 	}
 }
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index c2ae59146ac9..e9b5b5a7f8dc 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -184,6 +184,77 @@ long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 	return 0;
 }
 
+static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct dma_buf_attachment *attach = obj->import_attach;
+
+	if (attach) {
+		if (bo->sgt)
+			dma_buf_unmap_attachment(attach, bo->sgt,
+						 DMA_BIDIRECTIONAL);
+
+		dma_buf_detach(attach->dmabuf, attach);
+		dma_buf_put(attach->dmabuf);
+	}
+
+	if (bo->created) {
+		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_notify(vgdev);
+		return;
+	}
+	virtio_gpu_cleanup_object(bo);
+}
+
+static int virtgpu_dma_buf_init_obj(struct drm_device *dev,
+				    struct virtio_gpu_object *bo,
+				    struct dma_buf_attachment *attach)
+{
+	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_object_params params = { 0 };
+	struct dma_resv *resv = attach->dmabuf->resv;
+	struct virtio_gpu_mem_entry *ents = NULL;
+	unsigned int nents;
+	int ret;
+
+	ret = virtio_gpu_resource_id_get(vgdev, &bo->hw_res_handle);
+	if (ret) {
+		virtgpu_dma_buf_free_obj(&bo->base.base);
+		return ret;
+	}
+
+	dma_resv_lock(resv, NULL);
+
+	ret = dma_buf_pin(attach);
+	if (ret)
+		goto err_pin;
+
+	ret = virtgpu_dma_buf_import_sgt(&ents, &nents, bo, attach);
+	if (ret)
+		goto err_import;
+
+	bo->guest_blob = true;
+	params.blob = true;
+	params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
+	params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
+	params.size = attach->dmabuf->size;
+
+	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
+					    ents, nents);
+	dma_buf_unpin(attach);
+	dma_resv_unlock(resv);
+
+	return 0;
+
+err_import:
+	dma_buf_unpin(attach);
+err_pin:
+	dma_resv_unlock(resv);
+	virtgpu_dma_buf_free_obj(&bo->base.base);
+	return ret;
+}
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
-- 
2.45.1

