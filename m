Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C05825729F1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:31:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F05E7976C5;
	Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1C9976BD;
 Tue, 12 Jul 2022 23:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668697; x=1689204697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=koQtewMmMuXnhh3PufImj24iKBtfjhu5HFVVsTn04ao=;
 b=VnwHwh5en+O9nyJO++ky41837UitDEUUshCxjC8lOt5k+iRkNp90TRsz
 0xTdrDCloCgiqJzBev8Km/l1xKX2CIVEC7pKqqb1b2cOXrRt9j7b7JMVr
 Ai78hFZnmTpVrpmuWzMWq0y2vj5yfH3QUsqZA/ZzXKxzuj0cZ1J7xkBf2
 s9Piqktimcyv01qRHCvHckMejt5vV8Bx+Mbpz7ElhQ/SGnXsyMeypy7L+
 IawLKVxOxfWii6iFn5zJOaF2bklwD5DK4JRMF+AWUv0OGZalRJSLaEbGf
 hqXpSYGykkLxT91c09HIy4ghfCJdUQtS1BUa1xXSkI2+8o6uh14YOic8G g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812563"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812563"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137762"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 03/12] drm/i915/guc: Fix issues with live_preempt_cancel
Date: Tue, 12 Jul 2022 16:31:27 -0700
Message-Id: <20220712233136.1044951-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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
2.36.0

