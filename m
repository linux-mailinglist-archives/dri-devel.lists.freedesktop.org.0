Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2FBD02A56
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 13:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1BD10E6F8;
	Thu,  8 Jan 2026 12:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="h6ZeWDa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1EE10E6F8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767875616;
 bh=FH2tKOQvvGQssYeNvC3sUDc53HTEdKWxkQbJE6vZ+Zc=;
 h=From:To:Cc:Subject:Date:From;
 b=h6ZeWDa9F/dZsXa+pzIym8Tow9ZAVmPLhrydTJwa5/Sox1PlxQf+/x7bSOZZuj21G
 Ihlbggdgbzzdj/rHE63d5DU21xRIAG07YqPpv4ckMEXEGQ+geycvDUGr3PyocyFKSM
 c1IZ712p2X3r4lEOJ/Kss2cHOpy1jllE1aqjng3KEHOmEhVp8wS9PljyBUwLitWIoF
 BypbT6SC9BkEVEOQyD0rfYboqcU0xmAGuvQqT7GgKg85hESMGFt7SQCtZt0gYaUSrh
 DCDmwZ6Gj43UtH1USx99hE+bYOOc62y/74THsvYzw5iHZeNPhweaSyYzb0CRch5Lzz
 YI33ezQBZ+cqA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4289A17E1330;
 Thu,  8 Jan 2026 13:33:36 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com,
 =?UTF-8?q?Lo=C3=AFc=20Molinari?= <loic.molinari@collabora.com>
Subject: [PATCH v2] drm/panfrost: Fix a page leak in
 panfrost_mmu_map_fault_addr() when THP is on
Date: Thu,  8 Jan 2026 13:33:25 +0100
Message-ID: <20260108123325.1088195-1-boris.brezillon@collabora.com>
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

v2:
- Rework the logic for() loop to better match the folio-granular
  allocation scheme

Cc: Loïc Molinari <loic.molinari@collabora.com>
Fixes: c12e9fcb5a5a ("drm/panfrost: Introduce huge tmpfs mountpoint option")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 40 +++++++++++++++----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 02ccc05e23bb..3f8e7eced1c0 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -586,12 +586,12 @@ addr_to_mapping(struct panfrost_device *pfdev, int as, u64 addr)
 static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 				       u64 addr)
 {
-	int ret, i;
+	int ret;
 	struct panfrost_gem_mapping *bomapping;
 	struct panfrost_gem_object *bo;
 	struct address_space *mapping;
 	struct drm_gem_object *obj;
-	pgoff_t page_offset;
+	pgoff_t page_offset, nr_pages;
 	struct sg_table *sgt;
 	struct page **pages;
 
@@ -612,6 +612,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	addr &= ~((u64)SZ_2M - 1);
 	page_offset = addr >> PAGE_SHIFT;
 	page_offset -= bomapping->mmnode.start;
+	nr_pages = bo->base.base.size >> PAGE_SHIFT;
 
 	obj = &bo->base.base;
 
@@ -625,8 +626,7 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 			goto err_unlock;
 		}
 
-		pages = kvmalloc_array(bo->base.base.size >> PAGE_SHIFT,
-				       sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
+		pages = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL | __GFP_ZERO);
 		if (!pages) {
 			kvfree(bo->sgts);
 			bo->sgts = NULL;
@@ -648,20 +648,30 @@ static int panfrost_mmu_map_fault_addr(struct panfrost_device *pfdev, int as,
 	mapping = bo->base.base.filp->f_mapping;
 	mapping_set_unevictable(mapping);
 
-	for (i = page_offset; i < page_offset + NUM_FAULT_PAGES; i++) {
-		/* Can happen if the last fault only partially filled this
-		 * section of the pages array before failing. In that case
-		 * we skip already filled pages.
-		 */
-		if (pages[i])
-			continue;
+	for (pgoff_t pg = page_offset; pg < page_offset + NUM_FAULT_PAGES;) {
+		bool already_owned = false;
+		struct folio *folio;
 
-		pages[i] = shmem_read_mapping_page(mapping, i);
-		if (IS_ERR(pages[i])) {
-			ret = PTR_ERR(pages[i]);
-			pages[i] = NULL;
+		folio = shmem_read_folio(mapping, pg);
+		if (IS_ERR(folio)) {
+			ret = PTR_ERR(folio);
 			goto err_unlock;
 		}
+
+		pg &= ~(folio_nr_pages(folio) - 1);
+		for (u32 i = 0; i < folio_nr_pages(folio) && pg < nr_pages; i++) {
+			if (pages[pg])
+				already_owned = true;
+
+			pages[pg++] = folio_page(folio, i);
+		}
+
+		/* We always fill the page array at a folio granularity so
+		 * there's no valid reason for a folio range to be partially
+		 * populated.
+		 */
+		if (drm_WARN_ON(&pfdev->base, already_owned))
+			folio_put(folio);
 	}
 
 	ret = sg_alloc_table_from_pages(sgt, pages + page_offset,
-- 
2.52.0

