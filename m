Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD16C5989
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 23:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A980A10E41B;
	Wed, 22 Mar 2023 22:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2421F10E41B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 22:44:17 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id d13so19885777pjh.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 15:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679525056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u7IFLnv2wp+6+M4RDOrDXlUdlj/4yQHYPm5exES9iSg=;
 b=d0r7ofq5hY83b1KFqtk/khmAPHfvgWyeyA3MONIOqMO+HDlgKrSCSYHRBu9oUUxNh0
 j4EqAQFrGaB9BN7ZmZnfRLFB26ZpAiJMEJnoQxyJHli0iP9bAT/iH7DVxyRFGD+bJPKJ
 SLBipXnpy6bZPQzbq/pKSi5ySkL0ewxUDi0/JHUXGcSOfS9ASAUCHoG5N3dKZR5lmYBn
 8pDDQWpd8Og5i0XCV/oMlJ/mbTeh2P7zzsGjJeagqUcCa97pbKfSObAs2UtIl33p5/EE
 GHfsN5IyZuIzig3G4q4KZLyOfHa48jwasgb2TM9tordUu7H8Qafj78GDSaI4JfkXej/f
 28qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679525056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u7IFLnv2wp+6+M4RDOrDXlUdlj/4yQHYPm5exES9iSg=;
 b=oInp1juqi4V6rjx64txAOBA17xaenGoYfgvj45wKLcOD8OjQ/IamdKboly7KKZ1SIX
 UN0Ndge5cbTrjF8Z3bQbBnPQ1iCDz8d9kd1XTn5mvz3Ku5hVkLcRpi3Mi+ZuYSe2eIOI
 jXtQ6lHYudAxD+sFGf1T6PoFwgmrSBZGSXUFsAmfl/FeeTh2Na8IljAM60cuImsCkvET
 MV0y0VptnY/HX0kqXnlWMk5TyBuFpBtU4mbd2fELBXlQ0w77TfsuDe3a8gzc3QvAOSYv
 qI5vskY5neTXYvGVyOeQ93F6seSjgdciTQwYMRAbK5BkfX8drFySi2ulS1W9TQaRSdkF
 sxqg==
X-Gm-Message-State: AO0yUKV7e3j5Qzo3tmnd51/vXIcmtkilS5VTJjiGivA4+FK4KYFU5dhW
 Picg/O+RYC7JsdCiyQjreaQOEzxMhec=
X-Google-Smtp-Source: AK7set/xDVFAvIS+FUJS6LFPnzBnvslEhWBhH930+MmTO6iZlkSX7t7YHlarHpTIx2aAUAoJOtOaRQ==
X-Received: by 2002:a17:90b:3803:b0:234:a9df:db96 with SMTP id
 mq3-20020a17090b380300b00234a9dfdb96mr5338431pjb.33.1679525056271; 
 Wed, 22 Mar 2023 15:44:16 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1709026b8500b001a1aeb3a7a9sm9798689plk.137.2023.03.22.15.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 15:44:15 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC] drm/scheduler: Unwrap job dependencies
Date: Wed, 22 Mar 2023 15:44:03 -0700
Message-Id: <20230322224403.35742-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Container fences have burner contexts, which makes the trick to store at
most one fence per context somewhat useless if we don't unwrap array or
chain fences.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
tbh, I'm not sure why we weren't doing this already, unless there is
something I'm overlooking

 drivers/gpu/drm/scheduler/sched_main.c | 43 +++++++++++++++++---------
 1 file changed, 28 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c2ee44d6224b..f59e5335afbb 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -41,20 +41,21 @@
  * 4. Entities themselves maintain a queue of jobs that will be scheduled on
  *    the hardware.
  *
  * The jobs in a entity are always scheduled in the order that they were pushed.
  */
 
 #include <linux/kthread.h>
 #include <linux/wait.h>
 #include <linux/sched.h>
 #include <linux/completion.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/dma-resv.h>
 #include <uapi/linux/sched/types.h>
 
 #include <drm/drm_print.h>
 #include <drm/drm_gem.h>
 #include <drm/gpu_scheduler.h>
 #include <drm/spsc_queue.h>
 
 #define CREATE_TRACE_POINTS
 #include "gpu_scheduler_trace.h"
@@ -665,41 +666,27 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	sched = entity->rq->sched;
 
 	job->sched = sched;
 	job->s_priority = entity->rq - sched->sched_rq;
 	job->id = atomic64_inc_return(&sched->job_id_count);
 
 	drm_sched_fence_init(job->s_fence, job->entity);
 }
 EXPORT_SYMBOL(drm_sched_job_arm);
 
-/**
- * drm_sched_job_add_dependency - adds the fence as a job dependency
- * @job: scheduler job to add the dependencies to
- * @fence: the dma_fence to add to the list of dependencies.
- *
- * Note that @fence is consumed in both the success and error cases.
- *
- * Returns:
- * 0 on success, or an error on failing to expand the array.
- */
-int drm_sched_job_add_dependency(struct drm_sched_job *job,
-				 struct dma_fence *fence)
+static int _add_dependency(struct drm_sched_job *job, struct dma_fence *fence)
 {
 	struct dma_fence *entry;
 	unsigned long index;
 	u32 id = 0;
 	int ret;
 
-	if (!fence)
-		return 0;
-
 	/* Deduplicate if we already depend on a fence from the same context.
 	 * This lets the size of the array of deps scale with the number of
 	 * engines involved, rather than the number of BOs.
 	 */
 	xa_for_each(&job->dependencies, index, entry) {
 		if (entry->context != fence->context)
 			continue;
 
 		if (dma_fence_is_later(fence, entry)) {
 			dma_fence_put(entry);
@@ -709,20 +696,46 @@ int drm_sched_job_add_dependency(struct drm_sched_job *job,
 		}
 		return 0;
 	}
 
 	ret = xa_alloc(&job->dependencies, &id, fence, xa_limit_32b, GFP_KERNEL);
 	if (ret != 0)
 		dma_fence_put(fence);
 
 	return ret;
 }
+
+/**
+ * drm_sched_job_add_dependency - adds the fence as a job dependency
+ * @job: scheduler job to add the dependencies to
+ * @fence: the dma_fence to add to the list of dependencies.
+ *
+ * Note that @fence is consumed in both the success and error cases.
+ *
+ * Returns:
+ * 0 on success, or an error on failing to expand the array.
+ */
+int drm_sched_job_add_dependency(struct drm_sched_job *job,
+				 struct dma_fence *fence)
+{
+	struct dma_fence_unwrap iter;
+	struct dma_fence *f;
+	int ret = 0;
+
+	dma_fence_unwrap_for_each (f, &iter, fence) {
+		ret = _add_dependency(job, f);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
 EXPORT_SYMBOL(drm_sched_job_add_dependency);
 
 /**
  * drm_sched_job_add_resv_dependencies - add all fences from the resv to the job
  * @job: scheduler job to add the dependencies to
  * @resv: the dma_resv object to get the fences from
  * @usage: the dma_resv_usage to use to filter the fences
  *
  * This adds all fences matching the given usage from @resv to @job.
  * Must be called with the @resv lock held.
-- 
2.39.2

