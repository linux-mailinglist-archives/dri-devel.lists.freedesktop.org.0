Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF64575D59
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 10:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5916011B9B3;
	Fri, 15 Jul 2022 08:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6313711B9B3;
 Fri, 15 Jul 2022 08:26:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B191C62054;
 Fri, 15 Jul 2022 08:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1574CC34115;
 Fri, 15 Jul 2022 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657873581;
 bh=iFolp2jzrEerpXz5e6fXs3X5/rU+qvcxywsSCPc3mvM=;
 h=From:To:Cc:Subject:Date:From;
 b=Eg/kmP5xzo/enM6Exj402J70zyK1j+DLRtqwgjhGHusdYy0Mo9MVHVqpZ9P/N5ZQH
 4nDDJaSioBjua+9INgDucPBL8E8v7Ps0ZH7dcrQJuNPM0OEJ1k12nEbX0p4UBqZ+gy
 EeNyFNBnBJf+PHI/TiLM+Wr8Gy94dJ4qg2k36ZqgX8Su8ebOzyJRRM5xHgX/btAHin
 lGzs959UIzNIW28j4D9TdvAiaeL8+FV0mpOvex/7o5aHG11jaJO0S1e1vgDZzpWwKO
 KbaLuTB5Fw/nyYnAMQePu+HL4tQ3x3KgWUF4pkiyE5z/syKxeRIsCfWoC3yLND2v6B
 AdDfxhnfYiB9g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oCGeP-005Phx-FY;
 Fri, 15 Jul 2022 09:26:17 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC] drm/i915/gt: Retry RING_HEAD reset until it sticks
Date: Fri, 15 Jul 2022 09:26:16 +0100
Message-Id: <2378da383d043de17172d928e59da0ec423cae76.1657873550.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Auld <matthew.auld@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 .../gpu/drm/i915/gt/intel_ring_submission.c   | 44 +++++++++++++------
 drivers/gpu/drm/i915/i915_utils.h             | 10 +++++
 2 files changed, 40 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
index d5d6f1fadcae..cc53feb1f8ed 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
@@ -190,6 +190,7 @@ static bool stop_ring(struct intel_engine_cs *engine)
 static int xcs_resume(struct intel_engine_cs *engine)
 {
 	struct intel_ring *ring = engine->legacy.ring;
+	ktime_t kt;
 
 	ENGINE_TRACE(engine, "ring:{HEAD:%04x, TAIL:%04x}\n",
 		     ring->head, ring->tail);
@@ -228,9 +229,20 @@ static int xcs_resume(struct intel_engine_cs *engine)
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
@@ -239,12 +251,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
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
@@ -257,16 +273,16 @@ static int xcs_resume(struct intel_engine_cs *engine)
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
index c10d68cdc3ca..717fb6b9cc15 100644
--- a/drivers/gpu/drm/i915/i915_utils.h
+++ b/drivers/gpu/drm/i915/i915_utils.h
@@ -256,6 +256,16 @@ wait_remaining_ms_from_jiffies(unsigned long timestamp_jiffies, int to_wait_ms)
 	}
 }
 
+/**
+ * until_timeout_ns - Keep retrying (busy spin) until the duration has passed
+ * @end: temporary var to be used to track the spent time
+ * @timeout_ns: Maximum timeout, in nanosseconds
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
2.36.1


