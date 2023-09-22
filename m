Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67017ABBB2
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 00:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8304A10E19F;
	Fri, 22 Sep 2023 22:26:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8552910E71B;
 Fri, 22 Sep 2023 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695421568; x=1726957568;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9uUAC0XfcEmTzJBsWV/boLhyr2VylYigLz3ZDmASssY=;
 b=BOYXCsbol4SVQkpDOrGklBrDMINsQXcPA5SCmLKaqF/EU2Qn7GRC4UQX
 o69CDlp4bKeOTJIWzw7A+WLlaki4T0n8n+zilqstyU9rz9g5AjTgYvl44
 efAthHZFBolQBqh3Ek4CkEzCnVba2X10loUUeJZRnEg8NEThrllxby+pL
 RxdlfC4SA6Q+odgmkdbS8szS11Q8lSNaI2Q6PjbybQVVp3+d5keNOhKkE
 ZMUu8Y9yCRdW3EwGhz1ySqdbqwlrNzTVS5Z8qoouAA4gBthPe9DQ2Hvft
 qlt2oHu4r7tmoEWfW8gDGg7sTy+HU7CEXRr869VSuTfItSpGTKXy+Ojr1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379836617"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="379836617"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 15:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078549555"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="1078549555"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2023 15:25:57 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/3] drm/i915/mtl: Add a PMU counter for total active ticks
Date: Fri, 22 Sep 2023 15:25:09 -0700
Message-ID: <20230922222510.2235213-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
References: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Current engine busyness interface exposed by GuC has a few issues:

- The busyness of active engine is calculated using 2 values provided by
  GuC and is prone to race between CPU reading those values and GuC
  updating them. Any sort of HW synchronization would be at the cost of
  scheduling latencies.

- GuC provides only 32 bit values for busyness and KMD has to run a
  worker to extend the values to 64 bit. In addition KMD also needs to
  extend the GT timestamp to 64 bits so that it can be used to calculate
  active busyness for an engine.

To address these issues, GuC provides a new interface to calculate
engine busyness. GuC accumulates the busyness ticks in a 64 bit value
and also internally updates the busyness for an active context using a
periodic timer. This simplifies the KMD implementation such that KMD
only needs to relay the busyness value to the user.

In addition to fixing the interface, GuC also provides a periodically
total active ticks that the GT has been running for. This counter is
exposed to the user so that the % busyness can be calculated as follows:

busyness % = (engine active ticks/total active ticks) * 100.

Implement the new interface and start by adding a new counter for total
active ticks.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 +++++++++++++++++++
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  1 +
 drivers/gpu/drm/i915/i915_pmu.c               |  6 +++++
 include/uapi/drm/i915_drm.h                   |  2 ++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 88465d701c278..0c1fee5360777 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1607,6 +1607,30 @@ static ktime_t busy_v2_guc_engine_busyness(struct intel_engine_cs *engine, ktime
 	return ns_to_ktime(total);
 }
 
+static u64 busy_v1_intel_guc_total_active_ticks(struct intel_guc *guc)
+{
+	return guc->busy.v1.gt_stamp;
+}
+
+static u64 busy_v2_intel_guc_total_active_ticks(struct intel_guc *guc)
+{
+	u64 ticks_gt;
+
+	__busy_v2_get_engine_usage_record(guc, NULL, NULL, NULL, &ticks_gt);
+
+	return ticks_gt;
+}
+
+u64 intel_guc_total_active_ticks(struct intel_gt *gt)
+{
+	struct intel_guc *guc = &gt->uc.guc;
+
+	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 3, 1))
+		return busy_v1_intel_guc_total_active_ticks(guc);
+	else
+		return busy_v2_intel_guc_total_active_ticks(guc);
+}
+
 static int busy_v2_guc_action_enable_usage_stats_device(struct intel_guc *guc)
 {
 	u32 offset = guc_engine_usage_offset_v2_device(guc);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
index c57b29cdb1a64..f6d42838825f2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
@@ -30,6 +30,7 @@ void intel_guc_dump_active_requests(struct intel_engine_cs *engine,
 				    struct drm_printer *m);
 void intel_guc_busyness_park(struct intel_gt *gt);
 void intel_guc_busyness_unpark(struct intel_gt *gt);
+u64 intel_guc_total_active_ticks(struct intel_gt *gt);
 
 bool intel_guc_virtual_engine_has_heartbeat(const struct intel_engine_cs *ve);
 
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index d35973b411863..4f52636eb4a80 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -563,6 +563,8 @@ config_status(struct drm_i915_private *i915, u64 config)
 		break;
 	case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
 		break;
+	case I915_PMU_TOTAL_ACTIVE_TICKS:
+		break;
 	default:
 		return -ENOENT;
 	}
@@ -678,6 +680,9 @@ static u64 __i915_pmu_event_read(struct perf_event *event)
 		case I915_PMU_SOFTWARE_GT_AWAKE_TIME:
 			val = ktime_to_ns(intel_gt_get_awake_time(to_gt(i915)));
 			break;
+		case I915_PMU_TOTAL_ACTIVE_TICKS:
+			val = intel_guc_total_active_ticks(i915->gt[gt_id]);
+			break;
 		}
 	}
 
@@ -986,6 +991,7 @@ create_event_attributes(struct i915_pmu *pmu)
 		__global_event(2, "interrupts", NULL),
 		__event(3, "rc6-residency", "ns"),
 		__event(4, "software-gt-awake-time", "ns"),
+		__event(5, "total-active-ticks", NULL),
 	};
 	static const struct {
 		enum drm_i915_pmu_engine_sample sample;
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7000e5910a1d7..e26dd27ff4a5f 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -296,6 +296,7 @@ enum drm_i915_pmu_engine_sample {
 #define I915_PMU_INTERRUPTS		__I915_PMU_OTHER(2)
 #define I915_PMU_RC6_RESIDENCY		__I915_PMU_OTHER(3)
 #define I915_PMU_SOFTWARE_GT_AWAKE_TIME	__I915_PMU_OTHER(4)
+#define I915_PMU_TOTAL_ACTIVE_TICKS	__I915_PMU_OTHER(5)
 
 #define I915_PMU_LAST /* Deprecated - do not use */ I915_PMU_RC6_RESIDENCY
 
@@ -304,6 +305,7 @@ enum drm_i915_pmu_engine_sample {
 #define __I915_PMU_INTERRUPTS(gt)		___I915_PMU_OTHER(gt, 2)
 #define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
 #define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
+#define __I915_PMU_TOTAL_ACTIVE_TICKS(gt)	___I915_PMU_OTHER(gt, 5)
 
 /* Each region is a minimum of 16k, and there are at most 255 of them.
  */
-- 
2.41.0

