Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 037F5566D8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 14:25:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2443B10F060;
	Tue,  5 Jul 2022 12:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDDA10ECF1;
 Tue,  5 Jul 2022 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657023912; x=1688559912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2h56ZVkYgfARSbrvbSCNmxORY1+DdaI/tRezkDgizA=;
 b=ZwnfkgBoxYfcN42CeqCSUhn6DVSCsD4K4rJDyjSUrL7dCTA28JUnHNnS
 1JTVNCbentC8bhymDykwWaUSoIomU3w3eyYMazNms639FFhTJWXqRZcaY
 zo4R+Oc5H8yTx+OxTQi4Cg1aDDc45ZV44XTm0rZMabrigMXvORHFSekUb
 RsqG4M4WuD4OSr6u6DJTzUVO8sheTwHX+qfDJNBLt4C2XIU2osSAWzVzz
 var8tQVMFreQS6R/QcirdDt2jaiW+uAyxKNGipwFMAgbtEWdlar88cPdR
 Q0jlMQY9WspsJTcVnMcBE3PVKWssT7V+sPpkdsKTsQs+mpcjId123oCnU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="345019765"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="345019765"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:25:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="650119490"
Received: from mmckenzi-mobl.ger.corp.intel.com (HELO
 hades.ger.corp.intel.com) ([10.252.50.45])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 05:25:09 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/i915: Check for integer truncation on the
 configuration of ttm place
Date: Tue,  5 Jul 2022 15:24:52 +0300
Message-Id: <20220705122455.3866745-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
References: <20220705122455.3866745-1-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is an impedance mismatch between the first/last valid page
frame number of ttm place in unsigned and our memory/page accounting in
unsigned long.
As the object size is under the control of userspace, we have to be prudent
and catch the conversion errors.
To catch the implicit truncation as we switch from unsigned long to
unsigned, we use overflows_type check and report E2BIG or overflow_type
prior to the operation.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 12 +++++++++---
 drivers/gpu/drm/i915/intel_region_ttm.c | 16 +++++++++++++---
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index cdcb3ee0c433..d579524663b3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -137,19 +137,25 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 	if (mr->type == INTEL_MEMORY_SYSTEM)
 		return;
 
+#define SAFE_CONVERSION(ptr, value) ({ \
+	if (!safe_conversion(ptr, value)) { \
+		GEM_BUG_ON(overflows_type(value, *ptr)); \
+	} \
+})
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place->fpfn = offset >> PAGE_SHIFT;
-		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+		SAFE_CONVERSION(&place->fpfn, offset >> PAGE_SHIFT);
+		SAFE_CONVERSION(&place->lpfn, place->fpfn + (size >> PAGE_SHIFT));
 	} else if (mr->io_size && mr->io_size < mr->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place->flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place->fpfn = 0;
-			place->lpfn = mr->io_size >> PAGE_SHIFT;
+			SAFE_CONVERSION(&place->lpfn, mr->io_size >> PAGE_SHIFT);
 		}
 	}
+#undef SAFE_CONVERSION
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 62ff77445b01..8fcb8654b978 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -202,24 +202,34 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	struct ttm_resource *res;
 	int ret;
 
+#define SAFE_CONVERSION(ptr, value) ({ \
+	if (!safe_conversion(ptr, value)) { \
+		GEM_BUG_ON(overflows_type(value, *ptr)); \
+		ret = -E2BIG; \
+		goto out; \
+	} \
+})
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place.fpfn = offset >> PAGE_SHIFT;
-		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+		SAFE_CONVERSION(&place.fpfn, offset >> PAGE_SHIFT);
+		SAFE_CONVERSION(&place.lpfn, place.fpfn + (size >> PAGE_SHIFT));
 	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place.fpfn = 0;
-			place.lpfn = mem->io_size >> PAGE_SHIFT;
+			SAFE_CONVERSION(&place.lpfn, mem->io_size >> PAGE_SHIFT);
 		}
 	}
+#undef SAFE_CONVERSION
 
 	mock_bo.base.size = size;
 	mock_bo.bdev = &mem->i915->bdev;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
+
+out:
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
 	if (!ret)
-- 
2.34.1

