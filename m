Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ADB4AB78B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 10:37:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BC910F6AA;
	Mon,  7 Feb 2022 09:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEB810F6AB;
 Mon,  7 Feb 2022 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644226658; x=1675762658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A+kIHQG77dLJHf3DahtYowP52zTRA8sPIPDXIffRYbU=;
 b=aLerU6Qxo2J2faakeoyYxXRtpT+jNcIWuOI2ZE+X+3HOArtBvXy/aNfT
 jmkGAAdB0AEhWAXFD1GIy99P2r8whj+a7JrygpQN6YivBRJe0A4N1pWCd
 U+f+EyzKED+F/NalgMCQkOkQCYOKk1O6dDvHDB67CDjSI1qEo/fO9ZghT
 QI2eXmFG50BSs8KnHq65QtpufkvOzgmygpeoX/KSzm7b7CnZJun8f5Aw5
 zjOThcWjfAsLpR1/k8EiJ5DcTtiuZTn7TjXvjQSX45sdS8WnAobNQQ9he
 S84N5K7xgVpapQz+iYz0WGTAaWdywkHqm0pikp1CqsrWj2gssbgKb9Mhp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273200179"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273200179"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484360845"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:37:36 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [RFC 1/2] drm/i915/ttm: Add extra pages for handling ccs data
Date: Mon,  7 Feb 2022 15:07:42 +0530
Message-Id: <20220207093743.14467-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220207093743.14467-1-ramalingam.c@intel.com>
References: <20220207093743.14467-1-ramalingam.c@intel.com>
MIME-Version: 1.0
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
Cc: Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While evicting the local memory data on flat-ccs capable platform we
need to evict the ccs data associated to the data. For this, we are
adding extra pages ((size / 256) >> PAGE_SIZE) into the ttm_tt.

To achieve this we are adding a new param into the ttm_tt_init as
ccs_pages_needed, which will be added into the ttm_tt->num_pages.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Thomas Hellstorm <thomas.hellstrom@intel.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 23 +++++++++++++++++++++-
 drivers/gpu/drm/qxl/qxl_ttm.c              |  2 +-
 drivers/gpu/drm/ttm/ttm_agp_backend.c      |  2 +-
 drivers/gpu/drm/ttm/ttm_tt.c               | 12 ++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  2 +-
 include/drm/ttm/ttm_tt.h                   |  4 +++-
 7 files changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 3f00192215d1..eef1f4dc7232 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -864,7 +864,7 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struct ttm_buffer_object *bo,
 	if (!tt)
 		return NULL;
 
-	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached);
+	ret = ttm_tt_init(tt, bo, page_flags, ttm_cached, 0);
 	if (ret < 0)
 		goto err_ttm_tt_init;
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 84cae740b4a5..bb71aa6d66c0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -16,6 +16,7 @@
 #include "gem/i915_gem_ttm.h"
 #include "gem/i915_gem_ttm_move.h"
 #include "gem/i915_gem_ttm_pm.h"
+#include "gt/intel_gpu_commands.h"
 
 #define I915_TTM_PRIO_PURGE     0
 #define I915_TTM_PRIO_NO_PAGES  1
@@ -242,12 +243,27 @@ static const struct i915_refct_sgt_ops tt_rsgt_ops = {
 	.release = i915_ttm_tt_release
 };
 
+static inline bool
+i915_gem_object_has_lmem_placement(struct drm_i915_gem_object *obj)
+{
+	int i;
+
+	for (i = 0; i < obj->mm.n_placements; i++)
+		if (obj->mm.placements[i]->type == INTEL_MEMORY_LOCAL)
+			return true;
+
+	return false;
+}
+
 static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 					 uint32_t page_flags)
 {
+	struct drm_i915_private *i915 = container_of(bo->bdev, typeof(*i915),
+						     bdev);
 	struct ttm_resource_manager *man =
 		ttm_manager_type(bo->bdev, bo->resource->mem_type);
 	struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
+	unsigned long ccs_pages_needed = 0;
 	enum ttm_caching caching;
 	struct i915_ttm_tt *i915_tt;
 	int ret;
@@ -270,7 +286,12 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
 		i915_tt->is_shmem = true;
 	}
 
