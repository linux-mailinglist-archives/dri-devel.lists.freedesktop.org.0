Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D205FEAD9
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6764010EAA6;
	Fri, 14 Oct 2022 08:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32ED910E1C0;
 Fri, 14 Oct 2022 08:46:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m15so5880630edb.13;
 Fri, 14 Oct 2022 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PHCWE0aCB3ElIJ6SsiFNbfcvWnwL4NkVRoOEsjD7AsQ=;
 b=PCQiX7ys5VfHO9Hpp75AYcxbnizNjTQEeHKFda5DS0EszwW29sRXkSUHR+vFco/HcE
 GxocSKAGk9ucL1giE5kX5hQbpwhD3HOsP72R9wGVkbZHlgV9ztyiZGbCTpzavkjNeafB
 iXtFia/E9IV7pKQkkOVBNfhBXsGMU3d/bwyvtT3BXaRWdzXRCOxSXTrsjwKNz8K6fH6S
 fgKW2tvFN98QtBkvIs1i9WAsrDxwrkjIUSlGu6SV7FWKf3tXLHiJoYl69LvKme7ZalnW
 nZ2k3qN5w+1G8vamn+C1mfbEMaa9iuYMW/7IZOc0pYbZv8DngO2ExpNlYhZUSiB5EU8Q
 kxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PHCWE0aCB3ElIJ6SsiFNbfcvWnwL4NkVRoOEsjD7AsQ=;
 b=12xZmTVo82Z9eJQkQlQKhJWDBju2OoOYQ2rSc+wWvF8HJQRJbZa+oEBRtMXE0dl4YX
 /NnxunfNOOeqZ6ZuDRiYcTtRwH/D6KlRLmZZhQYvQFcdMQvGKH1Q85cB0hDtje5Gwb+k
 x/fPcvy0KG8vL3PfSO8NWNzte7EI/wr60ZchSVsEJapuVJMCucGz5njWpy5hyB33UmXt
 +q8YE3gaJkYqX8KYPLR/MVw1beiRvnNYJGu7DdEzkfa6ZLvuTdd/iGhgamtGUNpmJXHn
 qs7oVWmmQJMHdobczpH25lGLcEC8pfITXyTtFMFdFEADdvSCSXIgcPAx1Gl8nM7MZwz/
 2hCw==
X-Gm-Message-State: ACrzQf163vXup/cWyxciNLBVtd9dfKB77oT6ClJV+ZKOj2w3a3D5n2GU
 hiqJFn2TAZQFIEm/N3t9PZnfRddaSF8=
X-Google-Smtp-Source: AMsMyM4pY/8eUc//xnH238yHci/Dhny91mrwxRm8fUyuEGzLKdGhFzu98nZD06t39BC2lRUuH3sB2g==
X-Received: by 2002:a05:6402:538a:b0:457:b602:d5a6 with SMTP id
 ew10-20020a056402538a00b00457b602d5a6mr3381406edb.371.1665737210165; 
 Fri, 14 Oct 2022 01:46:50 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:49 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 05/13] drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab
Date: Fri, 14 Oct 2022 10:46:33 +0200
Message-Id: <20221014084641.128280-6-christian.koenig@amd.com>
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

Instead return the fence directly. Avoids memory allocation to store the
fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 42 +++++++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 12 +++----
 3 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index b76294d4275b..2a9a2593dc18 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -170,26 +170,27 @@ bool amdgpu_vmid_had_gpu_reset(struct amdgpu_device *adev,
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
- * @sync: sync object where we add dependencies
  * @idle: resulting idle VMID
+ * @fence: fence to wait for if no id could be grabbed
  *
  * Try to find an idle VMID, if none is idle add a fence to wait to the sync
  * object. Returns -ENOMEM when we are out of memory.
  */
 static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 				 struct amdgpu_ring *ring,
-				 struct amdgpu_sync *sync,
-				 struct amdgpu_vmid **idle)
+				 struct amdgpu_vmid **idle,
+				 struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned vmhub = ring->funcs->vmhub;
 	struct amdgpu_vmid_mgr *id_mgr = &adev->vm_manager.id_mgr[vmhub];
 	struct dma_fence **fences;
 	unsigned i;
-	int r;
 
-	if (!dma_fence_is_signaled(ring->vmid_wait))
-		return amdgpu_sync_fence(sync, ring->vmid_wait);
+	if (!dma_fence_is_signaled(ring->vmid_wait)) {
+		*fence = dma_fence_get(ring->vmid_wait);
+		return 0;
+	}
 
 	fences = kmalloc_array(id_mgr->num_ids, sizeof(void *), GFP_KERNEL);
 	if (!fences)
@@ -228,10 +229,10 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 			return -ENOMEM;
 		}
 
