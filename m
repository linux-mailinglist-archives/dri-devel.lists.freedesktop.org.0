Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8D48B4D1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 19:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3C110E2C0;
	Tue, 11 Jan 2022 18:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442C10E2BC;
 Tue, 11 Jan 2022 18:03:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id F00F51F445DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641924208;
 bh=qNI10ViGfOPX7ep5VeEDaMq7A06oBqtTPrhO0BsGK2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YOV4M1A6uG+doAJ0g6W04v9I9mmKU6OsXbLg3cvRyNTIud8qydv/nugqaP859j0KG
 B9MGObBV2MvFLza+Phxt+uaalRzyxm529rsWfLuU+kaeKGJnKAmmgC6HJaDHpe+SeF
 MULvqU6erWcJUgiEx+i4TJXeyeR04X7I00lmuvOPjGje2Nf3PqDGZyQ+I3PVva7bpK
 Q9C4iR/aU76t6PLxpnPqBDY8UVv18GzSfzqh00gL7UH4gMjtKWiODpJVo80bMlLZNK
 XlL8JnxwCsr/wJ4nQU3jdG9/xKXXuqxYVPccsatPpg4sZDG0Rx+7tLd/9F5MiSFPeF
 gfsYfj9Hfzj3Q==
From: Robert Beckett <bob.beckett@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm/i915: add gtt misalignment test
Date: Tue, 11 Jan 2022 18:02:37 +0000
Message-Id: <20220111180238.1370631-4-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111180238.1370631-1-bob.beckett@collabora.com>
References: <20220111180238.1370631-1-bob.beckett@collabora.com>
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
index fea031b4ec4f..28de0b333835 100644
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
@@ -1066,6 +1068,120 @@ static int shrink_boom(struct i915_address_space *vm,
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
+	expected_vma_size = round_up(size, 1 << (ffs(vma->page_sizes.gtt) - 1));
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
@@ -1135,6 +1251,12 @@ static int igt_ppgtt_shrink_boom(void *arg)
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
@@ -1207,6 +1329,12 @@ static int igt_ggtt_lowlevel(void *arg)
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
@@ -2137,12 +2265,14 @@ int i915_gem_gtt_live_selftests(struct drm_i915_private *i915)
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

