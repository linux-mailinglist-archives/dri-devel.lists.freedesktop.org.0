Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D4E40CCE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:00:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D39E6E9E1;
	Wed, 15 Sep 2021 19:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC366E9DC;
 Wed, 15 Sep 2021 19:00:19 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286094768"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="286094768"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:00:19 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="553460917"
Received: from rdignam-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.110])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:00:18 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v3 02/12] drm/ttm: move ttm_tt_{add, clear}_mapping into amdgpu
Date: Wed, 15 Sep 2021 19:59:44 +0100
Message-Id: <20210915185954.3114858-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210915185954.3114858-1-matthew.auld@intel.com>
References: <20210915185954.3114858-1-matthew.auld@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 27 ++++++++++++++++++++++++-
 drivers/gpu/drm/ttm/ttm_tt.c            | 25 -----------------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 1129e17e9f09..c5fa6e62f6ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1107,6 +1107,24 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct ttm_buffer_object *bo,
 	return &gtt->ttm;
 }
 
+static void amdgpu_ttm_tt_add_mapping(struct ttm_device *bdev,
+				      struct ttm_tt *ttm)
+{
+	pgoff_t i;
+
+	for (i = 0; i < ttm->num_pages; ++i)
+		ttm->pages[i]->mapping = bdev->dev_mapping;
+}
+
+static void amdgpu_ttm_tt_clear_mapping(struct ttm_tt *ttm)
+{
+	struct page **page = ttm->pages;
+	pgoff_t i;
+
+	for (i = 0; i < ttm->num_pages; ++i)
+		(*page)->mapping = NULL;
+}
+
 /*
  * amdgpu_ttm_tt_populate - Map GTT pages visible to the device
  *
@@ -1119,6 +1137,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 {
 	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
 	struct amdgpu_ttm_tt *gtt = (void *)ttm;
+	int ret;
 
 	/* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
 	if (gtt->userptr) {
@@ -1131,7 +1150,12 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
 		return 0;
 
-	return ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
+	if (ret)
+		return ret;
+
+	amdgpu_ttm_tt_add_mapping(bdev, ttm);
+	return 0;
 }
 
 /*
@@ -1159,6 +1183,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 		return;
 
 	adev = amdgpu_ttm_adev(bdev);
+	amdgpu_ttm_tt_clear_mapping(ttm);
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

