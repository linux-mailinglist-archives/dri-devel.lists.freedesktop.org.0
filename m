Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1769D4BE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 21:19:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0E410E7A2;
	Mon, 20 Feb 2023 20:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07D710E7A2;
 Mon, 20 Feb 2023 20:19:30 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id h14so2894806plf.10;
 Mon, 20 Feb 2023 12:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VdB6EdjwMQL5Ibg3VUOmJdReWQo7i7tr5bIvZ40Y+70=;
 b=nN6DNEQkX/s3NAcoshCilQQszrxyjAFA3pfEABOouBtmdv2hr9a8EWn9OyFTTOn1is
 wsp5iZbsB2B25KAj2t5c+u7DMFzqqtYR6ifa6hmq1+2ig4YFIYh7ikNCdQkej1y054ht
 QtbZa8qU4DpXxtjE4YpvEqDU8XNluRXrRHDS+d8Rr8Ev56fIug8fBs1kkGVsa2X9kmk+
 9Btdy49CeZA3JhAw0PJCEi7LCLD1/Fgg0Dj4LccvZyA9HioaLw//vp5nqpiWo/PFeROp
 slfdJyVloTzyreqVmcEzFxyRto/3TANPyM9OEEIWiWHU3qh8dFWAnkt+sK1bRmZs9Dl5
 jYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VdB6EdjwMQL5Ibg3VUOmJdReWQo7i7tr5bIvZ40Y+70=;
 b=vkn6eL+09KAAbM6/ABpOLsSxx2ggHDhNQnGTfMW1MNVv8Rgie4HUqGo7I0CuuXULZ1
 eXWB/Fl7ljEcNTFYmaUtjss8i3jO//0iMJHfz7aR8EZpde0oWGYSsr/bPmcdeRsJjQgj
 g9yGizyhMNmtve4nz9ua/SpefWXadRnnnJqeDTyufdX5EvPXkp72TblABmV/W0QK/8ec
 UqeOmVWSnbkA0sQ6sPek1szw9pp9+OGTqlwne3GajntBqXzwuBIb9B8difHyigcrQka9
 TXh4Jm1lhD8ouRYCvCyolieoGS/UVdJEUQOl8JKkPvxRVwvsqhQrnAY+8b4vZL9V+DwF
 BXBw==
X-Gm-Message-State: AO0yUKVPdMO9cSi9SQrVYeQnKtbJlfGkO65lNIDpNRfmx5sumkXOFxEL
 H7dhMjUmtlAFelRVe9RCy/9moTa/PuQ=
X-Google-Smtp-Source: AK7set+10ywClxtJs9TTsbZ74hiuYpYPx64Pje5euev1rRXiuG7LtSR4TdiTx67SOu7mGT/czxhhRw==
X-Received: by 2002:a17:903:11c4:b0:19a:a43c:41ae with SMTP id
 q4-20020a17090311c400b0019aa43c41aemr5454750plh.25.1676924370134; 
 Mon, 20 Feb 2023 12:19:30 -0800 (PST)
Received: from localhost (c-73-67-135-195.hsd1.or.comcast.net. [73.67.135.195])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a170902a41600b001966d94cb2esm3791564plq.288.2023.02.20.12.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 12:19:29 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 08/14] drm/scheduler: Add fence deadline support
Date: Mon, 20 Feb 2023 12:18:55 -0800
Message-Id: <20230220201916.1822214-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230220201916.1822214-1-robdclark@gmail.com>
References: <20230220201916.1822214-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the finished fence is the one that is exposed to userspace, and
therefore the one that other operations, like atomic update, would
block on, we need to propagate the deadline from from the finished
fence to the actual hw fence.

v2: Split into drm_sched_fence_set_parent() (ckoenig)
v3: Ensure a thread calling drm_sched_fence_set_deadline_finished() sees
    fence->parent set before drm_sched_fence_set_parent() does this
    test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/gpu_scheduler.h             |  8 +++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 7fd869520ef2..43e2d4f5fe3b 100644
--- a/drivers/gpu/drm/scheduler/sched_fence.c
+++ b/drivers/gpu/drm/scheduler/sched_fence.c
@@ -123,6 +123,37 @@ static void drm_sched_fence_release_finished(struct dma_fence *f)
 	dma_fence_put(&fence->scheduled);
 }
 
+static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
+						  ktime_t deadline)
+{
+	struct drm_sched_fence *fence = to_drm_sched_fence(f);
+	struct dma_fence *parent;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fence->lock, flags);
+
+	/* If we already have an earlier deadline, keep it: */
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
+	    ktime_before(fence->deadline, deadline)) {
+		spin_unlock_irqrestore(&fence->lock, flags);
+		return;
+	}
+
+	fence->deadline = deadline;
+	set_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
+
+	spin_unlock_irqrestore(&fence->lock, flags);
+
+	/*
+	 * smp_load_aquire() to ensure that if we are racing another
+	 * thread calling drm_sched_fence_set_parent(), that we see
+	 * the parent set before it calls test_bit(HAS_DEADLINE_BIT)
+	 */
+	parent = smp_load_acquire(&fence->parent);
+	if (parent)
+		dma_fence_set_deadline(parent, deadline);
+}
+
 static const struct dma_fence_ops drm_sched_fence_ops_scheduled = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
@@ -133,6 +164,7 @@ static const struct dma_fence_ops drm_sched_fence_ops_finished = {
 	.get_driver_name = drm_sched_fence_get_driver_name,
 	.get_timeline_name = drm_sched_fence_get_timeline_name,
 	.release = drm_sched_fence_release_finished,
+	.set_deadline = drm_sched_fence_set_deadline_finished,
 };
 
 struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
@@ -147,6 +179,20 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
 }
 EXPORT_SYMBOL(to_drm_sched_fence);
 
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				struct dma_fence *fence)
+{
+	/*
+	 * smp_store_release() to ensure another thread racing us
+	 * in drm_sched_fence_set_deadline_finished() sees the
+	 * fence's parent set before test_bit()
+	 */
+	smp_store_release(&s_fence->parent, dma_fence_get(fence));
+	if (test_bit(DMA_FENCE_FLAG_HAS_DEADLINE_BIT,
+		     &s_fence->finished.flags))
+		dma_fence_set_deadline(fence, s_fence->deadline);
+}
+
 struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
 					      void *owner)
 {
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 4e6ad6e122bc..007f98c48f8d 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1019,7 +1019,7 @@ static int drm_sched_main(void *param)
 		drm_sched_fence_scheduled(s_fence);
 
 		if (!IS_ERR_OR_NULL(fence)) {
-			s_fence->parent = dma_fence_get(fence);
+			drm_sched_fence_set_parent(s_fence, fence);
 			/* Drop for original kref_init of the fence */
 			dma_fence_put(fence);
 
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9db9e5e504ee..8b31a954a44d 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -280,6 +280,12 @@ struct drm_sched_fence {
          */
 	struct dma_fence		finished;
 
+	/**
+	 * @deadline: deadline set on &drm_sched_fence.finished which
+	 * potentially needs to be propagated to &drm_sched_fence.parent
+	 */
+	ktime_t				deadline;
+
         /**
          * @parent: the fence returned by &drm_sched_backend_ops.run_job
          * when scheduling the job on hardware. We signal the
@@ -568,6 +574,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				struct dma_fence *fence);
 struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
-- 
2.39.1

