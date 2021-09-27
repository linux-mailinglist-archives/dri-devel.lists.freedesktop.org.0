Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA2419362
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 13:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DA189FCA;
	Mon, 27 Sep 2021 11:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5201A89EAC;
 Mon, 27 Sep 2021 11:42:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="204610593"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="204610593"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:06 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553158991"
Received: from ajhome-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.19.222])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 04:42:04 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v5 03/13] drm/ttm: move ttm_tt_{add, clear}_mapping into amdgpu
Date: Mon, 27 Sep 2021 12:41:04 +0100
Message-Id: <20210927114114.152310-3-matthew.auld@intel.com>
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

Now that setting page->index shouldn't be needed anymore, we are just
left with setting page->mapping, and here it looks like amdgpu is the
only user, where pointing the page->mapping at the dev_mapping is used
to verify that the pages do indeed belong to the device, if userspace
later tries to touch them.

v2(Christian):
  - Drop the functions altogether and just inline modifying
    the page->mapping

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 ++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c            | 25 -------------------------
 2 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 820fcb24231f..438377a89aa3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1119,6 +1119,8 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
+	pgoff_t i;
+	int ret;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt->userptr) {
@@ -1131,7 +1133,14 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return 0;
 
-	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ttm->num_pages; ++i)
+		ttm->pages[i]->mapping = bdev->dev_mapping;
+
+	return 0;
 }
 
 /*
@@ -1145,6 +1154,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 {
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
 	struct amdgpu_device *adev;
+	pgoff_t i;
 
 	amdgpu_ttm_backend_unbind(bdev, ttm);
 
@@ -1158,6 +1168,9 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return;
 
+	for (i = 0; i < ttm->num_pages; ++i)
+		ttm->pages[i]->mapping = NULL;
+
 	adev = amdgpu_ttm_adev(bdev);
 	return ttm_pool_free(&adev->mman.bdev.pool, ttm);
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 1cc04c224988..980ecb079b2c 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -289,17 +289,6 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
 	return ret;
 }
 
-static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *ttm)
-{
-	pgoff_t i;
-
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
-		return;
-
-	for (i = 0; i < ttm->num_pages; ++i)
-		ttm->pages[i]->mapping = bdev->dev_mapping;
-}
-
 int ttm_tt_populate(struct ttm_device *bdev,
 		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
 {
@@ -336,7 +325,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ret)
 		goto error;
 
-	ttm_tt_add_mapping(bdev, ttm);
 	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
 	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
 		ret = ttm_tt_swapin(ttm);
@@ -359,24 +347,11 @@ int ttm_tt_populate(struct ttm_device *bdev,
 }
 EXPORT_SYMBOL(ttm_tt_populate);
 
-static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
-{
-	pgoff_t i;
-	struct page **page = ttm->pages;
-
-	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
-		return;
-
-	for (i = 0; i < ttm->num_pages; ++i)
-		(*page)->mapping = NULL;
-}
-
 void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 {
 	if (!ttm_tt_is_populated(ttm))
 		return;
 
-	ttm_tt_clear_mapping(ttm);
 	if (bdev->funcs->ttm_tt_unpopulate)
 		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
 	else
-- 
2.26.3

