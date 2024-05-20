Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B628C9C01
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 13:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFCC10E574;
	Mon, 20 May 2024 11:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aD9NbJph";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9729210E49D;
 Mon, 20 May 2024 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Xo33A+sGBcBt2yED1u/Kz02ydxqSdiFHhRpCR+PJSY=; b=aD9NbJphNVZle83ymb830HSWYw
 Hn/SOeb08kwSwiEUwdzDYK6Utn989n1oZpPYaFSP/YBsAyMRe+K15ZapFojtkxJt/LcKz/Bg5bzxX
 QDLNbJDIlUdKt2OXKTh7cF2Rc7p2vT2rFajeob/CGHN3JUbyLUjBZsi2morHKqINT38t68Lbq8BOp
 WW51qVDaA9vdAc35Ri/KTYrmpinSjTbZOiH95xWMcljpLsBeG8un/ErzIK36neZbkA5tXXnQR7Yh0
 y0wmScr0MGfd86pOIWN66x/TIA2zde82R8+1BbdCiaGzX/OcpNdEC+/JWT8Qz9i0PEX0kMZAVE7LS
 Vc3oZPXg==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s90xZ-00ADSS-P5; Mon, 20 May 2024 13:13:41 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>
Subject: [PATCH 2/2] drm/amdgpu: Use drm_print_memory_stats helper from fdinfo
Date: Mon, 20 May 2024 12:13:38 +0100
Message-ID: <20240520111338.10110-2-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240520111338.10110-1-tursulin@igalia.com>
References: <20240520111338.10110-1-tursulin@igalia.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Convert fdinfo memory stats to use the common drm_print_memory_stats
helper.

This achieves alignment with the common keys as documented in
drm-usage-stats.rst, adding specifically drm-total- key the driver was
missing until now.

Additionally I made the code stop skipping total size for objects which
currently do not have a backing store, and I added resident, active and
purgeable reporting.

Legacy keys have been preserved, with the outlook of only potentially
removing only the drm-memory- when the time gets right.

The example output now looks like this:

 pos:	0
 flags:	02100002
 mnt_id:	24
 ino:	1239
 drm-driver:	amdgpu
 drm-client-id:	4
 drm-pdev:	0000:04:00.0
 pasid:	32771
 drm-total-cpu:	0
 drm-shared-cpu:	0
 drm-active-cpu:	0
 drm-resident-cpu:	0
 drm-purgeable-cpu:	0
 drm-total-gtt:	2392 KiB
 drm-shared-gtt:	0
 drm-active-gtt:	0
 drm-resident-gtt:	2392 KiB
 drm-purgeable-gtt:	0
 drm-total-vram:	44564 KiB
 drm-shared-vram:	31952 KiB
 drm-active-vram:	0
 drm-resident-vram:	44564 KiB
 drm-purgeable-vram:	0
 drm-memory-vram:	44564 KiB
 drm-memory-gtt: 	2392 KiB
 drm-memory-cpu: 	0 KiB
 amd-memory-visible-vram:	44564 KiB
 amd-evicted-vram:	0 KiB
 amd-evicted-visible-vram:	0 KiB
 amd-requested-vram:	44564 KiB
 amd-requested-visible-vram:	11952 KiB
 amd-requested-gtt:	2392 KiB
 drm-engine-compute:	46464671 ns

v2:
 * Track purgeable via AMDGPU_GEM_CREATE_DISCARDABLE.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c | 48 +++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 96 +++++++++++++++-------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 35 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 20 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h     |  3 +-
 6 files changed, 122 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
index c7df7fa3459f..00a4ab082459 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fdinfo.c
@@ -59,18 +59,21 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	struct amdgpu_fpriv *fpriv = file->driver_priv;
 	struct amdgpu_vm *vm = &fpriv->vm;
 
-	struct amdgpu_mem_stats stats;
+	struct amdgpu_mem_stats stats[__AMDGPU_PL_LAST + 1] = { };
 	ktime_t usage[AMDGPU_HW_IP_NUM];
-	unsigned int hw_ip;
+	const char *pl_name[] = {
+		[TTM_PL_VRAM] = "vram",
+		[TTM_PL_TT] = "gtt",
+		[TTM_PL_SYSTEM] = "cpu",
+	};
+	unsigned int hw_ip, i;
 	int ret;
 
