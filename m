Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BF23E8796
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 03:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C737D6E086;
	Wed, 11 Aug 2021 01:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A5A6E079
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 01:16:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="276064752"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="276064752"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="675603983"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <gfx-internal-devel@eclists.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/9] drm/i915/guc: Do not clear enable during reset in an
 enable is inflight
Date: Wed, 11 Aug 2021 01:16:19 +0000
Message-Id: <20210811011622.255784-7-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811011622.255784-1-matthew.brost@intel.com>
References: <20210811011622.255784-1-matthew.brost@intel.com>
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

Do not clear enable during a context reset if a schedule enable is in
flight. This can occur if the context reset during a request
cancellation, clears the offending request, and then enables scheduling.

Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c    | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e5eb2df11b4a..4631b15eccaf 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -831,17 +831,23 @@ __unwind_incomplete_requests(struct intel_context *ce)
 static void __guc_reset_context(struct intel_context *ce, bool stalled)
 {
 	struct i915_request *rq;
+	unsigned long flags;
 	u32 head;
 
 	intel_context_get(ce);
 
 	/*
-	 * GuC will implicitly mark the context as non-schedulable
-	 * when it sends the reset notification. Make sure our state
-	 * reflects this change. The context will be marked enabled
-	 * on resubmission.
+	 * GuC will implicitly mark the context as non-schedulable when it sends
+	 * the reset notification. Make sure our state reflects this change. The
+	 * context will be marked enabled on resubmission. A small window exists
+	 * where the context could be block & unblocked (scheduling enable) while
+	 * this reset was inflight. If a scheduling enable is already is in
+	 * flight do not clear the enable.
 	 */
-	clr_context_enabled(ce);
+	spin_lock_irqsave(&ce->guc_state.lock, flags);
+	if (!context_pending_enable(ce))
+		clr_context_enabled(ce);
+	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
 
 	rq = intel_context_find_active_request(ce);
 	if (!rq) {
-- 
2.32.0

