Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 056D74B465C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:35:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6152110E29D;
	Mon, 14 Feb 2022 09:34:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C63710E292
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:34:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m17so1175761edc.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=9f8wT+KLHd1ZA9n7tBIIc9AXccxWloBuo+X3bfxpYI4=;
 b=UMBQOMhWKgQdJ+0Dje99iK+Xk6hYDTJHPfP7bFVfupjk9KyYm/xjQew7wcq9PHexKv
 d9NTKQV+E8PeHl+DFGd+VjYAlKSuWbFcuW7HBSsb3xOhonwFTQp0d8JsPM8AJzAB6Ook
 4xx8AQf9svTfjTcnlAD1aaYBj54Sd6VAzvuyPZvCA4tOopBpvnfaNm53TIKhucdKAAcv
 lNNuWH5C2I9VVJ+sdUi7wu/3dftfqA98SbCf2jkEamjUZcVUkAcBWVclkEdrEtPTIk3A
 JHzKypRTUsrDgFJvhYVYwmCqwsw+rZRhSzQove3OLLcqRFIHd5qn9fcfdywbs624hUi1
 2UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9f8wT+KLHd1ZA9n7tBIIc9AXccxWloBuo+X3bfxpYI4=;
 b=DML5RasiH5vzRhsCqMEwp2njVouK6uCuCMjK/sPud4jSq4wX+3aiJKPGovfm39HFmZ
 y1Q3Bss9LNe4i9ygarc02o4yWcOgAW8kbSTKS+Ovijxt9LxygfmuDt6eZHiZYcpuN22z
 uwY3tg6++tOeUYLSCx+2sNBnT6YrgSmk3QZ8mYu4Cgid2fixHGvk4hSQQL/Sti6QHFnW
 /5j2BJlTaPYd/Paz0FZVn77Zgq2Q9GMeID56kvGMsr4DjH0l+DjVJeF2ugud4sxQ70nR
 pQm8V5iRNvq7evEr4GJi4QhA3bjYSD+OuI1JM8cpY4oIydSbIlaTYxgFLFlrZahU6YKI
 uiiQ==
X-Gm-Message-State: AOAM531c4QqS/TBEExVlcgR6Hw8We+DyQlojwIg0N3wFZL4XzpQXdjk0
 izA30/idWdrj7lSfw1/MK78=
X-Google-Smtp-Source: ABdhPJxCiAOjSSd9EwuGJtzLu+7nLpkv+yh27RSu+FwyuKMYAMYP++o4JobeLuaLNfsk/FK0zfSsgQ==
X-Received: by 2002:aa7:c90b:: with SMTP id b11mr13991778edt.378.1644831286681; 
 Mon, 14 Feb 2022 01:34:46 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id y8sm4257940edc.41.2022.02.14.01.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:34:46 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: matthew.william.auld@gmail.com, daniel@ffwll.ch,
 thomas.hellstrom@linux.intel.com, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/amdgpu: remove VRAM accounting v2
Date: Mon, 14 Feb 2022 10:34:36 +0100
Message-Id: <20220214093439.2989-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214093439.2989-1-christian.koenig@amd.com>
References: <20220214093439.2989-1-christian.koenig@amd.com>
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

v2: fix size checking as well

Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c      |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c     |  6 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 58 +++++++-------------
 7 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index e8440d306496..025748e9c772 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -314,7 +314,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
 	}
 
 	total_vram = adev->gmc.real_vram_size - atomic64_read(&adev->vram_pin_size);
-	used_vram = amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
+	used_vram = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
 	free_vram = used_vram >= total_vram ? 0 : total_vram - used_vram;
 
 	spin_lock(&adev->mm_stats.lock);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 9ff4aced5da7..0beab961b18b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -678,7 +678,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		ui64 = atomic64_read(&adev->num_vram_cpu_page_faults);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VRAM_USAGE:
-		ui64 = amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
+		ui64 = ttm_resource_manager_usage(&adev->mman.vram_mgr.manager);
 		return copy_to_user(out, &ui64, min(size, 8u)) ? -EFAULT : 0;
 	case AMDGPU_INFO_VIS_VRAM_USAGE:
 		ui64 = amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr);
@@ -717,6 +717,8 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		struct drm_amdgpu_memory_info mem;
 		struct ttm_resource_manager *gtt_man =
 			&adev->mman.gtt_mgr.manager;
+		struct ttm_resource_manager *vram_man =
+			&adev->mman.vram_mgr.manager;
 
 		memset(&mem, 0, sizeof(mem));
 		mem.vram.total_heap_size = adev->gmc.real_vram_size;
@@ -724,7 +726,7 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 			atomic64_read(&adev->vram_pin_size) -
 			AMDGPU_VM_RESERVED_VRAM;
 		mem.vram.heap_usage =
