Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31525EF64B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A1C10EA5D;
	Thu, 29 Sep 2022 13:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCBA10E61A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:21:43 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b2so2761330eja.6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=2a8sPby9G7sjtd4+T0KzHrFfXSRq49puApECy4FfZvc=;
 b=CxCFPB8sbkU4KkVjC1h66uSloqNOyMvGnKsurg92tA7t4kmP3xir0fHIRNN42KsRiG
 9T+zXyx6uaXimQ1lDryNR1dS49RZxpiLVkxRNPNntebwYgj4lzyiFJfZQSQ36GxtNLlA
 eUb21x1IsCabFlsr/zI/Opi3MKSgB6YkgpzhAPlV6YtomT42XwbAJida4HrOlOFQlqoa
 8KmKlypwEfL7YZRkyDoClOnPNLqLOaGS10zuT5m2IgQaQR6JMVNpN3kUaoGth3vXMKYC
 6oX87d3cgiQsglTGpHcr+rejD+2LLdHVdCKZ2Srt8aoZMke1Om2uWQRaG/t9nWg8amkf
 9GSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=2a8sPby9G7sjtd4+T0KzHrFfXSRq49puApECy4FfZvc=;
 b=vbdv68NAd90DXYoSVXnjoKflLwkQXQecxftoMjFakBPn18gPZMEqoP7JeNXEzt8bpa
 zCHkhD6jTlCxTzef6VIMyqeuTaWDGT7P71lowAYQyI/FZMNw8bJsApaymIkaycl4YSBS
 7x1alo+VkbUOnvRRBu7gXQ8ceDi391hEavfkkHKKEsNK8seGfb2yQz/liXFtKeTMQrxw
 OPy0atsjVPx29Hbz0bTDe64NWPDnULLbOLloTtUE9ARRnyN8W38KvMwiMDs323YPaBWg
 uqux1UwlN/StbOVDE4bBc3lf4vsLfwKsDVDUAFt+PXnLVx7kMXOG2hMYQo6ZNwBz6+1c
 dO5w==
X-Gm-Message-State: ACrzQf2hFTX02jaUfyNr3h+zOudkLCdhjCza4Vw3lawsW79lV3YLI3WK
 ee1/exVhqr5sehKTM/OhynSM24x74W8=
X-Google-Smtp-Source: AMsMyM7lMV+QYGHOVUj1/0eFou2RbXbIqgESHl9Slm1EHdQjEETyRPA0Hp83l33s2X8tHWzz8OwK4w==
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr2888349ejc.36.1664457701403; 
 Thu, 29 Sep 2022 06:21:41 -0700 (PDT)
Received: from able.fritz.box (p4fc20ebf.dip0.t-ipconnect.de. [79.194.14.191])
 by smtp.gmail.com with ESMTPSA id
 gx6-20020a1709068a4600b007836d075152sm3983807ejc.187.2022.09.29.06.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 06:21:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/13] drm/amdgpu: drop the fence argument from
 amdgpu_vmid_grab
Date: Thu, 29 Sep 2022 15:21:27 +0200
Message-Id: <20220929132136.1715-4-christian.koenig@amd.com>
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
index 46c99331d7f1..5aa053acc0b4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -256,9 +256,7 @@ static struct dma_fence *amdgpu_job_dependency(struct drm_sched_job *sched_job,
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

