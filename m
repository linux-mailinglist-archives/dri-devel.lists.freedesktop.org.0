Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CA23A9EFA
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 17:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7A86E24D;
	Wed, 16 Jun 2021 15:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE4689A0E;
 Wed, 16 Jun 2021 15:25:34 +0000 (UTC)
IronPort-SDR: V4zLw83E/puk1/WpoBL3yfGfsj8guuWk0ExwR91UUFyNgTbmRalg2IlCNEghFI7RDytmLdaSaI
 MckAq1pboRZg==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="203175182"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="203175182"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 08:25:34 -0700
IronPort-SDR: u0Vhzvyumv7ly7XYIGk76LM7Dj+BU50ub5jYeMjaVtmgU9jTwudR37XiptpeOzzQEOmBjVnO5e
 6Yu54NIo9ntw==
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="479129925"
Received: from mrapopor-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.236.122])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 08:25:33 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 7/7] drm/i915/ttm: restore min_page_size behaviour
Date: Wed, 16 Jun 2021 16:25:01 +0100
Message-Id: <20210616152501.394518-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210616152501.394518-1-matthew.auld@intel.com>
References: <20210616152501.394518-1-matthew.auld@intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We now have bo->page_alignment which perfectly describes what we need if
we have min page size restrictions for lmem. We can also drop the flag
here, since this is the default behaviour for all objects.

v2(Thomas):
    - bo->page_alignment is in page units

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 4 ++--
 drivers/gpu/drm/i915/intel_memory_region.h   | 3 +--
 drivers/gpu/drm/i915/intel_region_ttm.c      | 2 +-
 drivers/gpu/drm/i915/selftests/mock_region.c | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index b8739f3d3462..9366b18d1bc6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -672,9 +672,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
 	 */
 	obj->base.vma_node.driver_private = i915_gem_to_ttm(obj);
 	ret = ttm_bo_init(&i915->bdev, i915_gem_to_ttm(obj), size,
-			  bo_type, &i915_sys_placement, 1,
+			  bo_type, &i915_sys_placement,
+			  mem->min_page_size >> PAGE_SHIFT,
 			  true, NULL, NULL, i915_ttm_bo_destroy);
-
 	if (!ret)
 		obj->ttm.created = true;
 
diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
index b04fb22726d9..2be8433d373a 100644
--- a/drivers/gpu/drm/i915/intel_memory_region.h
+++ b/drivers/gpu/drm/i915/intel_memory_region.h
@@ -40,8 +40,7 @@ enum intel_region_id {
 #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
 #define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
 
-#define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
-#define I915_ALLOC_CONTIGUOUS     BIT(1)
+#define I915_ALLOC_CONTIGUOUS     BIT(0)
 
 #define for_each_memory_region(mr, i915, id) \
 	for (id = 0; id < ARRAY_SIZE((i915)->mm.regions); id++) \
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 052253c81e98..d53d78dec2be 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -167,7 +167,7 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	int ret;
 
 	mock_bo.base.size = size;
-	mock_bo.page_alignment = 1;
+	mock_bo.page_alignment = mem->min_page_size >> PAGE_SHIFT;
 	place.flags = flags;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 3b3264311c91..fa786dede608 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -28,7 +28,7 @@ static int mock_region_get_pages(struct drm_i915_gem_object *obj)
 	struct sg_table *pages;
 	int err;
 
-	flags = I915_ALLOC_MIN_PAGE_SIZE;
+	flags = 0;
 	if (obj->flags & I915_BO_ALLOC_CONTIGUOUS)
 		flags |= TTM_PL_FLAG_CONTIGUOUS;
 
-- 
2.26.3

