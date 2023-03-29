Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4136CF002
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 18:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B8710EBBB;
	Wed, 29 Mar 2023 16:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6910EB9D;
 Wed, 29 Mar 2023 16:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680109041; x=1711645041;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b8XNHwHE2BAm8cY7ERpNH8Jhao34rWtfV5hKc5z9ZyQ=;
 b=UWK4cQU2HLgEqFd1zJCxC6t3kyxgUnwj8ZVvMOnMuXWOivgsrFMBUsm5
 JRenV9s4TtMNuS5m+Mlnx6i+fNgPxAGtT9w2PA5+xyFxxydKcJ11OlL5t
 CXM50v0XvYSSPF5Y2u8VH4PUzVptd56kP/X9pA2uiTG4fiTmb6XODVr36
 Oh+2KM0IMuEjBtn14uwq12mJxLd6uAWWoR7l6W1x4fj8z01O41uetKYTR
 l0osq1XIWGZCas5sYPutVuKSP5gn37GEen+noIES84++CcSjGyTRqoLb0
 jVwq5AmOxflVctFV/swUGUHEY2w7GYt4Cr5S9Jkf7SzWhMmJ7fImUlse6 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="342543348"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="342543348"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748843633"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="748843633"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 09:57:20 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/gsc: add support for GSC proxy interrupt
Date: Wed, 29 Mar 2023 09:56:58 -0700
Message-Id: <20230329165658.2686549-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
References: <20230329165658.2686549-1-daniele.ceraolospurio@intel.com>
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
Cc: suraj.kandpal@intel.com, alan.previn.teres.alexis@intel.com,
 gregkh@linuxfoundation.org, alexander.usyskin@intel.com,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GSC notifies us of a proxy request via the HECI2 interrupt. The
interrupt must be enabled both in the HECI layer and in our usual gt irq
programming; for the latter, the interrupt is enabled via the same enable
register as the GSC CS, but it does have its own mask register. When the
interrupt is received, we also need to de-assert it in both layers.

The handling of the proxy request is deferred to the same worker that we
use for GSC load. New flags have been added to distinguish between the
init case and the proxy interrupt.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_irq.c       | 22 ++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  3 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c | 44 +++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h |  1 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c    | 44 ++++++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h    |  3 ++
 6 files changed, 103 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_irq.c b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
index 1b25a6039152..c433ffdb3380 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_irq.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_irq.c
@@ -15,6 +15,7 @@
 #include "intel_uncore.h"
 #include "intel_rps.h"
 #include "pxp/intel_pxp_irq.h"
+#include "uc/intel_gsc_proxy.h"
 
 static void guc_irq_handler(struct intel_guc *guc, u16 iir)
 {
@@ -81,6 +82,9 @@ gen11_other_irq_handler(struct intel_gt *gt, const u8 instance,
 	if (instance == OTHER_GSC_INSTANCE)
 		return intel_gsc_irq_handler(gt, iir);
 
+	if (instance == OTHER_GSC_HECI_2_INSTANCE)
+		return intel_gsc_proxy_irq_handler(&gt->uc.gsc, iir);
+
 	WARN_ONCE(1, "unhandled other interrupt instance=0x%x, iir=0x%x\n",
 		  instance, iir);
 }
@@ -100,6 +104,8 @@ static struct intel_gt *pick_gt(struct intel_gt *gt, u8 class, u8 instance)
 	case VIDEO_ENHANCEMENT_CLASS:
 		return media_gt;
 	case OTHER_CLASS:
+		if (instance == OTHER_GSC_HECI_2_INSTANCE)
+			return media_gt;
 		if (instance == OTHER_GSC_INSTANCE && HAS_ENGINE(media_gt, GSC0))
 			return media_gt;
 		fallthrough;
@@ -256,6 +262,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	u32 irqs = GT_RENDER_USER_INTERRUPT;
 	u32 guc_mask = intel_uc_wants_guc(&gt->uc) ? GUC_INTR_GUC2HOST : 0;
 	u32 gsc_mask = 0;
+	u32 heci_mask = 0;
 	u32 dmask;
 	u32 smask;
 
@@ -267,10 +274,16 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	dmask = irqs << 16 | irqs;
 	smask = irqs << 16;
 
-	if (HAS_ENGINE(gt, GSC0))
+	if (HAS_ENGINE(gt, GSC0)) {
+		/*
+		 * the heci2 interrupt is enabled via the same register as the
+		 * GSC interrupt, but it has its own mask register.
+		 */
 		gsc_mask = irqs;
-	else if (HAS_HECI_GSC(gt->i915))
+		heci_mask = GSC_IRQ_INTF(1); /* HECI2 IRQ for SW Proxy*/
+	} else if (HAS_HECI_GSC(gt->i915)) {
 		gsc_mask = GSC_IRQ_INTF(0) | GSC_IRQ_INTF(1);
+	}
 
 	BUILD_BUG_ON(irqs & 0xffff0000);
 
@@ -280,7 +293,7 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 	if (CCS_MASK(gt))
 		intel_uncore_write(uncore, GEN12_CCS_RSVD_INTR_ENABLE, smask);
 	if (gsc_mask)
-		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask);
+		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_ENABLE, gsc_mask | heci_mask);
 
 	/* Unmask irqs on RCS, BCS, VCS and VECS engines. */
 	intel_uncore_write(uncore, GEN11_RCS0_RSVD_INTR_MASK, ~smask);
