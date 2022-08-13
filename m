Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4271759FE5B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91CF9AFFC;
	Wed, 24 Aug 2022 15:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3474CB1825
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Aug 2022 01:28:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z20so3202893edb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 18:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KoK2NEe0/zm4mbeNrDv9JEDtGY5iYSXZSFTUMZCraIU=;
 b=GFoyGKRKZJV6JEkbpluTdJ+FAIhulxJaJDtc6kiKyp6YAOLcm6JD7VJDiqJiQizVET
 gA72ysnc6AINUaiOojHQiON13Y517YepV+Jz1sdFrxN3ewbHT9n9e97z6KYtTXCTsMA0
 ceRJl2AdHlCrgF0cRaEQusmUxrz2VgsKhmub64RXOHLhVXVFA9Ki1FymiV9GhmBAfWSq
 cmNNtZNya/UCV2+CDswVJlRqIsCa2mmuncM0r8T500Un4Djz9IazTz2tdWBqhCp7YFV0
 0j94XcHCrCxTKPKXfBQ7QTVahh12FIEMM9A6Tvqviu73slsopt2W0zNZdxOrniSzupbb
 zKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KoK2NEe0/zm4mbeNrDv9JEDtGY5iYSXZSFTUMZCraIU=;
 b=xkkGaRwvYpU7dp8olxXXwz9+EL3k9gXvMRWztW9l0Hvidc6aV1WFKmOWXgDuZeQMOR
 TQ3ruclU00sVv6UBkLptpG/Mr8GldFgUBGr+GXA+gHtb5peZlijlMWt5J5uw9y1E8qRW
 3Z6k2go48XzJ0D1RKDHgpoPkxWroASRQ0v3G/OZMj5wiwpI97H9fhBglLQVIywqQeMEX
 ojakp1bR6gogOOD0sHL3/t0MKEEnCu+QoIetErADqq7WoZScPDJQ/5t/xrp0px2156Vw
 KGam9q0dsyNaq5WP2ETxDMX5j34bhR0ZgfrvIc1+rqajH3QYYYrd/WkVCn/kg985CkEc
 NmSg==
X-Gm-Message-State: ACgBeo0/dxCL6DsBNCSfLby+m52OwxuuTFW/PLJrbq+ZKSP8VulQN4jN
 wc47a6GKnmCYfEAj2LOkV5M2EmUhlpYZe2PT
X-Google-Smtp-Source: AA6agR5tI7mhPVDU7ZjODTtQS8PWQQRQCe+fvFvefEOTrHlMCEGkTSGq1CjTDri8HhDRGcTb6t6L3w==
X-Received: by 2002:a05:6402:194d:b0:43d:8001:984b with SMTP id
 f13-20020a056402194d00b0043d8001984bmr5621377edz.327.1660354080376; 
 Fri, 12 Aug 2022 18:28:00 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 ot3-20020a170906ccc300b0072ab06bf296sm1342536ejb.23.2022.08.12.18.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 18:27:59 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/6] drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
Date: Sat, 13 Aug 2022 03:27:59 +0200
Message-Id: <20220813012801.1115950-5-bas@basnieuwenhuizen.nl>
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

We want to take only a BOOKKEEP usage for contexts that are not
implicitly synced.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 9 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           | 3 ++-
 7 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 746f44c1c3f9..cc4fcc82eec1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -923,7 +923,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
-	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
+	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0], DMA_RESV_USAGE_READ);
 
 	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
 				     false, &ctx->duplicates);
@@ -995,7 +995,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 			continue;
 
 		amdgpu_vm_get_pd_bo(entry->bo_va->base.vm, &ctx->list,
-				&ctx->vm_pd[i]);
+				&ctx->vm_pd[i], DMA_RESV_USAGE_READ);
 		i++;
 	}
 
@@ -2203,7 +2203,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node)
 		amdgpu_vm_get_pd_bo(peer_vm, &resv_list,
-				    &pd_bo_list_entries[i++]);
+				    &pd_bo_list_entries[i++], DMA_RESV_USAGE_READ);
 	/* Add the userptr_inval_list entries to resv_list */
 	list_for_each_entry(mem, &process_info->userptr_inval_list,
 			    validate_list.head) {
@@ -2399,7 +2399,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	mutex_lock(&process_info->lock);
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++]);
+		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++],
+				    DMA_RESV_USAGE_READ);
 
 	/* Reserve all BOs and page tables/directory. Add all BOs from
 	 * kfd_bo_list to ctx.list
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 91958e9db90b..175fc2c2feec 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -531,7 +531,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
 	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, DMA_RESV_USAGE_READ);
 
 	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
 		list_add(&p->uf_entry.tv.head, &p->validated);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 24941ed1a5ec..0cc2c863808f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -78,7 +78,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
+	amdgpu_vm_get_pd_bo(vm, &list, &pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index f8cf52eb1931..0f0e0acec691 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -211,7 +211,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
+	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
 	if (r) {
@@ -747,7 +747,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		abo = NULL;
 	}
 
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 6b1da37c2280..852057cccc54 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -999,7 +999,7 @@ int amdgpu_mes_ctx_map_meta_data(struct amdgpu_device *adev,
 	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
+	amdgpu_vm_get_pd_bo(vm, &list, &pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 1b5d2317b987..17cfe16a68ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -313,19 +313,21 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
  * @vm: vm providing the BOs
  * @validated: head of validation list
  * @entry: entry to add
+ * @resv_usage: resv usage for the synchronization
  *
  * Add the page directory to the list of BOs to
  * validate for command submission.
  */
 void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry)
+			 struct amdgpu_bo_list_entry *entry,
+			 enum dma_resv_usage resv_usage)
 {
 	entry->priority = 0;
 	entry->tv.bo = &vm->root.bo->tbo;
 	/* Two for VM updates, one for TTM and one for the CS job */
 	entry->tv.num_shared = 4;
-	entry->tv.usage = DMA_RESV_USAGE_READ;
+	entry->tv.usage = resv_usage;
 	entry->user_pages = NULL;
 	list_add(&entry->tv.head, validated);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index 9ecb7f663e19..da0de4df13ef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -386,7 +386,8 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
 void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm);
 void amdgpu_vm_get_pd_bo(struct amdgpu_vm *vm,
 			 struct list_head *validated,
-			 struct amdgpu_bo_list_entry *entry);
+			 struct amdgpu_bo_list_entry *entry,
+			 enum dma_resv_usage resv_usage);
 bool amdgpu_vm_ready(struct amdgpu_vm *vm);
 int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 			      int (*callback)(void *p, struct amdgpu_bo *bo),
-- 
2.37.1

