Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CC762E325
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 18:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C0F10E65B;
	Thu, 17 Nov 2022 17:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E41210E65A;
 Thu, 17 Nov 2022 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668706444; x=1700242444;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vJTuloVUVA2YCIjw8/Ea7+NqoPMQh0S9fw2e+qUtfDY=;
 b=Mq6qU+rVLVZUXluJgPfPdaOTA49VE2BAdnU4nkVYJzQ+zuTKuEIPuqx2
 VAfb+t2q8rekOFKC1Yd4HYiCJ0EaS+wEBVXO6VarQnKOpqPsh+AEwsNiN
 IQtvSmfKS/97m3LlMdIWnUyw6ZOmMUIsf+FP9RdvflXhr2jQNknBzC9Pc
 SX0XRTqqY99AdTBl4JbaMdpGXM9sqiUWv3XNPqQ8/Rx5PKMX31XV5kSIE
 RMNVyun75wk5byMCZ82kqfgcB7M75B4P6zeGLKcmh6yC2/P9JvhE+dilt
 FvDej60A3e1Q1Lv5iB1XhRHfwBUNLUm6iRXOWgVVRlWglpuU0bqiMErxm w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="314069765"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="314069765"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 09:34:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634135261"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634135261"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 09:34:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Manage uncore->lock while waiting on MCR register
Date: Thu, 17 Nov 2022 09:33:58 -0800
Message-Id: <20221117173358.1980230-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GT MCR code currently relies on uncore->lock to avoid race
conditions on the steering control register during MCR operations.  The
*_fw() versions of MCR operations expect the caller to already hold
uncore->lock, while the non-fw variants manage the lock internally.
However the sole callsite of intel_gt_mcr_wait_for_reg_fw() does not
currently obtain the forcewake lock, allowing a potential race condition
(and triggering an assertion on lockdep builds).  Furthermore, since
'wait for register value' requests may not return immediately, it is
undesirable to hold a fundamental lock like uncore->lock for the entire
wait and block all other MMIO for the duration; rather the lock is only
needed around the MCR read operations and can be released during the
delays.

Convert intel_gt_mcr_wait_for_reg_fw() to a non-fw variant that will
manage uncore->lock internally.  This does have the side effect of
causing an unnecessary lookup in the forcewake table on each read
operation, but since the caller is still holding the relevant forcewake
domain, this will ultimately just incremenent the reference count and
won't actually cause any additional MMIO traffic.

In the future we plan to switch to a dedicated MCR lock to protect the
steering critical section rather than using the overloaded and
high-traffic uncore->lock; on MTL and beyond the new lock can be
implemented on top of the hardware-provided synchonization mechanism for
steering.

Fixes: 3068bec83eea ("drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()")
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c     |  6 +++---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 18 ++++++++++--------
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h | 12 ++++++------
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 0325f071046c..b5ad9caa5537 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -1035,9 +1035,9 @@ get_reg_and_bit(const struct intel_engine_cs *engine, const bool gen8,
 static int wait_for_invalidate(struct intel_gt *gt, struct reg_and_bit rb)
 {
 	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 50))
-		return intel_gt_mcr_wait_for_reg_fw(gt, rb.mcr_reg, rb.bit, 0,
-						    TLB_INVAL_TIMEOUT_US,
-						    TLB_INVAL_TIMEOUT_MS);
+		return intel_gt_mcr_wait_for_reg(gt, rb.mcr_reg, rb.bit, 0,
+						 TLB_INVAL_TIMEOUT_US,
+						 TLB_INVAL_TIMEOUT_MS);
 	else
 		return __intel_wait_for_register_fw(gt->uncore, rb.reg, rb.bit, 0,
 						    TLB_INVAL_TIMEOUT_US,
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index 830edffe88cc..d9a8ff9e5e57 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -730,17 +730,19 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
  *
  * Return: 0 if the register matches the desired condition, or -ETIMEDOUT.
  */
-int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
-				 i915_mcr_reg_t reg,
-				 u32 mask,
-				 u32 value,
-				 unsigned int fast_timeout_us,
-				 unsigned int slow_timeout_ms)
+int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
+			      i915_mcr_reg_t reg,
+			      u32 mask,
+			      u32 value,
+			      unsigned int fast_timeout_us,
+			      unsigned int slow_timeout_ms)
 {
-	u32 reg_value = 0;
-#define done (((reg_value = intel_gt_mcr_read_any_fw(gt, reg)) & mask) == value)
 	int ret;
 
+	lockdep_assert_not_held(&gt->uncore->lock);
+
+#define done ((intel_gt_mcr_read_any(gt, reg) & mask) == value)
+
 	/* Catch any overuse of this function */
 	might_sleep_if(slow_timeout_ms);
 	GEM_BUG_ON(fast_timeout_us > 20000);
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
index 3fb0502bff22..ae93b20e1c17 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.h
@@ -37,12 +37,12 @@ void intel_gt_mcr_report_steering(struct drm_printer *p, struct intel_gt *gt,
 void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
 				  unsigned int *group, unsigned int *instance);
 
-int intel_gt_mcr_wait_for_reg_fw(struct intel_gt *gt,
-				 i915_mcr_reg_t reg,
-				 u32 mask,
-				 u32 value,
-				 unsigned int fast_timeout_us,
-				 unsigned int slow_timeout_ms);
+int intel_gt_mcr_wait_for_reg(struct intel_gt *gt,
+			      i915_mcr_reg_t reg,
+			      u32 mask,
+			      u32 value,
+			      unsigned int fast_timeout_us,
+			      unsigned int slow_timeout_ms);
 
 /*
  * Helper for for_each_ss_steering loop.  On pre-Xe_HP platforms, subslice
-- 
2.38.1

