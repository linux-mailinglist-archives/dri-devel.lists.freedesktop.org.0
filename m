Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540B9539A6C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A477310FC7C;
	Wed,  1 Jun 2022 00:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38B410FC79
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id jx22so549095ejb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5V72J0EO/W5B16iFZ0NQLs9JOmZbygqYCb0phH8njs=;
 b=ZfNi4fhKfYVsTPhuCi7oDCSqLFBQm+6MwvGezVOV1JJE5QU4cBQqNdEi6Cf+Pvf3MB
 uyT1miYoZAEC5zMhV71Bm1t2tBdZkafm3ThKyQA087abIbwDxDcFDdSTwpWR8v4FNn5V
 xyIw9TENFv0Hs6runYlXJGrmYKRTBZyGdCFOzxshVcqMvOKmdKIG6U86s6u2j2IwLYCt
 SNqJG31YzPQpKUrbOOY3cP2T2lT3KZcJJbtKiAMfw23SjiELtxfQ2oFP+LAUmNajmc5S
 rnBA3CpmbBwnt23pX8O8oAuKTRsswxOqwWIe2TEdpfZDC2VseV/GTK4EnfpdmC66KZOk
 XU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5V72J0EO/W5B16iFZ0NQLs9JOmZbygqYCb0phH8njs=;
 b=uMKSq54dyAUsJjVxDMPsE5qKBCjK6V6iqvT9prxkQTgl8lKWlk7NdXveQjezQbEeS0
 kws2t/rjhoxwNxEUYBrYnpeR9GCWwhnbKeIPP9CaDJVY1ivokhBwsPePUb1oa+XGyaNm
 /vx4TeARuk75kps1TliRLhIPUHOOHM0CqGYD9s+/yyCRqA1xQqtHZYc+0wrt8tBuu15v
 t4x6A+vpT5g0p4/+M84t5w7Az84obOa7DTp3Iz7UFQTu+Ti8InqZMnaQ4RWqjsx/cNJp
 FbmCK2NkxM6/iJL4ta95AlJtzPgVUnEN2GoE+dVd6DOAImJWSsvFeZ5hCSyeOdO9p+3n
 2d8g==
X-Gm-Message-State: AOAM5339Zlz/moZx3JGTSlIYMFV3JPLSjyYIrmI4DxiTxhjLcOUHSbo+
 FAJfqOiblHATSqpE2Ju4itQkJ5goOcfnFw==
X-Google-Smtp-Source: ABdhPJzfDVFLgbIurO4TMYzSu1NiqdkwxASnZO9pcnQDJFtncCm5n+oOA0IhDY+xAVLfTh+Kn6O4kA==
X-Received: by 2002:a17:907:2d1e:b0:6fe:c5a3:4874 with SMTP id
 gs30-20020a1709072d1e00b006fec5a34874mr44209152ejc.61.1654043992997; 
 Tue, 31 May 2022 17:39:52 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:52 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 1/5] drm/ttm: Refactor num_shared into usage.
Date: Wed,  1 Jun 2022 02:40:10 +0200
Message-Id: <20220601004014.158247-2-bas@basnieuwenhuizen.nl>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
References: <20220601004014.158247-1-bas@basnieuwenhuizen.nl>
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

