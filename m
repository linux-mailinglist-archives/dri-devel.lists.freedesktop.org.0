Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8617A4C9910
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 00:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE7410E838;
	Tue,  1 Mar 2022 23:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0910E7BB;
 Tue,  1 Mar 2022 23:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646176588; x=1677712588;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dOqmwGZeesPjMaaW2cJ1lodCCEN/QQ3RKG8iDcgeLnk=;
 b=FSmlsCJyXuCGLCh9ufZo16Uq+ejD7nOOROZyiZwijTEHba5GQUj5un4I
 //FVa49s9oM3w4KHCbCU763paEc1MhXXZaAu3Db/x+pYEEdLO6/M6eAGg
 5Z0G8V+a/vcqrrrHdjsk4gfjzQQ4A5vUPDciAZFqfJmmpM90H1X0HMhQF
 ZZyQP4gq3bAWcrekiqvCz7Ov7VYvE52n8DNnKPH7gaqcDEXNALFV/+QgU
 JupD2RIY5bY4URM0GjJO0e2wo0f7tbrEsY9+Tr/iHUsl6lKwU8BrMld3T
 dsx6W4+kVH8cY1Is23HP//XQmjpYyavy7KXlbMxFBaGev2fjqxo8lRymN g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="316479058"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="316479058"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="709253469"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 15:16:27 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 06/13] drm/i915: Move context descriptor fields to
 intel_lrc.h
Date: Tue,  1 Mar 2022 15:15:42 -0800
Message-Id: <20220301231549.1817978-7-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301231549.1817978-1-matthew.d.roper@intel.com>
References: <20220301231549.1817978-1-matthew.d.roper@intel.com>
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

This is a more appropriate header for these definitions.

v2:
 - Cleanup whitespace. (Lucas)

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
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
index 0b76f096b559..bb0e6c5b9922 100644
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
+#define CTX_GTT_ADDRESS_MASK			GENMASK(31, 12)
+#define GEN8_CTX_VALID				(1 << 0)
+#define GEN8_CTX_FORCE_PD_RESTORE		(1 << 1)
+#define GEN8_CTX_FORCE_RESTORE			(1 << 2)
+#define GEN8_CTX_L3LLC_COHERENT			(1 << 5)
+#define GEN8_CTX_PRIVILEGE			(1 << 8)
+#define GEN8_CTX_ADDRESSING_MODE_SHIFT		3
+#define GEN8_CTX_ID_SHIFT			32
+#define GEN8_CTX_ID_WIDTH			21
+#define GEN11_SW_CTX_ID_SHIFT			37
+#define GEN11_SW_CTX_ID_WIDTH			11
+#define GEN11_ENGINE_CLASS_SHIFT		61
+#define GEN11_ENGINE_CLASS_WIDTH		3
+#define GEN11_ENGINE_INSTANCE_SHIFT		48
+#define GEN11_ENGINE_INSTANCE_WIDTH		6
+#define XEHP_SW_CTX_ID_SHIFT			39
+#define XEHP_SW_CTX_ID_WIDTH			16
+#define XEHP_SW_COUNTER_SHIFT			58
+#define XEHP_SW_COUNTER_WIDTH			6
+
 #endif /* __INTEL_LRC_H__ */
-- 
2.34.1

