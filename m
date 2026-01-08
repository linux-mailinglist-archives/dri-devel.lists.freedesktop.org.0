Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49135D02095
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 11:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4210E6E6;
	Thu,  8 Jan 2026 10:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="FeUYRS8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 716AB10E6EB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 10:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767867035;
 bh=YaQvJbwb5cvw9pQXUgjez+s34rHrO/Vi4ge9pnXNGJs=;
 h=From:To:Cc:Subject:Date:From;
 b=FeUYRS8quDewCiarMyMDipNZiSa+SyPzAVcRDrQxauMX/TBAtYalb3hujsHAPhaIy
 U9iLoXJ2pcT0nHFeN9Cl1nPbZozrDpJwd/100o1Iidqi1W/Qz4lSnJnhwaNleqfCzZ
 T09gjytsyfne96UGSUoxkGNrmFodz9R8FcX1Zc/ffxcCARvqiS+eqbd25MpU8+/HQj
 YqXLndq94/ZLsC6t5mYsBTHyIevEz4J4Yw9U78/hr6mQ3QPkCEXHSEnoqKgWBS1amp
 8UmrDJiphcA++F45Nkuf8WURzL6maPcDEteY8/s++8QHlfqbQgR6QEf7ROUWjNrYhT
 7oH1Oq7AjADiA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C1DC817E13D8;
 Thu,  8 Jan 2026 11:10:34 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
Subject: [PATCH] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
Date: Thu,  8 Jan 2026 11:10:25 +0100
Message-ID: <20260108101025.933843-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.52.0
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

drm_gem_put_pages(), which we rely on for returning BO pages to shmem,
assume per-folio refcounting and not per-page. If we call
shmem_read_mapping_page() per-page, we break this assumption and leak
pages every time we get a huge page allocated.

Cc: Loïc Molinari <loic.molinari@collabora.com>
Fixes: c12e9fcb5a5a ("drm/panfrost: Introduce huge tmpfs mountpoint option")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 37 +++++++++++++++++++++----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 8f3b7a7b6ad0..9b61ad98a77e 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -595,6 +595,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	pgoff_t page_offset;
 	struct sg_table *sgt;
 	struct page **pages;
+	u32 nr_pages;
 
 	bomapping = addr_to_mapping(pfdev, as, addr);
 	if (!bomapping)
@@ -613,6 +614,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	addr &= ~((u64)SZ_2M - 1);
 	page_offset = addr >> PAGE_SHIFT;
 	page_offset -= bomapping->mmnode.start;
+	nr_pages = bo->base.base.size >> PAGE_SHIFT;
 
 	obj = &bo->base.base;
 
@@ -626,8 +628,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
+		pages = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
 		if (!pages) {
 			kvfree(bo->sgts);
 			bo->sgts = NULL;
@@ -650,6 +651,8 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	mapping_set_unevictable(mapping);
 
 	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
+		struct folio *folio;
+
 		/* Can happen if the last fault only partially filled this
 		 * section of the pages array before failing. In that case
 		 * we skip already filled pages.
@@ -657,12 +660,34 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 		if (pages[i])
 			continue;
 
-		pages[i] = shmem_read_mapping_page(mapping, i);
-		if (IS_ERR(pages[i])) {
-			ret = PTR_ERR(pages[i]);
-			pages[i] = NULL;
+		folio = shmem_read_folio(mapping, i);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
 			goto err_unlock;
 		}
+
+		/* We always fill the page array at a folio granularity so
+		 * there's no reason for a missing page to not be the first
+		 * in the folio. We want to ensure that's the case to avoid
+		 * unbalanced folio_{get,put}() leading to leaks, because
+		 * drm_gem_put_pages() assumes per-folio refcounting not
+		 * per-page.
+		 */
+		if (WARN_ON(folio_file_page(folio, i) != folio_page(folio, 0))) {
+			folio_put(folio);
+			ret = -EINVAL;
+			goto err_unlock;
+		}
+
+		/* Fill a folio worth of pages, even if it goes beyond
+		 * NUM_FAULT_PAGES, otherwise we'll end up with unbalanced
+		 * refcounting next time we hit an unmapped section crossing
+		 * this folio.
+		 */
+		for (u32 j = 0; j < folio_nr_pages(folio) && i < nr_pages; j++)
+			pages[i + j] = folio_page(folio, j);
+
+		i += folio_nr_pages(folio) - 1;
 	}
 
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
-- 
2.52.0