@@ -308,6 +321,9 @@ void gen11_gt_irq_postinstall(struct intel_gt *gt)
 		intel_uncore_write(uncore, GEN12_CCS2_CCS3_INTR_MASK, ~dmask);
 	if (gsc_mask)
 		intel_uncore_write(uncore, GEN11_GUNIT_CSME_INTR_MASK, ~gsc_mask);
+	if (heci_mask)
+		intel_uncore_write(uncore, GEN11_HECI2_RSVD_INTR_MASK,
+				   ~REG_FIELD_PREP(ENGINE1_MASK, heci_mask));
 
 	if (guc_mask) {
 		/* the enable bit is common for both GTs but the masks are separate */
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 4aecb5a7b631..da11ce5ca99e 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1577,6 +1577,7 @@
 
 #define GEN11_GT_INTR_DW(x)			_MMIO(0x190018 + ((x) * 4))
 #define   GEN11_CSME				(31)
+#define   GEN12_HECI_2				(30)
 #define   GEN11_GUNIT				(28)
 #define   GEN11_GUC				(25)
 #define   MTL_MGUC				(24)
@@ -1618,6 +1619,7 @@
 /* irq instances for OTHER_CLASS */
 #define   OTHER_GUC_INSTANCE			0
 #define   OTHER_GTPM_INSTANCE			1
+#define   OTHER_GSC_HECI_2_INSTANCE		3
 #define   OTHER_KCR_INSTANCE			4
 #define   OTHER_GSC_INSTANCE			6
 #define   OTHER_MEDIA_GUC_INSTANCE		16
@@ -1633,6 +1635,7 @@
 #define GEN12_VCS6_VCS7_INTR_MASK		_MMIO(0x1900b4)
 #define GEN11_VECS0_VECS1_INTR_MASK		_MMIO(0x1900d0)
 #define GEN12_VECS2_VECS3_INTR_MASK		_MMIO(0x1900d4)
+#define GEN11_HECI2_RSVD_INTR_MASK		_MMIO(0x1900e4)
 #define GEN11_GUC_SG_INTR_MASK			_MMIO(0x1900e8)
 #define MTL_GUC_MGUC_INTR_MASK			_MMIO(0x1900e8) /* MTL+ */
 #define GEN11_GPM_WGBOXPERF_INTR_MASK		_MMIO(0x1900ec)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
index ed8f68e78c26..2889e0d39ff3 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
@@ -14,6 +14,7 @@
 #include "intel_gsc_uc.h"
 #include "intel_gsc_uc_heci_cmd_submit.h"
 #include "i915_drv.h"
+#include "i915_reg.h"
 
 /*
  * GSC proxy:
@@ -273,17 +274,49 @@ int intel_gsc_proxy_request_handler(struct intel_gsc_uc *gsc)
 		gt_err(gt, "GSC proxy worker called without the component being bound!\n");
 		err = -EIO;
 	} else {
+		/*
+		 * write the status bit to clear it and allow new proxy
+		 * interrupts to be generated while we handle the current
+		 * request, but be sure not to write the reset bit
+		 */
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_RST, HECI_H_CSR_IS);
 		err = proxy_query(gsc);
 	}
 	mutex_unlock(&gsc->proxy.mutex);
 	return err;
 }
 
+void intel_gsc_proxy_irq_handler(struct intel_gsc_uc *gsc, u32 iir)
+{
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+
+	if (unlikely(!iir))
+		return;
+
+	lockdep_assert_held(gt->irq_lock);
+
+	if (!gsc->proxy.component) {
+		gt_err(gt, "GSC proxy irq received without the component being bound!\n");
+		return;
+	}
+
+	gsc->gsc_work_actions |= GSC_ACTION_SW_PROXY;
+	queue_work(gsc->wq, &gsc->work);
+}
+
 static int i915_gsc_proxy_component_bind(struct device *i915_kdev,
 					 struct device *tee_kdev, void *data)
 {
 	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
-	struct intel_gsc_uc *gsc = &i915->media_gt->uc.gsc;
+	struct intel_gt *gt = i915->media_gt;
+	struct intel_gsc_uc *gsc = &gt->uc.gsc;
+	intel_wakeref_t wakeref;
+
+	/* enable HECI2 IRQs */
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 0, HECI_H_CSR_IE);
 
 	mutex_lock(&gsc->proxy.mutex);
 	gsc->proxy.component = data;
