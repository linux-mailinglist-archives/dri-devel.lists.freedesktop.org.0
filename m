Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 574FF6870F2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 23:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE8E810E1A3;
	Wed,  1 Feb 2023 22:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5610E1A3;
 Wed,  1 Feb 2023 22:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675290517; x=1706826517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q5zCMQ8i+T+NLbdI+kb3KovMphPiz+ZVDmw6YhoUWyE=;
 b=PDaMEQJYLTAG/hU6/OatZEojI2EP+7ko7DPQJ1qJWyJicTiWOsBoYG/l
 nb+Jy5lfHKrVBfqLj/UlSorZNvwmRK1jZr2NY+CZUOoWBL9MxiiX7w+2z
 HUxOyJbg21JFBfhV+goQTxjIo5NrInHYVv9nzYoLGsRkAsBCkCdFiIvt8
 dgD2IfWsdvRQS6QVC4+/oA0fOsTTomdP1IoJzn+qX5yL/rixnK0J/pJic
 LMcQzW7AiIraUF8eOEEifkJGRqO1sgdGt7Q1+TR/tzB9jSrOxHOh53kI/
 kXLvf1fQJtzVXQhP4UqNU4dPjpthmYQLmRecfvU/UgktJgA3obXuIpP9p Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="355626145"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="355626145"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807733572"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; d="scan'208";a="807733572"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 14:28:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/4] drm/i915/pvc: Annotate two more workaround/tuning
 registers as MCR
Date: Wed,  1 Feb 2023 14:28:28 -0800
Message-Id: <20230201222831.608281-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.1
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

XEHPC_LNCFMISCCFGREG0 and XEHPC_L3SCRUB are both in MCR register ranges
on PVC (with HALFBSLICE and L3BANK replication respectively), so they
should be explicitly declared as MCR registers and use MCR-aware
workaround handlers.

The workarounds/tuning settings should still be applied properly on PVC
even without the MCR annotation, but readback verification on
CONFIG_DRM_I915_DEBUG_GEM builds could potentitally give false positive
"workaround lost on load" warnings on parts fused such that a unicast
read targets a terminated register instance.

Fixes: a9e69428b1b4 ("drm/i915: Define MCR registers explicitly")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 7fa18a3b3957..928698c621e5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -979,7 +979,7 @@
 #define   GEN7_WA_FOR_GEN7_L3_CONTROL		0x3C47FF8C
 #define   GEN7_L3AGDIS				(1 << 19)
 
-#define XEHPC_LNCFMISCCFGREG0			_MMIO(0xb01c)
+#define XEHPC_LNCFMISCCFGREG0			MCR_REG(0xb01c)
 #define   XEHPC_HOSTCACHEEN			REG_BIT(1)
 #define   XEHPC_OVRLSCCC			REG_BIT(0)
 
@@ -1042,7 +1042,7 @@
 #define XEHP_L3SCQREG7				MCR_REG(0xb188)
 #define   BLEND_FILL_CACHING_OPT_DIS		REG_BIT(3)
 
-#define XEHPC_L3SCRUB				_MMIO(0xb18c)
+#define XEHPC_L3SCRUB				MCR_REG(0xb18c)
 #define   SCRUB_CL_DWNGRADE_SHARED		REG_BIT(12)
 #define   SCRUB_RATE_PER_BANK_MASK		REG_GENMASK(2, 0)
 #define   SCRUB_RATE_4B_PER_CLK			REG_FIELD_PREP(SCRUB_RATE_PER_BANK_MASK, 0x6)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 29718d0595f4..f45ca3d4a07c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -240,6 +240,12 @@ wa_write(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 	wa_write_clr_set(wal, reg, ~0, set);
 }
 
+static void
+wa_mcr_write(struct i915_wa_list *wal, i915_mcr_reg_t reg, u32 set)
+{
+	wa_mcr_write_clr_set(wal, reg, ~0, set);
+}
+
 static void
 wa_write_or(struct i915_wa_list *wal, i915_reg_t reg, u32 set)
 {
@@ -2892,9 +2898,9 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 				   struct i915_wa_list *wal)
 {
 	if (IS_PONTEVECCHIO(i915)) {
-		wa_write(wal, XEHPC_L3SCRUB,
+		wa_mcr_write(wal, XEHPC_L3SCRUB,
 			 SCRUB_CL_DWNGRADE_SHARED | SCRUB_RATE_4B_PER_CLK);
-		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
+		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_HOSTCACHEEN);
 	}
 
 	if (IS_DG2(i915)) {
@@ -2984,7 +2990,7 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 
 	if (IS_PONTEVECCHIO(i915)) {
 		/* Wa_16016694945 */
-		wa_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
+		wa_mcr_masked_en(wal, XEHPC_LNCFMISCCFGREG0, XEHPC_OVRLSCCC);
 	}
 
 	if (IS_XEHPSDV(i915)) {
-- 
2.39.1

