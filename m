Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8C34F743
	for <lists+dri-devel@lfdr.de>; Wed, 31 Mar 2021 05:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2416E0F7;
	Wed, 31 Mar 2021 03:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3ED6E0F7
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Mar 2021 03:15:34 +0000 (UTC)
IronPort-SDR: RtTyGiqB69j/dzo3n2CwOwdSEb8ZkzcJovYrlqiPFytyjNxDhx4w2zHw1goJdahFV+V38eXXky
 wK1z5AceBU2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="171315583"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="171315583"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:15:34 -0700
IronPort-SDR: Por5uRl+l12G5FALom/SSdl6TtU4RIOZsBBg/FIXNas5c6A6mQP2MsIXsbn55jkriCU1HCAvFI
 ADDMQQmPPQNA==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="455292437"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:15:33 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/virtio: Include modifier as part of set_scanout_blob
Date: Tue, 30 Mar 2021 20:04:39 -0700
Message-Id: <20210331030439.1564032-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
References: <20210331030439.1564032-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With new use-cases coming up that include virtio-gpu:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592

the FB associated with a Guest blob may have a modifier. Therefore,
this modifier info needs to be included as part of set_scanout_blob.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_display.c | 3 +++
 drivers/gpu/drm/virtio/virtgpu_vq.c      | 3 ++-
 include/uapi/linux/virtio_gpu.h          | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
index a6caebd4a0dd..e2e7e6c5cb91 100644
--- a/drivers/gpu/drm/virtio/virtgpu_display.c
+++ b/drivers/gpu/drm/virtio/virtgpu_display.c
@@ -344,6 +344,9 @@ int virtio_gpu_modeset_init(struct virtio_gpu_device *vgdev)
 	vgdev->ddev->mode_config.max_width = XRES_MAX;
 	vgdev->ddev->mode_config.max_height = YRES_MAX;
 
+	if (vgdev->has_resource_blob)
+		vgdev->ddev->mode_config.allow_fb_modifiers = true;
+
 	for (i = 0 ; i < vgdev->num_scanouts; ++i)
 		vgdev_output_init(vgdev, i);
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index cf84d382dd41..462f1beb9c11 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -34,7 +34,7 @@
 #include "virtgpu_drv.h"
 #include "virtgpu_trace.h"
 
-#define MAX_INLINE_CMD_SIZE   96
+#define MAX_INLINE_CMD_SIZE   112
 #define MAX_INLINE_RESP_SIZE  24
 #define VBUFFER_SIZE          (sizeof(struct virtio_gpu_vbuffer) \
 			       + MAX_INLINE_CMD_SIZE		 \
@@ -1294,6 +1294,7 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 	cmd_p->format = cpu_to_le32(format);
 	cmd_p->width  = cpu_to_le32(fb->width);
 	cmd_p->height = cpu_to_le32(fb->height);
+	cmd_p->modifier = cpu_to_le64(fb->modifier);
 
 	for (i = 0; i < 4; i++) {
 		cmd_p->strides[i] = cpu_to_le32(fb->pitches[i]);
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 97523a95781d..c6424d769e62 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -409,6 +409,7 @@ struct virtio_gpu_set_scanout_blob {
 	__le32 width;
 	__le32 height;
 	__le32 format;
+	__le64 modifier;
 	__le32 padding;
 	__le32 strides[4];
 	__le32 offsets[4];
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