-	memset(&stats, 0, sizeof(stats));
-
 	ret = amdgpu_bo_reserve(vm->root.bo, false);
 	if (ret)
 		return;
 
-	amdgpu_vm_get_memory(vm, &stats);
+	amdgpu_vm_get_memory(vm, stats, ARRAY_SIZE(stats));
 	amdgpu_bo_unreserve(vm->root.bo);
 
 	amdgpu_ctx_mgr_usage(&fpriv->ctx_mgr, usage);
@@ -82,24 +85,35 @@ void amdgpu_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	 */
 
 	drm_printf(p, "pasid:\t%u\n", fpriv->vm.pasid);
-	drm_printf(p, "drm-memory-vram:\t%llu KiB\n", stats.vram/1024UL);
-	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n", stats.gtt/1024UL);
-	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n", stats.cpu/1024UL);
+
+	for (i = 0; i < TTM_PL_PRIV; i++)
+		drm_print_memory_stats(p,
+				       &stats[i].drm,
+				       DRM_GEM_OBJECT_RESIDENT |
+				       DRM_GEM_OBJECT_PURGEABLE,
+				       pl_name[i]);
+
+	/* Legacy amdgpu keys, alias to drm-resident-memory-: */
+	drm_printf(p, "drm-memory-vram:\t%llu KiB\n",
+		   stats[TTM_PL_VRAM].total/1024UL);
+	drm_printf(p, "drm-memory-gtt: \t%llu KiB\n",
+		   stats[TTM_PL_TT].total/1024UL);
+	drm_printf(p, "drm-memory-cpu: \t%llu KiB\n",
+		   stats[TTM_PL_SYSTEM].total/1024UL);
+
+	/* Amdgpu specific memory accounting keys: */
 	drm_printf(p, "amd-memory-visible-vram:\t%llu KiB\n",
-		   stats.visible_vram/1024UL);
+		   stats[TTM_PL_VRAM].visible/1024UL);
 	drm_printf(p, "amd-evicted-vram:\t%llu KiB\n",
-		   stats.evicted_vram/1024UL);
+		   stats[TTM_PL_VRAM].evicted/1024UL);
 	drm_printf(p, "amd-evicted-visible-vram:\t%llu KiB\n",
-		   stats.evicted_visible_vram/1024UL);
+		   stats[TTM_PL_VRAM].evicted_visible/1024UL);
 	drm_printf(p, "amd-requested-vram:\t%llu KiB\n",
-		   stats.requested_vram/1024UL);
+		   stats[TTM_PL_VRAM].requested/1024UL);
 	drm_printf(p, "amd-requested-visible-vram:\t%llu KiB\n",
-		   stats.requested_visible_vram/1024UL);
+		   stats[TTM_PL_VRAM].requested_visible/1024UL);
 	drm_printf(p, "amd-requested-gtt:\t%llu KiB\n",
-		   stats.requested_gtt/1024UL);
-	drm_printf(p, "drm-shared-vram:\t%llu KiB\n", stats.vram_shared/1024UL);
-	drm_printf(p, "drm-shared-gtt:\t%llu KiB\n", stats.gtt_shared/1024UL);
-	drm_printf(p, "drm-shared-cpu:\t%llu KiB\n", stats.cpu_shared/1024UL);
+		   stats[TTM_PL_TT].requested/1024UL);
 
 	for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
 		if (!usage[hw_ip])
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index e44db1ee9c1d..9fd1f1a0e99c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -1286,54 +1286,92 @@ void amdgpu_bo_move_notify(struct ttm_buffer_object *bo,
 }
 
 void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
