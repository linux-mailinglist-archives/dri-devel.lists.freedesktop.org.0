Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4446FFE85
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 03:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6A10E60E;
	Fri, 12 May 2023 01:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34FE10E60E;
 Fri, 12 May 2023 01:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683856407; x=1715392407;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z062jarxPGKiwu9dPHDqSPpPztGH9EpBq1Nf1/ozTsw=;
 b=DlS0pM8+wTvYVHjTvrAURVcdC0pIExX8CGhGDPYDk321fWDibLgIET0Q
 uC23VgTJgt991yxlYkny3Bb34xI5MMOkFDzvrIuRG+ofsmsbCNT2YngP0
 OuXfwvlFZ0NwqU2UwKtiMxdq3RSMgIXWIr9DJYjPW2852Y5hrpT5JPA8i
 4MKnQmdsnmffLVwcDs5PWcT0VLRLVgIIBQwInGiQII2B/Lw3xOIX35vsE
 ob1quOHnx7nK69g9dgvSxZqlHHSHwBeboB2XKXNb77ziMt+eNzGigvsJk
 nJ8tQL94j/s3+PsPOUJnxXuzARCeQ5gMqqjRb7v34MKUYDYbyIHO0dS7e Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="331044168"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="331044168"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 18:53:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="811871763"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="811871763"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 18:53:25 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/pmu: Turn off the timer to sample frequencies when
 GT is parked
Date: Thu, 11 May 2023 18:53:20 -0700
Message-Id: <20230512015320.2610830-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pmu_needs_timer() keeps the timer running even when GT is parked,
ostensibly to sample requested/actual frequencies. However
frequency_sample() has the following:

	/* Report 0/0 (actual/requested) frequency while parked. */
	if (!intel_gt_pm_get_if_awake(gt))
		return;

The above code prevents frequencies to be sampled while the GT is
parked. So we might as well turn off the sampling timer itself in this
case and save CPU cycles/power.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_pmu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 7ece883a7d956..8db1d681cf4ab 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -124,11 +124,14 @@ static bool pmu_needs_timer(struct i915_pmu *pmu, bool gpu_active)
 		  ENGINE_SAMPLE_MASK;
 
 	/*
-	 * When the GPU is idle per-engine counters do not need to be
-	 * running so clear those bits out.
+	 * When GPU is idle, frequency or per-engine counters do not need
+	 * to be running so clear those bits out.
 	 */
-	if (!gpu_active)
-		enable &= ~ENGINE_SAMPLE_MASK;
+	if (!gpu_active) {
+		enable &= ~(config_mask(I915_PMU_ACTUAL_FREQUENCY) |
+			    config_mask(I915_PMU_REQUESTED_FREQUENCY) |
+			    ENGINE_SAMPLE_MASK);
+	}
 	/*
 	 * Also there is software busyness tracking available we do not
 	 * need the timer for I915_SAMPLE_BUSY counter.
-- 
2.38.0

