Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E2F449A30
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 17:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE856E1CD;
	Mon,  8 Nov 2021 16:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3016E18E;
 Mon,  8 Nov 2021 16:45:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="293093720"
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="293093720"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 08:45:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="469664523"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 08:45:28 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915/guc: Refcount context during error capture
Date: Mon,  8 Nov 2021 08:40:54 -0800
Message-Id: <20211108164054.23588-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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
Cc: john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When i915 receives a context reset notification from GuC, it triggers
an error capture before resetting any outstanding requsts of that
context. Unfortunately, the error capture is not a time bound
operation. In certain situations it can take a long time, particularly
when multiple large LMEM buffers must be read back and eoncoded. If
this delay is longer than other timeouts (heartbeat, test recovery,
etc.) then a full GT reset can be triggered in the middle.

That can result in the context being reset by GuC actually being
destroyed before the error capture completes and the GuC submission
code resumes. Thus, the GuC side can start dereferencing stale
pointers and Bad Things ensue.

So add a refcount get of the context during the entire reset
operation. That way, the context can't be destroyed part way through
no matter what other resets or user interactions occur.

v2:
 (Matthew Brost)
  - Update patch to work with async error capture
v3:
 (Matthew Brost)
  - Drop async capture support as that hasn't landed yet

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 5cc49c0b3889..d7e49f7c1dba 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3972,6 +3972,7 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 					const u32 *msg, u32 len)
 {
 	struct intel_context *ce;
+	unsigned long flags;
 	int desc_idx;
 
 	if (unlikely(len != 1)) {
@@ -3980,11 +3981,24 @@ int intel_guc_context_reset_process_msg(struct intel_guc *guc,
 	}
 
 	desc_idx = msg[0];
+
+	/*
+	 * The context lookup uses the xarray but lookups only require an RCU lock
+	 * not the full spinlock. So take the lock explicitly and keep it until the
+	 * context has been reference count locked to ensure it can't be destroyed
+	 * asynchronously until the reset is done.
+	 */
+	xa_lock_irqsave(&guc->context_lookup, flags);
 	ce = g2h_context_lookup(guc, desc_idx);
+	if (ce)
+		intel_context_get(ce);
+	xa_unlock_irqrestore(&guc->context_lookup, flags);
+
 	if (unlikely(!ce))
 		return -EPROTO;
 
 	guc_handle_context_reset(guc, ce);
+	intel_context_put(ce);
 
 	return 0;
 }
-- 
2.32.0

