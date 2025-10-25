Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C5C09313
	for <lists+dri-devel@lfdr.de>; Sat, 25 Oct 2025 18:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D388310E29C;
	Sat, 25 Oct 2025 16:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PQArbhm3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5233910E29B;
 Sat, 25 Oct 2025 16:10:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 385CC44B4D;
 Sat, 25 Oct 2025 16:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FE34C4CEFF;
 Sat, 25 Oct 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761408615;
 bh=RVIKXVH5UErh0acqJO/K+Fvyk5QKptR9ypjhsRzx8vg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PQArbhm3tGtHhTQPz/C0noOHEp5R2lU6qYTestsaOPrZsXcemEwY4G9zSKm+cH8+4
 Y6FTUibImLYh3lwDE8qnqiM7eIdg3/yFNC0KLVlWcD9rmYooOXyzVv0bagl/E4vywk
 5JFLfYEEd5JSMZ/rRvVvALD0kvdFBY1fbXPU6ILc76/tftrmkkz6ISUr0p0fd+TR1I
 i4vwai6MwwVy9iHVkH1c/TT4nUzzTeT+KF6Gi922ly9mSJ/RvCIM4lJEDtSw9+v1UD
 Dzz/nUV1ikDkZWOviQ0GntjDup2bb0vNU7fF+nU9DJs9rlOcTPJnluIF/E81qppDoD
 wO/g+X7a2bL/A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Sasha Levin <sashal@kernel.org>, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, sumit.semwal@linaro.org, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH AUTOSEL 6.17] drm/xe: improve dma-resv handling for backup
 object
Date: Sat, 25 Oct 2025 11:54:16 -0400
Message-ID: <20251025160905.3857885-25-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
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

From: Matthew Auld <matthew.auld@intel.com>

[ Upstream commit edb1745fc618ba8ef63a45ce3ae60de1bdf29231 ]

Since the dma-resv is shared we don't need to reserve and add a fence
slot fence twice, plus no need to loop through the dependencies.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Link: https://lore.kernel.org/r/20250829164715.720735-2-matthew.auld@intel.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Explanation

- What it fixes
  - Removes redundant dma-resv operations when a backup BO shares the
    same reservation object as the original BO, preventing the same
    fence from being reserved/added twice to the same `dma_resv`.
  - Avoids scanning the same dependency set twice when source and
    destination BOs share the same `dma_resv`.

- Why the change is correct
  - The backup object is created to share the parent’s reservation
    object, so a single reserve/add is sufficient:
    - The backup BO is initialized with the parent’s resv:
      `drivers/gpu/drm/xe/xe_bo.c:1309` (`xe_bo_init_locked(...,
      bo->ttm.base.resv, ...)`), ensuring `bo->ttm.base.resv ==
      backup->ttm.base.resv`.
    - The patch adds an explicit invariant check to document and enforce
      this: `drivers/gpu/drm/xe/xe_bo.c:1225` (`xe_assert(xe,
      bo->ttm.base.resv == backup->ttm.base.resv)`).
  - With shared `dma_resv`, adding the same fence twice is at best
    redundant (wasting fence slots and memory) and at worst error-prone.
    Reserving fence slots only once and adding the fence once is the
    correct behavior.

- Specific code changes and effects
  - Evict path (GPU migration copy case):
    - Before: reserves and adds fence on both `bo->ttm.base.resv` and
      `backup->ttm.base.resv`.
    - After: reserves and adds exactly once, guarded by the shared-resv
      assertion.
    - See single reserve and add: `drivers/gpu/drm/xe/xe_bo.c:1226`
      (reserve) and `drivers/gpu/drm/xe/xe_bo.c:1237` (add fence). This
      is the core fix; the removed second reserve/add on the backup is
      the redundant part eliminated.
  - Restore path (migration copy back):
    - Same simplification: reserve once, add once on the shared
      `dma_resv`.
    - See single reserve and add: `drivers/gpu/drm/xe/xe_bo.c:1375`
      (reserve) and `drivers/gpu/drm/xe/xe_bo.c:1387` (add fence).
  - Dependency handling in migrate:
    - Before: added deps for both src and dst based only on `src_bo !=
      dst_bo`.
    - After: only add dst deps if the resv objects differ, avoiding
      double-walking the same `dma_resv`.
    - See updated condition: `drivers/gpu/drm/xe/xe_migrate.c:932`
      (`src_bo->ttm.base.resv != dst_bo->ttm.base.resv`).

