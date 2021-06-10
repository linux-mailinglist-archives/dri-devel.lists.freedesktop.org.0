Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA59F3A37FC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7666EE19;
	Thu, 10 Jun 2021 23:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698226EE22
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 23:37:30 +0000 (UTC)
IronPort-SDR: F3/U7/hvrMzpHfi0vBTfCJyo7T4PwjuZ7TjqVfRO/wGeGZdMWJBQ8Qc6anejMlklchw4yqRa3m
 T8t+WJHmV/JA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291059220"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="291059220"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
IronPort-SDR: WmhaHEmslnnZaezkEZiheZD/sYcZSwbkXeAv6T2ACvGA+hsWzgTOVoLQxl8xgi3+sF6GSK6SH/
 R+Q1VYogddDA==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="414275082"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:37:29 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/3] drm/virtio: Prepare resource_flush to accept a fence
Date: Thu, 10 Jun 2021 16:24:55 -0700
Message-Id: <20210610232456.671905-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610232456.671905-1-vivek.kasireddy@intel.com>
References: <20210610232456.671905-1-vivek.kasireddy@intel.com>
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

A fence will be added to resource_flush for resources that
are guest blobs.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h | 4 +++-
 drivers/gpu/drm/virtio/virtgpu_vq.c  | 7 +++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index d9dbc4f258f3..d4e610a44e12 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -315,7 +315,9 @@ void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
-				   uint32_t width, uint32_t height);
+				   uint32_t width, uint32_t height,
+				   struct virtio_gpu_object_array *objs,
+				   struct virtio_gpu_fence *fence);
 void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 				uint32_t scanout_id, uint32_t resource_id,
 				uint32_t width, uint32_t height,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cf84d382dd41..2e71e91278b4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -576,13 +576,16 @@ void virtio_gpu_cmd_set_scanout(struct virtio_gpu_device *vgdev,
 void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 				   uint32_t resource_id,
 				   uint32_t x, uint32_t y,
-				   uint32_t width, uint32_t height)
+				   uint32_t width, uint32_t height,
+				   struct virtio_gpu_object_array *objs,
+				   struct virtio_gpu_fence *fence)
 {
 	struct virtio_gpu_resource_flush *cmd_p;
 	struct virtio_gpu_vbuffer *vbuf;
 
 	cmd_p = virtio_gpu_alloc_cmd(vgdev, &vbuf, sizeof(*cmd_p));
 	memset(cmd_p, 0, sizeof(*cmd_p));
+	vbuf->objs = objs;
 
 	cmd_p->hdr.type = cpu_to_le32(VIRTIO_GPU_CMD_RESOURCE_FLUSH);
 	cmd_p->resource_id = cpu_to_le32(resource_id);
@@ -591,7 +594,7 @@ void virtio_gpu_cmd_resource_flush(struct virtio_gpu_device *vgdev,
 	cmd_p->r.x = cpu_to_le32(x);
 	cmd_p->r.y = cpu_to_le32(y);
 
-	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
+	virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, fence);
 }
 
 void virtio_gpu_cmd_transfer_to_host_2d(struct virtio_gpu_device *vgdev,
-- 
2.30.2

