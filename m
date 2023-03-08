Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0D06B0DA6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C89AE10E67A;
	Wed,  8 Mar 2023 15:54:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F47710E636;
 Wed,  8 Mar 2023 15:53:46 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so2167438pja.5; 
 Wed, 08 Mar 2023 07:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678290826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FdZM2bQRNwa1qcVqryWJAziEM2ygsksBglmShB2WnC4=;
 b=YDW7fVhkTwpq87YFT4oH+hTu8eusbLJg718HS+eUlMyCL3h/9/BKrngm6Koqo1bkGM
 GZGk0n2tn07kyKxrhhfbz7kczcGTsn54qwQX9k6ijfcDekxZtFceuV/zghKMS0rl4uW0
 eSLIqiD4PcPnQ3UVuDFTFra1iDn56mXjGyz3FVHcf8vlf/Y8RKNxAEWFmF1KCnCVsxRg
 CbsKJOXzt/MuoKu/+UO2aXF7J/gnGWnjykTuxxP44QARRnCK40KJHvr6RUYsEqzTA1Nv
 VgNz/SP74hwCL2ed/M6H68yWoyqkbANk5XNEyCXN70pJcBYHUrf+4YwlNtFKf9nTfpaP
 Jv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678290826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FdZM2bQRNwa1qcVqryWJAziEM2ygsksBglmShB2WnC4=;
 b=f+IYZaEdVJNAwH3wEP3g8JHcNSGq+gQqRTSdIv3Ax6s80mQ3JACoXHhV7FzdW/nbfQ
 K3DshD6fHMY11nH24XW70OwZpCUKpyYtNksGbaNkW2yCyutel6UhjoikV6DQWjTRIMsE
 a2KzjqX5osqqtqPHPhiKE9IkhxtVMmSd74pWCkP2Ix3DVXtVs77NLkORuCi4ZWqPxXod
 3IoJmT/PVSMh5ERlK6TF2JGTvYdlOl0OhYK1daT+Aurnl/RBIRs2dTaN74vQNUH6J4GU
 G9Jsl7cHHDcuWrtcaMqmWK9r41tKuxL0dZxl1iNTSytUF6aYZX9xuvOqSwjeT8jxKrZK
 gHHA==
X-Gm-Message-State: AO0yUKXK+BU/Y+jSKrlSHpmlogTIOF0Bxt1YhZBCCtY9RVzDcOSo2k0I
 4a0oicXHsbvC6ymfVgfWoxkRDDEdOio=
X-Google-Smtp-Source: AK7set+fc1O6dVTJALjF8KxBjDX8QjYKrssQCBS6WWfjo4bk4SZdaGu9094w1BwUwBPR6ftcMjlZUA==
X-Received: by 2002:a17:90b:1a87:b0:230:bb46:787d with SMTP id
 ng7-20020a17090b1a8700b00230bb46787dmr19538139pjb.37.1678290825955; 
 Wed, 08 Mar 2023 07:53:45 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 w64-20020a17090a6bc600b00233acae2ce6sm10719021pjj.23.2023.03.08.07.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 07:53:45 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v10 08/15] drm/scheduler: Add fence deadline support
Date: Wed,  8 Mar 2023 07:52:59 -0800
Message-Id: <20230308155322.344664-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308155322.344664-1-robdclark@gmail.com>
References: <20230308155322.344664-1-robdclark@gmail.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Turner <mattst88@gmail.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
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
Acked-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/scheduler/sched_fence.c | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/scheduler/sched_main.c  |  2 +-
 include/drm/gpu_scheduler.h             | 17 +++++++++
 3 files changed, 64 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
index 7fd869520ef2..fe9c6468e440 100644
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
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
+	    ktime_before(fence->deadline, deadline)) {
+		spin_unlock_irqrestore(&fence->lock, flags);
+		return;
+	}
+
+	fence->deadline = deadline;
+	set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
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
+	if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT,
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
index 9db9e5e504ee..99584e457153 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -41,6 +41,15 @@
  */
 #define DRM_SCHED_FENCE_DONT_PIPELINE	DMA_FENCE_FLAG_USER_BITS
 
+/**
+ * DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT - A fence deadline hint has been set
+ *
+ * Because we could have a deadline hint can be set before the backing hw
+ * fence is created, we need to keep track of whether a deadline has already
+ * been set.
+ */
+#define DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT	(DMA_FENCE_FLAG_USER_BITS + 1)
+
 enum dma_resv_usage;
 struct dma_resv;
 struct drm_gem_object;
@@ -280,6 +289,12 @@ struct drm_sched_fence {
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
@@ -568,6 +583,8 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
 				   enum drm_sched_priority priority);
 bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
 
+void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
+				struct dma_fence *fence);
 struct drm_sched_fence *drm_sched_fence_alloc(
 	struct drm_sched_entity *s_entity, void *owner);
 void drm_sched_fence_init(struct drm_sched_fence *fence,
-- 
2.39.2

