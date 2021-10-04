Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B73A4219C8
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 00:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D126EAB4;
	Mon,  4 Oct 2021 22:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82D3892B2;
 Mon,  4 Oct 2021 22:11:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="225498448"
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="225498448"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:35 -0700
X-IronPort-AV: E=Sophos;i="5.85,347,1624345200"; d="scan'208";a="487735542"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 15:11:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <john.c.harrison@intel.com>,
	<daniele.ceraolospurio@intel.com>
Subject: [PATCH 23/26] drm/i915: Make request conflict tracking understand
 parallel submits
Date: Mon,  4 Oct 2021 15:06:34 -0700
Message-Id: <20211004220637.14746-24-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004220637.14746-1-matthew.brost@intel.com>
References: <20211004220637.14746-1-matthew.brost@intel.com>
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

If an object in the excl or shared slot is a composite fence from a
parallel submit and the current request in the conflict tracking is from
the same parallel context there is no need to enforce ordering as the
ordering already implicit. Make the request conflict tracking understand
this by comparing the parents parallel fence values and skipping the
conflict insertion if the values match.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 43 +++++++++++++++++++----------
 1 file changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index e9bfa32f9270..cf89624020ad 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1325,6 +1325,25 @@ i915_request_await_external(struct i915_request *rq, struct dma_fence *fence)
 	return err;
 }
 
+static inline bool is_parallel_rq(struct i915_request *rq)
+{
+	return intel_context_is_parallel(rq->context);
+}
+
+static inline struct intel_context *request_to_parent(struct i915_request *rq)
+{
+	return intel_context_to_parent(rq->context);
+}
+
+static bool is_same_parallel_context(struct i915_request *to,
+				     struct i915_request *from)
+{
+	if (is_parallel_rq(to))
+		return request_to_parent(to) == request_to_parent(from);
+
+	return false;
+}
+
 int
 i915_request_await_execution(struct i915_request *rq,
 			     struct dma_fence *fence)
@@ -1356,11 +1375,14 @@ i915_request_await_execution(struct i915_request *rq,
 		 * want to run our callback in all cases.
 		 */
 
-		if (dma_fence_is_i915(fence))
+		if (dma_fence_is_i915(fence)) {
+			if (is_same_parallel_context(rq, to_request(fence)))
+				continue;
 			ret = __i915_request_await_execution(rq,
 							     to_request(fence));
-		else
+		} else {
 			ret = i915_request_await_external(rq, fence);
+		}
 		if (ret < 0)
 			return ret;
 	} while (--nchild);
@@ -1461,10 +1483,13 @@ i915_request_await_dma_fence(struct i915_request *rq, struct dma_fence *fence)
 						 fence))
 			continue;
 
-		if (dma_fence_is_i915(fence))
+		if (dma_fence_is_i915(fence)) {
+			if (is_same_parallel_context(rq, to_request(fence)))
+				continue;
 			ret = i915_request_await_request(rq, to_request(fence));
-		else
+		} else {
 			ret = i915_request_await_external(rq, fence);
+		}
 		if (ret < 0)
 			return ret;
 
@@ -1539,16 +1564,6 @@ i915_request_await_object(struct i915_request *to,
 	return ret;
 }
 
-static inline bool is_parallel_rq(struct i915_request *rq)
-{
-	return intel_context_is_parallel(rq->context);
-}
-
-static inline struct intel_context *request_to_parent(struct i915_request *rq)
-{
-	return intel_context_to_parent(rq->context);
-}
-
 static struct i915_request *
 __i915_request_ensure_parallel_ordering(struct i915_request *rq,
 					struct intel_timeline *timeline)
-- 
2.32.0

