Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF89636E93
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 00:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBAF10E661;
	Wed, 23 Nov 2022 23:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB2510E662;
 Wed, 23 Nov 2022 23:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669247445; x=1700783445;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5xiPkw+AYhKa2rb7cC2V04WFTfHaqhevSp5LDdmSnRE=;
 b=b3k2QqyeZ4mFnoV/r8UYQNySmej0TQpfS0FERjo8NQiJJGy9HeW43SjX
 M8HtEv+tANWSzXzst6s0Y9OPVmXv0f8lt3XhT/M/5HmfnKdNeij+FuoNt
 dyLZgl6nWkh4q1ra0eWGrGHGtZJ4ldlsQ5JQMnn9/uEf0qPhI42qqwHzt
 5yg779TVGB7aC4VETFQieeSrRIZYVJ7lbu7ggic5xMwv8ttQSRuuAa14+
 uVobRmUg5/b97iuY68CbwB2ZEAAcpOUnIWWgrgqndbRY5LwgphqQDNpcg
 K6T9eBCMRm/2KnTD3GuFgPwoDXx2hHupygssH2SH1raKzYfZCuuVE34uS Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="315331472"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="315331472"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 15:50:44 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="971040480"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="971040480"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 15:50:44 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: always init the delayed load fence
Date: Wed, 23 Nov 2022 15:54:17 -0800
Message-Id: <20221123235417.1475709-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fence is only tracking if the HuC load is in progress or not and
doesn't distinguish between already loaded, not supported or disabled,
so we can always initialize it to completed, no matter the actual
support. We already do that for most platforms, but we skip it on
GTs that lack VCS engines (i.e. MTL root GT), so fix that. Note that the
cleanup is already unconditional.

While at it, move the init/fini to helper functions.

Fixes: 02224691cb0f ("drm/i915/huc: fix leak of debug object in huc load fence on driver unload")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 47 +++++++++++++++++++-------
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 0976e9101346..5f393f8e8b2e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -211,6 +211,30 @@ void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *b
 	huc->delayed_load.nb.notifier_call = NULL;
 }
 
+static void delayed_huc_load_init(struct intel_huc *huc)
+{
+	/*
+	 * Initialize fence to be complete as this is expected to be complete
+	 * unless there is a delayed HuC reload in progress.
+	 */
+	i915_sw_fence_init(&huc->delayed_load.fence,
+			   sw_fence_dummy_notify);
+	i915_sw_fence_commit(&huc->delayed_load.fence);
+
+	hrtimer_init(&huc->delayed_load.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
+	huc->delayed_load.timer.function = huc_delayed_load_timer_callback;
+}
+
+static void delayed_huc_load_fini(struct intel_huc *huc)
+{
+	/*
+	 * the fence is initialized in init_early, so we need to clean it up
+	 * even if HuC loading is off.
+	 */
+	delayed_huc_load_complete(huc);
+	i915_sw_fence_fini(&huc->delayed_load.fence);
+}
+
 static bool vcs_supported(struct intel_gt *gt)
 {
 	intel_engine_mask_t mask = gt->info.engine_mask;
@@ -241,6 +265,15 @@ void intel_huc_init_early(struct intel_huc *huc)
 
 	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
 
+	/*
+	 * we always init the fence as already completed, even if HuC is not
+	 * supported. This way we don't have to distinguish between HuC not
+	 * supported/disabled or already loaded, band can focus on if the load
+	 * is currently in progress (fence not complete) or not, which is what
+	 * we care about for stalling userspace submissions.
+	 */
+	delayed_huc_load_init(huc);
+
 	if (!vcs_supported(gt)) {
 		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
 		return;
@@ -255,17 +288,6 @@ void intel_huc_init_early(struct intel_huc *huc)
 		huc->status.mask = HUC_FW_VERIFIED;
 		huc->status.value = HUC_FW_VERIFIED;
 	}
-
-	/*
-	 * Initialize fence to be complete as this is expected to be complete
-	 * unless there is a delayed HuC reload in progress.
-	 */
-	i915_sw_fence_init(&huc->delayed_load.fence,
-			   sw_fence_dummy_notify);
-	i915_sw_fence_commit(&huc->delayed_load.fence);
-
-	hrtimer_init(&huc->delayed_load.timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	huc->delayed_load.timer.function = huc_delayed_load_timer_callback;
 }
 
 #define HUC_LOAD_MODE_STRING(x) (x ? "GSC" : "legacy")
@@ -333,8 +355,7 @@ void intel_huc_fini(struct intel_huc *huc)
 	 * the fence is initialized in init_early, so we need to clean it up
 	 * even if HuC loading is off.
 	 */
-	delayed_huc_load_complete(huc);
-	i915_sw_fence_fini(&huc->delayed_load.fence);
+	delayed_huc_load_fini(huc);
 
 	if (intel_uc_fw_is_loadable(&huc->fw))
 		intel_uc_fw_fini(&huc->fw);
-- 
2.37.3

