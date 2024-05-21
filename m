Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A108CA8C1
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 09:18:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8673D10E3C6;
	Tue, 21 May 2024 07:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bcEiVf/N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8102210E3C9;
 Tue, 21 May 2024 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716275845; x=1747811845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lp89lmnbxGsUdT5iRPNiUBq+/aaH1eNQO5ZGbaO+Vbc=;
 b=bcEiVf/NMFw0wKrYNDZqou7psNvu2SBHYhqVFmfsLXCmSvq1ZvdVL9M8
 eE0r4y+eN7wwUisz1rQDw5DHZ7Vr+rRze7UwtAcYj/8EGMxmBoayTWYXf
 Isw5URaryIx3sg/spwXQi7S2t65T+7N4nVLsZVJbp3bPr7wqeBAvO4FJl
 hwPFbBE1PNwrVVIgCLA3Sq3dL+btB3nyHowNda4OYIZeCvZXut0OZi3Fr
 tVHdFKqi3s4J04CRRd80NqeWL35FePtplQ1stdH0DYz6Jk75YgRrNTC11
 LmadXyx2NOI9J7G170mtDl7d+d+YzGskLJMzADJtQpDX6uLH8DRpaId1F Q==;
X-CSE-ConnectionGUID: SkI/fNq9T56UNj1G6mqFHA==
X-CSE-MsgGUID: +5NePlibSaO0zfHw3jfHaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15393486"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="15393486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:24 -0700
X-CSE-ConnectionGUID: RMOpe9QnRYilzAyW7Wyy8Q==
X-CSE-MsgGUID: 8yM23/UASbOE6cigaaharw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37336773"
Received: from unknown (HELO fedora..) ([10.245.246.159])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 00:17:22 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 13/21] drm/exec: Rework contended locking
Date: Tue, 21 May 2024 09:16:31 +0200
Message-ID: <20240521071639.77614-14-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If contention and backoff occurs during a drm_exec ww transaction,
the contended lock is not locked again until the next orinary
attempt to lock a dma_resv lock. However, with the introduction of
drm_exec_trylock(), that doesn't work, since the locking of the
contended lock needs to be a sleeping lock. Neither can we ignore
locking the contended lock during a trylock since that would violate
at least the ww_mutex annotations.

So resolve this by actually locking the contended lock during
drm_exec_retry_on_contention(). However, this introduces a new point
of failure since locking the contended lock may return -EINTR.

Hence drm_exec_retry_on_contention() must take an error parameter and
also return a value indicating success.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 ++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  8 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |  4 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  8 ++---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
 drivers/gpu/drm/drm_exec.c                    | 35 ++++++++++++++-----
 drivers/gpu/drm/drm_gpuvm.c                   |  8 ++---
 drivers/gpu/drm/imagination/pvr_job.c         |  2 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  2 +-
 drivers/gpu/drm/tests/drm_exec_test.c         | 12 +++----
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +--
 drivers/gpu/drm/xe/xe_vm.c                    | 10 +++---
 include/drm/drm_exec.h                        | 23 +++++++++---
 17 files changed, 92 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e4d4e55c08ad..4a08a692aa1f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1152,12 +1152,12 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&ctx->exec) {
 		ret = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
-		drm_exec_retry_on_contention(&ctx->exec);
+		ret = drm_exec_retry_on_contention(&ctx->exec, ret);
 		if (unlikely(ret))
 			goto error;
 
 		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
-		drm_exec_retry_on_contention(&ctx->exec);
+		ret = drm_exec_retry_on_contention(&ctx->exec, ret);
 		if (unlikely(ret))
 			goto error;
 	}
@@ -1199,14 +1199,14 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 
 			ret = amdgpu_vm_lock_pd(entry->bo_va->base.vm,
 						&ctx->exec, 2);
-			drm_exec_retry_on_contention(&ctx->exec);
+			ret = drm_exec_retry_on_contention(&ctx->exec, ret);
 			if (unlikely(ret))
 				goto error;
 			++ctx->n_vms;
 		}
 
 		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
-		drm_exec_retry_on_contention(&ctx->exec);
+		ret = drm_exec_retry_on_contention(&ctx->exec, ret);
 		if (unlikely(ret))
 			goto error;
 	}