-			  struct amdgpu_mem_stats *stats)
+			  struct amdgpu_mem_stats *stats,
+			  unsigned int sz)
 {
+	const unsigned int domain_to_pl[] = {
+		[ilog2(AMDGPU_GEM_DOMAIN_CPU)]	    = TTM_PL_SYSTEM,
+		[ilog2(AMDGPU_GEM_DOMAIN_GTT)]	    = TTM_PL_TT,
+		[ilog2(AMDGPU_GEM_DOMAIN_VRAM)]	    = TTM_PL_VRAM,
+		[ilog2(AMDGPU_GEM_DOMAIN_GDS)]	    = AMDGPU_PL_GDS,
+		[ilog2(AMDGPU_GEM_DOMAIN_GWS)]	    = AMDGPU_PL_GWS,
+		[ilog2(AMDGPU_GEM_DOMAIN_OA)]	    = AMDGPU_PL_OA,
+		[ilog2(AMDGPU_GEM_DOMAIN_DOORBELL)] = AMDGPU_PL_DOORBELL,
+	};
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
 	struct ttm_resource *res = bo->tbo.resource;
+	struct drm_gem_object *obj = &bo->tbo.base;
 	uint64_t size = amdgpu_bo_size(bo);
-	struct drm_gem_object *obj;
-	bool shared;
+	unsigned int type;
 
-	/* Abort if the BO doesn't currently have a backing store */
-	if (!res)
-		return;
+	if (!res) {
+		/*
+		 * If no backing store use one of the preferred domain for basic
+		 * stats. We take the MSB since that should give a reasonable
+		 * view.
+		 */
+		BUILD_BUG_ON(TTM_PL_VRAM < TTM_PL_TT ||
+			     TTM_PL_VRAM < TTM_PL_SYSTEM);
+		type = fls(bo->preferred_domains & AMDGPU_GEM_DOMAIN_MASK);
+		if (!type)
+			return;
+		type--;
+		if (drm_WARN_ON_ONCE(&adev->ddev,
+				     type >= ARRAY_SIZE(domain_to_pl)))
+			return;
+		type = domain_to_pl[type];
+	} else {
+		type = res->mem_type;
+	}
 
-	obj = &bo->tbo.base;
-	shared = drm_gem_object_is_shared_for_memory_stats(obj);
-
-	switch (res->mem_type) {
+	/* Squash some into 'cpu' to keep the legacy userspace view. */
+	switch (type) {
 	case TTM_PL_VRAM:
-		stats->vram += size;
-		if (amdgpu_res_cpu_visible(adev, res))
-			stats->visible_vram += size;
-		if (shared)
-			stats->vram_shared += size;
-		break;
 	case TTM_PL_TT:
-		stats->gtt += size;
-		if (shared)
-			stats->gtt_shared += size;
-		break;
 	case TTM_PL_SYSTEM:
+		break;
 	default:
-		stats->cpu += size;
-		if (shared)
-			stats->cpu_shared += size;
+		type = TTM_PL_SYSTEM;
 		break;
 	}
 
+	if (drm_WARN_ON_ONCE(&adev->ddev, type >= sz))
+		return;
+
+	/* DRM stats common fields: */
+
+	stats[type].total += size;
+	if (drm_gem_object_is_shared_for_memory_stats(obj))
+		stats[type].drm.shared += size;
+	else
+		stats[type].drm.private += size;
+
+	if (res) {
+		stats[type].drm.resident += size;
+
+		if (!dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_BOOKKEEP))
+			stats[type].drm.active += size;
+		else if (bo->flags & AMDGPU_GEM_CREATE_DISCARDABLE)
+			stats[type].drm.purgeable += size;
+
+		if (type == TTM_PL_VRAM && amdgpu_res_cpu_visible(adev, res))
+			stats[type].visible += size;
+	}
+
+	/* amdgpu specific stats: */
+
 	if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM) {
-		stats->requested_vram += size;
+		stats[TTM_PL_VRAM].requested += size;
 		if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-			stats->requested_visible_vram += size;
+			stats[TTM_PL_VRAM].requested_visible += size;
 
-		if (res->mem_type != TTM_PL_VRAM) {
-			stats->evicted_vram += size;
+		if (type != TTM_PL_VRAM) {
+			stats[TTM_PL_VRAM].evicted += size;
 			if (bo->flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
-				stats->evicted_visible_vram += size;
+				stats[TTM_PL_VRAM].evicted_visible += size;
 		}
 	} else if (bo->preferred_domains & AMDGPU_GEM_DOMAIN_GTT) {
-		stats->requested_gtt += size;
+		stats[TTM_PL_TT].requested += size;
 	}
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
index bc42ccbde659..44774584a29f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
@@ -136,30 +136,14 @@ struct amdgpu_bo_vm {
 };
 
 struct amdgpu_mem_stats {
-	/* current VRAM usage, includes visible VRAM */
-	uint64_t vram;
-	/* current shared VRAM usage, includes visible VRAM */
-	uint64_t vram_shared;
-	/* current visible VRAM usage */
-	uint64_t visible_vram;
-	/* current GTT usage */
-	uint64_t gtt;
-	/* current shared GTT usage */
-	uint64_t gtt_shared;
-	/* current system memory usage */
-	uint64_t cpu;
-	/* current shared system memory usage */
-	uint64_t cpu_shared;
-	/* sum of evicted buffers, includes visible VRAM */
-	uint64_t evicted_vram;
-	/* sum of evicted buffers due to CPU access */
-	uint64_t evicted_visible_vram;
-	/* how much userspace asked for, includes vis.VRAM */
-	uint64_t requested_vram;
-	/* how much userspace asked for */
-	uint64_t requested_visible_vram;
-	/* how much userspace asked for */
-	uint64_t requested_gtt;
+	struct drm_memory_stats drm;
+
+	uint64_t total;
+	uint64_t visible;
+	uint64_t evicted;
+	uint64_t evicted_visible;
+	uint64_t requested;
+	uint64_t requested_visible;
 };
 
 static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
@@ -342,7 +326,8 @@ int amdgpu_bo_sync_wait(struct amdgpu_bo *bo, void *owner, bool intr);
 u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo);
 u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo);
 void amdgpu_bo_get_memory(struct amdgpu_bo *bo,
-			  struct amdgpu_mem_stats *stats);
+			  struct amdgpu_mem_stats *stats,
+			  unsigned int size);
 void amdgpu_bo_add_to_shadow_list(struct amdgpu_bo_vm *vmbo);
 int amdgpu_bo_restore_shadow(struct amdgpu_bo *shadow,
 			     struct dma_fence **fence);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 53d5a5990c31..b856506d1497 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -34,6 +34,7 @@
 #define AMDGPU_PL_OA		(TTM_PL_PRIV + 2)
 #define AMDGPU_PL_PREEMPT	(TTM_PL_PRIV + 3)
 #define AMDGPU_PL_DOORBELL	(TTM_PL_PRIV + 4)
