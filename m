Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2FA48DD59
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 18:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D332510E553;
	Thu, 13 Jan 2022 17:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7351910E244;
 Thu, 13 Jan 2022 17:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642096706; x=1673632706;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=//zoXam2LkJGhZiFrNRnsUte9dNJkUupgvL7NboYRKQ=;
 b=CojlobLp8vTmVPwDZbK2JCOQFTpPRs2gyqqFdnvrztzG0TpDQLInaJJ0
 nn7ibK7UIYsn9wji9jkk1AGpgvyiSYQQVtCG7KIVJgi3+3GI5zP+0a6Yf
 ZqF/b8Acrw50FICcbTZT0g/2n2qOdBNMaUiusrc9Fn0ZqzmNX+U0zKfsr
 /fHhL0DR7hQnzuv+2jU8ZI2ht6BmX/kHYoD9zgis0yNNGeB+aBE4F8HJp
 GfAf3oyfl5EvJNkPAx+5WQXSTAScS+moQfGK+VQGl2EsW2IVb864n4Von
 NhnnEPt2G4jD3hdjgdBaUwLmdYMAB7RaFlX+z2okX5LEIy2rby0Hn7zw2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="244030358"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="244030358"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:58:25 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="516028970"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 09:58:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/i915/guc: Flush G2H handler during a GT reset
Date: Thu, 13 Jan 2022 09:52:32 -0800
Message-Id: <20220113175232.20897-3-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113175232.20897-1-matthew.brost@intel.com>
References: <20220113175232.20897-1-matthew.brost@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the error capture is fully decoupled from fence signalling
(request retirement to free memory, which is turn depends on resets) we
can safely flush the G2H handler during a GT reset. This is eliminates
corner cases where GuC generated G2H (e.g. engine resets) race with a GT
reset.

Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c  | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 23a40f10d376d..f8614ff904b2b 100644
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

