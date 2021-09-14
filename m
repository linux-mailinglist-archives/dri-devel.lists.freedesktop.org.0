Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA0F40A5D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 07:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC426E409;
	Tue, 14 Sep 2021 05:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500916E3F0;
 Tue, 14 Sep 2021 05:15:01 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10106"; a="208976889"
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="208976889"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:15:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,291,1624345200"; d="scan'208";a="697404485"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 22:14:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniele.ceraolospurio@intel.com>,
	<john.c.harrison@intel.com>
Subject: [PATCH 3/4] drm/i915/guc: Flush G2H work queue during reset
Date: Mon, 13 Sep 2021 22:09:55 -0700
Message-Id: <20210914050956.30685-4-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914050956.30685-1-matthew.brost@intel.com>
References: <20210914050956.30685-1-matthew.brost@intel.com>
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

It isn't safe to scrub for missing G2H or continue with the reset until
all G2H processing is complete. Flush the G2H work queue during reset to
ensure it is done running. No need to call the IRQ handler directly
either as the scrubbing code can deal with any missing G2H.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ba6838a35a69..1986a57b52cc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -800,8 +800,6 @@ static void guc_flush_submissions(struct intel_guc *guc)
 
 void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 {
-	int i;
-
 	if (unlikely(!guc_submission_initialized(guc))) {
 		/* Reset called during driver load? GuC not yet initialised! */
 		return;
@@ -816,21 +814,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
 	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
 
 	guc_flush_submissions(guc);
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
2.32.0

