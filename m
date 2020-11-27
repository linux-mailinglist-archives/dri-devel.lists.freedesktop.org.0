Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC132C6575
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 446916ED7E;
	Fri, 27 Nov 2020 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98886ED7E;
 Fri, 27 Nov 2020 12:12:02 +0000 (UTC)
IronPort-SDR: 5EK3oSNyJEaUQpNknS6QNcsGn+kW5YQbuKLGXF5oUqjLmaAWQFKUcDDcVlyB/xQRt7kpn9gdu/
 mr/EYfM6tztA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092981"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092981"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:02 -0800
IronPort-SDR: cnviXRZT7QW76KiNtGmVjMgheffijRPcd7jlGatdzhEsTcreasxVCyI+6fDTYW6T2/mghfl9nX
 ybaWuuYrdwFw==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029964"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:12:00 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 142/162] drm/i915/gem/selftest: test and measure window
 based blt cpy
Date: Fri, 27 Nov 2020 12:06:58 +0000
Message-Id: <20201127120718.454037-143-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: CQ Tang <cq.tang@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ramalingam C <ramalingam.c@intel.com>

Selftest live_blt_evict is written to create an lmem and smem objects and
copy lmem into smem obj using the window based blt copy used for lmem
eviction.

And we test for range of object size from 4K to 64M with different
usecase scenario w.r.t to window size.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: CQ Tang <cq.tang@intel.com>
---
 .../i915/gem/selftests/i915_gem_object_blt.c  | 166 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 2 files changed, 167 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
index ee9496f3d11d..4f7941dea291 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_object_blt.c
@@ -16,6 +16,7 @@
 #include "selftests/mock_drm.h"
 #include "huge_gem_object.h"
 #include "mock_context.h"
+#include "gem/i915_gem_region.h"
 
 static int wrap_ktime_compare(const void *A, const void *B)
 {
@@ -568,6 +569,171 @@ static int igt_copy_blt_ctx0(void *arg)
 	return test_copy_engines(arg, igt_copy_blt_thread, SINGLE_CTX);
 }
 
