Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB84BEE7A0
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428310E204;
	Sun, 19 Oct 2025 14:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="WK9wztCa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08810E204
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760885584; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MFLY7Cq9wiJwlVQQj7EmEHmqkvSRn1Lt1AoKYoAsG+Hakzco10hCEPrJTd56tmSlbCk5IrG+JJHtcQackxsJCB2M+6hnmHgByBSkr5HmLY5gyLFgehMyLic8ab4RP4i158SEmXBzBM9SN2wzwhGG89jpbBNV27lsc9kREBewTdo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760885584;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pIjaVVcQbgvGbEJUVZGp8Tn3zJE9LV4RLz+qKd1LdVE=; 
 b=RedZArIbRqgoef/317stQ1aXQzTigC/ewUkFmgfZg2HB0Qp1Over32gV3j8UT2fHHZOi6UhLeEP7jpURNaqfPi+ZhAPqXKoHkPIbyyoHizslZ2vDkyrZmhfUQKsmaXMnV7CSu2Z0XHciBqOMGg33eaR0sR3EuuQg3xmGDLnazFs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885584; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pIjaVVcQbgvGbEJUVZGp8Tn3zJE9LV4RLz+qKd1LdVE=;
 b=WK9wztCaJMVVwOASomFseuEYOiPjww/KxFO3ns2aBi8Z7nWV0AtDbYix6ETRxFn5
 z8/VCY2aHC2PskGt+q/WIw2LUhIgovPrUnafQ0A1DDWlsgXEHQWJA0OGJ9Jr9Ile+cs
 JZfq3urZf1KIQsAx3ulF98S7AGsJK7FTx8Wd94Q0=
Received: by mx.zohomail.com with SMTPS id 17608855819873.502349635644123;
 Sun, 19 Oct 2025 07:53:01 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v7 06/12] drm/panfrost: Handle page mapping failure
Date: Sun, 19 Oct 2025 15:52:11 +0100
Message-ID: <20251019145225.3621989-7-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
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

When mapping the pages of a BO, either a heap type at page fault time or
else a non-heap BO at object creation time, if the ARM page table mapping
function fails, we unmap what had been mapped so far and bail out.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 49 ++++++++++++++++++++++---
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 17897edaa2b4..0e3adfbcbdcf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -395,13 +395,32 @@ static void panfrost_mmu_flush_range(struct panfrost_device *pfdev,
 	pm_runtime_put_autosuspend(pfdev->base.dev);
 }
 
+static void mmu_unmap_range(struct panfrost_mmu *mmu, u64 iova, size_t len)
+{
+	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
+	size_t pgsize, unmapped_len = 0;
+	size_t unmapped_page, pgcount;
+
+	while (unmapped_len < len) {
+		pgsize = get_pgsize(iova, len - unmapped_len, &pgcount);
+
+		unmapped_page = ops->unmap_pages(ops, iova, pgsize, pgcount, NULL);
+		WARN_ON(unmapped_page != pgsize * pgcount);
+
+		iova += pgsize * pgcount;
+		unmapped_len += pgsize * pgcount;
+	}
+}
+
 static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 		      u64 iova, int prot, struct sg_table *sgt)
 {
 	unsigned int count;
 	struct scatterlist *sgl;
 	struct io_pgtable_ops *ops = mmu->pgtbl_ops;
+	size_t total_mapped = 0;
 	u64 start_iova = iova;
+	int ret;
 
 	for_each_sgtable_dma_sg(sgt, sgl, count) {
 		unsigned long paddr = sg_dma_address(sgl);
@@ -415,10 +434,14 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 			size_t pgcount, mapped = 0;
 			size_t pgsize = get_pgsize(iova | paddr, len, &pgcount);
 
-			ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
+			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
 				       GFP_KERNEL, &mapped);
+			if (ret)
+				goto err_unmap_pages;
+
 			/* Don't get stuck if things have gone wrong */
 			mapped = max(mapped, pgsize);
+			total_mapped += mapped;
 			iova += mapped;
 			paddr += mapped;
 			len -= mapped;
@@ -428,6 +451,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 	panfrost_mmu_flush_range(pfdev, mmu, start_iova, iova - start_iova);
 
 	return 0;
+
+err_unmap_pages:
+	mmu_unmap_range(mmu, start_iova, total_mapped);
+	return ret;
 }
 
 int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
@@ -438,6 +465,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	struct panfrost_device *pfdev = to_panfrost_device(obj->dev);
 	struct sg_table *sgt;
 	int prot = IOMMU_READ | IOMMU_WRITE | IOMMU_CACHE;
+	int ret;
 
 	if (WARN_ON(mapping->active))
 		return 0;
@@ -449,11 +477,18 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (WARN_ON(IS_ERR(sgt)))
 		return PTR_ERR(sgt);
 
-	mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
-		   prot, sgt);
+	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
+			 prot, sgt);
+	if (ret)
+		goto err_put_pages;
+
 	mapping->active = true;
 
 	return 0;
+
+err_put_pages:
+	drm_gem_shmem_put_pages_locked(shmem);
+	return ret;
 }
 
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)
@@ -638,8 +673,10 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	if (ret)
 		goto err_map;
 
-	mmu_map_sg(pfdev, bomapping->mmu, addr,
-		   IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
+	ret = mmu_map_sg(pfdev, bomapping->mmu, addr,
+			 IOMMU_WRITE | IOMMU_READ | IOMMU_CACHE | IOMMU_NOEXEC, sgt);
+	if (ret)
+		goto err_mmu_map_sg;
 
 	bomapping->active = true;
 	bo->heap_rss_size += SZ_2M;
@@ -653,6 +690,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 
 	return 0;
 
+err_mmu_map_sg:
+	dma_unmap_sgtable(pfdev->base.dev, sgt, DMA_BIDIRECTIONAL, 0);
 err_map:
 	sg_free_table(sgt);
 err_unlock:
-- 
2.51.0