-			amdgpu_vram_mgr_usage(&adev->mman.vram_mgr);
+			ttm_resource_manager_usage(vram_man);
 		mem.vram.max_allocation = mem.vram.usable_heap_size * 3 / 4;
 
 		mem.cpu_accessible_vram.total_heap_size =
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 514754142f69..ea0cde4904f0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -460,7 +460,7 @@ static bool amdgpu_bo_validate_size(struct amdgpu_device *adev,
 	if (domain & AMDGPU_GEM_DOMAIN_VRAM) {
 		man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
 
-		if (size < (man->size << PAGE_SHIFT))
+		if (size < man->size)
 			return true;
 		else
 			goto fail;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index d178fbec7048..5859ed0552a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1884,7 +1884,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 		size = adev->gmc.real_vram_size;
 	else
 		size = adev->gmc.visible_vram_size;
-	man->size = size >> PAGE_SHIFT;
+	man->size = size;
 	adev->mman.buffer_funcs_enabled = enable;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 4e8577dad16a..58c64871c94a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -44,7 +44,6 @@ struct amdgpu_vram_mgr {
 	spinlock_t lock;
 	struct list_head reservations_pending;
 	struct list_head reserved_pages;
-	atomic64_t usage;
 	atomic64_t vis_usage;
 };
 
@@ -122,7 +121,6 @@ int amdgpu_vram_mgr_alloc_sgt(struct amdgpu_device *adev,
 void amdgpu_vram_mgr_free_sgt(struct device *dev,
 			      enum dma_data_direction dir,
 			      struct sg_table *sgt);
-uint64_t amdgpu_vram_mgr_usage(struct amdgpu_vram_mgr *mgr);
 uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr);
 int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
 				  uint64_t start, uint64_t size);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
index 07bc0f504713..3a25dd220786 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
@@ -575,8 +575,10 @@ static int amdgpu_virt_write_vf2pf_data(struct amdgpu_device *adev)
 	vf2pf_info->driver_cert = 0;
 	vf2pf_info->os_info.all = 0;
 
-	vf2pf_info->fb_usage = amdgpu_vram_mgr_usage(&adev->mman.vram_mgr) >> 20;
-	vf2pf_info->fb_vis_usage = amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr) >> 20;
+	vf2pf_info->fb_usage =
+		ttm_resource_manager_usage(&adev->mman.vram_mgr.manager) >> 20;
+	vf2pf_info->fb_vis_usage =
+		amdgpu_vram_mgr_vis_usage(&adev->mman.vram_mgr) >> 20;
 	vf2pf_info->fb_size = adev->gmc.real_vram_size >> 20;
 	vf2pf_info->fb_vis_size = adev->gmc.visible_vram_size >> 20;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 7442095f089c..e50fe25fbcb8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -96,9 +96,9 @@ static ssize_t amdgpu_mem_info_vram_used_show(struct device *dev,
 {
 	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct amdgpu_device *adev = drm_to_adev(ddev);
+	struct ttm_resource_manager *man = &adev->mman.vram_mgr.manager;
 
-	return sysfs_emit(buf, "%llu\n",
-			  amdgpu_vram_mgr_usage(&adev->mman.vram_mgr));
+	return sysfs_emit(buf, "%llu\n", ttm_resource_manager_usage(man));
 }
 
 /**
@@ -253,7 +253,9 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
 
 		vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
 		atomic64_add(vis_usage, &mgr->vis_usage);
-		atomic64_add(rsv->mm_node.size << PAGE_SHIFT, &mgr->usage);
+		spin_lock(&man->bdev->lru_lock);
+		man->usage += rsv->mm_node.size << PAGE_SHIFT;
+		spin_unlock(&man->bdev->lru_lock);
 		list_move(&rsv->node, &mgr->reserved_pages);
 	}
 }
@@ -378,19 +380,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
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
@@ -408,13 +404,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
 
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
@@ -472,11 +472,10 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
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
 
@@ -494,7 +493,7 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
 	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 	struct amdgpu_device *adev = to_amdgpu_device(mgr);
-	uint64_t usage = 0, vis_usage = 0;
+	uint64_t vis_usage = 0;
 	unsigned i, pages;
 
 	spin_lock(&mgr->lock);
@@ -503,13 +502,11 @@ static void amdgpu_vram_mgr_del(struct ttm_resource_manager *man,
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
@@ -627,18 +624,6 @@ void amdgpu_vram_mgr_free_sgt(struct device *dev,
 	kfree(sgt);
 }
 
-/**
- * amdgpu_vram_mgr_usage - how many bytes are used in this domain
- *
- * @mgr: amdgpu_vram_mgr pointer
- *
- * Returns how many bytes are used in this domain.
- */
-uint64_t amdgpu_vram_mgr_usage(struct amdgpu_vram_mgr *mgr)
-{
-	return atomic64_read(&mgr->usage);
-}
-
 /**
  * amdgpu_vram_mgr_vis_usage - how many bytes are used in the visible part
  *
@@ -664,13 +649,12 @@ static void amdgpu_vram_mgr_debug(struct ttm_resource_manager *man,
 {
 	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
 
+	drm_printf(printer, "  vis usage:%llu\n",
+		   amdgpu_vram_mgr_vis_usage(mgr));
+
 	spin_lock(&mgr->lock);
 	drm_mm_print(&mgr->mm, printer);
 	spin_unlock(&mgr->lock);
-
-	drm_printf(printer, "man size:%llu pages, ram usage:%lluMB, vis usage:%lluMB\n",
-		   man->size, amdgpu_vram_mgr_usage(mgr) >> 20,
-		   amdgpu_vram_mgr_vis_usage(mgr) >> 20);
 }
 
 static const struct ttm_resource_manager_func amdgpu_vram_mgr_func = {
@@ -692,11 +676,11 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
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

