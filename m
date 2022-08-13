Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D14E59181F
	for <lists+dri-devel@lfdr.de>; Sat, 13 Aug 2022 03:30:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CABDAFEA6;
	Sat, 13 Aug 2022 01:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE54B0BE9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 01:27:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id t5so3207474edc.11
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 18:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6U1Zf3R7HnD+wD4vOaRRn3lIkEouf3uvgopoHy2Q7cM=;
 b=RYWvIj4/s12TbFufU8K8dTJP0AfE8u9VCxwFSrfrIeKD7T2vrnW2THW7FnNXzMSYJt
 1uCh78D+YmkVAaqBHsY+XddhWmU8LqGCBNj1oVRoTT/j13wPF7XDQEX4Ti295+7TcwGv
 N5WupRZfx/XJTN+s5pYsFtD1scEWyD3tPJEHvX6sL2MZC4lbbPXKoW12hMEQjMto3s+O
 lBxP9vKKYkiLCZc543w/RMtiN6NkFYxglOM5c+ty81JkItDawETpLx4OF4Fb+mZ7FULa
 kJvLjElLKwGZse7M+LOm7I/VNijOpA/P6Q8NvoC893YSrMihB9uM3cucUiqSVLXyuP+4
 aubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6U1Zf3R7HnD+wD4vOaRRn3lIkEouf3uvgopoHy2Q7cM=;
 b=y6W/BVT0nJ3EbNU3lRrN5VtIWLGiagXEyV5K3oltUMxchJ7J0n8ab7clbEvh847MFp
 jlcGxAPFB/TW+ibLtosO+vMEUuOh/zdHU0R6hxtvtXe8Rehb8tb9IvM4Tz8jgPPMo5B0
 9nS+hZ5ieBx5nPbgKmV1hHBdy+nexKrqnh2Qz8r5JGCeJK/2ieP9OICNZhDPHzmE7RET
 UgxY19bf9HIRFCLAPXZQWCFEhq2eujZzmJJdNCTNLeVUxu2jT6IrP7dQSoVTjBPiIMJu
 cMbhLH6WF1FkukLjMOzZPw2Uh/COA0axT2Y/bc3uoNZwPFD8rDdcrFGGu4p3oflRdZ/n
 /Fmw==
X-Gm-Message-State: ACgBeo1LaLqu+Y1e+SAnJADlieg6lPR5tVucqRBlhVXiACOg3QDY3Qnd
 K2UZK74PxbGWzjQLwFXMZwQr1cWHJkbZlJuA
X-Google-Smtp-Source: AA6agR4BEnqCPqyDMK+Rma64Ms5gjSDeaZmUxAdeBwxPK3KccDovP5qAZl5oCvzZcKjbQVdWXFcNqA==
X-Received: by 2002:a05:6402:3907:b0:431:6776:64e7 with SMTP id
 fe7-20020a056402390700b00431677664e7mr5688367edb.0.1660354077368; 
 Fri, 12 Aug 2022 18:27:57 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm1342536ejb.23.2022.08.12.18.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:27:56 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/ttm: Add usage to ttm_validate_buffer.
Date: Sat, 13 Aug 2022 03:27:56 +0200
Message-Id: <20220813012801.1115950-2-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
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

This way callsites can choose between READ/BOOKKEEP reservations.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 5 +++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 9 +++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 8 ++++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 1 +
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c             | 1 +
 drivers/gpu/drm/qxl/qxl_release.c                | 1 +
 drivers/gpu/drm/radeon/radeon_cs.c               | 2 ++
 drivers/gpu/drm/radeon/radeon_gem.c              | 1 +
 drivers/gpu/drm/radeon/radeon_vm.c               | 2 ++
 drivers/gpu/drm/ttm/ttm_execbuf_util.c           | 3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c         | 7 ++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c       | 1 +
 include/drm/ttm/ttm_execbuf_util.h               | 2 ++
 15 files changed, 38 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 4608599ba6bb..a6eb7697c936 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -775,6 +775,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
 
 	INIT_LIST_HEAD(&entry->head);
 	entry->num_shared = 1;
+	entry->usage = DMA_RESV_USAGE_READ;
 	entry->bo = &bo->tbo;
 	mutex_lock(&process_info->lock);
 	if (userptr)