So that the driver can set some BOOKKEEP for explicit sync. Maybe
some of the existing places would already make sense for that, but
I targeted this for no functional changes.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 10 +++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c            |  8 +++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c           |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c           |  6 +++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |  3 +--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c              |  2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 drivers/gpu/drm/qxl/qxl_release.c                 |  2 +-
 drivers/gpu/drm/radeon/radeon_cs.c                |  5 +++--
 drivers/gpu/drm/radeon/radeon_gem.c               |  2 +-
 drivers/gpu/drm/radeon/radeon_vm.c                |  4 ++--
 drivers/gpu/drm/ttm/ttm_execbuf_util.c            |  5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c          | 10 +++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_validation.c        |  2 +-
 include/drm/ttm/ttm_execbuf_util.h                |  3 ++-
 16 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index a4955ef76cfc..a790a089e829 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -774,7 +774,7 @@ static void add_kgd_mem_to_kfd_bo_list(struct kgd_mem *mem,
 	struct amdgpu_bo *bo = mem->bo;
 
 	INIT_LIST_HEAD(&entry->head);
-	entry->num_shared = 1;
+	entry->usage = DMA_RESV_USAGE_READ;
 	entry->bo = &bo->tbo;
 	mutex_lock(&process_info->lock);
 	if (userptr)
@@ -918,7 +918,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 
 	ctx->kfd_bo.priority = 0;
 	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
+	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
@@ -981,7 +981,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 
 	ctx->kfd_bo.priority = 0;
 	ctx->kfd_bo.tv.bo = &bo->tbo;
-	ctx->kfd_bo.tv.num_shared = 1;
+	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
 	i = 0;
@@ -2218,7 +2218,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 			    validate_list.head) {
 		list_add_tail(&mem->resv_list.head, &resv_list);
 		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
+		mem->resv_list.usage = mem->validate_list.usage;
 	}
 
 	/* Reserve all BOs and page tables for validation */
@@ -2417,7 +2417,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 
 		list_add_tail(&mem->resv_list.head, &ctx.list);
 		mem->resv_list.bo = mem->validate_list.bo;
-		mem->resv_list.num_shared = mem->validate_list.num_shared;
+		mem->resv_list.usage = mem->validate_list.usage;
 	}
 
 	ret = ttm_eu_reserve_buffers(&ctx.ticket, &ctx.list,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 60ca14afb879..2ae1c0d9d33a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -55,8 +55,7 @@ static int amdgpu_cs_user_fence_chunk(struct amdgpu_cs_parser *p,
 	bo = amdgpu_bo_ref(gem_to_amdgpu_bo(gobj));
 	p->uf_entry.priority = 0;
 	p->uf_entry.tv.bo = &bo->tbo;
-	/* One for TTM and two for the CS job */
-	p->uf_entry.tv.num_shared = 3;
+	p->uf_entry.tv.usage = DMA_RESV_USAGE_READ;
 
 	drm_gem_object_put(gobj);
 
@@ -519,9 +518,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 			return r;
 	}
 
-	/* One for TTM and one for the CS job */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 2;
+		e->tv.usage = DMA_RESV_USAGE_READ;
 
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
@@ -1261,7 +1259,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 
 	/* Make sure all BOs are remembered as writers */
 	amdgpu_bo_list_for_each_entry(e, p->bo_list)
-		e->tv.num_shared = 0;
+		e->tv.usage = DMA_RESV_USAGE_WRITE;
 
 	ttm_eu_fence_buffer_objects(&p->ticket, &p->validated, p->fence);
 	mutex_unlock(&p->adev->notifier_lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index c6d4d41c4393..71277257d94d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	INIT_LIST_HEAD(&list);
 	INIT_LIST_HEAD(&csa_tv.head);
 	csa_tv.bo = &bo->tbo;
-	csa_tv.num_shared = 1;
+	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
 	amdgpu_vm_get_pd_bo(vm, &list, &pd);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 84a53758e18e..7483411229f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -207,7 +207,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	INIT_LIST_HEAD(&duplicates);
 
 	tv.bo = &bo->tbo;
-	tv.num_shared = 2;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
@@ -731,9 +731,9 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		abo = gem_to_amdgpu_bo(gobj);
 		tv.bo = &abo->tbo;
 		if (abo->flags & AMDGPU_GEM_CREATE_VM_ALWAYS_VALID)
-			tv.num_shared = 1;
+			tv.usage = DMA_RESV_USAGE_READ;
 		else
-			tv.num_shared = 0;
+			tv.usage = DMA_RESV_USAGE_WRITE;
 		list_add(&tv.head, &list);
 	} else {
 		gobj = NULL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 5224d9a39737..f670d8473993 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -319,7 +319,7 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
 	INIT_LIST_HEAD(&list);
 
 	tv.bo = &rbo->tbo;
-	tv.num_shared = 1;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 15184153e2b9..515be19ab279 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -633,8 +633,7 @@ void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 {
 	entry->priority = 0;
 	entry->tv.bo = &vm->root.bo->tbo;
-	/* Two for VM updates, one for TTM and one for the CS job */
-	entry->tv.num_shared = 4;
+	entry->tv.usage = DMA_RESV_USAGE_READ;
 	entry->user_pages = NULL;
 	list_add(&entry->tv.head, validated);
 }
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index b3fc3e958227..af844b636778 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1395,7 +1395,7 @@ static int svm_range_reserve_bos(struct svm_validate_context *ctx)
 		vm = drm_priv_to_vm(pdd->drm_priv);
 
 		ctx->tv[gpuidx].bo = &vm->root.bo->tbo;
-		ctx->tv[gpuidx].num_shared = 4;
+		ctx->tv[gpuidx].usage = DMA_RESV_USAGE_READ;
 		list_add(&ctx->tv[gpuidx].head, &ctx->validate_list);
 	}
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 73423b805b54..851b7844b084 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7601,7 +7601,7 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 	INIT_LIST_HEAD(&list);
 
 	tv.bo = &rbo->tbo;
-	tv.num_shared = 1;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..689e35192070 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -183,7 +183,7 @@ int qxl_release_list_add(struct qxl_release *release, struct qxl_bo *bo)
 
 	qxl_bo_ref(bo);
 	entry->tv.bo = &bo->tbo;
-	entry->tv.num_shared = 0;
+	entry->tv.usage = DMA_RESV_USAGE_WRITE;
 	list_add_tail(&entry->tv.head, &release->bos);
 	return 0;
 }
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 446f7bae54c4..30afe0c62dd9 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -183,7 +183,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 		}
 
 		p->relocs[i].tv.bo = &p->relocs[i].robj->tbo;
