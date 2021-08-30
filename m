Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9393FB2C5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 10:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A57D89D52;
	Mon, 30 Aug 2021 08:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D1F89CFA
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 08:57:18 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso14118444wmc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mosQ1DPTRoq6s6YNbfJQPwe1yzbvyNouCS04NB/qPjE=;
 b=KK71odF8psiNlrrDlRMCmokZaO/7rtQxtgcIkrsihnmpJ4I94QAiPDqzLhSOMFJw4u
 DoS0eTpqLjh1UNI2kx9aCUrSK0/0+7CLFcFK1thaRDPlrfFIkSJYpvKy+Ns1D3IEE/An
 ACyy8Wv++thaOTF+Yb+hXhdM91fzV6hwnVrlHhg4aGqmfxFcrt+EH4JFehdZs581w0St
 wIqLLB4h77Pyl5x1PidXSmRACy2JzWDzGIkzAghbF4c8Aso+DqSL/ViEL3MnVO+ljxvv
 GgwROmtSwpJEfklluMCX9gq8zWyiA3iLJ+NITEnG0qwY7cltdUe5bdfF50Q48ecUFcIW
 oYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mosQ1DPTRoq6s6YNbfJQPwe1yzbvyNouCS04NB/qPjE=;
 b=USDymHbEpxcQLLUYx50PZ9Yoe8KRBLtLrRC6mw2L7fHchHk3R0pLsT+yCvKNde6UEz
 JAft+SrNvSMS9Na5jDXrvJChsUe40sttIn1jISOV9gxUx7PXLxGLeRHBJaWLRcayboI4
 mL1HxKd0hzavs+bYid0fd5P2xtGIxIgXJy68WlOvWDrjM6JdSuAHgU/wDKle0vtFXlFf
 9I7hdW2ZHKLwUnhvJ79zr3PI2AMkaEkSrPv4uEXrtLv4Wfrz0aqz6kkCYAufgzjjaZ79
 2oS7A8iErFx+ZzpnPhaUNaUeuYdzG5FdIJx7N8cVB1yaMsEiEia7NksHqMEQjMcFO16b
 PmDw==
X-Gm-Message-State: AOAM530A/gWJE1cF6FxbcKS8FEqmAG4uqHZZgCrmyRbJYVyQRt5wcLjv
 TolQUQxbZVB5f60ad84p/TsNE+CaANyKfpe5
X-Google-Smtp-Source: ABdhPJwcbgZQv3EIlwYocZOr6eZSsGXSR4nlldGeLZaCnBsXI2iSS4CZ8+NUsuLyTbzBRBpxhhmZVA==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr21143229wmh.188.1630313837271; 
 Mon, 30 Aug 2021 01:57:17 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u2sm8843245wmj.29.2021.08.30.01.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 01:57:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dri-devel@lists.freedesktop.org,
 andrey.grodzovsky@amd.com
Subject: [PATCH 11/12] drm/amdgpu: remove VRAM accounting
Date: Mon, 30 Aug 2021 10:57:06 +0200
Message-Id: <20210830085707.209508-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830085707.209508-1-christian.koenig@amd.com>
References: <20210830085707.209508-1-christian.koenig@amd.com>
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

This is provided by TTM now.

Also switch man->size to bytes instead of pages and fix the double
printing of size and usage in debugfs.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c      |  5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c     |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 56 +++++++-------------
 7 files changed, 26 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 7b46ba551cb2..c2d5aef2ae48 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -520,9 +520,10 @@ int amdgpu_amdkfd_get_dmabuf_info(struct kgd_dev *kgd, int dma_buf_fd,
 uint64_t amdgpu_amdkfd_get_vram_usage(struct kgd_dev *kgd)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
-	struct ttm_resource_manager *vram_man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
+	struct ttm_resource_manager *vram_man =
+		ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
-	return amdgpu_vram_mgr_usage(vram_man);
+	return ttm_resource_manager_usage(vram_man);
 }
 
 uint64_t amdgpu_amdkfd_get_hive_id(struct kgd_dev *kgd)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index a152363b0254..c2f17d4df748 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -315,7 +315,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	}
 
 	total_vram = adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_size);
