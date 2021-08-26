Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D8C3F804E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4836E48B;
	Thu, 26 Aug 2021 02:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC8E6E484
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:01 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 w19-20020a17090aaf9300b00191e6d10a19so1224588pjq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+FOx/ja+/8Q7YupRTEVxvCdJof2XcTH5kOvL8c6EV3w=;
 b=iWtvhqFwUR8aecIVYmRoqNrZLE1jEricJIcUNDM9F5JgYXT8Ok2agezrKp597V1b28
 sWSm8LvE1dlxBqaIRsiRaTlmJt5cpDNJMs4hz03e9sS6aUqkEoJrrzYQzvDdLWZsTXtw
 YEpST0h/bh7n8UfHPJulFoDAt+JD1eXbRKMCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+FOx/ja+/8Q7YupRTEVxvCdJof2XcTH5kOvL8c6EV3w=;
 b=XyPk1q0iM8M8Nv16BGiWsCjBlOFbfbnfiTUddKss7sEtTG1yJ5wUFNkpJzMPay5Zsh
 Gf44ONbYK6oM5eWs2NnZ5KP+0sulJoHhqt+w5HMc5ZBO1FsG7fFJGIfiy/OFtBDAtEOd
 vGuaw5/dyR+i/CKpXneW1xC9QpWtFD5H7Vn/AC7UlDC744hir8EYIXbnfsJL+x5ChVz5
 yI/ES0sanJrfswqyUDWfDBMyMCc05qlwSAAnMpPbNHDSGyPlEwQAi4HELzp53Yy3/uV/
 PzD20unhJf6yq3UB+5vhJtgz0Ikoo1QNxBI/xw7fxKT/iCm+GGsW+qV8IKZBNXdElHyw
 uV4g==
X-Gm-Message-State: AOAM5322f3HxTPD+Z37QOncWKg6Nb+92D0LsHrOPI9XHr0orEyEjGbPE
 LfOtLO4dpPIJqNbTmch+JB/I2LQQbYF3Kw==
X-Google-Smtp-Source: ABdhPJxeUe+nIFQdy5rp8tMidb96smmRs1b/pvbCPPxaNRIEE73X0iBevMpgJAM6z6HRRkXtXozHxQ==
X-Received: by 2002:a17:90a:4e:: with SMTP id 14mr6904965pjb.180.1629943500448; 
 Wed, 25 Aug 2021 19:05:00 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:00 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 02/12] drm/virtgpu api: create context init feature
Date: Wed, 25 Aug 2021 19:04:45 -0700
Message-Id: <20210826020455.1081-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210826020455.1081-1-gurchetansingh@chromium.org>
References: <20210826020455.1081-1-gurchetansingh@chromium.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This change allows creating contexts of depending on set of
context parameters.  The meaning of each of the parameters
is listed below:

1) VIRTGPU_CONTEXT_PARAM_CAPSET_ID

This determines the type of a context based on the capability set
ID.  For example, the current capsets:

VIRTIO_GPU_CAPSET_VIRGL
VIRTIO_GPU_CAPSET_VIRGL2

define a Gallium, TGSI based "virgl" context.  We only need 1 capset
ID per context type, though virgl has two due a bug that has since
been fixed.

The use case is the "gfxstream" rendering library and "venus"
renderer.

gfxstream doesn't do Gallium/TGSI translation and mostly relies on
auto-generated API streaming.  Certain users prefer gfxstream over
virgl for GLES on GLES emulation.  {gfxstream vk}/{venus} are also
required for Vulkan emulation.  The maximum capset ID is 63.

The goal is for guest userspace to choose the optimal context type
depending on the situation/hardware.

2) VIRTGPU_CONTEXT_PARAM_NUM_RINGS

This tells the number of independent command rings that the context
will use.  This value may be zero and is inferred to be zero if
VIRTGPU_CONTEXT_PARAM_NUM_RINGS is not passed in.  This is for backwards
compatibility for virgl, which has one big giant command ring for all
commands.

The maxiumum number of rings is 32.  In practice, multi-queue or
multi-ring submission is used for powerful dGPUs and virtio-gpu
may not be the best option in that case (see PCI passthrough or
rendernode forwarding).

