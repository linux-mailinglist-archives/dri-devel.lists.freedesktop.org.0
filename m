Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1D14C7434
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8F6F10E872;
	Mon, 28 Feb 2022 17:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3510E53A;
 Mon, 28 Feb 2022 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070185; x=1677606185;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zt/zRj+s4ly7KDte4w/sZ2aq8XN5BjRfx6lydpAJLVo=;
 b=l12LwTgOnYi3fV+y9NMgJ+atmYYulpwtWruQvp7gXdJLWzeIiZCLlKpF
 eptWK330eaGMAOE6U6Cu19plhYFe2BZaTNQ/wc94bLoC8xTN5QGxp4F65
 MTl9nWqGZrgvfUg1TfCYSth294npI4N+uRpqk1K7hY/6pf20NXWivi5fr
 CDYAkumh1lMfnt63CHoYs9+CuJg/vkeGaPBnzWel5pRBv9jIk5gP2RTfK
 c3kV8U5LAnOibh701gVFPHGLEtzRtTXFWxT9aCVEOXoKfFhK5hxlr797y
 vuwggAHMIyMUX7M4o95DDe4sTiTFD+MGcK0kshyYE0UdoN1obb3g5Yd2F Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240351467"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="240351467"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:04 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392821"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:03 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 03/13] drm/i915/xehp: Add Compute CS IRQ handlers
Date: Mon, 28 Feb 2022 09:42:35 -0800
Message-Id: <20220228174245.1569581-4-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add execlists and GuC interrupts for compute CS into existing IRQ handlers.

All compute command streamers belong to the same compute class, so the
only change needed to enable their interrupts is to program their GT engine
interrupt mask registers.

CCS0 shares the register with CCS1, while CCS2 and CCS3 are in a new one.

BSpec: 50844, 54029, 54030, 53223, 53224.
Original-author: Michel Thierry
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c  | 15 ++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h |  3 +++
 drivers/gpu/drm/i915/i915_drv.h         |  2 ++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 983264e10e0a..e443ac4c8059 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -100,7 +100,7 @@ gen11_gt_identity_handler(struct intel_gt *gt, const u32 identity)
 	if (unlikely(!intr))
 		return;
 
-	if (class <= COPY_ENGINE_CLASS)
+	if (class <= COPY_ENGINE_CLASS || class == COMPUTE_CLASS)
 		return gen11_engine_irq_handler(gt, class, instance, intr);
 
 	if (class == OTHER_CLASS)
@@ -182,6 +182,8 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	/* Disable RCS, BCS, VCS and VECS class engines. */
 	intel_uncore_write(uncore, GEN11_RENDER_COPY_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE,	  0);
+	if (CCS_MASK(gt))
+		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, 0);
 
 	/* Restore masks irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK,	~0);
@@ -195,6 +197,10 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK,	~0);
 	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
 		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, CCS0) || HAS_ENGINE(gt, CCS1))
+		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~0);
+	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
+		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~0);
 
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_ENABLE, 0);
 	intel_uncore_write(uncore, GEN11_GPM_WGBOXPERF_INTR_MASK,  ~0);
@@ -225,6 +231,8 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	/* Enable RCS, BCS, VCS and VECS class interrupts. */
 	intel_uncore_write(uncore, GEN11_RENDER_COPY_INTR_ENABLE, dmask);
 	intel_uncore_write(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask);
+	if (CCS_MASK(gt))
+		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
@@ -238,6 +246,11 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	intel_uncore_write(uncore, GEN11_VECS0_VECS1_INTR_MASK, ~dmask);
 	if (HAS_ENGINE(gt, VECS2) || HAS_ENGINE(gt, VECS3))
 		intel_uncore_write(uncore, GEN12_VECS2_VECS3_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, CCS0) || HAS_ENGINE(gt, CCS1))
+		intel_uncore_write(uncore, GEN12_CCS0_CCS1_INTR_MASK, ~dmask);
+	if (HAS_ENGINE(gt, CCS2) || HAS_ENGINE(gt, CCS3))
+		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
+
 	/*
 	 * RPS interrupts will get enabled/disabled on demand when RPS itself
 	 * is enabled/disabled.
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 530807bfe9a0..69b826a3c381 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1468,6 +1468,7 @@
 #define GEN11_GPM_WGBOXPERF_INTR_ENABLE		_MMIO(0x19003c)
 #define GEN11_CRYPTO_RSVD_INTR_ENABLE		_MMIO(0x190040)
 #define GEN11_GUNIT_CSME_INTR_ENABLE		_MMIO(0x190044)
+#define GEN12_CCS_RSVD_INTR_ENABLE		_MMIO(0x190048)
 
 #define GEN11_INTR_IDENTITY_REG(x)		_MMIO(0x190060 + ((x) * 4))
 #define   GEN11_INTR_DATA_VALID			(1 << 31)
@@ -1493,6 +1494,8 @@
 #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
 #define GEN11_CRYPTO_RSVD_INTR_MASK		_MMIO(0x1900f0)
 #define GEN11_GUNIT_CSME_INTR_MASK		_MMIO(0x1900f4)
+#define GEN12_CCS0_CCS1_INTR_MASK		_MMIO(0x190100)
+#define GEN12_CCS2_CCS3_INTR_MASK		_MMIO(0x190104)
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index d26a3eaee270..457bc1993d19 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1249,6 +1249,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	ENGINE_INSTANCES_MASK(gt, VCS0, I915_MAX_VCS)
 #define VEBOX_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, VECS0, I915_MAX_VECS)
+#define CCS_MASK(gt) \
+	ENGINE_INSTANCES_MASK(gt, CCS0, I915_MAX_CCS)
 
 /*
  * The Gen7 cmdparser copies the scanned buffer to the ggtt for execution
-- 
2.34.1

