Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7AF6AFE5F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 06:33:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7404E10E23C;
	Wed,  8 Mar 2023 05:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2725910E309;
 Wed,  8 Mar 2023 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678253607; x=1709789607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L77nGrkX09htK6OOMq92wxbOoKCiw1KxlZZzJBkmSu4=;
 b=P/xdDUEbWcETrzmS6H+uRiw38hP74zicy9YAZmeJ3PWPvyKxir7qih0u
 yrHBlEg1a/t2ROT5qQ0sVdGHrKhw9A9Atstr7NJwCKj0S9yyiJaiLjxsV
 BzkXteqRdcxlmWP3/0iYJ1axUOAeacuei4dokgYGKv2wOy6NeEgwi4s6O
 zjVKtXi8/+wbBLd0t8z70rU42nVgDKbTuhR5FGE9lcrnAp8GE97BtLHPJ
 KZVFZWz+7yDxyUdMUkBV7l2dZopEIAw+HwS+YcKeOiXkLDM3XOWYPtb3F
 ZA0P9hIv/JmbGn8ljUJu45Xgr/kijnzRlb0svylkALawJFMOgD2Vr4HKJ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334781364"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="334781364"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820071519"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="820071519"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:26 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/rps: Expose read_actual_frequency_fw for PMU
Date: Tue,  7 Mar 2023 21:33:19 -0800
Message-Id: <20230308053321.939906-2-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230308053321.939906-1-ashutosh.dixit@intel.com>
References: <20230308053321.939906-1-ashutosh.dixit@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose intel_rps_read_actual_frequency_fw to read the actual/granted freq
without taking forcewake. This is done for use by PMU which does not take
forcewake when reading freq. The code is refactored to use a common set of
functions across sysfs and PMU. It also allows PMU to support MTL as well
as older generations (before Gen6) which were previously missed due to the
non-use of common functions across sysfs and PMU.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 36 +++++++++++++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_rps.h |  1 +
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 4d0dc9de23f9..0a8e24bcb874 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2089,10 +2089,11 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
 	return cagf;
 }
 
-static u32 read_cagf(struct intel_rps *rps)
+static u32 __read_cagf(struct intel_rps *rps, bool take_fw)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
 	struct intel_uncore *uncore = rps_to_uncore(rps);
+	i915_reg_t r = INVALID_MMIO_REG;
 	u32 freq;
 
 	/*
@@ -2100,22 +2101,30 @@ static u32 read_cagf(struct intel_rps *rps)
 	 * registers will return 0 freq when GT is in RC6
 	 */
 	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70)) {
-		freq = intel_uncore_read(uncore, MTL_MIRROR_TARGET_WP1);
+		r = MTL_MIRROR_TARGET_WP1;
 	} else if (GRAPHICS_VER(i915) >= 12) {
-		freq = intel_uncore_read(uncore, GEN12_RPSTAT1);
+		r = GEN12_RPSTAT1;
 	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
 		vlv_punit_get(i915);
 		freq = vlv_punit_read(i915, PUNIT_REG_GPU_FREQ_STS);
 		vlv_punit_put(i915);
+		goto exit;
 	} else if (GRAPHICS_VER(i915) >= 6) {
-		freq = intel_uncore_read(uncore, GEN6_RPSTAT1);
+		r = GEN6_RPSTAT1;
 	} else {
-		freq = intel_uncore_read(uncore, MEMSTAT_ILK);
+		r = MEMSTAT_ILK;
 	}
 
+	freq = take_fw ? intel_uncore_read(uncore, r) : intel_uncore_read_fw(uncore, r);
+exit:
 	return intel_rps_get_cagf(rps, freq);
 }
 
+static u32 read_cagf(struct intel_rps *rps)
+{
+	return __read_cagf(rps, true);
+}
+
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 {
 	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
@@ -2128,6 +2137,23 @@ u32 intel_rps_read_actual_frequency(struct intel_rps *rps)
 	return freq;
 }
 
+static u32 read_cagf_fw(struct intel_rps *rps)
+{
+	return __read_cagf(rps, false);
+}
+
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps)
+{
+	struct intel_runtime_pm *rpm = rps_to_uncore(rps)->rpm;
+	intel_wakeref_t wakeref;
+	u32 freq = 0;
+
+	with_intel_runtime_pm_if_in_use(rpm, wakeref)
+		freq = intel_gpu_freq(rps, read_cagf_fw(rps));
+
+	return freq;
+}
+
 u32 intel_rps_read_punit_req(struct intel_rps *rps)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index c622962c6bef..63511b826a97 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -39,6 +39,7 @@ int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
 u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat1);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
+u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
 u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_frequency(struct intel_rps *rps);
 u32 intel_rps_get_min_raw_freq(struct intel_rps *rps);
-- 
2.38.0

