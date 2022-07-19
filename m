Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45A57A088
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FE812AF51;
	Tue, 19 Jul 2022 14:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7DA10ECD0;
 Tue, 19 Jul 2022 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658239556; x=1689775556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=krsjuX88+1+7otI9fGikp5c5oUC8wUFyY0WjsaIaF58=;
 b=EUYaLk+ax0IGgNI6kr4wbJ2wRdJfTHc3wB6ZucbdUyVMzS8XG5luhiqG
 Zbt7tmeUcqapNT/ETt09Fxhc/sIRXi3huR80E5l4T4gflKxkENuzSde2h
 We961JWv0AFuA6KT9mO0jG2l+2U0yW5YONg4u1CY8HywIO03WUlyXSZH4
 f4cxrM0Ma8qdWohvZqg1kNTeiYSJD/HB4Cfdnu8n8QewDX9uOuXs6fsgG
 wyhejA7Sf7fgX+C0tDszOvzedrwu33M1bN6ZUw1ZLbK7NmU0ZDXuwJ7rB
 VqFJIT9pG/SLzeq4ycqCIGHZp1zBmqr3jLUQ5O/Gr86RJuMzCN0ogx4ix A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="269523377"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="269523377"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="655773772"
Received: from unknown (HELO hades.ger.corp.intel.com) ([10.252.55.53])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:05:37 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/i915: Check for integer truncation on the
 configuration of ttm place
Date: Tue, 19 Jul 2022 17:04:21 +0300
Message-Id: <20220719140424.430572-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
References: <20220719140424.430572-1-gwan-gyeong.mun@intel.com>
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
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
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

v3: Not to change execution inside a macro. (Mauro)
    Add safe_conversion_gem_bug_on() macro and remove temporal
    SAFE_CONVERSION() macro.

v4: Fix unhandled GEM_BUG_ON() macro call from safe_conversion_gem_bug_on()

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
 drivers/gpu/drm/i915/i915_gem.h         |  4 ++++
 drivers/gpu/drm/i915/intel_region_ttm.c | 20 +++++++++++++++++---
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 9f2be1892b6c..88f2887627dc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -140,14 +140,14 @@ i915_ttm_place_from_region(const struct intel_memory_region *mr,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place->flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place->fpfn = offset >> PAGE_SHIFT;
-		place->lpfn = place->fpfn + (size >> PAGE_SHIFT);
+		safe_conversion_gem_bug_on(&place->fpfn, offset >> PAGE_SHIFT);
+		safe_conversion_gem_bug_on(&place->lpfn, place->fpfn + (size >> PAGE_SHIFT));
 	} else if (mr->io_size && mr->io_size < mr->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place->flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place->fpfn = 0;
-			place->lpfn = mr->io_size >> PAGE_SHIFT;
+			safe_conversion_gem_bug_on(&place->lpfn, mr->io_size >> PAGE_SHIFT);
 		}
 	}
 }
diff --git a/drivers/gpu/drm/i915/i915_gem.h b/drivers/gpu/drm/i915/i915_gem.h
index 68d8d52bd541..327dacedd5d1 100644
--- a/drivers/gpu/drm/i915/i915_gem.h
+++ b/drivers/gpu/drm/i915/i915_gem.h
@@ -83,5 +83,9 @@ struct drm_i915_private;
 #endif
 
 #define I915_GEM_IDLE_TIMEOUT (HZ / 5)
+#define safe_conversion_gem_bug_on(ptr, value) !({ \
+	safe_conversion(ptr, value) ? 0 \
+		: (({ GEM_BUG_ON(overflows_type(value, *ptr)); }), 1); \
+})
 
 #endif /* __I915_GEM_H__ */
diff --git a/drivers/gpu/drm/i915/intel_region_ttm.c b/drivers/gpu/drm/i915/intel_region_ttm.c
index 575d67bc6ffe..f0d143948725 100644
--- a/drivers/gpu/drm/i915/intel_region_ttm.c
+++ b/drivers/gpu/drm/i915/intel_region_ttm.c
@@ -209,14 +209,26 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	if (flags & I915_BO_ALLOC_CONTIGUOUS)
 		place.flags |= TTM_PL_FLAG_CONTIGUOUS;
 	if (offset != I915_BO_INVALID_OFFSET) {
-		place.fpfn = offset >> PAGE_SHIFT;
-		place.lpfn = place.fpfn + (size >> PAGE_SHIFT);
+		if (!safe_conversion_gem_bug_on(&place.fpfn,
+						offset >> PAGE_SHIFT)) {
+			ret = -E2BIG;
+			goto out;
+		}
+		if (!safe_conversion_gem_bug_on(&place.lpfn,
+						place.fpfn + (size >> PAGE_SHIFT))) {
+			ret = -E2BIG;
+			goto out;
+		}
 	} else if (mem->io_size && mem->io_size < mem->total) {
 		if (flags & I915_BO_ALLOC_GPU_ONLY) {
 			place.flags |= TTM_PL_FLAG_TOPDOWN;
 		} else {
 			place.fpfn = 0;
-			place.lpfn = mem->io_size >> PAGE_SHIFT;
+			if (!safe_conversion_gem_bug_on(&place.lpfn,
+							mem->io_size >> PAGE_SHIFT)) {
+				ret = -E2BIG;
+				goto out;
+			}
 		}
 	}
 
@@ -224,6 +236,8 @@ intel_region_ttm_resource_alloc(struct intel_memory_region *mem,
 	mock_bo.bdev = &mem->i915->bdev;
 
 	ret = man->func->alloc(man, &mock_bo, &place, &res);
+
+out:
 	if (ret == -ENOSPC)
 		ret = -ENXIO;
 	if (!ret)
-- 
2.34.1

