Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E608A390AD9
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 22:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2726EB08;
	Tue, 25 May 2021 20:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116756E43D;
 Tue, 25 May 2021 20:57:54 +0000 (UTC)
IronPort-SDR: TaQYuhvlx1XoZiGA3CFB3DyrVcpX/FLdOKSX9SDQ5aoO0ed2dU06NRxQMPpIpRctOXy/jQgy7i
 kmkratmWmrGQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="266195938"
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="266195938"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:52 -0700
IronPort-SDR: V77jSuFfMoL+qYt4gUn6NuiscrAfdzdQmNy0bjkOHJn7p2ujzQQXIH4X6i1xU3BFDPOjtO4rim
 +5mjZSDm2Bog==
X-IronPort-AV: E=Sophos;i="5.82,329,1613462400"; d="scan'208";a="443603523"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 13:57:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 03/17] drm/i915/guc: enable only the user interrupt when using
 GuC submission
Date: Tue, 25 May 2021 14:15:27 -0700
Message-Id: <20210525211541.87696-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210525211541.87696-1-matthew.brost@intel.com>
References: <20210525211541.87696-1-matthew.brost@intel.com>
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
Cc: Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

In GuC submission mode the CS is owned by the GuC FW, so all CS status
interrupts are handled by it. We only need the user interrupt as that
signals request completion.

Since we're now starting the engines directly in GuC submission mode
when selected, we can stop switching back and forth between the
execlists and the GuC programming and select directly the correct
interrupt mask.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        | 18 ++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 31 -------------------
 2 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index d29126c458ba..f88c10366e58 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -194,14 +194,18 @@ void gen11_gt_irq_reset(struct intel_gt *gt)
 
 void gen11_gt_irq_postinstall(struct intel_gt *gt)
 {
-	const u32 irqs =
-		GT_CS_MASTER_ERROR_INTERRUPT |
-		GT_RENDER_USER_INTERRUPT |
-		GT_CONTEXT_SWITCH_INTERRUPT |
-		GT_WAIT_SEMAPHORE_INTERRUPT;
 	struct intel_uncore *uncore = gt->uncore;
-	const u32 dmask = irqs << 16 | irqs;
-	const u32 smask = irqs << 16;
+	u32 irqs = GT_RENDER_USER_INTERRUPT;
+	u32 dmask;
+	u32 smask;
+
+	if (!intel_uc_wants_guc_submission(&gt->uc))
+		irqs |= GT_CS_MASTER_ERROR_INTERRUPT |
+			GT_CONTEXT_SWITCH_INTERRUPT |
+			GT_WAIT_SEMAPHORE_INTERRUPT;
+
+	dmask = irqs << 16 | irqs;
+	smask = irqs << 16;
 
 	BUILD_BUG_ON(irqs & 0xffff0000);
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 335719f17490..38cda5d599a6 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -432,32 +432,6 @@ void intel_guc_submission_fini(struct intel_guc *guc)
 	}
 }
 
-static void guc_interrupts_capture(struct intel_gt *gt)
-{
-	struct intel_uncore *uncore = gt->uncore;
-	u32 irqs = GT_CONTEXT_SWITCH_INTERRUPT;
-	u32 dmask = irqs << 16 | irqs;
-
-	GEM_BUG_ON(INTEL_GEN(gt->i915) < 11);
-
-	/* Don't handle the ctx switch interrupt in GuC submission mode */
-	intel_uncore_rmw(uncore, GEN11_RENDER_COPY_INTR_ENABLE, dmask, 0);
-	intel_uncore_rmw(uncore, GEN11_VCS_VECS_INTR_ENABLE, dmask, 0);
-}
-
-static void guc_interrupts_release(struct intel_gt *gt)
-{
-	struct intel_uncore *uncore = gt->uncore;
-	u32 irqs = GT_CONTEXT_SWITCH_INTERRUPT;
-	u32 dmask = irqs << 16 | irqs;
-
-	GEM_BUG_ON(INTEL_GEN(gt->i915) < 11);
-
-	/* Handle ctx switch interrupts again */
-	intel_uncore_rmw(uncore, GEN11_RENDER_COPY_INTR_ENABLE, 0, dmask);
-	intel_uncore_rmw(uncore, GEN11_VCS_VECS_INTR_ENABLE, 0, dmask);
-}
-
 static int guc_context_alloc(struct intel_context *ce)
 {
 	return lrc_alloc(ce, ce->engine);
@@ -722,9 +696,6 @@ int intel_guc_submission_setup(struct intel_engine_cs *engine)
 void intel_guc_submission_enable(struct intel_guc *guc)
 {
 	guc_stage_desc_init(guc);
-
-	/* Take over from manual control of ELSP (execlists) */
-	guc_interrupts_capture(guc_to_gt(guc));
 }
 
 void intel_guc_submission_disable(struct intel_guc *guc)
@@ -735,8 +706,6 @@ void intel_guc_submission_disable(struct intel_guc *guc)
 
 	/* Note: By the time we're here, GuC may have already been reset */
 
-	guc_interrupts_release(gt);
-
 	guc_stage_desc_fini(guc);
 }
 
-- 
2.28.0

