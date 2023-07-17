Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF875695F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 18:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0437210E286;
	Mon, 17 Jul 2023 16:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3152F10E03E;
 Mon, 17 Jul 2023 16:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689612021; x=1721148021;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=hoRMHmE34TCBY97B0XtZfCHG6G+tRfUDIPgfRH2Y26k=;
 b=beTr/B5ys0rTMxHfTe7SeZkixnCx8rTm8kTXqrzPxCtyQM45KCWONlsM
 da/7UT+7cerf4S/WE2rxShjg/Z2F7UwyeBtmZPlMdCwbWOL4Qfp3+tPq8
 C1VmvpKPgx2dLJxr4MVhThM3+KGXLrZe5Dqcw5pVe7Dm1bYgK2NVeARxQ
 P9S/8ebEgyBWcoy+/iMQD4MNXmlFdfPUYD7/gz+PwwgYFYy2LIfUdGd5E
 mVdaYcIqAPcDRs+oFYs9c+OSpnGEN9LLQmlo9JwkLmYF4NfVigoT2DvbX
 rEyD2Pyk3Br3t6gEEf5lnVgWqOnaJzMZylhT7sedaWw9XxZ7UTIbIH+Lb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="396807505"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="396807505"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 09:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="793305984"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="793305984"
Received: from rgwhiteh-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.103])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 09:40:21 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [CI 3/4] drm/i915: Add helpers for managing rps thresholds
Date: Mon, 17 Jul 2023 17:40:12 +0100
Message-Id: <20230717164013.826614-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230717164013.826614-1-tvrtko.ursulin@linux.intel.com>
References: <20230717164013.826614-1-tvrtko.ursulin@linux.intel.com>
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
index 69847f919586..092542f53aad 100644
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
@@ -2576,6 +2578,58 @@ int intel_rps_set_min_frequency(struct intel_rps *rps, u32 val)
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

