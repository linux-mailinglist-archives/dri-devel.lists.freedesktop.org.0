Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB33519899
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 09:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80410EFA3;
	Wed,  4 May 2022 07:47:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7707C10EF39;
 Wed,  4 May 2022 07:47:46 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id kq17so1303373ejb.4;
 Wed, 04 May 2022 00:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9rljlopNBGb4mBcqq8JKt5xmXizc5YEpnYej5IVpZ0=;
 b=cr5MCTpB8eap6bYpPlVjwP/tI6IbcbaHAagOfSBDnuudU4ArRQSPCDp1UE7tMfKzwu
 VPSrBF8X8454//fDsLI8P9Mc9DFzq386IbdrLz1ogJDCRfiIkvpNHpJOe0QzqvZMMXvc
 MgX0GH872llS5FavgzEp4ljqi+vVuXlCtGtawlTzPdchJ7FmKHiuKj0q3JVUrDlHF39V
 marDRib9T+yONNHlZxh7gAkHlNqc4r2ZRF5f/pP7gYxwQwqyz01mg1ckPxVk3PDoqUIv
 zRBsIBNqIUSvcIZXBNY4NDtFSGiGPTxHQLh4MPhZaKhhlHRtgtzhVNfQEV3eTwnwZT+R
 y5+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9rljlopNBGb4mBcqq8JKt5xmXizc5YEpnYej5IVpZ0=;
 b=Fazlp2NBuUD87mKzNEcQ63BSf2OcyqzCzbgNvWOtWSpFaaOmkjXIc1LXRRP5za3SM9
 A9GfxqYpOXSlhkKGYqSRgYptjY0D+DzWWCPjRXFtAhV/HKA2CmeERW4FrwMG5rK9PLqs
 1dqXaUW9KNU0WU3dJiRrZdyDdBE8/648S6kRSk1jMg5B3CRD97xNPDuQD79PM8tgPKRv
 ORNhKEjoDpA3S32FXButtwWbJE9USSZd7w2JFqNxeXuhDImrl+dHIAsA7/uDd7fxUZ7K
 W6wK0c241LyVx5LO3te1GRvL8nXgIdKhuYzxHprcK4r/oSa9cEw0JWE40/yxfM7i+N/q
 PPMQ==
X-Gm-Message-State: AOAM533nUB3GPEHbTOJKnY7knfkJeX+6SCwBBo4/632Tiom84iUg/SUu
 GbkoMV90X46tB6/SU7Bdh6NL84blSBE=
X-Google-Smtp-Source: ABdhPJz3m460vFn4FosJ9hpqFvLJQW0CRJsUMzyIfEewu0PePiG145VlwjtWy05WxHknXe9BLedU5Q==
X-Received: by 2002:a17:907:9803:b0:6db:ab21:738e with SMTP id
 ji3-20020a170907980300b006dbab21738emr18348464ejc.112.1651650464892; 
 Wed, 04 May 2022 00:47:44 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 jy10-20020a170907762a00b006f3ef214dc2sm5433686ejc.40.2022.05.04.00.47.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:47:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 3/8] drm/amdkfd: switch over to using drm_exec
Date: Wed,  4 May 2022 09:47:34 +0200
Message-Id: <20220504074739.2231-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074739.2231-1-christian.koenig@amd.com>
References: <20220504074739.2231-1-christian.koenig@amd.com>
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

Avoids quite a bit of logic and kmalloc overhead.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 303 +++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  14 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   3 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  32 +-
 5 files changed, 152 insertions(+), 205 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 4cb14c2fe53f..3f3a994c68e2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -25,12 +25,12 @@
 #ifndef AMDGPU_AMDKFD_H_INCLUDED
 #define AMDGPU_AMDKFD_H_INCLUDED
 
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
 #include <kgd_kfd_interface.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
 
