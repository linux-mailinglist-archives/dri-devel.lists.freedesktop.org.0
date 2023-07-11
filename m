Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08A74F02A
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352810E390;
	Tue, 11 Jul 2023 13:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6493810E07B;
 Tue, 11 Jul 2023 13:31:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99357737980so740536966b.2; 
 Tue, 11 Jul 2023 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689082287; x=1691674287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0Avvbo7QgV87GdttckYfM03/A5+265n0Zg5Q6MpJmJk=;
 b=XgAQWU9AYTjmH6BBf/oFjckEG6DGgtEwGaw2pZ6xY3MU8x7x+S6j9HHCA/iFMA6Wpp
 5CqKeLJ5x0JozSk0lzhe0nQiVdVQzPrq0Ixcb8vvgSY8RKoLhtyz83QZi8MQ7aCWzles
 WaCbkyRU6RSbk3ZJ4KvNigkmED1I9rEnlVAKr9VW787wti74/oKEHupsis6uOXKQTJom
 memZ0NTISEDnhBNarKx8hq1YAJu58G9L+vMe8HPS+1rwuOsW+p/3vGoxQ+6WEYsm9PLg
 x+WLd6SbWYMztPLIYSQ7LI7c0jWWJZo/aGxgLLUFp1IxnKG0A/gA5kTM125+2yVlgoHV
 RPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689082287; x=1691674287;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0Avvbo7QgV87GdttckYfM03/A5+265n0Zg5Q6MpJmJk=;
 b=bO5VqgaSdusTZVnZA2qOU9Y5x3Vt6YVBY8/R1yk53bRihCUxKSvSfPwmMz8jFZ2oo4
 036zrJddSSFi3l6UslVBLb7IuHYess9nhUNefjovLyzBwE0bSd+GG8yl/Si/48Ohi2du
 0RL0nQnS5wqNR9Xa65aN4cMbH132DXetnCGjKaZfxsln+EnQYm71dEHgWzcwcJfS535K
 2/TNP5+HK4mT14rJZXM7u6XXVrjOw1UJmaLS3cm6iWhapUvDET+MA1vlNcDUVcOVq2Zu
 I4O6l5gbI/k5mI/RjIBZ68nI5NuAlNKhNndTNPfHXpNrL66+9YA8/5n5FwSrx1tJqVow
 pyig==
X-Gm-Message-State: ABy/qLaCwvMzV3OJu2r0iN8i8EiU6wRYCB7GLk7W43GtwUv006I9orUw
 B3k74OPy1nWUUsRLuIseCbU=
X-Google-Smtp-Source: APBJJlHodtTvly8XoZcKKmcEmH+hKR5XHndtsp22LvQalg38N1wF7dcTwjXLRAGW+LlmVa7S4lU+Ag==
X-Received: by 2002:a17:906:198:b0:98d:f11e:4816 with SMTP id
 24-20020a170906019800b0098df11e4816mr17602699ejb.29.1689082287295; 
 Tue, 11 Jul 2023 06:31:27 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:154b:c600:448d:6e36:e62e:af18])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a1709060d9b00b009932337747esm1176967eji.86.2023.07.11.06.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 06:31:26 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: alexdeucher@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/amdkfd: switch over to using drm_exec v2
Date: Tue, 11 Jul 2023 15:31:19 +0200
Message-Id: <20230711133122.3710-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711133122.3710-1-christian.koenig@amd.com>
References: <20230711133122.3710-1-christian.koenig@amd.com>
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

Avoids quite a bit of logic and kmalloc overhead.

v2: fix multiple problems pointed out by Felix

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig            |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   5 +-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 299 +++++++-----------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  18 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |   4 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  45 ++-
 6 files changed, 162 insertions(+), 210 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index b91e79c721e2..22d88f8ef527 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -21,6 +21,7 @@ config DRM_AMDGPU
 	select INTERVAL_TREE
 	select DRM_BUDDY
 	select DRM_SUBALLOC_HELPER
+	select DRM_EXEC
 	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
 	# ACPI_VIDEO's dependencies must also be selected.
 	select INPUT if ACPI
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 2d0406bff84e..1e4cc1fe88fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -25,6 +25,7 @@
 #ifndef AMDGPU_AMDKFD_H_INCLUDED
 #define AMDGPU_AMDKFD_H_INCLUDED
 
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/mm.h>
 #include <linux/kthread.h>
@@ -32,7 +33,6 @@
 #include <linux/mmu_notifier.h>
 #include <linux/memremap.h>
 #include <kgd_kfd_interface.h>
-#include <drm/ttm/ttm_execbuf_util.h>
 #include "amdgpu_sync.h"
 #include "amdgpu_vm.h"
 #include "amdgpu_xcp.h"
