Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD1967C111
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA2910E3AE;
	Wed, 25 Jan 2023 23:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EEF710E3A9;
 Wed, 25 Jan 2023 23:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674690144; x=1706226144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oIA+a+FUpX2iLPqf7HxNk14ngKSh8dcSIeGuauYBRlM=;
 b=fBO+O6Li+TgXpr8N2FfTisFJusHv84cKq2g/B+bhWEvz2G4ULJVnoNKv
 qeVG/EZLq5W0zDvljKMv27YpwSGElqcITX8PrHf54OmD4m83zCXuZDUS+
 U8So4kxRiy1Uo1BweuCG/pf53IAm3s+3Pq3ba+06WF8NN/uB77mZyMNoR
 +DPsUd5a+IMzzkpwN7zBEQ0ZWMFkzgK8dNYWtLD6GsY3HKZLdvkPTi84e
 ooonALyLSsiVxfad28PXCv3Ckrzfz2MU2BFqTx7nu9FooiQNx2V/riPyJ
 4NMJW7LLSx9/bPvg+YbnZtqh4F7Gx7ObJl6TDROE5ANqzbPBXZBEFjdl9 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326739591"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326739591"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="655987401"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="655987401"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/i915/mtl: Correct implementation of Wa_18018781329
Date: Wed, 25 Jan 2023 15:41:58 -0800
Message-Id: <20230125234159.3015385-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125234159.3015385-1-matthew.d.roper@intel.com>
References: <20230125234159.3015385-1-matthew.d.roper@intel.com>
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
Cc: Gustavo Sousa <gustavo.sousa@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Workaround Wa_18018781329 has applied to several recent Xe_HP-based
platforms.  However there are some extra gotchas to implementing this
properly for MTL that we need to take into account:

 * Due to the separation of media and render/compute into separate GTs,
   this workaround needs to be implemented on each GT, not just the
   primary GT.  Since each class of register only exists on one of the
   two GTs, we should program the appropriate registers on each GT.

 * As with past Xe_HP platforms, the registers on the primary GT (Xe_LPG
   IP) are multicast/replicated registers and should be handled with the
   MCR-aware functions.  However the registers on the media GT (Xe_LPM+
   IP) are regular singleton registers and should _not_ use MCR
   handling.  We need to create separate register definitions for the
   Xe_HP multicast form and the Xe_LPM+ singleton form and use each in
   the appropriate place.

 * Starting with MTL, workarounds documented by the hardware teams are
   technically associated with IP versions/steppings rather than
   top-level platforms.  That means we should take care to check the
   media IP version rather than the graphics IP version when deciding
   whether the workaround is needed on the Xe_LPM+ media GT (in this
   case the workaround applies to both IPs and the stepping bounds are
   identical, but we should still write the code appropriately to set a
   proper precedent for future workaround implementations).

 * It's worth noting that the GSC register and the CCS register are
   defined with the same MMIO offset (0xCF30).  Since the CCS is only
   relevant to the primary GT and the GSC is only relevant to the media
   GT there isn't actually a clash here (the media GT automatically adds
   the additional 0x380000 GSI offset).  However there's currently a
   glitch in the bspec where the CCS register doesn't show up at all and
   the GSC register is listed as existing on both GTs.  That's a known
   documentation problem for several registers with shared GSC/CCS
   offsets; rest assured that the CCS register really does still exist.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  7 +++++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 22 ++++++++++++++-------
 drivers/gpu/drm/i915/i915_drv.h             |  4 ++++
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 2727645864db..310bdde049ab 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1100,8 +1100,11 @@
 #define XEHP_MERT_MOD_CTRL			MCR_REG(0xcf28)
 #define RENDER_MOD_CTRL				MCR_REG(0xcf2c)
 #define COMP_MOD_CTRL				MCR_REG(0xcf30)
-#define VDBX_MOD_CTRL				MCR_REG(0xcf34)
-#define VEBX_MOD_CTRL				MCR_REG(0xcf38)
+#define XELPMP_GSC_MOD_CTRL			_MMIO(0xcf30)	/* media GT only */
+#define XEHP_VDBX_MOD_CTRL			MCR_REG(0xcf34)
+#define XELPMP_VDBX_MOD_CTRL			_MMIO(0xcf34)
+#define XEHP_VEBX_MOD_CTRL			MCR_REG(0xcf38)
+#define XELPMP_VEBX_MOD_CTRL			_MMIO(0xcf38)
 #define   FORCE_MISS_FTLB			REG_BIT(3)
 
 #define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 9db60078460a..4c978abf3e2a 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1681,8 +1681,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_18018781329 */
 	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
 	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
-	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
-	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 
 	/* Wa_1509235366:dg2 */
 	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
@@ -1700,8 +1700,8 @@ pvc_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	/* Wa_18018781329 */
 	wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
 	wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
-	wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
-	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, XEHP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 }
 
 static void
@@ -1715,8 +1715,6 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 		/* Wa_18018781329 */
 		wa_mcr_write_or(wal, RENDER_MOD_CTRL, FORCE_MISS_FTLB);
 		wa_mcr_write_or(wal, COMP_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_mcr_write_or(wal, VDBX_MOD_CTRL, FORCE_MISS_FTLB);
-		wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 	}
 
 	/*
@@ -1729,7 +1727,17 @@ xelpg_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 static void
 xelpmp_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 {
-	/* FIXME: Actual workarounds will be added in future patch(es) */
+	if (IS_MTL_MEDIA_STEP(gt->i915, STEP_A0, STEP_B0)) {
+		/*
+		 * Wa_18018781329
+		 *
+		 * Note that although these registers are MCR on the primary
+		 * GT, the media GT's versions are regular singleton registers.
+		 */
+		wa_write_or(wal, XELPMP_GSC_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XELPMP_VDBX_MOD_CTRL, FORCE_MISS_FTLB);
+		wa_write_or(wal, XELPMP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
+	}
 
 	debug_dump_steering(gt);
 }
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 48c838b4ea62..4295306487c7 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -696,6 +696,10 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 	(IS_METEORLAKE(__i915) && \
 	 IS_DISPLAY_STEP(__i915, since, until))
 
+#define IS_MTL_MEDIA_STEP(__i915, since, until) \
+	(IS_METEORLAKE(__i915) && \
+	 IS_MEDIA_STEP(__i915, since, until))
+
 /*
  * DG2 hardware steppings are a bit unusual.  The hardware design was forked to
  * create three variants (G10, G11, and G12) which each have distinct
-- 
2.39.1

