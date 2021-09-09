Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C70B4042C4
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 03:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830C6E41A;
	Thu,  9 Sep 2021 01:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606CE6E416
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 01:37:28 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id r2so163098pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 18:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjksEOjaa6WV7Wh3GAPBgHSQmgiEfFyWNWsm3t/E3EU=;
 b=eEG74NnwD24zg/pEiG0HHVV9HbrOxNbp/cn4L/K9+3530pz/4/UxfLifaGEBhYJozG
 8pvoLmn1Iho7vSj5DGsWn/WcLlaj9UiQPVOsQpIOF6T5rZpuV8XNIa5xWCY6LYa+X/Wq
 nh91k4041YhnxWlAC8BOhad2v6YWbs6EeiaRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjksEOjaa6WV7Wh3GAPBgHSQmgiEfFyWNWsm3t/E3EU=;
 b=VIPW50GbWfS0L8imPtrdWL6lpUQRyZNmz4c4riuU4ghlmPDJ3Y0mxblJWnckCEpMwx
 C1VLtq4qvzz6GWJHJlHYgloNW/ViIrcKUrclb8CQsaX/FnoTw4WX1YsXwxVecrQOA441
 aAwRnypp/M1gXiBdQCYnFMRCAxKhyB2ITAkAOuj1Q5uy3XBSNCxQ+lkM7R7wcCo1f8yz
 DIlNqIqP4QIJmmt05faJtAo4GeqlnNDKR6nLVqbNKN3MZv+R+1DYQulBuj9H94SwgAu9
 cjp41MoSa9Z4I2OaNN80iFhdA4HlZKuAr5cgq2bp42hOjUbUV27gOBklzYSNWJkCTZ5q
 O31A==
X-Gm-Message-State: AOAM532EhyPV3rnG047IvVruDH3X+gVkGCNBPS6fmnKm4ey2skMu4q+p
 00LuJS1p7HBjy9uisMxRxxujGLPhV4GqmwLB
X-Google-Smtp-Source: ABdhPJz15ZRLiTUyLjunYZgVtSaiOk59MrjM8uOl4aLfwlkJ1LMDIK5SpPmnsspM/cMHn20o7PpOAA==
X-Received: by 2002:aa7:958f:0:b0:416:2525:4ad with SMTP id
 z15-20020aa7958f000000b00416252504admr601890pfj.11.1631151447505; 
 Wed, 08 Sep 2021 18:37:27 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:b3e5:2f81:d686:bc91])
 by smtp.gmail.com with ESMTPSA id h9sm142488pjg.9.2021.09.08.18.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 18:37:27 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v1 08/12] drm/virtio: implement context init: stop using
 drv->context when creating fence
Date: Wed,  8 Sep 2021 18:37:13 -0700
Message-Id: <20210909013717.861-9-gurchetansingh@chromium.org>
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
index 24c728b65d21..98a00c1e654d 100644
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
+		cmd_hdr->ring_idx = (u8)fence->ring_idx;
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
2.33.0.153.gba50c8fa24-goog