@@ -71,8 +71,7 @@ struct kgd_mem {
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
index f61527b800e6..27d331e9419d 100644
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
@@ -964,28 +966,20 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
 				struct amdkfd_process_info *process_info,
 				bool userptr)
 {
-	struct ttm_validate_buffer *entry = &mem->validate_list;
-	struct amdgpu_bo *bo = mem->bo;
-
-	INIT_LIST_HEAD(&entry->head);
-	entry->num_shared = 1;
-	entry->bo = &bo->tbo;
 	mutex_lock(&process_info->lock);
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
 
@@ -1072,13 +1066,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr,
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
@@ -1102,35 +1095,26 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
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
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&ctx->exec) {
+		ret = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
+		drm_exec_retry_on_contention(&ctx->exec);
+		if (unlikely(ret))
+			goto error;
+
+		ret = drm_exec_lock_obj(&ctx->exec, &bo->tbo.base);
+		drm_exec_retry_on_contention(&ctx->exec);
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
@@ -1147,63 +1131,39 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
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
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&ctx->exec) {
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
+			ret = amdgpu_vm_lock_pd(entry->bo_va->base.vm,
+						&ctx->exec, 2);
+			drm_exec_retry_on_contention(&ctx->exec);
+			if (unlikely(ret))
+				goto error;
+			++ctx->n_vms;
+		}
 
