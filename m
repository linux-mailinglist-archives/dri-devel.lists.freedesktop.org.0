Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C23B244331
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 04:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB2D6EAD8;
	Fri, 14 Aug 2020 02:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E86E5AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 02:40:16 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so3701376pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 19:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FfCA4dnLF2aUKogMdWt8ahUfqtcRw0jyI5nf0jp22kU=;
 b=dQ/qlT5baV5ZK6Ptwx7iaLxJPWBNNRa+XzStSmzxc68nwVXTrg/qOn9kumGXGVX/cQ
 XRYYqKjcn9u9LKYwNQHngl/74XCUMQcFDz6v5NyAUM7RiqaqO4L32cN93/MZeKjX+mZN
 Yj0Smi7go/mCWppI7BCpD+3OfOibjE0w9IziQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FfCA4dnLF2aUKogMdWt8ahUfqtcRw0jyI5nf0jp22kU=;
 b=rKLUjYlJRMX7m2uApKdZ9as7huYxRMg3qS6yw6EI7j46D5nBN+ROGq2160JzpH7xV5
 DBd4PlIulG2DIKTnqW43RlSEfxiUApHwcDRAguu/dHjTYO864ixddgArJMdWuDCDw52F
 aCuI8+eexcZl4G2xcJG9bSUAIy79fc4xaQerWO7ZzWQhLUQydLJwMhnI+SH2/frYNZxP
 lQoRhRBuiCGbqIFHy2pxfGfDSVMHxMQcpaW1LYsif9VvBd7NonC1zRpS8NeMcJ5pLgw0
 U1GyxYV2yKXqzQgtTI3qEPbenS5aQTrxrSVF0AvRY4ExeWddeMznhuuuIEbUMs4cMIpO
 /tGg==
X-Gm-Message-State: AOAM532ja8FDbQ7VpdCBSLTqf28zm8lUmIthWA5i61y8r2Eb8DdWvh+f
 NnMQ/hMfbiHiOsNipUZGwS17rizhEp2AQQ==
X-Google-Smtp-Source: ABdhPJx2lbbZwAtl6H3Y4Raxv6tgLm3/LpGCuqjLXkqe5oFtxWpuFa6/mJ/GQBMpokGUzVu7lrqa/Q==
X-Received: by 2002:a17:90b:2092:: with SMTP id
 hb18mr552051pjb.118.1597372816178; 
 Thu, 13 Aug 2020 19:40:16 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m26sm7103539pfe.184.2020.08.13.19.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 13 Aug 2020 19:40:15 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH 11/24] virtio-gpu api: host visible feature
Date: Thu, 13 Aug 2020 19:39:47 -0700
Message-Id: <20200814024000.2485-12-gurchetansingh@chromium.org>
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

This patch adds a new virtgpu feature that allows directly
mapping host allocated resources.

This is based on virtio shared memory regions, which allows
querying for memory regions using PCI transport. Each shared
memory region has an associated "shmid", the meaning of which
is device specific.

For virtio-gpu, we can define the shared memory region with id
VIRTIO_GPU_SHM_ID_HOST_VISIBLE to be the "host visible memory
region".

The presence of the host visible memory region means the following
hypercalls are supported:

1) VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB

This hypercall tells the host to inject the host resource's
mapping in an offset into virtio-gpu's PCI address space.
This is typically done via KVM_SET_USER_MEMORY_REGION on Linux
hosts.

On success, VIRTIO_GPU_RESP_OK_MAP_INFO is returned, which
specifies the host buffer's caching type and possibly in the
future performance hints about the buffer..

2) VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB

This hypercall tells the host to remove the host resource's
mapping from the guest VM.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Co-developed-by: Gurchetan Singh <gurchetansingh@chromium.org>
Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 include/uapi/drm/virtgpu_drm.h  |  1 +
 include/uapi/linux/virtio_gpu.h | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index bb224f604c9e..e1b1518f9acc 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -73,6 +73,7 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
 #define VIRTGPU_PARAM_CAPSET_QUERY_FIX 2 /* do we have the capset fix */
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
+#define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index a27ea3215d67..fee69725964c 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -88,6 +88,8 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_CMD_TRANSFER_TO_HOST_3D,
 	VIRTIO_GPU_CMD_TRANSFER_FROM_HOST_3D,
 	VIRTIO_GPU_CMD_SUBMIT_3D,
+	VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB,
+	VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB,
 
 	/* cursor commands */
 	VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -100,6 +102,7 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_OK_CAPSET,
 	VIRTIO_GPU_RESP_OK_EDID,
 	VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
+	VIRTIO_GPU_RESP_OK_MAP_INFO,
 
 	/* error responses */
 	VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -110,6 +113,11 @@ enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER,
 };
 
+enum virtio_gpu_shm_id {
+	VIRTIO_GPU_SHM_ID_UNDEFINED = 0,
+	VIRTIO_GPU_SHM_ID_HOST_VISIBLE = 1
+};
+
 #define VIRTIO_GPU_FLAG_FENCE (1 << 0)
 
 struct virtio_gpu_ctrl_hdr {
@@ -402,4 +410,31 @@ struct virtio_gpu_set_scanout_blob {
 	__le32 offsets[4];
 };
 
+/* VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB */
+struct virtio_gpu_resource_map_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+	__le64 offset;
+};
+
+/* VIRTIO_GPU_RESP_OK_MAP_INFO */
+#define VIRTIO_GPU_MAP_CACHE_MASK     0x0f
+#define VIRTIO_GPU_MAP_CACHE_NONE     0x00
+#define VIRTIO_GPU_MAP_CACHE_CACHED   0x01
+#define VIRTIO_GPU_MAP_CACHE_UNCACHED 0x02
+#define VIRTIO_GPU_MAP_CACHE_WC       0x03
+struct virtio_gpu_resp_map_info {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__u32 map_info;
+	__u32 padding;
+};
+
+/* VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB */
+struct virtio_gpu_resource_unmap_blob {
+	struct virtio_gpu_ctrl_hdr hdr;
+	__le32 resource_id;
+	__le32 padding;
+};
+
 #endif
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
