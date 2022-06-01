Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8611539A6D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 02:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E16D10FC82;
	Wed,  1 Jun 2022 00:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAE210FC7C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 00:39:57 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id rq11so606019ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 17:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zKCKpK19TtFGL5MgNHbvXjQABeEiKbii+uO2Op7p5DI=;
 b=KH2Wwomlug5Tg17Jqv29Qezm7P5AQHss1fttSHDHCJYM8jr5U8oJw28w8Nj8d+Lv5U
 ILn7yMnviyXLqavxWcXLwhYnQseVisDVt+2YuPBTu79T/vtCGXkQYZo4Cm/xg74lHxey
 Oc7sON3Q0GH05u/XwjqlBaf/S5Xbc4SpcFUdYJVrN4ta6eg5D4Fl3kVp18pmDVmOKCFr
 HtnBzTtkzFjEpPDuz+qffw49nJ4t8aK0Pt4HHwzf3Z4GxQsi0+94zt/y61DCacUQbNzv
 PJddzN5+3Fvc92VboibI3Sg8vNqtEG9cBn/31qZvXoLrdjByLW9mU7e+9ta7OOAkYE5C
 KlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zKCKpK19TtFGL5MgNHbvXjQABeEiKbii+uO2Op7p5DI=;
 b=bO9d62pjT1+MyZSlfBZe6CEuU1f/l6vOMSuWAG+ov3FNcfz53SCfMZl5dLsXFCRMOF
 pvka7oHuuChvPvOTZlkjTC5QG1pdjqM+Em5kEBTlKIZA8sQWMnQmUyfrPk/tILS1PNUv
 vBCBdoqaP0V6p4UEhOb4MADLo3MIcRmFykwhyut/hJtwA6gOIZ2Ba6GHoAJO3/+NG8nn
 VOJiNY3AshcENI22vOPMualoDgsyjE4Ybi03UXTxG/d71d0L9I/1KBcRf1tHr0uHCt0S
 5hMUGu5Z+nJZzA9CNfwno2nO3b63WE80Ouyljgs12CDi+uat8R+aySD9l5HSmyqFCEoW
 3P1Q==
X-Gm-Message-State: AOAM533fMVQe5v7rKPpUJ6kh/r0zlqEP4mg1yBon40d6xuX5Whsq1cFJ
 syBMie/GQuSWnrhBBrqSSUixtu+V8h7YSw==
X-Google-Smtp-Source: ABdhPJwYl6z1ubeLnpkBbZU0dzPOfK0+doCNKQlpFvSHK3XTf+Bd6uBBvo9ii/iksEeWvASAf/LhJg==
X-Received: by 2002:a17:907:724b:b0:6ff:2ed0:957 with SMTP id
 ds11-20020a170907724b00b006ff2ed00957mr22010694ejc.445.1654043995385; 
 Tue, 31 May 2022 17:39:55 -0700 (PDT)
Received: from bas-workstation.. ([2a02:aa12:a77f:2000:7285:c2ff:fe67:a82f])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a056402001500b0042aa23fa93bsm106182edu.20.2022.05.31.17.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 17:39:55 -0700 (PDT)
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
To: dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 4/5] drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
Date: Wed,  1 Jun 2022 02:40:13 +0200
Message-Id: <20220601004014.158247-5-bas@basnieuwenhuizen.nl>
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

We want to take only a BOOKKEEP usage for contexts that are not
implicitly synced.

Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 9 +++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c          | 2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c          | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c           | 6 ++++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h           | 3 ++-
 6 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 92a1b08b3bbc..c47695b37a1c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -921,7 +921,7 @@ static int reserve_bo_and_vm(struct kgd_mem *mem,
 	ctx->kfd_bo.tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&ctx->kfd_bo.tv.head, &ctx->list);
 
-	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0]);
+	amdgpu_vm_get_pd_bo(vm, &ctx->list, &ctx->vm_pd[0], DMA_RESV_USAGE_READ);
 
 	ret = ttm_eu_reserve_buffers(&ctx->ticket, &ctx->list,
 				     false, &ctx->duplicates);
@@ -992,7 +992,7 @@ static int reserve_bo_and_cond_vms(struct kgd_mem *mem,
 			continue;
 
 		amdgpu_vm_get_pd_bo(entry->bo_va->base.vm, &ctx->list,
-				&ctx->vm_pd[i]);
+				&ctx->vm_pd[i], DMA_RESV_USAGE_READ);
 		i++;
 	}
 
@@ -2212,7 +2212,7 @@ static int validate_invalid_user_pages(struct amdkfd_process_info *process_info)
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			    vm_list_node)
 		amdgpu_vm_get_pd_bo(peer_vm, &resv_list,
-				    &pd_bo_list_entries[i++]);
+				    &pd_bo_list_entries[i++], DMA_RESV_USAGE_READ);
 	/* Add the userptr_inval_list entries to resv_list */
 	list_for_each_entry(mem, &process_info->userptr_inval_list,
 			    validate_list.head) {
@@ -2407,7 +2407,8 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence **ef)
 	mutex_lock(&process_info->lock);
 	list_for_each_entry(peer_vm, &process_info->vm_list_head,
 			vm_list_node)
-		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++]);
+		amdgpu_vm_get_pd_bo(peer_vm, &ctx.list, &pd_bo_list[i++],
+				    DMA_RESV_USAGE_READ);
 
 	/* Reserve all BOs and page tables/directory. Add all BOs from
 	 * kfd_bo_list to ctx.list
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 0318a6d46a41..64419f55606f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -524,7 +524,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	amdgpu_bo_list_get_list(p->bo_list, &p->validated);
 
 	INIT_LIST_HEAD(&duplicates);
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &p->validated, &p->vm_pd, DMA_RESV_USAGE_READ);
 
 	if (p->uf_entry.tv.bo && !ttm_to_amdgpu_bo(p->uf_entry.tv.bo)->parent)
 		list_add(&p->uf_entry.tv.head, &p->validated);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
index 71277257d94d..f091fe6bb985 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
@@ -77,7 +77,7 @@ int amdgpu_map_static_csa(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	csa_tv.usage = DMA_RESV_USAGE_READ;
 
 	list_add(&csa_tv.head, &list);
-	amdgpu_vm_get_pd_bo(vm, &list, &pd);
+	amdgpu_vm_get_pd_bo(vm, &list, &pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, true, NULL);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index 7483411229f4..a1194a0986bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -210,7 +210,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
 	tv.usage = DMA_RESV_USAGE_READ;
 	list_add(&tv.head, &list);
 
-	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd);
+	amdgpu_vm_get_pd_bo(vm, &list, &vm_pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, false, &duplicates);
 	if (r) {
@@ -740,7 +740,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
 		abo = NULL;
 	}
 
-	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd);
+	amdgpu_vm_get_pd_bo(&fpriv->vm, &list, &vm_pd, DMA_RESV_USAGE_READ);
 
 	r = ttm_eu_reserve_buffers(&ticket, &list, true, &duplicates);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 515be19ab279..da04072a3ea6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -623,17 +623,19 @@ static void amdgpu_vm_pt_next_dfs(struct amdgpu_device *adev,
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
-	entry->tv.usage = DMA_RESV_USAGE_READ;
+	entry->tv.usage = resv_usage;
 	entry->user_pages = NULL;
 	list_add(&entry->tv.head, validated);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
index a40a6a993bb0..a14cd9716f44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
@@ -384,7 +384,8 @@ void amdgpu_vm_release_compute(struct amdgpu_device *adev, struct amdgpu_vm *vm)
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
2.36.1