@@ -2619,7 +2619,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 		list_for_each_entry(peer_vm, &process_info->vm_list_head,
 				    vm_list_node) {
 			ret = amdgpu_vm_lock_pd(peer_vm, &exec, 2);
-			drm_exec_retry_on_contention(&exec);
+			ret = drm_exec_retry_on_contention(&exec, ret);
 			if (unlikely(ret))
 				goto unreserve_out;
 		}
@@ -2631,7 +2631,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 
 			gobj = &mem->bo->tbo.base;
 			ret = drm_exec_prepare_obj(&exec, gobj, 1);
-			drm_exec_retry_on_contention(&exec);
+			ret = drm_exec_retry_on_contention(&exec, ret);
 			if (unlikely(ret))
 				goto unreserve_out;
 		}
@@ -2875,7 +2875,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
 		list_for_each_entry(peer_vm, &process_info->vm_list_head,
 				    vm_list_node) {
 			ret = amdgpu_vm_lock_pd(peer_vm, &exec, 2);
-			drm_exec_retry_on_contention(&exec);
+			ret = drm_exec_retry_on_contention(&exec, ret);
 			if (unlikely(ret)) {
 				pr_err("Locking VM PD failed, ret: %d\n", ret);
 				goto ttm_reserve_fail;
@@ -2891,7 +2891,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
 
 			gobj = &mem->bo->tbo.base;
 			ret = drm_exec_prepare_obj(&exec, gobj, 1);
-			drm_exec_retry_on_contention(&exec);
+			ret = drm_exec_retry_on_contention(&exec, ret);
 			if (unlikely(ret)) {
 				pr_err("drm_exec_prepare_obj failed, ret: %d\n", ret);
 				goto ttm_reserve_fail;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index ec888fc6ead8..299e46a6d934 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -897,7 +897,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 
 	drm_exec_until_all_locked(&p->exec) {
 		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec, 1 + p->gang_size);
-		drm_exec_retry_on_contention(&p->exec);
+		r = drm_exec_retry_on_contention(&p->exec, r);
 		if (unlikely(r))
 			goto out_free_user_pages;
 
@@ -905,7 +905,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			/* One fence for TTM and one for each CS job */
 			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
 						 1 + p->gang_size);
-			drm_exec_retry_on_contention(&p->exec);
+			r = drm_exec_retry_on_contention(&p->exec, r);
 			if (unlikely(r))
 				goto out_free_user_pages;
 
@@ -915,7 +915,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		if (p->uf_bo) {
 			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
 						 1 + p->gang_size);
-			drm_exec_retry_on_contention(&p->exec);
+			r = drm_exec_retry_on_contention(&p->exec, r);
 			if (unlikely(r))
 				goto out_free_user_pages;
 		}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index cfdf558b48b6..8b2b86c7a6c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
 			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r)) {
 			DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
 			goto error;
@@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
 			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r)) {
 			DRM_ERROR("failed to reserve CSA,PD BOs: err=%d\n", r);
 			goto error;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 67c234bcf89f..17e16c971e21 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -239,12 +239,12 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 	}
@@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 	drm_exec_until_all_locked(&exec) {
 		if (gobj) {
 			r = drm_exec_lock_obj(&exec, gobj);
-			drm_exec_retry_on_contention(&exec);
+			r = drm_exec_retry_on_contention(&exec, r);
 			if (unlikely(r))
 				goto error;
 		}
 
 		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 5ca5c47ab54e..1b1a5147606e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1221,12 +1221,12 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error_fini_exec;
 
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error_fini_exec;
 	}
@@ -1292,12 +1292,12 @@ int amdgpu_mes_ctx_unmap_meta_data(struct amdgpu_device *adev,
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec,
 				      &ctx_data->meta_data_obj->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
index e22cb2b5cd92..72b8213e352c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
@@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
 			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error;
 	}
@@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct amdgpu_device *adev, struct amdgpu_fpriv *fpriv)
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
 		if (likely(!r))
 			r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
index e01c1c8e64c4..63392ce43945 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
@@ -89,12 +89,12 @@ static int map_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error_fini_exec;
 
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto error_fini_exec;
 	}
@@ -152,12 +152,12 @@ static int unmap_ring_data(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 
 		r = amdgpu_vm_lock_pd(vm, &exec, 0);
-		drm_exec_retry_on_contention(&exec);
+		r = drm_exec_retry_on_contention(&exec, r);
 		if (unlikely(r))
 			goto out_unlock;
 	}
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 386875e6eb96..a3aa7fd22f6a 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1499,7 +1499,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx, bool intr)
 			vm = drm_priv_to_vm(pdd->drm_priv);
 
 			r = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
