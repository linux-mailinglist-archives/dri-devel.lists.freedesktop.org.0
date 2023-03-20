Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 395016C1529
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E771810E5AC;
	Mon, 20 Mar 2023 14:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF7810E1E1;
 Mon, 20 Mar 2023 14:44:49 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 e15-20020a17090ac20f00b0023d1b009f52so16744576pjt.2; 
 Mon, 20 Mar 2023 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y74KF7H2nPAn1GkAkMf3ALBkHME3mvlc137TFEwpI5M=;
 b=KDNXAyKxSPxmqCM1goz2ei4OMneXayGq4rDfE6Qgq1VIyE6guRUWAO1mZzPWwgIP26
 JYt+JAaoGORRqU5CpZfLxhpnaTqa15rJPVrROZd2PP5/Wrv+L91VA5PRNhE4DIVA3ZzB
 OFZzSBuKsPmYl+P7Ixx+dBJft1d8cUSoVWPBMVB/TZ2/y4+0WwyogGQnGsgpycK2T+HC
 4AeAWwpByzuLtol49nW1nmtPSxhPBjJAzk4GYtsHsq6Xqba8j2nOOgS7lDgcUfg6PO4d
 9Babeqe7rFqMFE/ieZ97Gbuj0CUvKp6/l1e4DET+Plb6nHmPrw2kqMuYyB3AqKl+6N11
 miDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323489;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y74KF7H2nPAn1GkAkMf3ALBkHME3mvlc137TFEwpI5M=;
 b=jnp9eJ29weZGTY/aHd2CqYPfdJSLDQfLsvRz7Q6RrmMlf0ckEUmhuIvisp+elZJwbd
 tc7UA56ax918wlBmLo0p0L7QyA7ZF9KCwNOSXxYE/u6HlOL8BgQvNZpw2f/ltwI7UXap
 KzyyEVp3ha0gHsLItHooO81ysKij6hjL2wXxBWpcFPNAw3IIVHSKQCkZMhiUrBWzjwug
 E3Qy8cvoAbmP5nP+XFBmSQZusaSyuaa18BF896dhxbDVKdy0I165xyaK0SaJP5+t2wgI
 yux+d9nC/tsJVDAb7hOC+jOvCuQufmLES9Vyipo+Xi+xVkIh7CXc1wZJ3vZjhcjGPRvo
 38ew==
X-Gm-Message-State: AO0yUKVLGkA7sIJJpuM9UGCh1oPq2qouBMJ66W+IDSERq+N+fYCGLtmX
 tLeMFpfEfVqAohKj5HxOUXVgdTMfgcw=
X-Google-Smtp-Source: AK7set9ZUleUp5mEZ/nimYP6FtanqkhrK9z8SGzJ4pCwCjW9CpDQ3yDpgBO1I4IgNMmovbqGg0F/ng==
X-Received: by 2002:a17:902:c40c:b0:19a:a815:2868 with SMTP id
 k12-20020a170902c40c00b0019aa8152868mr21846958plk.44.1679323488934; 
 Mon, 20 Mar 2023 07:44:48 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a170902c3c300b001a072be70desm6828123plj.41.2023.03.20.07.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 10/23] drm/msm: Switch idr_lock to spinlock
Date: Mon, 20 Mar 2023 07:43:32 -0700
Message-Id: <20230320144356.803762-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Needed to idr_preload() which returns with preemption disabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c         |  6 ++----
 drivers/gpu/drm/msm/msm_gem_submit.c  | 10 +++++-----
 drivers/gpu/drm/msm/msm_gpu.h         |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index aca48c868c14..ce1a77b607d1 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -918,13 +918,11 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	 * retired, so if the fence is not found it means there is nothing
 	 * to wait for
 	 */
-	ret = mutex_lock_interruptible(&queue->idr_lock);
-	if (ret)
-		return ret;
+	spin_lock(&queue->idr_lock);
 	fence = idr_find(&queue->fence_idr, fence_id);
 	if (fence)
 		fence = dma_fence_get_rcu(fence);
-	mutex_unlock(&queue->idr_lock);
+	spin_unlock(&queue->idr_lock);
 
 	if (!fence)
 		return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 1d8e7c2a8024..b9d81e5acb42 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -79,9 +79,9 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	unsigned i;
 
 	if (submit->fence_id) {
-		mutex_lock(&submit->queue->idr_lock);
+		spin_lock(&submit->queue->idr_lock);
 		idr_remove(&submit->queue->fence_idr, submit->fence_id);
-		mutex_unlock(&submit->queue->idr_lock);
+		spin_unlock(&submit->queue->idr_lock);
 	}
 
 	dma_fence_put(submit->user_fence);
@@ -882,7 +882,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
-	mutex_lock(&queue->idr_lock);
+	spin_lock(&queue->idr_lock);
 
 	/*
 	 * If using userspace provided seqno fence, validate that the id
@@ -892,7 +892,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 */
 	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
 			idr_find(&queue->fence_idr, args->fence)) {
-		mutex_unlock(&queue->idr_lock);
+		spin_unlock(&queue->idr_lock);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -926,7 +926,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 						    INT_MAX, GFP_KERNEL);
 	}
 
-	mutex_unlock(&queue->idr_lock);
+	spin_unlock(&queue->idr_lock);
 
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index fc1c0d8611a8..5929ecaa1fcd 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -499,7 +499,7 @@ struct msm_gpu_submitqueue {
 	struct msm_file_private *ctx;
 	struct list_head node;
 	struct idr fence_idr;
-	struct mutex idr_lock;
+	struct spinlock idr_lock;
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index c6929e205b51..0e803125a325 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -200,7 +200,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 		*id = queue->id;
 
 	idr_init(&queue->fence_idr);
-	mutex_init(&queue->idr_lock);
+	spin_lock_init(&queue->idr_lock);
 	mutex_init(&queue->lock);
 
 	list_add_tail(&queue->node, &ctx->submitqueues);
-- 
2.39.2

