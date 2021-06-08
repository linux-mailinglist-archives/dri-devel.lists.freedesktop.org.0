Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C71039F498
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 13:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1ED6EBAA;
	Tue,  8 Jun 2021 11:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751C6EBD0;
 Tue,  8 Jun 2021 11:03:57 +0000 (UTC)
IronPort-SDR: 9uQJtq+QUai0Bnj+pmJWobM+cQmsKav0oplpm2i9Zmt6JQPi11zF9v8m/T1hrAC+0hkdc7ENe9
 JbtENrctP0/w==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268674828"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="268674828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:56 -0700
IronPort-SDR: yxbL+qETm4pRKk/C+geUexLn1+CA20lGkqbAb/I5NNtYxQAmEvmUt8xU+wykHJWyo0r+LIMihX
 P4+2DI+G/4fw==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="552237256"
Received: from mrahim1x-mobl.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.215.170.251])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 04:03:53 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 7/7] drm/i915/ttm: restore min_page_size behaviour
Date: Tue,  8 Jun 2021 12:02:54 +0100
Message-Id: <20210608110254.169357-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608110254.169357-1-matthew.auld@intel.com>
References: <20210608110254.169357-1-matthew.auld@intel.com>
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
index 6e45e564e732..76a3b75b716d 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -676,9 +676,9 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
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
index 816e08239a28..d3de1a2113e5 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -166,7 +166,7 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	int ret;
 
 	mock_bo.base.size = size;
-	mock_bo.page_alignment = 1;
+	mock_bo.page_alignment = mem->min_page_size >> PAGE_SHIFT;
 	place.flags = flags;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index 69e21914edee..8a096a40e0d0 100644
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

