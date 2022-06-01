Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD4539A69
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2C310FC80;
	Wed,  1 Jun 2022 00:39:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC6210FC79
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:55 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q1so571159ejz.9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QMJOKD5XNzIEyQoolp8ecqdgQU8Pb+KC8yrhuJ5T9II=;
 b=Lhg22AxDioU050RzqPyAjIYFUgPvUvQ+u8Lrcye7+cjj5JsDUWcvtslOfuenv8ADyM
 4STxwRglbYKpvnD4bEgTM0PwZFpS0a9AQ3CX+upGqudse+hOLR5+1WV8g7afiLPs4Cyg
 r7wpeLzjlsSBX+2y1EwJiIHhezCYFLvTwnl5Hp4pRQ+zmVfD0+tbEAmmJCL67iNVG1da
 xo6hVrO90eFXGbmjOTR5RlA+8xee7M54fpFv+JfP+HPp8oHAWMc13UDP2uSDvtEWQepo
 si38k6j0ozHggWfKa+HDIko3L+72ib6ZqQf+pGcuJxygwVcXDt5WSx10Quk8VpIeFr1q
 hu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QMJOKD5XNzIEyQoolp8ecqdgQU8Pb+KC8yrhuJ5T9II=;
 b=N8kRn2rjTbKr8MMpn44ZikII8DexMJDsKTIK9rckbDk+sFWSn/kpd+Pm+em8O7A1hM
 WCGwk2y+E1TlRNdWybA7q5Vnh8ijwY8FG5YI/55Y90xXXi6wf8+U+RdAtFcI0zcpb8Fy
 XQNyVPPEwMqE67nEaygY6oLzpc1SomhCXDyu/yvarDnyESsEZZsIHZCbxRiDr1KS0QTu
 sXp9X/O/6Dh68C7zO9nENvUIuSQMM5leJUIunmlK2IrtNrnRfXrJjlb8hDdzO3bMXH/w
 MQwt40cAqwzstULzw4TuTe3dCwxP+EX2DGaU9luiznpZprzIKGrtq+wtqyKuy9YFb/rB
 uTXw==
X-Gm-Message-State: AOAM531Uw39QnkGXrC8a8bJk13XsppND3LM3p2NkrBVDJe8c0DPaKwvL
 v6buOyA0FjNhQQmUCO658UC1PJ3dgjBQww==
X-Google-Smtp-Source: ABdhPJykdt1Bo+Xy83vK/IJQ0whSdk/eRcGF+9H/wG7DMQ4ZO8R6XL+B/f5um4l32k+MuckfvdJFlQ==
X-Received: by 2002:a17:906:482:b0:6fe:86fa:a5c5 with SMTP id
 f2-20020a170906048200b006fe86faa5c5mr55205375eja.28.1654043993736; 
 Tue, 31 May 2022 17:39:53 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:53 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 2/5] drm/amdgpu: Add separate mode for syncing
 DMA_RESV_USAGE_BOOKKEEP.
Date: Wed,  1 Jun 2022 02:40:11 +0200
Message-Id: <20220601004014.158247-3-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To prep for allowing different sync modes in a follow-up patch.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c       | 11 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         | 11 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c          |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c      |  2 +-
 10 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index a790a089e829..92a1b08b3bbc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1157,7 +1157,7 @@ static int process_sync_pds_resv(struct amdkfd_process_info *process_info,
 		struct amdgpu_bo *pd = peer_vm->root.bo;
 
 		ret = amdgpu_sync_resv(NULL, sync, pd->tbo.base.resv,
-				       AMDGPU_SYNC_NE_OWNER,
+				       AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_NE_OWNER,
 				       AMDGPU_FENCE_OWNER_KFD);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 2ae1c0d9d33a..0318a6d46a41 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -654,7 +654,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		sync_mode = amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
-				     &fpriv->vm);
+				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 91b99eb7dc35..63e6f7b8b522 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1407,7 +1407,8 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
  *
  * @adev: amdgpu device pointer
  * @resv: reservation object to sync to
- * @sync_mode: synchronization mode
+ * @implicit_sync_mode: synchronization mode for usage <= DMA_RESV_USAGE_READ
+ * @explicit_sync_mode: synchronization mode for usage DMA_RESV_USAGE_BOOKKEEP
  * @owner: fence owner
  * @intr: Whether the wait is interruptible
  *
@@ -1417,14 +1418,15 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
  * 0 on success, errno otherwise.
  */
 int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
