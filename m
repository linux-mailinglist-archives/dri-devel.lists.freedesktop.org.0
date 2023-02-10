Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD34A6915C5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 01:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34C110EC2A;
	Fri, 10 Feb 2023 00:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5912A10EC15;
 Fri, 10 Feb 2023 00:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675989733; x=1707525733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4jIM+rAvkJsfNZoozqXpV3F6jtWvzuAhTZfKZs20pEs=;
 b=Gn7u32p4xuStHHeQcUc75dtiYSF2AC8ibPtxSPcvX8eldb/r8O2juDI+
 +EQpfEe1OIV85UGyA0rvVaLqbRg4inZdWVGtXAYJk4dCF9SI7PXyNv4Iw
 HGXgnN9GZgEnpwAu+MWiTe5lVynyWbWYpM+F+6fuI/aHqB/OgSsYn71er
 nENjG3fYIRIQ4WENMdTkG2V0XYgdV/dW26uZcNMVwK9xA7bgSfPNsSj+A
 Pe6Cx+JWTonOfuPYhS4U9xlS4OFKebl/WCIHPoEEdymDiisbAuI+SCCsL
 gxxu/2F7z3QwsoHjN/XfdVWyiL8dt2kac+I6uJ7UzzJlu55ydVF1EKKYB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="327990105"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="327990105"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 16:42:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="913342499"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; d="scan'208";a="913342499"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 09 Feb 2023 16:42:12 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 6/8] drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
Date: Thu,  9 Feb 2023 16:42:07 -0800
Message-Id: <20230210004209.1877143-7-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
References: <20230210004209.1877143-1-alan.previn.teres.alexis@intel.com>
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

Despite KCR subsystem being in the media-tile (close to the
GSC-CS), the IRQ controls for it are on GT-0 with other global
IRQ controls. Thus, add a helper for KCR hw interrupt
enable/disable functions to get the correct gt structure (for
uncore) for MTL.

In the helper, we get GT-0's handle for uncore when touching
IRQ registers despite the pxp->ctrl_gt being the media-tile.
No difference for legacy of course.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c     | 24 +++++++++++++++++---
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h     |  8 +++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

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
index 91e9622c07d0..3a725397349f 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.c
@@ -4,10 +4,12 @@
  */
 #include <linux/workqueue.h>
 
+#include "gt/intel_gt.h"
 #include "gt/intel_gt_irq.h"
 #include "gt/intel_gt_regs.h"
 #include "gt/intel_gt_types.h"
 
+#include "i915_drv.h"
 #include "i915_irq.h"
 #include "i915_reg.h"
 
@@ -17,6 +19,22 @@
 #include "intel_pxp_types.h"
 #include "intel_runtime_pm.h"
 
+/**
+ * intel_pxp_get_irq_gt - Find the correct GT that owns KCR interrupts
+ * @pxp: pointer to pxp struct
+ *
+ * For platforms with a single GT, we return the pxp->ctrl_gt (as expected)
+ * but for MTL+ that has a media-tile, although the KCR engine is in the
+ * media-tile (i.e. pxp->ctrl_gt), the IRQ controls are on the root tile.
+ * In the end, we don't use pxp->ctrl_gt for IRQ, we always return root gt.
+ */
+struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
+{
+	WARN_ON_ONCE(!pxp->ctrl_gt->i915->media_gt && !gt_is_root(pxp->ctrl_gt));
+
+	return to_gt(pxp->ctrl_gt->i915);
+}
+
 /**
  * intel_pxp_irq_handler - Handles PXP interrupts.
  * @pxp: pointer to pxp struct
@@ -29,7 +47,7 @@ void intel_pxp_irq_handler(struct intel_pxp *pxp, u16 iir)
 	if (GEM_WARN_ON(!intel_pxp_is_enabled(pxp)))
 		return;
 
-	gt = pxp->ctrl_gt;
+	gt = intel_pxp_get_irq_gt(pxp);
 
 	lockdep_assert_held(gt->irq_lock);
 
@@ -68,7 +86,7 @@ static inline void pxp_irq_reset(struct intel_gt *gt)
 
 void intel_pxp_irq_enable(struct intel_pxp *pxp)
 {
-	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
 
 	spin_lock_irq(gt->irq_lock);
 
@@ -83,7 +101,7 @@ void intel_pxp_irq_enable(struct intel_pxp *pxp)
 
 void intel_pxp_irq_disable(struct intel_pxp *pxp)
 {
-	struct intel_gt *gt = pxp->ctrl_gt;
+	struct intel_gt *gt = intel_pxp_get_irq_gt(pxp);
 
 	/*
 	 * We always need to submit a global termination when we re-enable the
diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h b/drivers/gpu/drm/i915/pxp/intel_pxp_irq.h
index 8c292dc86f68..eea87c9eb62b 100644
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
+static inline struct intel_gt *intel_pxp_get_irq_gt(struct intel_pxp *pxp)
+{
+	return NULL;
+}
 #endif
 
 #endif /* __INTEL_PXP_IRQ_H__ */
-- 
2.39.0

