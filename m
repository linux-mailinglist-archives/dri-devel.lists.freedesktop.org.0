Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C486E5FEAD7
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D69B10EAA2;
	Fri, 14 Oct 2022 08:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812710E1C0;
 Fri, 14 Oct 2022 08:46:53 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id q19so5891488edd.10;
 Fri, 14 Oct 2022 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCzPSvzm62+DGNQNbI6fhRa34h6F1wlfLXioL0qUlpU=;
 b=odFskqd3ezM5m9GK5vUikcIxRE9kjGu3kZQKGpwkqohWIjc8T6rA175n/9sjcmrJgI
 r84xsfZ4CVw1EqxFe4CqgDf7sx/+f5IsLqyN/IUJOqh6ApgMzas9yXOTHd/mN7JgCtbl
 6hCgEn5xacpCS+cgWCw8qhTM93HtpahZ6GJ9+yulp4hYFNWPdI5ZxmUaCosYb0d1tldY
 3TPunZ+UA8fmf5E0+ghMjXqLBxYIa7yhlf7/Rm9MCozU4c42xV35ePOa/3+a2xa5iH+4
 dpGn40F+D6woPSTRAZa4RQQPhGt1gyhe2CJVZQMOFKKqz2QOrHeWX8jizMAlizpbjiDW
 jRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oCzPSvzm62+DGNQNbI6fhRa34h6F1wlfLXioL0qUlpU=;
 b=asbu0KsDD0TrIGD6rGWt+l/alQWXXnUXy5/MlMwt1ge5O74YXofLRd4V1we7dtBbAh
 /Pi1V7siB7wzhHOxOicR55aHR+WTUj3BCzx8s4g6o4CgPjzxrlH5eNBuMWGolbJV8q9u
 I3AwIRDIiIXND9+6JQ4g7NXZQuKwFvlCl2WVkyZSsqueJQx5D2GDJOag/l6SvW96sU33
 xRHkhzl3wQ1fccCpBtWDQJ49N+Yuva8EH/KyMkj0+uleiAbNqxVKh9WKjrWi90RRrRB4
 JOdvBHz8mEkAqzv/DwK36D8zXfbksB6uxBBtN3PeZBBSbK8ypTQvxAtBJgvxgrRSZt5i
 KvhA==
X-Gm-Message-State: ACrzQf3BfEtksLGOxFTMixWKScIBHTVo4hCE5T6DkFetR0+EYO71pci9
 9blCt/EoWUu+EHVLZ0Z0IaGpeXHUXSM=
X-Google-Smtp-Source: AMsMyM5rL4U4nZjglxq9kK+zEaBlDvVSJcH8+LIIXvzLD6os4tepYwA6V5/EBX97jmbgTuokTGL8QA==
X-Received: by 2002:a05:6402:440c:b0:43a:1124:e56a with SMTP id
 y12-20020a056402440c00b0043a1124e56amr3428394eda.134.1665737212525; 
 Fri, 14 Oct 2022 01:46:52 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/13] drm/amdgpu: move explicit sync check into the CS
Date: Fri, 14 Oct 2022 10:46:35 +0200
Message-Id: <20221014084641.128280-8-christian.koenig@amd.com>
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
index 5c69461ab3e0..ba98d65835b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -107,7 +107,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	(*job)->vm = vm;
 
 	amdgpu_sync_create(&(*job)->sync);
-	amdgpu_sync_create(&(*job)->sched_sync);
+	amdgpu_sync_create(&(*job)->explicit_sync);
 	(*job)->vram_lost_counter = atomic_read(&adev->vram_lost_counter);
 	(*job)->vm_pd_addr = AMDGPU_BO_INVALID_OFFSET;
 
@@ -175,7 +175,7 @@ static void amdgpu_job_free_cb(struct drm_sched_job *s_job)
 	drm_sched_job_cleanup(s_job);
 
 	amdgpu_sync_free(&job->sync);
-	amdgpu_sync_free(&job->sched_sync);
+	amdgpu_sync_free(&job->explicit_sync);
 
 	dma_fence_put(&job->hw_fence);
 }
@@ -203,7 +203,7 @@ void amdgpu_job_free(struct amdgpu_job *job)
 
 	amdgpu_job_free_resources(job);
 	amdgpu_sync_free(&job->sync);
-	amdgpu_sync_free(&job->sched_sync);
+	amdgpu_sync_free(&job->explicit_sync);
 	if (job->gang_submit != &job->base.s_fence->scheduled)
 		dma_fence_put(job->gang_submit);
 
@@ -250,12 +250,6 @@ amdgpu_job_dependency(struct drm_sched_job *sched_job,
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