+static int __igt_obj_window_blt_copy(struct drm_i915_private *i915,
+				     struct intel_memory_region *src_mem,
+				     struct intel_memory_region *dst_mem,
+				     u64 size)
+{
+	struct drm_i915_gem_object *src, *dst;
+	ktime_t t0, t1;
+	u32 *vaddr, i;
+	int err;
+
+	src = i915_gem_object_create_region(src_mem, size, 0);
+	if (IS_ERR(src)) {
+		err = PTR_ERR(src);
+		goto err;
+	}
+	size = max_t(u64, size, src->base.size);
+	i915_gem_object_lock_isolated(src);
+
+	dst = i915_gem_object_create_region(dst_mem, size, 0);
+	if (IS_ERR(dst)) {
+		err = PTR_ERR(dst);
+		goto err_put_src;
+	}
+
+	i915_gem_object_lock_isolated(dst);
+
+	vaddr = i915_gem_object_pin_map(src,
+					i915_coherent_map_type(i915, src, true));
+	if (IS_ERR(vaddr)) {
+		err = PTR_ERR(vaddr);
+		pr_err("Failed at pin map of src. %d\n", err);
+		goto err_put_dst;
+	}
+
+	for (i = 0; i < size / sizeof(u32); i++)
+		vaddr[i] = i;
+
+	if (!(src->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
+		src->cache_dirty = true;
+
+	vaddr = i915_gem_object_pin_map(dst,
+					i915_coherent_map_type(i915, dst, true));
+	if (IS_ERR(vaddr)) {
+		err = PTR_ERR(vaddr);
+		pr_err("Failed at pin map of dst. %d\n", err);
+		goto err_unpin_src;
+	}
+	memset32(vaddr, 0xdeadbeaf, size / sizeof(u32));
+
+	if (!(dst->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE))
+		dst->cache_dirty = true;
+
+	/*
+	 * FIXME: Blitter based eviction is failing occasionally due to
+	 * trylock approach. To avoid the selftest failure due to trylocks,
+	 * we are adding retries with a delay inn between.
+	 * Retry count and delay are fixed on trial and error basis.
+	 * As soon as trylocks are removed from blt eviction, we should
+	 * remove this retry attempts.
+	 */
+#define WINDOW_BLT_COPY_RETRY		3
+	for (i = 0; i <= WINDOW_BLT_COPY_RETRY; i++) {
+		t0 = ktime_get();
+		err = i915_window_blt_copy(dst, src);
+		if (err == -EBUSY)
+			msleep(1);
+		else
+			break;
+	}
+
+	if (err)
+		goto err_unpin_dst;
+
+	t1 = ktime_sub(ktime_get(), t0);
+	pr_info("blt of %zd KiB at %lld MiB/s\n", src->base.size >> 10,
+		div64_u64(mul_u32_u32(src->base.size, 1000 * 1000 * 1000),
+			  t1) >> 20);
+
+	for (i = 0; i < size / sizeof(u32); i += 17) {
+		if (!(dst->cache_coherent & I915_BO_CACHE_COHERENT_FOR_READ))
+			drm_clflush_virt_range(&vaddr[i], sizeof(vaddr[i]));
+
+		if (vaddr[i] != i) {
+			pr_err("vaddr[%u]=%x, expected=%x\n", i,
+			       vaddr[i], i);
+			err = -EINVAL;
+			goto err_unpin_dst;
+		}
+	}
+
+err_unpin_dst:
+	i915_gem_object_unpin_map(dst);
+err_unpin_src:
+	i915_gem_object_unpin_map(src);
+err_put_dst:
+	i915_gem_object_unlock(dst);
+	i915_gem_object_put(dst);
+err_put_src:
+	i915_gem_object_unlock(src);
+	i915_gem_object_put(src);
+err:
+	if (err == -ENODEV)
+		err = 0;
+	return err;
+}
+
+static int igt_obj_window_blt_copy(void *data)
+{
+	struct drm_i915_private *i915 = data;
+	u64 size[] = {SZ_2K, SZ_4K, SZ_64K, SZ_4M, SZ_8M + SZ_2K, SZ_64M};
+	struct intel_memory_region *lmem =
+		intel_memory_region_by_type(i915, INTEL_MEMORY_LOCAL);
+	struct intel_memory_region *smem =
+		intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(size); i++) {
+		ret =  __igt_obj_window_blt_copy(i915, lmem, lmem, size[i]);
+		if (ret < 0) {
+			pr_err("%s: Failed at lmem->lmem size: %llu, err: %d\n",
+			       __func__, size[i], ret);
+			break;
+		}
+		ret =  __igt_obj_window_blt_copy(i915, smem, smem, size[i]);
+		if (ret < 0) {
+			pr_err("%s: Failed at smem->smem size: %llu, err: %d\n",
+			       __func__, size[i], ret);
+			break;
+		}
+		ret =  __igt_obj_window_blt_copy(i915, lmem, smem, size[i]);
+		if (ret < 0) {
+			pr_err("%s: Failed at lmem->smem size: %llu, err: %d\n",
+			       __func__, size[i], ret);
+			break;
+		}
+
+		ret =  __igt_obj_window_blt_copy(i915, smem, lmem, size[i]);
+		if (ret < 0) {
+			pr_err("%s: Failed at smem->lmem size: %llu, err: %d\n",
+			       __func__, size[i], ret);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+int i915_obj_window_blt_copy_live_selftests(struct drm_i915_private *i915)
+{
+	static const struct i915_subtest tests[] = {
+		SUBTEST(igt_obj_window_blt_copy),
+	};
+
+	if (intel_gt_is_wedged(&i915->gt))
+		return 0;
+
+	if (!HAS_ENGINE(&i915->gt, BCS0))
+		return 0;
+
+	if (!HAS_LMEM(i915))
+		return 0;
+
+	return i915_live_subtests(tests, i915);
+}
+
 int i915_gem_object_blt_live_selftests(struct drm_i915_private *i915)
 {
 	static const struct i915_subtest tests[] = {
diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
index a92c0e9b7e6b..2bf900f5d8b0 100644
--- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
+++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
@@ -39,6 +39,7 @@ selftest(hugepages, i915_gem_huge_page_live_selftests)
 selftest(gem_contexts, i915_gem_context_live_selftests)
 selftest(gem_execbuf, i915_gem_execbuffer_live_selftests)
 selftest(blt, i915_gem_object_blt_live_selftests)
+selftest(win_blt_copy, i915_obj_window_blt_copy_live_selftests)
 selftest(client, i915_gem_client_blt_live_selftests)
 selftest(reset, intel_reset_live_selftests)
 selftest(memory_region, intel_memory_region_live_selftests)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
