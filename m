Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773765FEADD
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2897610EAB2;
	Fri, 14 Oct 2022 08:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8FD10EA9C;
 Fri, 14 Oct 2022 08:46:57 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id m16so5926311edc.4;
 Fri, 14 Oct 2022 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eE0veYjkgBr87iaYQq4zR5mpS3Yqp029W3jNVEudD0=;
 b=WBdLoIHnjol9DzlkKOxpq6iLOb2+C+znJmEoHy51hh7sjE1+oOigPi98CdLxsf7hJ7
 vQaPcMOVNnoJhjYcBsHVbFI1NNYaszEIQ9i8317muUwieQ73cx9D6xXFlqhkR0e7cM/3
 rT9VgscqGI5KN6Mr6dS6ZZHEcUyPfIJuxC0+IvbyaXf58MnPieRiId6qsrNSRjg3jvn1
 Im9tcGDFQk5yaRyjNsizphGi4CR4xTdMIL8De1A2VYDGHfWZaqx7Z4Vl1FyeicLSeXbg
 0KSOiu+NWhXXOMGaH+ZW4xtP3AcOC7FiTHt9j1M2kNwOVS+81PZC8MtEq1gOWgA5yfPE
 8s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eE0veYjkgBr87iaYQq4zR5mpS3Yqp029W3jNVEudD0=;
 b=BAdHSaHgbTJV7AZ9oSIvIQHHl3VRPkX+FqMgM/W2aUjZtdJW6SyQUfNkSRhixlijhE
 KYfBjJXGyeDpKJW4VgrfgdqTvqvcZRaZ2WUP+lRL4PnzdFaUhDGtDGysVHf1e2XrrRry
 E8Ns456/le00KgbefCOiTAD0WeUHLhydOq8NdLp8NLUektLTVI2UwZuoNJVb36zSsDsz
 oguonvuDuoeZlrKUowUAscMpTJMxsGn5GKzWXmU/Uky+KDJVjw+oY/q+LNvkXtDTfjy9
 uClWxjUpD1XcdVTee2aBHxiXCTMdfwyrR7NXfspwPnSfSJ6rs8r+lxZ3QTzAG2Sl7MIn
 cgGw==
X-Gm-Message-State: ACrzQf01AsaazKTUDOko/v8ODi8R1q2R6LgFxfVPjPgS1u8yanyyeiR5
 TBxUj6dnSfjHg4EpIm1PkLBcdU0y3SY=
X-Google-Smtp-Source: AMsMyM6ywdLi9+r9ZCTGNh8g4/xWcxWM7e7VG8Ca77i2dSaWhdCxnTA/Ju7LM/t2LP3P4LjgLzI+Og==
X-Received: by 2002:a05:6402:1853:b0:459:4e34:2ea5 with SMTP id
 v19-20020a056402185300b004594e342ea5mr3426957edy.191.1665737215553; 
 Fri, 14 Oct 2022 01:46:55 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/13] drm/amdgpu: use scheduler depenencies for CS
Date: Fri, 14 Oct 2022 10:46:38 +0200
Message-Id: <20221014084641.128280-11-christian.koenig@amd.com>
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

Entirely remove the sync obj in the job.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 21 ++++++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h  |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  9 +--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  1 -
 4 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d45b86bcf7fa..0528c2b1db6e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -426,7 +426,7 @@ static int amdgpu_cs_p2_dependencies(struct amdgpu_cs_parser *p,
 			dma_fence_put(old);
 		}
 
-		r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
+		r = amdgpu_sync_fence(&p->sync, fence);
 		dma_fence_put(fence);
 		if (r)
 			return r;
@@ -448,7 +448,7 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
 		return r;
 	}
 
-	r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
+	r = amdgpu_sync_fence(&p->sync, fence);
 	if (r)
 		goto error;
 
@@ -1108,7 +1108,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&job->sync, fpriv->prt_va->last_pt_update);
+	r = amdgpu_sync_fence(&p->sync, fpriv->prt_va->last_pt_update);
 	if (r)
 		return r;
 
@@ -1119,7 +1119,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
 		if (r)
 			return r;
 	}
