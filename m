Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B180266E889
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 22:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756B210E5E3;
	Tue, 17 Jan 2023 21:37:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77CDD10E5E2;
 Tue, 17 Jan 2023 21:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673991414; x=1705527414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sNI1D9hmQ3FjZk2ovxPA/9Shxc84mL4YIw0sgu6bSTQ=;
 b=MMvRnD5tGUP/eUro6Eql82LNHTKp1e7ori56oXROF90X3i14u5Bi9H0w
 ddbY9h7H9ErdkrW1I1UqVmkjcprALqIT/X67AL409olJM165rGtEtxzzu
 wNDiAVYczCGyMsP0FL4MVaqVR9ow9/k6rPtz/SwJUqWM9BiaVxNaZyJBo
 LSzNY487U30xtGxh1/skjiYyTGAXLpmKwgT5xYTPRr0e17t8T1TXmUbW7
 o6369CV0a3lK/Hqa/tXTIfH/HpZC0cYac2+MYU+4hINWpDOwOsC9yNqsO
 XkLCoqywdIj1ISbUbPZqHFIqd9HY+H7Gp9yvvlDaAfPM3Pf75wOglK/Dl A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="312696229"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="312696229"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 13:36:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="988285030"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="988285030"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 17 Jan 2023 13:36:53 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 4/5] drm/i915/guc: Look for a guilty context when an engine
 reset fails
Date: Tue, 17 Jan 2023 13:36:29 -0800
Message-Id: <20230117213630.2897570-5-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Engine resets are supposed to never fail. But in the case when one
does (due to unknown reasons that normally come down to a missing
w/a), it is useful to get as much information out of the system as
possible. Given that the GuC effectively dies on such a situation, it
is not possible to get a guilty context notification back. So do a
manual search instead. Given that GuC is dead, this is safe because
GuC won't be changing the engine state asynchronously.

v2: Change comment to be less alarming (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 3b34a82d692be..9bc80b807dbcc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4754,11 +4754,24 @@ static void reset_fail_worker_func(struct work_struct *w)
 	guc->submission_state.reset_fail_mask = 0;
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 
-	if (likely(reset_fail_mask))
+	if (likely(reset_fail_mask)) {
+		struct intel_engine_cs *engine;
+		enum intel_engine_id id;
+
+		/*
+		 * GuC is toast at this point - it dead loops after sending the failed
+		 * reset notification. So need to manually determine the guilty context.
+		 * Note that it should be reliable to do this here because the GuC is
+		 * toast and will not be scheduling behind the KMD's back.
+		 */
+		for_each_engine_masked(engine, gt, reset_fail_mask, id)
+			intel_guc_find_hung_context(engine);
+
 		intel_gt_handle_error(gt, reset_fail_mask,
 				      I915_ERROR_CAPTURE,
-				      "GuC failed to reset engine mask=0x%x\n",
+				      "GuC failed to reset engine mask=0x%x",
 				      reset_fail_mask);
+	}
 }
 
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
-- 
2.39.0

