Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D380343F34E
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 01:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4B246E856;
	Thu, 28 Oct 2021 23:00:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0A56E856;
 Thu, 28 Oct 2021 23:00:42 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="227990247"
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="227990247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:47:03 -0700
X-IronPort-AV: E=Sophos;i="5.87,191,1631602800"; d="scan'208";a="538226467"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2021 15:47:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <thomas.hellstrom@linux.intel.com>,
	<john.c.harrison@intel.com>
Subject: [PATCH] drm/i915/resets: Don't set / test for per-engine reset bits
 with GuC submission
Date: Thu, 28 Oct 2021 15:42:24 -0700
Message-Id: <20211028224224.32693-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't set, test for, or clear per-engine reset bits with GuC submission
as the GuC owns the per engine resets not the i915. Setting, testing
for, and clearing these bits is causing issues with the hangcheck
selftest. Rather than change to test to not use these bits, rip the use
of these bits out from the reset code.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 91200c43951f..51b56b8e5003 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1367,20 +1367,27 @@ void intel_gt_handle_error(struct intel_gt *gt,
 	/* Make sure i915_reset_trylock() sees the I915_RESET_BACKOFF */
 	synchronize_rcu_expedited();
 
-	/* Prevent any other reset-engine attempt. */
-	for_each_engine(engine, gt, tmp) {
-		while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
-					&gt->reset.flags))
-			wait_on_bit(&gt->reset.flags,
-				    I915_RESET_ENGINE + engine->id,
-				    TASK_UNINTERRUPTIBLE);
+	/*
+	 * Prevent any other reset-engine attempt. We don't do this for GuC
+	 * submission the GuC owns the per-engine reset, not the i915.
+	 */
+	if (!intel_uc_uses_guc_submission(&gt->uc)) {
+		for_each_engine(engine, gt, tmp) {
+			while (test_and_set_bit(I915_RESET_ENGINE + engine->id,
+						&gt->reset.flags))
+				wait_on_bit(&gt->reset.flags,
+					    I915_RESET_ENGINE + engine->id,
+					    TASK_UNINTERRUPTIBLE);
+		}
 	}
 
 	intel_gt_reset_global(gt, engine_mask, msg);
 
-	for_each_engine(engine, gt, tmp)
-		clear_bit_unlock(I915_RESET_ENGINE + engine->id,
-				 &gt->reset.flags);
+	if (!intel_uc_uses_guc_submission(&gt->uc)) {
+		for_each_engine(engine, gt, tmp)
+			clear_bit_unlock(I915_RESET_ENGINE + engine->id,
+					 &gt->reset.flags);
+	}
 	clear_bit_unlock(I915_RESET_BACKOFF, &gt->reset.flags);
 	smp_mb__after_atomic();
 	wake_up_all(&gt->reset.queue);
-- 
2.32.0

