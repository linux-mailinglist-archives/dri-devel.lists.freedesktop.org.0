Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1564760EA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 19:42:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A331510F5CE;
	Wed, 15 Dec 2021 18:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F4910F57C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 18:42:05 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 73D0629F7D1;
 Wed, 15 Dec 2021 18:42:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1639593724; bh=TBFtgD6/JgBP+ISDAB7eu1XV+AA8t2hbH6NuNc88ugk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N4tYBydzXgQ5Yhg5PIe/aBdDYfe7iF9v5E64dVz/KJUsOfJpgqLfP0y0gsr6FO6n/
 UJj7Yb7q7QGTLyOUfPhmZmJ7/Ro6XM0ptKskT500/tZRyZg13r26tEcfutTwsxaxBL
 S+4hssEQvSp+qnVR2gxn+NFFDQetZQLNB8yVjY8wmZFDuOuImZLZxX/B4+yMzqRKVe
 bAHMcQLzY9B8kRGhYg0AOiuwHdki8cP6SqCK+SQy2fKemKLBcL5EX5C/iha7lrCAug
 i63pobHZ4bkTzvxcwwPdr3/b3k8xebKhpvSrHq4TDmivcGKF/cDUHTadIqr99DCEiW
 lbo0y28jw458g==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/vmwgfx: Remove explicit transparent hugepages support
Date: Wed, 15 Dec 2021 13:41:46 -0500
Message-Id: <20211215184147.3688785-2-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211215184147.3688785-1-zack@kde.org>
References: <20211215184147.3688785-1-zack@kde.org>
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.helllstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, krastevm@vmware.com,
 mombasawalam@vmware.com, Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Old versions of the svga device used to export virtual vram, handling of
which was optimized on top of transparent hugepages support. Only very
old devices (OpenGL 2.1 support and earlier) used this code and at this
point performance differences are negligible.

Because the code requires very old hardware versions to run it has
been largely untested and unused for a long time.

Furthermore removal of the ttm hugepages support in:
commit 0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")
broke the coherency mode in vmwgfx when running with hugepages.

Fixes: 0d979509539e ("drm/ttm: remove ttm_bo_vm_insert_huge()")
Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas Hellström <thomas.helllstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/Makefile     |   1 -
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c |   8 --
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |   5 -
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c | 184 ----------------------------
 4 files changed, 198 deletions(-)
 delete mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c

diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
index e9d13f155d8c..eee73b9aa404 100644
--- a/drivers/gpu/drm/vmwgfx/Makefile
+++ b/drivers/gpu/drm/vmwgfx/Makefile
@@ -13,6 +13,5 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_hashtab.o vmwgfx_kms.o vmwgfx_d
 	    vmwgfx_gem.o
 
 vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
-vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
 
 obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index f73c46bb2259..8a75fa639183 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -701,23 +701,15 @@ static int vmw_dma_masks(struct vmw_private *dev_priv)
 static int vmw_vram_manager_init(struct vmw_private *dev_priv)
 {
 	int ret;
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	ret = vmw_thp_init(dev_priv);
-#else
 	ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
 				 dev_priv->vram_size >> PAGE_SHIFT);
-#endif
 	ttm_resource_manager_set_used(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
 	return ret;
 }
 
 static void vmw_vram_manager_fini(struct vmw_private *dev_priv)
 {
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	vmw_thp_fini(dev_priv);
-#else
 	ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
-#endif
 }
 
 static int vmw_setup_pci_resources(struct vmw_private *dev,
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 4ec2b99351cf..e2baca9a55f8 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -1564,11 +1564,6 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
 vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf);
 vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf);
 