3) VIRTGPU_CONTEXT_PARAM_POLL_RING_IDX_MASK

This is a mask of ring indices for which the DRM fd is pollable.
For example, if VIRTGPU_CONTEXT_PARAM_NUM_RINGS is 2, then the mask
may be:

[ring idx]  |  [1 << ring_idx] | final mask
-------------------------------------------
    0              1                1
    1              2                3

The "Sommelier" guest Wayland proxy uses this to poll for events
from the host compositor.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
Acked-by: Nicholas Verne <nverne@chromium.org>
---
 include/uapi/drm/virtgpu_drm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index b9ec26e9c646..a13e20cc66b4 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -47,12 +47,15 @@ extern "C" {
 #define DRM_VIRTGPU_WAIT     0x08
 #define DRM_VIRTGPU_GET_CAPS  0x09
 #define DRM_VIRTGPU_RESOURCE_CREATE_BLOB 0x0a
+#define DRM_VIRTGPU_CONTEXT_INIT 0x0b
 
 #define VIRTGPU_EXECBUF_FENCE_FD_IN	0x01
 #define VIRTGPU_EXECBUF_FENCE_FD_OUT	0x02
+#define VIRTGPU_EXECBUF_RING_IDX	0x04
 #define VIRTGPU_EXECBUF_FLAGS  (\
 		VIRTGPU_EXECBUF_FENCE_FD_IN |\
 		VIRTGPU_EXECBUF_FENCE_FD_OUT |\
+		VIRTGPU_EXECBUF_RING_IDX |\
 		0)
 
 struct drm_virtgpu_map {
@@ -68,6 +71,8 @@ struct drm_virtgpu_execbuffer {
 	__u64 bo_handles;
 	__u32 num_bo_handles;
 	__s32 fence_fd; /* in/out fence fd (see VIRTGPU_EXECBUF_FENCE_FD_IN/OUT) */
+	__u32 ring_idx; /* command ring index (see VIRTGPU_EXECBUF_RING_IDX) */
+	__u32 pad;
 };
 
 #define VIRTGPU_PARAM_3D_FEATURES 1 /* do we have 3D features in the hw */
@@ -75,6 +80,8 @@ struct drm_virtgpu_execbuffer {
 #define VIRTGPU_PARAM_RESOURCE_BLOB 3 /* DRM_VIRTGPU_RESOURCE_CREATE_BLOB */
 #define VIRTGPU_PARAM_HOST_VISIBLE 4 /* Host blob resources are mappable */
 #define VIRTGPU_PARAM_CROSS_DEVICE 5 /* Cross virtio-device resource sharing  */
+#define VIRTGPU_PARAM_CONTEXT_INIT 6 /* DRM_VIRTGPU_CONTEXT_INIT */
+#define VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs 7 /* Bitmask of supported capability set ids */
 
 struct drm_virtgpu_getparam {
 	__u64 param;
@@ -173,6 +180,22 @@ struct drm_virtgpu_resource_create_blob {
 	__u64 blob_id;
 };
 
+#define VIRTGPU_CONTEXT_PARAM_CAPSET_ID       0x0001
+#define VIRTGPU_CONTEXT_PARAM_NUM_RINGS       0x0002
+#define VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK 0x0003
+struct drm_virtgpu_context_set_param {
+	__u64 param;
+	__u64 value;
+};
+
+struct drm_virtgpu_context_init {
+	__u32 num_params;
+	__u32 pad;
+
+	/* pointer to drm_virtgpu_context_set_param array */
+	__u64 ctx_set_params;
+};
+
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
 
@@ -212,6 +235,10 @@ struct drm_virtgpu_resource_create_blob {
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_RESOURCE_CREATE_BLOB,	\
 		struct drm_virtgpu_resource_create_blob)
 
+#define DRM_IOCTL_VIRTGPU_CONTEXT_INIT					\
+	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_CONTEXT_INIT,		\
+		struct drm_virtgpu_context_init)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.33.0.259.gc128427fd7-goog