-	used_vram = amdgpu_vram_mgr_usage(vram_man);
+	used_vram = ttm_resource_manager_usage(vram_man);
 	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
 
 	spin_lock(&adev->mm_stats.lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index bd8e28e9ca7c..9e9d4f4a8743 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -665,7 +665,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		ui64 = atomic64_read(&adev->num_vram_cpu_page_faults);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VRAM_USAGE:
-		ui64 = amdgpu_vram_mgr_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
+		ui64 = ttm_resource_manager_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VIS_VRAM_USAGE:
 		ui64 = amdgpu_vram_mgr_vis_usage(ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM));
@@ -711,8 +711,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		mem.vram.usable_heap_size = adev->gmc.real_vram_size -
 			atomic64_read(&adev->vram_pin_size) -
 			AMDGPU_VM_RESERVED_VRAM;
-		mem.vram.heap_usage =
-			amdgpu_vram_mgr_usage(vram_man);
+		mem.vram.heap_usage = ttm_resource_manager_usage(vram_man);
 		mem.vram.max_allocation = mem.vram.usable_heap_size * 3 / 4;
 
 		mem.cpu_accessible_vram.total_heap_size =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index fdf4c46d2073..f3222a396fd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1872,7 +1872,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		size = adev->gmc.real_vram_size;
 	else
 		size = adev->gmc.visible_vram_size;
-	man->size = size >> PAGE_SHIFT;
+	man->size = size;
 	adev->mman.buffer_funcs_enabled = enable;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index af0faf9b36f0..ef84a1a78fef 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -44,7 +44,6 @@ struct amdgpu_vram_mgr {
 	spinlock_t lock;
 	struct list_head reservations_pending;
 	struct list_head reserved_pages;
-	atomic64_t usage;
 	atomic64_t vis_usage;
 };
 
@@ -127,7 +126,6 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 void amdgpu_vram_mgr_free_sgt(struct device *dev,
 			      enum dma_data_direction dir,
 			      struct sg_table *sgt);
-uint64_t amdgpu_vram_mgr_usage(struct ttm_resource_manager *man);
 uint64_t amdgpu_vram_mgr_vis_usage(struct ttm_resource_manager *man);
 int amdgpu_vram_mgr_reserve_range(struct ttm_resource_manager *man,
 				  uint64_t start, uint64_t size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 12a7cc2f01cd..1e157e4e99a5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -568,7 +568,7 @@ static int amdgpu_virt_write_vf2pf_data(struct amdgpu_device *adev)
 	vf2pf_info->driver_cert = 0;
 	vf2pf_info->os_info.all = 0;
 
-	vf2pf_info->fb_usage = amdgpu_vram_mgr_usage(vram_man) >> 20;
+	vf2pf_info->fb_usage = ttm_resource_manager_usage(vram_man) >> 20;
 	vf2pf_info->fb_vis_usage = amdgpu_vram_mgr_vis_usage(vram_man) >> 20;
 	vf2pf_info->fb_size = adev->gmc.real_vram_size >> 20;
 	vf2pf_info->fb_vis_size = adev->gmc.visible_vram_size >> 20;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index c1e97c865c2b..87596c03ced2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -99,7 +99,7 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
 	struct ttm_resource_manager *man;
 
 	man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
-	return sysfs_emit(buf, "%llu\n", amdgpu_vram_mgr_usage(man));
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
 }
 
 /**
@@ -255,7 +255,7 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 
 		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
 		atomic64_add(vis_usage, &mgr->vis_usage);
-		atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &mgr->usage);
+		atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &man->usage);
 		list_move(&rsv->node, &mgr->reserved_pages);
 	}
 }
@@ -382,19 +382,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	lpfn = place->lpfn;
 	if (!lpfn)
-		lpfn = man->size;
+		lpfn = man->size >> PAGE_SHIFT;
 
 	max_bytes = adev->gmc.mc_vram_size;
 	if (tbo->type != ttm_bo_type_kernel)
 		max_bytes -= AMDGPU_VM_RESERVED_VRAM;
 
-	/* bail out quickly if there's likely not enough VRAM for this BO */
 	mem_bytes = tbo->base.size;
