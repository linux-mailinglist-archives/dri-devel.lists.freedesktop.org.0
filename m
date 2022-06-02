Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88C853C15D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 01:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 740E510E463;
	Thu,  2 Jun 2022 23:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2B210E3E5;
 Thu,  2 Jun 2022 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654213247; x=1685749247;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=feZTqGuDT9rTAFa/TB++Je1RG41+SkXjAVWFlTBu09U=;
 b=emlRAghWDdlCzWkP/CZTac75kkfPlnIzioEybLDya4KRfMHxT7v698mB
 2weQ2zxj7eCgdR2Xz++ggjAaESNNRTgqX7gUTHBRDZo6QkqEvHO+UbwjT
 89a0EwVVQXPZGNM4yB0nfGHHmyQBJsX+zxVETOJVevoKehNDpyZQ+FCA6
 wWG2C0ZSSv1zMkV/u9SgrhgmlrHFISJoPSc2dGqVwy6tuArXxvlCDnJFM
 8faJ+QQgv52FudkZuTC0TbTdwHPVPlwBg26FiuQc2yixuI55IiDD6Zq27
 MZPCkALWYGvy9r/EtdPSvJEJ0oTJFqYI8lamX75bq3hxVfwn5ou2dc0Bo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="274919402"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="274919402"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 16:40:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="553084101"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 16:40:43 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pvc: Add Wa_16015675438:pvc
Date: Thu,  2 Jun 2022 16:40:41 -0700
Message-Id: <20220602234041.1674691-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Stuart Summers <stuart.summers@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Badal Nilawar <badal.nilawar@intel.com>

Even though PVC doesn't have an RCS engine, this workaround updates a
register in the 0x2xxx range that traditionally belongs to the RCS.  We
need to set a special flag to tell the GuC that the presence of an "RCS"
register on a CCS save/restore list is okay/expected.

Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 1 +
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 5 +++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 4 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
 4 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 6aa1ceaa8d27..1986579b18ba 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -140,6 +140,7 @@
 #define FF_SLICE_CS_CHICKEN2			_MMIO(0x20e4)
 #define   GEN9_TSG_BARRIER_ACK_DISABLE		(1 << 8)
 #define   GEN9_POOLED_EU_LOAD_BALANCING_FIX_DISABLE	(1 << 10)
+#define   GEN12_PERF_FIX_BALANCING_CFE_DISABLE	REG_BIT(15)
 
 #define GEN9_CS_DEBUG_MODE1			_MMIO(0x20ec)
 #define   FF_DOP_CLOCK_GATE_DISABLE		REG_BIT(1)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 6e875d4f5f65..eb0598593724 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2698,6 +2698,11 @@ general_render_compute_wa_init(struct intel_engine_cs *engine, struct i915_wa_li
 		/* Wa_22014226127:dg2,pvc */
 		wa_write_or(wal, LSC_CHICKEN_BIT_0, DISABLE_D8_D16_COASLESCE);
 	}
+
+	/* Wa_16015675438:pvc */
+	if (IS_PVC_BD_STEP(i915, STEP_B0, STEP_FOREVER))
+		wa_masked_en(wal, FF_SLICE_CS_CHICKEN2,
+			     GEN12_PERF_FIX_BALANCING_CFE_DISABLE);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2c4ad4a65089..7043cf5a666a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -327,6 +327,10 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	    IS_DG2_GRAPHICS_STEP(gt->i915, G11, STEP_A0, STEP_FOREVER))
 		flags |= GUC_WA_CONTEXT_ISOLATION;
 
+	/* Wa_16015675438:pvc */
+	if (IS_PVC_BD_STEP(gt->i915, STEP_B0, STEP_FOREVER))
+		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index 42cb7a9a6199..b3c9a9327f76 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -105,6 +105,7 @@
 #define   GUC_WA_PRE_PARSER		BIT(14)
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
+#define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
-- 
2.35.3

