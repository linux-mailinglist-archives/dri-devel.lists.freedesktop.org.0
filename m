Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDADD40EE9D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D79B6EAB2;
	Fri, 17 Sep 2021 01:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A096EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:54 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id w8so7976988pgf.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IVCapUhDpFUMA54MBycMjJpOacdheXfxff0ObPGgKiA=;
 b=Y2wf0HmJTdIpxXcmPV6Yqw4K8uxQULw2IR3iooqqfV+ZoL6xInsLvSteRnK/aPD4rc
 d1HnefCUNet3uSFfzCjD0t6Xh5XZ3QP6y90HpD5ZhMLqWwHX2lDipc0Q8jXlrmW1xmZh
 SHlJ+FqCJjGS+8TBFW3fkLKQfW7BSTiXYTXdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IVCapUhDpFUMA54MBycMjJpOacdheXfxff0ObPGgKiA=;
 b=sphYobNFrJnSayqhQS2y9aW5H2V+MG5D/+Qb6quyH82AwqF3fKsynSKXF3aT2aE6Ir
 gwIRZLGn9uFS2QoVjN1jV/lbBYY+3bZRLm/3SSlKrS22Vc1AcAXTFdj9R+VBUje6aW4a
 kQGQcy1Ckod/xsG4gcBRnNv4X4Lt6+ZsOi16BG6wXrNh7eynXy2Q1CZICfhZVb5//W8c
 RkHrqJ5bvmS1yJvHKourHMF07ixmfqRqYvzRywczwhlrUh0Lk/Zt94MYrLTQkpi6nQjM
 /vVHWmCq8dgUMCxta9+thzSYJTVxfpn67Nr8FQQxap2FXvkcZMSX/ylMjxSjHJNKLG7U
 huYQ==
X-Gm-Message-State: AOAM531FMA/0/NZ8VWEO6Z8pSLFCQ/H8fiwbQkiBRR6lkCz8gNxjdgvu
 s1a17SUA/XkvEo/781lErS4KrHNu47MF7COA
X-Google-Smtp-Source: ABdhPJwvqz4Nj+M4S/0gFk4vogFmxx9qAux6HWcTQ/bUZrXxbRbhrb9Dkzo0MrALiHAwQneuOeLyFA==
X-Received: by 2002:a63:6d46:: with SMTP id i67mr7401010pgc.308.1631840933974; 
 Thu, 16 Sep 2021 18:08:53 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:53 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 09/12] drm/virtio: implement context init: allocate an
 array of fence contexts
Date: Thu, 16 Sep 2021 18:08:39 -0700
Message-Id: <20210917010842.503-10-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210917010842.503-1-gurchetansingh@chromium.org>
References: <20210917010842.503-1-gurchetansingh@chromium.org>
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

We don't want fences from different 3D contexts (virgl, gfxstream,
venus) to be on the same timeline.  With explicit context creation,
we can specify the number of ring each context wants.

Execbuffer can specify which ring to use.

Note: virgl + Xserver + virtgpu KMS may need implicit sync
support in case a buffer object comes from a different context
type.  This can be added later when the revelant context types
support multiple rings, by waiting on the reservation object
associated with the foreign context's buffer object.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  3 +++
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 34 ++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index a5142d60c2fa..cca9ab505deb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -56,6 +56,7 @@
 #define STATE_ERR 2
 
 #define MAX_CAPSET_ID 63
+#define MAX_RINGS 64
 
 struct virtio_gpu_object_params {
 	unsigned long size;
@@ -263,6 +264,8 @@ struct virtio_gpu_fpriv {
 	uint32_t ctx_id;
 	uint32_t context_init;
 	bool context_created;
+	uint32_t num_rings;
+	uint64_t base_fence_ctx;
 	struct mutex context_lock;
 };
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f51f3393a194..262f79210283 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -99,6 +99,11 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	int in_fence_fd = exbuf->fence_fd;
 	int out_fence_fd = -1;
 	void *buf;
+	uint64_t fence_ctx;
+	uint32_t ring_idx;
+
+	fence_ctx = vgdev->fence_drv.context;
+	ring_idx = 0;
 
 	if (vgdev->has_virgl_3d == false)
 		return -ENOSYS;
@@ -106,6 +111,17 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 	if ((exbuf->flags & ~VIRTGPU_EXECBUF_FLAGS))
 		return -EINVAL;
 
+	if ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX)) {
+		if (exbuf->ring_idx >= vfpriv->num_rings)
+			return -EINVAL;
+
+		if (!vfpriv->base_fence_ctx)
+			return -EINVAL;
+
+		fence_ctx = vfpriv->base_fence_ctx;
+		ring_idx = exbuf->ring_idx;
+	}
+
 	exbuf->fence_fd = -1;
 
 	virtio_gpu_create_context(dev, file);
@@ -173,7 +189,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_memdup;
 	}
 
-	out_fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
+	out_fence = virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
 	if(!out_fence) {
 		ret = -ENOMEM;
 		goto out_unresv;
@@ -691,7 +707,7 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	/* Number of unique parameters supported at this time. */
-	if (num_params > 1)
+	if (num_params > 2)
 		return -EINVAL;
 
 	ctx_set_params = memdup_user(u64_to_user_ptr(args->ctx_set_params),
@@ -731,6 +747,20 @@ static int virtio_gpu_context_init_ioctl(struct drm_device *dev,
 
 			vfpriv->context_init |= value;
 			break;
+		case VIRTGPU_CONTEXT_PARAM_NUM_RINGS:
+			if (vfpriv->base_fence_ctx) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			if (value > MAX_RINGS) {
+				ret = -EINVAL;
+				goto out_unlock;
+			}
+
+			vfpriv->base_fence_ctx = dma_fence_context_alloc(value);
+			vfpriv->num_rings = value;
+			break;
 		default:
 			ret = -EINVAL;
 			goto out_unlock;
-- 
2.33.0.464.g1972c5931b-goog

