Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5867C113
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 00:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6E10E3B0;
	Wed, 25 Jan 2023 23:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A1910E3B3;
 Wed, 25 Jan 2023 23:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674690147; x=1706226147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZUYcDKoybZLHnOIVtA5q8w3BQkRkZvPDFZdMdmJ88Zw=;
 b=CuS5cIhYISFYcTx9yaF2eybTN4cdNwGbrea0mzX/QkkqUKcH4X8RxjJ9
 gMJvkulmLwZM7RMfMAUtkdBrMA5QCJMlprYgpi73woZvCH4NOWih2+hs8
 OnKoVek8BuhFrCqp38q3B21Yn/LL+WEP+5+sByWG1kPRfFVqtvioFWcKJ
 T+MIMjFWCfdNAba/dmKOsnJPfuJJcszBDdh/kLCMMwJt/DYqw/qAjG/cB
 wlBwXLgHGu0CGiifTMq22TzDtPaM9/a6eKy9NmECMvtLL9QoqAFvEEfw7
 OndlM3brDvgF+95QzHS+AIRzBTeTAZz06TkeeMW4tKQFOzNsiLSTw/5jk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="326739599"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="326739599"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="655987405"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="655987405"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 15:42:13 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/i915/xehp: Annotate a couple more workaround
 registers as MCR
Date: Wed, 25 Jan 2023 15:41:59 -0800
Message-Id: <20230125234159.3015385-3-matthew.d.roper@intel.com>
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

GAMSTLB_CTRL and GAMCNTRL_CTRL became multicast/replicated registers on
Xe_HP.  They should be defined accordingly and use MCR-aware operations.

These registers have only been used for some dg2/xehpsdv workarounds, so
this fix is mostly just for consistency/future-proofing; even lacking
the MCR annotation, workarounds will always be properly applied in a
multicast manner on these platforms.

Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Fixes: 58bc2453ab8a ("drm/i915: Define multicast registers as a new type")
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 310bdde049ab..7fa18a3b3957 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1107,12 +1107,12 @@
 #define XELPMP_VEBX_MOD_CTRL			_MMIO(0xcf38)
 #define   FORCE_MISS_FTLB			REG_BIT(3)
 
-#define GEN12_GAMSTLB_CTRL			_MMIO(0xcf4c)
+#define XEHP_GAMSTLB_CTRL			MCR_REG(0xcf4c)
 #define   CONTROL_BLOCK_CLKGATE_DIS		REG_BIT(12)
 #define   EGRESS_BLOCK_CLKGATE_DIS		REG_BIT(11)
 #define   TAG_BLOCK_CLKGATE_DIS			REG_BIT(7)
 
-#define GEN12_GAMCNTRL_CTRL			_MMIO(0xcf54)
+#define XEHP_GAMCNTRL_CTRL			MCR_REG(0xcf54)
 #define   INVALIDATION_BROADCAST_MODE_DIS	REG_BIT(12)
 #define   GLOBAL_INVALIDATION_MODE		REG_BIT(2)
 
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 4c978abf3e2a..3111df350f57 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1564,8 +1564,8 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 
 	/* Wa_14014368820:xehpsdv */
-	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
-		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
+	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
+			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1659,10 +1659,10 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 		wa_mcr_write_or(wal, SSMCGCTL9530, RTFUNIT_CLKGATE_DIS);
 
 		/* Wa_14010680813:dg2_g10 */
-		wa_write_or(wal, GEN12_GAMSTLB_CTRL,
-			    CONTROL_BLOCK_CLKGATE_DIS |
-			    EGRESS_BLOCK_CLKGATE_DIS |
-			    TAG_BLOCK_CLKGATE_DIS);
+		wa_mcr_write_or(wal, XEHP_GAMSTLB_CTRL,
+				CONTROL_BLOCK_CLKGATE_DIS |
+				EGRESS_BLOCK_CLKGATE_DIS |
+				TAG_BLOCK_CLKGATE_DIS);
 	}
 
 	/* Wa_14014830051:dg2 */
@@ -1685,8 +1685,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_or(wal, XEHP_VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 
 	/* Wa_1509235366:dg2 */
-	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
-		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
+	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
+			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
-- 
2.39.1

