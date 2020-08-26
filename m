Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C2252523
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 03:45:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A476E9E5;
	Wed, 26 Aug 2020 01:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A996E9E5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 01:45:24 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-QfcrR2vqOdCVAcsrlWu_vA-1; Tue, 25 Aug 2020 21:45:19 -0400
X-MC-Unique: QfcrR2vqOdCVAcsrlWu_vA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73E33801ADD;
 Wed, 26 Aug 2020 01:45:18 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-53.bne.redhat.com
 [10.64.54.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0714A60C13;
 Wed, 26 Aug 2020 01:45:16 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/23] drm/ttm: move sg pointer into ttm_dma_tt
Date: Wed, 26 Aug 2020 11:44:21 +1000
Message-Id: <20200826014428.828392-17-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-1-airlied@gmail.com>
References: <20200826014428.828392-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: gmail.com
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
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

This is only used by drivers that have a dma tt backing store.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       | 32 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 +--
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c           | 26 +++++++--------
 drivers/gpu/drm/ttm/ttm_tt.c                  |  4 ++-
 include/drm/ttm/ttm_tt.h                      |  2 +-
 7 files changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index aa2b328c6202..b2faa02c0263 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1231,8 +1231,9 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		goto err_bo_create;
 	}
 	if (bo_type == ttm_bo_type_sg) {
+		struct ttm_dma_tt *dma_ttm = (struct ttm_dma_tt *)bo->tbo.ttm;
 		bo->tbo.sg = sg;
-		bo->tbo.ttm->sg = sg;
+		dma_ttm->sg = sg;
 	}
 	bo->kfd_bo = *mem;
 	(*mem)->bo = bo;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index f07e7121bcc5..adac24625191 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -985,25 +985,25 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
 		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 
 	/* Allocate an SG array and squash pages into it */
-	r = sg_alloc_table_from_pages(ttm->sg, ttm->pages, ttm->num_pages, 0,
+	r = sg_alloc_table_from_pages(gtt->ttm.sg, ttm->pages, ttm->num_pages, 0,
 				      ttm->num_pages << PAGE_SHIFT,
 				      GFP_KERNEL);
 	if (r)
 		goto release_sg;
 
 	/* Map SG to device */
-	r = dma_map_sgtable(adev->dev, ttm->sg, direction, 0);
+	r = dma_map_sgtable(adev->dev, gtt->ttm.sg, direction, 0);
 	if (r)
 		goto release_sg;
 
 	/* convert SG to linear array of pages and dma addresses */
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+	drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 					 gtt->ttm.dma_address, ttm->num_pages);
 
 	return 0;
 
 release_sg:
-	kfree(ttm->sg);
+	kfree(gtt->ttm.sg);
 	return r;
 }
 
@@ -1021,12 +1021,12 @@ static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
 		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 
 	/* double check that we don't free the table twice */
-	if (!ttm->sg->sgl)
+	if (!gtt->ttm.sg->sgl)
 		return;
 
 	/* unmap the pages mapped to the device */
-	dma_unmap_sgtable(adev->dev, ttm->sg, direction, 0);
-	sg_free_table(ttm->sg);
+	dma_unmap_sgtable(adev->dev, gtt->ttm.sg, direction, 0);
+	sg_free_table(gtt->ttm.sg);
 
 #if IS_ENABLED(CONFIG_DRM_AMDGPU_USERPTR)
 	if (gtt->range) {
@@ -1296,8 +1296,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt && gtt->userptr) {
-		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
-		if (!ttm->sg)
+		gtt->ttm.sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
+		if (!gtt->ttm.sg)
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
@@ -1306,7 +1306,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 	}
 
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
-		if (!ttm->sg) {
+		if (!gtt->ttm.sg) {
 			struct dma_buf_attachment *attach;
 			struct sg_table *sgt;
 
@@ -1315,10 +1315,10 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
 			if (IS_ERR(sgt))
 				return PTR_ERR(sgt);
 
-			ttm->sg = sgt;
+			gtt->ttm.sg = sgt;
 		}
 
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address,
 						 ttm->num_pages);
 		ttm->state = tt_unbound;
@@ -1349,17 +1349,17 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 
 	if (gtt && gtt->userptr) {
 		amdgpu_ttm_tt_set_user_pages(ttm, NULL);
-		kfree(ttm->sg);
+		kfree(gtt->ttm.sg);
 		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
 		return;
 	}
 
