Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A2C24431F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB35E6EAA6;
	Fri, 14 Aug 2020 02:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDAB6E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:15 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id kr4so3719560pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YIltU3l7e4UL301xBk0Kobxm+FNpTAMxl+LW/1cXus4=;
 b=ZQIKGrfwWkaD9j/GWgOPiP21V3twn2FTWWAuDdO+Djr8frT8HrEjMVjPiOgzO+MRvn
 vBbWMLT6bRA63O8683gCX3oyN3gM5iCKN9Qg19LDy+pIt5gIPdXXeg48eBslQiHtO/oN
 y8A/zkPJpcDRpgAl700c5WDEQMaw03fDyusvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YIltU3l7e4UL301xBk0Kobxm+FNpTAMxl+LW/1cXus4=;
 b=go4/DrAMoaHdrKk0tGVPMCRRIZe9w4jptbG6whf5iQDaCtr44+/2nx+nQwgN0jX/9Y
 5feXxLJC3eFg+MbRCOWfgfrQDN97vWOmQ36P9dOK7L09BIgCEsgVhQZDvyX5Ig/MBoD/
 Y4Db2zWi+klBrVmrdZO4aI2v3Cs1dRQBhIOm3nfKehrJRz5UwmP+TWpsxyxw6/QByiRj
 eZYRF3bgJK8/2SfcS4QWX9Np/Y5K4d9LRIZNukyyyLoKgkhwukVEF/ztrFkY9CcmM9iE
 IZYaAqFRZQUYIG4NaQ/YP5JQuMUSZd3MoKdxwx8rqfaCQr8I/5i4ja77N76bTZq25mn3
 Oxsg==
X-Gm-Message-State: AOAM531j5+tFnTRe6eufPT4P64ZYMqYjthnhZhx/pJPkvg4Fd3vUQqZC
 y7FZTiXkzpkUWH6EuVD2csV/xDsRz5x1JQ==
X-Google-Smtp-Source: ABdhPJywG7dN4rvfMSX1F7xp1/F/lpEZY+brH/MguHJ0tS+nAmeMmTiAO7otAcwCe6Ois7K1PociXg==
X-Received: by 2002:a17:90a:b386:: with SMTP id e6mr517262pjr.57.1597372814968; 
 Thu, 13 Aug 2020 19:40:14 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:14 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 10/24] virtio-gpu api: blob resources
Date: Thu, 13 Aug 2020 19:39:46 -0700
Message-Id: <20200814024000.2485-11-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200814024000.2485-1-gurchetansingh@chromium.org>
References: <20200814024000.2485-1-gurchetansingh@chromium.org>
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
Cc: sebastien.boeuf@intel.com, kraxel@redhat.com, vgoyal@redhat.com,
 mst@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Gerd Hoffmann <kraxel@redhat.com>

A blob resource is a container for:
   - VIRTGPU_BLOB_MEM_GUEST: a guest memory allocation
     (referred to as a "guest-only blob resource")

   - VIRTGPU_BLOB_MEM_HOST3D: a host3d memory allocation
     (referred to as a "host-only blob resource")

   - VIRTGPU_BLOB_MEM_HOST3D_GUEST: a guest + host3d memory allocation
     (referred to as a "default blob resource").

The memory properties of the blob resource must be described by
`blob_mem`.

For default and guest only blob resources set, `nents` guest system
pages are assigned to the resource.  For default blob resources,
these guest pages are used for transfer operations. Attach/detach is
also possible to allow swap-in/swap-out, but isn't required since it
may not be applicable to future blob mem types
(shared guest/guest vram).

Host allocations depend on whether the 3D is supported. If 3D is not
supported, the only valid field for `blob_mem` is
VIRTGPU_BLOB_MEM_GUEST.

If 3D is supported, the virtio-gpu resource is created from the
context local object identified by the `blob_id`. The actual host
allocation done by the EXECBUFFER ioctl or for convenience the
`cmd` field in the RESOURCE_CREATE_BLOB ioctl.

Userspace must specify if the blob resource is intended to be used
for userspace mapping, sharing between virtio-gpu contexts and/or
sharing between virtio devices. This is done via `blob_flags`.

For 3D hosts, both VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D and
VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D may be used to update
the host resource. There is no restriction on the image/buffer
view the guest/host userspace has on the blob resource.

VIRTIO_GPU_CMD_SET_SCANOUT_BLOB / VIRTIO_GPU_CMD_RESOURCE_FLUSH may
be used with blob resources as well.  The modifier is intentionally
left out of SCANOUT_BLOB, and auxilary blobs are also left out
as a simplification.

The use case for blob resources is zero-copy, needed for coherent
memory in virglrenderer. Host only blob resources are not mappable
without the feature described in the next patch, but are shareable.