-/* Transparent hugepage support - vmwgfx_thp.c */
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-extern int vmw_thp_init(struct vmw_private *dev_priv);
-void vmw_thp_fini(struct vmw_private *dev_priv);
-#endif
 
 /**
  * VMW_DEBUG_KMS - Debug output for kernel mode-setting
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
deleted file mode 100644
index 2a3d3468e4e0..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
+++ /dev/null
@@ -1,184 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0 OR MIT
-/*
- * Huge page-table-entry support for IO memory.
- *
- * Copyright (C) 2007-2019 Vmware, Inc. All rights reservedd.
- */
-#include "vmwgfx_drv.h"
-#include <drm/ttm/ttm_bo_driver.h>
-#include <drm/ttm/ttm_placement.h>
-#include <drm/ttm/ttm_range_manager.h>
-
-/**
- * struct vmw_thp_manager - Range manager implementing huge page alignment
- *
- * @manager: TTM resource manager.
- * @mm: The underlying range manager. Protected by @lock.
- * @lock: Manager lock.
- */
-struct vmw_thp_manager {
-	struct ttm_resource_manager manager;
-	struct drm_mm mm;
-	spinlock_t lock;
-};
-
-static struct vmw_thp_manager *to_thp_manager(struct ttm_resource_manager *man)
-{
-	return container_of(man, struct vmw_thp_manager, manager);
-}
-
-static const struct ttm_resource_manager_func vmw_thp_func;
-
-static int vmw_thp_insert_aligned(struct ttm_buffer_object *bo,
-				  struct drm_mm *mm, struct drm_mm_node *node,
-				  unsigned long align_pages,
-				  const struct ttm_place *place,
-				  struct ttm_resource *mem,
-				  unsigned long lpfn,
-				  enum drm_mm_insert_mode mode)
-{
-	if (align_pages >= bo->page_alignment &&
-	    (!bo->page_alignment || align_pages % bo->page_alignment == 0)) {
-		return drm_mm_insert_node_in_range(mm, node,
-						   mem->num_pages,
-						   align_pages, 0,
-						   place->fpfn, lpfn, mode);
-	}
-
-	return -ENOSPC;
-}
-
-static int vmw_thp_get_node(struct ttm_resource_manager *man,
-			    struct ttm_buffer_object *bo,
-			    const struct ttm_place *place,
-			    struct ttm_resource **res)
-{
-	struct vmw_thp_manager *rman = to_thp_manager(man);
-	struct drm_mm *mm = &rman->mm;
-	struct ttm_range_mgr_node *node;
-	unsigned long align_pages;
-	unsigned long lpfn;
-	enum drm_mm_insert_mode mode = DRM_MM_INSERT_BEST;
-	int ret;
-
-	node = kzalloc(struct_size(node, mm_nodes, 1), GFP_KERNEL);
-	if (!node)
-		return -ENOMEM;
-
-	ttm_resource_init(bo, place, &node->base);
-
-	lpfn = place->lpfn;
-	if (!lpfn)
-		lpfn = man->size;
-
-	mode = DRM_MM_INSERT_BEST;
-	if (place->flags & TTM_PL_FLAG_TOPDOWN)
-		mode = DRM_MM_INSERT_HIGH;
-
-	spin_lock(&rman->lock);
-	if (IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)) {
-		align_pages = (HPAGE_PUD_SIZE >> PAGE_SHIFT);
-		if (node->base.num_pages >= align_pages) {
-			ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
-						     align_pages, place,
-						     &node->base, lpfn, mode);
-			if (!ret)
-				goto found_unlock;
-		}
-	}
-
-	align_pages = (HPAGE_PMD_SIZE >> PAGE_SHIFT);
-	if (node->base.num_pages >= align_pages) {
-		ret = vmw_thp_insert_aligned(bo, mm, &node->mm_nodes[0],
-					     align_pages, place, &node->base,
-					     lpfn, mode);
-		if (!ret)
-			goto found_unlock;
-	}
-
-	ret = drm_mm_insert_node_in_range(mm, &node->mm_nodes[0],
-					  node->base.num_pages,
-					  bo->page_alignment, 0,
-					  place->fpfn, lpfn, mode);
-found_unlock:
-	spin_unlock(&rman->lock);
-
-	if (unlikely(ret)) {
-		kfree(node);
-	} else {
-		node->base.start = node->mm_nodes[0].start;
-		*res = &node->base;
-	}
-
-	return ret;
-}
-
-static void vmw_thp_put_node(struct ttm_resource_manager *man,
-			     struct ttm_resource *res)
-{
-	struct ttm_range_mgr_node *node = to_ttm_range_mgr_node(res);
-	struct vmw_thp_manager *rman = to_thp_manager(man);
-
-	spin_lock(&rman->lock);
-	drm_mm_remove_node(&node->mm_nodes[0]);
-	spin_unlock(&rman->lock);
-
-	kfree(node);
-}
-
-int vmw_thp_init(struct vmw_private *dev_priv)
-{
-	struct vmw_thp_manager *rman;
-
-	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
-	if (!rman)
-		return -ENOMEM;
-
-	ttm_resource_manager_init(&rman->manager,
-				  dev_priv->vram_size >> PAGE_SHIFT);
-
-	rman->manager.func = &vmw_thp_func;
-	drm_mm_init(&rman->mm, 0, rman->manager.size);
-	spin_lock_init(&rman->lock);
-
-	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
-	ttm_resource_manager_set_used(&rman->manager, true);
-	return 0;
-}
-
-void vmw_thp_fini(struct vmw_private *dev_priv)
-{
-	struct ttm_resource_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
-	struct vmw_thp_manager *rman = to_thp_manager(man);
-	struct drm_mm *mm = &rman->mm;
-	int ret;
-
-	ttm_resource_manager_set_used(man, false);
-
-	ret = ttm_resource_manager_evict_all(&dev_priv->bdev, man);
-	if (ret)
-		return;
-	spin_lock(&rman->lock);
-	drm_mm_clean(mm);
-	drm_mm_takedown(mm);
-	spin_unlock(&rman->lock);
-	ttm_resource_manager_cleanup(man);
-	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, NULL);
-	kfree(rman);
-}
-
-static void vmw_thp_debug(struct ttm_resource_manager *man,
-			  struct drm_printer *printer)
-{
-	struct vmw_thp_manager *rman = to_thp_manager(man);
-
-	spin_lock(&rman->lock);
-	drm_mm_print(&rman->mm, printer);
-	spin_unlock(&rman->lock);
-}
-
-static const struct ttm_resource_manager_func vmw_thp_func = {
-	.alloc = vmw_thp_get_node,
-	.free = vmw_thp_put_node,
-	.debug = vmw_thp_debug
-};
-- 
2.32.0

