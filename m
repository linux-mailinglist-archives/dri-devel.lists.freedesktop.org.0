Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E175695D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 18:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFFB10E285;
	Mon, 17 Jul 2023 16:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3A10E03E;
 Mon, 17 Jul 2023 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689612020; x=1721148020;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DotjDDiWaUKBkx7u0JFpmz6+nvd4U7S8545srb3U3gg=;
 b=W1bto7LGyuBTyyYaxSDtbwhnfvBECAftgBAfBAB/pw9RvckfXlxp2BDk
 RQ4g1m6pKGV2kBdT948Pw9B/tJZBSrn0xbG6l0CqWyx3i3Lm21b6y9zVT
 D2Hlq9UgjzZeq9Wc9vda6BsKDIRRcU+R9z8BwPLBpIga6RCmrJ1MUAt2y
 NyIGtspoU29aiyQeyy2B+oy6KtkqPvImAHGfT2sE/w8EPzHlq3pzbLqka
 6cyXMzdlQiHA4OeoQir0Bt1VZ0QfL8YVyIIRKdqwQoCdRNoyA4qTxwmpG
 W8OrP+kxlGy5CM8Fea+zpX1JkgBqw9D78YFtV2q8go990vln4kapAbV+C w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396807485"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396807485"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 09:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793305977"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="793305977"
Received: from rgwhiteh-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.103])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 09:40:18 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 1/4] drm/i915: Move setting of rps thresholds to init
Date: Mon, 17 Jul 2023 17:40:10 +0100
Message-Id: <20230717164013.826614-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Since 36d516be867c ("drm/i915/gt: Switch to manual evaluation of RPS")
thresholds are invariant so lets move their setting to init time.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index e92e626d4994..20d44549f65e 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -672,7 +672,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 threshold_up = 0, threshold_down = 0; /* in % */
 	u32 ei_up = 0, ei_down = 0;
 
 	lockdep_assert_held(&rps->power.mutex);
@@ -680,9 +679,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 	if (new_power == rps->power.mode)
 		return;
 
-	threshold_up = 95;
-	threshold_down = 85;
-
 	/* Note the units here are not exactly 1us, but 1280ns. */
 	switch (new_power) {
 	case LOW_POWER:
@@ -709,17 +705,22 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
 	GT_TRACE(gt,
 		 "changing power mode [%d], up %d%% @ %dus, down %d%% @ %dus\n",
-		 new_power, threshold_up, ei_up, threshold_down, ei_down);
+		 new_power,
+		 rps->power.up_threshold, ei_up,
+		 rps->power.down_threshold, ei_down);
 
 	set(uncore, GEN6_RP_UP_EI,
 	    intel_gt_ns_to_pm_interval(gt, ei_up * 1000));
 	set(uncore, GEN6_RP_UP_THRESHOLD,
-	    intel_gt_ns_to_pm_interval(gt, ei_up * threshold_up * 10));
+	    intel_gt_ns_to_pm_interval(gt,
+				       ei_up * rps->power.up_threshold * 10));
 
 	set(uncore, GEN6_RP_DOWN_EI,
 	    intel_gt_ns_to_pm_interval(gt, ei_down * 1000));
 	set(uncore, GEN6_RP_DOWN_THRESHOLD,
-	    intel_gt_ns_to_pm_interval(gt, ei_down * threshold_down * 10));
+	    intel_gt_ns_to_pm_interval(gt,
+				       ei_down *
+				       rps->power.down_threshold * 10));
 
 	set(uncore, GEN6_RP_CONTROL,
 	    (GRAPHICS_VER(gt->i915) > 9 ? 0 : GEN6_RP_MEDIA_TURBO) |
@@ -731,8 +732,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
 skip_hw_write:
 	rps->power.mode = new_power;
-	rps->power.up_threshold = threshold_up;
-	rps->power.down_threshold = threshold_down;
 }
 
 static void gen6_rps_set_thresholds(struct intel_rps *rps, u8 val)
@@ -1559,10 +1558,12 @@ void intel_rps_enable(struct intel_rps *rps)
 		return;
 
 	GT_TRACE(rps_to_gt(rps),
-		 "min:%x, max:%x, freq:[%d, %d]\n",
+		 "min:%x, max:%x, freq:[%d, %d], thresholds:[%u, %u]\n",
 		 rps->min_freq, rps->max_freq,
 		 intel_gpu_freq(rps, rps->min_freq),
-		 intel_gpu_freq(rps, rps->max_freq));
+		 intel_gpu_freq(rps, rps->max_freq),
+		 rps->power.up_threshold,
+		 rps->power.down_threshold);
 
 	GEM_BUG_ON(rps->max_freq < rps->min_freq);
 	GEM_BUG_ON(rps->idle_freq > rps->max_freq);
@@ -2015,6 +2016,10 @@ void intel_rps_init(struct intel_rps *rps)
 		}
 	}
 
+	/* Set default thresholds in % */
+	rps->power.up_threshold = 95;
+	rps->power.down_threshold = 85;
+
 	/* Finally allow us to boost to max by default */
 	rps->boost_freq = rps->max_freq;
 	rps->idle_freq = rps->min_freq;
-- 
2.39.2