-			drm_exec_retry_on_contention(&ctx->exec);
+			r = drm_exec_retry_on_contention(&ctx->exec, r);
 			if (unlikely(r)) {
 				pr_debug("failed %d to reserve bo\n", r);
 				goto unreserve_out;
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 2da094bdf8a4..3770a5d30213 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -28,12 +28,12 @@
  *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
  *	drm_exec_until_all_locked(&exec) {
  *		ret = drm_exec_prepare_obj(&exec, boA, 1);
- *		drm_exec_retry_on_contention(&exec);
+ *		ret = drm_exec_retry_on_contention(&exec, ret);
  *		if (ret)
  *			goto error;
  *
  *		ret = drm_exec_prepare_obj(&exec, boB, 1);
- *		drm_exec_retry_on_contention(&exec);
+ *		ret = drm_exec_retry_on_contention(&exec, ret);
  *		if (ret)
  *			goto error;
  *	}
@@ -48,7 +48,8 @@
  */
 
 /* Dummy value used to initially enter the retry loop */
-#define DRM_EXEC_DUMMY ((void *)~0)
+#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
+#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
 
 /* Unlock all objects and drop references */
 static void drm_exec_unlock_all(struct drm_exec *exec)
@@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec *exec)
 		return true;
 	}
 
-	drm_exec_unlock_all(exec);
-	exec->num_objects = 0;
+	exec->contended = NULL;
 	return true;
 }
 EXPORT_SYMBOL(drm_exec_cleanup);
@@ -194,6 +194,27 @@ static int drm_exec_lock_contended(struct drm_exec *exec)
 	return ret;
 }
 
