Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AED0387EA7D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 14:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEC310F74D;
	Mon, 18 Mar 2024 13:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOn9Ajdt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6CC10F23F;
 Mon, 18 Mar 2024 13:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710770367; x=1742306367;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZOoETLwrD5AvG8eqhqsrACUvAPC0+rlO76iWsrgPEqY=;
 b=hOn9Ajdtl8TZwf7zsKmcOcUAo1Wq8tZ8+W9gvf3uv6/Qqn7xAK/dZx9W
 S6mtwlgxEA25w9A7E4AmVpJYfSgAxoVnSJs14ZF3bDqY7m0Fb1tAmcHSg
 258An8J0LeSJXfQHoajHtyEtkacX1PbgS0eLmJ0HyVmXLcMVygA0NkjO4
 XllsFPHyGodujZncj5Jk7omXeO2Vljv5Vs9NoS5lohoaYcbFOHc1fZuYf
 CQHQ7ZAqdAlYAZ5Kb5OU9Fk4qNMfOTlhxYLChC/GAW8Jz4A089a1aVxOq
 yY6Bk402WdiYbJjy/Laj59vczXgsn8d1Y51K72tjXTIjWKc6kjnnOt4no w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5416535"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5416535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13426584"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.26.105])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 06:59:22 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/gt: Reset queue_priority_hint on parking
Date: Mon, 18 Mar 2024 14:58:47 +0100
Message-ID: <20240318135906.716055-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Originally, with strict in order execution, we could complete execution
only when the queue was empty. Preempt-to-busy allows replacement of an
active request that may complete before the preemption is processed by
HW. If that happens, the request is retired from the queue, but the
queue_priority_hint remains set, preventing direct submission until
after the next CS interrupt is processed.

This preempt-to-busy race can be triggered by the heartbeat, which will
also act as the power-management barrier and upon completion allow us to
idle the HW. We may process the completion of the heartbeat, and begin
parking the engine before the CS event that restores the
queue_priority_hint, causing us to fail the assertion that it is MIN.

