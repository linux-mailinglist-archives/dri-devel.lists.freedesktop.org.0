Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6475C4ED023
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 01:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620838982A;
	Wed, 30 Mar 2022 23:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214C310E245;
 Wed, 30 Mar 2022 23:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648682958; x=1680218958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PcQPznn2hYTtE4u2vihMNjjQ00nVhtIG0HWcEPnMErE=;
 b=PKQrdew11I+4m26efLTTbi9dK9oiCbcOBnReCl8ApvwrKEzscHiAEpfx
 01SyCSm0N9O/0ZQJcCJQm0eCwQ0ObQwg7Z0exVBlMmXvUlhV1MeunzZ2/
 YvWM/RjmFP76dC4alp7eel0NjV2KhPAagk4rSlR95rjq1zjDZK2BzCqSF
 yWHtdxi5fNGytJ+1AiUrHuLoDzBwko7iatca80Bw8GcApJnhXB4CKyR6G
 1J65m8C1FWVSY9lFQ6WjP0BY5gGHaM8eEtuFIDy7MAJeIx2FW63XU5rmZ
 dlC4c1ggSHANW7tRFjBcRwZJt0o9eg2uITrAtOPRiAljERYbsQFHiWKiN Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284582519"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284582519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:17 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="547052036"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 16:29:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 15/15] drm/i915/xehp: Eliminate shared/implicit steering
Date: Wed, 30 Mar 2022 16:28:58 -0700
Message-Id: <20220330232858.3204283-16-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330232858.3204283-1-matthew.d.roper@intel.com>
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically we've selected and programmed a single MCR group/instance
ID at driver startup that will steer register accesses for GSLICE/DSS
ranges to a non-terminated instance.  Any reads of these register ranges
that don't need a specific unicast access won't bother explicitly
resteering because the control register should already be set to a
suitable value to receive a non-terminated response.  Any accesses to
other types of MCR ranges (MSLICE, LNCF, etc.) that are also satisfied
by the default steering target will also skip explicit re-steering at
runtime.

This approach has worked well for many years and many platforms, but our
hardware teams have recently advised us that they're not 100%
comfortable with our strategy going forward.  They now suggest
explicitly steering reads of any multicast register at the time the
register access happens rather than relying on previously-programmed
steering values.  In debug settings there could be external agents that
have adjusted the default steering without the driver's knowledge (e.g.,
we could do this manually with IGT's intel_reg today, although the
hardware teams also have other tools they use for debug and analysis).
In theory it would also be possible for bad firmware and/or incorrect
handling of power management events to clobber/wipe the steering
value we had previously initialized because they assume we'll be
re-programming it anyway.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 40 +++++++++
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 98 ++++-----------------
 3 files changed, 56 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
index a9a9fa6881f2..787752367337 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
@@ -35,6 +35,7 @@
  */
 
 static const char * const intel_steering_types[] = {
+	"GSLICE/DSS",
 	"L3BANK",
 	"MSLICE",
 	"LNCF",
@@ -45,6 +46,35 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
 	{},
 };
 
+static const struct intel_mmio_range xehpsdv_dss_steering_table[] = {
+	{ 0x005200, 0x0052FF },
+	{ 0x005400, 0x007FFF },
+	{ 0x008140, 0x00815F },
+	{ 0x008D00, 0x008DFF },
+	{ 0x0094D0, 0x00955F },
+	{ 0x009680, 0x0096FF },
+	{ 0x00DC00, 0x00DCFF },
+	{ 0x00DE80, 0x00E8FF },
+	{ 0x017000, 0x017FFF },
+	{ 0x024A00, 0x024A7F },
+	{},
+};
+
+static const struct intel_mmio_range dg2_dss_steering_table[] = {
+	{ 0x005200, 0x0052FF },
+	{ 0x005400, 0x007FFF },
+	{ 0x008140, 0x00815F },
+	{ 0x008D00, 0x008DFF },
+	{ 0x0094D0, 0x00955F },
+	{ 0x009680, 0x0096FF },
+	{ 0x00D800, 0x00D87F },
+	{ 0x00DC00, 0x00DCFF },
+	{ 0x00DE80, 0x00E8FF },
+	{ 0x017000, 0x017FFF },
+	{ 0x024A00, 0x024A7F },
+	{},
+};
+
 static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
 	{ 0x004000, 0x004AFF },
 	{ 0x00C800, 0x00CFFF },
