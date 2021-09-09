Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FE4042C3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DCC6E3F9;
	Thu,  9 Sep 2021 01:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4376E416
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:27 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 pi15-20020a17090b1e4f00b00197449fc059so241133pjb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qRSRwxmtJvyxVB3edtHxkyqkiuR9z7A4CoE5/UsyMWE=;
 b=c5fX/2MMpi/EA7UtOJ3i+byG5XbDuqJZDR73Hyr4oFovqVgfnKTrOBKxNPFoek3dfF
 sjd5n/pjC7e9L6WGUt6QqxvWg5dY/cTArBIwXwuGbJeehIo8nJ/q/UiWSD33YflOU2Ek
 FrZAqEYP2kWYoFlTgKIwme1J5AaESCXg+k+j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qRSRwxmtJvyxVB3edtHxkyqkiuR9z7A4CoE5/UsyMWE=;
 b=o3JNjB6CdCJrEChbKbGx8dxOEBDlfDu5pN40yAIOfBtH52hjPJ19BBQwDLilxVk/si
 Sr2r69b8/o2fdjc9FQ9udXgSjSscKOIh0w7zit8xRfvUMlqGQqoMNS4TsKLZT1eHCgQw
 U9WjZ3C7dzR115pmeuu3lKF9otaaENQyPEqu6zPXEOfgFlw4yGO3W7L93RKm8/7Hp5Kw
 XZuzFH8XKHRYJuvdNclBzVxzC+OsUs4ZV7dboTk/uuQLeJi4Sy08zk+yQo90UhJD/bJ8
 dqc0mql1yN37tXeCVmWLcacyFzUbcYEhCHgyLd33zvVlH9nBgzu0BVRIbX6YK6LHZTKn
 qK4A==
X-Gm-Message-State: AOAM531hN9FsGPTBhZa8UHEd3ufodxxxu+AXssQLjB88Rbq2cKGjEVtF
 muuXQMLiGar2GHE8A0mqSySwvLA9730D7MqK
X-Google-Smtp-Source: ABdhPJz5ugxbfLf9gbRUVyAxAC3y4EhCJhcBXfxqC4TMx+79iQXP94ygNcLLKNSJQ0Ocs+bJDyb/XA==
X-Received: by 2002:a17:902:9692:b0:13a:2554:9646 with SMTP id
 n18-20020a170902969200b0013a25549646mr355221plp.9.1631151446606; 
 Wed, 08 Sep 2021 18:37:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 07/12] drm/virtio: implement context init: plumb
 {base_fence_ctx, ring_idx} to virtio_gpu_fence_alloc
Date: Wed,  8 Sep 2021 18:37:12 -0700
Message-Id: <20210909013717.861-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210909013717.861-1-gurchetansingh@chromium.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
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
2.33.0.153.gba50c8fa24-goog

