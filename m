Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFE85FEAE1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 10:48:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AB310EAB4;
	Fri, 14 Oct 2022 08:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621F10E0C7;
 Fri, 14 Oct 2022 08:46:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ot12so9058592ejb.1;
 Fri, 14 Oct 2022 01:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WTMUv7tj7gUaAGzf+64+UqeFTayWqm/xf5R0CQi7ZAU=;
 b=b4SrIFhPAookzb1VnrbqB0ohgpADQ+fOXgzVPCjCQ6WWh+X93SUAqImI02w8cApnNZ
 ui9j6b83d4pXfJV8L/MP/cac//98wyqb7tD/ZA4ZMSO1I8aHese48JJFni3ob+yTmhp+
 8OCJdF90kEJIp6Z6LF20EezrJwU7lXHHoHorn1WuSPRVkGtGar1HcLUNj/bNr/jQgzIm
 twWqomoc20cYG2EmR5Nw7LlZ51K27wmMOn69fszf5DDuWaDo50u2tMV6Mqa6SfAcKS2V
 2DE5X7UacXvJqWgR6fYa2oswiIMTAjvp0hqHTmJM/xHGpNB4kso6WYZUn2dBgcFjq2ez
 R0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WTMUv7tj7gUaAGzf+64+UqeFTayWqm/xf5R0CQi7ZAU=;
 b=n6hc5C9ApkUB9oWeHbjAKQnNjKaF2uOsc4WPGf/IWK6YDteFO0KjoWexoAVbZL1khl
 hEidzQBVz9KJgnrNnd1/DPuLqvLQkZdy0Hf7MuUEmIk+ti+lxb2cjn3MZ1iy8sWgmrA2
 UcxGCXP1qovOEO1jopx0XZDygyH0uCnlyfLKsLOyjC8IX/t9Vm3QwIUOkeET0vEOrkLs
 Q/yNICSMG8dIloGVEMMaqLwJrsfhtCqymvrQHBTc/qnd7D0ZhShbthQE/R51egr6ac+W
 NKZ9ibhUZYhBJeNm3eRiBUvSPP7vAdIHNPWnqZv1qZJTgUA+NlSAorcA2mnHB7G6zdeB
 usqg==
X-Gm-Message-State: ACrzQf1jOJm/rdxz5ZOSWYY1ggtutliBqfzfOT4hVd+ngI4vQKmdp1+T
 o64wIyW3Ga2vAeie1t5Bo1yM8IQGmnA=
X-Google-Smtp-Source: AMsMyM7Y0i3iPZULmh+8ecmQ+8B3aE1l6GTEYEwMt0AMBxmP0Oeanqt9sUbCMRC8B5VL/jtv5qqx+w==
X-Received: by 2002:a17:907:161f:b0:78e:11b3:8962 with SMTP id
 hb31-20020a170907161f00b0078e11b38962mr2846477ejc.0.1665737209123; 
 Fri, 14 Oct 2022 01:46:49 -0700 (PDT)
Received: from able.fritz.box (p5b0eacfe.dip0.t-ipconnect.de. [91.14.172.254])
 by smtp.gmail.com with ESMTPSA id
 r26-20020aa7d59a000000b00457618d3409sm1379124edq.68.2022.10.14.01.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 01:46:48 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 04/13] drm/amdgpu: drop the fence argument from
 amdgpu_vmid_grab
Date: Fri, 14 Oct 2022 10:46:32 +0200
Message-Id: <20221014084641.128280-5-christian.koenig@amd.com>
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

This is always the job anyway.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 20 ++++++++------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h |  3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c |  4 +---
 3 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
index 03d115d2b5ed..b76294d4275b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
@@ -244,7 +244,6 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
  * @sync: sync object where we add dependencies
- * @fence: fence protecting ID from reuse
  * @job: job who wants to use the VMID
  * @id: resulting VMID
  *
@@ -253,7 +252,6 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm,
 static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 				     struct amdgpu_ring *ring,
 				     struct amdgpu_sync *sync,
