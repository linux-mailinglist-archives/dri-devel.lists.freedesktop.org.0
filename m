Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A9546C49E
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF026E1BD;
	Tue,  7 Dec 2021 20:28:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6166E1BD;
 Tue,  7 Dec 2021 20:28:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="236419069"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="236419069"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="751514362"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2021 12:28:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Request RP0 before loading firmware
Date: Tue,  7 Dec 2021 12:28:50 -0800
Message-Id: <20211207202850.274415-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

By default, GT (and GuC) run at RPn. Requesting for RP0
before firmware load can speed up DMA and HuC auth as well.
In addition to writing to 0xA008, we also need to enable
swreq in 0xA024 so that Punit will pay heed to our request.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c   | 59 +++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h   |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c |  6 +++
 drivers/gpu/drm/i915/i915_reg.h       |  4 ++
 4 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 07ff7ba7b2b7..4f7fe079ed4a 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2226,6 +2226,65 @@ u32 intel_rps_read_state_cap(struct intel_rps *rps)
 		return intel_uncore_read(uncore, GEN6_RP_STATE_CAP);
 }
 
+static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
+{
+	struct intel_uncore *uncore = rps_to_uncore(rps);
+	u32 state = enable ? GEN9_RPSWCTL_ENABLE : GEN9_RPSWCTL_DISABLE;
+
+	if (enable)
+		intel_rps_clear_timer(rps);
+
+	/* Allow punit to process software requests */
+	intel_uncore_write(uncore, GEN6_RP_CONTROL, state);
+
+	if (!enable)
+		intel_rps_set_timer(rps);
+}
+
+void intel_rps_raise_unslice(struct intel_rps *rps)
+{
+	struct intel_uncore *uncore = rps_to_uncore(rps);
+	u32 rp0_unslice_req;
+
+	intel_rps_set_manual(rps, true);
+
+	/* RP limits have not been read yet */
+	if (!rps->rp0_freq)
+		rp0_unslice_req = ((intel_rps_read_state_cap(rps) >> 0)
+				   & 0xff) * GEN9_FREQ_SCALER;
+	else
+		rp0_unslice_req = rps->rp0_freq;
+
+	intel_uncore_write(uncore, GEN6_RPNSWREQ,
+			   ((rp0_unslice_req <<
+			   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
+			   GEN9_IGNORE_SLICE_RATIO));
+
+	intel_rps_set_manual(rps, false);
+}
+
+void intel_rps_lower_unslice(struct intel_rps *rps)
+{
+	struct intel_uncore *uncore = rps_to_uncore(rps);
+	u32 rpn_unslice_req;
+
+	intel_rps_set_manual(rps, true);
+
+	/* RP limits have not been read yet */
+	if (!rps->min_freq)
+		rpn_unslice_req = ((intel_rps_read_state_cap(rps) >> 16)
+				   & 0xff) * GEN9_FREQ_SCALER;
+	else
+		rpn_unslice_req = rps->min_freq;
+
+	intel_uncore_write(uncore, GEN6_RPNSWREQ,
+			   ((rpn_unslice_req <<
+			   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT) |
+			   GEN9_IGNORE_SLICE_RATIO));
+
+	intel_rps_set_manual(rps, false);
+}
+
 /* External interface for intel_ips.ko */
 
 static struct drm_i915_private __rcu *ips_mchdev;
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index aee12f37d38a..c6d76a3d1331 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -45,6 +45,8 @@ u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
 u32 intel_rps_read_punit_req(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
 u32 intel_rps_read_state_cap(struct intel_rps *rps);
+void intel_rps_raise_unslice(struct intel_rps *rps);
+void intel_rps_lower_unslice(struct intel_rps *rps);
 
 void gen5_rps_irq_handler(struct intel_rps *rps);
 void gen6_rps_irq_handler(struct intel_rps *rps, u32 pm_iir);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 2fef3b0bbe95..ed7180b79a6f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -8,6 +8,7 @@
 #include "intel_guc.h"
 #include "intel_guc_ads.h"
 #include "intel_guc_submission.h"
+#include "gt/intel_rps.h"
 #include "intel_uc.h"
 
 #include "i915_drv.h"
@@ -462,6 +463,8 @@ static int __uc_init_hw(struct intel_uc *uc)
 	else
 		attempts = 1;
 
+	intel_rps_raise_unslice(&uc_to_gt(uc)->rps);
+
 	while (attempts--) {
 		/*
 		 * Always reset the GuC just before (re)loading, so
@@ -529,6 +532,9 @@ static int __uc_init_hw(struct intel_uc *uc)
 err_log_capture:
 	__uc_capture_load_err_log(uc);
 err_out:
+	/* Return GT back to RPn */
+	intel_rps_lower_unslice(&uc_to_gt(uc)->rps);
+
 	__uc_sanitize(uc);
 
 	if (!ret) {
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 3450818802c2..229d33a65891 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -9415,6 +9415,7 @@ enum {
 #define   GEN6_OFFSET(x)			((x) << 19)
 #define   GEN6_AGGRESSIVE_TURBO			(0 << 15)
 #define   GEN9_SW_REQ_UNSLICE_RATIO_SHIFT	23
+#define   GEN9_IGNORE_SLICE_RATIO		(0 << 0)
 
 #define GEN6_RC_VIDEO_FREQ			_MMIO(0xA00C)
 #define GEN6_RC_CONTROL				_MMIO(0xA090)
@@ -9450,6 +9451,9 @@ enum {
 #define   GEN6_RP_UP_BUSY_CONT			(0x4 << 3)
 #define   GEN6_RP_DOWN_IDLE_AVG			(0x2 << 0)
 #define   GEN6_RP_DOWN_IDLE_CONT		(0x1 << 0)
+#define   GEN6_RPSWCTL_SHIFT			9
+#define   GEN9_RPSWCTL_ENABLE			(0x2 << GEN6_RPSWCTL_SHIFT)
+#define   GEN9_RPSWCTL_DISABLE			(0x0 << GEN6_RPSWCTL_SHIFT)
 #define GEN6_RP_UP_THRESHOLD			_MMIO(0xA02C)
 #define GEN6_RP_DOWN_THRESHOLD			_MMIO(0xA030)
 #define GEN6_RP_CUR_UP_EI			_MMIO(0xA050)
-- 
2.25.1

