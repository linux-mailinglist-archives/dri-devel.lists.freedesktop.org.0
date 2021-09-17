Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B840EE98
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341D96EA88;
	Fri, 17 Sep 2021 01:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D866EA88
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:52 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id s11so7963937pgr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ey9lhaUgZA+8S1H5osVr7f8kYi5n5xZ93mrqVA17Ee0=;
 b=BaySoGqBMiCEawda+l9V9OKMYH8zf5JT5kkZkOZI/ZXi6caW/J1KH4gAFUHA8hGKca
 bPgWciqEewTVjVJI965Ta1iDb9hF43VUD5qr/NCpq4aFv9Q9gPR4VgEUJ9hbIpbdQztx
 z6nU2osX8tquO72DZvnuOcTlVXj310SBfCsTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ey9lhaUgZA+8S1H5osVr7f8kYi5n5xZ93mrqVA17Ee0=;
 b=YRh7BLUWTxKZPt+2pVE1JjVHhtW5TqvsRgQ0LzSkA0TMoICCHcwu4LoqxIZpZfC7cS
 VJakyeytM/4AtGwz6E7YueiHCYcDreSo2lKQqnnknOi8Xn6S+WZ7PSG9FMY2he0pSKE/
 dkwMSiY54g7IPjB7sEObXDDT+0QsKc+BvDYFGiY1gfV+6/HdwOJHnUoTctq65bR3wUT/
 67+gjURh7vZ3J9PedImFj3EODHgpxH8WVcMgeT3cK/tTnSjGyqiM9+mRy5jjG6vVYnlX
 cMXzlvCQxQyprkM37qDK13yOIRJPk8ViUvzfUArl7Qbair3mheIZNX5oYCr/72T9gDZX
 54Dw==
X-Gm-Message-State: AOAM531D1GM8UW0fIzY9EIGGsR8fF2zNNAL+RHGcooPWRxiBMe6Hbnqn
 vATUbjgIME425H69yXbPPDSolVXhE+/k2jK9
X-Google-Smtp-Source: ABdhPJziEikMtEY61O0nwboocavdsdkxjpWTuiAJ/2O2R3F7Gam2b8k0oGaG+LtyMmFgDQs7mvr2AQ==
X-Received: by 2002:a65:404d:: with SMTP id h13mr7615614pgp.130.1631840931952; 
 Thu, 16 Sep 2021 18:08:51 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:51 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 07/12] drm/virtio: implement context init: plumb
 {base_fence_ctx, ring_idx} to virtio_gpu_fence_alloc
Date: Thu, 16 Sep 2021 18:08:37 -0700
Message-Id: <20210917010842.503-8-gurchetansingh@chromium.org>
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

These were defined in the previous commit. We'll need these
parameters when allocating a dma_fence.  The use case for this
is multiple synchronizations timelines.

The maximum number of timelines per 3D instance will be 32. Usually,
only 2 are needed -- one for CPU commands, and another for GPU
commands.

As such, we'll need to specify these parameters when allocating a
dma_fence.

vgdev->fence_drv.context is the "default" fence context for 2D mode
and old userspace.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 5 +++--
 drivers/gpu/drm/virtio/virtgpu_fence.c | 4 +++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 +++++----
 drivers/gpu/drm/virtio/virtgpu_plane.c | 3 ++-
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 401aec1a5efb..a5142d60c2fa 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -426,8 +426,9 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					int index);
 
 /* virtgpu_fence.c */
-struct virtio_gpu_fence *virtio_gpu_fence_alloc(
-	struct virtio_gpu_device *vgdev);
+struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
+						uint64_t base_fence_ctx,
+						uint32_t ring_idx);
 void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index d28e25e8409b..24c728b65d21 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -71,7 +71,9 @@ static const struct dma_fence_ops virtio_gpu_fence_ops = {
 	.timeline_value_str  = virtio_gpu_timeline_value_str,
 };
 
-struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
+struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
+						uint64_t base_fence_ctx,
+						uint32_t ring_idx)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence = kzalloc(sizeof(struct virtio_gpu_fence),
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index f5281d1e30e1..f51f3393a194 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -173,7 +173,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_memdup;
 	}
 
-	out_fence = virtio_gpu_fence_alloc(vgdev);
+	out_fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if(!out_fence) {
 		ret = -ENOMEM;
 		goto out_unresv;
@@ -288,7 +288,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	if (params.size == 0)
 		params.size = PAGE_SIZE;
 
-	fence = virtio_gpu_fence_alloc(vgdev);
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence)
 		return -ENOMEM;
 	ret = virtio_gpu_object_create(vgdev, &params, &qobj, fence);
@@ -367,7 +367,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
-	fence = virtio_gpu_fence_alloc(vgdev);
+	fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context, 0);
 	if (!fence) {
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -427,7 +427,8 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			goto err_put_free;
 
 		ret = -ENOMEM;
-		fence = virtio_gpu_fence_alloc(vgdev);
+		fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+					       0);
 		if (!fence)
 			goto err_unlock;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index a49fd9480381..6d3cc9e238a4 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -256,7 +256,8 @@ static int virtio_gpu_plane_prepare_fb(struct drm_plane *plane,
 		return 0;
 
 	if (bo->dumb && (plane->state->fb != new_state->fb)) {
-		vgfb->fence = virtio_gpu_fence_alloc(vgdev);
+		vgfb->fence = virtio_gpu_fence_alloc(vgdev, vgdev->fence_drv.context,
+						     0);
 		if (!vgfb->fence)
 			return -ENOMEM;
 	}
-- 
2.33.0.464.g1972c5931b-goog

