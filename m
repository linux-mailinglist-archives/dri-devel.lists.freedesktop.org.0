Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D473919BB
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 163556ED83;
	Wed, 26 May 2021 14:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1B66ED24;
 Wed, 26 May 2021 14:15:39 +0000 (UTC)
IronPort-SDR: jyvPV4P17xf4QrNSGzxd4VikZkmCjxPiyT61hZI/tPxcHHwLH3iJRgmS4QGFt1HwOtKBtbZLvR
 wvTyxDgvpqGg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660645"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660645"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:19 -0700
IronPort-SDR: wHKZMBD5249cYVXQLlB70dgZHXaVSIUL6GMMrutZu7/AmpwQDHUkaQiXrJ9aB2NiHaLbeuOeEI
 c1rvxAau2fhA==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206418"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/12] drm/i915/selftests: Replace unbound set-domain waits
 with explicit timeouts
Date: Wed, 26 May 2021 15:14:53 +0100
Message-Id: <20210526141456.2334192-10-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Let's prefer to use explicit request tracking and bounded timeouts in
our selftests.

v2 (Tvrtko):
 * Rebase.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com> # v1
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 .../gpu/drm/i915/gt/selftest_workarounds.c    | 107 +++++++-----------
 1 file changed, 40 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
index 64937ec3f2dc..72553a56b225 100644
--- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
@@ -93,56 +93,27 @@ reference_lists_fini(struct intel_gt *gt, struct wa_lists *lists)
 	intel_wa_list_free(&lists->gt_wa_list);
 }
 
-static struct drm_i915_gem_object *
-read_nonprivs(struct intel_context *ce)
+static struct i915_request *
+read_nonprivs(struct intel_context *ce, struct i915_vma *result)
 {
 	struct intel_engine_cs *engine = ce->engine;
 	const u32 base = engine->mmio_base;
-	struct drm_i915_gem_object *result;
 	struct i915_request *rq;
-	struct i915_vma *vma;
 	u32 srm, *cs;
 	int err;
 	int i;
 
-	result = i915_gem_object_create_internal(engine->i915, PAGE_SIZE);
-	if (IS_ERR(result))
-		return result;
-
-	i915_gem_object_set_cache_coherency(result, I915_CACHE_LLC);
-
-	cs = i915_gem_object_pin_map_unlocked(result, I915_MAP_WB);
-	if (IS_ERR(cs)) {
-		err = PTR_ERR(cs);
-		goto err_obj;
-	}
-	memset(cs, 0xc5, PAGE_SIZE);
-	i915_gem_object_flush_map(result);
-	i915_gem_object_unpin_map(result);
-
-	vma = i915_vma_instance(result, &engine->gt->ggtt->vm, NULL);
-	if (IS_ERR(vma)) {
-		err = PTR_ERR(vma);
-		goto err_obj;
-	}
-
-	err = i915_vma_pin(vma, 0, 0, PIN_GLOBAL);
-	if (err)
-		goto err_obj;
-
 	rq = intel_context_create_request(ce);
-	if (IS_ERR(rq)) {
-		err = PTR_ERR(rq);
-		goto err_pin;
-	}
+	if (IS_ERR(rq))
+		return rq;
 
-	i915_vma_lock(vma);
-	err = i915_request_await_object(rq, vma->obj, true);
+	i915_vma_lock(result);
+	err = i915_request_await_object(rq, result->obj, true);
 	if (err == 0)
-		err = i915_vma_move_to_active(vma, rq, EXEC_OBJECT_WRITE);
-	i915_vma_unlock(vma);
+		err = i915_vma_move_to_active(result, rq, EXEC_OBJECT_WRITE);
+	i915_vma_unlock(result);
 	if (err)
-		goto err_req;
+		goto err_rq;
 
 	srm = MI_STORE_REGISTER_MEM | MI_SRM_LRM_GLOBAL_GTT;
 	if (INTEL_GEN(engine->i915) >= 8)
@@ -151,28 +122,24 @@ read_nonprivs(struct intel_context *ce)
 	cs = intel_ring_begin(rq, 4 * RING_MAX_NONPRIV_SLOTS);
 	if (IS_ERR(cs)) {
 		err = PTR_ERR(cs);
-		goto err_req;
+		goto err_rq;
 	}
 
 	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++) {
 		*cs++ = srm;
 		*cs++ = i915_mmio_reg_offset(RING_FORCE_TO_NONPRIV(base, i));
-		*cs++ = i915_ggtt_offset(vma) + sizeof(u32) * i;
+		*cs++ = i915_ggtt_offset(result) + sizeof(u32) * i;
 		*cs++ = 0;
 	}
 	intel_ring_advance(rq, cs);
 
+	i915_request_get(rq);
 	i915_request_add(rq);
-	i915_vma_unpin(vma);
 
-	return result;
+	return rq;
 
-err_req:
+err_rq:
 	i915_request_add(rq);
-err_pin:
-	i915_vma_unpin(vma);
-err_obj:
-	i915_gem_object_put(result);
 	return ERR_PTR(err);
 }
 
@@ -203,32 +170,36 @@ print_results(const struct intel_engine_cs *engine, const u32 *results)
 static int check_whitelist(struct intel_context *ce)
 {
 	struct intel_engine_cs *engine = ce->engine;
-	struct drm_i915_gem_object *results;
-	struct intel_wedge_me wedge;
+	struct i915_vma *result;
+	struct i915_request *rq;
+	int err = 0;
 	u32 *vaddr;
-	int err;
 	int i;
 
-	results = read_nonprivs(ce);
-	if (IS_ERR(results))
-		return PTR_ERR(results);
-
-	err = 0;
-	i915_gem_object_lock(results, NULL);
-	intel_wedge_on_timeout(&wedge, engine->gt, HZ / 5) /* safety net! */
-		err = i915_gem_object_set_to_cpu_domain(results, false);
-
-	if (intel_gt_is_wedged(engine->gt))
-		err = -EIO;
-	if (err)
-		goto out_put;
+	result = __vm_create_scratch_for_read(&engine->gt->ggtt->vm, PAGE_SIZE);
+	if (IS_ERR(result))
+		return PTR_ERR(result);
 
-	vaddr = i915_gem_object_pin_map(results, I915_MAP_WB);
+	vaddr = i915_gem_object_pin_map(result->obj, I915_MAP_WB);
 	if (IS_ERR(vaddr)) {
 		err = PTR_ERR(vaddr);
 		goto out_put;
 	}
 
+	memset(vaddr, 0xc5, PAGE_SIZE);
+	i915_gem_object_flush_map(result->obj);
+
+	rq = read_nonprivs(ce, result);
+	if (IS_ERR(rq)) {
+		err = PTR_ERR(rq);
+		goto out_map;
+	}
+
+	if (i915_request_wait(rq, 0, HZ / 5) < 0) {
+		err = -EIO;
+		goto out_rq;
+	}
+
 	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++) {
 		u32 expected = get_whitelist_reg(engine, i);
 		u32 actual = vaddr[i];
@@ -243,10 +214,12 @@ static int check_whitelist(struct intel_context *ce)
 		}
 	}
 
-	i915_gem_object_unpin_map(results);
+out_rq:
+	i915_request_put(rq);
+out_map:
+	i915_gem_object_unpin_map(result->obj);
 out_put:
-	i915_gem_object_unlock(results);
-	i915_gem_object_put(results);
+	i915_vma_put(result);
 	return err;
 }
 
-- 
2.30.2

