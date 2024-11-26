Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C3A9D90C1
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 04:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFEA10E781;
	Tue, 26 Nov 2024 03:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/LooBkE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B03410E77F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 03:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732592385; x=1764128385;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=v307ft1md890Ecs/KHmyZNDcXrtMzKKC+aLcNVrJFio=;
 b=G/LooBkENql/Xu4TBQ22E0c0GQZoV3tB4Me30pmivexcEFz3uQKoKCUa
 WSaC+lJ4hebaziyvaaqK1XxipN2FfcwguAm+7mgZ5qhmUbc9lM8SMiXWk
 ogeuGcDXEYa52eR1tkvxjBpg0Ijr9aAM1KAdjyMuySPEhDqEjLdS+iQ/B
 e/kqBdk1Pd4hwOM8V6IWLOU/pSI05fLjpwXIRnVxLvtVwgeo1mMrR5ZLy
 mE9VbkxnAfLnml26tIz+JHZhc7g3+uPE/kkS7eU3w1e6OFs0ChgMHCdH8
 yijVn+TQIyJn+tZGcAM8vTTqLn2gxJ8lJcBb/87ZE3RdU+hKs5jKb7ULd Q==;
X-CSE-ConnectionGUID: iomFGmMOS+qF0IhEKBpGaw==
X-CSE-MsgGUID: 6iSAL/6CT0CNVjYARgXgiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32106130"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="32106130"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 19:39:43 -0800
X-CSE-ConnectionGUID: A1qEyHAkQuOJSKwjIXjIjg==
X-CSE-MsgGUID: BhE8omhDQWW7mmEiU8nP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; d="scan'208";a="95553445"
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
Subject: [PATCH v5 1/5] drm/virtio: Implement
 VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Date: Mon, 25 Nov 2024 19:13:42 -0800
Message-ID: <20241126031643.3490496-2-vivek.kasireddy@intel.com>
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

This cmd is useful to let the VMM (i.e, Qemu) know that the backing
store associated with a resource is no longer valid, so that the VMM
can perform any cleanup or unmap operations.

The fence related changes and virtio_gpu_object_detach()/
virtio_gpu_detach_object_fenced() routines are extracted from a
patch by Dmitry Osipenko <dmitry.osipenko@collabora.com>.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Chia-I Wu <olvaffe@gmail.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  5 ++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 21 +++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 35 +++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 96eb576bc1b8..77892fa01ef0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -92,6 +92,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool attached;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -353,6 +354,10 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence);
+int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index c7e74cf13022..d18263ddd972 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -97,6 +97,27 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	virtio_gpu_cleanup_object(bo);
 }
 
+int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_fence *fence;
+
+	if (!bo->attached)
+		return 0;
+
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
+	if (!fence)
+		return -ENOMEM;
+
+	virtio_gpu_object_detach(vgdev, bo, fence);
+	virtio_gpu_notify(vgdev);
+
+	dma_fence_wait(&fence->f, false);
+	dma_fence_put(&fence->f);
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0d3d0d09f39b..ad91624df42d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -645,6 +645,23 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+static void
+virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+				       uint32_t resource_id,
+				       struct virtio_gpu_fence *fence)
+{
+	struct virtio_gpu_resource_detach_backing *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING);
+	cmd_p->resource_id = cpu_to_le32(resource_id);
+
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
@@ -1103,8 +1120,26 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents)
 {
+	if (obj->attached)
+		return;
+
 	virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
 					       ents, nents, NULL);
+
+	obj->attached = true;
+}
+
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence)
+{
+	if (!obj->attached)
+		return;
+
+	virtio_gpu_cmd_resource_detach_backing(vgdev, obj->hw_res_handle,
+					       fence);
+
+	obj->attached = false;
 }
 
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
-- 
2.45.1

