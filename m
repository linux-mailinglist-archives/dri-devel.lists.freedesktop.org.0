Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23231588422
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 00:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1496ED1;
	Tue,  2 Aug 2022 22:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E239685D;
 Tue,  2 Aug 2022 22:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659478889; x=1691014889;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NO2WtrOKar5ANWVFrOOMHlFXmySyEsGE0Oy4esliW9U=;
 b=lC3dYO4ChgfAjMkwDTXRf9Wp1UBybTh5VkJpQHZkpZ+W2OU4KV7vFp0K
 3jGlScXHPu48CaN2fWDkZRDA5lsImYFNvTKqb+ZkBFV9QYzrpkci4wZ9S
 ySw/uUKyh7C8rWDJwDeaDf/5owEc9dPHr7DefJ8ni4vnowtEpOq+3f9gL
 nyBcC+4wCdtr2C28vZ6dHFnwBGeNKQvg40VX8RzKDfxptNFQCZKLxYJhg
 Vfj3lIxKSQfjlBXjlpgfsTECUrUet7z9mRoqNZkbD04VcpnxfQcUozZfj
 ASuZKu9So/dbweQ0ibzmxaIpsWBjbN9lHf6w1AksCzyhO1JRylVbVd8cb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="351244144"
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="351244144"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 15:21:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,212,1654585200"; d="scan'208";a="670618105"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2022 15:21:28 -0700
Date: Tue, 2 Aug 2022 15:21:08 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v2 1/2] drm/i915/gt: Move TLB invalidation to
 its own file
Message-ID: <20220802222108.GK14039@nvishwa1-DESK>
References: <cover.1659077372.git.mchehab@kernel.org>
 <f4d7b534511b57336eaea0ce696afdf675cf5892.1659077372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4d7b534511b57336eaea0ce696afdf675cf5892.1659077372.git.mchehab@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tomas Winkler <tomas.winkler@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 09:03:54AM +0200, Mauro Carvalho Chehab wrote:
>From: Chris Wilson <chris.p.wilson@intel.com>
>
>Prepare for supporting more TLB invalidation scenarios by moving
>the current MMIO invalidation to its own file.

