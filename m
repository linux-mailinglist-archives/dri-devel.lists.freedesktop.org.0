Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0185495587
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 21:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E63310E6E7;
	Thu, 20 Jan 2022 20:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E678810E6AB;
 Thu, 20 Jan 2022 20:40:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 9E7721F41939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642711246;
 bh=qusgV1IrpWYls6MEMfHoyhKydIqb2h/EGi15Q1HGAKE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MiSjcAAy4vIwo8kFIMKz9I/1NuVHLqqMeZdDg8or7m4/LWiV7UHWfr7MHoHjXQIjs
 UCsrxp8x67v+I9+DAaSEUT5cQ/6L0injeXGb1LReoBHRdFSNHXxqgVoyXXa8CleRtl
 UwvL5m7vBkOuCc20eTPFZ0BprZIU40o0TCiQSdywDr/iA8awx7td7OMggKPOBAg3z6
 eRvs7CEzEKud5L7nW20izFDBiCTNh7dTd4Ksa1i4LZJn79nZj11CDKjIxmWSpEbuYk
 43LRu3FhVkjxR6cKJLIMmRlTm63pRCAAHp033MoSluJ9y1wP6UJXN2cWeibfyFjNhO
 JIdI/3ibT/Bgg==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 4/5] drm/i915: add gtt misalignment test
Date: Thu, 20 Jan 2022 20:37:19 +0000
Message-Id: <20220120203721.632424-5-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120203721.632424-1-bob.beckett@collabora.com>
References: <20220120203721.632424-1-bob.beckett@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add test to check handling of misaligned offsets and sizes

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 130 ++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 2f3f0c01786b..76696a5e547e 100644
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
+	if (IS_DG2(vm->i915) && i915_gem_object_is_lmem(obj)) {
+		/* dg2 should expand lmem node to 2MB */
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
+		u64 min_alignment = i915_vm_min_alignment(vm, id);
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
@@ -1136,6 +1252,12 @@ static int igt_ppgtt_shrink_boom(void *arg)
 	return exercise_ppgtt(arg, shrink_boom);
 }
 
+static int igt_ppgtt_misaligned_pin(void *arg)
+{
+	return exercise_ppgtt(arg, misaligned_pin);
+}
+
+
 static int sort_holes(void *priv, const struct list_head *A,
 		      const struct list_head *B)
 {
@@ -1208,6 +1330,12 @@ static int igt_ggtt_lowlevel(void *arg)
 	return exercise_ggtt(arg, lowlevel_hole);
 }
 
+static int igt_ggtt_misaligned_pin(void *arg)
+{
+	return exercise_ggtt(arg, misaligned_pin);
+}
+
+
 static int igt_ggtt_page(void *arg)
 {
 	const unsigned int count = PAGE_SIZE/sizeof(u32);
@@ -2180,12 +2308,14 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
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
2.25.1

