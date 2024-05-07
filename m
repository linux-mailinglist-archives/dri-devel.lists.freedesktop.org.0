Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7408BEFEC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 00:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEF9112CCB;
	Tue,  7 May 2024 22:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dsyQW+o2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B8A1126E2;
 Tue,  7 May 2024 22:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715121862; x=1746657862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UKhZP0yeEd5KGPb/aEtPmz7Ore2XOpYdUtCi0tGgarQ=;
 b=dsyQW+o27taBI2QTKKkoMfrfoiHFlycTuMQ/rIsZFjs7VIjijWXVVerB
 cZ4nd5ZZzMlPu9dxeveHcgSmayEoMl5eYT8kFhxQzsg6W2/o/28oA+g46
 WCkUvEW999B2g+btDAVNDOTZZ2oTfQ2u23vsCTHiJIliZVrKt583exN1G
 4G32bikvrz9SeIrhGSShmhDWwAJsOr/0jw9Fpwujr0lI+5Kn1jNSwj3Wd
 UeLdRWCURsa6tNL3XW/rteP6Yag2UXc5WAYTP1KV40ZrI+xiCFVDSIUK+
 TNtY9qAZl2ATIIHIYF9f+inN6LJw3offv4i0zd/CmUYXnqAChlxwDKB5O g==;
X-CSE-ConnectionGUID: lj1gctjURpy+BIuNSPyjow==
X-CSE-MsgGUID: JsAyG7dmSUqx9qwDseBMAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="11108503"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="11108503"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
X-CSE-ConnectionGUID: OdBcAPw/SKSNgnVXBlw/Nw==
X-CSE-MsgGUID: yyEoZnBvTRKa+C1hz9ZXNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; d="scan'208";a="29231512"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 15:44:20 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v3 6/6] drm/xe/client: Print runtime to fdinfo
Date: Tue,  7 May 2024 15:45:10 -0700
Message-ID: <20240507224510.442971-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240507224510.442971-1-lucas.demarchi@intel.com>
References: <20240507224510.442971-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Print the accumulated runtime for client when printing fdinfo.
Each time a query is done it first does 2 things:

1) loop through all the exec queues for the current client and
   accumulate the runtime, per engine class. CTX_TIMESTAMP is used for
   that, being read from the context image.

2) Read a "GPU timestamp" that can be used for considering "how much GPU
   time has passed" and that has the same unit/refclock as the one
   recording the runtime. RING_TIMESTAMP is used for that via MMIO.

Since for all current platforms RING_TIMESTAMP follows the same
refclock, just read it once, using any first engine.

This is exported to userspace as 2 numbers in fdinfo:

	drm-cycles-<class>: <RUNTIME>
	drm-total-cycles-<class>: <TIMESTAMP>

Userspace is expected to collect at least 2 samples, which allows to
know the client engine busyness as per:

		    RUNTIME1 - RUNTIME0
	busyness = ---------------------
			  T1 - T0

Another thing to point out is that it's expected that userspace will
read any 2 samples every few seconds.  Given the update frequency of the
counters involved and that CTX_TIMESTAMP is 32-bits, the counter for
each exec_queue can wrap around (assuming 100% utilization) after ~200s.
The wraparound is not perceived by userspace since it's just accumulated
for all the exec_queues in a 64-bit counter), but the measurement will
not be accurate if the samples are too far apart.

This could be mitigated by adding a workqueue to accumulate the counters
every so often, but it's additional complexity for something that is
done already by userspace every few seconds in tools like gputop (from
igt), htop, nvtop, etc with none of them really defaulting to 1 sample
per minute or more.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/drm-usage-stats.rst       |  16 ++-
 Documentation/gpu/xe/index.rst              |   1 +
 Documentation/gpu/xe/xe-drm-usage-stats.rst |  10 ++
 drivers/gpu/drm/xe/xe_drm_client.c          | 136 +++++++++++++++++++-
 4 files changed, 160 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe-drm-usage-stats.rst

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 6dc299343b48..421766289b78 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -112,6 +112,17 @@ larger value within a reasonable period. Upon observing a value lower than what
 was previously read, userspace is expected to stay with that larger previous
 value until a monotonic update is seen.
 