-	if (atomic64_add_return(mem_bytes, &mgr->usage) > max_bytes) {
-		r = -ENOSPC;
-		goto error_sub;
-	}
-
 	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
 		pages_per_node = ~0ul;
 		num_nodes = 1;
@@ -412,13 +406,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
 	node = kvmalloc(struct_size(node, mm_nodes, num_nodes),
 			GFP_KERNEL | __GFP_ZERO);
-	if (!node) {
-		r = -ENOMEM;
-		goto error_sub;
-	}
+	if (!node)
+		return -ENOMEM;
 
 	ttm_resource_init(tbo, place, &node->base);
 
+	/* bail out quickly if there's likely not enough VRAM for this BO */
+	if (ttm_resource_manager_usage(man) > max_bytes) {
+		r = -ENOSPC;
+		goto error_fini;
+	}
+
 	mode = DRM_MM_INSERT_BEST;
 	if (place->flags & TTM_PL_FLAG_TOPDOWN)
 		mode = DRM_MM_INSERT_HIGH;
@@ -476,11 +474,10 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 	while (i--)
 		drm_mm_remove_node(&node->mm_nodes[i]);
 	spin_unlock(&mgr->lock);
+error_fini:
 	ttm_resource_fini(man, &node->base);
 	kvfree(node);
 
-error_sub:
-	atomic64_sub(mem_bytes, &mgr->usage);
 	return r;
 }
 
@@ -498,7 +495,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	uint64_t usage = 0, vis_usage = 0;
+	uint64_t vis_usage = 0;
 	unsigned i, pages;
 
 	spin_lock(&mgr->lock);
@@ -507,13 +504,11 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 		struct drm_mm_node *mm = &node->mm_nodes[i];
 
 		drm_mm_remove_node(mm);
-		usage += mm->size << PAGE_SHIFT;
 		vis_usage += amdgpu_vram_mgr_vis_size(adev, mm);
 	}
 	amdgpu_vram_mgr_do_reserve(man);
 	spin_unlock(&mgr->lock);
 
-	atomic64_sub(usage, &mgr->usage);
 	atomic64_sub(vis_usage, &mgr->vis_usage);
 
 	ttm_resource_fini(man, res);
@@ -631,20 +626,6 @@ void amdgpu_vram_mgr_free_sgt(struct device *dev,
 	kfree(sgt);
 }
 
-/**
- * amdgpu_vram_mgr_usage - how many bytes are used in this domain
- *
- * @man: TTM memory type manager
- *
- * Returns how many bytes are used in this domain.
- */
-uint64_t amdgpu_vram_mgr_usage(struct ttm_resource_manager *man)
-{
-	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
-
-	return atomic64_read(&mgr->usage);
-}
-
 /**
  * amdgpu_vram_mgr_vis_usage - how many bytes are used in the visible part
  *
@@ -672,13 +653,12 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
+	drm_printf(printer, "  vis usage:%llu\n",
+		   amdgpu_vram_mgr_vis_usage(man));
+
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
-
-	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
-		   man->size, amdgpu_vram_mgr_usage(man) >> 20,
-		   amdgpu_vram_mgr_vis_usage(man) >> 20);
 }
 
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
@@ -700,11 +680,11 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
 	struct ttm_resource_manager *man = &mgr->manager;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev,
-				  adev->gmc.real_vram_size >> PAGE_SHIFT);
+				  adev->gmc.real_vram_size);
 
 	man->func = &amdgpu_vram_mgr_func;
 
-	drm_mm_init(&mgr->mm, 0, man->size);
+	drm_mm_init(&mgr->mm, 0, man->size >> PAGE_SHIFT);
 	spin_lock_init(&mgr->lock);
 	INIT_LIST_HEAD(&mgr->reservations_pending);
 	INIT_LIST_HEAD(&mgr->reserved_pages);
-- 
2.25.1