-	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags, caching);
+	if (HAS_FLAT_CCS(i915) && i915_gem_object_has_lmem_placement(obj))
+		ccs_pages_needed = DIV_ROUND_UP(DIV_ROUND_UP(bo->base.size,
+					       NUM_CCS_BYTES_PER_BLOCK), PAGE_SIZE);
+
+	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
+			  caching, ccs_pages_needed);
 	if (ret)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index b2e33d5ba5d0..52156b54498f 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -113,7 +113,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_buffer_object *bo,
 	ttm = kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
 	if (ttm == NULL)
 		return NULL;
-	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
+	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached, 0)) {
 		kfree(ttm);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/ttm_agp_backend.c
index 6ddc16f0fe2b..d27691f2e451 100644
--- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
+++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
@@ -134,7 +134,7 @@ struct ttm_tt *ttm_agp_tt_create(struct ttm_buffer_object *bo,
 	agp_be->mem = NULL;
 	agp_be->bridge = bridge;
 
-	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined)) {
+	if (ttm_tt_init(&agp_be->ttm, bo, page_flags, ttm_write_combined, 0)) {
 		kfree(agp_be);
 		return NULL;
 	}
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 79c870a3bef8..80355465f717 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -134,9 +134,10 @@ void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
 static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       struct ttm_buffer_object *bo,
 			       uint32_t page_flags,
-			       enum ttm_caching caching)
+			       enum ttm_caching caching,
+			       unsigned long ccs_pages)
 {
-	ttm->num_pages = PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT;
+	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + ccs_pages;
 	ttm->caching = ttm_cached;
 	ttm->page_flags = page_flags;
 	ttm->dma_address = NULL;
@@ -146,9 +147,10 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 }
 
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
-		uint32_t page_flags, enum ttm_caching caching)
+		uint32_t page_flags, enum ttm_caching caching,
+		unsigned long ccs_pages)
 {
-	ttm_tt_init_fields(ttm, bo, page_flags, caching);
+	ttm_tt_init_fields(ttm, bo, page_flags, caching, ccs_pages);
 
 	if (ttm_tt_alloc_page_directory(ttm)) {
 		pr_err("Failed allocating page table\n");
@@ -180,7 +182,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
 {
 	int ret;
 
-	ttm_tt_init_fields(ttm, bo, page_flags, caching);
+	ttm_tt_init_fields(ttm, bo, page_flags, caching, 0);
 
 	if (page_flags & TTM_TT_FLAG_EXTERNAL)
 		ret = ttm_sg_tt_alloc_page_directory(ttm);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
index b84ecc6d6611..4e3938e62c08 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
@@ -517,7 +517,7 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm_buffer_object *bo,
 				     ttm_cached);
 	else
 		ret = ttm_tt_init(&vmw_be->dma_ttm, bo, page_flags,
-				  ttm_cached);
+				  ttm_cached, 0);
 	if (unlikely(ret != 0))
 		goto out_no_init;
 
diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
index f20832139815..2c4ff08ea354 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -140,6 +140,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
  * @bo: The buffer object we create the ttm for.
  * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
  * @caching: the desired caching state of the pages
+ * @ccs_pages_needed: Extra pages needed for the ccs data of compression.
  *
  * Create a struct ttm_tt to back data with system memory pages.
  * No pages are actually allocated.
@@ -147,7 +148,8 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
  * NULL: Out of memory.
  */
 int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
-		uint32_t page_flags, enum ttm_caching caching);
+		uint32_t page_flags, enum ttm_caching caching,
+		unsigned long ccs_pages_needed);
 int ttm_sg_tt_init(struct ttm_tt *ttm_dma, struct ttm_buffer_object *bo,
 		   uint32_t page_flags, enum ttm_caching caching);
 
-- 
2.20.1

