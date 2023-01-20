Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D5675A3B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 17:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B55E10EAB0;
	Fri, 20 Jan 2023 16:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC54410EAAB;
 Fri, 20 Jan 2023 16:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674232885; x=1705768885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bpuUOiIQOglcE/lGUdrCXSNKIhTa7p5kH6aLwKK9hJ4=;
 b=Yr8kOcDIpTz7ezJMgGhN0gjZuLGGL2E/Y7K2FrRFZbrCOq1ueQO+lzq9
 zq66NvaiH/PO9Nkct4NayDk1NJzpgG1/jBgJJ3ZqfYAooTIRDF2mIf6Z8
 llgymkw7DVbE2pd81zjIGiQeTvrT+JvVaFWNC6Jz738QRzo2QrjVxRIgs
 IoL6yLTRoCDJ1Yy+RQdL41Yu56gLKN6FCee42rWXIeqlXZngYH94WupyX
 VjnX94c5/AQ4XP3dww+QA0098+eAgWwLXOX5o4zf4OD50TcXU6IbUQx4K
 fp5ft/C8fJovcdaPw7zYn9aTqOB0pI+m7vH06e0KIwd3j47U3PZycLYlb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="323309852"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="323309852"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 08:41:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="691109984"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="691109984"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by orsmga008.jf.intel.com with ESMTP; 20 Jan 2023 08:41:24 -0800
Received: from mwajdecz-MOBL.ger.corp.intel.com
 (mwajdecz-MOBL.ger.corp.intel.com [10.249.145.153])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 30KGfEfc023485; Fri, 20 Jan 2023 16:41:23 GMT
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] drm/i915/guc: Update GuC messages in intel_guc.c
Date: Fri, 20 Jan 2023 17:40:44 +0100
Message-Id: <20230120164050.1765-3-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230120164050.1765-1-michal.wajdeczko@intel.com>
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use new macros to have common prefix that also include GT#.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c | 31 +++++++++++++-------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 1bccc175f9e6..be39e519b5fd 100644
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
+		guc_err(guc, "Received early GuC crash dump notification!\n");
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
+		guc_err(guc, "Received early GuC exception notification!\n");
 
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

