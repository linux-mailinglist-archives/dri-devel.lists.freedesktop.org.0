Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD56379C57
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 03:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2653E6E9A0;
	Tue, 11 May 2021 01:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96546E992
 for <dri-devel@lists.freedesktop.org>; Tue, 11 May 2021 01:57:05 +0000 (UTC)
IronPort-SDR: 15Fweannt0ZE9I94ZQWDgQ6cLNfAmmm1n9fg0adMkHzXMCaQWU9VHMzAiwzFfr124T6pgWG4lY
 15KofwHmBKYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196239159"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="196239159"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 18:57:03 -0700
IronPort-SDR: 1k4AxCHNciJMtr5uW65KOB5o6FZvQctQwYoW7utpCd5nm8EqV+CAsy2HM/FwAqJPuuk6eHAVoo
 0oPRk4shB78w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="434067424"
Received: from test.bj.intel.com ([10.238.158.204])
 by fmsmga008.fm.intel.com with ESMTP; 10 May 2021 18:57:01 -0700
From: Tina Zhang <tina.zhang@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 3/3] drm/virtio: Include modifier as part of
 set_scanout_blob
Date: Mon, 10 May 2021 21:49:40 -0400
Message-Id: <20210511014940.2067715-4-tina.zhang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210511014940.2067715-1-tina.zhang@intel.com>
References: <20210511014940.2067715-1-tina.zhang@intel.com>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>,
 Tina Zhang <tina.zhang@intel.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

With new use-cases coming up that include virtio-gpu:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/9592

the FB associated with a Guest blob may have a modifier. Therefore,
this modifier info needs to be included as part of set_scanout_blob.

v2: (Tina)
* Use drm_plane_add_modifiers() to set allow_fb_modifiers.
* Append the modifier field to the virtio_gpu_set_scanout_blob struct.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Tina Zhang <tina.zhang@intel.com>
---
 drivers/gpu/drm/virtio/virtgpu_vq.c | 3 ++-
 include/uapi/linux/virtio_gpu.h     | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 7a6d6628e167..351befed105a 100644
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
@@ -1336,6 +1336,7 @@ void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
 	cmd_p->format = cpu_to_le32(format);
 	cmd_p->width  = cpu_to_le32(fb->width);
 	cmd_p->height = cpu_to_le32(fb->height);
+	cmd_p->modifier = cpu_to_le64(fb->modifier);
 
 	for (i = 0; i < 4; i++) {
 		cmd_p->strides[i] = cpu_to_le32(fb->pitches[i]);
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f853d7672175..6d08481ac4ef 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -420,6 +420,7 @@ struct virtio_gpu_set_scanout_blob {
 	__le32 padding;
 	__le32 strides[4];
 	__le32 offsets[4];
+	__le64 modifier;
 };
 
 /* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
-- 
2.25.1