@@ -297,11 +330,18 @@ static void i915_gsc_proxy_component_unbind(struct device *i915_kdev,
 					    struct device *tee_kdev, void *data)
 {
 	struct drm_i915_private *i915 = kdev_to_i915(i915_kdev);
-	struct intel_gsc_uc *gsc = &i915->media_gt->uc.gsc;
+	struct intel_gt *gt = i915->media_gt;
+	struct intel_gsc_uc *gsc = &gt->uc.gsc;
+	intel_wakeref_t wakeref;
 
 	mutex_lock(&gsc->proxy.mutex);
 	gsc->proxy.component = NULL;
 	mutex_unlock(&gsc->proxy.mutex);
+
+	/* disable HECI2 IRQs */
+	with_intel_runtime_pm(&i915->runtime_pm, wakeref)
+		intel_uncore_rmw(gt->uncore, HECI_H_CSR(MTL_GSC_HECI2_BASE),
+				 HECI_H_CSR_IE, 0);
 }
 
 static const struct component_ops i915_gsc_proxy_component_ops = {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
index da3e9dd5d820..c55bafcbaec4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
@@ -13,5 +13,6 @@ struct intel_gsc_uc;
 int intel_gsc_proxy_init(struct intel_gsc_uc *gsc);
 void intel_gsc_proxy_fini(struct intel_gsc_uc *gsc);
 int intel_gsc_proxy_request_handler(struct intel_gsc_uc *gsc);
+void intel_gsc_proxy_irq_handler(struct intel_gsc_uc *gsc, u32 iir);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
index b505b208f04b..64bff01026e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
@@ -17,20 +17,40 @@ static void gsc_work(struct work_struct *work)
 	struct intel_gsc_uc *gsc = container_of(work, typeof(*gsc), work);
 	struct intel_gt *gt = gsc_uc_to_gt(gsc);
 	intel_wakeref_t wakeref;
+	u32 actions;
 	int ret;
 
 	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
 
-	ret = intel_gsc_uc_fw_upload(gsc);
-	if (ret)
-		goto out_put;
-
-	ret = intel_gsc_proxy_request_handler(gsc);
-	if (ret)
-		goto out_put;
+	spin_lock_irq(gt->irq_lock);
+	actions = gsc->gsc_work_actions;
+	gsc->gsc_work_actions = 0;
+	spin_unlock_irq(gt->irq_lock);
+
+	if (actions & GSC_ACTION_FW_LOAD) {
+		ret = intel_gsc_uc_fw_upload(gsc);
+		if (ret == -EEXIST) /* skip proxy if not a new load */
+			actions &= ~GSC_ACTION_FW_LOAD;
+		else if (ret)
+			goto out_put;
+	}
 
-	gt_dbg(gt, "GSC Proxy initialized\n");
-	intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_RUNNING);
+	if (actions & (GSC_ACTION_FW_LOAD | GSC_ACTION_SW_PROXY)) {
+		if (!intel_gsc_uc_fw_init_done(gsc)) {
+			gt_err(gt, "Proxy request received with GSC not loaded!\n");
+			goto out_put;
+		}
+
+		ret = intel_gsc_proxy_request_handler(gsc);
+		if (ret)
+			goto out_put;
+
+		/* mark the GSC FW init as done the first time we run this */
+		if (actions & GSC_ACTION_FW_LOAD) {
+			gt_dbg(gt, "GSC Proxy initialized\n");
+			intel_uc_fw_change_status(&gsc->fw, INTEL_UC_FIRMWARE_RUNNING);
+		}
+	}
 
 out_put:
 	intel_runtime_pm_put(gt->uncore->rpm, wakeref);
@@ -177,11 +197,17 @@ void intel_gsc_uc_resume(struct intel_gsc_uc *gsc)
 
 void intel_gsc_uc_load_start(struct intel_gsc_uc *gsc)
 {
+	struct intel_gt *gt = gsc_uc_to_gt(gsc);
+
 	if (!intel_uc_fw_is_loadable(&gsc->fw))
 		return;
 
 	if (intel_gsc_uc_fw_init_done(gsc))
 		return;
 
+	spin_lock_irq(gt->irq_lock);
+	gsc->gsc_work_actions |= GSC_ACTION_FW_LOAD;
+	spin_unlock_irq(gt->irq_lock);
+
 	queue_work(gsc->wq, &gsc->work);
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
index 023bded10dde..a2a0813b8a76 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h
@@ -23,6 +23,9 @@ struct intel_gsc_uc {
 	/* for delayed load and proxy handling */
 	struct workqueue_struct *wq;
 	struct work_struct work;
+	u32 gsc_work_actions; /* protected by gt->irq_lock */
+#define GSC_ACTION_FW_LOAD BIT(0)
+#define GSC_ACTION_SW_PROXY BIT(1)
 
 	struct {
 		struct i915_gsc_proxy_component *component;
-- 
2.37.3

