Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D449CE0C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 16:23:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7EC10E947;
	Wed, 26 Jan 2022 15:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A649910E8F7;
 Wed, 26 Jan 2022 15:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643210537; x=1674746537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fGoXAGkOX5B/Z/5GTU53NVfnPNP5aLb1tzvKQOPT/hs=;
 b=E+5rBswNcYPqumUAdPZccCI3yHcowMNev9KyLRONyHfAFHVzQwhV+qqP
 f+pkpXd5npW9eEZ7r8wBCXSxmA1aDLnqppW6NIk32rpWGmlNBQ8MaeeFI
 62tVi+tKIFStmYHyUt2TMX/B8o5+B7Z+Zf0L4GKHO6wNW4yGvRtMqxDAV
 ngTXi6PFZsVgw+u2HbSBB6UF3pvw5MqFHVvWxT33wUapm2+dc+gDhIVdz
 eCZ4J3PgGN7Om5bCQMf9NPOXzGIWdfGxCUUNF9MgR2hnM72m59TtCtf7T
 hiKNjHF2V6u7lGWlT5GRMRNo8cU+G04v+swXXeF/cNGq5WUbj2H+pZ7FE g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309885237"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="309885237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; d="scan'208";a="674386270"
Received: from jamesstx-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.213.247.182])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 07:22:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/20] drm/i915/selftests: mock test io_size
Date: Wed, 26 Jan 2022 15:21:45 +0000
Message-Id: <20220126152155.3070602-11-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126152155.3070602-1-matthew.auld@intel.com>
References: <20220126152155.3070602-1-matthew.auld@intel.com>
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

Check that mappable vs non-mappable matches our expectations.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 .../drm/i915/selftests/intel_memory_region.c  | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/intel_memory_region.c b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
index 247f65f02bbf..04ae29779206 100644
--- a/drivers/gpu/drm/i915/selftests/intel_memory_region.c
+++ b/drivers/gpu/drm/i915/selftests/intel_memory_region.c
@@ -17,6 +17,7 @@
 #include "gem/i915_gem_context.h"
 #include "gem/i915_gem_lmem.h"
 #include "gem/i915_gem_region.h"
+#include "gem/i915_gem_ttm.h"
 #include "gem/selftests/igt_gem_utils.h"
 #include "gem/selftests/mock_context.h"
 #include "gt/intel_engine_pm.h"
@@ -512,6 +513,147 @@ static int igt_mock_max_segment(void *arg)
 	return err;
 }
 
