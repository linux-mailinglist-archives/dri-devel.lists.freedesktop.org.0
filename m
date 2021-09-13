Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB2240A1B7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 01:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996056E2DC;
	Mon, 13 Sep 2021 23:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 944296E2D5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 23:48:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285516275"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="285516275"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="543534433"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 16:48:38 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [RFC v1 5/6] drm/virtio: Prepare set_scanout_blob to accept a fence
Date: Mon, 13 Sep 2021 16:35:28 -0700
Message-Id: <20210913233529.3194401-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
References: <20210913233529.3194401-1-vivek.kasireddy@intel.com>
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

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 4 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 9126bca47c6d..c219ebde27c3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -406,7 +406,9 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				struct virtio_gpu_object *bo,
 				struct drm_framebuffer *fb,
 				uint32_t width, uint32_t height,
-				uint32_t x, uint32_t y);
+				uint32_t x, uint32_t y,
+				struct virtio_gpu_object_array *objs,
+				struct virtio_gpu_fence *fence);
 
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 2e71e91278b4..760e8b8eefb6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1280,7 +1280,9 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				     struct virtio_gpu_object *bo,
 				     struct drm_framebuffer *fb,
 				     uint32_t width, uint32_t height,
-				     uint32_t x, uint32_t y)
+				     uint32_t x, uint32_t y,
+				     struct virtio_gpu_object_array *objs,
+				     struct virtio_gpu_fence *fence)
 {
 	uint32_t i;
 	struct virtio_gpu_set_scanout_blob *cmd_p;
@@ -1289,6 +1291,7 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_SET_SCANOUT_BLOB);
 	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
@@ -1308,5 +1311,5 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
-- 
2.30.2

