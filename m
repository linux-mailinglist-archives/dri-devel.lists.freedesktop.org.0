Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B07F6650C3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:57:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F03910E6C5;
	Wed, 11 Jan 2023 00:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E6210E065;
 Wed, 11 Jan 2023 00:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673398614; x=1704934614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VeSuKaRtq2zgVvizWh1CKvh/fjXeVsukuAWfPM/SmXc=;
 b=GLxX/tptnVsez4kgbAYqydDH0qk4dwasnf5uSVb1gYTmoAhz9yeo1oVc
 mtBxgqFG0aQNVv+dMz5tGzAn6CGQooYivrQGAoH27V7QaYyBoCyEXoxGX
 0gx4P99WKTe/luHmQ+7dg72uW3DbO2UV+C1YfgTzenlY6rERpGdGPizgh
 8rs816RF2+BNGFri/Y24iuNUNlBIipoJDeEHgg5sKHRI48h8op3kYjhav
 kNRfq6NY2kJADKBO9eAy3y6tUgJaWLl5fy0wCSRlLJ5KOPxfY40aICNn1
 98tc5C5kVRxDeM+hzytN024OqBT0fudsWqEhyehl55zhgVLy6UYIpUfJR g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325307101"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="325307101"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 16:56:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831175669"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="831175669"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 16:56:53 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915/pxp: MTL-KCR is in media-tile but IRQ-ctrl's in
 root
Date: Tue, 10 Jan 2023 16:56:39 -0800
Message-Id: <20230111005642.300761-10-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
References: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper for KCR hw interrupt enable/disable functions.
For MTL onwards, it will get the GT-0's handle including the
uncore fw bits and use that despite the pxp->ctrl_gt being
the media-tile. No difference for legacy of course.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 23 +++++++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     |  8 +++++++
 3 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
index 4b8e70caa3ad..9f6e300486b4 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c
@@ -44,7 +44,7 @@ static int pxp_terminate_get(void *data, u64 *val)
 static int pxp_terminate_set(void *data, u64 val)
 {
 	struct intel_pxp *pxp = data;
-	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
 
 	if (!intel_pxp_is_active(pxp))
 		return -ENODEV;
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
index 91e9622c07d0..2eef0c19e91a 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -8,6 +8,7 @@
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_gt_types.h"
 
+#include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
 
@@ -17,6 +18,22 @@
 #include "intel_pxp_types.h"
 #include "intel_runtime_pm.h"
 
+/**
+ * intel_pxp_get_irq_gt - Find the correct GT that owns KCR interrupts
+ * @pxp: pointer to pxp struct
+ *
+ * For platforms with a single GT, we return the pxp->ctrl_gt (as expected)
+ * but for MTL+ that has a media-tile, although the KCR engine is in the
+ * media-tile (i.e. pxp->ctrl_gt), the IRQ controls are on the root tile.
+ */
+struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
+{
+	if (pxp->uses_gsccs)
+		return to_gt(pxp->ctrl_gt->i915);
+
+	return pxp->ctrl_gt;
+}
+
 /**
  * intel_pxp_irq_handler - Handles PXP interrupts.
  * @pxp: pointer to pxp struct
@@ -29,7 +46,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
 		return;
 
-	gt = pxp->ctrl_gt;
+	gt = intel_pxp_get_irq_gt(pxp);
 
 	lockdep_assert_held(gt->irq_lock);
 
@@ -68,7 +85,7 @@ static inline void pxp_irq_reset(struct intel_gt *gt)
 
 void intel_pxp_irq_enable(struct intel_pxp *pxp)
 {
-	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -83,7 +100,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
 
 void intel_pxp_irq_disable(struct intel_pxp *pxp)
 {
-	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
 
 	/*
 	 * We always need to submit a global termination when we re-enable the
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
index 8c292dc86f68..117159e19e94 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct intel_pxp;
+struct intel_gt;
 
 #define GEN12_DISPLAY_PXP_STATE_TERMINATED_INTERRUPT BIT(1)
 #define GEN12_DISPLAY_APP_TERMINATED_PER_FW_REQ_INTERRUPT BIT(2)
@@ -23,6 +24,8 @@ struct intel_pxp;
 void intel_pxp_irq_enable(struct intel_pxp *pxp);
 void intel_pxp_irq_disable(struct intel_pxp *pxp);
 void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir);
+struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp);
+
 #else
 static inline void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 {
@@ -35,6 +38,11 @@ static inline void intel_pxp_irq_enable(struct intel_pxp *pxp)
 static inline void intel_pxp_irq_disable(struct intel_pxp *pxp)
 {
 }
+
+struct intel_gt *gt intel_pxp_get_irq_gt(struct intel_pxp *pxp)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __INTEL_PXP_IRQ_H__ */
-- 
2.39.0

