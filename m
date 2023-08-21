Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47633782391
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4491910E1C7;
	Mon, 21 Aug 2023 06:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7BE10E1C7;
 Mon, 21 Aug 2023 06:20:58 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-565b053fe58so509967a12.1; 
 Sun, 20 Aug 2023 23:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692598857; x=1693203657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ReohYwf4g2W8NWHJbVnCNLhhZV8KXI/9EG164GJnZUY=;
 b=AwM1mHL6s1YC83Kej/5YHfl++0+RdoozGGAAsl96j3jSEpKhOrw23ylegDc9ndGBj7
 s/MVOewVHPHkQ4MG1ly8EWN+yJ2+c+I/BLKnLkAPKCC4/FKR7e+0pbp8J1lQZ5jxjyn3
 s1ZklA/17dmdgIK+Xuuzs9Cp3IZ2BXW1h/7AcTh70DEMfvQhZ4H4kmQ0I4FSX4iDuuDh
 PW2kj12JChC3faU6NgKwaJF2eqnfRnxOMPp9AtrrGVqKE7qLcaPf+M4syzYKC7byVNW7
 8NmtFBLCE8TNDosenmdShiG4E5VGA3M6Qnlm6m/NcVlRQjoWtms2Y+MLTw0nKosT/KAT
 r6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692598857; x=1693203657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ReohYwf4g2W8NWHJbVnCNLhhZV8KXI/9EG164GJnZUY=;
 b=jlv3nFgBQtsmoJosLhPG6xMApDoA/OpE964bcUHPx5DTLxPEwUV9H7YSgVml69+ZPD
 0sWVYhFv/rDJo7tYhTH92j6um9TcyGmDYbZsP/cnn/dmqUbRvElOVL4oYT2YWB2MA/sN
 Py09sm8zKI2hjeayvJFc/hl89Hv7TI1+R5x0p6jyJjZPy6isq/DCF6bDg5IAwpPvx6XF
 OWxIif9oOKkbGIDteYG582Y76AkSYaWzijmGw3N2r4aWXI4paPv0WNbFpT9+69lE9tqr
 cfhrWcFQ+Lco0UXIUbDVLiWs2AbFn9gaCCvb4twr7uRgyQWf6R8wFVYevQ8DDKG5hYNN
 ZMcQ==
X-Gm-Message-State: AOJu0YwZtKiIuQlEDVXGgFA1y77g786Kqz7c0Ix8FImK/ESopTJ2tSZ8
 6hgExKK5H9ZbiRvrd2+UGyKTeZuPEOj9yoVN
X-Google-Smtp-Source: AGHT+IF1RagUtoMtCiL82d3s2k80VZ21IkIpTxzjbrJOrwwrXeQ9acqS72qi7no48+1b3GAgVaT5Mg==
X-Received: by 2002:a17:902:dacd:b0:1bc:496c:8eda with SMTP id
 q13-20020a170902dacd00b001bc496c8edamr7072962plx.4.1692598856846; 
 Sun, 20 Aug 2023 23:20:56 -0700 (PDT)
Received: from localhost (zz20184013906F627101.userreverse.dion.ne.jp.
 [111.98.113.1]) by smtp.gmail.com with ESMTPSA id
 c15-20020a170903234f00b001b9be3b94d3sm6131302plh.140.2023.08.20.23.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 23:20:56 -0700 (PDT)
From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/amdgpu: Add separate mode for syncing
 DMA_RESV_USAGE_BOOKKEEP.
Date: Mon, 21 Aug 2023 15:20:02 +0900
Message-ID: <20230821062005.109771-2-ishitatsuyuki@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
References: <20230821062005.109771-1-ishitatsuyuki@gmail.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

To prep for allowing different sync modes in a follow-up patch.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c       | 11 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h       |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c         | 11 ++++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h         |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c      |  2 +-
 8 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index edb35a88cb78..240556838094 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1287,7 +1287,7 @@ static int process_sync_pds_resv(struct amdkfd_process_info *process_info,
 		struct amdgpu_bo *pd = peer_vm->root.bo;
 
 		ret = amdgpu_sync_resv(NULL, sync, pd->tbo.base.resv,
-				       AMDGPU_SYNC_NE_OWNER,
+				       AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_NE_OWNER,
 				       AMDGPU_FENCE_OWNER_KFD);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 977e1804718d..2cb814de0149 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1203,7 +1203,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		sync_mode = amdgpu_bo_explicit_sync(bo) ?
 			AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
 		r = amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode,
-				     &fpriv->vm);
+				     AMDGPU_SYNC_EXPLICIT, &fpriv->vm);
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index f7905bce0de1..f20c1d2757e4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1450,7 +1450,8 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
  *
  * @adev: amdgpu device pointer
  * @resv: reservation object to sync to
- * @sync_mode: synchronization mode
+ * @implicit_sync_mode: synchronization mode for usage <= DMA_RESV_USAGE_READ
+ * @explicit_sync_mode: synchronization mode for usage DMA_RESV_USAGE_BOOKKEEP
  * @owner: fence owner
  * @intr: Whether the wait is interruptible
  *
@@ -1460,14 +1461,15 @@ void amdgpu_bo_fence(struct amdgpu_bo *bo, struct dma_fence *fence,
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
@@ -1488,7 +1490,8 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr)
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 
 	return amdgpu_bo_sync_wait_resv(adev, bo->tbo.base.resv,
-					AMDGPU_SYNC_NE_OWNER, owner, intr);
+					AMDGPU_SYNC_NE_OWNER, AMDGPU_SYNC_EXPLICIT,
+					owner, intr);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index 05496b97ef93..e982b5815969 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -350,7 +350,8 @@ vm_fault_t amdgpu_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
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
index dcd8c066bc1f..e94f90d87902 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -226,14 +226,15 @@ static bool amdgpu_sync_test_fence(struct amdgpu_device *adev,
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
@@ -246,6 +247,10 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
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
index cf1e9e858efd..7758105a1d6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h
@@ -49,8 +49,8 @@ struct amdgpu_sync {
 void amdgpu_sync_create(struct amdgpu_sync *sync);
 int amdgpu_sync_fence(struct amdgpu_sync *sync, struct dma_fence *f);
 int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
-		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
-		     void *owner);
+		     struct dma_resv *resv, enum amdgpu_sync_mode implicit_mode,
+		     enum amdgpu_sync_mode explicit_mode, void *owner);
 struct dma_fence *amdgpu_sync_peek_fence(struct amdgpu_sync *sync,
 				     struct amdgpu_ring *ring);
 struct dma_fence *amdgpu_sync_get_fence(struct amdgpu_sync *sync);
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
index 349416e176a1..e259a51e7c56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c
@@ -98,7 +98,7 @@ static int amdgpu_vm_sdma_prepare(struct amdgpu_vm_update_params *p,
 		return 0;
 
 	amdgpu_sync_create(&sync);
-	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, p->vm);
+	r = amdgpu_sync_resv(p->adev, &sync, resv, sync_mode, sync_mode, p->vm);
 	if (!r)
 		r = amdgpu_sync_push_to_job(&sync, p->job);
 	amdgpu_sync_free(&sync);
-- 
2.41.0

