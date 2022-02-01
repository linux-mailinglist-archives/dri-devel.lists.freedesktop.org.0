Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888C4A5A3B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 11:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1348310E8D6;
	Tue,  1 Feb 2022 10:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0A510E8C6;
 Tue,  1 Feb 2022 10:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643712106; x=1675248106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3Bq83ol07S2VmM1AQatwXBKJPhC8dvgWchpaWbNmEp4=;
 b=Yw0to97FitBNtgKvxM4bQztLbYVDS74TkWYXrQQDRi9PMqaYJUH4w63b
 Od/bW82GlWYcuMK+sZexS4VIozsqWvFz7WTRhWIVh6oGWT9t7jKJH18EM
 uWo9ErEDVtlRB8B2haIwiEmjo8r0+wpbwbMfd2azFZhmy+CALC3UU2If2
 EjOIl2iOafFKXDtzHZ5rD2tljLmQuCskRER3/lxVjx/Sx/HW9Ngy9VVzD
 dCkIeg6z7Q9gSRr90EAaSFQ/Z+dQ1f+y3kptprnU1r/N3S2K1JQvVotKa
 E7cPfEGZKf6/WcL7xRJ7Ll3p7TJtOjd+9f6+6nSGy3pm2r/GuNkCBbkR+ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="334020554"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="334020554"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="523011131"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2022 02:41:39 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v5 04/19] drm/i915: add gtt misalignment test
Date: Tue,  1 Feb 2022 16:11:17 +0530
Message-Id: <20220201104132.3050-5-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220201104132.3050-1-ramalingam.c@intel.com>
References: <20220201104132.3050-1-ramalingam.c@intel.com>
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
 kernel test robot <lkp@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index b80788a2b7f9..c23b1e5cc436 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -22,10 +22,12 @@
  *
  */
 
+#include "gt/intel_gtt.h"
 #include <linux/list_sort.h>
 #include <linux/prime_numbers.h>
 
 #include "gem/i915_gem_context.h"
+#include "gem/i915_gem_region.h"
 #include "gem/selftests/mock_context.h"
 #include "gt/intel_context.h"
 #include "gt/intel_gpu_commands.h"
@@ -1067,6 +1069,120 @@ static int shrink_boom(struct i915_address_space *vm,
 	return err;
 }
 
+static int misaligned_case(struct i915_address_space *vm, struct intel_memory_region *mr,
+			   u64 addr, u64 size, unsigned long flags)
+{
+	struct drm_i915_gem_object *obj;
+	struct i915_vma *vma;
+	int err = 0;
+	u64 expected_vma_size, expected_node_size;
+
+	obj = i915_gem_object_create_region(mr, size, 0, 0);
+	if (IS_ERR(obj))
+		return PTR_ERR(obj);
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
+		err = i915_vma_unbind(vma);
+		err = -EBADSLT;
+		goto err_put;
+	}
+
+	err = i915_vma_unbind(vma);
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
+		u64 addr = round_up(hole_start + (hole_size / 2), min_alignment);
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
+		if (min_alignment > hole_size) {
+			if (!err)
+				err = -EBADSLT;
+			else if (err == -ENOSPC)
+				err = 0;
+		}
+		if (err)
+			return err;
+
+		/* test for intermediate size not expanding vma->size for large alignments */
+		err = misaligned_case(vm, mr, addr, size / 2, flags);
+		if (min_alignment > hole_size) {
+			if (!err)
+				err = -EBADSLT;
+			else if (err == -ENOSPC)
+				err = 0;
+		}
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
@@ -1136,6 +1252,11 @@ static int igt_ppgtt_shrink_boom(void *arg)
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
@@ -1208,6 +1329,11 @@ static int igt_ggtt_lowlevel(void *arg)
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
@@ -2180,12 +2306,14 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
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

