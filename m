Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E77C24C7440
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 18:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE9010E86D;
	Mon, 28 Feb 2022 17:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300D10E571;
 Mon, 28 Feb 2022 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646070186; x=1677606186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OgKmQuF/b0zPOGnQGy0v1E9/MMMYX/iy1h3LsAXPZ8E=;
 b=O1uzH1/aR1FoD5TF8B4XBeknKGTl+zFPcRiAIFeNX8uAzTy2uS59/4TV
 4yxzLpClBbBwZIH0Pe/vsiBkv2dCyDIp53wQZ1ZrTWtqzUE2sxRZPsFq0
 ZrCby8BugujmQXtvoBohPBzeLt0RThviHLRlVctDYX4Gn1qlI3ZC5M9Fu
 unnru9NrTVZk3fUcObP/RxnqEer/f80VbB/z3KNMpCkFYVuEtNEZGbbM9
 oeikdQNYY/pOut+hnHYiaKdCJcBkVNWWqYxsr2iX6EpKHtl5ilNflRjDQ
 wwo6ew3ivE/mNBgehvzUpCrXm7qLoc4kB1saDC1tn0Y401FBxyGXMvuK7 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="232913188"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="232913188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575392833"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 09:43:04 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/13] drm/i915: Move context descriptor fields to
 intel_lrc.h
Date: Mon, 28 Feb 2022 09:42:38 -0800
Message-Id: <20220228174245.1569581-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220228174245.1569581-1-matthew.d.roper@intel.com>
References: <20220228174245.1569581-1-matthew.d.roper@intel.com>
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

This is a more appropriate header for these definitions.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_regs.h   | 34 -----------------------
 drivers/gpu/drm/i915/gt/intel_lrc.h       | 34 +++++++++++++++++++++++
 3 files changed, 35 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index edba18c942cf..b0982a9e4476 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -21,6 +21,7 @@
 #include "intel_gt.h"
 #include "intel_gt_requests.h"
 #include "intel_gt_pm.h"
+#include "intel_lrc.h"
 #include "intel_lrc_reg.h"
 #include "intel_reset.h"
 #include "intel_ring.h"
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 69b826a3c381..84f189738a68 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1499,38 +1499,4 @@
 
 #define GEN12_SFC_DONE(n)			_MMIO(0x1cc000 + (n) * 0x1000)
 
-enum {
-	INTEL_ADVANCED_CONTEXT = 0,
-	INTEL_LEGACY_32B_CONTEXT,
-	INTEL_ADVANCED_AD_CONTEXT,
-	INTEL_LEGACY_64B_CONTEXT
-};
-
-enum {
-	FAULT_AND_HANG = 0,
-	FAULT_AND_HALT, /* Debug only */
-	FAULT_AND_STREAM,
-	FAULT_AND_CONTINUE /* Unsupported */
-};
-
-#define   CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)
-#define   GEN8_CTX_VALID			(1 << 0)
-#define   GEN8_CTX_FORCE_PD_RESTORE		(1 << 1)
-#define   GEN8_CTX_FORCE_RESTORE		(1 << 2)
-#define   GEN8_CTX_L3LLC_COHERENT		(1 << 5)
-#define   GEN8_CTX_PRIVILEGE			(1 << 8)
-#define   GEN8_CTX_ADDRESSING_MODE_SHIFT	3
-#define   GEN8_CTX_ID_SHIFT			32
-#define   GEN8_CTX_ID_WIDTH			21
-#define   GEN11_SW_CTX_ID_SHIFT			37
-#define   GEN11_SW_CTX_ID_WIDTH			11
-#define   GEN11_ENGINE_CLASS_SHIFT		61
-#define   GEN11_ENGINE_CLASS_WIDTH		3
-#define   GEN11_ENGINE_INSTANCE_SHIFT		48
-#define   GEN11_ENGINE_INSTANCE_WIDTH		6
-#define   XEHP_SW_CTX_ID_SHIFT			39
-#define   XEHP_SW_CTX_ID_WIDTH			16
-#define   XEHP_SW_COUNTER_SHIFT			58
-#define   XEHP_SW_COUNTER_WIDTH			6
-
 #endif /* __INTEL_GT_REGS__ */
diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.h b/drivers/gpu/drm/i915/gt/intel_lrc.h
index 0b76f096b559..820f8f41fc1f 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.h
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.h
@@ -69,4 +69,38 @@ void lrc_check_regs(const struct intel_context *ce,
 
 void lrc_update_runtime(struct intel_context *ce);
 
+enum {
+	INTEL_ADVANCED_CONTEXT = 0,
+	INTEL_LEGACY_32B_CONTEXT,
+	INTEL_ADVANCED_AD_CONTEXT,
+	INTEL_LEGACY_64B_CONTEXT
+};
+
+enum {
+	FAULT_AND_HANG = 0,
+	FAULT_AND_HALT, /* Debug only */
+	FAULT_AND_STREAM,
+	FAULT_AND_CONTINUE /* Unsupported */
+};
+
+#define   CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)
+#define   GEN8_CTX_VALID			(1 << 0)
+#define   GEN8_CTX_FORCE_PD_RESTORE		(1 << 1)
+#define   GEN8_CTX_FORCE_RESTORE		(1 << 2)
+#define   GEN8_CTX_L3LLC_COHERENT		(1 << 5)
+#define   GEN8_CTX_PRIVILEGE			(1 << 8)
+#define   GEN8_CTX_ADDRESSING_MODE_SHIFT	3
+#define   GEN8_CTX_ID_SHIFT			32
+#define   GEN8_CTX_ID_WIDTH			21
+#define   GEN11_SW_CTX_ID_SHIFT			37
+#define   GEN11_SW_CTX_ID_WIDTH			11
+#define   GEN11_ENGINE_CLASS_SHIFT		61
+#define   GEN11_ENGINE_CLASS_WIDTH		3
+#define   GEN11_ENGINE_INSTANCE_SHIFT		48
+#define   GEN11_ENGINE_INSTANCE_WIDTH		6
+#define   XEHP_SW_CTX_ID_SHIFT			39
+#define   XEHP_SW_CTX_ID_WIDTH			16
+#define   XEHP_SW_COUNTER_SHIFT			58
+#define   XEHP_SW_COUNTER_WIDTH			6
+
 #endif /* __INTEL_LRC_H__ */
-- 
2.34.1

