Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2F47C88D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 22:02:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5DD310E8ED;
	Tue, 21 Dec 2021 21:02:40 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E7010E520;
 Tue, 21 Dec 2021 21:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640120559; x=1671656559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jaZ9dZ6IsKCfyvtQYFFdxKGmm382SWPhJJlR4N8r7Rc=;
 b=lyKs2DvP685SJQtrcCzSOtA6nKNdxGAsXPvnj0uwRKjvhSo927QJpbNE
 F72EVOKNQu8IsLIbv/8yh8NPRLUC4D8CqoyWvzbgj6KweXAOEYnMn+9Wx
 G1TGJUM0xTHqhP37smXy9755pYJiGMERqrDL7b51BObA4A9uzSqchTnF6
 i/iRE7anBUuxF3bxR45BKVWzeoOdpJXW3eDHAd0FZ5XFsfEIqRW+Hiy8J
 LQDCmx7AEUIcirAT9e1baOwDDHziXKDGrCbdkm/0+JWq1EAjxWww6gC7r
 pKBPQJfOmCd830Hr/glNAaNFNFJ31cwVu0/cA5XsOQFEGGOb36O4ivBMN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="238028301"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="238028301"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 13:02:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="613608218"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga002.fm.intel.com with ESMTP; 21 Dec 2021 13:02:12 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2] drm/i915/guc: Check for wedged before doing stuff
Date: Tue, 21 Dec 2021 13:02:12 -0800
Message-Id: <20211221210212.1438670-1-John.C.Harrison@Intel.com>
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

A fault injection probe test hit a BUG_ON in a GuC error path. It
showed that the GuC code could potentially attempt to do many things
when the device is actually wedged. So, add a check in to prevent that.

v2: Use intel_gt_is_wedged instead of testing bits directly in the
GuC submission code (review feedback from Tvrtko).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index e7517206af82..756b29d8326b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -1349,7 +1349,8 @@ submission_disabled(struct intel_guc *guc)
 	struct i915_sched_engine * const sched_engine = guc->sched_engine;
 
 	return unlikely(!sched_engine ||
-			!__tasklet_is_enabled(&sched_engine->tasklet));
+			!__tasklet_is_enabled(&sched_engine->tasklet) ||
+			intel_gt_is_wedged(guc_to_gt(guc)));
 }
 
 static void disable_submission(struct intel_guc *guc)
@@ -1725,7 +1726,7 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
 {
 	/* Reset called during driver load or during wedge? */
 	if (unlikely(!guc_submission_initialized(guc) ||
-		     test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags))) {
+		     intel_gt_is_wedged(guc_to_gt(guc)))) {
 		return;
 	}
 
-- 
2.25.1

