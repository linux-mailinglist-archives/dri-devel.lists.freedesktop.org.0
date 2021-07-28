Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2819B3D9750
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 23:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED6C6E9A5;
	Wed, 28 Jul 2021 21:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D0F56E940;
 Wed, 28 Jul 2021 21:12:27 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10059"; a="209637304"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="209637304"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 14:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="580995547"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2021 14:12:23 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/14] drm/i915/guc/slpc: Enable ARAT timer interrupt
Date: Wed, 28 Jul 2021 14:11:40 -0700
Message-Id: <20210728211144.15322-11-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
References: <20210728211144.15322-1-vinay.belgaumkar@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This interrupt is enabled during RPS initialization, and
now needs to be done by SLPC code. It allows ARAT timer
expiry interrupts to get forwarded to GuC.

v2: Fix comment (Matthew Brost)

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 17 +++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       |  8 ++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 2643d207009b..742918875593 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -403,6 +403,21 @@ int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
 	return ret;
 }
 
+void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
+{
+	u32 pm_intrmsk_mbz = 0;
+
+	/*
+	 * Allow GuC to receive ARAT timer expiry event.
+	 * This interrupt register is setup by RPS code
+	 * when host based Turbo is enabled.
+	 */
+	pm_intrmsk_mbz |= ARAT_EXPIRED_INTRMSK;
+
+	intel_uncore_rmw(gt->uncore,
+			   GEN6_PMINTRMSK, pm_intrmsk_mbz, 0);
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
@@ -436,6 +451,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 	if (unlikely(ret < 0))
 		return ret;
 
+	intel_guc_pm_intrmsk_enable(&i915->gt);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index 3ffd4f2e3151..e45054d5b9b4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -9,6 +9,7 @@
 #include "intel_guc_submission.h"
 #include "intel_guc_slpc_types.h"
 
+struct intel_gt;
 struct drm_printer;
 
 static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
@@ -36,5 +37,6 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 int intel_guc_slpc_print_info(struct intel_guc_slpc *slpc, struct drm_printer *p);
+void intel_guc_pm_intrmsk_enable(struct intel_gt *gt);
 
 #endif
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index 3e0cd1f05e3b..b104fb7607eb 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -655,6 +655,7 @@ void intel_uc_suspend(struct intel_uc *uc)
 static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 {
 	struct intel_guc *guc = &uc->guc;
+	struct intel_gt *gt = guc_to_gt(guc);
 	int err;
 
 	if (!intel_guc_is_fw_running(guc))
@@ -666,6 +667,13 @@ static int __uc_resume(struct intel_uc *uc, bool enable_communication)
 	if (enable_communication)
 		guc_enable_communication(guc);
 
+	/* If we are only resuming GuC communication but not reloading
+	 * GuC, we need to ensure the ARAT timer interrupt is enabled
+	 * again. In case of GuC reload, it is enabled during SLPC enable.
+	 */
+	if (enable_communication && intel_uc_uses_guc_slpc(uc))
+		intel_guc_pm_intrmsk_enable(gt);
+
 	err = intel_guc_resume(guc);
 	if (err) {
 		DRM_DEBUG_DRIVER("Failed to resume GuC, err=%d", err);
-- 
2.25.0

