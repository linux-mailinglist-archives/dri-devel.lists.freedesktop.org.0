Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D913A0C8A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:35:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67076E32F;
	Wed,  9 Jun 2021 06:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3C96E20A;
 Wed,  9 Jun 2021 06:35:06 +0000 (UTC)
IronPort-SDR: Ul+5cTeWwV2D7MPbLNKkJK8t/2r49hXRmlhRIBKpcX4yfQjuojEfov4asdalpQmPdl6SeRiO5/
 ITvNGzpMMiTg==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="268868941"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="268868941"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:35:06 -0700
IronPort-SDR: sinJWIkdSEImn2u1YtVlHCsh4exKC/M318FtZ3cqNj/z+JWw7P5HUAgO+51OpwIw6XkbyXiHnM
 00cHzeOfmDgg==
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="482265865"
Received: from ekolpasx-mobl.ccr.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.109])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 23:35:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 9/9] drm/i915/gt: Setup a default migration context on the
 GT
Date: Wed,  9 Jun 2021 08:34:36 +0200
Message-Id: <20210609063436.284332-10-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
References: <20210609063436.284332-1-thomas.hellstrom@linux.intel.com>
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
 matthew.auld@intel.com, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Set up a default migration context on the GT and use it from the
selftests.
Add a perf selftest and make sure we exercise LMEM if available.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c            |   4 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/gt/intel_migrate.c       |   4 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    | 227 +++++++++++++++++-
 .../drm/i915/selftests/i915_perf_selftests.h  |   1 +
 5 files changed, 232 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 2161bf01ef8b..67ef057ae918 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -13,6 +13,7 @@
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_pm.h"
 #include "intel_gt_requests.h"
+#include "intel_migrate.h"
 #include "intel_mocs.h"
 #include "intel_rc6.h"
 #include "intel_renderstate.h"
@@ -626,6 +627,8 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		goto err_gt;
 
+	intel_migrate_init(&gt->migrate, gt);
+
 	goto out_fw;
 err_gt:
 	__intel_gt_disable(gt);
