Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381D2494280
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 22:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C6910E6C2;
	Wed, 19 Jan 2022 21:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8B10E20E;
 Wed, 19 Jan 2022 21:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642627809; x=1674163809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D7BAJOEEbWJGUq6J1xH7I9Ict1nLIfBRfoQqmplUEfM=;
 b=R1mKJ/+2GO6RtWzH/ic5UZIHQ213C5q91psNlfiRng7OE9dSky5y9l5j
 wf8hZwZ+JXZAMpUy9BONSSb22mVWhN/KCcoGIceVCr9vaG9SGEJ2qPQSt
 QgpuDR9Sa4HZ+kqHRqm9LWFZNKRihtGhc5zKr1aLYbpvF96aPl1IuNN9E
 gyE763jnpuH3vbsyHS5tYBo6Jy8JTUAYSX0CAdoY7T38S1mXtql6bFjRM
 PXqcAqBoWmdeWiT35KCKo03ZyWnNyjDXSMh0/sqDD1f9r8M6OxCGjRSD8
 vS1JkVssb0Ly8L81fwkEoAKQyhzx9zPLymloyO1QDryaQvF6jBG050ojw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="331548317"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="331548317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="475289720"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 13:30:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/i915/guc: Flush G2H handler during a GT reset
Date: Wed, 19 Jan 2022 13:24:19 -0800
Message-Id: <20220119212419.23068-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119212419.23068-1-matthew.brost@intel.com>
References: <20220119212419.23068-1-matthew.brost@intel.com>
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

Now that the error capture is fully decoupled from fence signalling
(request retirement to free memory, which in turn depends on resets) we
can safely flush the G2H handler during a GT reset. This is eliminates
corner cases where GuC generated G2H (e.g. engine resets) race with a GT
reset.

v2:
 (John Harrison)
  - Fix typo in commit message (s/is/in)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 514b3060b141..406dd2e3f5a9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1396,8 +1396,6 @@ static void guc_flush_destroyed_contexts(struct intel_guc *guc);
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
-	int i;
-
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
@@ -1414,21 +1412,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 
 	guc_flush_submissions(guc);
 	guc_flush_destroyed_contexts(guc);
-
-	/*
-	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
-	 * each pass as interrupt have been disabled. We always scrub for
-	 * outstanding G2H as it is possible for outstanding_submission_g2h to
-	 * be incremented after the context state update.
-	 */
-	for (i = 0; i < 4 && atomic_read(&guc->outstanding_submission_g2h); ++i) {
-		intel_guc_to_host_event_handler(guc);
-#define wait_for_reset(guc, wait_var) \
-		intel_guc_wait_for_pending_msg(guc, wait_var, false, (HZ / 20))
-		do {
-			wait_for_reset(guc, &guc->outstanding_submission_g2h);
-		} while (!list_empty(&guc->ct.requests.incoming));
-	}
+	flush_work(&guc->ct.requests.worker);
 
 	scrub_guc_desc_for_outstanding_g2h(guc);
 }
-- 
2.34.1

