Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDED9D2038
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 07:26:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274BF10E5B9;
	Tue, 19 Nov 2024 06:26:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpswWNuN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33CC10E198
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731997585; x=1763533585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h2KyguE5+O5pqlhxH53f3Id5OBdfbL2cpLY5sUkVa3k=;
 b=TpswWNuNaqHGHkxh4s6+TexrWIEKs5M0W1ds7bbO8x2nwQISCSckhsFp
 JLU0BRbyIZ76iv68a9WPckBosHOTZJH+mlB4D3o9GdZ/GyStSQFgu3ihJ
 PBYYVBLELjKxPMu8LqIC0K/1BiZwHq+snsdy/LPV4JgqfcfJfvGR87v+h
 6r5JOsSsGSUUWuRMjyF+1R3Xc5YWx0Pp9o7jv86brUdbYjv22Ysv2fPx/
 dZ6Yo0nf77h1j+15OrhnpNJvVXR12Uili0333arSyaEWuf1Zk00J5xNJI
 n96Z3700MjaATBpo60sZIWB+/WS93wetErELaLlSm3TjIgnmmadmXmo4N g==;
X-CSE-ConnectionGUID: GDDLCQ9qSnKXZ9ydlb+Sbg==
X-CSE-MsgGUID: P9zVdcjcRYSd7IQ/ar9gfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32038764"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="32038764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 22:26:24 -0800
X-CSE-ConnectionGUID: kEFY0NDhTqmuGkljwyBCyQ==
X-CSE-MsgGUID: LEOzl3T3R2uwDGUqmTBkyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94531811"
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
Subject: [PATCH v3 1/5] drm/virtio: Implement
 VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Date: Mon, 18 Nov 2024 21:59:36 -0800
Message-ID: <20241119060248.3312553-2-vivek.kasireddy@intel.com>
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
 drivers/gpu/drm/virtio/virtgpu_drv.h    |  5 +++++
 drivers/gpu/drm/virtio/virtgpu_object.c | 23 +++++++++++++++++++++++
 drivers/gpu/drm/virtio/virtgpu_vq.c     | 25 +++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 5dc8eeaf7123..5982c41c9ed8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -92,6 +92,7 @@ struct virtio_gpu_object {
 	uint32_t hw_res_handle;
 	bool dumb;
 	bool created;
+	bool detached;
 	bool host3d_blob, guest_blob;
 	uint32_t blob_mem, blob_flags;
 
@@ -356,6 +357,10 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
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
index c7e74cf13022..53bb02c8a135 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -97,6 +97,29 @@ static void virtio_gpu_free_object(struct drm_gem_object *obj)
 	virtio_gpu_cleanup_object(bo);
 }
 
+int virtio_gpu_detach_object_fenced(struct virtio_gpu_object *bo)
+{
+	struct virtio_gpu_device *vgdev = bo->base.base.dev->dev_private;
+	struct virtio_gpu_fence *fence;
+
+	if (bo->detached)
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
+	bo->detached = true;
+
+	return 0;
+}
+
 static const struct drm_gem_object_funcs virtio_gpu_shmem_funcs = {
 	.free = virtio_gpu_free_object,
 	.open = virtio_gpu_gem_object_open,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0d3d0d09f39b..b8b296b912a1 100644
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
@@ -1107,6 +1124,14 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 					       ents, nents, NULL);
 }
 
+void virtio_gpu_object_detach(struct virtio_gpu_device *vgdev,
+			      struct virtio_gpu_object *obj,
+			      struct virtio_gpu_fence *fence)
+{
+	virtio_gpu_cmd_resource_detach_backing(vgdev, obj->hw_res_handle,
+					       fence);
+}
+
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output)
 {
-- 
2.45.1

