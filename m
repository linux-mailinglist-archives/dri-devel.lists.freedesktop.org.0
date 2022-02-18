Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C54BBFE8
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FAAA10E954;
	Fri, 18 Feb 2022 18:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 617ED10E862;
 Fri, 18 Feb 2022 18:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210082; x=1676746082;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cMX+v9LBjXGksbfLw0LbeVC5ne2Nz9FNpGhCT7RWb5k=;
 b=CDuy/hjzWt/eKW2ZWDmyE6W0IsUAaYIxhz/A+7Z8CbzuxuG3dbGm4/hb
 T5z4c52ydy+JIPpQx/dMWjgMJJch2S0lNL3cFvOklzAlDAxACd4v2cqIO
 zIGS9TH6kWfJ5tbo5hXsrOE8GSDW+RbCONogW/JCIhrl+oy5jQ41uz5lE
 DiiYx38m07NibRbqi/woINMm1L1OUUMqsCKnXqx7rkWKbNWeM7MID2ylw
 aIu7IwA9O4INDZZtSW9xxyiRGa9H0Uil0QjAXLqWm9OB5MHCo4Ix4VeSj
 Rvh14Ujz8qmh9lFnqphQczL162vU9BoRMz5OoQvvXn2OFNRQ4aZIMTi31 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238592991"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238592991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642238"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:47:59 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/15] drm/i915: add gtt misalignment test
Date: Sat, 19 Feb 2022 00:17:45 +0530
Message-Id: <20220218184752.7524-9-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 kernel test robot <lkp@intel.com>, lucas.demarchi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Beckett <bob.beckett@collabora.com>

add test to check handling of misaligned offsets and sizes

v4:
	* remove spurious blank lines
	* explicitly cast intel_region_id to intel_memory_type in misaligned_pin
Reported-by: kernel test robot <lkp@intel.com>
v6:
	* use NEEDS_COMPACT_PT instead of hard coding for DG2
v7:
	* use i915_vma_unbind_unlocked in misalignment test
v8:
	* handle stolen smem region returning -ENODEV due to
	  uninitialized on some setups
	* avoid trying to test bad alignments on single page hole regions

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 0d80509ef3c4..cc814abb0105 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -26,10 +26,12 @@
 #include <linux/prime_numbers.h>
 
 #include "gem/i915_gem_context.h"
+#include "gem/i915_gem_region.h"
 #include "gem/i915_gem_internal.h"
 #include "gem/selftests/mock_context.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gpu_commands.h"
+#include "gt/intel_gtt.h"
 
 #include "i915_random.h"
 #include "i915_selftest.h"
@@ -1068,6 +1070,118 @@ static int shrink_boom(struct i915_address_space *vm,
 	return err;
 }
 
