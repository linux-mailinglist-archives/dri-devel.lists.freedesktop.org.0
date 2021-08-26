Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0692A3F8057
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 04:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E056E4AD;
	Thu, 26 Aug 2021 02:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756BC6E484
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:05:08 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id u6so707568pfi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 19:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VuQ5LF40CCD/pZciwYQ+RrVoqJCL4sryOVkKWw1jJz4=;
 b=bQRIeTa1g7T6OyfJ062Y1s2c4NQeelJsbFveZFcbOeKuboP3dREvucW+6mxY9H6rVl
 fwGGVVdl+1HlTMsB9yJG7qEI+jdGJANY3J5IgtN56kapv+kwV4wOG0EQH1guposlAA6z
 RvmAYs22HZZsb9HGz0hgxHf2MWjzxii+C+gQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VuQ5LF40CCD/pZciwYQ+RrVoqJCL4sryOVkKWw1jJz4=;
 b=YdcKUGO8fvnL6W2Xf3DYFGf+0rSP7t52ycarmkEk+HHAcYr8B0Ttv7zutl+OHl630v
 wRY4yIe7uyVKaytcBv/c2EaXsPKN6ps19hSsHWTi2Wwl75onAZIwZu597ou8o8gDaTVI
 fy6eG8b7bdvNR7V601xVcVdqWAZwJUEM2lfETNeT/LUlxtVdUHLF1w2O6d5iqnj+27Om
 3OWeZv1Fj41Qd434TNksJgi0MwLOSH8M2z/63GbQVVZtyXQtG/WRJkgUQQXx0lyXLI2Z
 rby7yZ2p0BQkldPATN4NE6CWNZvS2DBvLuJK9uZu4+57oFmH+0+rBKIN4MRk3Nyk6Sm2
 WPMA==
X-Gm-Message-State: AOAM5334Yu4Bw2O+GcQth8Act5k8r9mSUW+2jSylb/JctXTpH6WwCT7W
 ckJHGCTbel9mhY92vYDQd5XXQwQrMfL3xw==
X-Google-Smtp-Source: ABdhPJyUJ4eP6gqtpFFdY94dJ9AMte7hG+E7u9yx3JiRuZw4PU6dNdwNLh1Nenx+0x0372E5jZ3hoA==
X-Received: by 2002:a63:4f51:: with SMTP id p17mr1145472pgl.29.1629943507801; 
 Wed, 25 Aug 2021 19:05:07 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:faed:1e29:6bf7:3354])
 by smtp.gmail.com with ESMTPSA id o10sm704987pjg.34.2021.08.25.19.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 19:05:07 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [RFC PATCH 08/12] drm/virtio: implement context init: stop using
 drv->context when creating fence
Date: Wed, 25 Aug 2021 19:04:51 -0700
Message-Id: <20210826020455.1081-9-gurchetansingh@chromium.org>
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

The plumbing is all here to do this.  Since we always use the
default fence context when allocating a fence, this makes no
functional difference.

We can't process just the largest fence id anymore, since it's
it's associated with different timelines.  It's fine for fence_id
260 to signal before 259.  As such, process each fence_id
individually.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Acked-by: Lingfeng Yang <lfy@google.com>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 16 ++++++++++++++--
 drivers/gpu/drm/virtio/virtgpu_vq.c    | 15 +++------------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index 24c728b65d21..dbb29f99ead0 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -75,20 +75,25 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
 						uint64_t base_fence_ctx,
 						uint32_t ring_idx)
 {
+	uint64_t fence_context = base_fence_ctx + ring_idx;
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence = kzalloc(sizeof(struct virtio_gpu_fence),
 							GFP_KERNEL);
+
 	if (!fence)
 		return fence;
 
 	fence->drv = drv;
+	fence->ring_idx = ring_idx;
+	fence->emit_fence_info = !(base_fence_ctx == drv->context);
 
 	/* This only partially initializes the fence because the seqno is
 	 * unknown yet.  The fence must not be used outside of the driver
 	 * until virtio_gpu_fence_emit is called.
 	 */
-	dma_fence_init(&fence->f, &virtio_gpu_fence_ops, &drv->lock, drv->context,
-		       0);
+
+	dma_fence_init(&fence->f, &virtio_gpu_fence_ops, &drv->lock,
+		       fence_context, 0);
 
 	return fence;
 }
@@ -110,6 +115,13 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
 	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
+
+	/* Only currently defined fence param. */
+	if (fence->emit_fence_info) {
+		cmd_hdr->flags |=
+			cpu_to_le32(VIRTIO_GPU_FLAG_INFO_RING_IDX);
+		cmd_hdr->info = cpu_to_le32(fence->ring_idx);
+	}
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 496f8ce4cd41..938331554632 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -205,7 +205,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	struct list_head reclaim_list;
 	struct virtio_gpu_vbuffer *entry, *tmp;
 	struct virtio_gpu_ctrl_hdr *resp;
-	u64 fence_id = 0;
+	u64 fence_id;
 
 	INIT_LIST_HEAD(&reclaim_list);
 	spin_lock(&vgdev->ctrlq.qlock);
@@ -232,23 +232,14 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 				DRM_DEBUG("response 0x%x\n", le32_to_cpu(resp->type));
 		}
 		if (resp->flags & cpu_to_le32(VIRTIO_GPU_FLAG_FENCE)) {
-			u64 f = le64_to_cpu(resp->fence_id);
-
-			if (fence_id > f) {
-				DRM_ERROR("%s: Oops: fence %llx -> %llx\n",
-					  __func__, fence_id, f);
-			} else {
-				fence_id = f;
-			}
+			fence_id = le64_to_cpu(resp->fence_id);
+			virtio_gpu_fence_event_process(vgdev, fence_id);
 		}
 		if (entry->resp_cb)
 			entry->resp_cb(vgdev, entry);
 	}
 	wake_up(&vgdev->ctrlq.ack_queue);
 
-	if (fence_id)
-		virtio_gpu_fence_event_process(vgdev, fence_id);
-
 	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
 		if (entry->objs)
 			virtio_gpu_array_put_free_delayed(vgdev, entry->objs);
-- 
2.33.0.259.gc128427fd7-goog

