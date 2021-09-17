Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1540EE9C
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007436EAB4;
	Fri, 17 Sep 2021 01:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAD26EA8D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:08:53 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id k23so5837410pji.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GBt3iKLXvTHVXIosJjfpyJnWYsUDcG4gzSQpQ9Ux8/Y=;
 b=Y8exHVkn7ZzeC7SJOXgIfaGmTkwbaqm//rjbG5IxFyImDugiA5xSSyXZ7FaNcdN80b
 u+xVELwn1c45L3lqlToMoutmRYL8JoOpM8aodyeyVN6bG4gZpEivMfSERhx4IEDGmkX9
 iackbxXuOIlpcWJ1y9EnGxggLG//eO7y43770=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GBt3iKLXvTHVXIosJjfpyJnWYsUDcG4gzSQpQ9Ux8/Y=;
 b=Fd+2C3cTMHC9kfwsnwb/ptSpG19fDebzaLRz6dCZ2OQYTg2ezgn2XMiFlSj9o3XEfv
 LICdE8YkfryKuPDGcM20xq9q7ngacpXyHrEmdCpOgP+zuM93t4fg1ZqZ+wYcL4NFekHb
 r6FK9OPY7GtBPy8HOo1+C3MNtt7ljDn1/M9qlpncgTuVPJid/B6jgVKA3Y8GJTd5aSxi
 LziD9yy9+EenA45LHSuJ23IwE+K32X68fTEhElkDZxQ+rXYlntJesrBzRS2PB4FSc6QX
 D2d4eZPwIMtI4Bt5e6KsvamC6qMiDUvI5AYz7qlueKUo39rRHoNt76wzVRLapDo2XYEU
 JTYg==
X-Gm-Message-State: AOAM531wsJRubm5E30uNfge/NgphWd5bonfmjwwoWXX5CCETfTm0OEQA
 Wia4WdiFI0PbiRsa6q1LiXFmsSuXerQa7Yga
X-Google-Smtp-Source: ABdhPJz8YImN7GnVJzZHadZEpeyLJFqbeBX2iFSiCUre0adQqnw3Yry+DvnnW2aSMcU0QFnNwzXpXQ==
X-Received: by 2002:a17:90b:4a44:: with SMTP id
 lb4mr18086303pjb.140.1631840933138; 
 Thu, 16 Sep 2021 18:08:53 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:dc20:9a88:c41:f0dd])
 by smtp.gmail.com with ESMTPSA id v4sm4215812pff.11.2021.09.16.18.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:08:52 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org,
	virtio-dev@lists.oasis-open.org
Cc: kraxel@redhat.com
Subject: [PATCH v2 08/12] drm/virtio: implement context init: stop using
 drv->context when creating fence
Date: Thu, 16 Sep 2021 18:08:38 -0700
Message-Id: <20210917010842.503-9-gurchetansingh@chromium.org>
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
2.33.0.464.g1972c5931b-goog