+static int misaligned_case(struct i915_address_space *vm, struct intel_memory_region *mr,
+			   u64 addr, u64 size, unsigned long flags)
+{
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	int err = 0;
+	u64 expected_vma_size, expected_node_size;
+	bool is_stolen = mr->type == INTEL_MEMORY_STOLEN_SYSTEM ||
+			 mr->type == INTEL_MEMORY_STOLEN_LOCAL;
+
+	obj = i915_gem_object_create_region(mr, size, 0, 0);
+	if (IS_ERR(obj)) {
+		/* if iGVT-g or DMAR is active, stolen mem will be uninitialized */
+		if (PTR_ERR(obj) == -ENODEV && is_stolen)
+			return 0;
+		return PTR_ERR(obj);
+	}
+
+	vma = i915_vma_instance(obj, vm, NULL);
+	if (IS_ERR(vma)) {
+		err = PTR_ERR(vma);
+		goto err_put;
+	}
+
+	err = i915_vma_pin(vma, 0, 0, addr | flags);
+	if (err)
+		goto err_put;
+	i915_vma_unpin(vma);
+
+	if (!drm_mm_node_allocated(&vma->node)) {
+		err = -EINVAL;
+		goto err_put;
+	}
+
+	if (i915_vma_misplaced(vma, 0, 0, addr | flags)) {
+		err = -EINVAL;
+		goto err_put;
+	}
+
+	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
+	expected_node_size = expected_vma_size;
+
+	if (NEEDS_COMPACT_PT(vm->i915) && i915_gem_object_is_lmem(obj)) {
+		/* compact-pt should expand lmem node to 2MB */
+		expected_vma_size = round_up(size, I915_GTT_PAGE_SIZE_64K);
+		expected_node_size = round_up(size, I915_GTT_PAGE_SIZE_2M);
+	}
+
+	if (vma->size != expected_vma_size || vma->node.size != expected_node_size) {
+		err = i915_vma_unbind_unlocked(vma);
+		err = -EBADSLT;
+		goto err_put;
+	}
+
+	err = i915_vma_unbind_unlocked(vma);
+	if (err)
+		goto err_put;
+
+	GEM_BUG_ON(drm_mm_node_allocated(&vma->node));
+
+err_put:
+	i915_gem_object_put(obj);
+	cleanup_freed_objects(vm->i915);
+	return err;
+}
+
+static int misaligned_pin(struct i915_address_space *vm,
+			  u64 hole_start, u64 hole_end,
+			  unsigned long end_time)
+{
+	struct intel_memory_region *mr;
+	enum intel_region_id id;
+	unsigned long flags = PIN_OFFSET_FIXED | PIN_USER;
+	int err = 0;
+	u64 hole_size = hole_end - hole_start;
+
+	if (i915_is_ggtt(vm))
+		flags |= PIN_GLOBAL;
+
+	for_each_memory_region(mr, vm->i915, id) {
+		u64 min_alignment = i915_vm_min_alignment(vm, (enum intel_memory_type)id);
+		u64 size = min_alignment;
+		u64 addr = round_down(hole_start + (hole_size / 2), min_alignment);
+
+		/* avoid -ENOSPC on very small hole setups */
+		if (hole_size < 3 * min_alignment)
+			continue;
+
+		/* we can't test < 4k alignment due to flags being encoded in lower bits */
+		if (min_alignment != I915_GTT_PAGE_SIZE_4K) {
+			err = misaligned_case(vm, mr, addr + (min_alignment / 2), size, flags);
+			/* misaligned should error with -EINVAL*/
+			if (!err)
+				err = -EBADSLT;
+			if (err != -EINVAL)
+				return err;
+		}
+
+		/* test for vma->size expansion to min page size */
+		err = misaligned_case(vm, mr, addr, PAGE_SIZE, flags);
+		if (err)
+			return err;
+
+		/* test for intermediate size not expanding vma->size for large alignments */
+		err = misaligned_case(vm, mr, addr, size / 2, flags);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int exercise_ppgtt(struct drm_i915_private *dev_priv,
 			  int (*func)(struct i915_address_space *vm,
 				      u64 hole_start, u64 hole_end,
@@ -1137,6 +1251,11 @@ static int igt_ppgtt_shrink_boom(void *arg)
 	return exercise_ppgtt(arg, shrink_boom);
 }
 
+static int igt_ppgtt_misaligned_pin(void *arg)
+{
+	return exercise_ppgtt(arg, misaligned_pin);
+}
+
 static int sort_holes(void *priv, const struct list_head *A,
 		      const struct list_head *B)
 {
@@ -1209,6 +1328,11 @@ static int igt_ggtt_lowlevel(void *arg)
 	return exercise_ggtt(arg, lowlevel_hole);
 }
 
+static int igt_ggtt_misaligned_pin(void *arg)
+{
+	return exercise_ggtt(arg, misaligned_pin);
+}
+
 static int igt_ggtt_page(void *arg)
 {
 	const unsigned int count = PAGE_SIZE/sizeof(u32);
@@ -2181,12 +2305,14 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
 		SUBTEST(igt_ppgtt_fill),
 		SUBTEST(igt_ppgtt_shrink),
 		SUBTEST(igt_ppgtt_shrink_boom),
+		SUBTEST(igt_ppgtt_misaligned_pin),
 		SUBTEST(igt_ggtt_lowlevel),
 		SUBTEST(igt_ggtt_drunk),
 		SUBTEST(igt_ggtt_walk),
 		SUBTEST(igt_ggtt_pot),
 		SUBTEST(igt_ggtt_fill),
 		SUBTEST(igt_ggtt_page),
+		SUBTEST(igt_ggtt_misaligned_pin),
 		SUBTEST(igt_cs_tlb),
 	};
 
-- 
2.20.1

