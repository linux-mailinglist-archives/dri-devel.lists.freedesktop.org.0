Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E199E92B9A2
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 14:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E5A10E537;
	Tue,  9 Jul 2024 12:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MP27TjQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2720610E533;
 Tue,  9 Jul 2024 12:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720528613; x=1752064613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QD16/W+gTAFQtTHcyhUoWKx3JHae4ORgoBXvLF+JsCs=;
 b=MP27TjQGNjEX4owGmXR604yl4KJoksxzKcN/Zh7P61Kn1QtklTW6XSdo
 IhgNV4xearX8JsNdc6Z6clCMuaEm3BZfst0a4Qciml+cWcFNIwh1TnY6d
 bZWtSweZZzSgvWZHYO2HWLxtDXd6Q+RJn8GwjluHwsDEZAPGeNk+GGxGF
 Ha/hj6AS21H+voNJaGW9+WYld13jfNoLX0LnEfpBwgsDOl5EBcA8EqHAD
 vFBBOoud6qKGmVlCxt7cMaMnd8DWsXECPHWZHixgCeosNjEPKvisbfR/d
 rLO0sOffSrbuMN2mq/bH2UlNqbrkkk3QsCAI+Bbty/jTbbaVN7KGqgIXx w==;
X-CSE-ConnectionGUID: Ys2m5z7tSJGkC5JLhUDBIQ==
X-CSE-MsgGUID: atkjG4pCSf6XwLkSBP2E2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21547570"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="21547570"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:36:53 -0700
X-CSE-ConnectionGUID: Zb6repQVQH639LokAwoWFA==
X-CSE-MsgGUID: x8lnZKcNQbyrXb2xCwItww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="78581940"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by orviesa002.jf.intel.com with ESMTP; 09 Jul 2024 05:36:50 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 chris.p.wilson@linux.intel.com, nirmoy.das@intel.com,
 janusz.krzysztofik@linux.intel.com, nitin.r.gote@intel.com,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Date: Tue,  9 Jul 2024 18:23:02 +0530
Message-Id: <20240709125302.861319-1-nitin.r.gote@intel.com>
X-Mailer: git-send-email 2.25.1
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

We're seeing a GPU HANG issue on a CHV platform, which was caused by
bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8").

Gen8 platform has only timeslice and doesn't support a preemption mechanism
as engines do not have a preemption timer and doesn't send an irq if the
preemption timeout expires. So, add a fix to not consider preemption
during dequeuing for gen8 platforms.

Also move can_preemt() above need_preempt() function to resolve implicit
declaration of function ‘can_preempt' error and make can_preempt()
function param as const to resolve error: passing argument 1 of
‘can_preempt’ discards ‘const’ qualifier from the pointer target type.

Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
Suggested-by: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
CC: <stable@vger.kernel.org> # v5.2+
---
 .../drm/i915/gt/intel_execlists_submission.c  | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 21829439e686..30631cc690f2 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -294,11 +294,26 @@ static int virtual_prio(const struct intel_engine_execlists *el)
 	return rb ? rb_entry(rb, struct ve_node, rb)->prio : INT_MIN;
 }
 
+static bool can_preempt(const struct intel_engine_cs *engine)
+{
+	if (GRAPHICS_VER(engine->i915) > 8)
+		return true;
+
+	if (IS_CHERRYVIEW(engine->i915) || IS_BROADWELL(engine->i915))
+		return false;
+
+	/* GPGPU on bdw requires extra w/a; not implemented */
+	return engine->class != RENDER_CLASS;
+}
+
 static bool need_preempt(const struct intel_engine_cs *engine,
 			 const struct i915_request *rq)
 {
 	int last_prio;
 
+	if ((GRAPHICS_VER(engine->i915) <= 8) && can_preempt(engine))
+		return false;
+
 	if (!intel_engine_has_semaphores(engine))
 		return false;
 
@@ -3313,15 +3328,6 @@ static void remove_from_engine(struct i915_request *rq)
 	i915_request_notify_execute_cb_imm(rq);
 }
 
-static bool can_preempt(struct intel_engine_cs *engine)
-{
-	if (GRAPHICS_VER(engine->i915) > 8)
-		return true;
-
-	/* GPGPU on bdw requires extra w/a; not implemented */
-	return engine->class != RENDER_CLASS;
-}
-
 static void kick_execlists(const struct i915_request *rq, int prio)
 {
 	struct intel_engine_cs *engine = rq->engine;
-- 
2.25.1