@@ -66,8 +66,7 @@ struct kgd_mem {
 	struct dma_buf *dmabuf;
 	struct list_head attachments;
 	/* protected by amdkfd_process_info.lock */
-	struct ttm_validate_buffer validate_list;
-	struct ttm_validate_buffer resv_list;
+	struct list_head validate_list;
 	uint32_t domain;
 	unsigned int mapped_to_gpu_memory;
 	uint64_t va;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 3dc5ab2764ff..64ac4f8f49be 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -25,6 +25,8 @@
 #include <linux/sched/mm.h>
 #include <linux/sched/task.h>
 
+#include <drm/drm_exec.h>
+
 #include "amdgpu_object.h"
 #include "amdgpu_gem.h"
 #include "amdgpu_vm.h"
@@ -770,28 +772,19 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
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
 
@@ -875,13 +868,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
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
@@ -905,35 +897,24 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
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
@@ -950,63 +931,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
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
@@ -1027,15 +984,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
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
 
@@ -1616,7 +1566,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	unsigned long bo_size = mem->bo->tbo.base.size;
 	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
-	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
 	bool is_imported = false;
@@ -1644,9 +1593,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Make sure restore workers don't access the BO any more */
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 
 	/* No more MMU notifiers */
@@ -1945,7 +1893,7 @@ int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct amdgpu_device *adev,
 
 	amdgpu_amdkfd_remove_eviction_fence(
 		bo, mem->process_info->eviction_fence);
-	list_del_init(&mem->validate_list.head);
+	list_del_init(&mem->validate_list);
 
 	if (size)
 		*size = amdgpu_bo_size(bo);
@@ -2107,7 +2055,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 	 */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_valid_list,
-				 validate_list.head) {
+				 validate_list) {
 		if (!atomic_read(&mem->invalid))
 			continue; /* BO is still valid */
 
@@ -2124,7 +2072,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 			return -EAGAIN;
 		}
 
-		list_move_tail(&mem->validate_list.head,
+		list_move_tail(&mem->validate_list,
 			       &process_info->userptr_inval_list);
 	}
 
@@ -2133,7 +2081,7 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
 
 	/* Go through userptr_inval_list and update any invalid user_pages */
 	list_for_each_entry(mem, &process_info->userptr_inval_list,
-			    validate_list.head) {
+			    validate_list) {
 		invalid = atomic_read(&mem->invalid);
 		if (!invalid)
 			/* BO hasn't been invalidated since the last
@@ -2184,50 +2132,44 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
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
+	WARN(!drm_exec_has_duplicates(&exec), "Duplicates should be empty");
 
 	ret = process_validate_vms(process_info);
 	if (ret)
@@ -2236,7 +2178,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	/* Validate BOs and update GPUVM page tables */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
@@ -2251,7 +2193,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 			}
 		}
 
-		list_move_tail(&mem->validate_list.head,
+		list_move_tail(&mem->validate_list,
 			       &process_info->userptr_valid_list);
 
 		/* Update mapping. If the BO was not validated
@@ -2279,12 +2221,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
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
@@ -2381,50 +2320,46 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
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
@@ -2442,7 +2377,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
+			    validate_list) {
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
@@ -2515,8 +2450,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	*ef = dma_fence_get(&new_fence->base);
 
 	/* Attach new eviction fence to all BOs */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-		validate_list.head)
+	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list)
 		amdgpu_bo_fence(mem->bo,
 			&process_info->eviction_fence->base, true);
 
@@ -2529,11 +2463,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
index 5277c10d901d..c82c580f1df5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -33,6 +33,7 @@
 
 #include <drm/amdgpu_drm.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_exec.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -639,6 +640,19 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
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
index bd7892482bbf..15d26f442e70 100644
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
@@ -383,6 +385,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 			 struct list_head *validated,
 			 struct amdgpu_bo_list_entry *entry);
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			      int (*callback)(void *p, struct amdgpu_bo *bo),
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b3fc3e958227..b5cb234e9f77 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -23,6 +23,8 @@
 
 #include <linux/types.h>
 #include <linux/sched/task.h>
+#include <drm/drm_exec.h>
+
 #include "amdgpu_sync.h"
 #include "amdgpu_object.h"
 #include "amdgpu_vm.h"
@@ -1373,9 +1375,7 @@ struct svm_validate_context {
 	struct svm_range *prange;
 	bool intr;
 	unsigned long bitmap[MAX_GPU_INSTANCE];
-	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
-	struct list_head validate_list;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 };
 
 static int svm_range_reserve_bos(struct svm_validate_context *ctx)
@@ -1385,25 +1385,23 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
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
@@ -1426,13 +1424,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
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
2.25.1

