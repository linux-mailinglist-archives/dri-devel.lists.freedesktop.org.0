Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C77C5EF64C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA87710EA62;
	Thu, 29 Sep 2022 13:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D74110E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:46 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id lh5so2736645ejb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WaqCyx4B0ZMl6fNpVwG9nV5qxREQw0K2dCsB4r1d6hg=;
 b=eRSWSRB5wdcVDQP9f/nSRQXgfTQ3XJfRmEZdxDz/z2tnnWFQJgnxlH/S/1IBn2fkBy
 GYut7ws7xdJ7EGixRVbtCQ9VX5Q5icg27YA/1L5gCldvagMZoNKHoof+FRfRWncHZblP
 JjCNa6wgT5hBcDEVYUVJvvjWpxAQmlRmRYHxoRLuw3FgCe9EgkroSwX87d88bgAtZP6C
 gKiVqgddvawWMAEeurSc7hZXIhKLsXd8F119mevb/fTS6VMiHtD0ZAS0pdVb/fXV5Xsk
 pEqD8M6UXHOHrxnbF54n7FWevCwGBx4SxJbk27GxkMKbC4Z6wv7wPnWdcE8FxNKCXpby
 Vj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WaqCyx4B0ZMl6fNpVwG9nV5qxREQw0K2dCsB4r1d6hg=;
 b=R5r4i4EY4OrIrDszp6kpvjttaNi7QgrqHyev94Iek3iD0nOF/nHAeMM6PhrtEpJm0H
 /stxbjvJJANDSLS/ABabCNdyImtQDjcZFPBu7M8KTR4pXzrWPnGpQK26UdtmpYHbWA2R
 xGOG+Gw7SkrcWyiYR3s3eLcPOybq/8OFQFWI9ho5npJn5I4/xmbK1f42aetOWA3WmXm1
 Trux8xhOW+gQF4MTSfPpMHRJrt4V4yfXoTEN5c+HuWAu6m9kJj9X89J2QFkHZwDrOLuL
 kw9FGLqmeUyqtRzJ+F3JpzIo810Hv4zvqQP4aIpfLTHL9sJzVVv48WOptf3SeOY245/3
 rmVQ==
X-Gm-Message-State: ACrzQf3981K4S9U9YVS0c4KewaF6Y2JH1TXaQH2fNtzu7twBqPcDJNjE
 HIdkixeeWva9oHisOMKfTeoc3l0gzhk=
X-Google-Smtp-Source: AMsMyM77w3qDKMVoC5Z68QzBZmoMETBA5VAuCZ0hhz2HTukzEPkptYxuMLZD4B6ND3tnsMhwYELFUQ==
X-Received: by 2002:a17:907:2d89:b0:781:eff0:9999 with SMTP id
 gt9-20020a1709072d8900b00781eff09999mr2727763ejc.194.1664457704750; 
 Thu, 29 Sep 2022 06:21:44 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] drm/amdgpu: move explicit sync check into the CS
Date: Thu, 29 Sep 2022 15:21:30 +0200
Message-Id: <20220929132136.1715-7-christian.koenig@amd.com>
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

This moves the memory allocation out of the critical code path.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  | 13 ++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c  |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++---------
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.h |  2 +-
 4 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index aa6f6c428dbc..d45b86bcf7fa 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -449,8 +449,19 @@ static int amdgpu_syncobj_lookup_and_add(struct amdgpu_cs_parser *p,
 	}
 
 	r = amdgpu_sync_fence(&p->gang_leader->sync, fence);
-	dma_fence_put(fence);
+	if (r)
+		goto error;
+
+	/*
+	 * When we have an explicit dependency it might be necessary to insert a
+	 * pipeline sync to make sure that all caches etc are flushed and the
+	 * next job actually sees the results from the previous one.
+	 */
+	if (fence->context == p->gang_leader->base.entity->fence_context)
+		r = amdgpu_sync_fence(&p->gang_leader->explicit_sync, fence);
 
+error:
+	dma_fence_put(fence);
 	return r;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
index 258cffe3c06a..774c77bb8f4e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c
@@ -182,7 +182,7 @@ int amdgpu_ib_schedule(struct amdgpu_ring *ring, unsigned num_ibs,
 
 	need_ctx_switch = ring->current_ctx != fence_ctx;
 	if (ring->funcs->emit_pipeline_sync && job &&
-	    ((tmp = amdgpu_sync_get_fence(&job->sched_sync)) ||
+	    ((tmp = amdgpu_sync_get_fence(&job->explicit_sync)) ||
 	     (amdgpu_sriov_vf(adev) && need_ctx_switch) ||
 	     amdgpu_vm_need_pipeline_sync(ring, job))) {
 		need_pipe_sync = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 26e5584e7eea..139b9526072a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -108,7 +108,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	(*job)->vm = vm;
 
 	amdgpu_sync_create(&(*job)->sync);
-	amdgpu_sync_create(&(*job)->sched_sync);
+	amdgpu_sync_create(&(*job)->explicit_sync);
 	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
 	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
 
@@ -176,7 +176,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 	drm_sched_job_cleanup(s_job);
 
 	amdgpu_sync_free(&job->sync);
-	amdgpu_sync_free(&job->sched_sync);
+	amdgpu_sync_free(&job->explicit_sync);
 
 	dma_fence_put(&job->hw_fence);
 }
@@ -204,7 +204,7 @@ void amdgpu_job_free(struct amdgpu_job *job)
 
 	amdgpu_job_free_resources(job);
 	amdgpu_sync_free(&job->sync);
-	amdgpu_sync_free(&job->sched_sync);
+	amdgpu_sync_free(&job->explicit_sync);
 	if (job->gang_submit != &job->base.s_fence->scheduled)
 		dma_fence_put(job->gang_submit);
 
@@ -251,12 +251,6 @@ amdgpu_job_dependency(struct drm_sched_job *sched_job,
 	int r;
 
 	fence = amdgpu_sync_get_fence(&job->sync);
-	if (fence && drm_sched_dependency_optimized(fence, s_entity)) {
-		r = amdgpu_sync_fence(&job->sched_sync, fence);
-		if (r)
-			DRM_ERROR("Error adding fence (%d)\n", r);
-	}
-
 	while (fence == NULL && job->vm && !job->vmid) {
 		r = amdgpu_vmid_grab(job->vm, ring, job, &fence);
 		if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
index f099210c386a..9c10b9bd0084 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
@@ -48,7 +48,7 @@ struct amdgpu_job {
 	struct drm_sched_job    base;
 	struct amdgpu_vm	*vm;
 	struct amdgpu_sync	sync;
-	struct amdgpu_sync	sched_sync;
+	struct amdgpu_sync	explicit_sync;
 	struct dma_fence	hw_fence;
 	struct dma_fence	*gang_submit;
 	uint32_t		preamble_status;
-- 
2.25.1

