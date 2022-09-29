Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BF5EF648
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFFF10EA44;
	Thu, 29 Sep 2022 13:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AF1C10E61E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:44 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id sb3so2748290ejb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hjzUh+06hD5wlle44yKdQAxqHre0QJdAFzzD+ApmYAo=;
 b=WJ3z2mZBJzvPXddmXldWS+0v5tiBfIh+F/cpvzqNXoJiWf7GZuKuL9bwj/1W12HGTw
 dor1/98GvADG9IhBSRIVCg60Dc/UIc+w1M/VJzXsl5tPoluq50dwoCflxV0az97MuVUK
 o+oWd2d8rzi+CFws/mhN84thKjN4LPPZcZSge8JiGBCXedv1Qg1JXDIo63sUsHHUC3lF
 OUtSBjez+qEHxY0gC5fF8PIj1ditxjyA+35qCrg0yzImpUVD9SxiSkxhO960aLQb0jZ9
 rX+IzUPTTPPMM5XgA/sBvkJPO80s0oTmeyVEoJNem/KAbMEPDQXUlUqQ7oXIOS1tjKdK
 3Y7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hjzUh+06hD5wlle44yKdQAxqHre0QJdAFzzD+ApmYAo=;
 b=ijx+uiUuNeVrgtc2pBbzKkdFUyCNU40PJBqtmNWF8RrBxdX09WfgOzRPxPTI+H7m3q
 OCcG3gxDMCnhsY0zlNPnzt/xQW+nRC+316F9RM2Q9LCBb76PU+ShtBx5k6MeTyfRE31s
 3+TrHpxGrmcnL7eZHDtfx3calirUMq8+aGGlGsk6a/ZvfXn+6pBxUzuIr5DRdw2w/+Is
 d7FjlepzREOGe8EbD+h+pckHDvy/Xjj5svTjfXpziGU4v4IRA4zZFjtfu/2pUPw13fTK
 vIP6Nair55BR/Eanlfs4WlBA37zJqenZLafMekAOhgSFGy1wp3B/AS+oNvZj8WWhBFur
 MsLA==
X-Gm-Message-State: ACrzQf3wkdEt354GH/5S+42GE/FjdAUH2aAtV+lUmEA9uNTFO0HFKuHr
 ZXopTIxo+qb+HHHZMI3bAVTiBTYzk0o=
X-Google-Smtp-Source: AMsMyM5YodQiXvoWKm/829A8qXEWLM9f3KWausmJLbc+omy0bpXvZr90Oc5Lsa01bFxqgcu3fP0b3w==
X-Received: by 2002:a17:907:2e01:b0:77e:d84d:9e07 with SMTP id
 ig1-20020a1709072e0100b0077ed84d9e07mr2853349ejc.674.1664457702450; 
 Thu, 29 Sep 2022 06:21:42 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/13] drm/amdgpu: drop amdgpu_sync from amdgpu_vmid_grab
Date: Thu, 29 Sep 2022 15:21:28 +0200
Message-Id: <20220929132136.1715-5-christian.koenig@amd.com>
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
index 5aa053acc0b4..8c2001ddab39 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -239,12 +239,12 @@ int amdgpu_job_submit_direct(struct amdgpu_job *job, struct amdgpu_ring *ring,
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
 
@@ -255,12 +255,10 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
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

