Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EE67FA9E
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jan 2023 20:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF7510E1FA;
	Sat, 28 Jan 2023 19:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C710E070;
 Sat, 28 Jan 2023 19:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674935961; x=1706471961;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AokS0Hj6hqZm9ivPrH9ikWN1oGAQsa/N1r0dq/oRBdM=;
 b=HhppNG5v7ftRRKrs1VDpSoegsFBr/sTYRyyY9Flb5JI4NmjHzPnicE72
 jNJgDfpLNCNimaMYzILIqiLmxPUuhbUjLHh2OJpFENJEfZYkAcoHK/lTq
 Qo0V+/BTdqtTQtGtT++kApDt2nwGi7B3KUxMQy2sEFkKFN/L+H3FH3dDC
 rnfpM4BOQj95NlQduHC8XORlw6D7MU8hbtnzPKdAQ1+lBmgn8dTvKjp7x
 N0LcEhHcu0OghNS/VB/+rtJHUdEPzWWHIaO9RbBK500ogsiETe0znnEva
 PH2SzQvAxUelexu/FtPjhgeB3MXhjXxFL2M0sB8uiSyEf8Zb4O7DSI2k2 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306978116"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="306978116"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2023 11:59:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="613567928"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; d="scan'208";a="613567928"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga003.jf.intel.com with ESMTP; 28 Jan 2023 11:59:19 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.137.106])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A8654333EF;
 Sat, 28 Jan 2023 19:59:18 +0000 (GMT)
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/8] drm/i915/guc: Update GuC messages in intel_guc.c
Date: Sat, 28 Jan 2023 20:59:01 +0100
Message-Id: <20230128195907.1837-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230128195907.1837-1-michal.wajdeczko@intel.com>
References: <20230128195907.1837-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

v2: drop now redundant "GuC" word from the message

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 31 +++++++++++++-------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 1bccc175f9e6..d76508fa3af7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -11,6 +11,7 @@
 #include "intel_guc.h"
 #include "intel_guc_ads.h"
 #include "intel_guc_capture.h"
+#include "intel_guc_print.h"
 #include "intel_guc_slpc.h"
 #include "intel_guc_submission.h"
 #include "i915_drv.h"
@@ -94,8 +95,8 @@ static void gen9_enable_guc_interrupts(struct intel_guc *guc)
 	assert_rpm_wakelock_held(&gt->i915->runtime_pm);
 
 	spin_lock_irq(gt->irq_lock);
-	WARN_ON_ONCE(intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
-		     gt->pm_guc_events);
+	guc_WARN_ON_ONCE(guc, intel_uncore_read(gt->uncore, GEN8_GT_IIR(2)) &
+			 gt->pm_guc_events);
 	gen6_gt_pm_enable_irq(gt, gt->pm_guc_events);
 	spin_unlock_irq(gt->irq_lock);
 
@@ -342,7 +343,7 @@ static void guc_init_params(struct intel_guc *guc)
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
 	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
+		guc_dbg(guc, "param[%2d] = %#x\n", i, params[i]);
 }
 
 /*
@@ -389,7 +390,6 @@ void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
 
 int intel_guc_init(struct intel_guc *guc)
 {
-	struct intel_gt *gt = guc_to_gt(guc);
 	int ret;
 
 	ret = intel_uc_fw_init(&guc->fw);
@@ -451,7 +451,7 @@ int intel_guc_init(struct intel_guc *guc)
 	intel_uc_fw_fini(&guc->fw);
 out:
 	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	i915_probe_error(gt->i915, "failed with %d\n", ret);
+	guc_probe_error(guc, "failed with %pe\n", ERR_PTR(ret));
 	return ret;
 }
 
@@ -480,7 +480,6 @@ void intel_guc_fini(struct intel_guc *guc)
 int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 			u32 *response_buf, u32 response_buf_size)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
 	u32 header;
 	int i;
@@ -515,7 +514,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 					   10, 10, &header);
 	if (unlikely(ret)) {
 timeout:
-		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
+		guc_err(guc, "mmio request %#x: no reply %x\n",
 			request[0], header);
 		goto out;
 	}
@@ -537,7 +536,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
 
-		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
+		guc_dbg(guc, "mmio request %#x: retrying, reason %u\n",
 			request[0], reason);
 		goto retry;
 	}
@@ -546,7 +545,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
+		guc_err(guc, "mmio request %#x: failure %x/%u\n",
 			request[0], error, hint);
 		ret = -ENXIO;
 		goto out;
@@ -554,7 +553,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
+		guc_err(guc, "mmio request %#x: unexpected reply %#x\n",
 			request[0], header);
 		ret = -EPROTO;
 		goto out;
@@ -597,9 +596,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	msg = payload[0] & guc->msg_enabled_mask;
 
 	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
+		guc_err(guc, "Received early crash dump notification!\n");
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
+		guc_err(guc, "Received early exception notification!\n");
 
 	return 0;
 }
@@ -653,7 +652,8 @@ int intel_guc_suspend(struct intel_guc *guc)
 		 */
 		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 		if (ret)
-			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
+			guc_err(guc, "suspend: RESET_CLIENT action failed with %pe\n",
+				ERR_PTR(ret));
 	}
 
 	/* Signal that the GuC isn't running. */
@@ -828,12 +828,11 @@ static int __guc_action_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 va
 
 static int __guc_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 value)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int err = __guc_action_self_cfg(guc, key, len, value);
 
 	if (unlikely(err))
-		i915_probe_error(i915, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
-				 ERR_PTR(err), key, value);
+		guc_probe_error(guc, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
+				ERR_PTR(err), key, value);
 	return err;
 }
 
-- 
2.25.1