+#define __AMDGPU_PL_LAST	(TTM_PL_PRIV + 4)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
 #define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	2
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 3abfa66d72a2..3e0a0ece9e7c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1089,7 +1089,8 @@ int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 }
 
 static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
-				    struct amdgpu_mem_stats *stats)
+				    struct amdgpu_mem_stats *stats,
+				    unsigned int size)
 {
 	struct amdgpu_vm *vm = bo_va->base.vm;
 	struct amdgpu_bo *bo = bo_va->base.bo;
@@ -1105,34 +1106,35 @@ static void amdgpu_vm_bo_get_memory(struct amdgpu_bo_va *bo_va,
 	    !dma_resv_trylock(bo->tbo.base.resv))
 		return;
 
-	amdgpu_bo_get_memory(bo, stats);
+	amdgpu_bo_get_memory(bo, stats, size);
 	if (!amdgpu_vm_is_bo_always_valid(vm, bo))
 		dma_resv_unlock(bo->tbo.base.resv);
 }
 
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
-			  struct amdgpu_mem_stats *stats)
+			  struct amdgpu_mem_stats *stats,
+			  unsigned int size)
 {
 	struct amdgpu_bo_va *bo_va, *tmp;
 
 	spin_lock(&vm->status_lock);
 	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->invalidated, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 
 	list_for_each_entry_safe(bo_va, tmp, &vm->done, base.vm_status)
-		amdgpu_vm_bo_get_memory(bo_va, stats);
+		amdgpu_vm_bo_get_memory(bo_va, stats, size);
 	spin_unlock(&vm->status_lock);
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 312a408b80d3..478a158ae171 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -556,7 +556,8 @@ void amdgpu_vm_set_task_info(struct amdgpu_vm *vm);
 void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
 				struct amdgpu_vm *vm);
 void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
-			  struct amdgpu_mem_stats *stats);
+			  struct amdgpu_mem_stats *stats,
+			  unsigned int size);
 
 int amdgpu_vm_pt_clear(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 		       struct amdgpu_bo_vm *vmbo, bool immediate);
-- 
2.44.0

