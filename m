Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB29C40A9A0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 10:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD13A6E442;
	Tue, 14 Sep 2021 08:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58B6E6E43B;
 Tue, 14 Sep 2021 08:51:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="285619143"
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="285619143"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 01:51:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,292,1624345200"; d="scan'208";a="470046208"
Received: from aodohert-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.243.118])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 01:51:11 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2 2/7] drm/ttm: add TTM_PAGE_FLAG_SHMEM
Date: Tue, 14 Sep 2021 09:50:28 +0100
Message-Id: <20210914085033.2833993-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210914085033.2833993-1-matthew.auld@intel.com>
References: <20210914085033.2833993-1-matthew.auld@intel.com>
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

Add new flag to indicate special shmem based tt, which can directly
handle swapping itself, and should be visible to some shrinker.

As part of this we should skip the ttm_pages_allocated accounting, since
such tt objects should already be reachable, and potentially reclaimable
by some shrinker, if under memory pressure, and so shouldn't directly
count towards the swap "watermark" level.

We also need to stop touching the page->mapping and page->index for such
objects, like in ttm_tt_add_mapping, since shmem already uses these.
Some drivers seems to depend on the tt mapping/index behaviour for their
own purposes, so directly using shmem tt likely won't be usable there
as-is.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c |  4 ++--
 drivers/gpu/drm/ttm/ttm_tt.c    | 10 +++++-----
 include/drm/ttm/ttm_tt.h        |  1 +
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..e2131c73dcb6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -346,8 +346,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 			} else if (unlikely(!page)) {
 				break;
 			}
-			page->index = drm_vma_node_start(&bo->base.vma_node) +
-				page_offset;
+			if (!(bo->ttm->page_flags & TTM_PAGE_FLAG_SHMEM))
+				page->index = drm_vma_node_start(&bo->base.vma_node) + page_offset;
 			pfn = page_to_pfn(page);
 		}
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index dae52433beeb..cc4815c1f505 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -293,7 +293,7 @@ static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	pgoff_t i;
 
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
+	if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
 		return;
 
 	for (i = 0; i < ttm->num_pages; ++i)
@@ -311,7 +311,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
 		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
 		if (bdev->pool.use_dma32)
 			atomic_long_add(ttm->num_pages,
@@ -349,7 +349,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
 
 error:
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
 		if (bdev->pool.use_dma32)
 			atomic_long_sub(ttm->num_pages,
@@ -364,7 +364,7 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 	pgoff_t i;
 	struct page **page = ttm->pages;
 
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
+	if (ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))
 		return;
 
 	for (i = 0; i < ttm->num_pages; ++i) {
@@ -384,7 +384,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	else
 		ttm_pool_free(&bdev->pool, ttm);
 
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SHMEM))) {
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
 		if (bdev->pool.use_dma32)
 			atomic_long_sub(ttm->num_pages,
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index 89b15d673b22..20d550185065 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -42,6 +42,7 @@ struct ttm_operation_ctx;
 #define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
 #define TTM_PAGE_FLAG_SG              (1 << 8)
 #define TTM_PAGE_FLAG_NO_RETRY	      (1 << 9)
+#define TTM_PAGE_FLAG_SHMEM	      (1 << 10)
 
 #define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
 
-- 
2.26.3

