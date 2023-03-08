Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098216AFE66
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 06:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A551410E356;
	Wed,  8 Mar 2023 05:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BF4A10E309;
 Wed,  8 Mar 2023 05:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678253607; x=1709789607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8WfYIl/GxdL/clyQAhuY7hBgmcuTHA32Pyc7qk0XJoM=;
 b=nG7PTw83UxO6oFmr6bkhJB61EaKHiONmnojWpe6UvO5lgDCGgHgpyu2m
 rKtSJuDPBe1Je7ob53Lj8uIkyEpp1G9tQIca7MFK5IyOyGI+yWZJEVeAC
 67HOattxILbhi+aKCtXpDZe6PLRjXDaJ/0QKk83Ta4dtCR7M661TLqsK6
 /VIHEy3ZquF0Nn+zL28+3xgSIjIRSEaqONV067YDbNkowY0SNyzjAbtfJ
 J01MSrR6Pp4R5rAwls/h83B1Td88YLgtB/aL6pdpTrMYOxNYNS1TamhNi
 vWBIFCBYifZvHnN8Wg320UP62hl5qwroDHeofB2kNpio816aX6Bi6phxw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="334781366"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="334781366"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820071526"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="820071526"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 21:33:26 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/pmu: Use common freq functions with sysfs
Date: Tue,  7 Mar 2023 21:33:21 -0800
Message-Id: <20230308053321.939906-4-ashutosh.dixit@intel.com>
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

Using common freq functions with sysfs in PMU (but without taking
forcewake) solves the following issues (a) missing support for MTL (b)
missing support for older generation (prior to Gen6) (c) missing support
for slpc when freq sampling has to fall back to requested freq. It also
makes the PMU code future proof where sometimes code has been updated for
sysfs and PMU has been missed.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 10 ----------
 drivers/gpu/drm/i915/gt/intel_rps.h |  1 -
 drivers/gpu/drm/i915/i915_pmu.c     | 10 ++++------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 49df31927c0e..b03bfbe7ee23 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2046,16 +2046,6 @@ void intel_rps_sanitize(struct intel_rps *rps)
 		rps_disable_interrupts(rps);
 }
 
-u32 intel_rps_read_rpstat_fw(struct intel_rps *rps)
-{
-	struct drm_i915_private *i915 = rps_to_i915(rps);
-	i915_reg_t rpstat;
-
-	rpstat = (GRAPHICS_VER(i915) >= 12) ? GEN12_RPSTAT1 : GEN6_RPSTAT1;
-
-	return intel_uncore_read_fw(rps_to_gt(rps)->uncore, rpstat);
-}
-
 u32 intel_rps_read_rpstat(struct intel_rps *rps)
 {
 	struct drm_i915_private *i915 = rps_to_i915(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index a990f985ab23..60ae27679011 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -53,7 +53,6 @@ u32 intel_rps_get_rp1_frequency(struct intel_rps *rps);
 u32 intel_rps_get_rpn_frequency(struct intel_rps *rps);
 u32 intel_rps_read_punit_req_frequency(struct intel_rps *rps);
 u32 intel_rps_read_rpstat(struct intel_rps *rps);
-u32 intel_rps_read_rpstat_fw(struct intel_rps *rps);
 void gen6_rps_get_freq_caps(struct intel_rps *rps, struct intel_rps_freq_caps *caps);
 void intel_rps_raise_unslice(struct intel_rps *rps);
 void intel_rps_lower_unslice(struct intel_rps *rps);
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index a76c5ce9513d..1a4c9fed257c 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -392,14 +392,12 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
 		 * case we assume the system is running at the intended
 		 * frequency. Fortunately, the read should rarely fail!
 		 */
-		val = intel_rps_read_rpstat_fw(rps);
-		if (val)
-			val = intel_rps_get_cagf(rps, val);
-		else
-			val = rps->cur_freq;
+		val = intel_rps_read_actual_frequency_fw(rps);
+		if (!val)
+			val = intel_rps_get_requested_frequency_fw(rps),
 
 		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
-				intel_gpu_freq(rps, val), period_ns / 1000);
+				val, period_ns / 1000);
 	}
 
 	if (pmu->enable & config_mask(I915_PMU_REQUESTED_FREQUENCY)) {
-- 
2.38.0

