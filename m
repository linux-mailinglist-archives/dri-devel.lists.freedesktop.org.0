Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8175A00F3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 20:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78E2B77D2;
	Wed, 24 Aug 2022 18:01:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A015910E063;
 Tue, 16 Aug 2022 21:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660683976; x=1692219976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NsOicyY848VXvor3mRIj0cJ45H9tje46HHxmDjZuuQI=;
 b=GGf4MWd4mv/b5MkLo514RhT4JpqdQvGKuccm59Cu2K8MOSZHMLl1R2CN
 tnZb6LTaWr4LZMNXbfUdOdhU+shjtRRzj7Tvc7VEF5JrMkdxK7+Qa0jW+
 U7H/oYRM3WVEg+QbN45nGsLAPexI1XKLt5FICYBb45pqVV8yN5zRKXZiu
 UpST46TsdW/AUcPYUBtCjQSNCNmYrvTDueADqQh10ppcIDDQoT0qTh9UY
 nzduLotqUy6phDfJRzb2N9KiROG2gkaPQnAKwclkzNCURcsvtoCED4OtI
 xhc1zulx5mY8aG8oZsf8JrUt0wtIm8hswBvAZJSWYPt1+lHpif9TXAA+x w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="292325480"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="292325480"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 14:06:15 -0700
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="733440944"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 14:06:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/gt: Add dedicated function for non-ctx
 register tuning settings
Date: Tue, 16 Aug 2022 14:06:00 -0700
Message-Id: <20220816210601.2041572-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.1
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

The bspec performance tuning section gives recommended settings that the
driver should program for various MMIO registers.  Although these
settings aren't "workarounds" we use the workaround infrastructure to do
this programming to make sure it is handled at the appropriate places
and doesn't conflict with any real workarounds.

Since more of these are starting to show up on recent platforms, it's a
good time to create a dedicated function to hold them so that there's
less ambiguity about how/where to implement new ones.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 42 ++++++++++++++-------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 59cf28baa472..a68d279b01f0 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2102,13 +2102,6 @@ rcs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 		/* Wa_1509235366:dg2 */
 		wa_write_or(wal, GEN12_GAMCNTRL_CTRL, INVALIDATION_BROADCAST_MODE_DIS |
 			    GLOBAL_INVALIDATION_MODE);
-
-		/*
-		 * The following are not actually "workarounds" but rather
-		 * recommended tuning settings documented in the bspec's
-		 * performance guide section.
-		 */
-		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
 	}
 
 	if (IS_DG2_GRAPHICS_STEP(i915, G11, STEP_A0, STEP_B0)) {
@@ -2676,6 +2669,32 @@ ccs_engine_wa_init(struct intel_engine_cs *engine, struct i915_wa_list *wal)
 	}
 }
 
+/*
+ * The bspec performance guide has recommended MMIO tuning settings.  These
+ * aren't truly "workarounds" but we want to program them with the same
+ * workaround infrastructure to ensure that they're automatically added to
+ * the GuC save/restore lists, re-applied at the right times, and checked for
+ * any conflicting programming requested by real workarounds.
+ *
+ * Programming settings should be added here only if their registers are not
+ * part of an engine's register state context.  If a register is part of a
+ * context, then any tuning settings should be programmed in an appropriate
+ * function invoked by __intel_engine_init_ctx_wa().
+ */
+static void
+add_render_compute_tuning_settings(struct drm_i915_private *i915,
+				   struct i915_wa_list *wal)
+{
+	if (IS_PONTEVECCHIO(i915)) {
+		wa_write(wal, XEHPC_L3SCRUB,
+			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
+	}
+
+	if (IS_DG2(i915)) {
+		wa_write_or(wal, XEHP_L3SCQREG7, BLEND_FILL_CACHING_OPT_DIS);
+	}
+}
+
 /*
  * The workarounds in this function apply to shared registers in
  * the general render reset domain that aren't tied to a
@@ -2690,14 +2709,9 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 {
 	struct drm_i915_private *i915 = engine->i915;
 
-	if (IS_PONTEVECCHIO(i915)) {
-		/*
-		 * The following is not actually a "workaround" but rather
-		 * a recommended tuning setting documented in the bspec's
-		 * performance guide section.
-		 */
-		wa_write(wal, XEHPC_L3SCRUB, SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
+	add_render_compute_tuning_settings(i915, wal);
 
+	if (IS_PONTEVECCHIO(i915)) {
 		/* Wa_16016694945 */
 		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
 	}
-- 
2.37.1

