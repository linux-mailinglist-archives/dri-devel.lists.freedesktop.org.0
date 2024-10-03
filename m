Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B4198F0D2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543D510E853;
	Thu,  3 Oct 2024 13:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdwQ8dE7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2CA10E853;
 Thu,  3 Oct 2024 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727963494; x=1759499494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dCkl15ljyGoSD/y7vO+r0OHhRxI4Fk5WDXfH+VJo32c=;
 b=XdwQ8dE7PcP0JfD1555DnbAVcdqwICVU5P7Rl8Z+Z+oDd1vbhaTbTe6B
 9BAKxpZIG5PumN1qX6x349fqEKERFIXsa2VNAZ9NK8la9HkQgAD271rhn
 PRiCC+dMeTIeyKAsUz29RaqSZKs/Ids8uiuve8O9Ymdr8xR+X4IkSEuh3
 vzAFTmo6LLmSZBMgDO26/ieyx6ZxrJavOr2qPLnurRhvavhbmUtF2hDj+
 e3uvWtJFnrfTIatU7TCkDA63kpaC9qv5/ir7Cu/uPjWJ3CFWPLVfh8ONm
 sQ6PjDxvC8WNeMEtiWRedJVL6bqaCHSI9+VBY1JLWmsUI9U7LFhyWmy6R w==;
X-CSE-ConnectionGUID: njQiZn7nQMihyojc1wRQ4w==
X-CSE-MsgGUID: V3n3mASbTRe4c1riOKTeYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="44683274"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="44683274"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:51:34 -0700
X-CSE-ConnectionGUID: mHIKT89rQv2CSzznqbBgOw==
X-CSE-MsgGUID: fCIU1ioKSmef2fQZfCZBMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74344740"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by fmviesa009.fm.intel.com with ESMTP; 03 Oct 2024 06:51:31 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, chris.p.wilson@intel.com,
 andi.shyti@linux.intel.com, nirmoy.das@intel.com,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Nitin Gote <nitin.r.gote@intel.com>
Subject: [PATCH v1] drm/i915/gt: Retry RING_HEAD reset until it sticks
Date: Thu,  3 Oct 2024 19:40:44 +0530
Message-Id: <20241003141044.149748-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

From: Chris Wilson <chris@chris-wilson.co.uk>

On Haswell, in particular, we see an issue where resets fails because
the engine resumes from an incorrect RING_HEAD. Since the RING_HEAD
doesn't point to the remaining requests to re-run, but may instead point
into the uninitialised portion of the ring, the GPU may be then fed
invalid instructions from a privileged context, oft pushing the GPU into
an unrecoverable hang.

If at first the write doesn't succeed, try, try again.

References: https://gitlab.freedesktop.org/drm/intel/-/issues/5432
Testcase: igt/i915_selftest/hangcheck
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
---
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
 drivers/gpu/drm/i915/i915_utils.h             |  9 ++++
 2 files changed, 39 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index 72277bc8322e..6427f07ed23e 100644
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
+				ENGINE_READ_FW(engine, RING_HEAD),
+				ENGINE_READ_FW(engine, RING_TAIL),
+				ring->head);
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
index 609214231ffc..538dfb8fa1d8 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -232,6 +232,15 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
 	}
 }
 
+/*
+ * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
+ */
+
+#define until_timeout_ns(end, timeout_ns) \
+	for ((end) = ktime_get() + (timeout_ns); \
+			ktime_before(ktime_get(), (end)); \
+			cpu_relax())
+
 /*
  * __wait_for - magic wait macro
  *
-- 
2.25.1

