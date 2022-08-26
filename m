Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A6C5A30FF
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:27:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDD510E640;
	Fri, 26 Aug 2022 21:27:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DAF10E640;
 Fri, 26 Aug 2022 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549242; x=1693085242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GOoM/XZO0U8qMXwrNCWZJQe9WggTIh5lMql0SjsE+0I=;
 b=fdLsbiRkjGzsPI0AthV8U5HsKHXgShp/Y8rdlJMrhwq7aTwgUWscMYHu
 i2esM8e77MrT8T+0XPRX+MCavDHLBex2WSB5XYVQT8DYKcvqlH3QEXwlz
 RACwgg4rDHFsrTRjmIdjxUlRVfuWrkKW0Af2EJ+l1M5H1v2o8I0ZEg93N
 ZOnEk0rd3ZJV0FTDFZsxFsf5+YhYFBENcZvpRLo89JIUsnJu1N/Q1IZIU
 iRobH7Sml6y15aKOlkbdRpUs0nOHouw9a0gPgnhyef+p8rtEKIq74LWv9
 vG5M8My/QCIib4q84f4jDmCuOP0ChRcBFt/5MXaedatK802+ee4rZe0b4 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="358561612"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="358561612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:27:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="643804127"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:27:21 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/ats-m: Add thread execution tuning setting
Date: Fri, 26 Aug 2022 14:27:18 -0700
Message-Id: <20220826212718.409948-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On client DG2 platforms, optimal performance is achieved with the
hardware's default "age based" thread execution setting.  However on
ATS-M, switching this to "round robin after dependencies" provides
better performance.  We'll add a new "tuning" feature flag to the ATS-M
device info to enable/disable this setting.

Bspec: 68331
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     | 2 ++
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 9 +++++++++
 drivers/gpu/drm/i915/i915_pci.c             | 1 +
 drivers/gpu/drm/i915/intel_device_info.h    | 1 +
 4 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
index 94f9ddcfb3a5..d414785003cc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
@@ -1110,6 +1110,8 @@
 #define   GEN12_DISABLE_TDL_PUSH		REG_BIT(9)
 #define   GEN11_DIS_PICK_2ND_EU			REG_BIT(7)
 #define   GEN12_DISABLE_HDR_PAST_PAYLOAD_HOLD_FIX	REG_BIT(4)
+#define   THREAD_EX_ARB_MODE			REG_GENMASK(3, 2)
+#define   THREAD_EX_ARB_MODE_RR_AFTER_DEP	REG_FIELD_PREP(THREAD_EX_ARB_MODE, 0x2)
 
 #define HSW_ROW_CHICKEN3			_MMIO(0xe49c)
 #define   HSW_ROW_CHICKEN3_L3_GLOBAL_ATOMICS_DISABLE	(1 << 6)
diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 3cdb8294e13f..ff8c3735abc9 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2700,6 +2700,15 @@ add_render_compute_tuning_settings(struct drm_i915_private *i915,
 		       0 /* write-only, so skip validation */,
 		       true);
 	}
+
+	/*
+	 * This tuning setting proves beneficial only on ATS-M designs; the
+	 * default "age based" setting is optimal on regular DG2 and other
+	 * platforms.
+	 */
+	if (INTEL_INFO(i915)->tuning_thread_rr_after_dep)
+		wa_masked_field_set(wal, GEN9_ROW_CHICKEN4, THREAD_EX_ARB_MODE,
+				    THREAD_EX_ARB_MODE_RR_AFTER_DEP);
 }
 
 /*
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 857e8bb6865c..26b25d9434d6 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1080,6 +1080,7 @@ static const struct intel_device_info ats_m_info = {
 	DG2_FEATURES,
 	.display = { 0 },
 	.require_force_probe = 1,
+	.tuning_thread_rr_after_dep = 1,
 };
 
 #define XE_HPC_FEATURES \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index 0ccde94b225f..6904ad03ca19 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -171,6 +171,7 @@ enum intel_ppgtt_type {
 	func(has_runtime_pm); \
 	func(has_snoop); \
 	func(has_coherent_ggtt); \
+	func(tuning_thread_rr_after_dep); \
 	func(unfenced_needs_alignment); \
 	func(hws_needs_physical);
 
-- 
2.37.2

