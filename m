Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012E7106F8
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 10:12:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 840F410E837;
	Thu, 25 May 2023 08:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEAF10E7EE;
 Thu, 25 May 2023 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685002324; x=1716538324;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+nW8raZKAXdJGmhot6gh+COWAuiuGKfmAU+0FwzPoKI=;
 b=e7R32cSeoHtC/B5W0ICN4RxazJLqnUeIbUTj/IAE47dHyh2ZkeFmUa0D
 jdg/8XBSqodccwmzyxOpaQ08AKgbhlE8XD0c2/WUq989tFncBaqVatkm9
 sOJmaJLZ+FlnBx6gz4Ys/darG45blC5ofBhkokZI5BOFH6C4AmyBj73e5
 sGfbMlyTrxoLjQLp4eEJiBw06fdQMnKGVRMzq06RjHBxlx6HmOyGHVKRt
 sM908kd+9+Z9WOHe3UbRWPbV477t2eHGM/r6zBscnwp8KNAWxdVHv6Gsv
 IWv9fFGB1NJ4LK4090z9ci24r14WkBDG8KlUlFiLFzQCH3YmLpd+IsXP3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="417288499"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="417288499"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655122979"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="655122979"
Received: from moiraric-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.234.103])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 01:11:47 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] drm/i915: Add helpers for managing rps thresholds
Date: Thu, 25 May 2023 09:11:31 +0100
Message-Id: <20230525081133.215292-4-tvrtko.ursulin@linux.intel.com>
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

In preparation for exposing via sysfs add helpers for managing rps
thresholds.

v2:
 * Force sw and hw re-programming on threshold change.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rps.c | 54 +++++++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_rps.h |  4 +++
 2 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 333abc8f7ecb..afde601a6111 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -16,7 +16,9 @@
 #include "intel_gt.h"
 #include "intel_gt_clock_utils.h"
 #include "intel_gt_irq.h"
+#include "intel_gt_pm.h"
 #include "intel_gt_pm_irq.h"
+#include "intel_gt_print.h"
 #include "intel_gt_regs.h"
 #include "intel_mchbar_regs.h"
 #include "intel_pcode.h"
@@ -2574,6 +2576,58 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
 		return set_min_freq(rps, val);
 }
 
+u8 intel_rps_get_up_threshold(struct intel_rps *rps)
+{
+	return rps->power.up_threshold;
+}
+
+static int rps_set_threshold(struct intel_rps *rps, u8 *threshold, u8 val)
+{
+	int ret;
+
+	if (val > 100)
+		return -EINVAL;
+
+	ret = mutex_lock_interruptible(&rps->lock);
+	if (ret)
+		return ret;
+
+	if (*threshold == val)
+		goto out_unlock;
+
+	*threshold = val;
+
+	/* Force reset. */
+	rps->last_freq = -1;
+	mutex_lock(&rps->power.mutex);
+	rps->power.mode = -1;
+	mutex_unlock(&rps->power.mutex);
+
+	intel_rps_set(rps, clamp(rps->cur_freq,
+				 rps->min_freq_softlimit,
+				 rps->max_freq_softlimit));
+
+out_unlock:
+	mutex_unlock(&rps->lock);
+
+	return ret;
+}
+
+int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold)
+{
+	return rps_set_threshold(rps, &rps->power.up_threshold, threshold);
+}
+
+u8 intel_rps_get_down_threshold(struct intel_rps *rps)
+{
+	return rps->power.down_threshold;
+}
+
+int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold)
+{
+	return rps_set_threshold(rps, &rps->power.down_threshold, threshold);
+}
+
 static void intel_rps_set_manual(struct intel_rps *rps, bool enable)
 {
 	struct intel_uncore *uncore = rps_to_uncore(rps);
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.h b/drivers/gpu/drm/i915/gt/intel_rps.h
index a3fa987aa91f..92fb01f5a452 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.h
+++ b/drivers/gpu/drm/i915/gt/intel_rps.h
@@ -37,6 +37,10 @@ void intel_rps_mark_interactive(struct intel_rps *rps, bool interactive);
 
 int intel_gpu_freq(struct intel_rps *rps, int val);
 int intel_freq_opcode(struct intel_rps *rps, int val);
+u8 intel_rps_get_up_threshold(struct intel_rps *rps);
+int intel_rps_set_up_threshold(struct intel_rps *rps, u8 threshold);
+u8 intel_rps_get_down_threshold(struct intel_rps *rps);
+int intel_rps_set_down_threshold(struct intel_rps *rps, u8 threshold);
 u32 intel_rps_read_actual_frequency(struct intel_rps *rps);
 u32 intel_rps_read_actual_frequency_fw(struct intel_rps *rps);
 u32 intel_rps_get_requested_frequency(struct intel_rps *rps);
-- 
2.39.2

