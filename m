Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE535836CF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4420610F862;
	Thu, 28 Jul 2022 02:21:30 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BD110F5D3;
 Thu, 28 Jul 2022 02:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658974833; x=1690510833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SSojqK2GyXHbKSZbPncQ1PTflfmTboY8RrqXqkKnc5E=;
 b=a5SPejweIqwi2tPb+My8CzeRLgVaKEH0iYk4c5cLdWaxjLNgyqN87y5o
 lt4gZvZ6ha/4TAPYg2/TtSWXpehbY1OafbRZEFr9uYzZ/GVScRt9l0d3T
 ijsavUemC0Sr1+ietBCAVYcbz/CRKlQj6bXpd5WsyDcJLviIiZKaaVfkn
 TZjy9W0q9BVhzWL+FHzLuQAHf97D3aRl1+opKb7j8Y4MyLnRfN3yi4sGK
 XN4/I/DOLYDvLetyMVgQLrVQROIEoXA3TBd0l9rnNWcUvSvJ2yAyR1wUA
 rkwvc9wWk/pDto4TqxmP0jypQz5Qn1rQxBS1K0Bd086RtAkyyqiI13P4L g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="285947584"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="285947584"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="600648468"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 27 Jul 2022 19:20:28 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/7] drm/i915/guc: Add GuC <-> kernel time stamp translation
 information
Date: Wed, 27 Jul 2022 19:20:24 -0700
Message-Id: <20220728022028.2190627-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It is useful to be able to match GuC events to kernel events when
looking at the GuC log. That requires being able to convert GuC
timestamps to kernel time. So, when dumping error captures and/or GuC
logs, include a stamp in both time zones plus the clock frequency.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h    |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 19 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h     |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c |  2 ++
 drivers/gpu/drm/i915/i915_gpu_error.c      | 12 ++++++++++++
 drivers/gpu/drm/i915/i915_gpu_error.h      |  3 +++
 6 files changed, 40 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 60d6eb5f245b7..fc7979bd91db5 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1007,6 +1007,8 @@
 #define   GEN11_LSN_UNSLCVC_GAFS_HALF_CL2_MAXALLOC	(1 << 9)
 #define   GEN11_LSN_UNSLCVC_GAFS_HALF_SF_MAXALLOC	(1 << 7)
 
+#define GUCPMTIMESTAMP				_MMIO(0xc3e8)
+
 #define __GEN9_RCS0_MOCS0			0xc800
 #define GEN9_GFX_MOCS(i)			_MMIO(__GEN9_RCS0_MOCS0 + (i) * 4)
 #define __GEN9_VCS0_MOCS0			0xc900
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 2706a8c650900..ab4aacc516aa4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -389,6 +389,25 @@ void intel_guc_write_params(struct intel_guc *guc)
 	intel_uncore_forcewake_put(uncore, FORCEWAKE_GT);
 }
 
+void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p)
+{
+	struct intel_gt *gt = guc_to_gt(guc);
+	intel_wakeref_t wakeref;
+	u32 stamp = 0;
+	u64 ktime;
+
+	intel_device_info_print_runtime(RUNTIME_INFO(gt->i915), p);
+
+	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref)
+		stamp = intel_uncore_read(gt->uncore, GUCPMTIMESTAMP);
+	ktime = ktime_get_boottime_ns();
+
+	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", ktime, ktime);
+	drm_printf(p, "GuC timestamp: 0x%08X [%u]\n", stamp, stamp);
+	drm_printf(p, "CS timestamp frequency: %u Hz, %u ns\n",
+		   gt->clock_frequency, gt->clock_period_ns);
+}
+
 int intel_guc_init(struct intel_guc *guc)
 {
 	struct intel_gt *gt = guc_to_gt(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index a7acffbf15d1f..804133df1ac9b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -464,4 +464,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
 
 void intel_guc_write_barrier(struct intel_guc *guc);
 
+void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 991d4a02248dc..07d31ae32f765 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -764,6 +764,8 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 	if (!obj)
 		return 0;
 
+	intel_guc_dump_time_info(guc, p);
+
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
 		DRM_DEBUG("Failed to pin object\n");
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 32e92651ef7c2..addba75252343 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -678,6 +678,7 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
 
 	intel_uc_fw_dump(&error_uc->guc_fw, &p);
 	intel_uc_fw_dump(&error_uc->huc_fw, &p);
+	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
 	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
 }
 
@@ -720,6 +721,8 @@ static void err_print_gt_global_nonguc(struct drm_i915_error_state_buf *m,
 	int i;
 
 	err_printf(m, "GT awake: %s\n", str_yes_no(gt->awake));
+	err_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
+		   gt->clock_frequency, gt->clock_period_ns);
 	err_printf(m, "EIR: 0x%08x\n", gt->eir);
 	err_printf(m, "PGTBL_ER: 0x%08x\n", gt->pgtbl_er);
 
@@ -1675,6 +1678,13 @@ gt_record_uc(struct intel_gt_coredump *gt,
 	 */
 	error_uc->guc_fw.path = kstrdup(uc->guc.fw.path, ALLOW_FAIL);
 	error_uc->huc_fw.path = kstrdup(uc->huc.fw.path, ALLOW_FAIL);
+
+	/*
+	 * Save the GuC log and include a timestamp reference for converting the
+	 * log times to system times (in conjunction with the error->boottime and
+	 * gt->clock_frequency fields saved elsewhere).
+	 */
+	error_uc->timestamp = intel_uncore_read(gt->_gt->uncore, GUCPMTIMESTAMP);
 	error_uc->guc_log = create_vma_coredump(gt->_gt, uc->guc.log.vma,
 						"GuC log buffer", compress);
 
@@ -1833,6 +1843,8 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
 static void gt_record_info(struct intel_gt_coredump *gt)
 {
 	memcpy(&gt->info, &gt->_gt->info, sizeof(struct intel_gt_info));
+	gt->clock_frequency = gt->_gt->clock_frequency;
+	gt->clock_period_ns = gt->_gt->clock_period_ns;
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.h b/drivers/gpu/drm/i915/i915_gpu_error.h
index 55a143b92d10e..d8a8b3d529e09 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.h
+++ b/drivers/gpu/drm/i915/i915_gpu_error.h
@@ -150,6 +150,8 @@ struct intel_gt_coredump {
 	u32 gtt_cache;
 	u32 aux_err; /* gen12 */
 	u32 gam_done; /* gen12 */
+	u32 clock_frequency;
+	u32 clock_period_ns;
 
 	/* Display related */
 	u32 derrmr;
@@ -164,6 +166,7 @@ struct intel_gt_coredump {
 		struct intel_uc_fw guc_fw;
 		struct intel_uc_fw huc_fw;
 		struct i915_vma_coredump *guc_log;
+		u32 timestamp;
 		bool is_guc_capture;
 	} *uc;
 
-- 
2.37.1

