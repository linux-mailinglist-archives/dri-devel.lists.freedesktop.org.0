Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4569D90BD
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 04:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A0910E77E;
	Tue, 26 Nov 2024 03:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VaGLeL0B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0939610E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732592385; x=1764128385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8vyDC372i4nXDYy2HKYW+59PIIJ4XeOc+6BUSpTpDJQ=;
 b=VaGLeL0B/VYFaaSd8kUeECy2GYU6i+gBthNMsq7yZwN0eWlcQW0IRcrw
 6yXrKW+DC/Ozk1v+MsZQz7yu7K2BytrwkQ8lgBFv2rKJPAfXsboVzNADX
 B7HGgTiQmQJHtI588QonywRfidSL2Jqk1IaL2eS1UncJnZvbRFsE9xJh4
 49Hq9xDFk3zALavTn9rRkcsOwOFzPoL3UNX94RGjx/PAse3/qIl4ATnHh
 nbqDqEo3ul8TJ3A5SHjAz4zy4h0DYcynwfznDNpkzhIw+u56jSpEnZNSY
 1+EV7jv9amccWqWOR+Jfe4TbJt69dGnCfC9DLM28VDtd1IJmyZ0ie6t2I w==;
X-CSE-ConnectionGUID: MUymmtvcTrSEeK6JDXeA5A==
X-CSE-MsgGUID: FaD+lc19QSGeKDcp7SeF3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32106140"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32106140"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:39:43 -0800
X-CSE-ConnectionGUID: x0WYZQW6T8uc1sAHk0R8ig==
X-CSE-MsgGUID: yPGKoht6ToueAb+LDrIrwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="95553451"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:39:44 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v5 3/5] drm/virtio: Add helpers to initialize and free the
 imported object
Date: Mon, 25 Nov 2024 19:13:44 -0800
Message-ID: <20241126031643.3490496-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
References: <20241126031643.3490496-1-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/virtio/virtgpu_object.c |  3 +
 drivers/gpu/drm/virtio/virtgpu_prime.c  | 75 +++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index d18263ddd972..5517cff8715c 100644
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
index 8e63aa67270a..887b635dec6f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -184,6 +184,81 @@ int virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 	return 0;
 }
 
+static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct dma_buf_attachment *attach = obj->import_attach;
+
+	if (attach) {
+		virtio_gpu_detach_object_fenced(bo);
+
+		if (bo->sgt)
+			dma_buf_unmap_attachment_unlocked(attach, bo->sgt,
+							  DMA_BIDIRECTIONAL);
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
+	params.blob = true;
+	params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
+	params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
+	params.size = attach->dmabuf->size;
+
+	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
+					    ents, nents);
+	bo->guest_blob = true;
+	bo->attached = true;
+
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

