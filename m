Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D67106F1
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E93C10E822;
	Thu, 25 May 2023 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2755010E7ED;
 Thu, 25 May 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002324; x=1716538324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDLE4BP8NG38071oub8jBXpRkuf5hDwFu5wqVx5fvXU=;
 b=MjsTDz0dBlHTygcFOivTd92fmCibhe7aJbP4ej/pencVy97/vschzCDD
 r/2NulnBHHlfDkgl6jdZpgf5f4p2bV+YFSHyau9A5FLJQU6ccSZqgBsqj
 Ysm4CmkH7q0nRWqLw/0dyELyCMefoIH8/T8eSXWvrKdjXb5UlGGaPY+Sg
 4wHwt9WNP2IOVzcYrF0GzILvfGygx6ACG8JkhrCj0SHgmO6GADYZPbp+f
 eNl6GBVpab653EvXNsqCEWsYZuyhfII50in2qo1zy4Nm4O8Pt7XJZWuOC
 JhYEFdAiRgDkYybMeGgUUJ6UjozrqCd8pB7nhTc7QrK6GGyQaMecr++yC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288490"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288490"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655122955"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655122955"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:43 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/i915: Move setting of rps thresholds to init
Date: Thu, 25 May 2023 09:11:29 +0100
Message-Id: <20230525081133.215292-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
References: <20230525081133.215292-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
index e68a99205599..791097eb9bfd 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -671,7 +671,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 {
 	struct intel_gt *gt = rps_to_gt(rps);
 	struct intel_uncore *uncore = gt->uncore;
-	u32 threshold_up = 0, threshold_down = 0; /* in % */
 	u32 ei_up = 0, ei_down = 0;
 
 	lockdep_assert_held(&rps->power.mutex);
@@ -679,9 +678,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 	if (new_power == rps->power.mode)
 		return;
 
-	threshold_up = 95;
-	threshold_down = 85;
-
 	/* Note the units here are not exactly 1us, but 1280ns. */
 	switch (new_power) {
 	case LOW_POWER:
@@ -708,17 +704,22 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
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
@@ -730,8 +731,6 @@ static void rps_set_power(struct intel_rps *rps, int new_power)
 
 skip_hw_write:
 	rps->power.mode = new_power;
-	rps->power.up_threshold = threshold_up;
-	rps->power.down_threshold = threshold_down;
 }
 
 static void gen6_rps_set_thresholds(struct intel_rps *rps, u8 val)
@@ -1557,10 +1556,12 @@ void intel_rps_enable(struct intel_rps *rps)
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
@@ -2013,6 +2014,10 @@ void intel_rps_init(struct intel_rps *rps)
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

