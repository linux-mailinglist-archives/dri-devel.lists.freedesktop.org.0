Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC268572A00
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60298976D9;
	Tue, 12 Jul 2022 23:31:44 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03162976B9;
 Tue, 12 Jul 2022 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VuMvfjQQB8L/h3Nyp5OLpiuai7an51itwG9GQ9JeVKM=;
 b=DQxwv4URKe40kechVxKR6CaBDCGs0G2g2HhZ64DFn88ezCOrOh928Axr
 3/tQ6MeDyPWwTNfjFou8Upy3WNnIOJOdhQa95WtpPD2I4Z4h1yP9+C33T
 m4kCkWrpNFaU3/d4kkG/Y7tO5jUqZogTmSj4LwI4GKQv6X9pCzXc+QL+L
 5ls+0giLmTiCjCcjYfs+MR1H0A8nFGZlyfWQjQl6dMZiHomrRmD0AOAEU
 ppU+jGhVP/zxcqSUUhg4IFkHY6OE63Un7KUeks8T631hsqSLrN9Y/ZO6Q
 374/UsAyy/J6SBAjnu2hoqcPMuXEOx8M1URuXLii886Ahnp+9ODErBpaH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812564"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812564"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137765"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 04/12] drm/i915/guc: Add GuC <-> kernel time stamp translation
 information
Date: Tue, 12 Jul 2022 16:31:28 -0700
Message-Id: <20220712233136.1044951-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
index e6bb24dc7b998..b1258f7239b06 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1004,6 +1004,8 @@
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
index d0d99f178f2d4..111484372e6f8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -459,4 +459,6 @@ void intel_guc_load_status(struct intel_guc *guc, struct drm_printer *p);
 
 void intel_guc_write_barrier(struct intel_guc *guc);
 
+void intel_guc_dump_time_info(struct intel_guc *guc, struct drm_printer *p);
+
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
index 02311ad902641..45f62cdabe356 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
@@ -763,6 +763,8 @@ int intel_guc_log_dump(struct intel_guc_log *log, struct drm_printer *p,
 	if (!obj)
 		return 0;
 
+	intel_guc_dump_time_info(guc, p);
+
 	map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
 	if (IS_ERR(map)) {
 		DRM_DEBUG("Failed to pin object\n");
diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
index 52ea13fee015e..5bcf36c292ebd 100644
--- a/drivers/gpu/drm/i915/i915_gpu_error.c
+++ b/drivers/gpu/drm/i915/i915_gpu_error.c
@@ -690,6 +690,7 @@ static void err_print_uc(struct drm_i915_error_state_buf *m,
 
 	intel_uc_fw_dump(&error_uc->guc_fw, &p);
 	intel_uc_fw_dump(&error_uc->huc_fw, &p);
+	err_printf(m, "GuC timestamp: 0x%08x\n", error_uc->timestamp);
 	intel_gpu_error_print_vma(m, NULL, error_uc->guc_log);
 }
 
@@ -732,6 +733,8 @@ static void err_print_gt_global_nonguc(struct drm_i915_error_state_buf *m,
 	int i;
 
 	err_printf(m, "GT awake: %s\n", str_yes_no(gt->awake));
+	err_printf(m, "CS timestamp frequency: %u Hz, %d ns\n",
+		   gt->clock_frequency, gt->clock_period_ns);
 	err_printf(m, "EIR: 0x%08x\n", gt->eir);
 	err_printf(m, "PGTBL_ER: 0x%08x\n", gt->pgtbl_er);
 
@@ -1687,6 +1690,13 @@ gt_record_uc(struct intel_gt_coredump *gt,
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
 
@@ -1845,6 +1855,8 @@ static void gt_record_global_regs(struct intel_gt_coredump *gt)
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
2.36.0