And looks like,
1. Rename intel_gt_invalidate_tlb() to intel_gt_invalidate_tlb_full()
2. Add intel_gt_init_tlb() and intel_gt_fini_tlb() abstracts.

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>
>Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
>Cc: Fei Yang <fei.yang@intel.com>
>Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>---
>
>To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
>See [PATCH v2 0/2] at: https://lore.kernel.org/all/cover.1659077372.git.mchehab@kernel.org/
>
> drivers/gpu/drm/i915/Makefile             |   1 +
> drivers/gpu/drm/i915/gem/i915_gem_pages.c |   4 +-
> drivers/gpu/drm/i915/gt/intel_gt.c        | 168 +-------------------
> drivers/gpu/drm/i915/gt/intel_gt.h        |  12 --
> drivers/gpu/drm/i915/gt/intel_tlb.c       | 183 ++++++++++++++++++++++
> drivers/gpu/drm/i915/gt/intel_tlb.h       |  29 ++++
> drivers/gpu/drm/i915/i915_vma.c           |   1 +
> 7 files changed, 219 insertions(+), 179 deletions(-)
> create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.c
> create mode 100644 drivers/gpu/drm/i915/gt/intel_tlb.h
>
>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>index 522ef9b4aff3..d3df9832d1f7 100644
>--- a/drivers/gpu/drm/i915/Makefile
>+++ b/drivers/gpu/drm/i915/Makefile
>@@ -126,6 +126,7 @@ gt-y += \
> 	gt/intel_sseu.o \
> 	gt/intel_sseu_debugfs.o \
> 	gt/intel_timeline.o \
>+	gt/intel_tlb.o \
> 	gt/intel_workarounds.o \
> 	gt/shmem_utils.o \
> 	gt/sysfs_engines.o
>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>index 8357dbdcab5c..1cd76cc5d9f3 100644
>--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>@@ -7,7 +7,7 @@
> #include <drm/drm_cache.h>
>
> #include "gt/intel_gt.h"
>-#include "gt/intel_gt_pm.h"
>+#include "gt/intel_tlb.h"
>
> #include "i915_drv.h"
> #include "i915_gem_object.h"
>@@ -199,7 +199,7 @@ static void flush_tlb_invalidate(struct drm_i915_gem_object *obj)
> 	if (!obj->mm.tlb)
> 		return;
>
>-	intel_gt_invalidate_tlb(gt, obj->mm.tlb);
>+	intel_gt_invalidate_tlb_full(gt, obj->mm.tlb);
> 	obj->mm.tlb = 0;
> }
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index f435e06125aa..18d82cd620bd 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -11,9 +11,7 @@
> #include "pxp/intel_pxp.h"
>
> #include "i915_drv.h"
>-#include "i915_perf_oa_regs.h"
> #include "intel_context.h"
>-#include "intel_engine_pm.h"
> #include "intel_engine_regs.h"
> #include "intel_ggtt_gmch.h"
> #include "intel_gt.h"
>@@ -31,6 +29,7 @@
> #include "intel_renderstate.h"
> #include "intel_rps.h"
> #include "intel_gt_sysfs.h"
>+#include "intel_tlb.h"
> #include "intel_uncore.h"
> #include "shmem_utils.h"
>
>@@ -48,8 +47,7 @@ static void __intel_gt_init_early(struct intel_gt *gt)
> 	intel_gt_init_reset(gt);
> 	intel_gt_init_requests(gt);
> 	intel_gt_init_timelines(gt);
>-	mutex_init(&gt->tlb.invalidate_lock);
>-	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>+	intel_gt_init_tlb(gt);
> 	intel_gt_pm_init_early(gt);
>
> 	intel_uc_init_early(&gt->uc);
>@@ -770,7 +768,7 @@ void intel_gt_driver_late_release_all(struct drm_i915_private *i915)
> 		intel_gt_fini_requests(gt);
> 		intel_gt_fini_reset(gt);
> 		intel_gt_fini_timelines(gt);
>-		mutex_destroy(&gt->tlb.invalidate_lock);
>+		intel_gt_fini_tlb(gt);
> 		intel_engines_free(gt);
> 	}
> }
>@@ -881,163 +879,3 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>
> 	intel_sseu_dump(&info->sseu, p);
> }
>-
>-struct reg_and_bit {
>-	i915_reg_t reg;
>-	u32 bit;
>-};
>-
>-static struct reg_and_bit
>-get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>-		const i915_reg_t *regs, const unsigned int num)
>-{
>-	const unsigned int class = engine->class;
>-	struct reg_and_bit rb = { };
>-
>-	if (drm_WARN_ON_ONCE(&engine->i915->drm,
>-			     class >= num || !regs[class].reg))
>-		return rb;
>-
>-	rb.reg = regs[class];
>-	if (gen8 && class == VIDEO_DECODE_CLASS)
>-		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
>-	else
>-		rb.bit = engine->instance;
>-
>-	rb.bit = BIT(rb.bit);
>-
>-	return rb;
>-}
>-
>-static void mmio_invalidate_full(struct intel_gt *gt)
>-{
>-	static const i915_reg_t gen8_regs[] = {
>-		[RENDER_CLASS]			= GEN8_RTCR,
>-		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
>-		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
>-		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
>-	};
>-	static const i915_reg_t gen12_regs[] = {
>-		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
>-		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>-		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>-		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
>-		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>-	};
>-	struct drm_i915_private *i915 = gt->i915;
>-	struct intel_uncore *uncore = gt->uncore;
>-	struct intel_engine_cs *engine;
>-	intel_engine_mask_t awake, tmp;
>-	enum intel_engine_id id;
>-	const i915_reg_t *regs;
>-	unsigned int num = 0;
>-
>-	if (GRAPHICS_VER(i915) == 12) {
>-		regs = gen12_regs;
>-		num = ARRAY_SIZE(gen12_regs);
>-	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
>-		regs = gen8_regs;
>-		num = ARRAY_SIZE(gen8_regs);
>-	} else if (GRAPHICS_VER(i915) < 8) {
>-		return;
>-	}
>-
>-	if (drm_WARN_ONCE(&i915->drm, !num,
>-			  "Platform does not implement TLB invalidation!"))
>-		return;
>-
>-	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>-
>-	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
>-
>-	awake = 0;
>-	for_each_engine(engine, gt, id) {
>-		struct reg_and_bit rb;
>-
>-		if (!intel_engine_pm_is_awake(engine))
>-			continue;
>-
>-		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>-		if (!i915_mmio_reg_offset(rb.reg))
>-			continue;
>-
>-		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>-		awake |= engine->mask;
>-	}
>-
>-	GT_TRACE(gt, "invalidated engines %08x\n", awake);
>-
>-	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
>-	if (awake &&
>-	    (IS_TIGERLAKE(i915) ||
>-	     IS_DG1(i915) ||
>-	     IS_ROCKETLAKE(i915) ||
>-	     IS_ALDERLAKE_S(i915) ||
>-	     IS_ALDERLAKE_P(i915)))
>-		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>-
>-	spin_unlock_irq(&uncore->lock);
>-
>-	for_each_engine_masked(engine, gt, awake, tmp) {
>-		struct reg_and_bit rb;
>-
>-		/*
>-		 * HW architecture suggest typical invalidation time at 40us,
>-		 * with pessimistic cases up to 100us and a recommendation to
>-		 * cap at 1ms. We go a bit higher just in case.
>-		 */
>-		const unsigned int timeout_us = 100;
>-		const unsigned int timeout_ms = 4;
>-
>-		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>-		if (__intel_wait_for_register_fw(uncore,
>-						 rb.reg, rb.bit, 0,
>-						 timeout_us, timeout_ms,
>-						 NULL))
>-			drm_err_ratelimited(&gt->i915->drm,
>-					    "%s TLB invalidation did not complete in %ums!\n",
>-					    engine->name, timeout_ms);
>-	}
>-
>-	/*
>-	 * Use delayed put since a) we mostly expect a flurry of TLB
>-	 * invalidations so it is good to avoid paying the forcewake cost and
>-	 * b) it works around a bug in Icelake which cannot cope with too rapid
>-	 * transitions.
>-	 */
>-	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
>-}
>-
>-static bool tlb_seqno_passed(const struct intel_gt *gt, u32 seqno)
>-{
>-	u32 cur = intel_gt_tlb_seqno(gt);
>-
>-	/* Only skip if a *full* TLB invalidate barrier has passed */
>-	return (s32)(cur - ALIGN(seqno, 2)) > 0;
>-}
>-
>-void intel_gt_invalidate_tlb(struct intel_gt *gt, u32 seqno)
>-{
>-	intel_wakeref_t wakeref;
>-
>-	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
>-		return;
>-
>-	if (intel_gt_is_wedged(gt))
>-		return;
>-
>-	if (tlb_seqno_passed(gt, seqno))
>-		return;
>-
>-	with_intel_gt_pm_if_awake(gt, wakeref) {
>-		mutex_lock(&gt->tlb.invalidate_lock);
>-		if (tlb_seqno_passed(gt, seqno))
>-			goto unlock;
>-
>-		mmio_invalidate_full(gt);
>-
>-		write_seqcount_invalidate(&gt->tlb.seqno);
>-unlock:
>-		mutex_unlock(&gt->tlb.invalidate_lock);
>-	}
>-}
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>index 40b06adf509a..b4bba16cdb53 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>@@ -101,16 +101,4 @@ void intel_gt_info_print(const struct intel_gt_info *info,
>
> void intel_gt_watchdog_work(struct work_struct *work);
>
>-static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
>-{
>-	return seqprop_sequence(&gt->tlb.seqno);
>-}
>-
>-static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
>-{
>-	return intel_gt_tlb_seqno(gt) | 1;
>-}
>-
>-void intel_gt_invalidate_tlb(struct intel_gt *gt, u32 seqno);
>-
> #endif /* __INTEL_GT_H__ */
>diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.c b/drivers/gpu/drm/i915/gt/intel_tlb.c
>new file mode 100644
>index 000000000000..af8cae979489
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/gt/intel_tlb.c
>@@ -0,0 +1,183 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2022 Intel Corporation
>+ */
>+
>+#include "i915_drv.h"
>+#include "i915_perf_oa_regs.h"
>+#include "intel_engine_pm.h"
>+#include "intel_gt.h"
>+#include "intel_gt_pm.h"
>+#include "intel_gt_regs.h"
>+#include "intel_tlb.h"
>+
>+struct reg_and_bit {
>+	i915_reg_t reg;
>+	u32 bit;
>+};
>+
>+static struct reg_and_bit
>+get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
>+		const i915_reg_t *regs, const unsigned int num)
>+{
>+	const unsigned int class = engine->class;
>+	struct reg_and_bit rb = { };
>+
>+	if (drm_WARN_ON_ONCE(&engine->i915->drm,
>+			     class >= num || !regs[class].reg))
>+		return rb;
>+
>+	rb.reg = regs[class];
>+	if (gen8 && class == VIDEO_DECODE_CLASS)
>+		rb.reg.reg += 4 * engine->instance; /* GEN8_M2TCR */
>+	else
>+		rb.bit = engine->instance;
>+
>+	rb.bit = BIT(rb.bit);
>+
>+	return rb;
>+}
>+
>+static bool tlb_seqno_passed(const struct intel_gt *gt, u32 seqno)
>+{
>+	u32 cur = intel_gt_tlb_seqno(gt);
>+
>+	/* Only skip if a *full* TLB invalidate barrier has passed */
>+	return (s32)(cur - ALIGN(seqno, 2)) > 0;
>+}
>+
>+static void mmio_invalidate_full(struct intel_gt *gt)
>+{
>+	static const i915_reg_t gen8_regs[] = {
>+		[RENDER_CLASS]			= GEN8_RTCR,
>+		[VIDEO_DECODE_CLASS]		= GEN8_M1TCR, /* , GEN8_M2TCR */
>+		[VIDEO_ENHANCEMENT_CLASS]	= GEN8_VTCR,
>+		[COPY_ENGINE_CLASS]		= GEN8_BTCR,
>+	};
>+	static const i915_reg_t gen12_regs[] = {
>+		[RENDER_CLASS]			= GEN12_GFX_TLB_INV_CR,
>+		[VIDEO_DECODE_CLASS]		= GEN12_VD_TLB_INV_CR,
>+		[VIDEO_ENHANCEMENT_CLASS]	= GEN12_VE_TLB_INV_CR,
>+		[COPY_ENGINE_CLASS]		= GEN12_BLT_TLB_INV_CR,
>+		[COMPUTE_CLASS]			= GEN12_COMPCTX_TLB_INV_CR,
>+	};
>+	struct drm_i915_private *i915 = gt->i915;
>+	struct intel_uncore *uncore = gt->uncore;
>+	struct intel_engine_cs *engine;
>+	intel_engine_mask_t awake, tmp;
>+	enum intel_engine_id id;
>+	const i915_reg_t *regs;
>+	unsigned int num = 0;
>+
>+	if (GRAPHICS_VER(i915) == 12) {
>+		regs = gen12_regs;
>+		num = ARRAY_SIZE(gen12_regs);
>+	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
>+		regs = gen8_regs;
>+		num = ARRAY_SIZE(gen8_regs);
>+	} else if (GRAPHICS_VER(i915) < 8) {
>+		return;
>+	}
>+
>+	if (drm_WARN_ONCE(&i915->drm, !num,
>+			  "Platform does not implement TLB invalidation!"))
>+		return;
>+
>+	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>+
>+	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
>+
>+	awake = 0;
>+	for_each_engine(engine, gt, id) {
>+		struct reg_and_bit rb;
>+
>+		if (!intel_engine_pm_is_awake(engine))
>+			continue;
>+
>+		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>+		if (!i915_mmio_reg_offset(rb.reg))
>+			continue;
>+
>+		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>+		awake |= engine->mask;
>+	}
>+
>+	GT_TRACE(gt, "invalidated engines %08x\n", awake);
>+
>+	/* Wa_2207587034:tgl,dg1,rkl,adl-s,adl-p */
>+	if (awake &&
>+	    (IS_TIGERLAKE(i915) ||
>+	     IS_DG1(i915) ||
>+	     IS_ROCKETLAKE(i915) ||
>+	     IS_ALDERLAKE_S(i915) ||
>+	     IS_ALDERLAKE_P(i915)))
>+		intel_uncore_write_fw(uncore, GEN12_OA_TLB_INV_CR, 1);
>+
>+	spin_unlock_irq(&uncore->lock);
>+
>+	for_each_engine_masked(engine, gt, awake, tmp) {
>+		struct reg_and_bit rb;
>+
>+		/*
>+		 * HW architecture suggest typical invalidation time at 40us,
>+		 * with pessimistic cases up to 100us and a recommendation to
>+		 * cap at 1ms. We go a bit higher just in case.
>+		 */
>+		const unsigned int timeout_us = 100;
>+		const unsigned int timeout_ms = 4;
>+
>+		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
>+		if (__intel_wait_for_register_fw(uncore,
>+						 rb.reg, rb.bit, 0,
>+						 timeout_us, timeout_ms,
>+						 NULL))
>+			drm_err_ratelimited(&gt->i915->drm,
>+					    "%s TLB invalidation did not complete in %ums!\n",
>+					    engine->name, timeout_ms);
>+	}
>+
>+	/*
>+	 * Use delayed put since a) we mostly expect a flurry of TLB
>+	 * invalidations so it is good to avoid paying the forcewake cost and
>+	 * b) it works around a bug in Icelake which cannot cope with too rapid
>+	 * transitions.
>+	 */
>+	intel_uncore_forcewake_put_delayed(uncore, FORCEWAKE_ALL);
>+}
>+
>+void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno)
>+{
>+	intel_wakeref_t wakeref;
>+
>+	if (I915_SELFTEST_ONLY(gt->awake == -ENODEV))
>+		return;
>+
>+	if (intel_gt_is_wedged(gt))
>+		return;
>+
>+	if (tlb_seqno_passed(gt, seqno))
>+		return;
>+
>+	with_intel_gt_pm_if_awake(gt, wakeref) {
>+		mutex_lock(&gt->tlb.invalidate_lock);
>+		if (tlb_seqno_passed(gt, seqno))
>+			goto unlock;
>+
>+		mmio_invalidate_full(gt);
>+
>+		write_seqcount_invalidate(&gt->tlb.seqno);
>+unlock:
>+		mutex_unlock(&gt->tlb.invalidate_lock);
>+	}
>+}
>+
>+void intel_gt_init_tlb(struct intel_gt *gt)
>+{
>+	mutex_init(&gt->tlb.invalidate_lock);
>+	seqcount_mutex_init(&gt->tlb.seqno, &gt->tlb.invalidate_lock);
>+}
>+
>+void intel_gt_fini_tlb(struct intel_gt *gt)
>+{
>+	mutex_destroy(&gt->tlb.invalidate_lock);
>+}
>diff --git a/drivers/gpu/drm/i915/gt/intel_tlb.h b/drivers/gpu/drm/i915/gt/intel_tlb.h
>new file mode 100644
>index 000000000000..46ce25bf5afe
>--- /dev/null
>+++ b/drivers/gpu/drm/i915/gt/intel_tlb.h
>@@ -0,0 +1,29 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2022 Intel Corporation
>+ */
>+
>+#ifndef INTEL_TLB_H
>+#define INTEL_TLB_H
>+
>+#include <linux/seqlock.h>
>+#include <linux/types.h>
>+
>+#include "intel_gt_types.h"
>+
>+void intel_gt_invalidate_tlb_full(struct intel_gt *gt, u32 seqno);
>+
>+void intel_gt_init_tlb(struct intel_gt *gt);
>+void intel_gt_fini_tlb(struct intel_gt *gt);
>+
>+static inline u32 intel_gt_tlb_seqno(const struct intel_gt *gt)
>+{
>+	return seqprop_sequence(&gt->tlb.seqno);
>+}
>+
>+static inline u32 intel_gt_next_invalidate_tlb_full(const struct intel_gt *gt)
>+{
>+	return intel_gt_tlb_seqno(gt) | 1;
>+}
>+
>+#endif /* INTEL_TLB_H */
>diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
>index 84a9ccbc5fc5..fe947d1456d5 100644
>--- a/drivers/gpu/drm/i915/i915_vma.c
>+++ b/drivers/gpu/drm/i915/i915_vma.c
>@@ -33,6 +33,7 @@
> #include "gt/intel_engine_heartbeat.h"
> #include "gt/intel_gt.h"
> #include "gt/intel_gt_requests.h"
>+#include "gt/intel_tlb.h"
>
> #include "i915_drv.h"
> #include "i915_gem_evict.h"
>-- 
>2.36.1
>
