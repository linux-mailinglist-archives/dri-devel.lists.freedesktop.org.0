Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4506A5471
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3732710E64C;
	Tue, 28 Feb 2023 08:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8986910E626;
 Tue, 28 Feb 2023 08:34:14 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cy6so36574483edb.5;
 Tue, 28 Feb 2023 00:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ejcfY+E3vME/sqVnFHUimaogQlTqln+Q5Izv7Jgfjzw=;
 b=KSFHq9EcNGMl6KygH8039s0iqb863RGoblGEmK186D9ngvtqyeXEQO8T8//eerZ3VQ
 ghzG8/yELdKL9FR4JPteAqNZ7E1qMIGWT6/v1TfjcB3IhzJsR5BpOZ+HFUv6+QBNdoSl
 kNbdOPchH+X4gRHwrR8t88AnN5w4QpgXedZ1K4OgMGY+p39LEDwLVNGJW8FcXOib8o/I
 krq9aFk6cyG3P4A+xUEm2n/EmrWZYRMnz9BL8i9th7OMYHVzDyR6BHCM9FMxaSphawhq
 vpWwV5DlWoQHJGssEFBztWUkcqxR4sVof+qgkCuA2SI99CgJWKgpn14TVmsGvjp/jsxz
 OkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejcfY+E3vME/sqVnFHUimaogQlTqln+Q5Izv7Jgfjzw=;
 b=nJsZq6fX4jAoZPVu0KJoGtdI1JOAXllioukXorZu6lxl1GUq7lk6u0Y0PlDLDgrmgv
 IDVYtx2Lg7ZS5k2A+oR5bQv7tVPIMKA0+lvJqBhmiR3efFjhWLKG8nCSOSq87nhzSOAI
 3fiNxS43rr8rfcX9a2MY+FP8fGVlDPwKdlAMi1TuQfiCLAdFSvo4oDiOKnYiHD0LU2WU
 fK/xeZOSoT1vuN69EstEj6x7U32Amq5Pi9txEeSUkcIYvpWegZM5vPzVw3FuGWTwNpJg
 O7RpKFC8/IGpRu5xRQ/E4YTLwpOtFmoocGyPDmcc2CRWDfLOWCoNn8WNuxbGkfh6WfaY
 q+BA==
X-Gm-Message-State: AO0yUKWAZck2sAeShvB+OVLGiaUYhTKvFLXWOWh+sBBvfqgswQn9ansj
 f70DOycthnhoaWBTCQOk8lbiIfHYuuY=
X-Google-Smtp-Source: AK7set84c+txZz+f15k9e4rWkQKjovif7ziPnOaJauQhSde6R3yZkk6qJo1BjT9OPQGgPZn2hVTUMg==
X-Received: by 2002:a17:907:38e:b0:88d:3c85:4ccf with SMTP id
 ss14-20020a170907038e00b0088d3c854ccfmr1436082ejb.25.1677573253095; 
 Tue, 28 Feb 2023 00:34:13 -0800 (PST)
Received: from able.fritz.box (p5b0ea2e7.dip0.t-ipconnect.de. [91.14.162.231])
 by smtp.gmail.com with ESMTPSA id
 ss17-20020a170907039100b008cf6f8798e1sm4296969ejb.54.2023.02.28.00.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 00:34:12 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/amdkfd: switch over to using drm_exec
Date: Tue, 28 Feb 2023 09:34:00 +0100
Message-Id: <20230228083406.1720795-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230228083406.1720795-1-christian.koenig@amd.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
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
Cc: dakr@redhat.com, arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoids quite a bit of logic and kmalloc overhead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 302 +++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  32 +-
 5 files changed, 151 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 333780491867..e9ef493091a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -25,13 +25,13 @@
 #ifndef AMDGPU_AMDKFD_H_INCLUDED
 #define AMDGPU_AMDKFD_H_INCLUDED
 
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
 #include <linux/mmu_notifier.h>
 #include <kgd_kfd_interface.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
 
