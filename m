Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB5B276519
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 02:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499AE6EA23;
	Thu, 24 Sep 2020 00:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068226EA1D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 00:32:22 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c3so671096plz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CgElxpOI4YrUTvxXMX4kkD1juWhcMpMUDyjmJnDZD6s=;
 b=iSnlWPnXUZxAWhLrqhrCHrs+xPirfwaRZNhr0GggrPkGO7b2DHm2GBcs4+D6g5A/8M
 70FWOg2Ysd4SHOdtswQSoLNQ7bN4jEhyPcRJYVrr53vrK6AVazmBlcdYFYgIzbHpi+RK
 HJe3oBS1s3zNQx3IhxoFLQvOIChmmzFR2+7x8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CgElxpOI4YrUTvxXMX4kkD1juWhcMpMUDyjmJnDZD6s=;
 b=ME5TndwHdeXkz+dnwpG/6MK7fMnRP2iDmzKtF+R6j9yRtD4LN7yWG4uVBSHieifB+a
 7hNJPo4HCMdfzCPK8jY9MRrSC6rbkD1O7/fOf3DWcDDn8HZN+BLo8Yv5osB7UzV0fQnt
 RASffiVZJrIc07Tq3O6H/+2K5F8OBnrGSnouz89OFAmKoMmXdTMKlo6uQ/IzRSmBmOmG
 UZN595JyIhOW2asEciIhGVPJX3grwCg6nB2hKJvZk932OJaxiX3DbD7adTr8zRrb8Ru+
 wH/ChAwRYTk0eST5E9rxfjFZrCMqDRYOnqjv2r/MwkoMal9dy3MBdFUEp1m/vNDUZmit
 0Q/w==
X-Gm-Message-State: AOAM532+qO+prB/wjPG+2850viin6AIIxwejkBSxj2pS6uEdlz5Pr5Fw
 4Iu8LoBFPQJlnISdcjymTMqxQq235+HiyQ==
X-Google-Smtp-Source: ABdhPJxIf/HzZIxpVy5snJZPpumI0ceDwjgKrAHB0tskKQ2EmOd44cfVQZQTKI/qcd19WFSGl0SBdQ==
X-Received: by 2002:a17:902:c692:b029:d0:90a3:24f4 with SMTP id
 r18-20020a170902c692b02900d090a324f4mr2142038plx.12.1600907541311; 
 Wed, 23 Sep 2020 17:32:21 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id 64sm735312pfd.7.2020.09.23.17.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 17:32:20 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 05/19] drm/virtgpu api: blob resources
Date: Wed, 23 Sep 2020 17:32:00 -0700
Message-Id: <20200924003214.662-5-gurchetansingh@chromium.org>
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

This makes blob resources available to guest userspace. They are needed
for GL4.5, Vulkan and zero-copy virtio-gpu.

For Mesa, blob resources have been tested with Piglit's ARB_buffer_storage
tests and apitraces.  Apitraces of GL4.5 games show we're between 70%
to 80% of host performance on Iris, based on a apitrace of a 2013 GL4.5
game:

11.204 FPS (guest)
15.947 FPS (host)

This is still better than the status quo, when said game was unplayable
with Virgl due to an inefficient GL4.3 fallback.  But there's still room
for improvement if we want to match HW-assisted virtualization.

For Vulkan, blob resources have been tested with dEQP.vk.memory* and
running Vulkan applications in production with the "Cuttlefish" virtual
Android device.  This has been done with Lingfeng Yang's "gfxstream"
Vulkan implementation, which virtualizes Vulkan across many Google
products.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Acked-by: Chia-I Wu <olvaffe@gmail.com>
Acked-by: Lingfeng Yang <lfy@google.com>
Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4821
Link: https://android-review.googlesource.com/c/device/generic/goldfish-opengl/+/1283761
---
 include/uapi/drm/virtgpu_drm.h | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index f06a789f34cd9..bb224f604c9e3 100644
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
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