@@ -919,6 +920,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 	ctx->kfd_bo.priority = 0;
 	ctx->kfd_bo.tv.bo = &bo->tbo;
 	ctx->kfd_bo.tv.num_shared = 1;
+	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
@@ -982,6 +984,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 	ctx->kfd_bo.priority = 0;
 	ctx->kfd_bo.tv.bo = &bo->tbo;
 	ctx->kfd_bo.tv.num_shared = 1;
+	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	i = 0;
@@ -2207,6 +2210,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 		list_add_tail(&mem->resv_list.head, &resv_list);
 		mem->resv_list.bo = mem->validate_list.bo;
 		mem->resv_list.num_shared = mem->validate_list.num_shared;
+		mem->resv_list.usage = mem->validate_list.usage;
 	}
 
 	/* Reserve all BOs and page tables for validation */
@@ -2406,6 +2410,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 		list_add_tail(&mem->resv_list.head, &ctx.list);
 		mem->resv_list.bo = mem->validate_list.bo;
 		mem->resv_list.num_shared = mem->validate_list.num_shared;
+		mem->resv_list.usage = mem->validate_list.usage;
 	}
 
 	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index d8f1335bc68f..f1ceb25d1b84 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -57,6 +57,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	p->uf_entry.tv.bo = &bo->tbo;
 	/* One for TTM and two for the CS job */
 	p->uf_entry.tv.num_shared = 3;
+	p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
 
 	drm_gem_object_put(gobj);
 
@@ -522,8 +523,10 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	mutex_lock(&p->bo_list->bo_list_mutex);
 
 	/* One for TTM and one for the CS job */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		e->tv.num_shared = 2;
+		e->tv.usage = DMA_RESV_USAGE_READ;
+	}
 
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
@@ -1282,8 +1285,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	amdgpu_vm_move_to_lru_tail(p->adev, &fpriv->vm);
 
 	/* Make sure all BOs are remembered as writers */
-	amdgpu_bo_list_for_each_entry(e, p->bo_list)
+	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
 		e->tv.num_shared = 0;
+		e->tv.usage = DMA_RESV_USAGE_WRITE;
+	}
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index c6d4d41c4393..24941ed1a5ec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -75,6 +75,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	INIT_LIST_HEAD(&csa_tv.head);
 	csa_tv.bo = &bo->tbo;
 	csa_tv.num_shared = 1;
+	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
 	amdgpu_vm_get_pd_bo(vm, &list, &pd);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 8ef31d687ef3..f8cf52eb1931 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -208,6 +208,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 
 	tv.bo = &bo->tbo;
 	tv.num_shared = 2;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
@@ -733,10 +734,13 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 			return -ENOENT;
 		abo = gem_to_amdgpu_bo(gobj);
 		tv.bo = &abo->tbo;
-		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
+		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID) {
 			tv.num_shared = 1;
-		else
+			tv.usage = DMA_RESV_USAGE_READ;
+		} else {
 			tv.num_shared = 0;
+			tv.usage = DMA_RESV_USAGE_WRITE;
+		}
 		list_add(&tv.head, &list);
 	} else {
 		gobj = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 69a70a0aaed9..6b1da37c2280 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -996,6 +996,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 
 	csa_tv.bo = &ctx_data->meta_data_obj->tbo;
 	csa_tv.num_shared = 1;
+	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
 	amdgpu_vm_get_pd_bo(vm, &list, &pd);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index dc76d2b3ce52..1b5d2317b987 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -325,6 +325,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 	entry->tv.bo = &vm->root.bo->tbo;
 	/* Two for VM updates, one for TTM and one for the CS job */
 	entry->tv.num_shared = 4;
+	entry->tv.usage = DMA_RESV_USAGE_READ;
 	entry->user_pages = NULL;
 	list_add(&entry->tv.head, validated);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 7b332246eda3..83531b00b29d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1410,6 +1410,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 
 		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
 		ctx->tv[gpuidx].num_shared = 4;
+		ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
 		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
 	}
 
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..0c6e45992604 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -184,6 +184,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 	qxl_bo_ref(bo);
 	entry->tv.bo = &bo->tbo;
 	entry->tv.num_shared = 0;
+	entry->tv.usage = DMA_RESV_USAGE_WRITE;
 	list_add_tail(&entry->tv.head, &release->bos);
 	return 0;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 446f7bae54c4..6cc470dcf177 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -184,6 +184,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 
 		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
 		p->relocs[i].tv.num_shared = !r->write_domain;