@@ -69,8 +69,7 @@ struct kgd_mem {
 	struct hmm_range *range;
 	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
-	struct ttm_validate_buffer validate_list;
-	struct ttm_validate_buffer resv_list;
+	struct list_head validate_list;
 	uint32_t domain;
 	unsigned int mapped_to_gpu_memory;
 	uint64_t va;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index d6320c836251..2f4aeaf711a9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -27,6 +27,8 @@
 #include <linux/sched/task.h>
 #include <drm/ttm/ttm_tt.h>
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu_object.h"
 #include "amdgpu_gem.h"
 #include "amdgpu_vm.h"
@@ -897,28 +899,19 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
 				struct amdkfd_process_info *process_info,
 				bool userptr)
 {
-	struct ttm_validate_buffer *entry = &mem->validate_list;
-	struct amdgpu_bo *bo = mem->bo;
-
-	INIT_LIST_HEAD(&entry->head);
-	entry->num_shared = 1;
-	entry->bo = &bo->tbo;
-	mutex_lock(&process_info->lock);
 	if (userptr)
-		list_add_tail(&entry->head, &process_info->userptr_valid_list);
+		list_add_tail(&mem->validate_list,
+			      &process_info->userptr_valid_list);
 	else
-		list_add_tail(&entry->head, &process_info->kfd_bo_list);
+		list_add_tail(&mem->validate_list, &process_info->kfd_bo_list);
 	mutex_unlock(&process_info->lock);
 }
 
 static void remove_kgd_mem_from_kfd_bo_list(struct kgd_mem *mem,
 		struct amdkfd_process_info *process_info)
 {
-	struct ttm_validate_buffer *bo_list_entry;
-
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 }
 
@@ -1005,13 +998,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
  * object can track VM updates.
  */
 struct bo_vm_reservation_context {
-	struct amdgpu_bo_list_entry kfd_bo; /* BO list entry for the KFD BO */
-	unsigned int n_vms;		    /* Number of VMs reserved	    */
-	struct amdgpu_bo_list_entry *vm_pd; /* Array of VM BO list entries  */
-	struct ww_acquire_ctx ticket;	    /* Reservation ticket	    */
-	struct list_head list, duplicates;  /* BO lists			    */
-	struct amdgpu_sync *sync;	    /* Pointer to sync object	    */
-	bool reserved;			    /* Whether BOs are reserved	    */
+	/* DRM execution context for the reservation */
+	struct drm_exec exec;
+	/* Number of VMs reserved */
+	unsigned int n_vms;
+	/* Pointer to sync object */
+	struct amdgpu_sync *sync;
 };
 
 enum bo_vm_match {
@@ -1035,35 +1027,24 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
 	WARN_ON(!vm);
 
-	ctx->reserved = false;
 	ctx->n_vms = 1;
 	ctx->sync = &mem->sync;
-
-	INIT_LIST_HEAD(&ctx->list);
-	INIT_LIST_HEAD(&ctx->duplicates);
-
-	ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd), GFP_KERNEL);
-	if (!ctx->vm_pd)
-		return -ENOMEM;
-
-	ctx->kfd_bo.priority = 0;
-	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
-	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
-
-	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
-
-	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
-				     false, &ctx->duplicates);
-	if (ret) {
-		pr_err("Failed to reserve buffers in ttm.\n");
-		kfree(ctx->vm_pd);
-		ctx->vm_pd = NULL;
-		return ret;
+	drm_exec_init(&ctx->exec, true);
+	drm_exec_while_not_all_locked(&ctx->exec) {
+		ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
+		if (likely(!ret))
+			ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base,
+						   0);
+		drm_exec_continue_on_contention(&ctx->exec);
+		if (unlikely(ret))
+			goto error;
 	}
-
-	ctx->reserved = true;
 	return 0;
