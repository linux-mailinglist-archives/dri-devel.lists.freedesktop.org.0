Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D18AAA0D1
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AF010E50B;
	Mon,  5 May 2025 22:39:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fbD4RZKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B9910E50A;
 Mon,  5 May 2025 22:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A9693A4CF31;
 Mon,  5 May 2025 22:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FC7C4CEE4;
 Mon,  5 May 2025 22:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484753;
 bh=/lYO5Z2VQkBpDzKHnqmkPOWqqSCovpwFsU3/7ca67KI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fbD4RZKyUs96mud8xhFSZ9BhxIyn09uZH7GfGK3YW+zxWAMrGOpy1OrWqsNFTLr1/
 XKSPEW6+C9v/7fPJ9FwcMkHmPoB6faU0uoE5c6bNHAnqRwlEScXom/l8igueFdVcZv
 +Jh7oz2oscGaaKW9i0VsOheKEWCr8zZGFOhrVtxtKGHCqSK4BZ1dPlunzNvCfV3DZQ
 Ew7E8gFwAunNkbRwlXlBzEo4UBE2W3i3WHgJb2Oc2o9kdV8sPWJlC/5xc5nkfBPSZr
 m9uF/cQhGSAoTtZaJWcKbXuzjJhWibsgsiWpM8zOyhe0v4Eosdlkmo1kbN5zZJV2oj
 B0tuNOH+i9xWQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xiaogang Chen <xiaogang.chen@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, srinivasan.shanmugam@amd.com, tvrtko.ursulin@igalia.com,
 mdaenzer@redhat.com, Yunxiang.Li@amd.com, Longlong.Yao@amd.com,
 shane.xiao@amd.com, Philip.Yang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 639/642] drm/amdkfd: Fix pasid value leak
Date: Mon,  5 May 2025 18:14:15 -0400
Message-Id: <20250505221419.2672473-639-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Xiaogang Chen <xiaogang.chen@amd.com>

[ Upstream commit 10e08943caedfb4b0b95933d248503a6f6b9fef6 ]

Curret kfd does not allocate pasid values, instead uses pasid value for each
vm from graphic driver. So should not prevent graphic driver from releasing
pasid values since the values are allocated by graphic driver, not kfd driver
anymore. This patch does not stop graphic driver release pasid values.

Fixes: 8544374c0f82 ("drm/amdkfd: Have kfd driver use same PASID values from graphic driver")
Signed-off-by: Xiaogang Chen <xiaogang.chen@amd.com>
Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 --
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 21 -------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 14 -------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  1 -
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +----
 5 files changed, 1 insertion(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index a160ffe80b3de..55d5399676951 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -303,8 +303,6 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct amdgpu_device *adev,
 					struct amdgpu_vm *avm,
 					void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
-					void *drm_priv);
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev,
 					uint8_t xcp_id);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 0c8129f8d3635..b3c8eae460425 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1578,27 +1578,6 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct amdgpu_device *adev,
-					    void *drm_priv)
-{
-	struct amdgpu_vm *avm;
-
-	if (WARN_ON(!adev || !drm_priv))
-		return;
-
-	avm = drm_priv_to_vm(drm_priv);
-
-	pr_debug("Releasing process vm %p\n", avm);
-
-	/* The original pasid of amdgpu vm has already been
-	 * released during making a amdgpu vm to a compute vm
-	 * The current pasid is managed by kfd and will be
-	 * released on kfd process destroy. Set amdgpu pasid
-	 * to 0 to avoid duplicate release.
-	 */
-	amdgpu_vm_release_compute(adev, avm);
-}
-
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 {
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index f0d675c0fc69c..21be10d46cf9c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2687,20 +2687,6 @@ int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 	return r;
 }
 
-/**
- * amdgpu_vm_release_compute - release a compute vm
- * @adev: amdgpu_device pointer
- * @vm: a vm turned into compute vm by calling amdgpu_vm_make_compute
- *
- * This is a correspondant of amdgpu_vm_make_compute. It decouples compute
- * pasid from vm. Compute should stop use of vm after this call.
- */
-void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
-{
-	amdgpu_vm_set_pasid(adev, vm, 0);
-	vm->is_compute_context = false;
-}
-
 static int amdgpu_vm_stats_is_zero(struct amdgpu_vm *vm)
 {
 	for (int i = 0; i < __AMDGPU_PL_NUM; ++i) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 5010a3107bf89..f3ad687125ad6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -489,7 +489,6 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 long amdgpu_vm_wait_idle(struct amdgpu_vm *vm, long timeout);
 int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp_id);
 int amdgpu_vm_make_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
-void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
 		      unsigned int num_fences);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 3f411922534b3..7c0c24732481e 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1059,11 +1059,8 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 		kfd_process_device_destroy_cwsr_dgpu(pdd);
 		kfd_process_device_destroy_ib_mem(pdd);
 
-		if (pdd->drm_file) {
-			amdgpu_amdkfd_gpuvm_release_process_vm(
-					pdd->dev->adev, pdd->drm_priv);
+		if (pdd->drm_file)
 			fput(pdd->drm_file);
-		}
 
 		if (pdd->qpd.cwsr_kaddr && !pdd->qpd.cwsr_base)
 			free_pages((unsigned long)pdd->qpd.cwsr_kaddr,
-- 
2.39.5

