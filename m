Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C541F276518
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3235C6EA21;
	Thu, 24 Sep 2020 00:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197E46EA1A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:20 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id r19so686572pls.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RCQ+EYT2MzbQv/dr3N4s0E8HTwBjP5d0FY0g8w6KX0M=;
 b=Yh1zR0gjXv0GjRvZeDLiifp1UwkQNeOPR3BYGfAjXk0Cs+MOkn4Ps+xUR07Xlx/1ZX
 /vvrW6MD4zwzLqZXTITMbZiPFQIOaldMpfqQh4xax0HHRVR/lqjgXYctxoCI0C+lZAlH
 QQ6x03yA8kGXS1JdMrIiEeZIn22eq+zm4PbJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RCQ+EYT2MzbQv/dr3N4s0E8HTwBjP5d0FY0g8w6KX0M=;
 b=RJ9Lq4f0fnuFxUB8zMxDLMqyaXOeSKE5Zxx1qJkoDcFxHfxVy1uAmKD1gzpWvGu2b+
 W+cOPIPzP8FIpa4hGYK4PSc8PY37X+h0A9pPmk98vggMKpAkUoNFmfsmdboOB52QHyaY
 5EPfStfywigF9Bpkn1IidZB94GJpY60znwAq41nbMq4r9tlcvDsIJpoCiLS/ePvMXtAj
 n+0Zz2d++zbCmBEkPiQpr2R2NVyREucyW8chvnSnEB07pf50mlIWrrPsA4vZQDdayzd4
 Isrc1Qa1v8vig1W/rNjsNxswVuF8dxN7ntCS/B9sGLOnFF1/+9Yp2NqqDg7mIBMndLxz
 tA9w==
X-Gm-Message-State: AOAM532IQt48M08t8gJiLBIZv34g9hE+RYuBeO0Etplm/pXQ+H3uTYGA
 jbLLu1FcDnBJIMquf+b+pmSoiVBoTsfI2Q==
X-Google-Smtp-Source: ABdhPJywgAU06xARCaE20LKD96lT3RM2T4Qq7720moTiT1yKImfPx7LA2rDrnfIhNDoMQnXp3/B9uA==
X-Received: by 2002:a17:902:6903:b029:d2:2503:e5c1 with SMTP id
 j3-20020a1709026903b02900d22503e5c1mr2178157plk.60.1600907539304; 
 Wed, 23 Sep 2020 17:32:19 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:18 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 03/19] virtio-gpu api: blob resources
Date: Wed, 23 Sep 2020 17:31:58 -0700
Message-Id: <20200924003214.662-3-gurchetansingh@chromium.org>
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

A blob resource is a container for:
   - VIRTIO_GPU_BLOB_MEM_GUEST: a guest memory allocation
     (referred to as a "guest-only blob resource")

   - VIRTIO_GPU_BLOB_MEM_HOST3D: a host3d memory allocation
     (referred to as a "host-only blob resource")

   - VIRTIO_GPU_BLOB_MEM_HOST3D_GUEST: a guest + host3d memory allocation
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
VIRTIO_GPU_BLOB_MEM_GUEST.

If 3D is supported, the virtio-gpu resource is created from the
context local object identified by the `blob_id`. The actual host
allocation done by the CMD_SUBMIT_3D.

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
Link: https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/374
---
 include/uapi/linux/virtio_gpu.h | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index 747a5c5cc4e60..4ddf2fe342ed0 100644
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
