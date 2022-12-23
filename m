Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A065503F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 13:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947D710E636;
	Fri, 23 Dec 2022 12:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA0910E636;
 Fri, 23 Dec 2022 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671797914; x=1703333914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7znGiQeSZ0l8GJ+lxilWB8W46RCxcmsmPqQxJMjjDkM=;
 b=MEHeM5mG6E3kicZnY0K3npX3s37M7bWoiPsK34PJinA1/Bb3Rrq2ffSR
 Zr2zVtuAw/h1GGYKQUWeDBSv86c+agQZdjQSU6N6jIRKFmj40GotEPTPE
 CTS+e8PuhQT3404DOfshVUBc3ZsdDtTuQa9SJ9uMVTWtaUXyHzJJcOARp
 eh5bRU/R8zbVmVFATp9LDmHwIIHBRVS055o3Cr1c0BB7TRxfBl2SXQK6l
 7jR8Op4IK2E/KyJX/oS8RhOKbfTJ0BVgJ+TJQrVQGCcv1Oaqzx1A4OnZC
 74T6AsgnICbLwpPq4vodMtN6EcOCE+HOizN9aCVB698EOF8nHYOlv26dD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="320380983"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="320380983"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 04:18:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="826285589"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; d="scan'208";a="826285589"
Received: from cemaylor-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.251.217.192])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2022 04:18:30 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Retry RING_HEAD reset until it sticks
Date: Fri, 23 Dec 2022 13:18:21 +0100
Message-Id: <20221223121821.358021-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Andi Shyti <andi@etezian.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

On Haswell, in particular, we see an issue where resets fails because
the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
doesn't point to the remaining requests to re-run, but may instead point
into the uninitialised portion of the ring, the GPU may be then fed
invalid instructions from a privileged context, often pushing the GPU
into an unrecoverable hang.

If at first the write doesn't succeed, try, try again.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
References: https://gitlab.freedesktop.org/drm/intel/-/issues/3303
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
 drivers/gpu/drm/i915/i915_utils.h             |  8 ++++
 2 files changed, 38 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 827adb0cfaea6..cdf283f5b1427 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -192,6 +192,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
 static int xcs_resume(struct intel_engine_cs *engine)
 {
 	struct intel_ring *ring = engine->legacy.ring;
+	ktime_t kt;
 
 	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
 		     ring->head, ring->tail);
@@ -230,9 +231,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
 	set_pp_dir(engine);
 
 	/* First wake the ring up to an empty/idle ring */
-	ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
+	until_timeout_ns(kt, 2 * NSEC_PER_MSEC) {
+		ENGINE_WRITE_FW(engine, RING_HEAD, ring->head);
+		if (ENGINE_READ_FW(engine, RING_HEAD) == ring->head)
+			break;
+	}
+
 	ENGINE_WRITE_FW(engine, RING_TAIL, ring->head);
-	ENGINE_POSTING_READ(engine, RING_TAIL);
+	if (ENGINE_READ_FW(engine, RING_HEAD) != ENGINE_READ_FW(engine, RING_TAIL)) {
+		ENGINE_TRACE(engine, "failed to reset empty ring: [%x, %x]: %x\n",
+			     ENGINE_READ_FW(engine, RING_HEAD),
+			     ENGINE_READ_FW(engine, RING_TAIL),
+			     ring->head);
+		goto err;
+	}
 
 	ENGINE_WRITE_FW(engine, RING_CTL,
 			RING_CTL_SIZE(ring->size) | RING_VALID);
@@ -241,12 +253,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
 	if (__intel_wait_for_register_fw(engine->uncore,
 					 RING_CTL(engine->mmio_base),
 					 RING_VALID, RING_VALID,
-					 5000, 0, NULL))
+					 5000, 0, NULL)) {
+		ENGINE_TRACE(engine, "failed to restart\n");
 		goto err;
+	}
 
-	if (GRAPHICS_VER(engine->i915) > 2)
+	if (GRAPHICS_VER(engine->i915) > 2) {
 		ENGINE_WRITE_FW(engine,
 				RING_MI_MODE, _MASKED_BIT_DISABLE(STOP_RING));
+		ENGINE_POSTING_READ(engine, RING_MI_MODE);
+	}
 
 	/* Now awake, let it get started */
 	if (ring->tail != ring->head) {
@@ -259,16 +275,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
 	return 0;
 
 err:
-	drm_err(&engine->i915->drm,
-		"%s initialization failed; "
-		"ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
-		engine->name,
-		ENGINE_READ(engine, RING_CTL),
-		ENGINE_READ(engine, RING_CTL) & RING_VALID,
-		ENGINE_READ(engine, RING_HEAD), ring->head,
-		ENGINE_READ(engine, RING_TAIL), ring->tail,
-		ENGINE_READ(engine, RING_START),
-		i915_ggtt_offset(ring->vma));
+	ENGINE_TRACE(engine,
+		     "initialization failed; "
+		     "ctl %08x (valid? %d) head %08x [%08x] tail %08x [%08x] start %08x [expected %08x]\n",
+		     ENGINE_READ(engine, RING_CTL),
+		     ENGINE_READ(engine, RING_CTL) & RING_VALID,
+		     ENGINE_READ(engine, RING_HEAD), ring->head,
+		     ENGINE_READ(engine, RING_TAIL), ring->tail,
+		     ENGINE_READ(engine, RING_START),
+		     i915_ggtt_offset(ring->vma));
+	GEM_TRACE_DUMP();
 	return -EIO;
 }
 
diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
index b64192d9c7daa..f24a25c0685e1 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -254,6 +254,14 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
 	}
 }
 
+/**
+ * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
+ */
+#define until_timeout_ns(end, timeout_ns) \
+	for ((end) = ktime_get() + (timeout_ns); \
+	     ktime_before(ktime_get(), (end)); \
+	     cpu_relax())
+
 /**
  * __wait_for - magic wait macro
  *
-- 
2.39.0

