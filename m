Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 452DF3B9779
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8566EC17;
	Thu,  1 Jul 2021 20:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFA76EC05;
 Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208436156"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208436156"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564449"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 20/53] drm/i915/xehpsdv: Define steering tables
Date: Thu,  1 Jul 2021 13:23:54 -0700
Message-Id: <20210701202427.1547543-21-matthew.d.roper@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define and initialize the MMIO ranges for which XeHP SDV requires MSLICE
and LNCF steering.

Bspec: 66534
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 11 +++++++++--
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f59bcedbb80b..9d1c99c9c0dd 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -89,6 +89,20 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
 	{},
 };
 
+static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
+	{ 0x004000, 0x004AFF },
+	{ 0x00C800, 0x00CFFF },
+	{ 0x00DD00, 0x00DDFF },
+	{ 0x00E900, 0x00FFFF }, /* 0xEA00 - OxEFFF is unused */
+	{},
+};
+
+static const struct intel_mmio_range xehpsdv_lncf_steering_table[] = {
+	{ 0x00B000, 0x00B0FF },
+	{ 0x00D800, 0x00D8FF },
+	{},
+};
+
 static u16 slicemask(struct intel_gt *gt, int count)
 {
 	u64 dss_mask = intel_sseu_get_subslices(&gt->info.sseu, 0);
@@ -113,7 +127,10 @@ int intel_gt_init_mmio(struct intel_gt *gt)
 			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
 			 GEN12_MEML3_EN_MASK);
 
-	if (GRAPHICS_VER(gt->i915) >= 11 &&
+	if (IS_XEHPSDV(gt->i915)) {
+		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
+		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
+	} else if (GRAPHICS_VER(gt->i915) >= 11 &&
 		   GRAPHICS_VER_FULL(gt->i915) < IP_VER(12, 50)) {
 		gt->steering_table[L3BANK] = icl_l3bank_steering_table;
 		gt->info.l3bank_mask =
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 060d84897635..4302dc1b728e 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -989,7 +989,6 @@ icl_wa_init_mcr(struct drm_i915_private *i915, struct i915_wa_list *wal)
 	__add_mcr_wa(i915, wal, slice, subslice);
 }
 
-__maybe_unused
 static void
 xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
 {
@@ -1208,10 +1207,18 @@ dg1_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
 			    VSUNIT_CLKGATE_DIS_TGL);
 }
 
+static void
+xehpsdv_gt_workarounds_init(struct drm_i915_private *i915, struct i915_wa_list *wal)
+{
+	xehp_init_mcr(&i915->gt, wal);
+}
+
 static void
 gt_init_workarounds(struct drm_i915_private *i915, struct i915_wa_list *wal)
 {
-	if (IS_DG1(i915))
+	if (IS_XEHPSDV(i915))
+		xehpsdv_gt_workarounds_init(i915, wal);
+	else if (IS_DG1(i915))
 		dg1_gt_workarounds_init(i915, wal);
 	else if (IS_TIGERLAKE(i915))
 		tgl_gt_workarounds_init(i915, wal);
-- 
2.25.4

