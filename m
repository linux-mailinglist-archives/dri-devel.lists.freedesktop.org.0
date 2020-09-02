Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101B25B5A4
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 23:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 065726E5D4;
	Wed,  2 Sep 2020 21:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED106E5D4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 21:09:04 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id g29so341432pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 14:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=koOMJlkjksNE5QnngGHBLz9/JfK5aKB4NZJnUzSB/UE=;
 b=ZjjDkSC0JuKRBNlp32rK+0KCMctVI/IelZddTUutyRK0OlCOD1yTXjWD8UD1nNy3v3
 6sAV746Bm2vsPfUSghRYE8PbIh0cf5SkTkUFpgoCVuk82f1Ke/EUZYLTUDa+Ai6dFh5V
 LqW0cQXhcquFTI5DPrZRoI2BUo11CapRpZhNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=koOMJlkjksNE5QnngGHBLz9/JfK5aKB4NZJnUzSB/UE=;
 b=L7UQJfAuCzoAdzLzCq5v+0drrrWF0wiuxNPWJcbCX31Nz3zYOuwmC7OaJX0zExTdFS
 BvX0NK7AApRIKG2QB8s0u4L8K1zmN9Xj89zKmr6RvAuW3+4gsd9gXNJ1IWc2Ta03Wu35
 HPh6ICHbwvZdkimFY8ANRedLHuJgpIBkgipb5huc6L9JNQhxRew0458XYRK9c0PPgag+
 s/Y0lAyuohooUE0OIV4UQ2S2ZyM+UYdk0YC+z9cUE7pcdUkUME1ZVQ9lYpinbVqDlich
 UIo8ABlPJ+Im90S4kG285V5EFAP1QfrKs9eU6jpvn8FkeOnVu9szDURnxsrNumsDunAC
 8LCw==
X-Gm-Message-State: AOAM530afEWqGWqwTZNpGgIRmztk81Nq0PfowEG6mz6VFIF8ng4Tfy+f
 xLPiHyz/qCM/KuP+Tz/C9onKaT1KlBb3Sg==
X-Google-Smtp-Source: ABdhPJxzaf82Wj+4LBZEd1F53OSaBBoweQYC3znuzsQf4b12SG4VRmPU/1iOFryPUD3UD7LIy5mF8A==
X-Received: by 2002:a63:1548:: with SMTP id 8mr3274900pgv.172.1599080943617;
 Wed, 02 Sep 2020 14:09:03 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m12sm301145pjd.35.2020.09.02.14.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 14:09:02 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Subject: [PATCH v2 10/23] virtio-gpu api: host visible feature
Date: Wed,  2 Sep 2020 14:08:34 -0700
Message-Id: <20200902210847.2689-11-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902210847.2689-1-gurchetansingh@chromium.org>
References: <20200902210847.2689-1-gurchetansingh@chromium.org>
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
index bb224f604c9e3..e1b1518f9acc5 100644
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
index 4ddf2fe342ed0..fa2ae4a1da5f9 100644
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
