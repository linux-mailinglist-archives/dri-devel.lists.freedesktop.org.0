Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E186636A25
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E9110E619;
	Wed, 23 Nov 2022 19:51:46 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D158410E602;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233090; x=1700769090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D3Iq/8cU2rOuKxyOr3aO4LBNYkSdkbn6Mwc252txpcE=;
 b=QA4R6zDZhg/91SgciCN50/JiDDtF8kqwrdSg/FBhrVm5dr8nhNRoKSyQ
 NiEAHff+yBw/nbtOAAB4mfRLrQjpcLE0QTjMgwWcURKgNDiSUAdWLDBDT
 rsDgoq/LYeJUOpeRR6GXfEK3Z2g2/VaG4FfhEykZS15d511XPL6dQn8IH
 mhLWJTtX+zhcbWMvAen+gDxAirJNrQwjkEMP7SZj5HZ8Ee3Y93IqWKRYG
 QUSDEFWVHpHVLezu2uSoB3n/pfYA5uVK7zkJsjewuBPrZF8LLp2WKADf6
 guIIkA7MRGE4krN3YMjqJsdgw/aqjN/519BStEApu+0AJRxFQspoO1/K3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312846855"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312846855"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597795"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597795"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 3/5] drm/i915/guc: Add GuC specific debug print wrappers
Date: Wed, 23 Nov 2022 11:51:21 -0800
Message-Id: <20221123195123.1525100-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
References: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Content-Type: text/plain; charset=UTF-8
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Create a set of GuC printers and start using them.

v2: Tweaks to output messages. (review feedback from Michal W).
Split definitions to separate header (review feedback from Jani).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 33 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  9 ++-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    | 49 ++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     | 28 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 38 +++++------
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  | 42 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |  8 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 56 +++++++----------
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 63 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 34 +++++-----
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   | 22 +++----
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 +--
 12 files changed, 198 insertions(+), 194 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 52aede324788e..19a632a3e4b03 100644
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
 
@@ -339,7 +340,7 @@ static void guc_init_params(struct intel_guc *guc)
 	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
 
 	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
-		DRM_DEBUG_DRIVER("param[%2d] = %#x\n", i, params[i]);
+		guc_dbg(guc, "init param[%2d] = %#x\n", i, params[i]);
 }
 
 /*
@@ -451,7 +452,7 @@ int intel_guc_init(struct intel_guc *guc)
 	intel_uc_fw_fini(&guc->fw);
 out:
 	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_INIT_FAIL);
-	i915_probe_error(gt->i915, "failed with %d\n", ret);
+	guc_probe_error(guc, "init failed with %d\n", ret);
 	return ret;
 }
 
@@ -484,7 +485,6 @@ void intel_guc_fini(struct intel_guc *guc)
 int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 			u32 *response_buf, u32 response_buf_size)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
 	u32 header;
 	int i;
@@ -519,8 +519,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 					   10, 10, &header);
 	if (unlikely(ret)) {
 timeout:
-		drm_err(&i915->drm, "mmio request %#x: no reply %x\n",
-			request[0], header);
+		guc_err(guc, "mmio request %#x: no reply %x\n", request[0], header);
 		goto out;
 	}
 
@@ -541,8 +540,7 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) == GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
 		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
 
-		drm_dbg(&i915->drm, "mmio request %#x: retrying, reason %u\n",
-			request[0], reason);
+		guc_dbg(guc, "mmio request %#x: retrying, reason %u\n", request[0], reason);
 		goto retry;
 	}
 
@@ -550,16 +548,14 @@ int intel_guc_send_mmio(struct intel_guc *guc, const u32 *request, u32 len,
 		u32 hint = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, header);
 		u32 error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, header);
 
-		drm_err(&i915->drm, "mmio request %#x: failure %x/%u\n",
-			request[0], error, hint);
+		guc_err(guc, "mmio request %#x: failure %x/%u\n", request[0], error, hint);
 		ret = -ENXIO;
 		goto out;
 	}
 
 	if (FIELD_GET(GUC_HXG_MSG_0_TYPE, header) != GUC_HXG_TYPE_RESPONSE_SUCCESS) {
 proto:
-		drm_err(&i915->drm, "mmio request %#x: unexpected reply %#x\n",
-			request[0], header);
+		guc_err(guc, "mmio request %#x: unexpected reply %#x\n", request[0], header);
 		ret = -EPROTO;
 		goto out;
 	}
@@ -601,9 +597,9 @@ int intel_guc_to_host_process_recv_msg(struct intel_guc *guc,
 	msg = payload[0] & guc->msg_enabled_mask;
 
 	if (msg & INTEL_GUC_RECV_MSG_CRASH_DUMP_POSTED)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC crash dump notification!\n");
+		guc_err(guc, "early notification: Crash dump!\n");
 	if (msg & INTEL_GUC_RECV_MSG_EXCEPTION)
-		drm_err(&guc_to_gt(guc)->i915->drm, "Received early GuC exception notification!\n");
+		guc_err(guc, "early notification: Exception!\n");
 
 	return 0;
 }
@@ -657,7 +653,7 @@ int intel_guc_suspend(struct intel_guc *guc)
 		 */
 		ret = intel_guc_send_mmio(guc, action, ARRAY_SIZE(action), NULL, 0);
 		if (ret)
-			DRM_ERROR("GuC suspend: RESET_CLIENT action failed with error %d!\n", ret);
+			guc_err(guc, "suspend: RESET_CLIENT action failed with error %d!\n", ret);
 	}
 
 	/* Signal that the GuC isn't running. */
@@ -832,12 +828,11 @@ static int __guc_action_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 va
 
 static int __guc_self_cfg(struct intel_guc *guc, u16 key, u16 len, u64 value)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int err = __guc_action_self_cfg(guc, key, len, value);
 
 	if (unlikely(err))
-		i915_probe_error(i915, "Unsuccessful self-config (%pe) key %#hx value %#llx\n",
-				 ERR_PTR(err), key, value);
+		guc_probe_error(guc, "self-config: Unsuccessful (%pe) key %#hx value %#llx\n",
+				ERR_PTR(err), key, value);
 	return err;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
index a7f737c4792e2..f827f067cae0b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
@@ -15,6 +15,7 @@
 #include "intel_guc_ads.h"
 #include "intel_guc_capture.h"
 #include "intel_guc_fwif.h"
+#include "intel_guc_print.h"
 #include "intel_uc.h"
 #include "i915_drv.h"
 
