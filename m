Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE0E1510E9
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0456ECEB;
	Mon,  3 Feb 2020 20:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0187.hostedemail.com
 [216.40.44.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C4C6ECEB
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2020 20:20:56 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 34026181D302B;
 Mon,  3 Feb 2020 20:20:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, :::::::::::,
 RULES_HIT:1:2:41:355:379:800:960:966:973:982:988:989:1260:1277:1311:1313:1314:1345:1437:1515:1516:1518:1593:1594:1605:1730:1747:1777:1792:1801:2196:2199:2393:2559:2562:2828:2899:3138:3139:3140:3141:3142:3865:3867:3870:3874:4052:4250:4321:4385:4605:5007:6117:7904:8603:8660:9036:10004:10848:11026:11232:11233:11473:11657:11658:11914:12043:12296:12297:12438:12555:12760:12986:13148:13230:13439:14659:21080:21094:21212:21323:21627:21740:21990:30051:30054,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: offer28_24f5cf596430e
X-Filterd-Recvd-Size: 10708
Received: from XPS-9350.home (unknown [47.151.135.224])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Mon,  3 Feb 2020 20:20:53 +0000 (UTC)
Message-ID: <28a2dc6a8775c55125ce635c0ffea53d7522566a.camel@perches.com>
Subject: [trivial PATCH] drm: Use kvcalloc
From: Joe Perches <joe@perches.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>
Date: Mon, 03 Feb 2020 12:19:44 -0800
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the equivalent call to allocate a zeroed array.

Done with a trivial coccinelle script:

$ cat kvmalloc_array.cocci 
@@
expression a;
expression b;
expression c;
@@

-	kvmalloc_array(a, b, c | __GFP_ZERO)
+	kvcalloc(a, b, c)

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |  5 ++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  3 +--
 drivers/gpu/drm/drm_gem.c                    |  3 +--
 drivers/gpu/drm/exynos/exynos_drm_gem.c      |  4 ++--
 drivers/gpu/drm/panfrost/panfrost_drv.c      | 17 ++++++++---------
 drivers/gpu/drm/panfrost/panfrost_mmu.c      |  8 ++++----
 drivers/gpu/drm/radeon/radeon_cs.c           |  4 ++--
 drivers/gpu/drm/ttm/ttm_tt.c                 | 15 ++++++---------
 drivers/gpu/drm/v3d/v3d_gem.c                |  5 ++---
 drivers/gpu/drm/vc4/vc4_gem.c                |  5 ++---
 11 files changed, 32 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1125a4..dd3125 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -556,9 +556,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		bool userpage_invalidated = false;
 		int i;
 
-		e->user_pages = kvmalloc_array(bo->tbo.ttm->num_pages,
-					sizeof(struct page *),
-					GFP_KERNEL | __GFP_ZERO);
+		e->user_pages = kvcalloc(bo->tbo.ttm->num_pages,
+					 sizeof(struct page *), GFP_KERNEL);
 		if (!e->user_pages) {
 			DRM_ERROR("calloc failure\n");
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index 5cb182..d0f756 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -903,9 +903,8 @@ static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
 		unsigned num_entries;
 
 		num_entries = amdgpu_vm_num_entries(adev, cursor->level);
-		entry->entries = kvmalloc_array(num_entries,
-						sizeof(*entry->entries),
-						GFP_KERNEL | __GFP_ZERO);
+		entry->entries = kvcalloc(num_entries,
+					  sizeof(*entry->entries), GFP_KERNEL);
 		if (!entry->entries)
 			return -ENOMEM;
 	}
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
index 82a329..052c03 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
@@ -353,8 +353,7 @@ static int amdgpu_vram_mgr_new(struct ttm_mem_type_manager *man,
 		num_nodes = DIV_ROUND_UP(mem->num_pages, pages_per_node);
 	}
 
-	nodes = kvmalloc_array((uint32_t)num_nodes, sizeof(*nodes),
-			       GFP_KERNEL | __GFP_ZERO);
+	nodes = kvcalloc((uint32_t)num_nodes, sizeof(*nodes), GFP_KERNEL);
 	if (!nodes) {
 		atomic64_sub(mem_bytes, &mgr->usage);
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a6..b5b02f8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -705,8 +705,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	if (!count)
 		return 0;
 
-	objs = kvmalloc_array(count, sizeof(struct drm_gem_object *),
-			     GFP_KERNEL | __GFP_ZERO);
+	objs = kvcalloc(count, sizeof(struct drm_gem_object *), GFP_KERNEL);
 	if (!objs)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index d734d9d..9a794df 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -55,8 +55,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem)
 
 	nr_pages = exynos_gem->size >> PAGE_SHIFT;
 
-	exynos_gem->pages = kvmalloc_array(nr_pages, sizeof(struct page *),
-			GFP_KERNEL | __GFP_ZERO);
+	exynos_gem->pages = kvcalloc(nr_pages, sizeof(struct page *),
+				     GFP_KERNEL);
 	if (!exynos_gem->pages) {
 		DRM_DEV_ERROR(to_dma_dev(dev), "failed to allocate pages.\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 6da59f..91bded 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -138,9 +138,9 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (!job->bo_count)
 		return 0;
 
-	job->implicit_fences = kvmalloc_array(job->bo_count,
-				  sizeof(struct dma_fence *),
-				  GFP_KERNEL | __GFP_ZERO);
+	job->implicit_fences = kvcalloc(job->bo_count,
+					sizeof(struct dma_fence *),
+					GFP_KERNEL);
 	if (!job->implicit_fences)
 		return -ENOMEM;
 
@@ -150,9 +150,9 @@ panfrost_lookup_bos(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	job->mappings = kvmalloc_array(job->bo_count,
-				       sizeof(struct panfrost_gem_mapping *),
-				       GFP_KERNEL | __GFP_ZERO);
+	job->mappings = kvcalloc(job->bo_count,
+				 sizeof(struct panfrost_gem_mapping *),
+				 GFP_KERNEL);
 	if (!job->mappings)
 		return -ENOMEM;
 
@@ -200,9 +200,8 @@ panfrost_copy_in_sync(struct drm_device *dev,
 	if (!job->in_fence_count)
 		return 0;
 
-	job->in_fences = kvmalloc_array(job->in_fence_count,
-					sizeof(struct dma_fence *),
-					GFP_KERNEL | __GFP_ZERO);
+	job->in_fences = kvcalloc(job->in_fence_count,
+				  sizeof(struct dma_fence *), GFP_KERNEL);
 	if (!job->in_fences) {
 		DRM_DEBUG("Failed to allocate job in fences\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 763cfca..6ff501 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -470,16 +470,16 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	mutex_lock(&bo->base.pages_lock);
 
 	if (!bo->base.pages) {
-		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
-				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
+		bo->sgts = kvcalloc(bo->base.base.size / SZ_2M,
+				    sizeof(struct sg_table), GFP_KERNEL);
 		if (!bo->sgts) {
 			mutex_unlock(&bo->base.pages_lock);
 			ret = -ENOMEM;
 			goto err_bo;
 		}
 
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
+		pages = kvcalloc(bo->base.base.size >> PAGE_SHIFT,
+				 sizeof(struct page *), GFP_KERNEL);
 		if (!pages) {
 			kfree(bo->sgts);
 			bo->sgts = NULL;
diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 0d0ab8e0..c52ea22 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -93,8 +93,8 @@ static int radeon_cs_parser_relocs(struct radeon_cs_parser *p)
 	p->dma_reloc_idx = 0;
 	/* FIXME: we assume that each relocs use 4 dwords */
 	p->nrelocs = chunk->length_dw / 4;
-	p->relocs = kvmalloc_array(p->nrelocs, sizeof(struct radeon_bo_list),
-			GFP_KERNEL | __GFP_ZERO);
+	p->relocs = kvcalloc(p->nrelocs, sizeof(struct radeon_bo_list),
+			     GFP_KERNEL);
 	if (p->relocs == NULL) {
 		return -ENOMEM;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 2ec448..6415a1 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -84,8 +84,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
  */
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
-	ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
-			GFP_KERNEL | __GFP_ZERO);
+	ttm->pages = kvcalloc(ttm->num_pages, sizeof(void *), GFP_KERNEL);
 	if (!ttm->pages)
 		return -ENOMEM;
 	return 0;
@@ -93,10 +92,9 @@ static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 
 static int ttm_dma_tt_alloc_page_directory(struct ttm_dma_tt *ttm)
 {
-	ttm->ttm.pages = kvmalloc_array(ttm->ttm.num_pages,
-					  sizeof(*ttm->ttm.pages) +
-					  sizeof(*ttm->dma_address),
-					  GFP_KERNEL | __GFP_ZERO);
+	ttm->ttm.pages = kvcalloc(ttm->ttm.num_pages,
+				  sizeof(*ttm->ttm.pages) + sizeof(*ttm->dma_address),
+				  GFP_KERNEL);
 	if (!ttm->ttm.pages)
 		return -ENOMEM;
 	ttm->dma_address = (void *) (ttm->ttm.pages + ttm->ttm.num_pages);
@@ -105,9 +103,8 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_dma_tt *ttm)
 
 static int ttm_sg_tt_alloc_page_directory(struct ttm_dma_tt *ttm)
 {
-	ttm->dma_address = kvmalloc_array(ttm->ttm.num_pages,
-					  sizeof(*ttm->dma_address),
-					  GFP_KERNEL | __GFP_ZERO);
+	ttm->dma_address = kvcalloc(ttm->ttm.num_pages,
+				    sizeof(*ttm->dma_address), GFP_KERNEL);
 	if (!ttm->dma_address)
 		return -ENOMEM;
 	return 0;
diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 549dde..012d1ff 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -304,9 +304,8 @@ v3d_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	job->bo = kvmalloc_array(job->bo_count,
-				 sizeof(struct drm_gem_cma_object *),
-				 GFP_KERNEL | __GFP_ZERO);
+	job->bo = kvcalloc(job->bo_count, sizeof(struct drm_gem_cma_object *),
+			   GFP_KERNEL);
 	if (!job->bo) {
 		DRM_DEBUG("Failed to allocate validated BO pointers\n");
 		return -ENOMEM;
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index e1cfc3..0f07300 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -743,9 +743,8 @@ vc4_cl_lookup_bos(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	exec->bo = kvmalloc_array(exec->bo_count,
-				    sizeof(struct drm_gem_cma_object *),
-				    GFP_KERNEL | __GFP_ZERO);
+	exec->bo = kvcalloc(exec->bo_count,
+			    sizeof(struct drm_gem_cma_object *), GFP_KERNEL);
 	if (!exec->bo) {
 		DRM_ERROR("Failed to allocate validated BO pointers\n");
 		return -ENOMEM;


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