-				     struct dma_fence *fence,
 				     struct amdgpu_job *job,
 				     struct amdgpu_vmid **id)
 {
@@ -290,7 +288,7 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 	/* Good we can use this VMID. Remember this submission as
 	* user of the VMID.
 	*/
-	r = amdgpu_sync_fence(&(*id)->active, fence);
+	r = amdgpu_sync_fence(&(*id)->active, &job->base.s_fence->finished);
 	if (r)
 		return r;
 
@@ -305,7 +303,6 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
  * @sync: sync object where we add dependencies
- * @fence: fence protecting ID from reuse
  * @job: job who wants to use the VMID
  * @id: resulting VMID
  *
@@ -314,7 +311,6 @@ static int amdgpu_vmid_grab_reserved(struct amdgpu_vm *vm,
 static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 				 struct amdgpu_ring *ring,
 				 struct amdgpu_sync *sync,
-				 struct dma_fence *fence,
 				 struct amdgpu_job *job,
 				 struct amdgpu_vmid **id)
 {
@@ -352,7 +348,8 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
 		/* Good, we can use this VMID. Remember this submission as
 		 * user of the VMID.
 		 */
-		r = amdgpu_sync_fence(&(*id)->active, fence);
+		r = amdgpu_sync_fence(&(*id)->active,
+				      &job->base.s_fence->finished);
 		if (r)
 			return r;
 
@@ -371,14 +368,12 @@ static int amdgpu_vmid_grab_used(struct amdgpu_vm *vm,
  * @vm: vm to allocate id for
  * @ring: ring we want to submit job to
  * @sync: sync object where we add dependencies
- * @fence: fence protecting ID from reuse
  * @job: job who wants to use the VMID
  *
  * Allocate an id for the vm, adding fences to the sync obj as necessary.
  */
 int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
-		     struct amdgpu_sync *sync, struct dma_fence *fence,
-		     struct amdgpu_job *job)
+		     struct amdgpu_sync *sync, struct amdgpu_job *job)
 {
 	struct amdgpu_device *adev = ring->adev;
 	unsigned vmhub = ring->funcs->vmhub;
@@ -393,11 +388,11 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
 		goto error;
 
 	if (vm->reserved_vmid[vmhub]) {
-		r = amdgpu_vmid_grab_reserved(vm, ring, sync, fence, job, &id);
+		r = amdgpu_vmid_grab_reserved(vm, ring, sync, job, &id);
 		if (r || !id)
 			goto error;
 	} else {
-		r = amdgpu_vmid_grab_used(vm, ring, sync, fence, job, &id);
+		r = amdgpu_vmid_grab_used(vm, ring, sync, job, &id);
 		if (r)
 			goto error;
 
@@ -406,7 +401,8 @@ int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
 			id = idle;
 
 			/* Remember this submission as user of the VMID */
-			r = amdgpu_sync_fence(&id->active, fence);
+			r = amdgpu_sync_fence(&id->active,
+					      &job->base.s_fence->finished);
 			if (r)
 				goto error;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
index 06c8a0034fa5..1b1e7d04655c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.h
@@ -84,8 +84,7 @@ void amdgpu_vmid_free_reserved(struct amdgpu_device *adev,
 			       struct amdgpu_vm *vm,
 			       unsigned vmhub);
 int amdgpu_vmid_grab(struct amdgpu_vm *vm, struct amdgpu_ring *ring,
-		     struct amdgpu_sync *sync, struct dma_fence *fence,
-		     struct amdgpu_job *job);
+		     struct amdgpu_sync *sync, struct amdgpu_job *job);
 void amdgpu_vmid_reset(struct amdgpu_device *adev, unsigned vmhub,
 		       unsigned vmid);
 void amdgpu_vmid_reset_all(struct amdgpu_device *adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index cd968e781077..13b752687b30 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -255,9 +255,7 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
 	}
 
 	while (fence == NULL && vm && !job->vmid) {
-		r = amdgpu_vmid_grab(vm, ring, &job->sync,
-				     &job->base.s_fence->finished,
-				     job);
+		r = amdgpu_vmid_grab(vm, ring, &job->sync, job);
 		if (r)
 			DRM_ERROR("Error getting VM ID (%d)\n", r);
 
-- 
2.25.1

