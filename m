Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B9456047E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 17:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455CA10E416;
	Wed, 29 Jun 2022 15:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C689510E3CE;
 Wed, 29 Jun 2022 15:25:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28A7260B27;
 Wed, 29 Jun 2022 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82781C341C8;
 Wed, 29 Jun 2022 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656516330;
 bh=pAnLsLhlU8wTTndeJDMYPSkKHinalsEo7X4amJuUpQM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D8I9uMenNpLPkAOu4OU252AHAeLuS1ULOqBJj/jRtjYKlO2k3vsq15dD5295i4zLl
 sPMEt65sFl2uGdqm1TnQQIFC2H588xJBDlhDOFE8wRGaeq0/aXycMKqbTiyPUluyDx
 5FyXeCdLf7ILdzHAIDXyAUaNk9plMiv5NReIo6ol13jHek2Dg/TYSlLrcax91M6pEM
 ws5vKSoQvOHqukpn4KHEEW+VUs01VZsKgpN04DlgNYGcvR9yT1sIj1wf2q2k2xCmVe
 ab/uJXDhqd+NY0ENfp8NP71Tct7dS7BS/OtFze54j7CaoaRgRPQwfQFLaUmkQWiVKt
 0LwheY57ZH1nQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1o6ZZH-005hFI-Nx;
 Wed, 29 Jun 2022 16:25:27 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 1/3] drm/i915/gt: Ignore TLB invalidations on idle engines
Date: Wed, 29 Jun 2022 16:25:24 +0100
Message-Id: <5882cc9bf8d069151101b2469347ebe22bcbf4b8.1656516220.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1656516220.git.mchehab@kernel.org>
References: <cover.1656516220.git.mchehab@kernel.org>
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
Cc: Fei Yang <fei.yang@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Matthew Brost <matthew.brost@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org,
 Oak Zeng <oak.zeng@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

As an extension of the current skip TLB invalidations,
check if the device is powered down prior to any engine activity,
as, on such cases, all the TLBs were already invalidated, so an
explicit TLB invalidation is not needed.

This becomes more significant with GuC, as it can only do so when
the connection to the GuC is awake.

Cc: stable@vger.kernel.org
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Cc: Fei Yang <fei.yang@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

See [PATCH v2 0/3] at: https://lore.kernel.org/all/cover.1656516220.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 10 +++++----
 drivers/gpu/drm/i915/gt/intel_gt.c        | 26 +++++++++++++++++------
 drivers/gpu/drm/i915/gt/intel_gt_pm.h     |  3 +++
 3 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 97c820eee115..6835279943df 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -6,14 +6,15 @@
 
 #include <drm/drm_cache.h>
 
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_pm.h"
+
 #include "i915_drv.h"
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 #include "i915_gem_lmem.h"
 #include "i915_gem_mman.h"
 
-#include "gt/intel_gt.h"
-
 void __i915_gem_object_set_pages(struct drm_i915_gem_object *obj,
 				 struct sg_table *pages,
 				 unsigned int sg_page_sizes)
@@ -217,10 +218,11 @@ __i915_gem_object_unset_pages(struct drm_i915_gem_object *obj)
 
 	if (test_and_clear_bit(I915_BO_WAS_BOUND_BIT, &obj->flags)) {
 		struct drm_i915_private *i915 = to_i915(obj->base.dev);
+		struct intel_gt *gt = to_gt(i915);
 		intel_wakeref_t wakeref;
 
-		with_intel_runtime_pm_if_active(&i915->runtime_pm, wakeref)
-			intel_gt_invalidate_tlbs(to_gt(i915));
+		with_intel_gt_pm_if_awake(gt, wakeref)
+			intel_gt_invalidate_tlbs(gt);
 	}
 
 	return pages;
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 8da3314bb6bf..30c60cd960e8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -12,6 +12,7 @@
 
 #include "i915_drv.h"
 #include "intel_context.h"
+#include "intel_engine_pm.h"
 #include "intel_engine_regs.h"
 #include "intel_ggtt_gmch.h"
 #include "intel_gt.h"
@@ -924,6 +925,7 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 	struct drm_i915_private *i915 = gt->i915;
 	struct intel_uncore *uncore = gt->uncore;
 	struct intel_engine_cs *engine;
+	intel_engine_mask_t awake, tmp;
 	enum intel_engine_id id;
 	const i915_reg_t *regs;
 	unsigned int num = 0;
@@ -947,12 +949,27 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 
 	GEM_TRACE("\n");
 
-	assert_rpm_wakelock_held(&i915->runtime_pm);
-
 	mutex_lock(&gt->tlb_invalidate_lock);
 	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
 
+	awake = 0;
 	for_each_engine(engine, gt, id) {
+		struct reg_and_bit rb;
+
+		if (!intel_engine_pm_is_awake(engine))
+			continue;
+
+		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
+		if (!i915_mmio_reg_offset(rb.reg))
+			continue;
+
+		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
+		awake |= engine->mask;
+	}
+
+	for_each_engine_masked(engine, gt, awake, tmp) {
+		struct reg_and_bit rb;
+
 		/*
 		 * HW architecture suggest typical invalidation time at 40us,
 		 * with pessimistic cases up to 100us and a recommendation to
@@ -960,13 +977,8 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
 		 */
 		const unsigned int timeout_us = 100;
 		const unsigned int timeout_ms = 4;
-		struct reg_and_bit rb;
 
 		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
-		if (!i915_mmio_reg_offset(rb.reg))
-			continue;
-
-		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
 		if (__intel_wait_for_register_fw(uncore,
 						 rb.reg, rb.bit, 0,
 						 timeout_us, timeout_ms,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
index bc898df7a48c..a334787a4939 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
@@ -55,6 +55,9 @@ static inline void intel_gt_pm_might_put(struct intel_gt *gt)
 	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
 	     intel_gt_pm_put(gt), tmp = 0)
 
+#define with_intel_gt_pm_if_awake(gt, wf) \
+	for (wf = intel_gt_pm_get_if_awake(gt); wf; intel_gt_pm_put_async(gt), wf = 0)
+
 static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
 {
 	return intel_wakeref_wait_for_idle(&gt->wakeref);
-- 
2.36.1

