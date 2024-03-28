Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176C288FA91
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:01:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE0B2112374;
	Thu, 28 Mar 2024 09:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ccc/MoST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD802112375
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711616465; x=1743152465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s8pAANdZtCNN1XiR0mAMSVFYGgUSJqQwR21Of+VmR58=;
 b=ccc/MoSTtbW0pa4WCFbicjtLGKqjifgPpd5vLZ9AO3qsDP9fyeFLgBu2
 rHQORJm485zXOyJSzFS+hsZhRp1aD5BP7i3GiHs11pvd+HTolC4fVxYkj
 88VuUCe5IorrSYsTnY249Lk1yEpUdP0dAoMi+WGB4yflBk8hWsBMiTnxP
 H4PByRTHblcCQChUQVlGg80ghmnUamv0elfYOfYP7umf35PW+2bxm+rcn
 NEqnYMXgPYkS2RsWmuLwWXcmjcfAZcehvFWfBFuLbHGMWuqEfmqjnZCrc
 HOYpFOsN/MTpoahKYPl+0nzPZkY38Bri4hHrYIq4UJPpYi+GtQq+b6jRN A==;
X-CSE-ConnectionGUID: fB7RSZYtRvekkaiWeJC5gA==
X-CSE-MsgGUID: b6ZfTn3HTfyiXzbCO890uA==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7355696"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7355696"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="21078222"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 02:01:03 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [RFC 3/7] drm/virtio: Add helpers to initialize and free the imported
 object
Date: Thu, 28 Mar 2024 01:32:56 -0700
Message-ID: <20240328083615.2662516-4-vivek.kasireddy@intel.com>
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

The imported object can be considered a guest blob resource;
therefore, we use create_blob cmd while creating it. These helpers
are used in the next patch which does the actual import.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_prime.c | 69 ++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
index 2a90df39c5de..1e87dbc9a897 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -186,6 +186,75 @@ long virtgpu_dma_buf_import_sgt(struct virtio_gpu_mem_entry **ents,
 	return 0;
 }
 
+static void virtgpu_dma_buf_free_obj(struct drm_gem_object *obj)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
+	struct virtio_gpu_device *vgdev = obj->dev->dev_private;
+	struct dma_buf_attachment *attach = obj->import_attach;
+
+	if (bo->created) {
+		virtio_gpu_cmd_unref_resource(vgdev, bo);
+		virtio_gpu_notify(vgdev);
+	}
+
+	if (attach) {
+		dma_buf_detach(attach->dmabuf, attach);
+		dma_buf_put(attach->dmabuf);
+	}
+
+	drm_gem_object_release(&bo->base.base);
+	kfree(bo);
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
+	ida_free(&vgdev->resource_ida, bo->hw_res_handle - 1);
+	virtgpu_dma_buf_free_obj(&bo->base.base);
+	return ret;
+}
+
 struct drm_gem_object *virtgpu_gem_prime_import(struct drm_device *dev,
 						struct dma_buf *buf)
 {
-- 
2.43.0

