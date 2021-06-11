Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559DC3A3BAD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 08:08:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6596E52D;
	Fri, 11 Jun 2021 06:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDE96E520;
 Fri, 11 Jun 2021 06:08:50 +0000 (UTC)
IronPort-SDR: mGvJjPc00O9htdNYe9awbSeOoxgq9bvygOYb+AThyvVt5ZEm5GAAPlscJOnqqpX3Gfes9ix5bd
 qrYt5D9SCFSA==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="269317933"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="269317933"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 23:08:48 -0700
IronPort-SDR: YXAMYoVmnVO0xFrY4iVVJ6JLv/QsawTVEHmjbD4/audOgTyL9GXXzWDpA2KRop8NIG2Fk/uR1r
 /UfVq+XcfV2Q==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; d="scan'208";a="449000311"
Received: from skallurr-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.170])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 23:08:46 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Reorder tasklet_disable vs
 local_bh_disable
Date: Fri, 11 Jun 2021 08:08:38 +0200
Message-Id: <20210611060838.647973-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Due to a change in requirements that disallows tasklet_disable() being
called from atomic context, rearrange the selftest to avoid doing so.

<3> [324.942939] BUG: sleeping function called from invalid context at kernel/softirq.c:888
<3> [324.942952] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5601, name: i915_selftest
<4> [324.942960] 1 lock held by i915_selftest/5601:
<4> [324.942963]  #0: ffff888101d19240 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x18/0x50
<3> [324.942987] Preemption disabled at:
<3> [324.942990] [<ffffffffa026fbd2>] live_hold_reset.part.65+0xc2/0x2f0 [i915]
<4> [324.943255] CPU: 0 PID: 5601 Comm: i915_selftest Tainted: G     U            5.13.0-rc5-CI-CI_DRM_10197+ #1
<4> [324.943259] Hardware name: Intel Corp. Geminilake/GLK RVP2 LP4SD (07), BIOS GELKRVPA.X64.0062.B30.1708222146 08/22/2017
<4> [324.943263] Call Trace:
<4> [324.943267]  dump_stack+0x7f/0xad
<4> [324.943276]  ___might_sleep.cold.123+0xf2/0x106
<4> [324.943286]  tasklet_unlock_wait+0x2e/0xb0
<4> [324.943291]  ? ktime_get_raw+0x81/0x120
<4> [324.943305]  live_hold_reset.part.65+0x1ab/0x2f0 [i915]
<4> [324.943500]  __i915_subtests.cold.7+0x42/0x92 [i915]
<4> [324.943723]  ? __i915_live_teardown+0x50/0x50 [i915]
<4> [324.943922]  ? __intel_gt_live_setup+0x30/0x30 [i915]

Fixes: da044747401fc ("tasklets: Replace spin wait in tasklet_unlock_wait()")
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 55 ++++++++++++--------
 1 file changed, 32 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index ea2203af0764..1c8108d30b85 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -551,6 +551,32 @@ static int live_pin_rewind(void *arg)
 	return err;
 }
 
+static int engine_lock_reset_tasklet(struct intel_engine_cs *engine)
+{
+	tasklet_disable(&engine->execlists.tasklet);
+	local_bh_disable();
+
+	if (test_and_set_bit(I915_RESET_ENGINE + engine->id,
+			     &engine->gt->reset.flags)) {
+		local_bh_enable();
+		tasklet_enable(&engine->execlists.tasklet);
+
+		intel_gt_set_wedged(engine->gt);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void engine_unlock_reset_tasklet(struct intel_engine_cs *engine)
+{
+	clear_and_wake_up_bit(I915_RESET_ENGINE + engine->id,
+			      &engine->gt->reset.flags);
+
+	local_bh_enable();
+	tasklet_enable(&engine->execlists.tasklet);
+}
+
 static int live_hold_reset(void *arg)
 {
 	struct intel_gt *gt = arg;
@@ -598,15 +624,9 @@ static int live_hold_reset(void *arg)
 
 		/* We have our request executing, now remove it and reset */
 
-		local_bh_disable();
-		if (test_and_set_bit(I915_RESET_ENGINE + id,
-				     &gt->reset.flags)) {
-			local_bh_enable();
-			intel_gt_set_wedged(gt);
-			err = -EBUSY;
+		err = engine_lock_reset_tasklet(engine);
+		if (err)
 			goto out;
-		}
-		tasklet_disable(&engine->execlists.tasklet);
 
 		engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 		GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
@@ -618,10 +638,7 @@ static int live_hold_reset(void *arg)
 		__intel_engine_reset_bh(engine, NULL);
 		GEM_BUG_ON(rq->fence.error != -EIO);
 
-		tasklet_enable(&engine->execlists.tasklet);
-		clear_and_wake_up_bit(I915_RESET_ENGINE + id,
-				      &gt->reset.flags);
-		local_bh_enable();
+		engine_unlock_reset_tasklet(engine);
 
 		/* Check that we do not resubmit the held request */
 		if (!i915_request_wait(rq, 0, HZ / 5)) {
@@ -4585,15 +4602,9 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(engine == ve->engine);
 
 	/* Take ownership of the reset and tasklet */
-	local_bh_disable();
-	if (test_and_set_bit(I915_RESET_ENGINE + engine->id,
-			     &gt->reset.flags)) {
-		local_bh_enable();
-		intel_gt_set_wedged(gt);
-		err = -EBUSY;
+	err = engine_lock_reset_tasklet(engine);
+	if (err)
 		goto out_heartbeat;
-	}
-	tasklet_disable(&engine->execlists.tasklet);
 
 	engine->execlists.tasklet.callback(&engine->execlists.tasklet);
 	GEM_BUG_ON(execlists_active(&engine->execlists) != rq);
@@ -4612,9 +4623,7 @@ static int reset_virtual_engine(struct intel_gt *gt,
 	GEM_BUG_ON(rq->fence.error != -EIO);
 
 	/* Release our grasp on the engine, letting CS flow again */
-	tasklet_enable(&engine->execlists.tasklet);
-	clear_and_wake_up_bit(I915_RESET_ENGINE + engine->id, &gt->reset.flags);
-	local_bh_enable();
+	engine_unlock_reset_tasklet(engine);
 
 	/* Check that we do not resubmit the held request */
 	i915_request_get(rq);
-- 
2.31.1