- User-visible impact without the patch
  - Duplicate `dma_resv_add_fence()` calls on the same reservation
    object can:
    - Consume extra shared-fence slots and memory.
    - Inflate dependency lists, causing unnecessary scheduler waits and
      overhead.
    - Increase failure likelihood of `dma_resv_reserve_fences()` under
      memory pressure.
  - These paths are exercised during suspend/resume flows of pinned VRAM
    BOs (evict/restore), so reliability and performance in power
    transitions can be affected.

- Scope and risk
  - Small, focused changes localized to the Intel Xe driver
    migration/evict/restore paths:
    - Files: `drivers/gpu/drm/xe/xe_bo.c`,
      `drivers/gpu/drm/xe/xe_migrate.c`.
  - No API changes or architectural refactors; logic strictly reduces
    redundant operations.
  - The `xe_assert` acts as a safety net to catch unexpected non-shared
    `resv` usage; normal runtime behavior is unchanged when the
    invariant holds.
  - The CPU copy fallback paths are untouched.

- Stable backport considerations
  - This is a clear correctness and robustness fix, not a feature.
  - Low regression risk if the stable branch also creates the backup BO
    with the parent’s `dma_resv` (as shown by the use of
    `xe_bo_init_locked(..., bo->ttm.base.resv, ...)` in
    `drivers/gpu/drm/xe/xe_bo.c:1309`).
  - If a stable branch diverges and the backup BO does not share the
    resv, this patch would need adjustment (i.e., keep dual reserve/add
    in that case). The added `xe_assert` helps surface such mismatches
    during testing.

Conclusion: This commit fixes a real bug (duplicate fence reserve/add
and duplicate dependency scanning on a shared `dma_resv`) with a
minimal, well-scoped change. It aligns with stable rules (important
bugfix, low risk, contained), so it should be backported.

 drivers/gpu/drm/xe/xe_bo.c      | 13 +------------
 drivers/gpu/drm/xe/xe_migrate.c |  2 +-
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index d07e23eb1a54d..5a61441d68af5 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1242,14 +1242,11 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 		else
 			migrate = mem_type_to_migrate(xe, bo->ttm.resource->mem_type);
 
+		xe_assert(xe, bo->ttm.base.resv == backup->ttm.base.resv);
 		ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
 		if (ret)
 			goto out_backup;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_backup;
-
 		fence = xe_migrate_copy(migrate, bo, backup, bo->ttm.resource,
 					backup->ttm.resource, false);
 		if (IS_ERR(fence)) {
@@ -1259,8 +1256,6 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
@@ -1338,10 +1333,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 		if (ret)
 			goto out_unlock_bo;
 
-		ret = dma_resv_reserve_fences(backup->ttm.base.resv, 1);
-		if (ret)
-			goto out_unlock_bo;
-
 		fence = xe_migrate_copy(migrate, backup, bo,
 					backup->ttm.resource, bo->ttm.resource,
 					false);
@@ -1352,8 +1343,6 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
 
 		dma_resv_add_fence(bo->ttm.base.resv, fence,
 				   DMA_RESV_USAGE_KERNEL);
-		dma_resv_add_fence(backup->ttm.base.resv, fence,
-				   DMA_RESV_USAGE_KERNEL);
 		dma_fence_put(fence);
 	} else {
 		ret = xe_bo_vmap(backup);
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 2a627ed64b8f8..ba9b8590eccb2 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -901,7 +901,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 		if (!fence) {
 			err = xe_sched_job_add_deps(job, src_bo->ttm.base.resv,
 						    DMA_RESV_USAGE_BOOKKEEP);
-			if (!err && src_bo != dst_bo)
+			if (!err && src_bo->ttm.base.resv != dst_bo->ttm.base.resv)
 				err = xe_sched_job_add_deps(job, dst_bo->ttm.base.resv,
 							    DMA_RESV_USAGE_BOOKKEEP);
 			if (err)
-- 
2.51.0