+- drm-total-cycles-<keystr>: <uint>
+
+Engine identifier string must be the same as the one specified in the
+drm-cycles-<keystr> tag and shall contain the total number cycles for the given
+engine.
+
+This is a timestamp in GPU unspecified unit that matches the update rate
+of drm-cycles-<keystr>. For drivers that implement this interface, the engine
+utilization can be calculated entirely on the GPU clock domain, without
+considering the CPU sleep time between 2 samples.
+
 - drm-maxfreq-<keystr>: <uint> [Hz|MHz|KHz]
 
 Engine identifier string must be the same as the one specified in the
@@ -168,5 +179,6 @@ be documented above and where possible, aligned with other drivers.
 Driver specific implementations
 -------------------------------
 
-:ref:`i915-usage-stats`
-:ref:`panfrost-usage-stats`
+* :ref:`i915-usage-stats`
+* :ref:`panfrost-usage-stats`
+* :ref:`xe-usage-stats`
diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
index c224ecaee81e..3f07aa3b5432 100644
--- a/Documentation/gpu/xe/index.rst
+++ b/Documentation/gpu/xe/index.rst
@@ -23,3 +23,4 @@ DG2, etc is provided to prototype the driver.
    xe_firmware
    xe_tile
    xe_debugging
+   xe-drm-usage-stats.rst
diff --git a/Documentation/gpu/xe/xe-drm-usage-stats.rst b/Documentation/gpu/xe/xe-drm-usage-stats.rst
new file mode 100644
index 000000000000..482d503ae68a
--- /dev/null
+++ b/Documentation/gpu/xe/xe-drm-usage-stats.rst
@@ -0,0 +1,10 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. _xe-usage-stats:
+
+========================================
+Xe DRM client usage stats implementation
+========================================
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_drm_client.c
+   :doc: DRM Client usage stats
diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 08f0b7c95901..27494839d586 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -2,6 +2,7 @@
 /*
  * Copyright © 2023 Intel Corporation
  */
+#include "xe_drm_client.h"
 
 #include <drm/drm_print.h>
 #include <drm/xe_drm.h>
@@ -12,9 +13,65 @@
 #include "xe_bo.h"
 #include "xe_bo_types.h"
 #include "xe_device_types.h"
-#include "xe_drm_client.h"
+#include "xe_exec_queue.h"
+#include "xe_gt.h"
+#include "xe_hw_engine.h"
+#include "xe_pm.h"
 #include "xe_trace.h"
 
