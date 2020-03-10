Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BA17EDB3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 02:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438E16E7D5;
	Tue, 10 Mar 2020 01:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B23D6E7D5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 01:08:38 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id l36so654443pjb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2020 18:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCtBJaSVAsGbad4sHSsx1lF9Q6IZOkOYLdu121iqZz0=;
 b=RHeNH8VTRNh2Opf5Vv9ZIoCFq7n9kubVtzANHNrhtCidHXpeATevQJeZsQijQshxei
 0xz/9ZvG+8Dy8JQnCCmcpTEidgmqQj9rMdiK/HxmGYR/Fds3HolSH4xVhHq7zy/MPWCo
 w1Qp5OuhnXRyU6Y8taa05hfERL1scCVhGfpyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCtBJaSVAsGbad4sHSsx1lF9Q6IZOkOYLdu121iqZz0=;
 b=MExBCgMIkB+GaZy9k/uQrsaRnNoBOk+sH8h+g7yWwYxo3UfUJiQO6PmVJMrTD+2WXa
 PH+gfdnfgfJ5Bx/XPXvpoWH5rJx9Hxxu861Fw5hBkDQpYvpBhcVdFM92xruiusxVBflt
 8S5lBub+KjxLn3XeRsKMStr1RTHZYIcVs3j8EQiCqfbfddprLLhdfOj1Uw6tbw6vLici
 UB/vv3VxR+BN1FAuJADO+SH17i+265nvkzUHEqQ1leJen3gbai3xM2Rhl2YQtpIlF5Zd
 y/GxvdExd14/e9GX0jLdy8jCLpJ8hfY6ZxWdpS+G1VCFuSFKsm7kwR37Fum50m0/iF74
 d4xg==
X-Gm-Message-State: ANhLgQ2DckuuyBlBjR59U2Y870IKks3gkuDAS+TtXWTABpOzg39bmcZ8
 E5iRXyP2AQcjyfhGiMA5k8z2dbDcp44=
X-Google-Smtp-Source: ADFU+vv81A7fcWxqng19jL7brlOHq0/nbRKydjhbZR+RvV5sey9zAE5icFu1Ms567eWoHAyoHOcmrQ==
X-Received: by 2002:a17:902:54f:: with SMTP id
 73mr18013545plf.255.1583802517275; 
 Mon, 09 Mar 2020 18:08:37 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id s126sm22864070pfb.143.2020.03.09.18.08.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 09 Mar 2020 18:08:36 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 8/8] drm/virtio: enable per context fencing
Date: Mon,  9 Mar 2020 18:08:18 -0700
Message-Id: <20200310010818.569-9-gurchetansingh@chromium.org>
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

If there's a 3D context available, initialize the fence using
the 3D context's fence context.

We can't process just the largest fence id anymore, since it's
not the same as the sequence number now.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 drivers/gpu/drm/virtio/virtgpu_fence.c | 15 ++++++++++++---
 drivers/gpu/drm/virtio/virtgpu_vq.c    |  4 +---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_fence.c b/drivers/gpu/drm/virtio/virtgpu_fence.c
index a6c6f498e79e..bfcb41bcaa68 100644
--- a/drivers/gpu/drm/virtio/virtgpu_fence.c
+++ b/drivers/gpu/drm/virtio/virtgpu_fence.c
@@ -30,6 +30,8 @@
 #define to_virtio_fence(x) \
 	container_of(x, struct virtio_gpu_fence, f)
 
+static atomic_t fence_seq = ATOMIC_INIT(0);
+
 static const char *virtio_get_driver_name(struct dma_fence *f)
 {
 	return "virtio_gpu";
@@ -52,7 +54,7 @@ static bool virtio_fence_signaled(struct dma_fence *f)
 
 static void virtio_fence_value_str(struct dma_fence *f, char *str, int size)
 {
-	snprintf(str, size, "%llu", f->seqno);
+	snprintf(str, size, "[%llu, %llu]", f->context, f->seqno);
 }
 
 static void virtio_timeline_value_str(struct dma_fence *f, char *str, int size)
@@ -74,9 +76,11 @@ static const struct dma_fence_ops virtio_fence_ops = {
 struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
 						struct virtio_gpu_fpriv *fpriv)
 {
+	uint64_t context;
 	struct virtio_gpu_fence_driver *drv = &vgdev->fence_drv;
 	struct virtio_gpu_fence *fence = kzalloc(sizeof(struct virtio_gpu_fence),
 							GFP_KERNEL);
+
 	if (!fence)
 		return fence;
 
@@ -86,7 +90,13 @@ struct virtio_gpu_fence *virtio_gpu_fence_alloc(struct virtio_gpu_device *vgdev,
 	 * unknown yet.  The fence must not be used outside of the driver
 	 * until virtio_gpu_fence_emit is called.
 	 */
-	dma_fence_init(&fence->f, &virtio_fence_ops, &drv->lock, drv->context, 0);
+	if (fpriv)
+		context = fpriv->fence_context;
+	else
+		context = drv->context;
+
+	dma_fence_init(&fence->f, &virtio_fence_ops, &drv->lock, context,
+		       atomic_inc_return(&fence_seq));
 
 	return fence;
 }
@@ -100,7 +110,6 @@ void virtio_gpu_fence_emit(struct virtio_gpu_device *vgdev,
 
 	spin_lock_irqsave(&drv->lock, irq_flags);
 	fence->fence_id = ++drv->current_fence_id;
-	fence->f.seqno = fence->fence_id;
 	dma_fence_get(&fence->f);
 	list_add_tail(&fence->node, &drv->fences);
 	spin_unlock_irqrestore(&drv->lock, irq_flags);
diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c b/drivers/gpu/drm/virtio/virtgpu_vq.c
index 73854915ec34..e7d8b2398628 100644
--- a/drivers/gpu/drm/virtio/virtgpu_vq.c
+++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
@@ -239,6 +239,7 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 					  __func__, fence_id, f);
 			} else {
 				fence_id = f;
+				virtio_gpu_fence_event_process(vgdev, fence_id);
 			}
 		}
 		if (entry->resp_cb)
@@ -246,9 +247,6 @@ void virtio_gpu_dequeue_ctrl_func(struct work_struct *work)
 	}
 	wake_up(&vgdev->ctrlq.ack_queue);
 
-	if (fence_id)
-		virtio_gpu_fence_event_process(vgdev, fence_id);
-
 	list_for_each_entry_safe(entry, tmp, &reclaim_list, list) {
 		if (entry->objs)
 			virtio_gpu_array_put_free_delayed(vgdev, entry->objs);
-- 
2.25.1.481.gfbce0eb801-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
