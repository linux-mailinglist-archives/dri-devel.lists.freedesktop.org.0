Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF1276513
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEAB6EA1B;
	Thu, 24 Sep 2020 00:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDECD6EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:20 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id d6so739186pfn.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XSX/urUFLsiFC1lKYCAeObeY4sFWjg0RKAvq3ynqLts=;
 b=j/udGvnVqj8KCOFOER/N7xuiHQS38nl+C1oayfYuIwMYdqwO3jcbkBydPU2zZuFg0q
 4rk744yvBegVR94F+AS6sfvJlzYTdtb0sbPrmOEH21bN/IIakyLg1bvYgm6731CcP/7/
 nLmnTPlhj/WUSOBB2C5fyNmk3W+de8xZ8FgEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XSX/urUFLsiFC1lKYCAeObeY4sFWjg0RKAvq3ynqLts=;
 b=DyEHl8g5iftVrqhrztfyzX4TnJXQmshqZczraiphDjlVuYITwlYUGSssD6JSEiiiSS
 XaCzCpDuLCh8o02gAluNIHxrYwIHg4LjrlFclfpIHJ0kgHvexhhIUK1M5revfJeJvoGA
 W39IoXasSEBf5tz/AbdoRYiVKm6QoCRBlfQIxxGyehJr0yfqd+zj5m0K4oS1ivH3bGGK
 OpvdsDN9LBtj6ZhCY0tJrwBuVPU3wnQjrSHd6gvSa7prvEjinuYl8PXXqd/MpM2E2Kek
 s4qx5KTT4MBffi/sjOtpC62jRiYWKuz1MIXkfpSUVg353NvEHLO1ihpiIZWiq/RQrWCb
 BQxg==
X-Gm-Message-State: AOAM531BZz1LAHFdG8ph79SHJd3j9Ji3sYSzNc8qrlDoJXRU4p2tbpBm
 rVU6TtaQZsKRC5qlK6gpE+ayJ0cRQ7/B7w==
X-Google-Smtp-Source: ABdhPJw5mw1zbMHQOrBT1dX8jADBMo+pmAckqKYtMyko0ouQ9+Y/o/OJMYotUKFMO/CzEuRQmw/EFA==
X-Received: by 2002:a63:4f10:: with SMTP id d16mr1836133pgb.152.1600907540306; 
 Wed, 23 Sep 2020 17:32:20 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:19 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/19] virtio-gpu api: host visible feature
Date: Wed, 23 Sep 2020 17:31:59 -0700
Message-Id: <20200924003214.662-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924003214.662-1-gurchetansingh@chromium.org>
References: <20200924003214.662-1-gurchetansingh@chromium.org>
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
Cc: kraxel@redhat.com
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
 include/uapi/linux/virtio_gpu.h | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

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
