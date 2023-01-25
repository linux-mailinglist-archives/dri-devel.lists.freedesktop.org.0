Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF5967A84E
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 02:14:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49BDD10E299;
	Wed, 25 Jan 2023 01:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B0110E0C1;
 Wed, 25 Jan 2023 01:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674609262; x=1706145262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DgiJNpBTvIKH7d5LRU7o8E5QvHYfF593tUY1QSma35c=;
 b=NQzzSL5JhxBOftrV2sIAm0xKGw37Nw5CioWI53rQ8mlaOA+dsBuy2nkQ
 e1SKAVNgFhDfLZfGUVI2yNwBuEe4QWqjni9NfkYlb92khftpM1UeHsq9s
 gAM3AYHHGQn2ZkUYF6vhGd9eApeXcJYApZB9AGKQUtC6202eInHZa6BEc
 7pXaJ77ips8+ZDBkdEMFEahm/5GZo49w6ivNF6nFbZM+KMB0pJ730caPy
 LMfGpbscYXXNXjKcciZg+ZAKCixZxKHsjK5HL/zeDDmdc1ldaRzbN38Bj
 cKypziaGDrZmt9YEypSlsnpdi7JxY2+7TyTFR/LkHpgpRHtZmb60B9viT Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="353735857"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="353735857"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:14:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="655630616"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; d="scan'208";a="655630616"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 17:14:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915/xehp: Annotate a couple more workaround
 registers as MCR
Date: Tue, 24 Jan 2023 17:14:07 -0800
Message-Id: <20230125011407.2821808-2-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230125011407.2821808-1-matthew.d.roper@intel.com>
References: <20230125011407.2821808-1-matthew.d.roper@intel.com>
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
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4a37d048b512..a0ebf3fa63ca 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1105,12 +1105,12 @@
 #define VEBX_MOD_CTRL				MCR_REG(0xcf38)
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
index 0e7f64bb2860..94eb498f3c2c 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -1570,8 +1570,8 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_or(wal, XEHP_MERT_MOD_CTRL, FORCE_MISS_FTLB);
 
 	/* Wa_14014368820:xehpsdv */
-	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
-		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
+	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
+			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
@@ -1665,10 +1665,10 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
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
@@ -1691,8 +1691,8 @@ dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
 	wa_mcr_write_or(wal, VEBX_MOD_CTRL, FORCE_MISS_FTLB);
 
 	/* Wa_1509235366:dg2 */
-	wa_write_or(wal, GEN12_GAMCNTRL_CTRL,
-		    INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
+	wa_mcr_write_or(wal, XEHP_GAMCNTRL_CTRL,
+			INVALIDATION_BROADCAST_MODE_DIS | GLOBAL_INVALIDATION_MODE);
 }
 
 static void
-- 
2.39.0