<3>[  166.210729] __engine_park:283 GEM_BUG_ON(engine->sched_engine->queue_priority_hint != (-((int)(~0U >> 1)) - 1))
<0>[  166.210781] Dumping ftrace buffer:
<0>[  166.210795] ---------------------------------
...
<0>[  167.302811] drm_fdin-1097      2..s1. 165741070us : trace_ports: 0000:00:02.0 rcs0: promote { ccid:20 1217:2 prio 0 }
<0>[  167.302861] drm_fdin-1097      2d.s2. 165741072us : execlists_submission_tasklet: 0000:00:02.0 rcs0: preempting last=1217:2, prio=0, hint=2147483646
<0>[  167.302928] drm_fdin-1097      2d.s2. 165741072us : __i915_request_unsubmit: 0000:00:02.0 rcs0: fence 1217:2, current 0
<0>[  167.302992] drm_fdin-1097      2d.s2. 165741073us : __i915_request_submit: 0000:00:02.0 rcs0: fence 3:4660, current 4659
<0>[  167.303044] drm_fdin-1097      2d.s1. 165741076us : execlists_submission_tasklet: 0000:00:02.0 rcs0: context:3 schedule-in, ccid:40
<0>[  167.303095] drm_fdin-1097      2d.s1. 165741077us : trace_ports: 0000:00:02.0 rcs0: submit { ccid:40 3:4660* prio 2147483646 }
<0>[  167.303159] kworker/-89       11..... 165741139us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence c90:2, current 2
<0>[  167.303208] kworker/-89       11..... 165741148us : __intel_context_do_unpin: 0000:00:02.0 rcs0: context:c90 unpin
<0>[  167.303272] kworker/-89       11..... 165741159us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence 1217:2, current 2
<0>[  167.303321] kworker/-89       11..... 165741166us : __intel_context_do_unpin: 0000:00:02.0 rcs0: context:1217 unpin
<0>[  167.303384] kworker/-89       11..... 165741170us : i915_request_retire.part.0: 0000:00:02.0 rcs0: fence 3:4660, current 4660
<0>[  167.303434] kworker/-89       11d..1. 165741172us : __intel_context_retire: 0000:00:02.0 rcs0: context:1216 retire runtime: { total:56028ns, avg:56028ns }
<0>[  167.303484] kworker/-89       11..... 165741198us : __engine_park: 0000:00:02.0 rcs0: parked
<0>[  167.303534]   <idle>-0         5d.H3. 165741207us : execlists_irq_handler: 0000:00:02.0 rcs0: semaphore yield: 00000040
<0>[  167.303583] kworker/-89       11..... 165741397us : __intel_context_retire: 0000:00:02.0 rcs0: context:1217 retire runtime: { total:325575ns, avg:0ns }
<0>[  167.303756] kworker/-89       11..... 165741777us : __intel_context_retire: 0000:00:02.0 rcs0: context:c90 retire runtime: { total:0ns, avg:0ns }
<0>[  167.303806] kworker/-89       11..... 165742017us : __engine_park: __engine_park:283 GEM_BUG_ON(engine->sched_engine->queue_priority_hint != (-((int)(~0U >> 1)) - 1))
<0>[  167.303811] ---------------------------------
<4>[  167.304722] ------------[ cut here ]------------
<2>[  167.304725] kernel BUG at drivers/gpu/drm/i915/gt/intel_engine_pm.c:283!
<4>[  167.304731] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
<4>[  167.304734] CPU: 11 PID: 89 Comm: kworker/11:1 Tainted: G        W          6.8.0-rc2-CI_DRM_14193-gc655e0fd2804+ #1
<4>[  167.304736] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
<4>[  167.304738] Workqueue: i915-unordered retire_work_handler [i915]
<4>[  167.304839] RIP: 0010:__engine_park+0x3fd/0x680 [i915]
<4>[  167.304937] Code: 00 48 c7 c2 b0 e5 86 a0 48 8d 3d 00 00 00 00 e8 79 48 d4 e0 bf 01 00 00 00 e8 ef 0a d4 e0 31 f6 bf 09 00 00 00 e8 03 49 c0 e0 <0f> 0b 0f 0b be 01 00 00 00 e8 f5 61 fd ff 31 c0 e9 34 fd ff ff 48
<4>[  167.304940] RSP: 0018:ffffc9000059fce0 EFLAGS: 00010246
<4>[  167.304942] RAX: 0000000000000200 RBX: 0000000000000000 RCX: 0000000000000006
<4>[  167.304944] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000009
<4>[  167.304946] RBP: ffff8881330ca1b0 R08: 0000000000000001 R09: 0000000000000001
<4>[  167.304947] R10: 0000000000000001 R11: 0000000000000001 R12: ffff8881330ca000
<4>[  167.304948] R13: ffff888110f02aa0 R14: ffff88812d1d0205 R15: ffff88811277d4f0
<4>[  167.304950] FS:  0000000000000000(0000) GS:ffff88844f780000(0000) knlGS:0000000000000000
<4>[  167.304952] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4>[  167.304953] CR2: 00007fc362200c40 CR3: 000000013306e003 CR4: 0000000000770ef0
<4>[  167.304955] PKRU: 55555554
<4>[  167.304957] Call Trace:
<4>[  167.304958]  <TASK>
<4>[  167.305573]  ____intel_wakeref_put_last+0x1d/0x80 [i915]
<4>[  167.305685]  i915_request_retire.part.0+0x34f/0x600 [i915]
<4>[  167.305800]  retire_requests+0x51/0x80 [i915]
<4>[  167.305892]  intel_gt_retire_requests_timeout+0x27f/0x700 [i915]
<4>[  167.305985]  process_scheduled_works+0x2db/0x530
<4>[  167.305990]  worker_thread+0x18c/0x350
<4>[  167.305993]  kthread+0xfe/0x130
<4>[  167.305997]  ret_from_fork+0x2c/0x50
<4>[  167.306001]  ret_from_fork_asm+0x1b/0x30
<4>[  167.306004]  </TASK>

It is necessary for the queue_priority_hint to be lower than the next
request submission upon waking up, as we rely on the hint to decide when
to kick the tasklet to submit that first request.

Fixes: 22b7a426bbe1 ("drm/i915/execlists: Preempt-to-busy")
Closes: https://gitlab.freedesktop.org/drm/intel/issues/10154
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.4+
---
 drivers/gpu/drm/i915/gt/intel_engine_pm.c            | 3 ---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
index 96bdb93a948d1..fb7bff27b45a3 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
@@ -279,9 +279,6 @@ static int __engine_park(struct intel_wakeref *wf)
 	intel_engine_park_heartbeat(engine);
 	intel_breadcrumbs_park(engine->breadcrumbs);
 
-	/* Must be reset upon idling, or we may miss the busy wakeup. */
-	GEM_BUG_ON(engine->sched_engine->queue_priority_hint != INT_MIN);
-
 	if (engine->park)
 		engine->park(engine);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 42aade0faf2d1..b061a0a0d6b08 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -3272,6 +3272,9 @@ static void execlists_park(struct intel_engine_cs *engine)
 {
 	cancel_timer(&engine->execlists.timer);
 	cancel_timer(&engine->execlists.preempt);
+
+	/* Reset upon idling, or we may delay the busy wakeup. */
+	WRITE_ONCE(engine->sched_engine->queue_priority_hint, INT_MIN);
 }
 
 static void add_to_engine(struct i915_request *rq)
-- 
2.43.0

