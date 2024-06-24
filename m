Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEADA914349
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 09:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8849310E04F;
	Mon, 24 Jun 2024 07:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8h6duy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A529510E370
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 07:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719213231; x=1750749231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i6+dhbbrjphhBGi9h0aMsedb2chRb6A7k9ogzHFUC1s=;
 b=j8h6duy39GD8uF0Fyn9FEW/G5MhMznFcEmsBrtbDwZF7kKMLgXVVPG+u
 6cSDTRhT2DWNOAROfQ4w8YZm/GI+IJQ5tv4br64FQ/7TmjlPcq75G+WbZ
 c8uaQXejnSfGPJ5tWEUVYkUiARWloEbBZ2Qp80Xa6tYRXL0ToD/qS+vnn
 MXNwtPzhO+KwjaqhDZZXcU2nguEojM9Josn6EC//SjykrPkMuDJN8pIZe
 h8K4dpSY7+VLd+/NxGXSh1eoqe8ls4xN8pQFwTVMcYa/cvN3OjoRSqROb
 8zJINQYsUAfcrAXiC4xQTR+sb5XQSzfduhZJcoN4aZTIV1AzI6iRvqRro g==;
X-CSE-ConnectionGUID: UGDw2XA+RvGCpYoQOOGoaw==
X-CSE-MsgGUID: 5ZWfuCDoTW2mf83NFaFvQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16136016"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="16136016"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:51 -0700
X-CSE-ConnectionGUID: GYInVUPvRceD2AefiuUvuA==
X-CSE-MsgGUID: u08TXQl9Qf2W2lv3xxHSKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="73960057"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.132])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 00:13:50 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 1/5] drm/virtio: Implement
 VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING cmd
Date: Sun, 23 Jun 2024 23:43:30 -0700
Message-ID: <20240624064841.1572452-2-vivek.kasireddy@intel.com>
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

This cmd is useful to let the VMM (i.e, Qemu) know that the backing
store associated with a resource is no longer valid, so that the VMM
can perform any cleanup or unmap operations.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  2 ++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 64c236169db8..961490f59169 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -349,6 +349,8 @@ void virtio_gpu_object_attach(struct virtio_gpu_device *vgdev,
 			      struct virtio_gpu_object *obj,
 			      struct virtio_gpu_mem_entry *ents,
 			      unsigned int nents);
+void virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+			      uint32_t resource_id);
 void virtio_gpu_cursor_ping(struct virtio_gpu_device *vgdev,
 			    struct virtio_gpu_output *output);
 int virtio_gpu_cmd_get_display_info(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 0d3d0d09f39b..1583017ee4d1 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -645,6 +645,21 @@ virtio_gpu_cmd_resource_attach_backing(struct virtio_gpu_device *vgdev,
 	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
+void virtio_gpu_cmd_resource_detach_backing(struct virtio_gpu_device *vgdev,
+					    uint32_t resource_id)
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
+	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+}
+
 static void virtio_gpu_cmd_get_display_info_cb(struct virtio_gpu_device *vgdev,
 					       struct virtio_gpu_vbuffer *vbuf)
 {
-- 
2.45.1

