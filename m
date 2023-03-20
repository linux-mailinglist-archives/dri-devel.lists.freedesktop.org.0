Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA676C1551
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB1410E5BC;
	Mon, 20 Mar 2023 14:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D5710E5B8;
 Mon, 20 Mar 2023 14:45:18 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id y19so6723063pgk.5;
 Mon, 20 Mar 2023 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oauBr8L/4q4Zcgdj0lHO6PXlptkvS9AYRCFUFpLRYaw=;
 b=W0rr2Cqq8hYbPCTku8RNPwzAfVaC1WEIRqg/Jo/IaQ3jvSFgpYQ8herChIJi7syMJ5
 YIfI8bLz+etpsyzlOr+ptGN7aE4yv3qQncLdwK43FM6YBwMvLv2nGuzW75q86R0a+YAr
 /BdXDMgQTi9jJFtm5pTOw4gXpkvXIjjdQ3m0/xGK4graIJcbepoylaU8+L3vUi3eQAwo
 mtSrja7NmvnQcnDLmqflMFRZ/y0KW5yPJuyn1li/3tS0CJzypeUbWgn9VKnIYHVcT7zk
 uSs37Ij8K4IFmzBssfj5JXRk9yXHeRHiK+Cxe3xgHa7l3E0jYsSkcDMjuztlg2g3IcnX
 4Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323518;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oauBr8L/4q4Zcgdj0lHO6PXlptkvS9AYRCFUFpLRYaw=;
 b=Jw5vtUCfrnuthuXSiLGp/ayt1axj+0RFbavHwNbBdKmDsnqdGl6UitlWz33y51qKTv
 Tgduuibng6QvkyXoL36zi9oZ7nWdhq3oOSCU5Tx4x6NVS08NM0doUeYutwlW3lyg3apL
 jyigz+Hua5/EfQoa6D6UVA8Gd3rkjNRqlG6e9iQQhSA/Y4xFkns0i4XZNo1SszYeYFKV
 ucl3P0mSfrtk5jmJo9umJ0MHS2to8znAlGTIA+a+aQsrM0yXpvWQx+spLk/gw9T9ZSI6
 qo8xXsXoqAczarVaHgvEP/WkfJGmKvjJEukvY4kD/oQZ2ak2FsOKkEwxF6NQXzXac0iY
 2gLQ==
X-Gm-Message-State: AO0yUKW1YWTPZG38HwULHILIPk2rtd5lRt1/GoNOT3sVKunW6J9o/MM8
 TP92SUBj1yattJHcbgYcUc2NrJfheak=
X-Google-Smtp-Source: AK7set9yi2RN2vxR93mdgHSZKeyGB3sxPREYIvUl6fxuZOWrBiOHFnCQYgj8gj4DknW3GheF00DOIw==
X-Received: by 2002:a62:1a05:0:b0:5a8:9858:750a with SMTP id
 a5-20020a621a05000000b005a89858750amr13197023pfa.13.1679323517814; 
 Mon, 20 Mar 2023 07:45:17 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 j24-20020aa78018000000b006245e034059sm6618112pfi.178.2023.03.20.07.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:45:17 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 23/23] drm/sched: Add (optional) fence signaling annotation
Date: Mon, 20 Mar 2023 07:43:45 -0700
Message-Id: <20230320144356.803762-24-robdclark@gmail.com>
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
 Luben Tuikov <luben.tuikov@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Based on
https://lore.kernel.org/dri-devel/20200604081224.863494-10-daniel.vetter@ffwll.ch/
but made to be optional.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c   | 1 +
 drivers/gpu/drm/scheduler/sched_main.c | 9 +++++++++
 include/drm/gpu_scheduler.h            | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index b60199184409..7e42baf16cd0 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -93,6 +93,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
+	ring->sched.fence_signaling = true;
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
 			num_hw_submissions, 0, sched_timeout,
 			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4e6ad6e122bc..c2ee44d6224b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -978,10 +978,15 @@ static bool drm_sched_blocked(struct drm_gpu_scheduler *sched)
 static int drm_sched_main(void *param)
 {
 	struct drm_gpu_scheduler *sched = (struct drm_gpu_scheduler *)param;
+	const bool fence_signaling = sched->fence_signaling;
+	bool fence_cookie;
 	int r;
 
 	sched_set_fifo_low(current);
 
+	if (fence_signaling)
+		fence_cookie = dma_fence_begin_signalling();
+
 	while (!kthread_should_stop()) {
 		struct drm_sched_entity *entity = NULL;
 		struct drm_sched_fence *s_fence;
@@ -1039,6 +1044,10 @@ static int drm_sched_main(void *param)
 
 		wake_up(&sched->job_scheduled);
 	}
+
+	if (fence_signaling)
+		dma_fence_end_signalling(fence_cookie);
+
 	return 0;
 }
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9db9e5e504ee..8f23ea522e22 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -483,6 +483,7 @@ struct drm_sched_backend_ops {
  * @ready: marks if the underlying HW is ready to work
  * @free_guilty: A hit to time out handler to free the guilty job.
  * @dev: system &struct device
+ * @fence_signaling: Opt in to fence signaling annotations
  *
  * One scheduler is implemented for each hardware ring.
  */
@@ -507,6 +508,7 @@ struct drm_gpu_scheduler {
 	bool				ready;
 	bool				free_guilty;
 	struct device			*dev;
+	bool 				fence_signaling;
 };
 
 int drm_sched_init(struct drm_gpu_scheduler *sched,
-- 
2.39.2

