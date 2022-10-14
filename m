Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC955FEAE5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5266D10EABD;
	Fri, 14 Oct 2022 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E9C10EAA1;
 Fri, 14 Oct 2022 08:46:59 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id k2so9030140ejr.2;
 Fri, 14 Oct 2022 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBqyX0ZmcWTsM5pad6Ti/0zdOrcVF4A9VjvTgy3v7Ek=;
 b=eDyRasRS9L6wcWv2izcla5i/voyZrGnLOVKoSJ+amw8g7vVfkY/dYFF840diqy2WXc
 jLTYRaGUAJs4n+w4lv7hkqhcqsaQ+1G+01jMrw56QmauBlLDhdiF4yPrINgLOvNqW1LT
 rSmKcOif5DBWRfbA56i4RB4p0nAR1HdUEtSJfn7X9Gxpgd3Sqsjbakz6dR1xHJBsRyRl
 WQFSLymqegn3OejaxHjFnZBy1n8ZcjOXyfuzbAZb8unZxL4UiBNH5RAgOTqTDGaV7OtZ
 rAmkDSLWM7Er2ck3v7nN2dJmCcEeLuYvcvIu+L1FPI4/M4aCHurMYH3ArzFoJWxfXzNZ
 U9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iBqyX0ZmcWTsM5pad6Ti/0zdOrcVF4A9VjvTgy3v7Ek=;
 b=IQJPdL+O091yNZWkduCUmN/9evyvBeh7pwYW5r9awmqZj73UiVy6w6FigdKhk8lcpU
 +OeN2uiAU512iUZ62v1lOrR/xNiOQ+b+luZ98xFqSqjKF3aKZM8lOfYIfNBfRFPwmE9S
 gAXuzxRqlTJF+kF3O4qReJdJ0Yx/kK+J0+cVt96AeavBw107AbXAwWkNqabi1xB27wSC
 Sx6tyUwwdzpG96YofqAbVeZtZ+qoJAcFhs/rfe4blZ9vVqMDisJu+AsjonFP1kTZo1+7
 EDsGUh44q+G3DohiCbS4Q4MicCjTlo3GFMoQ9jGezIyDdpJFIt8F5fVnNQ9rcjUtOqMT
 ef/w==
X-Gm-Message-State: ACrzQf0bOyJysTwBthULgtE+KJ2US5t8QE0AWOwDlTmviYJ/eLxqnbSY
 UMDV7w+bLn50g4v0ZDr+6+Vd4P/7iic=
X-Google-Smtp-Source: AMsMyM6eF3pGqAm7w/nY8Y/rQTAyfej8KmyUfHJ0wBKSSOC0jmsKj60Bql0MtlL+biTnPfMUy/YEgw==
X-Received: by 2002:a17:907:6d18:b0:78e:259d:c391 with SMTP id
 sa24-20020a1709076d1800b0078e259dc391mr1511214ejc.615.1665737218788; 
 Fri, 14 Oct 2022 01:46:58 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 13/13] drm/scheduler: rename dependency callback into
 prepare_job
Date: Fri, 14 Oct 2022 10:46:41 +0200
Message-Id: <20221014084641.128280-14-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014084641.128280-1-christian.koenig@amd.com>
References: <20221014084641.128280-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
index b8494c3b3b8a..1c4a13693653 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -237,7 +237,7 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 }
 
 static struct dma_fence *
-amdgpu_job_dependency(struct drm_sched_job *sched_job,
+amdgpu_job_prepare_job(struct drm_sched_job *sched_job,
 		      struct drm_sched_entity *s_entity)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
@@ -326,7 +326,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 }
 
 const struct drm_sched_backend_ops amdgpu_sched_ops = {
-	.dependency = amdgpu_job_dependency,
+	.prepare_job = amdgpu_job_prepare_job,
 	.run_job = amdgpu_job_run,
 	.timedout_job = amdgpu_job_timedout,
 	.free_job = amdgpu_job_free_cb
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 54ac37cd5017..cf68cd1559ec 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -397,8 +397,8 @@ drm_sched_job_dependency(struct drm_sched_job *job,
 	if (!xa_empty(&job->dependencies))
 		return xa_erase(&job->dependencies, job->last_dependency++);
 
-	if (job->sched->ops->dependency)
-		return job->sched->ops->dependency(job, entity);
+	if (job->sched->ops->prepare_job)
+		return job->sched->ops->prepare_job(job, entity);
 
 	return NULL;
 }
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index b1698819ad38..163385e15597 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -306,7 +306,7 @@ struct drm_sched_job {
 	 */
 	union {
 		struct dma_fence_cb		finish_cb;
-		struct irq_work 		work;
+		struct irq_work			work;
 	};
 
 	uint64_t			id;
@@ -347,18 +347,17 @@ enum drm_gpu_sched_stat {
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

