Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034DC4550C5
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 23:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F716E402;
	Wed, 17 Nov 2021 22:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FC56E402;
 Wed, 17 Nov 2021 22:50:28 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221285274"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="221285274"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 14:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="536467646"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 17 Nov 2021 14:50:27 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915/gt: Improve "race-to-idle" at low frequencies
Date: Wed, 17 Nov 2021 14:49:55 -0800
Message-Id: <20211117224955.28999-4-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
References: <20211117224955.28999-1-vinay.belgaumkar@intel.com>
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

While the power consumption is proportional to the frequency, there is
also a static draw for active gates. The longer we are able to powergate
(rc6), the lower the static draw. Thus there is a sweetspot in the
frequency/power curve where we run at higher frequency in order to sleep
longer, aka race-to-idle. This is more evident at lower frequencies, so
let's look to bump the frequency if we think we will benefit by sleeping
longer at the higher frequency and so conserving power.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 31 ++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 3675ac93ded0..6af3231982af 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -63,6 +63,22 @@ static void set(struct intel_uncore *uncore, i915_reg_t reg, u32 val)
 	intel_uncore_write_fw(uncore, reg, val);
 }
 
+static bool race_to_idle(struct intel_rps *rps, u64 busy, u64 dt)
+{
+	unsigned int this = rps->cur_freq;
+	unsigned int next = rps->cur_freq + 1;
+	u64 next_dt = next * max(busy, dt);
+
+	/*
+	 * Compare estimated time spent in rc6 at the next power bin. If
+	 * we expect to sleep longer than the estimated increased power
+	 * cost of running at a higher frequency, it will be reduced power
+	 * consumption overall.
+	 */
+	return (((next_dt - this * busy) >> 10) * this * this >
+		((next_dt - next * busy) >> 10) * next * next);
+}
+
 static void rps_timer(struct timer_list *t)
 {
 	struct intel_rps *rps = from_timer(rps, t, timer);
@@ -133,7 +149,7 @@ static void rps_timer(struct timer_list *t)
 			if (!max_busy[i])
 				break;
 
-			busy += div_u64(max_busy[i], 1 << i);
+			busy += max_busy[i] >> i;
 		}
 		GT_TRACE(rps_to_gt(rps),
 			 "busy:%lld [%d%%], max:[%lld, %lld, %lld], interval:%d\n",
@@ -141,13 +157,18 @@ static void rps_timer(struct timer_list *t)
 			 max_busy[0], max_busy[1], max_busy[2],
 			 rps->pm_interval);
 
-		if (100 * busy > rps->power.up_threshold * dt &&
-		    rps->cur_freq < rps->max_freq_softlimit) {
+		if (rps->cur_freq < rps->max_freq_softlimit &&
+		    race_to_idle(rps, max_busy[0], dt)) {
+			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
+			rps->pm_interval = 1;
+			schedule_work(&rps->work);
+		} else if (rps->cur_freq < rps->max_freq_softlimit &&
+			   100 * busy > rps->power.up_threshold * dt) {
 			rps->pm_iir |= GEN6_PM_RP_UP_THRESHOLD;
 			rps->pm_interval = 1;
 			schedule_work(&rps->work);
-		} else if (100 * busy < rps->power.down_threshold * dt &&
-			   rps->cur_freq > rps->min_freq_softlimit) {
+		} else if (rps->cur_freq > rps->min_freq_softlimit &&
+			   100 * busy < rps->power.down_threshold * dt) {
 			rps->pm_iir |= GEN6_PM_RP_DOWN_THRESHOLD;
 			rps->pm_interval = 1;
 			schedule_work(&rps->work);
-- 
2.34.0

