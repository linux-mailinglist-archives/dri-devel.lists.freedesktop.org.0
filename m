Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A009037A277
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 10:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02056E9FC;
	Tue, 11 May 2021 08:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98176E9FC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 08:48:22 +0000 (UTC)
IronPort-SDR: I0RZOucb51nM4MgznsWeJnBLvyYODiIPkxNLVO0pHfiaIk2nYvfZMlSRt9EzbOefPsaeCKQpGW
 Eor6zUgt1Psg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199458708"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="199458708"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:22 -0700
IronPort-SDR: l8J+wcYouA9rH2QI4o3oUe9Pwa0h0mM9us5dL3gdymsdrMy3MZqKEDcweg8zZXvFbdqQg/20B/
 0O5Hylk9NRvQ==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="541571689"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:48:21 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: Add VIRTIO_GPU_CMD_WAIT_FLUSH cmd
Date: Tue, 11 May 2021 01:36:09 -0700
Message-Id: <20210511083610.367541-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511083610.367541-1-vivek.kasireddy@intel.com>
References: <20210511083610.367541-1-vivek.kasireddy@intel.com>
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This implements the hypercall interface for the wait_flush
command.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h |  4 ++++
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d9dbc4f258f3..f77d196ccc8f 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -403,6 +403,10 @@ virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 				struct drm_framebuffer *fb,
 				uint32_t width, uint32_t height,
 				uint32_t x, uint32_t y);
+void virtio_gpu_cmd_wait_flush(struct virtio_gpu_device *vgdev,
+			       struct virtio_gpu_object_array *objs,
+			       struct virtio_gpu_fence *fence);
+
 
 /* virtgpu_display.c */
 int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cf84d382dd41..0042a143e71e 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -1307,3 +1307,20 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 
 	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
 }
+
+void virtio_gpu_cmd_wait_flush(struct virtio_gpu_device *vgdev,
+			       struct virtio_gpu_object_array *objs,
+			       struct virtio_gpu_fence *fence)
+{
+	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(objs->objs[0]);
+	struct virtio_gpu_wait_flush *cmd_p;
+	struct virtio_gpu_vbuffer *vbuf;
+
+	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
+	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
+
+	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_WAIT_FLUSH);
+	cmd_p->resource_id = cpu_to_le32(bo->hw_res_handle);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
+}
-- 
2.30.2