Future work:
   - Emulated coherent `blob_mem` type for QEMU/vhost-user
   - A `blob_mem` type for guest-only resources imported in
     cache-coherent FOSS GPU/display drivers.
   - Display integration involving the blob model using seamless
     Wayland windows.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Chia-I Wu <olvaffe@gmail.com>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 include/uapi/drm/virtgpu_drm.h  | 37 +++++++++++++++++++++++++++-
 include/uapi/linux/virtio_gpu.h | 43 +++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index f06a789f34cd..bb224f604c9e 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -46,6 +46,7 @@ extern "C" {
 #define DRM_VIRTGPU_TRANSFER_TO_HOST 0x07
 #define DRM_VIRTGPU_WAIT     0x08
 #define DRM_VIRTGPU_GET_CAPS  0x09
+#define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
@@ -71,6 +72,7 @@ struct drm_virtgpu_execbuffer {
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
+#define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -100,7 +102,7 @@ struct drm_virtgpu_resource_info {
 	__u32 bo_handle;
 	__u32 res_handle;
 	__u32 size;
-	__u32 stride;
+	__u32 blob_mem;
 };
 
 struct drm_virtgpu_3d_box {
@@ -117,6 +119,8 @@ struct drm_virtgpu_3d_transfer_to_host {
 	struct drm_virtgpu_3d_box box;
 	__u32 level;
 	__u32 offset;
+	__u32 stride;
+	__u32 layer_stride;
 };
 
 struct drm_virtgpu_3d_transfer_from_host {
@@ -124,6 +128,8 @@ struct drm_virtgpu_3d_transfer_from_host {
 	struct drm_virtgpu_3d_box box;
 	__u32 level;
 	__u32 offset;
+	__u32 stride;
+	__u32 layer_stride;
 };
 
 #define VIRTGPU_WAIT_NOWAIT 1 /* like it */
@@ -140,6 +146,31 @@ struct drm_virtgpu_get_caps {
 	__u32 pad;
 };
 
+struct drm_virtgpu_resource_create_blob {
+#define VIRTGPU_BLOB_MEM_GUEST             0x0001
+#define VIRTGPU_BLOB_MEM_HOST3D            0x0002
+#define VIRTGPU_BLOB_MEM_HOST3D_GUEST      0x0003
+
+#define VIRTGPU_BLOB_FLAG_USE_MAPPABLE     0x0001
+#define VIRTGPU_BLOB_FLAG_USE_SHAREABLE    0x0002
+#define VIRTGPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+	/* zero is invalid blob_mem */
+	__u32 blob_mem;
+	__u32 blob_flags;
+	__u32 bo_handle;
+	__u32 res_handle;
+	__u64 size;
+
+	/*
+	 * for 3D contexts with VIRTGPU_BLOB_MEM_HOST3D_GUEST and
+	 * VIRTGPU_BLOB_MEM_HOST3D otherwise, must be zero.
+	 */
+	__u32 pad;
+	__u32 cmd_size;
+	__u64 cmd;
+	__u64 blob_id;
+};
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -175,6 +206,10 @@ struct drm_virtgpu_get_caps {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_GET_CAPS, \
 	struct drm_virtgpu_get_caps)
 
+#define DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB				\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_CREATE_BLOB,	\
+		struct drm_virtgpu_resource_create_blob)
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 9721d58b4d58..a27ea3215d67 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -55,6 +55,11 @@
  */
 #define VIRTIO_GPU_F_RESOURCE_UUID       2
 
+/*
+ * VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB
+ */
+#define VIRTIO_GPU_F_RESOURCE_BLOB       3
+
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
 
@@ -71,6 +76,8 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_GET_CAPSET,
 	VIRTIO_GPU_CMD_GET_EDID,
 	VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
+	VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB,
+	VIRTIO_GPU_CMD_SET_SCANOUT_BLOB,
 
 	/* 3d commands */
 	VIRTIO_GPU_CMD_CTX_CREATE = 0x0200,
@@ -359,4 +366,40 @@ struct virtio_gpu_resp_resource_uuid {
 	__u8 uuid[16];
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB */
+struct virtio_gpu_resource_create_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+#define VIRTIO_GPU_BLOB_MEM_GUEST             0x0001
+#define VIRTIO_GPU_BLOB_MEM_HOST3D            0x0002
+#define VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST      0x0003
+
+#define VIRTIO_GPU_BLOB_FLAG_USE_MAPPABLE     0x0001
+#define VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE    0x0002
+#define VIRTIO_GPU_BLOB_FLAG_USE_CROSS_DEVICE 0x0004
+	/* zero is invalid blob mem */
+	__le32 blob_mem;
+	__le32 blob_flags;
+	__le64 blob_id;
+	__le64 size;
+	__le32 nr_entries;
+	/*
+	 * sizeof(nr_entries * virtio_gpu_mem_entry) bytes follow
+	 */
+};
+
+/* VIRTIO_GPU_CMD_SET_SCANOUT_BLOB */
+struct virtio_gpu_set_scanout_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	struct virtio_gpu_rect r;
+	__le32 scanout_id;
+	__le32 resource_id;
+	__le32 width;
+	__le32 height;
+	__le32 format;
+	__le32 padding;
+	__le32 strides[4];
+	__le32 offsets[4];
+};
+
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