+/**
+ * drm_exec_handle_contended() - Perform cleanup before a ww transaction restart
+ * @exec: Pointer to the drm_exec object.
+ *
+ * Unlocks all held resvs and re-locks the contended object.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int drm_exec_handle_contended(struct drm_exec *exec)
+{
+	int ret;
+
+	drm_exec_unlock_all(exec);
+	exec->num_objects = 0;
+	ret = drm_exec_lock_contended(exec);
+	exec->contended = DRM_EXEC_CONTENDED;
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_exec_handle_contended);
+
 /**
  * drm_exec_lock_obj - lock a GEM object for use
  * @exec: the drm_exec object with the state
@@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct drm_exec *exec, struct drm_gem_object *obj)
 {
 	int ret;
 
-	ret = drm_exec_lock_contended(exec);
-	if (unlikely(ret))
-		return ret;
-
 	if (exec->prelocked == obj) {
 		drm_gem_object_put(exec->prelocked);
 		exec->prelocked = NULL;
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index f9eb56f24bef..0923d6ae18e2 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct drm_gpuvm_exec *vm_exec)
 
 	drm_exec_until_all_locked(exec) {
 		ret = drm_gpuvm_prepare_vm(gpuvm, exec, num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
 		if (ret)
 			goto err;
 
 		ret = drm_gpuvm_prepare_objects(gpuvm, exec, num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
 		if (ret)
 			goto err;
 
 		if (vm_exec->extra.fn) {
 			ret = vm_exec->extra.fn(vm_exec);
-			drm_exec_retry_on_contention(exec);
+			ret = drm_exec_retry_on_contention(exec, ret);
 			if (ret)
 				goto err;
 		}
@@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct drm_gpuvm_exec *vm_exec,
 	drm_exec_until_all_locked(exec) {
 		ret = drm_gpuvm_prepare_range(gpuvm, exec, addr, range,
 					      vm_exec->num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
 		if (ret)
 			goto err;
 	}
diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 78c2f3c6dce0..6e0ce6c4576c 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct drm_exec *exec, struct pvr_job_data *job_data,
 	drm_exec_until_all_locked(exec) {
 		int err = jobs_lock_all_objs(exec, job_data, job_count);
 
-		drm_exec_retry_on_contention(exec);
+		err = drm_exec_retry_on_contention(exec, err);
 		if (err)
 			return err;
 	}
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..01992b43ea4b 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -259,7 +259,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
-			drm_exec_retry_on_contention(&submit->exec);
+			ret = drm_exec_retry_on_contention(&submit->exec, ret);
 			if (ret)
 				goto error;
 		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index ee02cd833c5e..0c871634fdfb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 	drm_exec_init(exec, vme->flags, 0);
 	drm_exec_until_all_locked(exec) {
 		ret = bind_lock_validate(job, exec, vme->num_fences);
-		drm_exec_retry_on_contention(exec);
+		ret = drm_exec_retry_on_contention(exec, ret);
 		if (ret) {
 			op = list_last_op(&bind_job->ops);
 			goto unwind;
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 81f928a429ba..28558fdb08df 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -63,7 +63,7 @@ static void test_lock(struct kunit *test)
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
@@ -83,14 +83,14 @@ static void test_lock_unlock(struct kunit *test)
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
 
 		drm_exec_unlock_obj(&exec, &gobj);
 		ret = drm_exec_lock_obj(&exec, &gobj);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
@@ -110,13 +110,13 @@ static void test_duplicates(struct kunit *test)
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_lock_obj(&exec, &gobj);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
 
 		ret = drm_exec_lock_obj(&exec, &gobj);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
@@ -137,7 +137,7 @@ static void test_prepare(struct kunit *test)
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		KUNIT_EXPECT_EQ(test, ret, 0);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 040dd142c49c..20ec1ab1b52d 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -200,7 +200,7 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, atomic, tile->id);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		if (ret)
 			goto unlock_dma_resv;
 
@@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		ret = xe_pf_begin(&exec, vma, true, tile->id);
-		drm_exec_retry_on_contention(&exec);
+		ret = drm_exec_retry_on_contention(&exec, ret);
 		if (ret)
 			break;
 	}
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index e2ec148c9c33..335524e803e7 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -501,7 +501,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
 		bool done = false;
 
 		err = xe_preempt_work_begin(&exec, vm, &done);
-		drm_exec_retry_on_contention(&exec);
+		err = drm_exec_retry_on_contention(&exec, err);
 		if (err || done) {
 			drm_exec_fini(&exec);
 			if (err && xe_vm_validate_should_retry(&exec, err, &end))
@@ -1052,7 +1052,7 @@ static void xe_vma_destroy_unlocked(struct xe_vma *vma)
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
 		err = xe_vm_lock_vma(&exec, vma);
-		drm_exec_retry_on_contention(&exec);
+		err = drm_exec_retry_on_contention(&exec, err);
 		if (XE_WARN_ON(err))
 			break;
 	}
@@ -2148,11 +2148,11 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
 			err = 0;
 			if (!bo->vm) {
 				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
-				drm_exec_retry_on_contention(&exec);
+				err = drm_exec_retry_on_contention(&exec, err);
 			}
 			if (!err) {
 				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
-				drm_exec_retry_on_contention(&exec);
+				err = drm_exec_retry_on_contention(&exec, err);
 			}
 			if (err) {
 				drm_exec_fini(&exec);
@@ -2884,7 +2884,7 @@ static int vm_bind_ioctl_ops_execute(struct xe_vm *vm,
 		      DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
 		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
-		drm_exec_retry_on_contention(&exec);
+		err = drm_exec_retry_on_contention(&exec, err);
 		if (err)
 			goto unlock;
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..fafb40d96e38 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -51,6 +51,8 @@ struct drm_exec {
 	struct drm_gem_object *prelocked;
 };
 
+int drm_exec_handle_contended(struct drm_exec *exec);
+
 /**
  * drm_exec_obj() - Return the object for a give drm_exec index
  * @exec: Pointer to the drm_exec context
@@ -113,15 +115,26 @@ __PASTE(__drm_exec_, __LINE__):						\
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
  * @exec: drm_exec object
+ * @_ret: The current error status
  *
  * Control flow helper to continue when a contention was detected and we need to
  * clean up and re-start the loop to prepare all GEM objects.
+ *
+ * Return: If no loop restart occurred: The error status.
  */
-#define drm_exec_retry_on_contention(exec)			\
-	do {							\
-		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
-	} while (0)
+#define drm_exec_retry_on_contention(exec, _ret)			\
+	({								\
+		struct drm_exec *__exec = (exec);			\
+		int __ret = (_ret);					\
+									\
+		if (unlikely(drm_exec_is_contended(__exec))) {		\
+			WARN_ON(__ret != -EDEADLK);			\
+			__ret = drm_exec_handle_contended(__exec);	\
+			if (!__ret)					\
+				goto *__drm_exec_retry_ptr;		\
+		}							\
+		__ret;							\
+	})
 
 /**
  * drm_exec_is_contended - check for contention
-- 
2.44.0

