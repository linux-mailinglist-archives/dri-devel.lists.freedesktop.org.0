Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2F43477FC
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4E06E9F5;
	Wed, 24 Mar 2021 12:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6911C6E9F2;
 Wed, 24 Mar 2021 12:13:51 +0000 (UTC)
IronPort-SDR: NoC25y502WkEk0HJ1KrCTViH2Cz0Y8kh4ZtdTUX4ysAHpBQA1TUDzL2cd6dVk5n7JmjJOx+ced
 2uec3R4jFZ5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="188386177"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="188386177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:51 -0700
IronPort-SDR: KgJrRpbUFKDVmGInO17gJshZJ1Gv0tok9BMAJ/P6Q0c3c84WIi+wbI9tR4MNisXA9DBwRiSGhV
 eBcTairqOpBA==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="391277148"
Received: from adizdarx-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.248.133])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 05:13:50 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/7] drm/i915: Handle async cancellation in sentinel assert
Date: Wed, 24 Mar 2021 12:13:32 +0000
Message-Id: <20210324121335.2307063-5-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

With the watchdog cancelling requests asynchronously to preempt-to-busy we
need to relax one assert making it apply only to requests not in error.

v2:
 * Check against the correct request!

v3:
 * Simplify the check to avoid the question of when to sample the fence
   error vs sentinel bit.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 4b870eca9693..9d264d4ffa75 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -700,9 +700,8 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
 {
 	struct intel_engine_cs *engine =
 		container_of(execlists, typeof(*engine), execlists);
-	struct i915_request * const *port, *rq;
+	struct i915_request * const *port, *rq, *prev = NULL;
 	struct intel_context *ce = NULL;
-	bool sentinel = false;
 	u32 ccid = -1;
 
 	trace_ports(execlists, msg, execlists->pending);
@@ -752,15 +751,20 @@ assert_pending_valid(const struct intel_engine_execlists *execlists,
 		 * Sentinels are supposed to be the last request so they flush
 		 * the current execution off the HW. Check that they are the only
 		 * request in the pending submission.
+		 *
+		 * NB: Due to the async nature of preempt-to-busy and request
+		 * cancellation we need to handle the case where request
+		 * becomes a sentinel in parallel to CSB processing.
 		 */
-		if (sentinel) {
+		if (prev && i915_request_has_sentinel(prev) &&
+		    !READ_ONCE(prev->fence.error)) {
 			GEM_TRACE_ERR("%s: context:%llx after sentinel in pending[%zd]\n",
 				      engine->name,
 				      ce->timeline->fence_context,
 				      port - execlists->pending);
 			return false;
 		}
-		sentinel = i915_request_has_sentinel(rq);
+		prev = rq;
 
 		/*
 		 * We want virtual requests to only be in the first slot so
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