-	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
-				     false, &ctx->duplicates);
-	if (ret) {
-		pr_err("Failed to reserve buffers in ttm.\n");
-		kfree(ctx->vm_pd);
-		ctx->vm_pd = NULL;
-		return ret;
+		ret = drm_exec_prepare_obj(&ctx->exec, &bo->tbo.base, 1);
+		drm_exec_retry_on_contention(&ctx->exec);
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
@@ -1224,15 +1184,8 @@ static int unreserve_bo_and_vms(struct bo_vm_reservation_context *ctx,
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
 
@@ -1854,7 +1807,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	bool use_release_notifier = (mem->bo->kfd_bo == mem);
 	struct kfd_mem_attachment *entry, *tmp;
 	struct bo_vm_reservation_context ctx;
-	struct ttm_validate_buffer *bo_list_entry;
 	unsigned int mapped_to_gpu_memory;
 	int ret;
 	bool is_imported = false;
@@ -1882,9 +1834,8 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Make sure restore workers don't access the BO any more */
-	bo_list_entry = &mem->validate_list;
 	mutex_lock(&process_info->lock);
-	list_del(&bo_list_entry->head);
+	list_del(&mem->validate_list);
 	mutex_unlock(&process_info->lock);
 
 	/* Cleanup user pages and MMU notifiers */
@@ -2451,14 +2402,14 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
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
@@ -2538,50 +2489,41 @@ static int update_invalid_user_pages(struct amdkfd_process_info *process_info,
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
 
+	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
 	/* Reserve all BOs and page tables for validation */
-	ret = ttm_eu_reserve_buffers(&ticket, &resv_list, false, &duplicates);
-	WARN(!list_empty(&duplicates), "Duplicates should be empty");
-	if (ret)
-		goto out_free;
+	drm_exec_until_all_locked(&exec) {
+		/* Reserve all the page directories */
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec, 2);
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
 
-	amdgpu_sync_create(&sync);
+		/* Reserve the userptr_inval_list entries to resv_list */
+		list_for_each_entry(mem, &process_info->userptr_inval_list,
+				    validate_list) {
+			struct drm_gem_object *gobj;
+
+			gobj = &mem->bo->tbo.base;
+			ret = drm_exec_prepare_obj(&exec, gobj, 1);
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(ret))
+				goto unreserve_out;
+		}
+	}
 
 	ret = process_validate_vms(process_info);
 	if (ret)
@@ -2590,7 +2532,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	/* Validate BOs and update GPUVM page tables */
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		struct kfd_mem_attachment *attachment;
 
 		bo = mem->bo;
@@ -2632,12 +2574,9 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
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
@@ -2653,7 +2592,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 
 	list_for_each_entry_safe(mem, tmp_mem,
 				 &process_info->userptr_inval_list,
-				 validate_list.head) {
+				 validate_list) {
 		bool valid;
 
 		/* keep mem without hmm range at userptr_inval_list */
@@ -2677,7 +2616,7 @@ static int confirm_valid_user_pages_locked(struct amdkfd_process_info *process_i
 			continue;
 		}
 
-		list_move_tail(&mem->validate_list.head,
+		list_move_tail(&mem->validate_list,
 			       &process_info->userptr_valid_list);
 	}
 
@@ -2787,50 +2726,44 @@ static void amdgpu_amdkfd_restore_userptr_worker(struct work_struct *work)
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
-
-	pd_bo_list = kcalloc(process_info->n_vms,
-			     sizeof(struct amdgpu_bo_list_entry),
-			     GFP_KERNEL);
-	if (!pd_bo_list)
-		return -ENOMEM;
 
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
+	drm_exec_init(&exec, 0);
+	drm_exec_until_all_locked(&exec) {
+		list_for_each_entry(peer_vm, &process_info->vm_list_head,
+				    vm_list_node) {
+			ret = amdgpu_vm_lock_pd(peer_vm, &exec, 2);
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
 
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
+			drm_exec_retry_on_contention(&exec);
+			if (unlikely(ret))
+				goto ttm_reserve_fail;
+		}
 	}
 
 	amdgpu_sync_create(&sync_obj);
@@ -2848,7 +2781,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 	/* Validate BOs and map them to GPUVM (update VM page tables). */
 	list_for_each_entry(mem, &process_info->kfd_bo_list,
-			    validate_list.head) {
+			    validate_list) {
 
 		struct amdgpu_bo *bo = mem->bo;
 		uint32_t domain = mem->domain;
@@ -2921,8 +2854,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	*ef = dma_fence_get(&new_fence->base);
 
 	/* Attach new eviction fence to all BOs except pinned ones */
-	list_for_each_entry(mem, &process_info->kfd_bo_list,
-		validate_list.head) {
+	list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list) {
 		if (mem->bo->tbo.pin_count)
 			continue;
 
@@ -2941,11 +2873,10 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
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
index 143d11afe0e5..c5c5f2eb76c5 100644
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
@@ -360,6 +361,23 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 	list_add(&entry->tv.head, validated);
 }
 
+/**
+ * amdgpu_vm_lock_pd - lock PD in drm_exec
+ *
+ * @vm: vm providing the BOs
+ * @exec: drm execution context
+ * @num_fences: number of extra fences to reserve
+ *
+ * Lock the VM root PD in the DRM execution context.
+ */
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
+		      unsigned int num_fences)
+{
+	/* We need at least two fences for the VM PD/PT updates */
+	return drm_exec_prepare_obj(exec, &vm->root.bo->tbo.base,
+				    2 + num_fences);
+}
+
 /**
  * amdgpu_vm_move_to_lru_tail - move all BOs to the end of LRU
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 9c85d494f2a2..3e29886e5535 100644
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
@@ -399,6 +401,8 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 			 struct list_head *validated,
 			 struct amdgpu_bo_list_entry *entry);
+int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
+		      unsigned int num_fences);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 uint64_t amdgpu_vm_generation(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 5ff1a5a89d96..93c7a8c87113 100644
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
@@ -1455,9 +1457,7 @@ struct svm_validate_context {
 	struct svm_range *prange;
 	bool intr;
 	DECLARE_BITMAP(bitmap, MAX_GPU_INSTANCE);
-	struct ttm_validate_buffer tv[MAX_GPU_INSTANCE];
-	struct list_head validate_list;
-	struct ww_acquire_ctx ticket;
+	struct drm_exec exec;
 };
 
 static int svm_range_reserve_bos(struct svm_validate_context *ctx)
@@ -1467,25 +1467,24 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 	uint32_t gpuidx;
 	int r;
 
-	INIT_LIST_HEAD(&ctx->validate_list);
-	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
-		pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
-		if (!pdd) {
-			pr_debug("failed to find device idx %d\n", gpuidx);
-			return -EINVAL;
-		}
-		vm = drm_priv_to_vm(pdd->drm_priv);
-
-		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
-		ctx->tv[gpuidx].num_shared = 4;
-		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
-	}
+	drm_exec_init(&ctx->exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
+	drm_exec_until_all_locked(&ctx->exec) {
+		for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
+			pdd = kfd_process_device_from_gpuidx(ctx->process, gpuidx);
+			if (!pdd) {
+				pr_debug("failed to find device idx %d\n", gpuidx);
+				r = -EINVAL;
+				goto unreserve_out;
+			}
+			vm = drm_priv_to_vm(pdd->drm_priv);
 
-	r = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->validate_list,
-				   ctx->intr, NULL);
-	if (r) {
-		pr_debug("failed %d to reserve bo\n", r);
-		return r;
+			r = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
+			drm_exec_retry_on_contention(&ctx->exec);
+			if (unlikely(r)) {
+				pr_debug("failed %d to reserve bo\n", r);
+				goto unreserve_out;
+			}
+		}
 	}
 
 	for_each_set_bit(gpuidx, ctx->bitmap, MAX_GPU_INSTANCE) {
@@ -1508,13 +1507,13 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
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

