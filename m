Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7166691F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 03:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4AD10E851;
	Thu, 12 Jan 2023 02:53:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247A710E2E0;
 Thu, 12 Jan 2023 02:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673492023; x=1705028023;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HUiwugwT28htyRQaLp8x+1m39Kl4vFD7KWtQkl+/+ac=;
 b=ki7LEnk7RBMsOnz4knhNNwsRvXpireLNDtjUBIuYGAO7vJZk8fsrCxb3
 uenJS/TNDT6mymYV/FFPbuyWnYyTCyRG6BNwZwSCItYPPGm0GdyjUxEHa
 0wJNr/hWIrHfNgBlQGpbMxXi+eYkmQiP2CN1wXFSZoq/FBd5bJHFJHo0T
 aOyx7OonKiZ1TeU8//vO3czUK2NQpdiLvNl4Bj27bGXdDiZfuYI7j6fl0
 SAaVV8T4jB5NKSRNG21aDr0Et3h4Z/K2VsiYWEFKD68vsSYCDuS0ItQ46
 PG3RGTKILwzWJbEwiFpglOo7RACNLtwaFoo+NLYfwTt0dx00l2g/LIxsz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="350823501"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="350823501"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 18:53:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="986359632"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="986359632"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 11 Jan 2023 18:53:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/4] drm/i915/guc: Look for a guilty context when an engine
 reset fails
Date: Wed, 11 Jan 2023 18:53:10 -0800
Message-Id: <20230112025311.2577084-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..99d09e3394597 100644
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
+		 * Note that it should be safe/reliable to do this here because the GuC
+		 * is toast and will not be scheduling behind the KMD's back.
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