-		r = amdgpu_sync_fence(sync, &array->base);
+		*fence = dma_fence_get(&array->base);
 		dma_fence_put(ring->vmid_wait);
 		ring->vmid_wait = &array->base;
-		return r;
+		return 0;
 	}
 	kfree(fences);
 
@@ -243,17 +244,17 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
- * @sync: sync object where we add dependencies
  * @job: job who wants to use the VMID
  * @id: resulting VMID
+ * @fence: fence to wait for if no id could be grabbed
  *
  * Try to assign a reserved VMID.
  */
 static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 				     struct amdgpu_ring *ring,
-				     struct amdgpu_sync *sync,
 				     struct amdgpu_job *job,
-				     struct amdgpu_vmid **id)
+				     struct amdgpu_vmid **id,
+				     struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned vmhub = ring->funcs->vmhub;
@@ -280,7 +281,8 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 		tmp = amdgpu_sync_peek_fence(&(*id)->active, ring);
 		if (tmp) {
 			*id = NULL;
-			return amdgpu_sync_fence(sync, tmp);
+			*fence = dma_fence_get(tmp);
+			return 0;
 		}
 		needs_flush = true;
 	}
@@ -302,17 +304,17 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
- * @sync: sync object where we add dependencies
  * @job: job who wants to use the VMID
  * @id: resulting VMID
+ * @fence: fence to wait for if no id could be grabbed
  *
  * Try to reuse a VMID for this submission.
  */
 static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 				 struct amdgpu_ring *ring,
-				 struct amdgpu_sync *sync,
 				 struct amdgpu_job *job,
-				 struct amdgpu_vmid **id)
+				 struct amdgpu_vmid **id,
+				 struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned vmhub = ring->funcs->vmhub;
@@ -367,13 +369,13 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
  *
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
- * @sync: sync object where we add dependencies
  * @job: job who wants to use the VMID
+ * @fence: fence to wait for if no id could be grabbed
  *
  * Allocate an id for the vm, adding fences to the sync obj as necessary.
  */
 int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
-		     struct amdgpu_sync *sync, struct amdgpu_job *job)
+		     struct amdgpu_job *job, struct dma_fence **fence)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned vmhub = ring->funcs->vmhub;
@@ -383,16 +385,16 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
 	int r = 0;
 
 	mutex_lock(&id_mgr->lock);
-	r = amdgpu_vmid_grab_idle(vm, ring, sync, &idle);
+	r = amdgpu_vmid_grab_idle(vm, ring, &idle, fence);
 	if (r || !idle)
 		goto error;
 
 	if (vm->reserved_vmid[vmhub]) {
-		r = amdgpu_vmid_grab_reserved(vm, ring, sync, job, &id);
+		r = amdgpu_vmid_grab_reserved(vm, ring, job, &id, fence);
 		if (r || !id)
 			goto error;
 	} else {
-		r = amdgpu_vmid_grab_used(vm, ring, sync, job, &id);
+		r = amdgpu_vmid_grab_used(vm, ring, job, &id, fence);
 		if (r)
 			goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
index 1b1e7d04655c..57efe61dceed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
@@ -84,7 +84,7 @@ void amdgpu_vmid_free_reserved(struct amdgpu_device *adev,
 			       struct amdgpu_vm *vm,
 			       unsigned vmhub);
 int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
-		     struct amdgpu_sync *sync, struct amdgpu_job *job);
+		     struct amdgpu_job *job, struct dma_fence **fence);
 void amdgpu_vmid_reset(struct amdgpu_device *adev, unsigned vmhub,
 		       unsigned vmid);
 void amdgpu_vmid_reset_all(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 13b752687b30..e187dc0ab898 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -238,12 +238,12 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
 	return 0;
 }
 
-static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
-					       struct drm_sched_entity *s_entity)
+static struct dma_fence *
+amdgpu_job_dependency(struct drm_sched_job *sched_job,
+		      struct drm_sched_entity *s_entity)
 {
 	struct amdgpu_ring *ring = to_amdgpu_ring(s_entity->rq->sched);
 	struct amdgpu_job *job = to_amdgpu_job(sched_job);
-	struct amdgpu_vm *vm = job->vm;
 	struct dma_fence *fence;
 	int r;
 
@@ -254,12 +254,10 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
 			DRM_ERROR("Error adding fence (%d)\n", r);
 	}
 
-	while (fence == NULL && vm && !job->vmid) {
-		r = amdgpu_vmid_grab(vm, ring, &job->sync, job);
+	while (fence == NULL && job->vm && !job->vmid) {
+		r = amdgpu_vmid_grab(job->vm, ring, job, &fence);
 		if (r)
 			DRM_ERROR("Error getting VM ID (%d)\n", r);
-
-		fence = amdgpu_sync_get_fence(&job->sync);
 	}
 
 	if (!fence && job->gang_submit)
-- 
2.25.1

