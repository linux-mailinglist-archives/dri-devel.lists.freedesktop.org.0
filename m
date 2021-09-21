Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6D413DF7
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 01:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC536E92C;
	Tue, 21 Sep 2021 23:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58476E90A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 23:20:35 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 pf3-20020a17090b1d8300b0019e081aa87bso877618pjb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 16:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9G2DSkb8jKDl8LajCas2LXsku2XdXwKz/aDWbn0XEG0=;
 b=fx6OSo3rfRS5up+jmPHjt4cK7QEUoWUuDyjCkd/GGPWAlOdGOVg7Ot84PH4LFb/vCE
 sfhHxpgaYOvmoLoEvPrl2RDTzo2PYQFVZSKk/kJcdoUMUFUf7+gVQ+Ocx/a5E1MyGrt5
 BKBPrLrDwgmW8Ae4vJSm9K7YQSngyk9wspnJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9G2DSkb8jKDl8LajCas2LXsku2XdXwKz/aDWbn0XEG0=;
 b=lmwMUp2LhuQAJqamIlHc8rkcHLHeSSLHU8SSQqTZ9BBMYHCofqnk0MFeyG4Hg0ZPeN
 iRTfSRpFsIIC7XoomGVbppe1hSh3JoikVT9d6h+cs752MayGgdal6NjSP5tJUeGbvz6k
 Y8GXAia8r/f1WvS7EsW9fcFtF/ALgsERdYOcRQdtHv/3DFEMS3+4MR9JJqVEzK2Q0zbn
 Pk88zOHTojvTXovoYRukGvwOliPAeihTNl9lG+6Hd+Dm4qLeoqrLDmRITkReecUv0zbH
 WyYv9hwrHZ9NqW1xvIPxATqsnocQXCRLE0VQNWZP8GZ61fryL3/HIB0R6aUxukSUaK8s
 JZ3A==
X-Gm-Message-State: AOAM530RutGtrMvjX9i5493vFEBLWQmFBNTT5uWEgKjAFoaDH9ZrI/xg
 bTBsEQV3oDIl/cHwv3Hj7JB7mRdpcO1m0w==
X-Google-Smtp-Source: ABdhPJwaXqH0TDgzwS2X8Si2/pGBeAQ2bj9uGFu0DZy2JMduLxVc1MA5iv87UfDU3U7lHQqf5DIyBg==
X-Received: by 2002:a17:90a:4e:: with SMTP id 14mr7937495pjb.180.1632266435001; 
 Tue, 21 Sep 2021 16:20:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:a5ff:11c:6401:fce])
 by smtp.gmail.com with ESMTPSA id e2sm201906pfn.141.2021.09.21.16.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 16:20:34 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v3 08/12] drm/virtio: implement context init: stop using
 drv->context when creating fence
Date: Tue, 21 Sep 2021 16:20:20 -0700
Message-Id: <20210921232024.817-9-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
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
index db7741549ab0..7c052efe8836 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -199,7 +199,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	struct list_head reclaim_list;
 	struct virtio_gpu_vbuffer *entry, *tmp;
 	struct virtio_gpu_ctrl_hdr *resp;
-	u64 fence_id = 0;
+	u64 fence_id;
 
 	INIT_LIST_HEAD(&reclaim_list);
 	spin_lock(&vgdev->ctrlq.qlock);
@@ -226,23 +226,14 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
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
2.33.0.464.g1972c5931b-goog