-	if (ttm->sg && gtt->gobj->import_attach) {
+	if (gtt->ttm.sg && gtt->gobj->import_attach) {
 		struct dma_buf_attachment *attach;
 
 		attach = gtt->gobj->import_attach;
-		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
-		ttm->sg = NULL;
+		dma_buf_unmap_attachment(attach, gtt->ttm.sg, DMA_BIDIRECTIONAL);
+		gtt->ttm.sg = NULL;
 		return;
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0a8c092e0f2e..478e498da965 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1267,9 +1267,9 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
 	if (ttm->state != tt_unpopulated)
 		return 0;
 
-	if (slave && ttm->sg) {
+	if (slave && ttm_dma->sg) {
 		/* make userspace faulting work */
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+		drm_prime_sg_to_page_addr_arrays(ttm_dma->sg, ttm->pages,
 						 ttm_dma->dma_address, ttm->num_pages);
 		ttm->state = tt_unbound;
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 269d8707acc3..b98eed6039b1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -116,7 +116,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_dma_tt *tt)
 		mem->comp = 0;
 	}
 
-	if (tt->ttm.sg) args.sgl = tt->ttm.sg->sgl;
+	if (tt->sg) args.sgl = tt->sg->sgl;
 	else            args.dma = tt->dma_address;
 
 	mutex_lock(&drm->master.lock);
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 6b7af313389d..f5cbe5d13d33 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -459,23 +459,23 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct ttm_tt *
 
 	} while (pinned < ttm->num_pages);
 
-	r = sg_alloc_table_from_pages(ttm->sg, ttm->pages, ttm->num_pages, 0,
+	r = sg_alloc_table_from_pages(gtt->ttm.sg, ttm->pages, ttm->num_pages, 0,
 				      ttm->num_pages << PAGE_SHIFT,
 				      GFP_KERNEL);
 	if (r)
 		goto release_sg;
 
-	r = dma_map_sgtable(rdev->dev, ttm->sg, direction, 0);
+	r = dma_map_sgtable(rdev->dev, gtt->ttm.sg, direction, 0);
 	if (r)
 		goto release_sg;
 
-	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+	drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 					 gtt->ttm.dma_address, ttm->num_pages);
 
 	return 0;
 
 release_sg:
-	kfree(ttm->sg);
+	kfree(gtt->ttm.sg);
 
 release_pages:
 	release_pages(ttm->pages, pinned);
@@ -493,13 +493,13 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, struct ttm_t
 		DMA_BIDIRECTIONAL : DMA_TO_DEVICE;
 
 	/* double check that we don't free the table twice */
-	if (!ttm->sg->sgl)
+	if (!gtt->ttm.sg->sgl)
 		return;
 
 	/* free the sg table and pages again */
-	dma_unmap_sgtable(rdev->dev, ttm->sg, direction, 0);
+	dma_unmap_sgtable(rdev->dev, gtt->ttm.sg, direction, 0);
 
-	for_each_sgtable_page(ttm->sg, &sg_iter, 0) {
+	for_each_sgtable_page(gtt->ttm.sg, &sg_iter, 0) {
 		struct page *page = sg_page_iter_page(&sg_iter);
 		if (!(gtt->userflags & RADEON_GEM_USERPTR_READONLY))
 			set_page_dirty(page);
@@ -508,7 +508,7 @@ static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, struct ttm_t
 		put_page(page);
 	}
 
-	sg_free_table(ttm->sg);
+	sg_free_table(gtt->ttm.sg);
 }
 
 static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
@@ -610,8 +610,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (gtt && gtt->userptr) {
-		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
-		if (!ttm->sg)
+		gtt->ttm.sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
+		if (!gtt->ttm.sg)
 			return -ENOMEM;
 
 		ttm->page_flags |= TTM_PAGE_FLAG_SG;
@@ -619,8 +619,8 @@ static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
 		return 0;
 	}
 
-	if (slave && ttm->sg) {
-		drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
+	if (slave && gtt->ttm.sg) {
+		drm_prime_sg_to_page_addr_arrays(gtt->ttm.sg, ttm->pages,
 						 gtt->ttm.dma_address, ttm->num_pages);
 		ttm->state = tt_unbound;
 		return 0;
@@ -648,7 +648,7 @@ static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *
 	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
 
 	if (gtt && gtt->userptr) {
-		kfree(ttm->sg);
+		kfree(gtt->ttm.sg);
 		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
 		return;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 67aa7fe39432..1b9960085d11 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -234,7 +234,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 	ttm->page_flags = page_flags;
 	ttm->state = tt_unpopulated;
 	ttm->swap_storage = NULL;
-	ttm->sg = bo->sg;
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
@@ -263,6 +262,7 @@ int ttm_dma_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_object *bo,
 	struct ttm_tt *ttm = &ttm_dma->ttm;
 
 	ttm_tt_init_fields(ttm, bo, page_flags);
+	ttm_dma->sg = bo->sg;
 
 	INIT_LIST_HEAD(&ttm_dma->pages_list);
 	if (ttm_dma_tt_alloc_page_directory(ttm_dma)) {
@@ -282,6 +282,8 @@ int ttm_sg_tt_init(struct ttm_dma_tt *ttm_dma, struct ttm_buffer_object *bo,
 	ttm_tt_init_fields(ttm, bo, page_flags);
 
 	INIT_LIST_HEAD(&ttm_dma->pages_list);
+	ttm_dma->sg = bo->sg;
+
 	if (page_flags & TTM_PAGE_FLAG_SG)
 		ret = ttm_sg_tt_alloc_page_directory(ttm_dma);
 	else
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 146544ba1c10..534d0ef24072 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -67,7 +67,6 @@ struct ttm_tt {
 	struct page **pages;
 	uint32_t page_flags;
 	unsigned long num_pages;
-	struct sg_table *sg; /* for SG objects via dma-buf */
 	struct file *swap_storage;
 	enum ttm_caching_state caching_state;
 	enum {
@@ -90,6 +89,7 @@ struct ttm_tt {
  */
 struct ttm_dma_tt {
 	struct ttm_tt ttm;
+	struct sg_table *sg; /* for SG objects via dma-buf */
 	dma_addr_t *dma_address;
 	struct list_head pages_list;
 };
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
