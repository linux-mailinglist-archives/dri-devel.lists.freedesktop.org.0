Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ADF3B974A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7B6EC30;
	Thu,  1 Jul 2021 20:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5A56EBA2;
 Thu,  1 Jul 2021 20:25:22 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="188998657"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="188998657"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:21 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564484"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 28/53] drm/i915/dg2: Add SQIDI steering
Date: Thu,  1 Jul 2021 13:24:02 -0700
Message-Id: <20210701202427.1547543-29-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Although DG2_G10 platforms will always have all SQIDI's present and
don't need steering for registers in a SQIDI MMIO range, this isn't true
for DG2_G11 platforms; only SQIDI's 2 and 3 can be used on those.

We handle SQIDI ranges a bit differently from other types of explicit
steering.  The SQIDI ranges belong to either the MCFG unit or the SF
unit, both of which have their own dedicated steering registers and do
not use the typical 0xFDC steering control that all other types of
ranges use.  Thus we only need to worry about picking a valid initial
value for the MCFG and SF steering registers (0xFD0 and 0xFD8
resepectively) at driver init; they won't change after we set them up so
we don't need to worry about re-steering them explicitly at runtime.

Given that any SQIDI value should work fine for DG2-G10 and XeHP SDV,
while only values of 2 and 3 are valid for DG2-G11, we'll just
initialize the MCFG and SF steering registers to a constant value of "2"
for all XeHP-based platforms for simplicity --- that will work in all
cases.

Bspec: 66534
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 28 +++++++++++++++++----
 drivers/gpu/drm/i915/i915_reg.h             |  2 ++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4302dc1b728e..f97ff2848122 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -944,17 +944,24 @@ cfl_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 		    GAMT_ECO_ENABLE_IN_PLACE_DECOMPRESS);
 }
 
-static void __add_mcr_wa(struct drm_i915_private *i915, struct i915_wa_list *wal,
-			 unsigned slice, unsigned subslice)
+static void __set_mcr_steering(struct i915_wa_list *wal,
+			       i915_reg_t steering_reg,
+			       unsigned int slice, unsigned int subslice)
 {
 	u32 mcr, mcr_mask;
 
 	mcr = GEN11_MCR_SLICE(slice) | GEN11_MCR_SUBSLICE(subslice);
 	mcr_mask = GEN11_MCR_SLICE_MASK | GEN11_MCR_SUBSLICE_MASK;
 
-	drm_dbg(&i915->drm, "MCR slice/subslice = %x\n", mcr);
+	wa_write_clr_set(wal, steering_reg, mcr_mask, mcr);
+}
+
+static void __add_mcr_wa(struct drm_i915_private *i915, struct i915_wa_list *wal,
+			 unsigned int slice, unsigned int subslice)
+{
+	drm_dbg(&i915->drm, "MCR slice=0x%x, subslice=0x%x\n", slice, subslice);
 
-	wa_write_clr_set(wal, GEN8_MCR_SELECTOR, mcr_mask, mcr);
+	__set_mcr_steering(wal, GEN8_MCR_SELECTOR, slice, subslice);
 }
 
 static void
@@ -1008,7 +1015,6 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	 * - L3 Bank (fusable)
 	 * - MSLICE (fusable)
 	 * - LNCF (sub-unit within mslice; always present if mslice is present)
-	 * - SQIDI (always on)
 	 *
 	 * We'll do our default/implicit steering based on GSLICE (in the
 	 * sliceid field) and DSS (in the subsliceid field).  If we can
@@ -1058,6 +1064,18 @@ xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
 
 	__add_mcr_wa(i915, wal, slice, subslice);
+
+	/*
+	 * SQIDI ranges are special because they use different steering
+	 * registers than everything else we work with.  On XeHP SDV and
+	 * DG2-G10, any value in the steering registers will work fine since
+	 * all instances are present, but DG2-G11 only has SQIDI instances at
+	 * ID's 2 and 3, so we need to steer to one of those.  For simplicity
+	 * we'll just steer to a hardcoded "2" since that value will work
+	 * everywhere.
+	 */
+	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
+	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 2992e8585399..b19d102e0a01 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -2686,6 +2686,8 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GEN12_SC_INSTDONE_EXTRA2	_MMIO(0x7108)
 #define GEN7_SAMPLER_INSTDONE	_MMIO(0xe160)
 #define GEN7_ROW_INSTDONE	_MMIO(0xe164)
+#define MCFG_MCR_SELECTOR		_MMIO(0xfd0)
+#define SF_MCR_SELECTOR			_MMIO(0xfd8)
 #define GEN8_MCR_SELECTOR		_MMIO(0xfdc)
 #define   GEN8_MCR_SLICE(slice)		(((slice) & 3) << 26)
 #define   GEN8_MCR_SLICE_MASK		GEN8_MCR_SLICE(3)
-- 
2.25.4

