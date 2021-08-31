Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968F53FC821
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 15:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC7889F47;
	Tue, 31 Aug 2021 13:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E1789725;
 Tue, 31 Aug 2021 13:22:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10092"; a="215341027"
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="215341027"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 06:22:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,366,1620716400"; d="scan'208";a="460111097"
Received: from cfitzp2-mobl2.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.255.231])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2021 06:22:33 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 2/2] drm/i915: Handle Intel igfx + Intel dgfx hybrid graphics
 setup
Date: Tue, 31 Aug 2021 14:22:25 +0100
Message-Id: <20210831132225.312768-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210831132225.312768-1-tvrtko.ursulin@linux.intel.com>
References: <20210831132225.312768-1-tvrtko.ursulin@linux.intel.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In short this makes i915 work for hybrid setups (DRI_PRIME=1 with Mesa)
when rendering is done on Intel dgfx and scanout/composition on Intel
igfx.

Before this patch the driver was not quite ready for that setup, mainly
because it was able to emit a semaphore wait between the two GPUs, which
results in deadlocks because semaphore target location in HWSP is neither
shared between the two, nor mapped in both GGTT spaces.

To fix it the patch adds an additional check to a couple of relevant code
paths in order to prevent using semaphores for inter-engine
synchronisation when relevant objects are not in the same GGTT space.

v2:
 * Avoid adding rq->i915. (Chris)

v3:
 * Use GGTT which describes the limit more precisely.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/i915/i915_request.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..e671f4e993cb 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1152,6 +1152,12 @@ __emit_semaphore_wait(struct i915_request *to,
 	return 0;
 }
 
+static bool
+can_use_semaphore_wait(struct i915_request *to, struct i915_request *from)
+{
+	return to->engine->gt->ggtt == from->engine->gt->ggtt;
+}
+
 static int
 emit_semaphore_wait(struct i915_request *to,
 		    struct i915_request *from,
@@ -1160,6 +1166,9 @@ emit_semaphore_wait(struct i915_request *to,
 	const intel_engine_mask_t mask = READ_ONCE(from->engine)->mask;
 	struct i915_sw_fence *wait = &to->submit;
 
+	if (!can_use_semaphore_wait(to, from))
+		goto await_fence;
+
 	if (!intel_context_use_semaphores(to->context))
 		goto await_fence;
 
@@ -1263,7 +1272,8 @@ __i915_request_await_execution(struct i915_request *to,
 	 * immediate execution, and so we must wait until it reaches the
 	 * active slot.
 	 */
-	if (intel_engine_has_semaphores(to->engine) &&
+	if (can_use_semaphore_wait(to, from) &&
+	    intel_engine_has_semaphores(to->engine) &&
 	    !i915_request_has_initial_breadcrumb(to)) {
 		err = __emit_semaphore_wait(to, from, from->fence.seqno - 1);
 		if (err < 0)
-- 
2.30.2