@@ -427,7 +428,7 @@ static long guc_mmio_reg_state_create(struct intel_guc *guc)
 
 	guc->ads_regset = temp_set.storage;
 
-	drm_dbg(&guc_to_gt(guc)->i915->drm, "Used %zu KB for temporary ADS regset\n",
+	guc_dbg(guc, "used %zu KB for temporary ADS regset\n",
 		(temp_set.storage_max * sizeof(struct guc_mmio_reg)) >> 10);
 
 	return total * sizeof(struct guc_mmio_reg);
@@ -621,8 +622,7 @@ static void guc_init_golden_context(struct intel_guc *guc)
 
 		engine = find_engine_state(gt, engine_class);
 		if (!engine) {
-			drm_err(&gt->i915->drm, "No engine state recorded for class %d!\n",
-				engine_class);
+			guc_err(guc, "No engine state recorded for class %d!\n", engine_class);
 			ads_blob_write(guc, ads.eng_state_size[guc_class], 0);
 			ads_blob_write(guc, ads.golden_context_lrca[guc_class], 0);
 			continue;
@@ -646,7 +646,6 @@ static int
 guc_capture_prep_lists(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	u32 ads_ggtt, capture_offset, null_ggtt, total_size = 0;
 	struct guc_gt_system_info local_info;
 	struct iosys_map info_map;
@@ -751,7 +750,7 @@ guc_capture_prep_lists(struct intel_guc *guc)
 	}
 
 	if (guc->ads_capture_size && guc->ads_capture_size != PAGE_ALIGN(total_size))
-		drm_warn(&i915->drm, "GuC->ADS->Capture alloc size changed from %d to %d\n",
+		guc_warn(guc, "capture alloc size changed from %d to %d\n",
 			 guc->ads_capture_size, PAGE_ALIGN(total_size));
 
 	return PAGE_ALIGN(total_size);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index 1d49a7ec0bd8f..b3a4fbd09e853 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -15,6 +15,7 @@
 #include "guc_capture_fwif.h"
 #include "intel_guc_capture.h"
 #include "intel_guc_fwif.h"
+#include "intel_guc_print.h"
 #include "i915_drv.h"
 #include "i915_gpu_error.h"
 #include "i915_irq.h"
@@ -353,7 +354,6 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
 				       u32 ipver)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct sseu_dev_info *sseu;
 	int slice, subslice, i, iter, num_steer_regs, num_tot_regs = 0;
 	const struct __guc_mmio_reg_descr_group *list;
@@ -402,7 +402,7 @@ guc_capture_alloc_steered_lists_xe_hpg(struct intel_guc *guc,
 		}
 	}
 
-	drm_dbg(&i915->drm, "GuC-capture found %d-ext-regs.\n", num_tot_regs);
+	guc_dbg(guc, "capture found %d ext-regs.\n", num_tot_regs);
 	guc->capture->extlists = extlists;
 }
 
@@ -477,7 +477,6 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		      struct guc_mmio_reg *ptr, u16 num_entries)
 {
 	u32 i = 0, j = 0;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	const struct __guc_mmio_reg_descr_group *reglists = guc->capture->reglists;
 	struct __guc_mmio_reg_descr_group *extlists = guc->capture->extlists;
 	const struct __guc_mmio_reg_descr_group *match;
@@ -509,8 +508,7 @@ guc_capture_list_init(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 		}
 	}
 	if (i < num_entries)
-		drm_dbg(&i915->drm, "GuC-capture: Init reglist short %d out %d.\n",
-			(int)i, (int)num_entries);
+		guc_dbg(guc, "capture: Init reglist short %d out %d.\n", i, num_entries);
 
 	return 0;
 }