+static u64 igt_object_mappable_total(struct drm_i915_gem_object *obj)
+{
+	struct intel_memory_region *mr = obj->mm.region;
+	struct i915_ttm_buddy_resource *bman_res =
+		to_ttm_buddy_resource(obj->mm.res);
+	struct drm_buddy *mm = bman_res->mm;
+	struct drm_buddy_block *block;
+	u64 total;
+
+	total = 0;
+	list_for_each_entry(block, &bman_res->blocks, link) {
+		u64 start = drm_buddy_block_offset(block);
+		u64 end = start + drm_buddy_block_size(mm, block);
+
+		if (start < mr->io_size)
+			total += min_t(u64, end, mr->io_size) - start;
+	}
+
+	return total;
+}
+
+static int igt_mock_io_size(void *arg)
+{
+	struct intel_memory_region *mr = arg;
+	struct drm_i915_private *i915 = mr->i915;
+	struct drm_i915_gem_object *obj;
+	u64 mappable_theft_total;
+	u64 io_size;
+	u64 total;
+	u64 ps;
+	u64 rem;
+	u64 size;
+	I915_RND_STATE(prng);
+	LIST_HEAD(objects);
+	int err = 0;
+
+	ps = SZ_4K;
+	if (i915_prandom_u64_state(&prng) & 1)
+		ps = SZ_64K; /* For something like DG2 */
+
+	div64_u64_rem(i915_prandom_u64_state(&prng), SZ_8G, &total);
+	total = round_down(total, ps);
+	total = max_t(u64, total, SZ_1G);
+
+	div64_u64_rem(i915_prandom_u64_state(&prng), total - ps, &io_size);
+	io_size = round_down(io_size, ps);
+	io_size = max_t(u64, io_size, SZ_256M); /* 256M seems to be the common lower limit */
+
+	pr_info("%s with ps=%llx, io_size=%llx, total=%llx\n",
+		__func__, ps, io_size, total);
+
+	mr = mock_region_create(i915, 0, total, ps, 0, io_size);
+	if (IS_ERR(mr)) {
+		err = PTR_ERR(mr);
+		goto out_err;
+	}
+
+	mappable_theft_total = 0;
+	rem = total - io_size;
+	do {
+		div64_u64_rem(i915_prandom_u64_state(&prng), rem, &size);
+		size = round_down(size, ps);
+		size = max(size, ps);
+
+		obj = igt_object_create(mr, &objects, size,
+					I915_BO_ALLOC_TOPDOWN);
+		if (IS_ERR(obj)) {
+			pr_err("%s TOPDOWN failed with rem=%llx, size=%llx\n",
+			       __func__, rem, size);
+			err = PTR_ERR(obj);
+			goto out_close;
+		}
+
+		mappable_theft_total += igt_object_mappable_total(obj);
+		rem -= size;
+	} while (rem);
+
+	pr_info("%s mappable theft=(%lluMiB/%lluMiB), total=%lluMiB\n",
+		__func__,
+		(u64)mappable_theft_total >> 20,
+		(u64)io_size >> 20,
+		(u64)total >> 20);
+
+	/*
+	 * Even if we allocate all of the non-mappable portion, we should still
+	 * be able to dip into the mappable portion.
+	 */
+	obj = igt_object_create(mr, &objects, io_size,
+				I915_BO_ALLOC_TOPDOWN);
+	if (IS_ERR(obj)) {
+		pr_err("%s allocation unexpectedly failed\n", __func__);
+		err = PTR_ERR(obj);
+		goto out_close;
+	}
+
+	close_objects(mr, &objects);
+
+	rem = io_size;
+	do {
+		div64_u64_rem(i915_prandom_u64_state(&prng), rem, &size);
+		size = round_down(size, ps);
+		size = max(size, ps);
+
+		obj = igt_object_create(mr, &objects, size, 0);
+		if (IS_ERR(obj)) {
+			pr_err("%s MAPPABLE failed with rem=%llx, size=%llx\n",
+			       __func__, rem, size);
+			err = PTR_ERR(obj);
+			goto out_close;
+		}
+
+		if (igt_object_mappable_total(obj) != size) {
+			pr_err("%s allocation is not mappable(size=%llx)\n",
+			       __func__, size);
+			err = -EINVAL;
+			goto out_close;
+		}
+		rem -= size;
+	} while (rem);
+
+	/*
+	 * We assume CPU access is required by default, which should result in a
+	 * failure here, even though the non-mappable portion is free.
+	 */
+	obj = igt_object_create(mr, &objects, ps, 0);
+	if (!IS_ERR(obj)) {
+		pr_err("%s allocation unexpectedly succeeded\n", __func__);
+		err = -EINVAL;
+		goto out_close;
+	}
+
+out_close:
+	close_objects(mr, &objects);
+	intel_memory_region_destroy(mr);
+out_err:
+	if (err == -ENOMEM)
+		err = 0;
+
+	return err;
+}
+
 static int igt_gpu_write_dw(struct intel_context *ce,
 			    struct i915_vma *vma,
 			    u32 dword,
@@ -1179,6 +1321,7 @@ int intel_memory_region_mock_selftests(void)
 		SUBTEST(igt_mock_contiguous),
 		SUBTEST(igt_mock_splintered_region),
 		SUBTEST(igt_mock_max_segment),
+		SUBTEST(igt_mock_io_size),
 	};
 	struct intel_memory_region *mem;
 	struct drm_i915_private *i915;
-- 
2.34.1