-			     enum amdgpu_sync_mode sync_mode, void *owner,
+			     enum amdgpu_sync_mode implicit_sync_mode,
+			     enum amdgpu_sync_mode explicit_sync_mode, void *owner,
 			     bool intr)
 {
 	struct amdgpu_sync sync;
 	int r;
 
 	amdgpu_sync_create(&sync);
-	amdgpu_sync_resv(adev, &sync, resv, sync_mode, owner);
+	amdgpu_sync_resv(adev, &sync, resv, implicit_sync_mode, explicit_sync_mode, owner);
 	r = amdgpu_sync_wait(&sync, intr);
 	amdgpu_sync_free(&sync);
 	return r;
@@ -1445,7 +1447,8 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
 	return amdgpu_bo_sync_wait_resv(adev, bo->tbo.base.resv,
-					AMDGPU_SYNC_NE_OWNER, owner, intr);
+					AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_EXPLICIT,
+					owner, intr);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 4c9cbdc66995..9540ee1102ad 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -321,7 +321,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
 void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
 		     bool shared);
 int amdgpu_bo_sync_wait_resv(struct amdgpu_device *adev, struct dma_resv *resv,
-			     enum amdgpu_sync_mode sync_mode, void *owner,
+			     enum amdgpu_sync_mode implicit_sync_mode,
+			     enum amdgpu_sync_mode explicit_sync_mode, void *owner,
 			     bool intr);
 int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 11c46b3e4c60..b40cd4eff6a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -243,14 +243,15 @@ static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
  * @adev: amdgpu device
  * @sync: sync object to add fences from reservation object to
  * @resv: reservation object with embedded fence
- * @mode: how owner affects which fences we sync to
+ * @implicit_mode: how owner affects which fences with usage <= DMA_RESV_USAGE_READ we sync to
+ * @explicit_mode: how owner affects which fences with usage DMA_RESV_USAGE_BOOKKEEP we sync to
  * @owner: owner of the planned job submission
  *
  * Sync to the fence
  */
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
-		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
-		     void *owner)
+		     struct dma_resv *resv, enum amdgpu_sync_mode implicit_mode,
+		     enum amdgpu_sync_mode explicit_mode, void *owner)
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *f;
@@ -263,6 +264,10 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 	dma_resv_for_each_fence(&cursor, resv, DMA_RESV_USAGE_BOOKKEEP, f) {
 		dma_fence_chain_for_each(f, f) {
 			struct dma_fence *tmp = dma_fence_chain_contained(f);
+			enum amdgpu_sync_mode mode = implicit_mode;
+
+			if (dma_resv_iter_usage(&cursor) >= DMA_RESV_USAGE_BOOKKEEP)
+				mode = explicit_mode;
 
 			if (amdgpu_sync_test_fence(adev, mode, owner, tmp)) {
 				r = amdgpu_sync_fence(sync, f);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
index 7c0fe20c470d..f786e30eb0a3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -50,8 +50,8 @@ void amdgpu_sync_create(struct amdgpu_sync *sync);
 int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
 int amdgpu_sync_vm_fence(struct amdgpu_sync *sync, struct dma_fence *fence);
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
-		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
-		     void *owner);
+		     struct dma_resv *resv, enum amdgpu_sync_mode implicit_mode,
+		     enum amdgpu_sync_mode explicit_mode, void *owner);
 struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 				     struct amdgpu_ring *ring);
 struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 48a635864a92..00a749016b6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1971,6 +1971,7 @@ static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
 	if (resv) {
 		r = amdgpu_sync_resv(adev, &(*job)->sync, resv,
 				     AMDGPU_SYNC_ALWAYS,
+				     AMDGPU_SYNC_EXPLICIT,
 				     AMDGPU_FENCE_OWNER_UNDEFINED);
 		if (r) {
 			DRM_ERROR("sync failed (%d).\n", r);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index 6eac649499d3..de08bab400d5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1176,7 +1176,7 @@ static int amdgpu_uvd_send_msg(struct amdgpu_ring *ring, struct amdgpu_bo *bo,
 			goto err_free;
 	} else {
 		r = amdgpu_sync_resv(adev, &job->sync, bo->tbo.base.resv,
-				     AMDGPU_SYNC_ALWAYS,
+				     AMDGPU_SYNC_ALWAYS, AMDGPU_SYNC_ALWAYS,
 				     AMDGPU_FENCE_OWNER_UNDEFINED);
 		if (r)
 			goto err_free;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
index 31913ae86de6..f10332e1c6c0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c
@@ -51,7 +51,7 @@ static int amdgpu_vm_cpu_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, p->vm, true);
+	return amdgpu_bo_sync_wait_resv(p->adev, resv, sync_mode, sync_mode, p->vm, true);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
index bdb44cee19d3..63b484dc76c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -75,7 +75,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 	if (!resv)
 		return 0;
 
-	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, p->vm);
+	return amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode, sync_mode, p->vm);
 }
 
 /**
-- 
2.36.1