-		p->relocs[i].tv.num_shared = !r->write_domain;
+		p->relocs[i].tv.usage =
+			r->write_domain ? DMA_RESV_USAGE_WRITE : DMA_RESV_USAGE_READ;
 
 		radeon_cs_buckets_add(&buckets, &p->relocs[i].tv.head,
 				      priority);
@@ -258,7 +259,7 @@ static int radeon_cs_sync_rings(struct radeon_cs_parser *p)
 
 		resv = reloc->robj->tbo.base.resv;
 		r = radeon_sync_resv(p->rdev, &p->ib.sync, resv,
-				     reloc->tv.num_shared);
+				     reloc->tv.usage != DMA_RESV_USAGE_WRITE);
 		if (r)
 			return r;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 8c01a7f0e027..eae47c709f5d 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -635,7 +635,7 @@ static void radeon_gem_va_update_vm(struct radeon_device *rdev,
 	INIT_LIST_HEAD(&list);
 
 	tv.bo = &bo_va->bo->tbo;
-	tv.num_shared = 1;
+	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
 	vm_bos = radeon_vm_get_bos(rdev, bo_va->vm, &list);
diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 987cabbf1318..702627b48dae 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -143,7 +143,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 	list[0].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 	list[0].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
 	list[0].tv.bo = &vm->page_directory->tbo;
-	list[0].tv.num_shared = 1;
+	list[0].tv.usage = DMA_RESV_USAGE_READ;
 	list[0].tiling_flags = 0;
 	list_add(&list[0].tv.head, head);
 
@@ -155,7 +155,7 @@ struct radeon_bo_list *radeon_vm_get_bos(struct radeon_device *rdev,
 		list[idx].preferred_domains = RADEON_GEM_DOMAIN_VRAM;
 		list[idx].allowed_domains = RADEON_GEM_DOMAIN_VRAM;
 		list[idx].tv.bo = &list[idx].robj->tbo;
-		list[idx].tv.num_shared = 1;
+		list[idx].tv.usage = DMA_RESV_USAGE_READ;
 		list[idx].tiling_flags = 0;
 		list_add(&list[idx++].tv.head, head);
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
index 0eb995d25df1..c39d8e5ac271 100644
--- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
+++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
@@ -101,7 +101,7 @@ int ttm_eu_reserve_buffers(struct ww_acquire_ctx *ticket,
 			continue;
 		}
 
-		num_fences = min(entry->num_shared, 1u);
+		num_fences = entry->usage <= DMA_RESV_USAGE_WRITE ? 0u : 1u;
 		if (!ret) {
 			ret = dma_resv_reserve_fences(bo->base.resv,
 						      num_fences);
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
index c6d02c98a19a..58dfff7d6c76 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
@@ -130,7 +130,7 @@ static void vmw_resource_release(struct kref *kref)
 			struct ttm_validate_buffer val_buf;
 
 			val_buf.bo = bo;
-			val_buf.num_shared = 0;
+			val_buf.usage = DMA_RESV_USAGE_WRITE;
 			res->func->unbind(res, false, &val_buf);
 		}
 		res->backup_dirty = false;
@@ -552,7 +552,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
 	INIT_LIST_HEAD(&val_list);
 	ttm_bo_get(&res->backup->base);
 	val_buf->bo = &res->backup->base;
-	val_buf->num_shared = 0;
+	val_buf->usage = DMA_RESV_USAGE_WRITE;
 	list_add_tail(&val_buf->head, &val_list);
 	ret = ttm_eu_reserve_buffers(ticket, &val_list, interruptible, NULL);
 	if (unlikely(ret != 0))
@@ -657,7 +657,7 @@ static int vmw_resource_do_evict(struct ww_acquire_ctx *ticket,
 	BUG_ON(!func->may_evict);
 
 	val_buf.bo = NULL;
-	val_buf.num_shared = 0;
+	val_buf.usage = DMA_RESV_USAGE_WRITE;
 	ret = vmw_resource_check_buffer(ticket, res, interruptible, &val_buf);
 	if (unlikely(ret != 0))
 		return ret;
@@ -708,7 +708,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
 		return 0;
 
 	val_buf.bo = NULL;
-	val_buf.num_shared = 0;
+	val_buf.usage = DMA_RESV_USAGE_WRITE;
 	if (res->backup)
 		val_buf.bo = &res->backup->base;
 	do {
@@ -777,7 +777,7 @@ void vmw_resource_unbind_list(struct vmw_buffer_object *vbo)
 {
 	struct ttm_validate_buffer val_buf = {
 		.bo = &vbo->base,
-		.num_shared = 0
+		.usage = DMA_RESV_USAGE_WRITE
 	};
 
 	dma_resv_assert_held(vbo->base.base.resv);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
index f46891012be3..0476ba498321 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_validation.c
@@ -288,7 +288,7 @@ int vmw_validation_add_bo(struct vmw_validation_context *ctx,
 		val_buf->bo = ttm_bo_get_unless_zero(&vbo->base);
 		if (!val_buf->bo)
 			return -ESRCH;
-		val_buf->num_shared = 0;
+		val_buf->usage = DMA_RESV_USAGE_WRITE;
 		list_add_tail(&val_buf->head, &ctx->bo_list);
 		bo_node->as_mob = as_mob;
 		bo_node->cpu_blit = cpu_blit;
diff --git a/include/drm/ttm/ttm_execbuf_util.h b/include/drm/ttm/ttm_execbuf_util.h
index a99d7fdf2964..851961a06c27 100644
--- a/include/drm/ttm/ttm_execbuf_util.h
+++ b/include/drm/ttm/ttm_execbuf_util.h
@@ -31,6 +31,7 @@
 #ifndef _TTM_EXECBUF_UTIL_H_
 #define _TTM_EXECBUF_UTIL_H_
 
+#include <linux/dma-resv.h>
 #include <linux/list.h>
 
 #include "ttm_bo_api.h"
@@ -46,7 +47,7 @@
 struct ttm_validate_buffer {
 	struct list_head head;
 	struct ttm_buffer_object *bo;
-	unsigned int num_shared;
+	enum dma_resv_usage usage;
 };
 
 /**
-- 
2.36.1