@@ -87,9 +117,11 @@ void intel_gt_mcr_init(struct intel_gt *gt)
 			 GEN12_MEML3_EN_MASK);
 
 	if (IS_DG2(i915)) {
+		gt->steering_table[DSS] = dg2_dss_steering_table;
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
 		gt->steering_table[LNCF] = dg2_lncf_steering_table;
 	} else if (IS_XEHPSDV(i915)) {
+		gt->steering_table[DSS] = xehpsdv_dss_steering_table;
 		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
 		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
 	} else if (GRAPHICS_VER(i915) >= 11 &&
@@ -317,7 +349,15 @@ static void get_valid_steering(struct intel_gt *gt,
 			       enum intel_steering_type type,
 			       u8 *group, u8 *instance)
 {
+	u32 dssmask = intel_sseu_get_subslices(&gt->info.sseu, 0);
+
 	switch (type) {
+	case DSS:
+		drm_WARN_ON(&gt->i915->drm, dssmask == 0);
+
+		*group = __ffs(dssmask) / GEN_DSS_PER_GSLICE;
+		*instance = __ffs(dssmask) % GEN_DSS_PER_GSLICE;
+		break;
 	case L3BANK:
 		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index 937b2e1a305e..b77bbaac7622 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -54,6 +54,7 @@ struct intel_mmio_range {
  * are listed here.
  */
 enum intel_steering_type {
+	DSS,
 	L3BANK,
 	MSLICE,
 	LNCF,
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 818ba71f4909..2486c6aa9d9d 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1160,87 +1160,6 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 	__add_mcr_wa(gt, wal, slice, subslice);
 }
 
-static void
-xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
-{
-	const struct sseu_dev_info *sseu = &gt->info.sseu;
-	unsigned long slice, subslice = 0, slice_mask = 0;
-	u64 dss_mask = 0;
-	u32 lncf_mask = 0;
-	int i;
-
-	/*
-	 * On Xe_HP the steering increases in complexity. There are now several
-	 * more units that require steering and we're not guaranteed to be able
-	 * to find a common setting for all of them. These are:
-	 * - GSLICE (fusable)
-	 * - DSS (sub-unit within gslice; fusable)
-	 * - L3 Bank (fusable)
-	 * - MSLICE (fusable)
-	 * - LNCF (sub-unit within mslice; always present if mslice is present)
-	 *
-	 * We'll do our default/implicit steering based on GSLICE (in the
-	 * sliceid field) and DSS (in the subsliceid field).  If we can
-	 * find overlap between the valid MSLICE and/or LNCF values with
-	 * a suitable GSLICE, then we can just re-use the default value and
-	 * skip and explicit steering at runtime.
-	 *
-	 * We only need to look for overlap between GSLICE/MSLICE/LNCF to find
-	 * a valid sliceid value.  DSS steering is the only type of steering
-	 * that utilizes the 'subsliceid' bits.
-	 *
-	 * Also note that, even though the steering domain is called "GSlice"
-	 * and it is encoded in the register using the gslice format, the spec
-	 * says that the combined (geometry | compute) fuse should be used to
-	 * select the steering.
-	 */
-
-	/* Find the potential gslice candidates */
-	dss_mask = intel_sseu_get_subslices(sseu, 0);
-	slice_mask = intel_slicemask_from_dssmask(dss_mask, GEN_DSS_PER_GSLICE);
-
-	/*
-	 * Find the potential LNCF candidates.  Either LNCF within a valid
-	 * mslice is fine.
-	 */
-	for_each_set_bit(i, &gt->info.mslice_mask, GEN12_MAX_MSLICES)
-		lncf_mask |= (0x3 << (i * 2));
-
-	/*
-	 * Are there any sliceid values that work for both GSLICE and LNCF
-	 * steering?
-	 */
-	if (slice_mask & lncf_mask) {
-		slice_mask &= lncf_mask;
-		gt->steering_table[LNCF] = NULL;
-	}
-
-	/* How about sliceid values that also work for MSLICE steering? */
-	if (slice_mask & gt->info.mslice_mask) {
-		slice_mask &= gt->info.mslice_mask;
-		gt->steering_table[MSLICE] = NULL;
-	}
-
-	slice = __ffs(slice_mask);
-	subslice = __ffs(dss_mask >> (slice * GEN_DSS_PER_GSLICE));
-	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
-	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
-
-	__add_mcr_wa(gt, wal, slice, subslice);
-
-	/*
-	 * SQIDI ranges are special because they use different steering
-	 * registers than everything else we work with.  On XeHP SDV and
-	 * DG2-G10, any value in the steering registers will work fine since
-	 * all instances are present, but DG2-G11 only has SQIDI instances at
-	 * ID's 2 and 3, so we need to steer to one of those.  For simplicity
-	 * we'll just steer to a hardcoded "2" since that value will work
-	 * everywhere.
-	 */
-	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
-	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
-}
-
 static void
 icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
@@ -1388,8 +1307,9 @@ static void
 xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
 	struct drm_i915_private *i915 = gt->i915;
+	struct drm_printer p = drm_debug_printer("MCR Steering:");
 
-	xehp_init_mcr(gt, wal);
+	intel_gt_mcr_report_steering(&p, gt, false);
 
 	/* Wa_1409757795:xehpsdv */
 	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
@@ -1441,10 +1361,22 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
+	struct drm_printer p = drm_debug_printer("MCR Steering:");
 	struct intel_engine_cs *engine;
 	int id;
 
-	xehp_init_mcr(gt, wal);
+	intel_gt_mcr_report_steering(&p, gt, false);
+
+	/*
+	 * SQIDI ranges are special because they use different steering
+	 * registers than everything else we work with.  On DG2-G10, any value
+	 * in the steering registers will work fine since all instances are
+	 * present, but DG2-G11 only has SQIDI instances at ID's 2 and 3, so we
+	 * need to steer to one of those.  For simplicity we'll just steer to a
+	 * hardcoded "2" since that value will work everywhere.
+	 */
+	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
+	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
 
 	/* Wa_14011060649:dg2 */
 	wa_14011060649(gt, wal);
-- 
2.34.1

