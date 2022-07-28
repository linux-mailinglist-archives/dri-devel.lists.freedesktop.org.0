Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D17583718
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 04:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157F510F961;
	Thu, 28 Jul 2022 02:42:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D610EA51;
 Thu, 28 Jul 2022 02:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658976147; x=1690512147;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E8B9qejhPS7QqWDfrnsVMTo6dJ/YDEkwJYeHMmIQxh0=;
 b=iVZGZ758/Po0SNuH+JVdET+BJN+xjk/fWa/5K/4xw67JSsW/8IFXxDgT
 34rWMOJW1ORVRrln+mkQE1Be0V6apca5TOXhUe1BiPfEohqwmZLNg0NHT
 7fUHhBtAfTA3RHE5tV1iaebUeMegq25OpkShbmCTOXyvZ7QnQ1mV3a44V
 ZT2uIHje3l6xB33C7cubeTEs8A7GD1v6/D8ZyRBezQ1OwBMhKgaGy6bJc
 T/eKMvQS9aWwe3ftsuGeDZqbrlsIm+Q97JkaGH+q5tYm7tqC/ocREibQB
 V+yC5e6TWgdYEVJic0MUT42RWU3zEZNR90e2KbkASXDGP2gktliJet8qz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="271443540"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="271443540"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 19:42:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="690096043"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2022 19:42:25 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/6] drm/i915/guc: Fix issues with live_preempt_cancel
Date: Wed, 27 Jul 2022 19:42:21 -0700
Message-Id: <20220728024225.2363663-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
References: <20220728024225.2363663-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Having semaphores results in different behavior when a dependent request
is cancelled. In the case of semaphores the request could be on the HW
and complete successfully while without the request is held in the
driver and the error from the dependent request is propagated. Fix
live_preempt_cancel to take this behavior into account.

Also update live_preempt_cancel to use new function intel_context_ban
rather than intel_context_set_banned.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_execlists.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_execlists.c b/drivers/gpu/drm/i915/gt/selftest_execlists.c
index 02fc97a0ab502..015f8cd3463e2 100644
--- a/drivers/gpu/drm/i915/gt/selftest_execlists.c
+++ b/drivers/gpu/drm/i915/gt/selftest_execlists.c
@@ -2087,7 +2087,7 @@ static int __cancel_active0(struct live_preempt_cancel *arg)
 		goto out;
 	}
 
-	intel_context_set_banned(rq->context);
+	intel_context_ban(rq->context, rq);
 	err = intel_engine_pulse(arg->engine);
 	if (err)
 		goto out;
@@ -2146,7 +2146,7 @@ static int __cancel_active1(struct live_preempt_cancel *arg)
 	if (err)
 		goto out;
 
-	intel_context_set_banned(rq[1]->context);
+	intel_context_ban(rq[1]->context, rq[1]);
 	err = intel_engine_pulse(arg->engine);
 	if (err)
 		goto out;
@@ -2229,7 +2229,7 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
 	if (err)
 		goto out;
 
-	intel_context_set_banned(rq[2]->context);
+	intel_context_ban(rq[2]->context, rq[2]);
 	err = intel_engine_pulse(arg->engine);
 	if (err)
 		goto out;
@@ -2244,7 +2244,13 @@ static int __cancel_queued(struct live_preempt_cancel *arg)
 		goto out;
 	}
 
-	if (rq[1]->fence.error != 0) {
+	/*
+	 * The behavior between having semaphores and not is different. With
+	 * semaphores the subsequent request is on the hardware and not cancelled
+	 * while without the request is held in the driver and cancelled.
+	 */
+	if (intel_engine_has_semaphores(rq[1]->engine) &&
+	    rq[1]->fence.error != 0) {
 		pr_err("Normal inflight1 request did not complete\n");
 		err = -EINVAL;
 		goto out;
@@ -2292,7 +2298,7 @@ static int __cancel_hostile(struct live_preempt_cancel *arg)
 		goto out;
 	}
 
-	intel_context_set_banned(rq->context);
+	intel_context_ban(rq->context, rq);
 	err = intel_engine_pulse(arg->engine); /* force reset */
 	if (err)
 		goto out;
-- 
2.37.1

