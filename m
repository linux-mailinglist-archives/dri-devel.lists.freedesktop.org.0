Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664744958F5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 05:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD86910E4FF;
	Fri, 21 Jan 2022 04:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EBF10E4CC;
 Fri, 21 Jan 2022 04:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642739829; x=1674275829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GjyPCXjpUKEZDE0XdIh5WsjCMtBgJdkFP76RiM+s2XY=;
 b=ZIPo/YQJ0C284kSGlhkXz9Ko7VZP2gjiiT8cBL/RvYouZCG7DgRJKSHZ
 18MnpWmbTlgzmK52ezm6eeEEoLqFjrSoDe42++ka2KBLbuE+WHiEGjlEz
 +IMDMOvEilvM6XO2APZjsZiq0M/3cdeqYe/cnaYHsR6JwwKM7tLLeRmwM
 DkjnEqgPKhvb1QLvWNlpG00SdECOiBTtwdmrx6rxop2XBuP4PVdHemOti
 8DqfZFXHgA0ldRymHl/roTvGIDUazxr1iXCKeaDuvkgIlfisxPaE0UlUv
 yQiJAT26AmNxqzOQJl4v+OcI75JzUyFgA+ZVtmxzzpkClKMfILSHEUihs A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="244384012"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="244384012"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="626596559"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 20:37:08 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/i915/guc: Flush G2H handler during a GT reset
Date: Thu, 20 Jan 2022 20:31:18 -0800
Message-Id: <20220121043118.24886-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121043118.24886-1-matthew.brost@intel.com>
References: <20220121043118.24886-1-matthew.brost@intel.com>
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
can safely flush the G2H handler during a GT reset. This eliminates
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
index 9a3f503d201aa..1331ff91c5b05 100644
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