+		p->relocs[i].tv.usage = r->write_domain ? DMA_RESV_USAGE_WRITE :
+							  DMA_RESV_USAGE_READ;
 
 		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
 				      priority);
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 8c01a7f0e027..e7abd535bdc2 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -636,6 +636,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 
 	tv.bo = &bo_va->bo->tbo;
 	tv.num_shared = 1;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 987cabbf1318..72ff5347b56d 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -144,6 +144,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
 	list[0].tv.bo = &vm->page_directory->tbo;
 	list[0].tv.num_shared = 1;
+	list[0].tv.usage = DMA_RESV_USAGE_READ;
 	list[0].tiling_flags = 0;
 	list_add(&list[0].tv.head, head);
 
@@ -156,6 +157,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
 		list[idx].tv.bo = &list[idx].robj->tbo;
 		list[idx].tv.num_shared = 1;
+		list[idx].tv.usage = DMA_RESV_USAGE_READ;
 		list[idx].tiling_flags = 0;
 		list_add(&list[idx++].tv.head, head);
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index dbee34a058df..44a6bce66cf7 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -154,8 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ctx *ticket,
 	list_for_each_entry(entry, list, head) {
 		struct ttm_buffer_object *bo = entry->bo;
 
-		dma_resv_add_fence(bo->base.resv, fence, entry->num_shared ?
-				   DMA_RESV_USAGE_READ : DMA_RESV_USAGE_WRITE);
+		dma_resv_add_fence(bo->base.resv, fence, entry->usage);
 		ttm_bo_move_to_lru_tail_unlocked(bo);
 		dma_resv_unlock(bo->base.resv);
 	}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
index a7d62a4eb47b..0de0365504d6 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -131,6 +131,7 @@ static void vmw_resource_release(struct kref *kref)
 
 			val_buf.bo = bo;
 			val_buf.num_shared = 0;
+			val_buf.usage = DMA_RESV_USAGE_WRITE;
 			res->func->unbind(res, false, &val_buf);
 		}
 		res->backup_dirty = false;
@@ -553,6 +554,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	ttm_bo_get(&res->backup->base);
 	val_buf->bo = &res->backup->base;
 	val_buf->num_shared = 0;
+	val_buf->usage = DMA_RESV_USAGE_WRITE;
 	list_add_tail(&val_buf->head, &val_list);
 	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
 	if (unlikely(ret != 0))
@@ -658,6 +660,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 
 	val_buf.bo = NULL;
 	val_buf.num_shared = 0;
+	val_buf.usage = DMA_RESV_USAGE_WRITE;
 	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
 	if (unlikely(ret != 0))
 		return ret;
@@ -709,6 +712,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 
 	val_buf.bo = NULL;
 	val_buf.num_shared = 0;
+	val_buf.usage = DMA_RESV_USAGE_WRITE;
 	if (res->backup)
 		val_buf.bo = &res->backup->base;
 	do {
@@ -777,7 +781,8 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
 {
 	struct ttm_validate_buffer val_buf = {
 		.bo = &vbo->base,
-		.num_shared = 0
+		.num_shared = 0,
+		.usage = DMA_RESV_USAGE_WRITE
 	};
 
 	dma_resv_assert_held(vbo->base.base.resv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index f46891012be3..913e91962af1 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -289,6 +289,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 		if (!val_buf->bo)
 			return -ESRCH;
 		val_buf->num_shared = 0;
+		val_buf->usage = DMA_RESV_USAGE_WRITE;
 		list_add_tail(&val_buf->head, &ctx->bo_list);
 		bo_node->as_mob = as_mob;
 		bo_node->cpu_blit = cpu_blit;
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
index a99d7fdf2964..5b65f5e1354a 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/include/drm/ttm/ttm_execbuf_util.h
@@ -41,12 +41,14 @@
  * @head:           list head for thread-private list.
  * @bo:             refcounted buffer object pointer.
  * @num_shared:     How many shared fences we want to add.
+ * @usage           dma resv usage of the fences to add.
  */
 
 struct ttm_validate_buffer {
 	struct list_head head;
 	struct ttm_buffer_object *bo;
 	unsigned int num_shared;
+	enum dma_resv_usage usage;
 };
 
 /**
-- 
2.37.1

