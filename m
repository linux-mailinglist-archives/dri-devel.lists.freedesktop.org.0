Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 210535EF65F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7533910EA6A;
	Thu, 29 Sep 2022 13:23:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB1410E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:52 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id sd10so2793754ejc.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=O6G/jlhP0pScogU1Ie7r8eWmzR1pGWot/0ldJplXsr4=;
 b=R7Mpjm17rTzHhZT3L0BPTengcktM0r1rGt3F14FRI+a+kUShdIXGAmX9krt+vEiAv3
 6k9ZCszjtBBmNglL0FqZd95Mo5YFqAy87F/CkkCEl0xg8qGDfDe+D4IwxMlI4fEopeCA
 LBCBKCswbx/t0tiO2rKoePjI0TGb8RhnLDLtUSJeWZ6EcdxGZaWUOOI7fXN4X7ky60dz
 Y4LV9+MrwJCUMU/kvdJLpsepArotzeUe2EcObw77LDXn+wmKMacDvfxGi5IWg962+zn2
 9jcMVcfczkPt6MLUOPeZbrybHs9wmyzHQSWPk/AqbUdxU9tq4l3IqtVrQdaYaKPAodhD
 0MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=O6G/jlhP0pScogU1Ie7r8eWmzR1pGWot/0ldJplXsr4=;
 b=6+hXDKJkT7bBrXhsqWS9dueymS38Rdc7AJxEIMArpJsRjoMj3dE5M93+MLZn1czHov
 LSY1p85IkJ8WfgJZ8aRSDLwfls9nM8/H1TFkdLlqhT5g/0M7NpSIKpNPu6JPThQ+LqoA
 gQLdoz3UD0B+S5zZlhJN2iIOskS3aH9swOSwHEGwm0p7wHVA0FI/xAQuSreBvYA3YsLk
 HVOeQC2TqnE37ZZAZTv1V6y03wAE/wMAOBsO6ZzEOXfpN1ZpBrYk/jMScXZKLX5PlpW5
 srqsjWlNg5N6CggWBtrdAmcGV/Q49525CHjbYnffssAwhGXyvTxVn9536AzEDo0ooTpO
 jGmQ==
X-Gm-Message-State: ACrzQf0ULVxYEN6s1qsD1fmWlXN0z1QmjBRZl86oz7F3X0IOR2GBVzG/
 Rh+khgWwcNo1JpbdrlrYOIlmzG9Sr1Q=
X-Google-Smtp-Source: AMsMyM4P8xBOMC7q2GyGKY5D4hOKSyh8lnu2XwkqW5wA0T8Z4qwXUYPbN46iv3v06LjLiN+Udeu7tg==
X-Received: by 2002:a17:907:6d08:b0:787:9027:cb8d with SMTP id
 sa8-20020a1709076d0800b007879027cb8dmr2845529ejc.396.1664457710963; 
 Thu, 29 Sep 2022 06:21:50 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/13] drm/scheduler: rename dependency callback into
 prepare_job
Date: Thu, 29 Sep 2022 15:21:36 +0200
Message-Id: <20220929132136.1715-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929132136.1715-1-christian.koenig@amd.com>
References: <20220929132136.1715-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: shansheng.wang@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 luben.tuikov@amd.com, WenChieh.Chien@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This now matches much better what this is doing.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  4 ++--
 drivers/gpu/drm/scheduler/sched_entity.c |  4 ++--
 include/drm/gpu_scheduler.h              | 13 ++++++-------
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 98e05f16cd55..7176b18f664f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -238,7 +238,7 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 }
 
 static struct dma_fence *
-amdgpu_job_dependency(struct drm_sched_job *sched_job,
+amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
 		      struct drm_sched_entity *s_entity)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
@@ -327,7 +327,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 }
 
 const struct drm_sched_backend_ops amdgpu_sched_ops = {
-	.dependency = amdgpu_job_dependency,
+	.prepare_job = amdgpu_job_prepare_job,
 	.run_job = amdgpu_job_run,
 	.timedout_job = amdgpu_job_timedout,
 	.free_job = amdgpu_job_free_cb
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 1d448e376811..45b10ee0c12f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -396,8 +396,8 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 	if (!xa_empty(&job->dependencies))
 		return xa_erase(&job->dependencies, job->last_dependency++);
 
-	if (job->sched->ops->dependency)
-		return job->sched->ops->dependency(job, entity);
+	if (job->sched->ops->prepare_job)
+		return job->sched->ops->prepare_job(job, entity);
 
 	return NULL;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 5f51eef2a835..5a790d0a0009 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -297,7 +297,7 @@ struct drm_sched_job {
 	 */
 	union {
 		struct dma_fence_cb		finish_cb;
-		struct irq_work 		work;
+		struct irq_work			work;
 	};
 
 	uint64_t			id;
@@ -338,18 +338,17 @@ enum drm_gpu_sched_stat {
  */
 struct drm_sched_backend_ops {
 	/**
-	 * @dependency:
+	 * @prepare_job:
 	 *
 	 * Called when the scheduler is considering scheduling this job next, to
 	 * get another struct dma_fence for this job to block on.  Once it
 	 * returns NULL, run_job() may be called.
 	 *
-	 * If a driver exclusively uses drm_sched_job_add_dependency() and
-	 * drm_sched_job_add_implicit_dependencies() this can be ommitted and
-	 * left as NULL.
+	 * Can be NULL if no additional preparation to the dependencies are
+	 * necessary. Skipped when jobs are killed instead of run.
 	 */
-	struct dma_fence *(*dependency)(struct drm_sched_job *sched_job,
-					struct drm_sched_entity *s_entity);
+	struct dma_fence *(*prepare_job)(struct drm_sched_job *sched_job,
+					 struct drm_sched_entity *s_entity);
 
 	/**
          * @run_job: Called to execute the job once all of the dependencies
-- 
2.25.1