+
+error:
+	pr_err("Failed to reserve buffers in ttm.\n");
+	drm_exec_fini(&ctx->exec);
+	return ret;
 }
 
 /**
@@ -1080,63 +1061,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 				struct amdgpu_vm *vm, enum bo_vm_match map_type,
 				struct bo_vm_reservation_context *ctx)
 {
-	struct amdgpu_bo *bo = mem->bo;
 	struct kfd_mem_attachment *entry;
-	unsigned int i;
+	struct amdgpu_bo *bo = mem->bo;
 	int ret;
 
-	ctx->reserved = false;
-	ctx->n_vms = 0;
-	ctx->vm_pd = NULL;
 	ctx->sync = &mem->sync;
+	drm_exec_init(&ctx->exec, true);
+	drm_exec_while_not_all_locked(&ctx->exec) {
+		ctx->n_vms = 0;
+		list_for_each_entry(entry, &mem->attachments, list) {
+			if ((vm && vm != entry->bo_va->base.vm) ||
+				(entry->is_mapped != map_type
+				&& map_type != BO_VM_ALL))
+				continue;
 
-	INIT_LIST_HEAD(&ctx->list);
-	INIT_LIST_HEAD(&ctx->duplicates);
-
-	list_for_each_entry(entry, &mem->attachments, list) {
-		if ((vm && vm != entry->bo_va->base.vm) ||
-			(entry->is_mapped != map_type
-			&& map_type != BO_VM_ALL))
-			continue;
-
-		ctx->n_vms++;
-	}
-
-	if (ctx->n_vms != 0) {
-		ctx->vm_pd = kcalloc(ctx->n_vms, sizeof(*ctx->vm_pd),
-				     GFP_KERNEL);
-		if (!ctx->vm_pd)
-			return -ENOMEM;
-	}
-
-	ctx->kfd_bo.priority = 0;
-	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
-	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
-
-	i = 0;
-	list_for_each_entry(entry, &mem->attachments, list) {
-		if ((vm && vm != entry->bo_va->base.vm) ||
-			(entry->is_mapped != map_type
-			&& map_type != BO_VM_ALL))
-			continue;
-
-		amdgpu_vm_get_pd_bo(entry->bo_va->base.vm, &ctx->list,
-				&ctx->vm_pd[i]);
-		i++;
-	}
+			ret = amdgpu_vm_lock_pd(vm, &ctx->exec);
+			drm_exec_break_on_contention(&ctx->exec);
+			if (unlikely(ret))
+				goto error;
+			++ctx->n_vms;
+		}
+		drm_exec_continue_on_contention(&ctx->exec);
 
-	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
-				     false, &ctx->duplicates);
-	if (ret) {
-		pr_err("Failed to reserve buffers in ttm.\n");
-		kfree(ctx->vm_pd);
-		ctx->vm_pd = NULL;
-		return ret;
+		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
+		drm_exec_continue_on_contention(&ctx->exec);
+		if (unlikely(ret))
+			goto error;
 	}
-
-	ctx->reserved = true;
 	return 0;
+
+error:
+	pr_err("Failed to reserve buffers in ttm.\n");
+	drm_exec_fini(&ctx->exec);
+	return ret;
 }
 
 /**
@@ -1157,15 +1114,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
 	if (wait)
 		ret = amdgpu_sync_wait(ctx->sync, intr);
 
-	if (ctx->reserved)
-		ttm_eu_backoff_reservation(&ctx->ticket, &ctx->list);
-	kfree(ctx->vm_pd);
-
+	drm_exec_fini(&ctx->exec);
 	ctx->sync = NULL;
-
-	ctx->reserved = false;
-	ctx->vm_pd = NULL;
-
 	return ret;
 }
 
@@ -1752,7 +1702,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	bool use_release_notifier = (mem->bo->kfd_bo == mem);
 	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
-	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
 	bool is_imported = false;
@@ -1780,9 +1729,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Make sure restore workers don't access the BO any more */
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 
 	/* Cleanup user pages and MMU notifiers */
@@ -2324,14 +2272,14 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 	/* Move all invalidated BOs to the userptr_inval_list */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_valid_list,
-				 validate_list.head)
+				 validate_list)
 		if (mem->invalid)
