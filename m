Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 446FE2C1B6B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 03:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A45A6E19B;
	Tue, 24 Nov 2020 02:28:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E16E19B
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 02:28:26 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id t3so2244406pgi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 18:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=omrVkBv4oXr6yjt+/Z1LETfBKhl0NH221mUTo9aA5cI=;
 b=dV4JLd9hOp0LTgl3CPgCONZc4JG2L3fzpUdlfxi5N2hfVhZ/U7KM54Nh0jNnqw8nCH
 FXozBNyTpn3apfsXYLTcYNQkVm6CPpvL7wunokEHKy5fwzRqymNSoJBfztJra6dNM22+
 /kGz7NY6gsEo3ZwTYr8zouCv/iTh8+ly5l47w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=omrVkBv4oXr6yjt+/Z1LETfBKhl0NH221mUTo9aA5cI=;
 b=IeHj51vO6luxaF75Fij3VmyJdOJ3oKZfO4ZJehY4jZYkcKmPdZx2xvHTCXabgP0+CN
 ZEFVrjUWj2Q1i+ThNTB+pPUl1yQ+DhXc9o+utnt4vZYEBhwUBgb/TEAMrSJMUbxbmmkh
 zpq2ysoGeOObakp5UEv39CpfLfMhUI0qeKELvNd4hLqVe/atT6lnrA53EPdh//fzpurt
 cVo8oW2tiBe4XY62/AHQj0olBQckGalWfi/iW8n5EpLVSpyx7dE/1WRiW7Ee68bn6aAG
 Np+/iUzAlLkQsoAOhQtWoOi2JE+mpA6817GhI+T+HsEKcPlWglNYYCpNh1vPny5O6RN8
 GWzg==
X-Gm-Message-State: AOAM532lF04y4vdIqIyI/34zDKukzBgEi/NCJl1YgquJNfajsHdlytBa
 nwBemFt9SzCtUjxwE6zWikZ6i0A7vXKOxw==
X-Google-Smtp-Source: ABdhPJyzaYwWfGdVmPGXGHrK1igE2ouAbOGb4engHZrO25wn02hqAkaZ8k/tNTaOHD7vuU/Vjrjhfw==
X-Received: by 2002:a17:90a:1746:: with SMTP id
 6mr2221807pjm.104.1606184905738; 
 Mon, 23 Nov 2020 18:28:25 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:5265:f3ff:fe2d:4d58])
 by smtp.gmail.com with ESMTPSA id m11sm678574pfa.24.2020.11.23.18.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 18:28:24 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/virtio: consider dma-fence context when signaling
Date: Mon, 23 Nov 2020 18:28:17 -0800
Message-Id: <20201124022817.404-1-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124021902.407-3-gurchetansingh@chromium.org>
References: <20201124021902.407-3-gurchetansingh@chromium.org>
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This an incremental refactor towards multiple dma-fence contexts
in virtio-gpu.  Since all fences are still allocated using
&virtio_gpu_fence_driver.context, nothing should break and every
processed fence will be signaled.

The overall idea is every 3D context can allocate a number of
dma-fence contexts.  Each dma-fence context refers to it's own
timeline.

For example, consider the following case where virgl submits
commands to the GPU (fence ids 1, 3) and does a metadata query with
the CPU (fence id 5).  In a different process, gfxstream submits
commands to the GPU (fence ids 2, 4).

fence_id (&dma_fence.seqno)       | 1 2 3 4 5
----------------------------------|-----------
fence_ctx 0 (virgl gpu)           | 1   3
fence_ctx 1 (virgl metadata query)|         5
fence_ctx 2 (gfxstream gpu)       |   2   4

With multiple fence contexts, we can wait for the metadata query
to finish without waiting for the virgl gpu to finish.  virgl gpu
does not have to wait for gfxstream gpu.  The fence id still is the
monotonically increasing sequence number, but it's only revelant to
the specific dma-fence context.

To fully enable this feature, we'll need to:
  - have each 3d context allocate a number of fence contexts. Not
    too hard with explicit context initialization on the horizon.
  - have guest userspace specify fence context when performing
    ioctls.
  - tag each fence emitted to the host with the fence context
    information.  virtio_gpu_ctrl_hdr has padding + flags available,
    so that should be easy.

This change goes in the direction specified above, by:
  - looking up the virtgpu_fence given a fence_id
  - signalling all prior fences in a given context
  - signalling current fence

v2: fix grammar in comment

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_drv.h   |  1 +
 drivers/gpu/drm/virtio/virtgpu_fence.c | 39 ++++++++++++++++++++------
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
index 6a232553c99b..d9dbc4f258f3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.h
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
@@ -136,6 +136,7 @@ struct virtio_gpu_fence_driver {
 
 struct virtio_gpu_fence {
 	struct dma_fence f;
+	uint64_t fence_id;
 	struct virtio_gpu_fence_driver *drv;
 	struct list_head node;
 };
diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index b35fcd1d02d7..d28e25e8409b 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -51,7 +51,7 @@ static bool virtio_gpu_fence_signaled(struct dma_fence *f)
 
 static void virtio_gpu_fence_value_str(struct dma_fence *f, char *str, int size)
 {
-	snprintf(str, size, "%llu", f->seqno);
+	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
 }
 
 static void virtio_gpu_timeline_value_str(struct dma_fence *f, char *str,
@@ -99,7 +99,7 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
-	fence->f.seqno = ++drv->current_fence_id;
+	fence->fence_id = fence->f.seqno = ++drv->current_fence_id;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
@@ -107,24 +107,45 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 	trace_dma_fence_emit(&fence->f);
 
 	cmd_hdr->flags |= cpu_to_le32(VIRTIO_GPU_FLAG_FENCE);
-	cmd_hdr->fence_id = cpu_to_le64(fence->f.seqno);
+	cmd_hdr->fence_id = cpu_to_le64(fence->fence_id);
 }
 
 void virtio_gpu_fence_event_process(struct virtio_gpu_device *vgdev,
 				    u64 fence_id)
 {
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
-	struct virtio_gpu_fence *fence, *tmp;
+	struct virtio_gpu_fence *signaled, *curr, *tmp;
 	unsigned long irq_flags;
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
 	atomic64_set(&vgdev->fence_drv.last_fence_id, fence_id);
-	list_for_each_entry_safe(fence, tmp, &drv->fences, node) {
-		if (fence_id < fence->f.seqno)
+	list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+		if (fence_id != curr->fence_id)
 			continue;
-		dma_fence_signal_locked(&fence->f);
-		list_del(&fence->node);
-		dma_fence_put(&fence->f);
+
+		signaled = curr;
+
+		/*
+		 * Signal any fences with a strictly smaller sequence number
+		 * than the current signaled fence.
+		 */
+		list_for_each_entry_safe(curr, tmp, &drv->fences, node) {
+			/* dma-fence contexts must match */
+			if (signaled->f.context != curr->f.context)
+				continue;
+
+			if (!dma_fence_is_later(&signaled->f, &curr->f))
+				continue;
+
+			dma_fence_signal_locked(&curr->f);
+			list_del(&curr->node);
+			dma_fence_put(&curr->f);
+		}
+
+		dma_fence_signal_locked(&signaled->f);
+		list_del(&signaled->node);
+		dma_fence_put(&signaled->f);
+		break;
 	}
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
 }
-- 
2.29.2.454.gaff20da3a2-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
