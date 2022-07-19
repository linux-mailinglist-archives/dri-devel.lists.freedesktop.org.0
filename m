Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC9857A4E0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 19:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0786D90F26;
	Tue, 19 Jul 2022 17:18:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C8190F86;
 Tue, 19 Jul 2022 17:18:47 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id c3so13255428pfb.13;
 Tue, 19 Jul 2022 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AwYCVdrGkHnM2D+4h4BxfmYuAccPj8wFXhKV37+GyLo=;
 b=ZSfDdk6YMZ9Xin72zYX3eWgoVjeyCsNqo4nzrWEtQerLnQeGj7wiD+XdydEuSNBGiM
 AixBzDQDz9V5PL5tQ4STW7Mw9fb7b7vq1IGT7puboqUIyK84PeEKE/gUO/7uaZFUQE5Y
 Z81tah/N3JXlJ30gtWFPqJaW1j/+1FEJG40ZmHhw/qGAYwZgTk9jdCM/f9D/S+ZOQxDl
 SKLBbIG1cqZOK2TRo3kbaOch1HlfqECN6PnborDuNCfKfmQxUpi1stONUoUSWtLYfR0h
 i61xaa3uO0VhOLWj1M1U2Y4cIBjPCU0Q0ioyR6M1lTvD6XbBR7gq0kMWijeLBuZHYwGj
 w/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AwYCVdrGkHnM2D+4h4BxfmYuAccPj8wFXhKV37+GyLo=;
 b=3FKHvAHsbii4SLmyy8nPn1O1P0YLEPXAAQ6Zmy7GsLFQD+80LN3+r65P1C3ju0TFCo
 EeT/OV0VLoTXxhxVpcgyzxVn2t+dSdkNdkIotIiuAC8y7CrVstGbsOvzbaVowIq4j7j/
 eK/vPGE+Nf8PuKYOic9DjA9kHD1vCwX2pmYi+69O6VH9ZogYULXuagLnfIQYQbybPWUU
 jz/juNGXCyXSD3v4OYraABF4JLKHCWquYiUd+TV+uaqJoQAwnsXcsK2KEkESELRsbhFV
 ekToqgyfWdsYztkHtrviu1CNasvkC4o+eZNZuWizo8WYY0nI/R3ItfnZq2TIqbmF5I4e
 Zy3w==
X-Gm-Message-State: AJIora9NXRr9/4DhhBEeWJaWIltQj5Q7FLmWE0cramkCDERAd7DeJZb+
 /hHv83BhZL/ikr7yeJSoxPwbwmyHWZ4=
X-Google-Smtp-Source: AGRyM1vrTXrLejBYmT+gXPQJMxY4GT3MYbQgcVB/BHfFc2lus4Q8+kzsdRFYebbfBQxkcNHsU67MRQ==
X-Received: by 2002:a63:1246:0:b0:41a:58f:9fee with SMTP id
 6-20020a631246000000b0041a058f9feemr14074197pgs.413.1658251126440; 
 Tue, 19 Jul 2022 10:18:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 go18-20020a17090b03d200b001ef87123615sm1995924pjb.37.2022.07.19.10.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jul 2022 10:18:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/msm: Split out idr_lock
Date: Tue, 19 Jul 2022 10:18:47 -0700
Message-Id: <20220719171900.289265-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220719171900.289265-1-robdclark@gmail.com>
References: <20220719171900.289265-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Otherwise if we hit reclaim pinning objects in the submit path, we'll be
blocking retire_worker trying to free a submit.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c         |  4 ++--
 drivers/gpu/drm/msm/msm_gem_submit.c  | 10 ++++++++--
 drivers/gpu/drm/msm/msm_gpu.h         |  4 +++-
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1ed4cd09dbf8..d7ca025457b6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -883,13 +883,13 @@ static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 	 * retired, so if the fence is not found it means there is nothing
 	 * to wait for
 	 */
-	ret = mutex_lock_interruptible(&queue->lock);
+	ret = mutex_lock_interruptible(&queue->idr_lock);
 	if (ret)
 		return ret;
 	fence = idr_find(&queue->fence_idr, fence_id);
 	if (fence)
 		fence = dma_fence_get_rcu(fence);
-	mutex_unlock(&queue->lock);
+	mutex_unlock(&queue->idr_lock);
 
 	if (!fence)
 		return 0;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index c7819781879c..16c662808522 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -72,9 +72,9 @@ void __msm_gem_submit_destroy(struct kref *kref)
 	unsigned i;
 
 	if (submit->fence_id) {
-		mutex_lock(&submit->queue->lock);
+		mutex_lock(&submit->queue->idr_lock);
 		idr_remove(&submit->queue->fence_idr, submit->fence_id);
-		mutex_unlock(&submit->queue->lock);
+		mutex_unlock(&submit->queue->idr_lock);
 	}
 
 	dma_fence_put(submit->user_fence);
@@ -881,6 +881,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit->nr_cmds = i;
 
+	mutex_lock(&queue->idr_lock);
+
 	/*
 	 * If using userspace provided seqno fence, validate that the id
 	 * is available before arming sched job.  Since access to fence_idr
@@ -889,6 +891,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 */
 	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
 			idr_find(&queue->fence_idr, args->fence)) {
+		mutex_unlock(&queue->idr_lock);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -921,6 +924,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 						    submit->user_fence, 1,
 						    INT_MAX, GFP_KERNEL);
 	}
+
+	mutex_unlock(&queue->idr_lock);
+
 	if (submit->fence_id < 0) {
 		ret = submit->fence_id;
 		submit->fence_id = 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4d935fedd2ac..962d2070bcdf 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -466,7 +466,8 @@ static inline int msm_gpu_convert_priority(struct msm_gpu *gpu, int prio,
  * @node:      node in the context's list of submitqueues
  * @fence_idr: maps fence-id to dma_fence for userspace visible fence
  *             seqno, protected by submitqueue lock
- * @lock:      submitqueue lock
+ * @idr_lock:  for serializing access to fence_idr
+ * @lock:      submitqueue lock for serializing submits on a queue
  * @ref:       reference count
  * @entity:    the submit job-queue
  */
@@ -479,6 +480,7 @@ struct msm_gpu_submitqueue {
 	struct msm_file_private *ctx;
 	struct list_head node;
 	struct idr fence_idr;
+	struct mutex idr_lock;
 	struct mutex lock;
 	struct kref ref;
 	struct drm_sched_entity *entity;
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index f486a3cd4e55..c6929e205b51 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -200,6 +200,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 		*id = queue->id;
 
 	idr_init(&queue->fence_idr);
+	mutex_init(&queue->idr_lock);
 	mutex_init(&queue->lock);
 
 	list_add_tail(&queue->node, &ctx->submitqueues);
-- 
2.36.1