@@ -649,6 +652,7 @@ void intel_gt_driver_remove(struct intel_gt *gt)
 {
 	__intel_gt_disable(gt);
 
+	intel_migrate_fini(&gt->migrate);
 	intel_uc_driver_remove(&gt->uc);
 
 	intel_engines_release(gt);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index fecfacf551d5..7450935f2ca8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -24,6 +24,7 @@
 #include "intel_reset_types.h"
 #include "intel_rc6_types.h"
 #include "intel_rps_types.h"
+#include "intel_migrate_types.h"
 #include "intel_wakeref.h"
 
 struct drm_i915_private;
@@ -145,6 +146,8 @@ struct intel_gt {
 
 	struct i915_vma *scratch;
 
+	struct intel_migrate migrate;
+
 	struct intel_gt_info {
 		intel_engine_mask_t engine_mask;
 		u8 num_engines;
diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
index fda05ce3eb9c..935b5f14ff21 100644
--- a/drivers/gpu/drm/i915/gt/intel_migrate.c
+++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
@@ -418,10 +418,9 @@ intel_context_migrate_copy(struct intel_context *ce,
 	struct i915_request *rq;
 	int err;
 
+	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
 	*out = NULL;
 
-	/* GEM_BUG_ON(ce->vm != migrate_vm); */
-
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
 
 	do {
@@ -536,6 +535,7 @@ intel_context_migrate_clear(struct intel_context *ce,
 	struct i915_request *rq;
 	int err;
 
+	GEM_BUG_ON(ce->vm != ce->engine->gt->migrate.context->vm);
 	*out = NULL;
 
 	GEM_BUG_ON(ce->ring->size < SZ_64K);
diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 159c8656e1b0..396c81364399 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -3,6 +3,8 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include <linux/sort.h>
+
 #include "selftests/i915_random.h"
 
 static const unsigned int sizes[] = {
@@ -441,14 +443,229 @@ int intel_migrate_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(thread_global_copy),
 		SUBTEST(thread_global_clear),
 	};
-	struct intel_migrate m;
+	struct intel_gt *gt = &i915->gt;
+
+	if (!gt->migrate.context)
+		return 0;
+
+	return i915_subtests(tests, &gt->migrate);
+}
+
+static struct drm_i915_gem_object *
+create_init_lmem_internal(struct intel_gt *gt, size_t sz, bool try_lmem)
+{
+	struct drm_i915_gem_object *obj = NULL;
 	int err;
 
-	if (intel_migrate_init(&m, &i915->gt))
+	if (try_lmem && HAS_LMEM(gt->i915))
+		obj = i915_gem_object_create_lmem(gt->i915, sz, 0);
+
+	if (IS_ERR_OR_NULL(obj)) {
+		obj = i915_gem_object_create_internal(gt->i915, sz);
+		if (IS_ERR(obj))
+			return obj;
+	}
+
+	i915_gem_object_trylock(obj);
+	err = i915_gem_object_pin_pages(obj);
+	if (err) {
+		i915_gem_object_unlock(obj);
+		i915_gem_object_put(obj);
+		return ERR_PTR(err);
+	}
+
+	return obj;
+}
+
+static int wrap_ktime_compare(const void *A, const void *B)
+{
+	const ktime_t *a = A, *b = B;
+
+	return ktime_compare(*a, *b);
+}
+
+static int __perf_clear_blt(struct intel_context *ce,
+			    struct scatterlist *sg,
+			    enum i915_cache_level cache_level,
+			    bool is_lmem,
+			    size_t sz)
+{
+	ktime_t t[5];
+	int pass;
+	int err = 0;
+
+	for (pass = 0; pass < ARRAY_SIZE(t); pass++) {
+		struct i915_request *rq;
+		ktime_t t0, t1;
+
+		t0 = ktime_get();
+
+		err = intel_context_migrate_clear(ce, NULL, sg, cache_level,
+						  is_lmem, 0, &rq);
+		if (rq) {
+			if (i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT) < 0)
+				err = -EIO;
+			i915_request_put(rq);
+		}
+		if (err)
+			break;
+
+		t1 = ktime_get();
+		t[pass] = ktime_sub(t1, t0);
+	}
+	if (err)
+		return err;
+
+	sort(t, ARRAY_SIZE(t), sizeof(*t), wrap_ktime_compare, NULL);
+	pr_info("%s: %zd KiB fill: %lld MiB/s\n",
+		ce->engine->name, sz >> 10,
+		div64_u64(mul_u32_u32(4 * sz,
+				      1000 * 1000 * 1000),
+			  t[1] + 2 * t[2] + t[3]) >> 20);
+	return 0;
+}
+
+static int perf_clear_blt(void *arg)
+{
+	struct intel_gt *gt = arg;
+	static const unsigned long sizes[] = {
+		SZ_4K,
+		SZ_64K,
+		SZ_2M,
+		SZ_64M
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
+		struct drm_i915_gem_object *dst;
+		int err;
+
+		dst = create_init_lmem_internal(gt, sizes[i], true);
+		if (IS_ERR(dst))
+			return PTR_ERR(dst);
+
+		err = __perf_clear_blt(gt->migrate.context,
+				       dst->mm.pages->sgl,
+				       I915_CACHE_NONE,
+				       i915_gem_object_is_lmem(dst),
+				       sizes[i]);
+
+		i915_gem_object_unlock(dst);
+		i915_gem_object_put(dst);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int __perf_copy_blt(struct intel_context *ce,
+			   struct scatterlist *src,
+			   enum i915_cache_level src_cache_level,
+			   bool src_is_lmem,
+			   struct scatterlist *dst,
+			   enum i915_cache_level dst_cache_level,
+			   bool dst_is_lmem,
+			   size_t sz)
+{
+	ktime_t t[5];
+	int pass;
+	int err = 0;
+
+	for (pass = 0; pass < ARRAY_SIZE(t); pass++) {
+		struct i915_request *rq;
+		ktime_t t0, t1;
+
+		t0 = ktime_get();
+
+		err = intel_context_migrate_copy(ce, NULL,
+						 src, src_cache_level,
+						 src_is_lmem,
+						 dst, dst_cache_level,
+						 dst_is_lmem,
+						 &rq);
+		if (rq) {
+			if (i915_request_wait(rq, 0, MAX_SCHEDULE_TIMEOUT) < 0)
+				err = -EIO;
+			i915_request_put(rq);
+		}
+		if (err)
+			break;
+
+		t1 = ktime_get();
+		t[pass] = ktime_sub(t1, t0);
+	}
+	if (err)
+		return err;
+
+	sort(t, ARRAY_SIZE(t), sizeof(*t), wrap_ktime_compare, NULL);
+	pr_info("%s: %zd KiB copy: %lld MiB/s\n",
+		ce->engine->name, sz >> 10,
+		div64_u64(mul_u32_u32(4 * sz,
+				      1000 * 1000 * 1000),
+			  t[1] + 2 * t[2] + t[3]) >> 20);
+	return 0;
+}
+
+static int perf_copy_blt(void *arg)
+{
+	struct intel_gt *gt = arg;
+	static const unsigned long sizes[] = {
+		SZ_4K,
+		SZ_64K,
+		SZ_2M,
+		SZ_64M
+	};
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(sizes); i++) {
+		struct drm_i915_gem_object *src, *dst;
+		int err;
+
+		src = create_init_lmem_internal(gt, sizes[i], true);
+		if (IS_ERR(src))
+			return PTR_ERR(src);
+
+		dst = create_init_lmem_internal(gt, sizes[i], false);
+		if (IS_ERR(dst)) {
+			err = PTR_ERR(dst);
+			goto err_src;
+		}
+
+		err = __perf_copy_blt(gt->migrate.context,
+				      src->mm.pages->sgl,
+				      I915_CACHE_NONE,
+				      i915_gem_object_is_lmem(src),
+				      dst->mm.pages->sgl,
+				      I915_CACHE_NONE,
+				      i915_gem_object_is_lmem(dst),
+				      sizes[i]);
+
+		i915_gem_object_unlock(dst);
+		i915_gem_object_put(dst);
+err_src:
+		i915_gem_object_unlock(src);
+		i915_gem_object_put(src);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+int intel_migrate_perf_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(perf_clear_blt),
+		SUBTEST(perf_copy_blt),
+	};
+	struct intel_gt *gt = &i915->gt;
+
+	if (intel_gt_is_wedged(gt))
 		return 0;
 
-	err = i915_subtests(tests, &m);
-	intel_migrate_fini(&m);
+	if (!gt->migrate.context)
+		return 0;
 
-	return err;
+	return intel_gt_live_subtests(tests, gt);
 }
diff --git a/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h b/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
index c2389f8a257d..5077dc3c3b8c 100644
--- a/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_perf_selftests.h
@@ -17,5 +17,6 @@
  */
 selftest(engine_cs, intel_engine_cs_perf_selftests)
 selftest(request, i915_request_perf_selftests)
+selftest(migrate, intel_migrate_perf_selftests)
 selftest(blt, i915_gem_object_blt_perf_selftests)
 selftest(region, intel_memory_region_perf_selftests)
-- 
2.31.1

