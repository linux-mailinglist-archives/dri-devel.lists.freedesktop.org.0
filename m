Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A18A3AC80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 00:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B23110E77E;
	Tue, 18 Feb 2025 23:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="LPRN0EBK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139A010E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 23:29:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739921346; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Qifcp8XYul+frmQSo8lIl216jfu1LGHu/smbtO+yxc8piOwYPhaM/2+MdAUrj/r9TYV8Y37/HVQ/wFjQ5X+fNvBZU7z2BTaPBqyOc+4PLJeIfRUGWEIefTtKDFx1ulK4d0RAXu8A+cz5KdqZi+qMXbGpTAgodM8EbDAXGjcydTI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739921346;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XNOD0+zkb7PNYrrdBX15Ic1+43Bxv9rI1DSYcDxeTZE=; 
 b=i+A8U+2f+RILhuuDeJ0Q6I8b33LJ64AXfwpznqQS0PTWRUiF51IQ2N3ZF3Io3hoKEmy5qEDOtnQwBuVHqj9KG74TbdbOIHkMcHVtwIHz+cFclZtTeq6nL8PPHpMA2SLkc/FJUCvgCV/sAPFd0Sl0lEZmZJaViJ5GfPMbC7dYqac=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739921346; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=XNOD0+zkb7PNYrrdBX15Ic1+43Bxv9rI1DSYcDxeTZE=;
 b=LPRN0EBKk3GnEYb72Xr1ToNxXHID31v1QyhTh8veT/Euxg9bRaoKE5ihT7mSArwg
 0z+fJwEi9dpTY+NHLpw7tghrabCPmF2V94CmZuNtP1crATAaQ1RwpjwDbZXDPTrfMEP
 xDymQHBUabu0ibUTHVS+O50I5lZs+e9XuuDBDNbM=
Received: by mx.zohomail.com with SMTPS id 1739921345075345.4757482949359;
 Tue, 18 Feb 2025 15:29:05 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [RFC PATCH 6/7] drm/panfrost: Use shmem sparse allocation for heap BOs
Date: Tue, 18 Feb 2025 23:25:36 +0000
Message-ID: <20250218232552.3450939-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
References: <20250218232552.3450939-1-adrian.larumbe@collabora.com>
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

Panfrost heap BOs grow on demand when the GPU triggers a page fault after
accessing an address within the BO's virtual range.