@@ -540,12 +538,11 @@ guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 			size_t *size, bool is_purpose_est)
 {
 	struct intel_guc_state_capture *gc = guc->capture;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
 	int num_regs;
 
 	if (!gc->reglists) {
-		drm_warn(&i915->drm, "GuC-capture: No reglist on this device\n");
+		guc_warn(guc, "capture: No reglist on this device\n");
 		return -ENODEV;
 	}
 
@@ -557,9 +554,9 @@ guc_capture_getlistsize(struct intel_guc *guc, u32 owner, u32 type, u32 classid,
 	if (!is_purpose_est && owner == GUC_CAPTURE_LIST_INDEX_PF &&
 	    !guc_capture_get_one_list(gc->reglists, owner, type, classid)) {
 		if (type == GUC_CAPTURE_LIST_TYPE_GLOBAL)
-			drm_warn(&i915->drm, "Missing GuC-Err-Cap reglist Global!\n");
+			guc_warn(guc, "capture: Missing reglist: Global!\n");
 		else
-			drm_warn(&i915->drm, "Missing GuC-Err-Cap reglist %s(%u):%s(%u)!\n",
+			guc_warn(guc, "capture: Missing reglist: %s(%u):%s(%u)!\n",
 				 __stringify_type(type), type,
 				 __stringify_engclass(classid), classid);
 		return -ENODATA;
@@ -592,7 +589,6 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
 {
 	struct intel_guc_state_capture *gc = guc->capture;
 	struct __guc_capture_ads_cache *cache = &gc->ads_cache[owner][type][classid];
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_debug_capture_list *listnode;
 	int ret, num_regs;
 	u8 *caplist, *tmp;
@@ -623,7 +619,7 @@ intel_guc_capture_getlist(struct intel_guc *guc, u32 owner, u32 type, u32 classi
 
 	caplist = kzalloc(size, GFP_KERNEL);
 	if (!caplist) {
-		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached caplist");
+		guc_dbg(guc, "capture: Failed to alloc cached caplist\n");
 		return -ENOMEM;
 	}
 
@@ -653,7 +649,6 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 				void **outptr, size_t *size)
 {
 	struct intel_guc_state_capture *gc = guc->capture;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int tmp = sizeof(u32) * 4;
 	void *null_header;
 
@@ -665,7 +660,7 @@ intel_guc_capture_getnullheader(struct intel_guc *guc,
 
 	null_header = kzalloc(tmp, GFP_KERNEL);
 	if (!null_header) {
-		drm_dbg(&i915->drm, "GuC-capture: failed to alloc cached nulllist");
+		guc_dbg(guc, "capture: Failed to alloc cached null list\n");
 		return -ENOMEM;
 	}
 
@@ -727,7 +722,6 @@ guc_capture_output_min_size_est(struct intel_guc *guc)
 
 static void check_guc_capture_size(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int min_size = guc_capture_output_min_size_est(guc);
 	int spare_size = min_size * GUC_CAPTURE_OVERBUFFER_MULTIPLIER;
 	u32 buffer_size = intel_guc_log_section_size_capture(&guc->log);
@@ -741,13 +735,13 @@ static void check_guc_capture_size(struct intel_guc *guc)
 	 * INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE.
 	 */
 	if (min_size < 0)
-		drm_warn(&i915->drm, "Failed to calculate GuC error state capture buffer minimum size: %d!\n",
+		guc_warn(guc, "error state capture buffer minimum size calculation failed: %d!\n",
 			 min_size);
 	else if (min_size > buffer_size)
-		drm_warn(&i915->drm, "GuC error state capture buffer maybe small: %d < %d\n",
+		guc_warn(guc, "error state capture buffer maybe small: %d < %d\n",
 			 buffer_size, min_size);
 	else if (spare_size > buffer_size)
-		drm_dbg(&i915->drm, "GuC error state capture buffer lacks spare size: %d < %d (min = %d)\n",
+		guc_dbg(guc, "error state capture buffer lacks spare size: %d < %d (min = %d)\n",
 			buffer_size, spare_size, min_size);
 }
 
@@ -848,7 +842,6 @@ static int
 guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *buf,
 			  u32 *dw)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int tries = 2;
 	int avail = 0;
 	u32 *src_data;
@@ -865,7 +858,7 @@ guc_capture_log_remove_dw(struct intel_guc *guc, struct __guc_capture_bufstate *
 			return 4;
 		}
 		if (avail)
-			drm_dbg(&i915->drm, "GuC-Cap-Logs not dword aligned, skipping.\n");
+			guc_dbg(guc, "capture: Log not dword aligned, skipping.\n");
 		buf->rd = 0;
 	}
 
@@ -1118,13 +1111,12 @@ static void
 __guc_capture_create_prealloc_nodes(struct intel_guc *guc)
 {
 	struct __guc_capture_parsed_output *node = NULL;
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	int i;
 
 	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
 		node = guc_capture_alloc_one_node(guc);
 		if (!node) {
-			drm_warn(&i915->drm, "GuC Capture pre-alloc-cache failure\n");
+			guc_warn(guc, "capture pre-alloc-cache failure\n");
 			/* dont free the priors, use what we got and cleanup at shutdown */
 			return;
 		}
@@ -1169,7 +1161,6 @@ guc_capture_create_prealloc_nodes(struct intel_guc *guc)
 static int
 guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstate *buf)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_state_capture_group_header_t ghdr = {0};
 	struct guc_state_capture_header_t hdr = {0};
 	struct __guc_capture_parsed_output *node = NULL;
@@ -1183,7 +1174,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 	if (!i)
 		return -ENODATA;
 	if (i % sizeof(u32)) {
-		drm_warn(&i915->drm, "GuC Capture new entries unaligned\n");
+		guc_warn(guc, "capture new entries unaligned\n");
 		ret = -EIO;
 		goto bailout;
 	}
@@ -1301,8 +1292,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 				break;
 			}
 			if (datatype != GUC_CAPTURE_LIST_TYPE_GLOBAL)
-				drm_dbg(&i915->drm, "GuC Capture missing global dump: %08x!\n",
-					datatype);
+				guc_dbg(guc, "capture missing global dump: %08x!\n", datatype);
 		}
 		node->is_partial = is_partial;
 		node->reginfo[datatype].vfid = FIELD_GET(CAP_HDR_CAPTURE_VFID, hdr.owner);
@@ -1322,7 +1312,7 @@ guc_capture_extract_reglists(struct intel_guc *guc, struct __guc_capture_bufstat
 
 		numregs = FIELD_GET(CAP_HDR_NUM_MMIOS, hdr.num_mmios);
 		if (numregs > guc->capture->max_mmio_per_node) {
-			drm_dbg(&i915->drm, "GuC Capture list extraction clipped by prealloc!\n");
+			guc_dbg(guc, "capture list extraction clipped by prealloc!\n");
 			numregs = guc->capture->max_mmio_per_node;
 		}
 		node->reginfo[datatype].num_regs = numregs;
@@ -1367,7 +1357,6 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 {
 	unsigned int buffer_size, read_offset, write_offset, full_count;
 	struct intel_uc *uc = container_of(guc, typeof(*uc), guc);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	struct guc_log_buffer_state log_buf_state_local;
 	struct guc_log_buffer_state *log_buf_state;
 	struct __guc_capture_bufstate buf;
@@ -1403,7 +1392,7 @@ static void __guc_capture_process_output(struct intel_guc *guc)
 		write_offset = buffer_size;
 	} else if (unlikely((read_offset > buffer_size) ||
 			(write_offset > buffer_size))) {
-		drm_err(&i915->drm, "invalid GuC log capture buffer state!\n");
+		guc_err(guc, "capture: invalid buffer state!\n");
 		/* copy whole buffer as offsets are unreliable */
 		read_offset = 0;
 		write_offset = buffer_size;
@@ -1586,13 +1575,11 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 					 struct intel_context *ce)
 {
 	struct __guc_capture_parsed_output *n, *ntmp;
-	struct drm_i915_private *i915;
 	struct intel_guc *guc;
 
 	if (!gt || !ee || !ce)
 		return;
 
-	i915 = gt->i915;
 	guc = &gt->uc.guc;
 	if (!guc->capture)
 		return;
@@ -1615,7 +1602,7 @@ void intel_guc_capture_get_matching_node(struct intel_gt *gt,
 			return;
 		}
 	}
-	drm_dbg(&i915->drm, "GuC capture can't match ee to node\n");
+	guc_dbg(guc, "capture can't match ee to node\n");
 }
 
 void intel_guc_capture_process(struct intel_guc *guc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
index 5b86b2e286e07..1a50c0131ae34 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c
@@ -13,6 +13,7 @@
 #include "gt/intel_gt_mcr.h"
 #include "gt/intel_gt_regs.h"
 #include "intel_guc_fw.h"
+#include "intel_guc_print.h"
 #include "i915_drv.h"
 
 static void guc_prepare_xfer(struct intel_gt *gt)
@@ -103,8 +104,9 @@ static inline bool guc_ready(struct intel_uncore *uncore, u32 *status)
 	return uk_val == INTEL_GUC_LOAD_STATUS_READY;
 }
 
-static int guc_wait_ucode(struct intel_uncore *uncore)
+static int guc_wait_ucode(struct intel_guc *guc)
 {
+	struct intel_uncore *uncore = guc_to_gt(guc)->uncore;
 	u32 status;
 	int ret;
 
@@ -127,25 +129,21 @@ static int guc_wait_ucode(struct intel_uncore *uncore)
 	 */
 	ret = wait_for(guc_ready(uncore, &status), 200);
 	if (ret) {
-		struct drm_device *drm = &uncore->i915->drm;
-
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, "
-			"BootROM = 0x%02X, UKernel = 0x%02X, "
-			"MIA = 0x%02X, Auth = 0x%02X\n",
-			REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			REG_FIELD_GET(GS_MIA_MASK, status),
-			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+		guc_info(guc, "load failed: status = 0x%08X\n", status);
+		guc_info(guc, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			 REG_FIELD_GET(GS_MIA_MASK, status),
+			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
 
 		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
+			guc_info(guc, "firmware signature verification failed\n");
 			ret = -ENOEXEC;
 		}
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) == INTEL_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
+			guc_info(guc, "firmware exception. EIP: %#x\n",
 				 intel_uncore_read(uncore, SOFT_SCRATCH(13)));
 			ret = -ENXIO;
 		}
@@ -194,7 +192,7 @@ int intel_guc_fw_upload(struct intel_guc *guc)
 	if (ret)
 		goto out;
 
-	ret = guc_wait_ucode(uncore);
+	ret = guc_wait_ucode(guc);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 68331c538b0a7..e13c3d0ce55ae 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -12,6 +12,7 @@
 #include "i915_memcpy.h"
 #include "intel_guc_capture.h"
 #include "intel_guc_log.h"
+#include "intel_guc_print.h"
 
 #if defined(CONFIG_DRM_I915_DEBUG_GUC)
 #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE	SZ_2M
@@ -39,7 +40,6 @@ struct guc_log_section {
 static void _guc_log_init_sizes(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
 	static const struct guc_log_section sections[GUC_LOG_SECTIONS_LIMIT] = {
 		{
 			GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
@@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 		}
 
 		if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
-			drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs 0x%X!",
+			guc_err(guc, "log: Mis-aligned %s size: 0x%X vs 0x%X!\n",
 				sections[i].name, log->sizes[i].bytes, log->sizes[i].units);
 		log->sizes[i].count = log->sizes[i].bytes / log->sizes[i].units;
 
 		if (!log->sizes[i].count) {
-			drm_err(&i915->drm, "Zero GuC log %s size!", sections[i].name);
+			guc_err(guc, "log: zero %s size!\n", sections[i].name);
 		} else {
 			/* Size is +1 unit */
 			log->sizes[i].count--;
@@ -95,14 +95,14 @@ static void _guc_log_init_sizes(struct intel_guc_log *log)
 
 		/* Clip to field size */
 		if (log->sizes[i].count > sections[i].max) {
-			drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
+			guc_err(guc, "log: %s size too large: %d vs %d!\n",
 				sections[i].name, log->sizes[i].count + 1, sections[i].max + 1);
 			log->sizes[i].count = sections[i].max;
 		}
 	}
 
 	if (log->sizes[GUC_LOG_SECTIONS_CRASH].units != log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
-		drm_err(&i915->drm, "Unit mis-match for GuC log crash and debug sections: %d vs %d!",
+		guc_err(guc, "log: Unit mis-match for crash and debug sections: %d vs %d!\n",
 			log->sizes[GUC_LOG_SECTIONS_CRASH].units,
 			log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
 		log->sizes[GUC_LOG_SECTIONS_CRASH].units = log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
@@ -383,7 +383,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 
 	mutex_lock(&log->relay.lock);
 
-	if (WARN_ON(!intel_guc_log_relay_created(log)))
+	if (guc_WARN_ON(log_to_guc(log), !intel_guc_log_relay_created(log)))
 		goto out_unlock;
 
 	/* Get the pointer to shared GuC log buffer */
@@ -451,7 +451,7 @@ static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
 			write_offset = buffer_size;
 		} else if (unlikely((read_offset > buffer_size) ||
 				    (write_offset > buffer_size))) {
-			DRM_ERROR("invalid log buffer state\n");
+			guc_err(log_to_guc(log), "log: invalid buffer state\n");
 			/* copy whole buffer as offsets are unreliable */
 			read_offset = 0;
 			write_offset = buffer_size;
@@ -520,7 +520,7 @@ void intel_guc_log_init_early(struct intel_guc_log *log)
 static int guc_log_relay_create(struct intel_guc_log *log)
 {
 	struct intel_guc *guc = log_to_guc(log);
-	struct drm_i915_private *dev_priv = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
 	struct rchan *guc_log_relay_chan;
 	size_t n_subbufs, subbuf_size;
 	int ret;
@@ -543,11 +543,11 @@ static int guc_log_relay_create(struct intel_guc_log *log)
 	n_subbufs = 8;
 
 	guc_log_relay_chan = relay_open("guc_log",
-					dev_priv->drm.primary->debugfs_root,
+					gt->i915->drm.primary->debugfs_root,
 					subbuf_size, n_subbufs,
-					&relay_callbacks, dev_priv);
+					&relay_callbacks, gt->i915);
 	if (!guc_log_relay_chan) {
-		DRM_ERROR("Couldn't create relay chan for GuC logging\n");
+		guc_err(guc, "log: Failed to create relay chan\n");
 
 		ret = -ENOMEM;
 		return ret;
@@ -596,7 +596,7 @@ static u32 __get_default_log_level(struct intel_guc_log *log)
 	}
 
 	if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
-		DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
+		guc_warn(guc, "log: Incompatible options detected: %s=%d, %s!\n",
 			 "guc_log_level", i915->params.guc_log_level,
 			 "verbosity too high");
 		return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
@@ -641,15 +641,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
 	log->buf_addr = vaddr;
 
 	log->level = __get_default_log_level(log);
-	DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
-			 log->level, str_enabled_disabled(log->level),
-			 str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
-			 GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
+	guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
+		log->level, str_enabled_disabled(log->level),
+		str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
+		GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
 
 	return 0;
 
 err:
-	DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
+	guc_err(guc, "log: Failed to allocate or map buffer: %d\n", ret);
 	return ret;
 }
 
@@ -687,7 +687,7 @@ int intel_guc_log_set_level(struct intel_guc_log *log, u32 level)
 					     GUC_LOG_LEVEL_IS_ENABLED(level),
 					     GUC_LOG_LEVEL_TO_VERBOSITY(level));
 	if (ret) {
-		DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
+		guc_dbg(guc, "guc_log_control action failed %d\n", ret);
 		goto out_unlock;
 	}
 
@@ -905,7 +905,7 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
-		DRM_DEBUG("Failed to pin object\n");
+		guc_dbg(guc, "log: Failed to pin buffer object\n");
 		drm_puts(p, "(log data unaccessible)\n");
 		free_page((unsigned long)page);
 		return PTR_ERR(map);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
new file mode 100644
index 0000000000000..4f0691735aab2
--- /dev/null
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef _INTEL_GUC_PRINT_H_
+#define _INTEL_GUC_PRINT_H_
+
+#include "gt/intel_gt.h"
+#include "gt/intel_gt_print.h"
+
+#define guc_err(_guc, _fmt, ...) \
+	gt_err(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_warn(_guc, _fmt, ...) \
+	gt_warn(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_notice(_guc, _fmt, ...) \
+	gt_notice(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_info(_guc, _fmt, ...) \
+	gt_info(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_dbg(_guc, _fmt, ...) \
+	gt_dbg(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_probe_error(_guc, _fmt, ...) \
+	gt_probe_error(guc_to_gt(_guc), "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_WARN_ON(_guc, _condition) \
+	guc_WARN(_guc, _condition, "%s", "guc_WARN_ON(" __stringify(_condition) ")")
+
+#define guc_WARN_ON_ONCE(_guc, _condition) \
+	guc_WARN_ONCE(_guc, _condition, "%s", "guc_WARN_ON_ONCE(" __stringify(_condition) ")")
+
+#define guc_WARN(_guc, _condition, _fmt, ...) \
+	gt_WARN(guc_to_gt(_guc), _condition, "GuC " _fmt, ##__VA_ARGS__)
+
+#define guc_WARN_ONCE(_guc, _condition, _fmt, ...) \
+	gt_WARN_ONCE(guc_to_gt(_guc), _condition, "GuC " _fmt, ##__VA_ARGS__)
+
+#endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
index b5855091cf6a9..f5c8e1a43a367 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c
@@ -5,6 +5,7 @@
 
 #include <linux/string_helpers.h>
 
+#include "intel_guc_print.h"
 #include "intel_guc_rc.h"
 #include "gt/intel_gt.h"
 #include "i915_drv.h"
@@ -70,13 +71,12 @@ static int __guc_rc_control(struct intel_guc *guc, bool enable)
 
 	ret = guc_action_control_gucrc(guc, enable);
 	if (ret) {
-		i915_probe_error(guc_to_gt(guc)->i915, "Failed to %s GuC RC (%pe)\n",
-				 str_enable_disable(enable), ERR_PTR(ret));
+		guc_probe_error(guc, "RC: Failed to %s (%pe)\n",
+				str_enable_disable(enable), ERR_PTR(ret));
 		return ret;
 	}
 
-	drm_info(&gt->i915->drm, "GuC RC: %s\n",
-		 str_enabled_disabled(enable));
+	guc_info(guc, "RC %s\n", str_enabled_disabled(enable));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 63464933cbceb..55237ceeeb3dc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -9,6 +9,7 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_guc_slpc.h"
+#include "intel_guc_print.h"
 #include "intel_mchbar_regs.h"
 #include "gt/intel_gt.h"
 #include "gt/intel_gt_regs.h"
@@ -171,14 +172,12 @@ static int guc_action_slpc_query(struct intel_guc *guc, u32 offset)
 static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
 	int ret;
 
 	ret = guc_action_slpc_query(guc, offset);
 	if (unlikely(ret))
-		i915_probe_error(i915, "Failed to query task state (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Failed to query task state (%pe)\n", ERR_PTR(ret));
 
 	drm_clflush_virt_range(slpc->vaddr, SLPC_PAGE_SIZE_BYTES);
 
@@ -188,15 +187,14 @@ static int slpc_query_task_state(struct intel_guc_slpc *slpc)
 static int slpc_set_param(struct intel_guc_slpc *slpc, u8 id, u32 value)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	int ret;
 
 	GEM_BUG_ON(id >= SLPC_MAX_PARAM);
 
 	ret = guc_action_slpc_set_param(guc, id, value);
 	if (ret)
-		i915_probe_error(i915, "Failed to set param %d to %u (%pe)\n",
-				 id, value, ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Failed to set param %d to %u (%pe)\n",
+				id, value, ERR_PTR(ret));
 
 	return ret;
 }
@@ -236,8 +234,7 @@ static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 					SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
 					freq);
 		if (ret)
-			drm_notice(&i915->drm,
-				   "Failed to send set_param for min freq(%d): (%d)\n",
+			guc_notice(guc, "SLPC: Failed to send set_param for min freq(%d): (%d)\n",
 				   freq, ret);
 	}
 
@@ -267,7 +264,6 @@ static void slpc_boost_work(struct work_struct *work)
 int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 {
 	struct intel_guc *guc = slpc_to_guc(slpc);
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
 	int err;
 
@@ -275,9 +271,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
 
 	err = intel_guc_allocate_and_map_vma(guc, size, &slpc->vma, (void **)&slpc->vaddr);
 	if (unlikely(err)) {
-		i915_probe_error(i915,
-				 "Failed to allocate SLPC struct (err=%pe)\n",
-				 ERR_PTR(err));
+		guc_probe_error(guc, "SLPC: Failed to allocate SLPC struct (%pe)\n",
+				ERR_PTR(err));
 		return err;
 	}
 
@@ -338,7 +333,6 @@ static int guc_action_slpc_reset(struct intel_guc *guc, u32 offset)
 
 static int slpc_reset(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	struct intel_guc *guc = slpc_to_guc(slpc);
 	u32 offset = intel_guc_ggtt_offset(guc, slpc->vma);
 	int ret;
@@ -346,15 +340,14 @@ static int slpc_reset(struct intel_guc_slpc *slpc)
 	ret = guc_action_slpc_reset(guc, offset);
 
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC reset action failed (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Reset action failed (%pe)\n", ERR_PTR(ret));
 		return ret;
 	}
 
 	if (!ret) {
 		if (wait_for(slpc_is_running(slpc), SLPC_RESET_TIMEOUT_MS)) {
-			i915_probe_error(i915, "SLPC not enabled! State = %s\n",
-					 slpc_get_state_string(slpc));
+			guc_probe_error(guc, "SLPC: Not enabled! State = %s\n",
+					slpc_get_state_string(slpc));
 			return -EIO;
 		}
 	}
@@ -495,8 +488,8 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 			     SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
 			     val < slpc->rp1_freq);
 	if (ret) {
-		i915_probe_error(i915, "Failed to toggle efficient freq (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(slpc_to_guc(slpc), "SLPC: Failed to toggle efficient freq (%pe)\n",
+				ERR_PTR(ret));
 		goto out;
 	}
 
@@ -611,15 +604,12 @@ static int slpc_set_softlimits(struct intel_guc_slpc *slpc)
 
 static bool is_slpc_min_freq_rpmax(struct intel_guc_slpc *slpc)
 {
-	struct drm_i915_private *i915 = slpc_to_i915(slpc);
 	int slpc_min_freq;
 	int ret;
 
 	ret = intel_guc_slpc_get_min_freq(slpc, &slpc_min_freq);
 	if (ret) {
-		drm_err(&i915->drm,
-			"Failed to get min freq: (%d)\n",
-			ret);
+		guc_err(slpc_to_guc(slpc), "SLPC: Failed to get min freq: (%d)\n", ret);
 		return false;
 	}
 
@@ -685,8 +675,7 @@ int intel_guc_slpc_override_gucrc_mode(struct intel_guc_slpc *slpc, u32 mode)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_set_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE, mode);
 		if (ret)
-			drm_err(&i915->drm,
-				"Override gucrc mode %d failed %d\n",
+			guc_err(slpc_to_guc(slpc), "SLPC: Override gucrc mode %d failed %d\n",
 				mode, ret);
 	}
 
@@ -702,9 +691,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
 	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
 		ret = slpc_unset_param(slpc, SLPC_PARAM_PWRGATE_RC_MODE);
 		if (ret)
-			drm_err(&i915->drm,
-				"Unsetting gucrc mode failed %d\n",
-				ret);
+			guc_err(slpc_to_guc(slpc), "SLPC: Unsetting gucrc mode failed %d\n", ret);
 	}
 
 	return ret;
@@ -726,6 +713,7 @@ int intel_guc_slpc_unset_gucrc_mode(struct intel_guc_slpc *slpc)
 int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
 	int ret;
 
 	GEM_BUG_ON(!slpc->vma);
@@ -734,8 +722,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 
 	ret = slpc_reset(slpc);
 	if (unlikely(ret < 0)) {
-		i915_probe_error(i915, "SLPC Reset event returned (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Reset event returned (%pe)\n",
+				ERR_PTR(ret));
 		return ret;
 	}
 
@@ -753,16 +741,16 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	/* Set SLPC max limit to RP0 */
 	ret = slpc_use_fused_rp0(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC max to RP0 (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Failed to set max to RP0 (%pe)\n",
+				ERR_PTR(ret));
 		return ret;
 	}
 
 	/* Revert SLPC min/max to softlimits if necessary */
 	ret = slpc_set_softlimits(slpc);
 	if (unlikely(ret)) {
-		i915_probe_error(i915, "Failed to set SLPC softlimits (%pe)\n",
-				 ERR_PTR(ret));
+		guc_probe_error(guc, "SLPC: Failed to set softlimits (%pe)\n",
+				ERR_PTR(ret));
 		return ret;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0a42f1807f52c..f2392a6643064 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -27,6 +27,7 @@
 
 #include "intel_guc_ads.h"
 #include "intel_guc_capture.h"
+#include "intel_guc_print.h"
 #include "intel_guc_submission.h"
 
 #include "i915_drv.h"
@@ -1443,8 +1444,7 @@ static void guc_init_engine_stats(struct intel_guc *guc)
 		int ret = guc_action_enable_usage_stats(guc);
 
 		if (ret)
-			drm_err(&gt->i915->drm,
-				"Failed to enable usage stats: %d!\n", ret);
+			guc_err(guc, "Failed to enable usage stats: %d!\n", ret);
 	}
 }
 
@@ -3584,8 +3584,7 @@ static int guc_request_alloc(struct i915_request *rq)
 		intel_context_sched_disable_unpin(ce);
 	else if (intel_context_is_closed(ce))
 		if (wait_for(context_close_done(ce), 1500))
-			drm_warn(&guc_to_gt(guc)->i915->drm,
-				 "timed out waiting on context sched close before realloc\n");
+			guc_warn(guc, "timed out waiting on context sched close before realloc\n");
 	/*
 	 * Call pin_guc_id here rather than in the pinning step as with
 	 * dma_resv, contexts can be repeatedly pinned / unpinned trashing the
@@ -4350,7 +4349,7 @@ static int __guc_action_set_scheduling_policies(struct intel_guc *guc,
 		return ret;
 
 	if (ret != policy->count) {
-		drm_warn(&guc_to_gt(guc)->i915->drm, "GuC global scheduler policy processed %d of %d KLVs!",
+		guc_warn(guc, "H2G: global scheduler policy processed %d of %d KLVs!\n",
 			 ret, policy->count);
 		if (ret > policy->count)
 			return -EPROTO;
@@ -4383,9 +4382,9 @@ static int guc_init_global_schedule_policy(struct intel_guc *guc)
 
 		ret = __guc_action_set_scheduling_policies(guc, &policy);
 		if (ret)
-			i915_probe_error(gt->i915,
-					 "Failed to configure global scheduling policies: %pe!\n",
-					 ERR_PTR(ret));
+			guc_probe_error(guc,
+					"Failed to configure global scheduling policies: %pe!\n",
+					ERR_PTR(ret));
 	}
 
 	return ret;
@@ -4484,21 +4483,18 @@ g2h_context_lookup(struct intel_guc *guc, u32 ctx_id)
 	struct intel_context *ce;
 
 	if (unlikely(ctx_id >= GUC_MAX_CONTEXT_ID)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid ctx_id %u\n", ctx_id);
+		guc_err(guc, "Invalid ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	ce = __get_context(guc, ctx_id);
 	if (unlikely(!ce)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is NULL, ctx_id %u\n", ctx_id);
+		guc_err(guc, "Context is NULL, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
 	if (unlikely(intel_context_is_child(ce))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Context is child, ctx_id %u\n", ctx_id);
+		guc_err(guc, "Context is child, ctx_id %u\n", ctx_id);
 		return NULL;
 	}
 
@@ -4513,7 +4509,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "notification: Invalid length %u for deregister done\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4565,7 +4561,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	u32 ctx_id;
 
 	if (unlikely(len < 2)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u\n", len);
+		guc_err(guc, "notification: Invalid length %u for sched done\n", len);
 		return -EPROTO;
 	}
 	ctx_id = msg[0];
@@ -4577,8 +4573,7 @@ int intel_guc_sched_done_process_msg(struct intel_guc *guc,
 	if (unlikely(context_destroyed(ce) ||
 		     (!context_pending_enable(ce) &&
 		     !context_pending_disable(ce)))) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Bad context sched_state 0x%x, ctx_id %u\n",
+		guc_err(guc, "notification: Bad context sched_state 0x%x, ctx_id %u\n",
 			ce->guc_state.sched_state, ctx_id);
 		return -EPROTO;
 	}
@@ -4666,8 +4661,8 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_info(&guc_to_gt(guc)->i915->drm,
-			 "Ignoring context reset notification of exiting context 0x%04X on %s",
+		guc_info(guc,
+			 "Ignoring context reset notification of exiting context 0x%04X on %s\n",
 			 ce->guc_id.id, ce->engine->name);
 	}
 }
@@ -4680,7 +4675,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	int ctx_id;
 
 	if (unlikely(len != 1)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "notification: Invalid length %u for context reset\n", len);
 		return -EPROTO;
 	}
 
@@ -4713,13 +4708,13 @@ int intel_guc_error_capture_process_msg(struct intel_guc *guc,
 	u32 status;
 
 	if (unlikely(len != 1)) {
-		drm_dbg(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "notification: Invalid length %u for error capture\n", len);
 		return -EPROTO;
 	}
 
 	status = msg[0] & INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_MASK;
 	if (status == INTEL_GUC_STATE_CAPTURE_EVENT_STATUS_NOSPACE)
-		drm_warn(&guc_to_gt(guc)->i915->drm, "G2H-Error capture no space");
+		guc_warn(guc, "notification: Error capture buffer overflow\n");
 
 	intel_guc_capture_process(guc);
 
@@ -4762,13 +4757,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len)
 {
 	struct intel_engine_cs *engine;
-	struct intel_gt *gt = guc_to_gt(guc);
 	u8 guc_class, instance;
 	u32 reason;
 	unsigned long flags;
 
 	if (unlikely(len != 3)) {
-		drm_err(&gt->i915->drm, "Invalid length %u", len);
+		guc_err(guc, "notification: Invalid length %u for engine failure\n", len);
 		return -EPROTO;
 	}
 
@@ -4778,8 +4772,8 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 	engine = intel_guc_lookup_engine(guc, guc_class, instance);
 	if (unlikely(!engine)) {
-		drm_err(&gt->i915->drm,
-			"Invalid engine %d:%d", guc_class, instance);
+		guc_err(guc, "notification: Invalid engine %d:%d for engine failure\n",
+			guc_class, instance);
 		return -EPROTO;
 	}
 
@@ -4787,7 +4781,7 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 	 * This is an unexpected failure of a hardware feature. So, log a real
 	 * error message not just the informational that comes with the reset.
 	 */
-	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because 0x%08X",
+	guc_err(guc, "notification: Engine reset request failed on %d:%d (%s) because 0x%08X\n",
 		guc_class, instance, engine->name, reason);
 
 	spin_lock_irqsave(&guc->submission_state.lock, flags);
@@ -5297,6 +5291,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		   unsigned long flags)
 {
 	struct guc_virtual_engine *ve;
+	struct intel_gt *gt;
 	struct intel_guc *guc;
 	unsigned int n;
 	int err;
@@ -5305,10 +5300,11 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 	if (!ve)
 		return ERR_PTR(-ENOMEM);
 
-	guc = &siblings[0]->gt->uc.guc;
+	gt = siblings[0]->gt;
+	guc = &gt->uc.guc;
 
 	ve->base.i915 = siblings[0]->i915;
-	ve->base.gt = siblings[0]->gt;
+	ve->base.gt = gt;
 	ve->base.uncore = siblings[0]->uncore;
 	ve->base.id = -1;
 
@@ -5336,8 +5332,7 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 
 		GEM_BUG_ON(!is_power_of_2(sibling->mask));
 		if (sibling->mask & ve->base.mask) {
-			DRM_DEBUG("duplicate %s entry in load balancer\n",
-				  sibling->name);
+			guc_dbg(guc, "Duplicate %s entry in load balancer\n", sibling->name);
 			err = -EINVAL;
 			goto err_put;
 		}
@@ -5346,8 +5341,8 @@ guc_create_virtual(struct intel_engine_cs **siblings, unsigned int count,
 		ve->base.logical_mask |= sibling->logical_mask;
 
 		if (n != 0 && ve->base.class != sibling->class) {
-			DRM_DEBUG("invalid mixing of engine class, sibling %d, already %d\n",
-				  sibling->class, ve->base.class);
+			guc_dbg(guc, "Invalid mixing of engine class, sibling %d, already %d\n",
+				sibling->class, ve->base.class);
 			err = -EINVAL;
 			goto err_put;
 		} else if (n == 0) {
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index e28518fe8b908..d588c32d65c54 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -65,7 +65,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
+			gt_err(gt, "Failed to create context, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -86,7 +86,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 
 		if (IS_ERR(rq)) {
 			ret = PTR_ERR(rq);
-			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
+			gt_err(gt, "Failed to create request, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -96,7 +96,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	for (i = 0; i < 3; ++i) {
 		ret = i915_request_wait(last[i], 0, HZ);
 		if (ret < 0) {
-			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+			gt_err(gt, "Last request failed to complete: %d\n", ret);
 			goto err;
 		}
 		i915_request_put(last[i]);
@@ -113,7 +113,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	/* GT will not idle if G2H are lost */
 	ret = intel_gt_wait_for_idle(gt, HZ);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		gt_err(gt, "GT failed to idle: %d\n", ret);
 		goto err;
 	}
 
@@ -153,7 +153,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 
 	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
-		drm_err(&gt->i915->drm, "Context array allocation failed\n");
+		guc_err(guc, "Context array allocation failed\n");
 		return -ENOMEM;
 	}
 
@@ -167,24 +167,24 @@ static int intel_guc_steal_guc_ids(void *arg)
 	if (IS_ERR(ce[context_index])) {
 		ret = PTR_ERR(ce[context_index]);
 		ce[context_index] = NULL;
-		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
+		guc_err(guc, "Failed to create context: %d\n", ret);
 		goto err_wakeref;
 	}
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		guc_err(guc, "Failed to create spinner: %d\n", ret);
 		goto err_contexts;
 	}
 	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
 					     MI_ARB_CHECK);
 	if (IS_ERR(spin_rq)) {
 		ret = PTR_ERR(spin_rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		guc_err(guc, "Failed to create spinner request: %d\n", ret);
 		goto err_contexts;
 	}
 	ret = request_add_spin(spin_rq, &spin);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		guc_err(guc, "Failed to add Spinner request: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -194,7 +194,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 		if (IS_ERR(ce[context_index])) {
 			ret = PTR_ERR(ce[context_index--]);
 			ce[context_index] = NULL;
-			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
+			guc_err(guc, "Failed to create context: %d\n", ret);
 			goto err_spin_rq;
 		}
 
@@ -203,7 +203,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 			ret = PTR_ERR(rq);
 			rq = NULL;
 			if (ret != -EAGAIN) {
-				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
+				guc_err(guc, "Failed to create request, %d: %d\n",
 					context_index, ret);
 				goto err_spin_rq;
 			}
@@ -218,7 +218,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	igt_spinner_end(&spin);
 	ret = intel_selftest_wait_for_rq(spin_rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
+		guc_err(guc, "Spin request failed to complete: %d\n", ret);
 		i915_request_put(last);
 		goto err_spin_rq;
 	}
@@ -230,7 +230,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(last, 0, HZ * 30);
 	i915_request_put(last);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
+		guc_err(guc, "Last request failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -238,7 +238,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	rq = nop_user_request(ce[context_index], NULL);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
+		guc_err(guc, "Failed to steal guc_id, %d: %d\n", context_index, ret);
 		goto err_spin_rq;
 	}
 
@@ -246,20 +246,20 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(rq, 0, HZ);
 	i915_request_put(rq);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
+		guc_err(guc, "Request with stolen guc_id failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Wait for idle */
 	ret = intel_gt_wait_for_idle(gt, HZ * 30);
 	if (ret < 0) {
-		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+		guc_err(guc, "GT failed to idle: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Verify a guc_id was stolen */
 	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
-		drm_err(&gt->i915->drm, "No guc_id was stolen");
+		guc_err(guc, "No guc_id was stolen\n");
 		ret = -EINVAL;
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
index d91b58f704039..07018ec75c21f 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_hangcheck.c
@@ -45,7 +45,7 @@ static int intel_hang_guc(void *arg)
 
 	ctx = kernel_context(gt->i915, NULL);
 	if (IS_ERR(ctx)) {
-		drm_err(&gt->i915->drm, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
+		gt_err(gt, "Failed get kernel context: %ld\n", PTR_ERR(ctx));
 		return PTR_ERR(ctx);
 	}
 
@@ -54,7 +54,7 @@ static int intel_hang_guc(void *arg)
 	ce = intel_context_create(engine);
 	if (IS_ERR(ce)) {
 		ret = PTR_ERR(ce);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		gt_err(gt, "Failed to create spinner request: %d\n", ret);
 		goto err;
 	}
 
@@ -63,13 +63,13 @@ static int intel_hang_guc(void *arg)
 	old_beat = engine->props.heartbeat_interval_ms;
 	ret = intel_engine_set_heartbeat(engine, BEAT_INTERVAL);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to boost heatbeat interval: %d\n", ret);
+		gt_err(gt, "Failed to boost heatbeat interval: %d\n", ret);
 		goto err;
 	}
 
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
+		gt_err(gt, "Failed to create spinner: %d\n", ret);
 		goto err;
 	}
 
@@ -77,28 +77,28 @@ static int intel_hang_guc(void *arg)
 	intel_context_put(ce);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
+		gt_err(gt, "Failed to create spinner request: %d\n", ret);
 		goto err_spin;
 	}
 
 	ret = request_add_spin(rq, &spin);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
+		gt_err(gt, "Failed to add Spinner request: %d\n", ret);
 		goto err_spin;
 	}
 
 	ret = intel_reset_guc(gt);
 	if (ret) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "Failed to reset GuC, ret = %d\n", ret);
+		gt_err(gt, "Failed to reset GuC, ret = %d\n", ret);
 		goto err_spin;
 	}
 
 	guc_status = intel_uncore_read(gt->uncore, GUC_STATUS);
 	if (!(guc_status & GS_MIA_IN_RESET)) {
 		i915_request_put(rq);
-		drm_err(&gt->i915->drm, "GuC failed to reset: status = 0x%08X\n", guc_status);
+		gt_err(gt, "GuC failed to reset: status = 0x%08X\n", guc_status);
 		ret = -EIO;
 		goto err_spin;
 	}
@@ -107,12 +107,12 @@ static int intel_hang_guc(void *arg)
 	ret = intel_selftest_wait_for_rq(rq);
 	i915_request_put(rq);
 	if (ret) {
-		drm_err(&gt->i915->drm, "Request failed to complete: %d\n", ret);
+		gt_err(gt, "Request failed to complete: %d\n", ret);
 		goto err_spin;
 	}
 
 	if (i915_reset_count(global) == reset_count) {
-		drm_err(&gt->i915->drm, "Failed to record a GPU reset\n");
+		gt_err(gt, "Failed to record a GPU reset\n");
 		ret = -EINVAL;
 		goto err_spin;
 	}
@@ -132,7 +132,7 @@ static int intel_hang_guc(void *arg)
 		ret = intel_selftest_wait_for_rq(rq);
 		i915_request_put(rq);
 		if (ret) {
-			drm_err(&gt->i915->drm, "No-op failed to complete: %d\n", ret);
+			gt_err(gt, "No-op failed to complete: %d\n", ret);
 			goto err;
 		}
 	}
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index d17982c36d256..04e28735a2ee6 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -115,30 +115,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
 
 	parent = multi_lrc_create_parent(gt, class, 0);
 	if (IS_ERR(parent)) {
-		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
+		gt_err(gt, "Failed creating contexts: %ld", PTR_ERR(parent));
 		return PTR_ERR(parent);
 	} else if (!parent) {
-		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
+		gt_dbg(gt, "Not enough engines in class: %d", class);
 		return 0;
 	}
 
 	rq = multi_lrc_nop_request(parent);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
+		gt_err(gt, "Failed creating requests: %d", ret);
 		goto out;
 	}
 
 	ret = intel_selftest_wait_for_rq(rq);
 	if (ret)
-		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
+		gt_err(gt, "Failed waiting on request: %d", ret);
 
 	i915_request_put(rq);
 
 	if (ret >= 0) {
 		ret = intel_gt_wait_for_idle(gt, HZ * 5);
 		if (ret < 0)
-			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
+			gt_err(gt, "GT failed to idle: %d\n", ret);
 	}
 
 out:
-- 
2.37.3

