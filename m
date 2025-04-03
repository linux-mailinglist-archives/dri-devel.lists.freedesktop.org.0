Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B4A7AA7C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 21:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6697810EA7E;
	Thu,  3 Apr 2025 19:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ttPfebNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDCB10EA7E;
 Thu,  3 Apr 2025 19:13:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D1352614B3;
 Thu,  3 Apr 2025 19:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9934BC4CEE8;
 Thu,  3 Apr 2025 19:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743707636;
 bh=pcL6vRjTmWS/5cO6u0gKhKia8cXQkB50tLN0IonKNhk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ttPfebNIVZwcIEIysAr/DdneGuIs6IJs41KAYNIJk524fnD0gAdAdtK4sJ1sJcPBt
 O3T8myRIinUfRe6gLGXeTM8UusjhrlJkS6sc/6a8Vs3MHeo8Et5a298uOrFbJseStb
 MwtQEdr/4o0nQ8kxc1+5it2qtGk5LkiQAutOsmUi6r9psIehWv/Ytuq7GyNhOeFUU3
 taBHuwrh8jqY2CtcK3mzvt1dtxL6d3adDPck050czy4ruxT0fnK0VIfIdyM/Qjxx66
 aswtcDUnIYI+wwVX+wXokR/awEJeK/gpGWaX7JxX+gy38HKy64TXErCRDG8/6zJ6r0
 liIvnjBswURoA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philip Yang <Philip.Yang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 airlied@gmail.com, simona@ffwll.ch, srinivasan.shanmugam@amd.com,
 tvrtko.ursulin@igalia.com, xiaogang.chen@amd.com, Yunxiang.Li@amd.com,
 xinhui.pan@amd.com, Hawking.Zhang@amd.com, Longlong.Yao@amd.com,
 shane.xiao@amd.com, jesse.zhang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 11/44] drm/amdgpu: Unlocked unmap only clear page
 table leaves
Date: Thu,  3 Apr 2025 15:12:40 -0400
Message-Id: <20250403191313.2679091-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403191313.2679091-1-sashal@kernel.org>
References: <20250403191313.2679091-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
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

From: Philip Yang <Philip.Yang@amd.com>

[ Upstream commit 23b645231eeffdaf44021debac881d2f26824150 ]

SVM migration unmap pages from GPU and then update mapping to GPU to
recover page fault. Currently unmap clears the PDE entry for range
length >= huge page and free PTB bo, update mapping to alloc new PT bo.
There is race bug that the freed entry bo maybe still on the pt_free
list, reused when updating mapping and then freed, leave invalid PDE
entry and cause GPU page fault.

By setting the update to clear only one PDE entry or clear PTB, to
avoid unmap to free PTE bo. This fixes the race bug and improve the
unmap and map to GPU performance. Update mapping to huge page will
still free the PTB bo.

With this change, the vm->pt_freed list and work is not needed. Add
WARN_ON(unlocked) in amdgpu_vm_pt_free_dfs to catch if unmap to free the
PTB.

Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  4 ---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c | 43 +++++++----------------
 3 files changed, 13 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5c07777d3239e..22aa4a8f11891 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -2534,8 +2534,6 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	spin_lock_init(&vm->status_lock);
 	INIT_LIST_HEAD(&vm->freed);
 	INIT_LIST_HEAD(&vm->done);
-	INIT_LIST_HEAD(&vm->pt_freed);
-	INIT_WORK(&vm->pt_free_work, amdgpu_vm_pt_free_work);
 	INIT_KFIFO(vm->faults);
 
 	r = amdgpu_vm_init_entities(adev, vm);
@@ -2717,8 +2715,6 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 
 	amdgpu_amdkfd_gpuvm_destroy_cb(adev, vm);
 
-	flush_work(&vm->pt_free_work);
-
 	root = amdgpu_bo_ref(vm->root.bo);
 	amdgpu_bo_reserve(root, true);
 	amdgpu_vm_set_pasid(adev, vm, 0);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index a3e128e373bc6..5010a3107bf89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -374,10 +374,6 @@ struct amdgpu_vm {
 	/* BOs which are invalidated, has been updated in the PTs */
 	struct list_head        done;
 
-	/* PT BOs scheduled to free and fill with zero if vm_resv is not hold */
-	struct list_head	pt_freed;
-	struct work_struct	pt_free_work;
-
 	/* contains the page directory */
 	struct amdgpu_vm_bo_base     root;
 	struct dma_fence	*last_update;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
index b0bf216821152..30022123b0bf6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
@@ -547,27 +547,6 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
 	amdgpu_bo_unref(&entry->bo);
 }
 
-void amdgpu_vm_pt_free_work(struct work_struct *work)
-{
-	struct amdgpu_vm_bo_base *entry, *next;
-	struct amdgpu_vm *vm;
-	LIST_HEAD(pt_freed);
-
-	vm = container_of(work, struct amdgpu_vm, pt_free_work);
-
-	spin_lock(&vm->status_lock);
-	list_splice_init(&vm->pt_freed, &pt_freed);
-	spin_unlock(&vm->status_lock);
-
-	/* flush_work in amdgpu_vm_fini ensure vm->root.bo is valid. */
-	amdgpu_bo_reserve(vm->root.bo, true);
-
-	list_for_each_entry_safe(entry, next, &pt_freed, vm_status)
-		amdgpu_vm_pt_free(entry);
-
-	amdgpu_bo_unreserve(vm->root.bo);
-}
-
 /**
  * amdgpu_vm_pt_free_list - free PD/PT levels
  *
@@ -580,19 +559,15 @@ void amdgpu_vm_pt_free_list(struct amdgpu_device *adev,
 			    struct amdgpu_vm_update_params *params)
 {
 	struct amdgpu_vm_bo_base *entry, *next;
-	struct amdgpu_vm *vm = params->vm;
 	bool unlocked = params->unlocked;
 
 	if (list_empty(&params->tlb_flush_waitlist))
 		return;
 
-	if (unlocked) {
-		spin_lock(&vm->status_lock);
-		list_splice_init(&params->tlb_flush_waitlist, &vm->pt_freed);
-		spin_unlock(&vm->status_lock);
-		schedule_work(&vm->pt_free_work);
-		return;
-	}
+	/*
+	 * unlocked unmap clear page table leaves, warning to free the page entry.
+	 */
+	WARN_ON(unlocked);
 
 	list_for_each_entry_safe(entry, next, &params->tlb_flush_waitlist, vm_status)
 		amdgpu_vm_pt_free(entry);
@@ -900,7 +875,15 @@ int amdgpu_vm_ptes_update(struct amdgpu_vm_update_params *params,
 		incr = (uint64_t)AMDGPU_GPU_PAGE_SIZE << shift;
 		mask = amdgpu_vm_pt_entries_mask(adev, cursor.level);
 		pe_start = ((cursor.pfn >> shift) & mask) * 8;
-		entry_end = ((uint64_t)mask + 1) << shift;
+
+		if (cursor.level < AMDGPU_VM_PTB && params->unlocked)
+			/*
+			 * MMU notifier callback unlocked unmap huge page, leave is PDE entry,
+			 * only clear one entry. Next entry search again for PDE or PTE leave.
+			 */
+			entry_end = 1ULL << shift;
+		else
+			entry_end = ((uint64_t)mask + 1) << shift;
 		entry_end += cursor.pfn & ~(entry_end - 1);
 		entry_end = min(entry_end, end);
 
-- 
2.39.5

