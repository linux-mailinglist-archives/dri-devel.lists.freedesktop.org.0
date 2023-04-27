Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FCE6F061D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 14:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C863310E286;
	Thu, 27 Apr 2023 12:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EC810E24E;
 Thu, 27 Apr 2023 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682599549; x=1714135549;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Bw5ojLw9enuqneIjv3K4XlZeGlFBbkUShOnwPSCPhC4=;
 b=IZu2/rVU9QY8ZmZYwmNJPyPH/S6vQXHmMGvglGcoPXOG0npptVWokUYJ
 fIOvl72bWO4H5zkbv3e+tB0r3xaaMP56yrf0h7ZuV+DHvvJdHfAcLIwET
 LaOMNPuz+Dy0rzBeeqx1z8IZlSMzQEbSX1qanrFe7iEvKqxHLVeEOAIgG
 deywXHQQUlQzFuBvq8fMWIgP9ppZ/5EoBRSj40PJdDBBXv/YB+t1TMbzB
 l1Z6Go+ehDE+A6xrd5TmNj0RsLMb2VoByB3n9GSyjGbLhRow7uEzk7mXc
 ibZrtLsZbe6k77j7Ny5BwyOffqLobhDQswGjPjh+dAoC8UgSLPYEMqPCt g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="331680623"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="331680623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="688414512"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="688414512"
Received: from ebaldwin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.242])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 05:45:48 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 1/4] drm/i915: Move setting of rps thresholds to init
Date: Thu, 27 Apr 2023 13:45:34 +0100
Message-Id: <20230427124537.820273-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230427124537.820273-1-tvrtko.ursulin@linux.intel.com>
References: <20230427124537.820273-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Since 36d516be867c ("drm/i915/gt: Switch to manual evaluation of RPS")
thresholds are invariant so lets move their setting to init time.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 80968e49e2c3..05ce71ec5add 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -670,7 +670,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 threshold_up = 0, threshold_down = 0; /* in % */
 	u32 ei_up = 0, ei_down = 0;
 
 	lockdep_assert_held(&rps->power.mutex);
@@ -678,9 +677,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 	if (new_power == rps->power.mode)
 		return;
 
-	threshold_up = 95;
-	threshold_down = 85;
-
 	/* Note the units here are not exactly 1us, but 1280ns. */
 	switch (new_power) {
 	case LOW_POWER:
@@ -707,17 +703,22 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
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
@@ -729,8 +730,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
 skip_hw_write:
 	rps->power.mode = new_power;
-	rps->power.up_threshold = threshold_up;
-	rps->power.down_threshold = threshold_down;
 }
 
 static void gen6_rps_set_thresholds(struct intel_rps *rps, u8 val)
@@ -1556,10 +1555,12 @@ void intel_rps_enable(struct intel_rps *rps)
 		return;
 
 	GT_TRACE(rps_to_gt(rps),
-		 "min:%x, max:%x, freq:[%d, %d]\n",
+		 "min:%x, max:%x, freq:[%d, %d], thresholds:[%u, %u]\n",
 		 rps->min_freq, rps->max_freq,
 		 intel_gpu_freq(rps, rps->min_freq),
-		 intel_gpu_freq(rps, rps->max_freq));
+		 intel_gpu_freq(rps, rps->max_freq),
+		 rps->power.threshold_up,
+		 rps->power.threshold_down);
 
 	GEM_BUG_ON(rps->max_freq < rps->min_freq);
 	GEM_BUG_ON(rps->idle_freq > rps->max_freq);
@@ -2012,6 +2013,10 @@ void intel_rps_init(struct intel_rps *rps)
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
2.37.2