-			list_move_tail(&mem->validate_list.head,
+			list_move_tail(&mem->validate_list,
 				       &process_info->userptr_inval_list);
 
 	/* Go through userptr_inval_list and update any invalid user_pages */
 	list_for_each_entry(mem, &process_info->userptr_inval_list,
-			    validate_list.head) {
+			    validate_list) {
 		invalid = mem->invalid;
 		if (!invalid)
 			/* BO hasn't been invalidated since the last
@@ -2409,50 +2357,43 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
  */
 static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 {
-	struct amdgpu_bo_list_entry *pd_bo_list_entries;
-	struct list_head resv_list, duplicates;
-	struct ww_acquire_ctx ticket;
+	struct ttm_operation_ctx ctx = { false, false };
 	struct amdgpu_sync sync;
+	struct drm_exec exec;
 
 	struct amdgpu_vm *peer_vm;
 	struct kgd_mem *mem, *tmp_mem;
 	struct amdgpu_bo *bo;
-	struct ttm_operation_ctx ctx = { false, false };
-	int i, ret;
-
-	pd_bo_list_entries = kcalloc(process_info->n_vms,
-				     sizeof(struct amdgpu_bo_list_entry),
-				     GFP_KERNEL);
-	if (!pd_bo_list_entries) {
-		pr_err("%s: Failed to allocate PD BO list entries\n", __func__);
-		ret = -ENOMEM;
-		goto out_no_mem;
-	}
-
-	INIT_LIST_HEAD(&resv_list);
-	INIT_LIST_HEAD(&duplicates);
+	int ret;
 
-	/* Get all the page directory BOs that need to be reserved */
-	i = 0;
-	list_for_each_entry(peer_vm, &process_info->vm_list_head,
-			    vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &resv_list,
-				    &pd_bo_list_entries[i++]);
-	/* Add the userptr_inval_list entries to resv_list */
-	list_for_each_entry(mem, &process_info->userptr_inval_list,
-			    validate_list.head) {
-		list_add_tail(&mem->resv_list.head, &resv_list);
-		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
-	}
+	amdgpu_sync_create(&sync);
 
+	drm_exec_init(&exec, true);
 	/* Reserve all BOs and page tables for validation */
-	ret = ttm_eu_reserve_buffers(&ticket, &resv_list, false, &duplicates);
-	WARN(!list_empty(&duplicates), "Duplicates should be empty");
-	if (ret)
-		goto out_free;
+	drm_exec_while_not_all_locked(&exec) {
+		/* Reserve all the page directories */
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	amdgpu_sync_create(&sync);
+		/* Reserve the userptr_inval_list entries to resv_list */
+		list_for_each_entry(mem, &process_info->userptr_inval_list,
+				    validate_list) {
+			struct drm_gem_object *gobj;
+
+			gobj = &mem->bo->tbo.base;
+			ret = drm_exec_prepare_obj(&exec, gobj, 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
+		drm_exec_continue_on_contention(&exec);
+	}
 
 	ret = process_validate_vms(process_info);
 	if (ret)
@@ -2461,7 +2402,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	/* Validate BOs and update GPUVM page tables */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
@@ -2503,12 +2444,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	ret = process_update_pds(process_info, &sync);
 
 unreserve_out:
-	ttm_eu_backoff_reservation(&ticket, &resv_list);
+	drm_exec_fini(&exec);
 	amdgpu_sync_wait(&sync, false);
 	amdgpu_sync_free(&sync);
-out_free:
-	kfree(pd_bo_list_entries);
-out_no_mem:
 
 	return ret;
 }
@@ -2524,7 +2462,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		bool valid = amdgpu_ttm_tt_get_user_pages_done(
 				mem->bo->tbo.ttm, mem->range);
 
@@ -2536,7 +2474,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 		}
 		WARN(mem->invalid, "Valid BO is marked invalid");
 
-		list_move_tail(&mem->validate_list.head,
+		list_move_tail(&mem->validate_list,
 			       &process_info->userptr_valid_list);
 	}
 
@@ -2646,50 +2584,46 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
  */
 int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 {
-	struct amdgpu_bo_list_entry *pd_bo_list;
 	struct amdkfd_process_info *process_info = info;
 	struct amdgpu_vm *peer_vm;
 	struct kgd_mem *mem;
-	struct bo_vm_reservation_context ctx;
 	struct amdgpu_amdkfd_fence *new_fence;
-	int ret = 0, i;
 	struct list_head duplicate_save;
 	struct amdgpu_sync sync_obj;
 	unsigned long failed_size = 0;
 	unsigned long total_size = 0;
+	struct drm_exec exec;
+	int ret;
 
 	INIT_LIST_HEAD(&duplicate_save);
-	INIT_LIST_HEAD(&ctx.list);
-	INIT_LIST_HEAD(&ctx.duplicates);
 
-	pd_bo_list = kcalloc(process_info->n_vms,
-			     sizeof(struct amdgpu_bo_list_entry),
-			     GFP_KERNEL);
-	if (!pd_bo_list)
-		return -ENOMEM;
-
-	i = 0;
 	mutex_lock(&process_info->lock);
-	list_for_each_entry(peer_vm, &process_info->vm_list_head,
-			vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++]);
 
-	/* Reserve all BOs and page tables/directory. Add all BOs from
-	 * kfd_bo_list to ctx.list
-	 */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
-
-		list_add_tail(&mem->resv_list.head, &ctx.list);
-		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
-	}
+	drm_exec_init(&exec, false);
+	drm_exec_while_not_all_locked(&exec) {
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
+		drm_exec_continue_on_contention(&exec);
 
-	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
-				     false, &duplicate_save);
-	if (ret) {
-		pr_debug("Memory eviction: TTM Reserve Failed. Try again\n");
-		goto ttm_reserve_fail;
+		/* Reserve all BOs and page tables/directory. Add all BOs from
+		 * kfd_bo_list to ctx.list
+		 */
+		list_for_each_entry(mem, &process_info->kfd_bo_list,
+				    validate_list) {
+			struct drm_gem_object *gobj;
+
+			gobj = &mem->bo->tbo.base;
+			ret = drm_exec_prepare_obj(&exec, gobj, 1);
+			drm_exec_break_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
+		drm_exec_continue_on_contention(&exec);
 	}
 
 	amdgpu_sync_create(&sync_obj);
@@ -2707,7 +2641,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
+			    validate_list) {
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
@@ -2780,8 +2714,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	*ef = dma_fence_get(&new_fence->base);
 
 	/* Attach new eviction fence to all BOs except pinned ones */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-		validate_list.head) {
+	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list) {
 		if (mem->bo->tbo.pin_count)
 			continue;
 
@@ -2800,11 +2733,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	}
 
 validate_map_fail:
-	ttm_eu_backoff_reservation(&ctx.ticket, &ctx.list);
 	amdgpu_sync_free(&sync_obj);
 ttm_reserve_fail:
+	drm_exec_fini(&exec);
 	mutex_unlock(&process_info->lock);
-	kfree(pd_bo_list);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index b9441ab457ea..f10a9331af9b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -34,6 +34,7 @@
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/drm_exec.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -334,6 +335,19 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 	list_add(&entry->tv.head, validated);
 }
 
+/**
+ * amdgpu_vm_lock_pd - lock PD in drm_exec
+ *
+ * @vm: vm providing the BOs
+ * @exec: drm execution context
+ *
+ * Lock the VM root PD in the DRM execution context.
+ */
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec)
+{
+	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base, 4);
+}
+
 /**
  * amdgpu_vm_move_to_lru_tail - move all BOs to the end of LRU
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 856a64bc7a89..4066731d3065 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -36,6 +36,8 @@
 #include "amdgpu_ring.h"
 #include "amdgpu_ids.h"
 
+struct drm_exec;
+
 struct amdgpu_bo_va;
 struct amdgpu_job;
 struct amdgpu_bo_list_entry;
@@ -389,6 +391,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 			 struct list_head *validated,
 			 struct amdgpu_bo_list_entry *entry);
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			      int (*callback)(void *p, struct amdgpu_bo *bo),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index dc6fd6967050..6ca3c3ced9f0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -24,6 +24,8 @@
 #include <linux/types.h>
 #include <linux/sched/task.h>
 #include <drm/ttm/ttm_tt.h>
+#include <drm/drm_exec.h>
+
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
@@ -1423,9 +1425,7 @@ struct svm_validate_context {
 	struct svm_range *prange;
 	bool intr;
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
-	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
-	struct list_head validate_list;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 };
 
 static int svm_range_reserve_bos(struct svm_validate_context *ctx)
@@ -1435,25 +1435,23 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 	uint32_t gpuidx;
 	int r;
 
-	INIT_LIST_HEAD(&ctx->validate_list);
+	drm_exec_init(&ctx->exec, true);
 	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
 		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
 		if (!pdd) {
 			pr_debug("failed to find device idx %d\n", gpuidx);
-			return -EINVAL;
+			r = -EINVAL;
+			goto unreserve_out;
 		}
 		vm = drm_priv_to_vm(pdd->drm_priv);
 
-		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
-		ctx->tv[gpuidx].num_shared = 4;
-		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
-	}
-
-	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
-				   ctx->intr, NULL);
-	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
-		return r;
+		r = amdgpu_vm_lock_pd(vm, &ctx->exec);
+		if (unlikely(r == -EDEADLK))
+			continue;
+		if (unlikely(r)) {
+			pr_debug("failed %d to reserve bo\n", r);
+			goto unreserve_out;
+		}
 	}
 
 	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
@@ -1476,13 +1474,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 	return 0;
 
 unreserve_out:
-	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	drm_exec_fini(&ctx->exec);
 	return r;
 }
 
 static void svm_range_unreserve_bos(struct svm_validate_context *ctx)
 {
-	ttm_eu_backoff_reservation(&ctx->ticket, &ctx->validate_list);
+	drm_exec_fini(&ctx->exec);
 }
 
 static void *kfd_svm_page_owner(struct kfd_process *p, int32_t gpuidx)
-- 
2.34.1

