Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E0E4BABB9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 22:29:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7B10E822;
	Thu, 17 Feb 2022 21:29:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224410E81D;
 Thu, 17 Feb 2022 21:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645133390; x=1676669390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dDV27HB9F+X5MzwVREbSVVbXSDLXfe3HUqvjiUfCdzk=;
 b=EGN0mLMPneeDkfUP5e6J0fYJ5tSnLjuTJH6jH+nDodnmTg413eUXoAZW
 j6JUi9PTO/MGhBBRh6Fa/xb8ET6+0tJUsnUZBzzzj8wwiUHfMdMDdbu54
 S4OrZsa3mDZISeAYzs3axp2X3yRh9fG/jXA4BMFs+4Te7NULd2BUmei0t
 9tt1effVl56Vl6AJLm4kX2CUiCVsvVJ60vmxbpXiCAwHqSF0NsJ1KMD8n
 uA6QXNZ9cZpt+i9SMcV52lUGmimxkhNKLiSCCsxkBXuOuhRkmTIiwb0dr
 I8BZ3VPQ/+G4iLA+J5YS9ONt9g3peO5hLkzn1DZ/94fcQrNmQQXG9k+UX A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250923556"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="250923556"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 13:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="530529292"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga007.jf.intel.com with ESMTP; 17 Feb 2022 13:29:42 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix flag query helper function to not modify
 state
Date: Thu, 17 Feb 2022 13:29:42 -0800
Message-Id: <20220217212942.629922-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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

A flag query helper was actually writing to the flags word rather than
just reading. Fix that. Also update the function's comment as it was
out of date.

NB: No need for a 'Fixes' tag. The test was only ever used inside a
BUG_ON during context registration. Rather than asserting that the
condition was true, it was making the condition true. So, in theory,
there was no consequence because we should never have hit a BUG_ON
anyway. Which means the write should always have been a no-op.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..d9f4218f5ef4 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -174,11 +174,8 @@ static inline void init_sched_state(struct intel_context *ce)
 __maybe_unused
 static bool sched_state_is_init(struct intel_context *ce)
 {
-	/*
-	 * XXX: Kernel contexts can have SCHED_STATE_NO_LOCK_REGISTERED after
-	 * suspend.
-	 */
-	return !(ce->guc_state.sched_state &=
+	/* Kernel contexts can have SCHED_STATE_REGISTERED after suspend. */
+	return !(ce->guc_state.sched_state &
 		 ~(SCHED_STATE_BLOCKED_MASK | SCHED_STATE_REGISTERED));
 }
 
-- 
2.25.1