+/**
+ * DOC: DRM Client usage stats
+ *
+ * The drm/xe driver implements the DRM client usage stats specification as
+ * documented in :ref:`drm-client-usage-stats`.
+ *
+ * Example of the output showing the implemented key value pairs and entirety of
+ * the currently possible format options:
+ *
+ * ::
+ *
+ * 	pos:    0
+ * 	flags:  0100002
+ * 	mnt_id: 26
+ * 	ino:    685
+ * 	drm-driver:     xe
+ * 	drm-client-id:  3
+ * 	drm-pdev:       0000:03:00.0
+ * 	drm-total-system:       0
+ * 	drm-shared-system:      0
+ * 	drm-active-system:      0
+ * 	drm-resident-system:    0
+ * 	drm-purgeable-system:   0
+ * 	drm-total-gtt:  192 KiB
+ * 	drm-shared-gtt: 0
+ * 	drm-active-gtt: 0
+ * 	drm-resident-gtt:       192 KiB
+ * 	drm-total-vram0:        23992 KiB
+ * 	drm-shared-vram0:       16 MiB
+ * 	drm-active-vram0:       0
+ * 	drm-resident-vram0:     23992 KiB
+ * 	drm-total-stolen:       0
+ * 	drm-shared-stolen:      0
+ * 	drm-active-stolen:      0
+ * 	drm-resident-stolen:    0
+ * 	drm-cycles-rcs: 28257900
+ * 	drm-total-cycles-rcs:   7655183225
+ * 	drm-cycles-bcs: 0
+ * 	drm-total-cycles-bcs:   7655183225
+ * 	drm-cycles-vcs: 0
+ * 	drm-total-cycles-vcs:   7655183225
+ * 	drm-engine-capacity-vcs:        2
+ * 	drm-cycles-vecs:        0
+ * 	drm-total-cycles-vecs:  7655183225
+ * 	drm-engine-capacity-vecs:       2
+ * 	drm-cycles-ccs: 0
+ * 	drm-total-cycles-ccs:   7655183225
+ * 	drm-engine-capacity-ccs:        4
+ *
+ * Possible `drm-cycles-` key names are: `rcs`, `ccs`, `bcs`, `vcs`, `vecs` and
+ * "other".
+ */
+
 /**
  * xe_drm_client_alloc() - Allocate drm client
  * @void: No arg
@@ -179,6 +236,82 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 	}
 }
 
+static const u64 class_to_mask[] = {
+	[XE_ENGINE_CLASS_RENDER] = XE_HW_ENGINE_RCS_MASK,
+	[XE_ENGINE_CLASS_VIDEO_DECODE] = XE_HW_ENGINE_VCS_MASK,
+	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_HW_ENGINE_VECS_MASK,
+	[XE_ENGINE_CLASS_COPY] = XE_HW_ENGINE_BCS_MASK,
+	[XE_ENGINE_CLASS_OTHER] = XE_HW_ENGINE_GSCCS_MASK,
+	[XE_ENGINE_CLASS_COMPUTE] = XE_HW_ENGINE_CCS_MASK,
+};
+
+static void show_runtime(struct drm_printer *p, struct drm_file *file)
+{
+	struct xe_file *xef = file->driver_priv;
+	struct xe_device *xe = xef->xe;
+	struct xe_gt *gt;
+	struct xe_hw_engine *hwe;
+	struct xe_exec_queue *q;
+	unsigned long i, id_hwe, id_gt, capacity[XE_ENGINE_CLASS_MAX] = { };
+	u64 gpu_timestamp, engine_mask = 0;
+	bool gpu_stamp = false;
+
+	xe_pm_runtime_get(xe);
+
+	/* Accumulate all the exec queues from this client */
+	mutex_lock(&xef->exec_queue.lock);
+	xa_for_each(&xef->exec_queue.xa, i, q)
+		xe_exec_queue_update_runtime(q);
+	mutex_unlock(&xef->exec_queue.lock);
+
+	/* Calculate capacity of each engine class */
+	BUILD_BUG_ON(ARRAY_SIZE(class_to_mask) != XE_ENGINE_CLASS_MAX);
+	for_each_gt(gt, xe, id_gt)
+		engine_mask |= gt->info.engine_mask;
+	for (i = 0; i < XE_ENGINE_CLASS_MAX; i++)
+		capacity[i] = hweight64(engine_mask & class_to_mask[i]);
+
+	/*
+	 * Iterate over all engines, printing the accumulated
+	 * runtime for this client, per engine class
+	 */
+	for_each_gt(gt, xe, id_gt) {
+		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+		for_each_hw_engine(hwe, gt, id_hwe) {
+			const char *class_name;
+
+			if (!capacity[hwe->class])
+				continue;
+
+			/*
+			 * Use any (first) engine to have a timestamp to be used every
+			 * time
+			 */
+			if (!gpu_stamp) {
+				gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
+				gpu_stamp = true;
+			}
+
+			class_name = xe_hw_engine_class_to_str(hwe->class);
+
+			drm_printf(p, "drm-cycles-%s:\t%llu\n",
+				   class_name, xef->runtime[hwe->class]);
+			drm_printf(p, "drm-total-cycles-%s:\t%llu\n",
+				   class_name, gpu_timestamp);
+
+			if (capacity[hwe->class] > 1)
+				drm_printf(p, "drm-engine-capacity-%s:\t%lu\n",
+					   class_name, capacity[hwe->class]);
+
+			/* engine class already handled, skip next iterations */
+			capacity[hwe->class] = 0;
+		}
+		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+	}
+
+	xe_pm_runtime_get(xe);
+}
+
 /**
  * xe_drm_client_fdinfo() - Callback for fdinfo interface
  * @p: The drm_printer ptr
@@ -192,5 +325,6 @@ static void show_meminfo(struct drm_printer *p, struct drm_file *file)
 void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	show_meminfo(p, file);
+	show_runtime(p, file);
 }
 #endif
-- 
2.43.0

