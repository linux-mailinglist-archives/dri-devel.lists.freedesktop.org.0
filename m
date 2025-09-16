Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA670B58F47
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602AC10E6D7;
	Tue, 16 Sep 2025 07:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cUuvk7m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B52510E6D5;
 Tue, 16 Sep 2025 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758008136; x=1789544136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rjOY4Y6cNdEtSowN3dgr77KEsO7PGGJYLnHg1nC+B4=;
 b=cUuvk7m3/5gew6KctMOZ64A2N/z0SlmQjZ/V+cA3R5HY9iYPVAMVB3h5
 YdXWBg4qbo/yaD20esXOG0uvNV7HYP/SMdSyQkC5oK/jTvW1chJPhfTTS
 1X+mIE4ZkEE/WuTeRGwA1NqL9vB79ihwi/Ev3wSoslqN3IySz+YzTIsF+
 qJ8zwqPDgdxEBGZ++xrJGlirkPCv7Wazn5MpC3VO7C0gMXaFprEhK9nDm
 nlNLsWZDgRZbYGp/hlM440z2+wczUlH6axpM7xqptRxQjcJ6Y/FoD39ZO
 bl2tXG43KSG4T6bNuFKJ8LWPDWTPjizPR/TJQRBHKsnpS6XFhyaXga+48 A==;
X-CSE-ConnectionGUID: VB5+BE3MSDGUSV4RCVPTKw==
X-CSE-MsgGUID: WrG++k20QsCTyS+w5pmlMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70960411"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70960411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:35:34 -0700
X-CSE-ConnectionGUID: bzg4OP72ShyjgaMj1q4b7g==
X-CSE-MsgGUID: 21sHvo0wQ56qB6W5+kTZlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179250749"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 00:35:31 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v3 2/3] drm/xe: Add DRM GPU frequency tracepoint to Xe
Date: Tue, 16 Sep 2025 12:57:03 +0530
Message-Id: <20250916072704.2351591-3-s.sebinraj@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916072704.2351591-1-s.sebinraj@intel.com>
References: <20250916072704.2351591-1-s.sebinraj@intel.com>
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

Integrate xe PMU with the DRM-level GPU frequency tracepoint to provide
efficient frequency monitoring with change detection.

Key changes:
- Add frequency change detection
- Implement per-GT frequency tracking using last_act_freq array
- Only trace when GPU frequency actually changes per GT

The integration traces actual GPU frequency changes from xe_pmu during
XE_PMU_EVENT_GT_ACTUAL_FREQUENCY reads.

Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
---
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_pmu.c            | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/xe/xe_pmu_types.h      |  4 ++++
 3 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_freq_trace.h

diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
new file mode 100644
index 000000000000..f188d529ae60
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * GPU frequency trace wrapper for xe_pmu.c
+ * This header provides access to the gpu_frequency tracepoint
+ */
+#ifndef _XE_GPU_FREQ_TRACE_H_
+#define _XE_GPU_FREQ_TRACE_H_
+
+#include "../drm_gpu_frequency_trace.h"
+
+/* Convert MHz to KHz for tracepoint */
+#define MHZ_TO_KHZ(freq_mhz)	((freq_mhz) * 1000)
+
+#endif /* _XE_GPU_FREQ_TRACE_H_ */
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index cab51d826345..7d5a6e149247 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -5,9 +5,11 @@
 
 #include <drm/drm_drv.h>
 #include <linux/device.h>
+#include <linux/types.h>
 
 #include "xe_device.h"
 #include "xe_force_wake.h"
+#include "xe_gpu_freq_trace.h"
 #include "xe_gt_idle.h"
 #include "xe_guc_engine_activity.h"
 #include "xe_guc_pc.h"
@@ -291,6 +293,19 @@ static u64 read_engine_events(struct xe_gt *gt, struct perf_event *event)
 	return val;
 }
 
+static void xe_pmu_trace_frequency_change(struct xe_gt *gt, u32 act_freq)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	struct xe_pmu *pmu = &xe->pmu;
+	u32 gt_id = gt->info.id;
+
+	/* Only trace if frequency changed for this GT */
+	if (gt_id < XE_PMU_MAX_GT && pmu->last_act_freq[gt_id] != act_freq) {
+		trace_gpu_frequency(MHZ_TO_KHZ(act_freq), gt_id);
+		pmu->last_act_freq[gt_id] = act_freq;
+	}
+}
+
 static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_gt *gt = event_to_gt(event);
@@ -304,8 +319,12 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
 	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
 		return read_engine_events(gt, event);
-	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY:
-		return xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+	case XE_PMU_EVENT_GT_ACTUAL_FREQUENCY: {
+		u32 act_freq = xe_guc_pc_get_act_freq(&gt->uc.guc.pc);
+
+		xe_pmu_trace_frequency_change(gt, act_freq);
+		return act_freq;
+	}
 	case XE_PMU_EVENT_GT_REQUESTED_FREQUENCY:
 		return xe_guc_pc_get_cur_freq_fw(&gt->uc.guc.pc);
 	}
@@ -572,6 +591,9 @@ int xe_pmu_register(struct xe_pmu *pmu)
 	pmu->base.stop		= xe_pmu_event_stop;
 	pmu->base.read		= xe_pmu_event_read;
 
+	/* Initialize frequency tracking array */
+	memset(pmu->last_act_freq, 0, sizeof(pmu->last_act_freq));
+
 	set_supported_events(pmu);
 
 	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
index f5ba4d56622c..630da8442387 100644
--- a/drivers/gpu/drm/xe/xe_pmu_types.h
+++ b/drivers/gpu/drm/xe/xe_pmu_types.h
@@ -34,6 +34,10 @@ struct xe_pmu {
 	 * @supported_events: Bitmap of supported events, indexed by event id
 	 */
 	u64 supported_events;
+	/**
+	 * @last_act_freq: Last actual frequency for each GT (for tracing changes only)
+	 */
+	u32 last_act_freq[XE_PMU_MAX_GT];
 };
 
 #endif
-- 
2.34.1