We still store the sgts we get back from the shmem sparse allocation function,
since it was decided management of sparse memory SGTs should be done by client
drivers rather than the shmem subsystem.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 12 ++--
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 85 +++++--------------------
 3 files changed, 25 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 8e0ff3efede7..0cda2c4e524f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -40,10 +40,10 @@ static void panfrost_gem_free_object(struct drm_gem_object *obj)
 		int n_sgt = bo->base.base.size / SZ_2M;
 
 		for (i = 0; i < n_sgt; i++) {
-			if (bo->sgts[i].sgl) {
-				dma_unmap_sgtable(pfdev->dev, &bo->sgts[i],
+			if (bo->sgts[i]) {
+				dma_unmap_sgtable(pfdev->dev, bo->sgts[i],
 						  DMA_BIDIRECTIONAL, 0);
-				sg_free_table(&bo->sgts[i]);
+				sg_free_table(bo->sgts[i]);
 			}
 		}
 		kvfree(bo->sgts);
@@ -274,7 +274,11 @@ panfrost_gem_create(struct drm_device *dev, size_t size, u32 flags)
 	if (flags & PANFROST_BO_HEAP)
 		size = roundup(size, SZ_2M);
 
-	shmem = drm_gem_shmem_create(dev, size);
+	if (flags & PANFROST_BO_HEAP)
+		shmem = drm_gem_shmem_create_sparse(dev, size);
+	else
+		shmem = drm_gem_shmem_create(dev, size);
+
 	if (IS_ERR(shmem))
 		return ERR_CAST(shmem);
 
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 7516b7ecf7fe..2a8d0752011e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -11,7 +11,7 @@ struct panfrost_mmu;
 
 struct panfrost_gem_object {
 	struct drm_gem_shmem_object base;
-	struct sg_table *sgts;
+	struct sg_table **sgts;
 
 	/*
 	 * Use a list for now. If searching a mapping ever becomes the
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index b91019cd5acb..4a78ff9ca293 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -441,14 +441,11 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 				       u64 addr)
 {
-	int ret, i;
 	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
-	struct address_space *mapping;
-	struct drm_gem_object *obj;
 	pgoff_t page_offset;
 	struct sg_table *sgt;
-	struct page **pages;
+	int ret = 0;
 
 	bomapping = addr_to_mapping(pfdev, as, addr);
 	if (!bomapping)
@@ -459,94 +456,44 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		dev_WARN(pfdev->dev, "matching BO is not heap type (GPU VA = %llx)",
 			 bomapping->mmnode.start << PAGE_SHIFT);
 		ret = -EINVAL;
-		goto err_bo;
+		goto fault_out;
 	}
 	WARN_ON(bomapping->mmu->as != as);
 
 	/* Assume 2MB alignment and size multiple */
 	addr &= ~((u64)SZ_2M - 1);
-	page_offset = addr >> PAGE_SHIFT;
-	page_offset -= bomapping->mmnode.start;
+	page_offset = (addr >> PAGE_SHIFT) - bomapping->mmnode.start;
 
-	obj = &bo->base.base;
-
-	dma_resv_lock(obj->resv, NULL);
-
-	if (!bo->base.pages) {
+	if (!bo->sgts) {
 		bo->sgts = kvmalloc_array(bo->base.base.size / SZ_2M,
-				     sizeof(struct sg_table), GFP_KERNEL | __GFP_ZERO);
+					  sizeof(struct sg_table *), GFP_KERNEL | __GFP_ZERO);
 		if (!bo->sgts) {
 			ret = -ENOMEM;
-			goto err_unlock;
-		}
-
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
-		if (!pages) {
-			kvfree(bo->sgts);
-			bo->sgts = NULL;
-			ret = -ENOMEM;
-			goto err_unlock;
-		}
-		bo->base.pages = pages;
-		bo->base.pages_use_count = 1;
-	} else {
-		pages = bo->base.pages;
-		if (pages[page_offset]) {
-			/* Pages are already mapped, bail out. */
-			goto out;
+			goto fault_out;
 		}
 	}
 
-	mapping = bo->base.base.filp->f_mapping;
-	mapping_set_unevictable(mapping);
+	sgt = drm_gem_shmem_get_sparse_pages_sgt(&bo->base, NUM_FAULT_PAGES, page_offset);
+	if (IS_ERR(sgt)) {
+		if (WARN_ON(PTR_ERR(sgt) != -EEXIST))
+			ret = PTR_ERR(sgt);
+		else
+			ret = 0;
 
-	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
-		/* Can happen if the last fault only partially filled this
-		 * section of the pages array before failing. In that case
-		 * we skip already filled pages.
-		 */
-		if (pages[i])
-			continue;
-
-		pages[i] = shmem_read_mapping_page(mapping, i);
-		if (IS_ERR(pages[i])) {
-			ret = PTR_ERR(pages[i]);
-			pages[i] = NULL;
-			goto err_unlock;
-		}
+		goto fault_out;
 	}
 
-	sgt = &bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)];
-	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
-					NUM_FAULT_PAGES, 0, SZ_2M, GFP_KERNEL);
-	if (ret)
-		goto err_unlock;
-
-	ret = dma_map_sgtable(pfdev->dev, sgt, DMA_BIDIRECTIONAL, 0);
-	if (ret)
-		goto err_map;
-
 	mmu_map_sg(pfdev, bomapping->mmu, addr,
 		   IOMMU_WRITE | IOMMU_READ | IOMMU_NOEXEC, sgt);
 
+	bo->sgts[page_offset / (SZ_2M / PAGE_SIZE)] = sgt;
+
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
 
 	dev_dbg(pfdev->dev, "mapped page fault @ AS%d %llx", as, addr);
 
-out:
-	dma_resv_unlock(obj->resv);
-
-	panfrost_gem_mapping_put(bomapping);
-
-	return 0;
-
-err_map:
-	sg_free_table(sgt);
-err_unlock:
-	dma_resv_unlock(obj->resv);
-err_bo:
+fault_out:
 	panfrost_gem_mapping_put(bomapping);
 	return ret;
 }
-- 
2.47.1

