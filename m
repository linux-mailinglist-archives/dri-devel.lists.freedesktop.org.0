Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC6892DF37
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 06:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF4710E2D1;
	Thu, 11 Jul 2024 04:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwvRIeou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFE410E2C3;
 Thu, 11 Jul 2024 04:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720673748; x=1752209748;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/0lBTOC+XozR7hq6QbSIgtUpJiqj6LHeBDiAh2GLgD0=;
 b=RwvRIeouixoAL05IhZF6Z8Nrcj9U/OdyO2oIa8FGY+YILUsvF5uI6cqe
 7fRP7mrvAwRtQazC6o93/d1C2trhoj24+c5ZmGCisY9PO1migY3k5ZKh6
 aYyMibBfacRmkWS3L6RKOocoFJjAb+UgemwwX8o9zxRVg7Z0xY3nrtPAq
 Zh0C2wXhKuCBsCIhM85IofMrvh00xm3k2j3S43TCsI//zWf/CFYJWYNuc
 YvqXCZEFYIAe4L6OU3iehkvv+H3JBuCBBzzbjbcuzTSVjQFXILoFvWV1n
 LxAdjWQ0cWDu7vUZkeDrm8bCnZ2EklcRHamkjk8RmWNDrNGvigRo2PhdG A==;
X-CSE-ConnectionGUID: vsIfs+qHTeSPn8UrxO+4JQ==
X-CSE-MsgGUID: 7GbHgFbiQJiQnYI5yJ+pxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="28625532"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="28625532"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 21:55:48 -0700
X-CSE-ConnectionGUID: vKSWl+xFSHKTRdYCfOKMQA==
X-CSE-MsgGUID: vu2h8A4LQm6iYQb0PopQwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48331962"
Received: from nitin-super-server.iind.intel.com ([10.145.169.70])
 by fmviesa007.fm.intel.com with ESMTP; 10 Jul 2024 21:55:45 -0700
From: Nitin Gote <nitin.r.gote@intel.com>
To: tursulin@ursulin.net,
	intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, andi.shyti@intel.com,
 chris.p.wilson@linux.intel.com, nirmoy.das@intel.com,
 janusz.krzysztofik@linux.intel.com, nitin.r.gote@intel.com,
 stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Date: Thu, 11 Jul 2024 10:42:15 +0530
Message-Id: <20240711051215.1143127-1-nitin.r.gote@intel.com>
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

v2: Simplify can_preemt() function (Tvrtko Ursulin)

Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundaries for gen8")
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
Suggested-by: Andi Shyti <andi.shyti@intel.com>
Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
CC: <stable@vger.kernel.org> # v5.2+
---
 .../drm/i915/gt/intel_execlists_submission.c    | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 21829439e686..59885d7721e4 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -294,11 +294,19 @@ static int virtual_prio(const struct intel_engine_execlists *el)
 	return rb ? rb_entry(rb, struct ve_node, rb)->prio : INT_MIN;
 }
 
+static bool can_preempt(const struct intel_engine_cs *engine)
+{
+	return GRAPHICS_VER(engine->i915) > 8;
+}
+
 static bool need_preempt(const struct intel_engine_cs *engine,
 			 const struct i915_request *rq)
 {
 	int last_prio;
 
+	if (!can_preempt(engine))
+		return false;
+
 	if (!intel_engine_has_semaphores(engine))
 		return false;
 
@@ -3313,15 +3321,6 @@ static void remove_from_engine(struct i915_request *rq)
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

