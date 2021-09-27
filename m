Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A71419353
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFFD89EAC;
	Mon, 27 Sep 2021 11:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DF889EAE;
 Mon, 27 Sep 2021 11:42:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610587"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610587"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:04 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553158973"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:03 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 02/13] drm/ttm: stop setting page->index for the ttm_tt
Date: Mon, 27 Sep 2021 12:41:03 +0100
Message-Id: <20210927114114.152310-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210927114114.152310-1-matthew.auld@intel.com>
References: <20210927114114.152310-1-matthew.auld@intel.com>
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

In commit:

commit 58aa6622d32af7d2c08d45085f44c54554a16ed7
Author: Thomas Hellstrom <thellstrom@vmware.com>
Date:   Fri Jan 3 11:47:23 2014 +0100

    drm/ttm: Correctly set page mapping and -index members

we started setting the page->mapping and page->index to point to the
virtual address space, if the pages were faulted with TTM. Apparently
this was needed for core-mm to able to reverse lookup the virtual
address given the struct page, and potentially unmap it from the page
tables. However as pointed out by Thomas, since we are now using
PFN_MAP, instead of say PFN_MIXED, this should no longer be the case.

There was also apparently some usecase in vmwgfx which needed this for
dirty tracking, but that also doesn't appear to be the case anymore, as
pointed out by Thomas.

We still need keep the page->mapping for now, since that is still needed
for different reasons, but we try to address that in the next patch.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 --
 drivers/gpu/drm/ttm/ttm_tt.c    | 4 +---
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 5b9b7fd01a69..9a2119fe4bdd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -346,8 +346,6 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 			} else if (unlikely(!page)) {
 				break;
 			}
-			page->index = drm_vma_node_start(&bo->base.vma_node) +
-				page_offset;
 			pfn = page_to_pfn(page);
 		}
 
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index dae52433beeb..1cc04c224988 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -367,10 +367,8 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
-	for (i = 0; i < ttm->num_pages; ++i) {
+	for (i = 0; i < ttm->num_pages; ++i)
 		(*page)->mapping = NULL;
-		(*page++)->index = 0;
-	}
 }
 
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
-- 
2.26.3