@@ -1138,7 +1138,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		if (r)
 			return r;
 
-		r = amdgpu_sync_fence(&job->sync, bo_va->last_pt_update);
+		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
 		if (r)
 			return r;
 	}
@@ -1151,7 +1151,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	r = amdgpu_sync_fence(&job->sync, vm->last_update);
+	r = amdgpu_sync_fence(&p->sync, vm->last_update);
 	if (r)
 		return r;
 
@@ -1183,7 +1183,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 {
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
 	unsigned int i;
 	int r;
@@ -1195,14 +1194,14 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 
 		sync_mode = amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
-		r = amdgpu_sync_resv(p->adev, &leader->sync, resv, sync_mode,
+		r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
 				     &fpriv->vm);
 		if (r)
 			return r;
 	}
 
-	for (i = 0; i < p->gang_size - 1; ++i) {
-		r = amdgpu_sync_clone(&leader->sync, &p->jobs[i]->sync);
+	for (i = 0; i < p->gang_size; ++i) {
+		r = amdgpu_sync_push_to_job(&p->sync, p->jobs[i]);
 		if (r)
 			return r;
 	}
@@ -1248,7 +1247,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 		struct dma_fence *fence;
 
 		fence = &p->jobs[i]->base.s_fence->scheduled;
-		r = amdgpu_sync_fence(&leader->sync, fence);
+		r = drm_sched_job_add_dependency(&leader->base, fence);
 		if (r)
 			goto error_cleanup;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
index cbaa19b2b8a3..207e801c24ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h
@@ -75,6 +75,8 @@ struct amdgpu_cs_parser {
 
 	unsigned			num_post_deps;
 	struct amdgpu_cs_post_dep	*post_deps;
+
+	struct amdgpu_sync		sync;
 };
 
 int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index ba98d65835b4..b8494c3b3b8a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -106,7 +106,6 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	(*job)->base.sched = &adev->rings[0]->sched;
 	(*job)->vm = vm;
 
-	amdgpu_sync_create(&(*job)->sync);
 	amdgpu_sync_create(&(*job)->explicit_sync);
 	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
 	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
@@ -174,9 +173,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 
 	drm_sched_job_cleanup(s_job);
 
-	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->explicit_sync);
-
 	dma_fence_put(&job->hw_fence);
 }
 
@@ -202,7 +199,6 @@ void amdgpu_job_free(struct amdgpu_job *job)
 		drm_sched_job_cleanup(&job->base);
 
 	amdgpu_job_free_resources(job);
-	amdgpu_sync_free(&job->sync);
 	amdgpu_sync_free(&job->explicit_sync);
 	if (job->gang_submit != &job->base.s_fence->scheduled)
 		dma_fence_put(job->gang_submit);
@@ -246,10 +242,9 @@ amdgpu_job_dependency(struct drm_sched_job *sched_job,
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
 	struct amdgpu_job *job = to_amdgpu_job(sched_job);
-	struct dma_fence *fence;
+	struct dma_fence *fence = NULL;
 	int r;
 
-	fence = amdgpu_sync_get_fence(&job->sync);
 	while (fence == NULL && job->vm && !job->vmid) {
 		r = amdgpu_vmid_grab(job->vm, ring, job, &fence);
 		if (r)
@@ -273,8 +268,6 @@ static struct dma_fence *amdgpu_job_run(struct drm_sched_job *sched_job)
 	job = to_amdgpu_job(sched_job);
 	finished = &job->base.s_fence->finished;
 
-	BUG_ON(amdgpu_sync_peek_fence(&job->sync, NULL));
-
 	trace_amdgpu_sched_run_job(job);
 
 	/* Skip job if VRAM is lost and never resubmit gangs */
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index 9c10b9bd0084..6558839fda03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -47,7 +47,6 @@ enum amdgpu_ib_pool_type;
 struct amdgpu_job {
 	struct drm_sched_job    base;
 	struct amdgpu_vm	*vm;
-	struct amdgpu_sync	sync;
 	struct amdgpu_sync	explicit_sync;
 	struct dma_fence	hw_fence;
 	struct dma_fence	*gang_submit;
-- 
2.25.1

