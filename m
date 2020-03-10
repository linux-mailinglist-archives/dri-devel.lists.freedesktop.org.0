Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0A217EDAF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B456E5D3;
	Tue, 10 Mar 2020 01:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7906E7D1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:29 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id h11so1534995plk.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8nNGsydjaAq0xWufBHi6rqeFamTNYnp9RK3lcVtOX4=;
 b=iUYimqIzizuYu98pvf+d5kkctdN3m5tji+q5idS0gNNLxjdmC3zdT80/d8qyOLBDB2
 IjY+a+2djSsk2rzUwDYE+Tqn1dhYSLBIxjTSz0J0NbPzkEXxEp2ORCJqMJ5dvQN27/JU
 l7JvPCXTpWekNTVYhNziVnO1OlgCWagl0EIgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8nNGsydjaAq0xWufBHi6rqeFamTNYnp9RK3lcVtOX4=;
 b=ouaYubFudti072L6y6dcd1p6f6XCN0NtYLgraB0/TSO6fbX+PDG1lVMaTNCJgsi7J5
 MwVmTxOFnxOCCmXMO3z0hnrAk+iLrOCh4JZvZb8l+MkJJYQh7jPS2ashiX5y2qh2kRFP
 i78XD/6T9Z5fIMYfL0takcfTi0Zs+gf14VnMOE1Z+3oltOdWsehCbjL77JS/Xq+gXAKC
 JdcXhA47fQ4WzZTzLPy+pXDP6XGQ4VHfDNnySTPkE5xW/PQr/D7bUoanMqdVcF3UhJ09
 TTKDWanbZVx9UM2/eHHM4oV+J23lt49QYeibL46+PttyXKM5n0Fn8Hh7rAUMKM83TPEe
 7NpQ==
X-Gm-Message-State: ANhLgQ3y2YkJna6r+zOZhzwUvzfypRxMHi5ZXXxss2cHYIYgIg7NLRil
 xSLb1Kb2DEIBuK/z/WWCxWOKlKW1QE4=
X-Google-Smtp-Source: ADFU+vuZ5Y8ca3UUiiXQpaBr34mpG3jOrj7FhyWdMUkCr0cme4LWgTiyV4cJ4NgiHMj8zTe3GkilcQ==
X-Received: by 2002:a17:902:a408:: with SMTP id
 p8mr18754707plq.132.1583802509024; 
 Mon, 09 Mar 2020 18:08:29 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 3/8] drm/virtio: plumb virtio_gpu_fpriv to
 virtio_gpu_fence_alloc
Date: Mon,  9 Mar 2020 18:08:13 -0700
Message-Id: <20200310010818.569-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310010818.569-1-gurchetansingh@chromium.org>
References: <20200310010818.569-1-gurchetansingh@chromium.org>
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
Cc: chadversary@chromium.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 kraxel@redhat.com, jbates@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll need it when initiating a dma-fence.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   | 4 ++--
 drivers/gpu/drm/virtio/virtgpu_fence.c | 3 ++-
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 9 +++++----
 drivers/gpu/drm/virtio/virtgpu_plane.c | 2 +-
 4 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index b4f85c5fedb9..76223e2aa68d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -355,8 +355,8 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
 					int index);
 
 /* virtio_gpu_fence.c */
-struct virtio_gpu_fence *virtio_gpu_fence_alloc(
-	struct virtio_gpu_device *vgdev);
+struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
+						struct virtio_gpu_fpriv *fpriv);
 void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 			  struct virtio_gpu_ctrl_hdr *cmd_hdr,
 			  struct virtio_gpu_fence *fence);
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 2fe9c7ebcbd4..f0a7ef80e484 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -73,7 +73,8 @@ static const struct dma_fence_ops virtio_fence_ops = {
 	.timeline_value_str  = virtio_timeline_value_str,
 };
 
-struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev)
+struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
+						struct virtio_gpu_fpriv *fpriv)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence = kzalloc(sizeof(struct virtio_gpu_fence),
diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 336cc9143205..4860dcb3b3bb 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -160,7 +160,7 @@ static int virtio_gpu_execbuffer_ioctl(struct drm_device *dev, void *data,
 			goto out_memdup;
 	}
 
-	out_fence = virtio_gpu_fence_alloc(vgdev);
+	out_fence = virtio_gpu_fence_alloc(vgdev, vfpriv);
 	if(!out_fence) {
 		ret = -ENOMEM;
 		goto out_unresv;
@@ -226,6 +226,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 					    struct drm_file *file)
 {
 	struct virtio_gpu_device *vgdev = dev->dev_private;
+	struct virtio_gpu_fpriv *vfpriv = file->driver_priv;
 	struct drm_virtgpu_resource_create *rc = data;
 	struct virtio_gpu_fence *fence;
 	int ret;
@@ -265,7 +266,7 @@ static int virtio_gpu_resource_create_ioctl(struct drm_device *dev, void *data,
 	if (params.size == 0)
 		params.size = PAGE_SIZE;
 
-	fence = virtio_gpu_fence_alloc(vgdev);
+	fence = virtio_gpu_fence_alloc(vgdev, vfpriv);
 	if (!fence)
 		return -ENOMEM;
 	ret = virtio_gpu_object_create(vgdev, &params, &qobj, fence);
@@ -329,7 +330,7 @@ static int virtio_gpu_transfer_from_host_ioctl(struct drm_device *dev,
 	if (ret != 0)
 		goto err_put_free;
 
-	fence = virtio_gpu_fence_alloc(vgdev);
+	fence = virtio_gpu_fence_alloc(vgdev, vfpriv);
 	if (!fence) {
 		ret = -ENOMEM;
 		goto err_unlock;
@@ -375,7 +376,7 @@ static int virtio_gpu_transfer_to_host_ioctl(struct drm_device *dev, void *data,
 			goto err_put_free;
 
 		ret = -ENOMEM;
-		fence = virtio_gpu_fence_alloc(vgdev);
+		fence = virtio_gpu_fence_alloc(vgdev, vfpriv);
 		if (!fence)
 			goto err_unlock;
 
diff --git a/drivers/gpu/drm/virtio/virtgpu_plane.c b/drivers/gpu/drm/virtio/virtgpu_plane.c
index 52d24179bcec..0cf43936abb3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_plane.c
+++ b/drivers/gpu/drm/virtio/virtgpu_plane.c
@@ -202,7 +202,7 @@ static int virtio_gpu_cursor_prepare_fb(struct drm_plane *plane,
 	vgfb = to_virtio_gpu_framebuffer(new_state->fb);
 	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
 	if (bo && bo->dumb && (plane->state->fb != new_state->fb)) {
-		vgfb->fence = virtio_gpu_fence_alloc(vgdev);
+		vgfb->fence = virtio_gpu_fence_alloc(vgdev, NULL);
 		if (!vgfb->fence)
 			return -ENOMEM;
 	}
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
