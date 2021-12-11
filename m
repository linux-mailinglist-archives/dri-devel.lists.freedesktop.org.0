Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09675471252
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 07:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B4010E5D5;
	Sat, 11 Dec 2021 06:59:07 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 407E110E3BF;
 Sat, 11 Dec 2021 06:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639205941; x=1670741941;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lz6kcdq5Ya6xFKebpRqe9l48NRg0MJy/TW8PC0vQhBA=;
 b=CuRk3/gsaQAJn80tiAlh5T+wGccfQix6beVN745KeMd9R8+vsR8hRBSR
 Rc1SjLlu/DmMWND324R/pID+cj9LtyutahiOaa7ycBhor7UFy5AsDyKcY
 66XS8xgc20T1fTubkIEFn8B7+F8o0eUS+/CDmyMpnwVz36MjkncvY2Xeo
 BDLQugwrnEu1+Pvzz5ta9zcCKQUoUlZowpljK2HqXXSeO3urcev9jJQVB
 b+Dp2AHZhOwW4gERruLIsXYYnVsQqXeTpcDrEjUhvxDyTg5EmCCMir2vh
 +c8H28tx9RC5TXrYAIh1Jb68P9KFTZhyyAnUrIQSenOf1lrPlmKYhInA0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="237249048"
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="237249048"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 22:59:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,197,1635231600"; d="scan'208";a="463979857"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 10 Dec 2021 22:58:59 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 3/4] drm/i915/guc: Flag an error if an engine reset fails
Date: Fri, 10 Dec 2021 22:58:58 -0800
Message-Id: <20211211065859.2248188-4-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
References: <20211211065859.2248188-1-John.C.Harrison@Intel.com>
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

If GuC encounters an error during engine reset, the i915 driver
promotes to full GT reset. This includes an info message about why the
reset is happening. However, that is not treated as a failure by any
of the CI systems because resets are an expected occurrance during
testing. This kind of failure is a major problem and should never
happen. So, complain more loudly and make sure CI notices.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 97311119da6f..6015815f1da0 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4018,11 +4018,12 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 					 const u32 *msg, u32 len)
 {
 	struct intel_engine_cs *engine;
+	struct intel_gt *gt = guc_to_gt(guc);
 	u8 guc_class, instance;
 	u32 reason;
 
 	if (unlikely(len != 3)) {
-		drm_err(&guc_to_gt(guc)->i915->drm, "Invalid length %u", len);
+		drm_err(&gt->i915->drm, "Invalid length %u", len);
 		return -EPROTO;
 	}
 
@@ -4032,12 +4033,19 @@ int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
 
 	engine = guc_lookup_engine(guc, guc_class, instance);
 	if (unlikely(!engine)) {
-		drm_err(&guc_to_gt(guc)->i915->drm,
+		drm_err(&gt->i915->drm,
 			"Invalid engine %d:%d", guc_class, instance);
 		return -EPROTO;
 	}
 
-	intel_gt_handle_error(guc_to_gt(guc), engine->mask,
+	/*
+	 * This is an unexpected failure of a hardware feature. So, log a real
+	 * error message not just the informational that comes with the reset.
+	 */
+	drm_err(&gt->i915->drm, "GuC engine reset request failed on %d:%d (%s) because %d",
+		guc_class, instance, engine->name, reason);
+
+	intel_gt_handle_error(gt, engine->mask,
 			      I915_ERROR_CAPTURE,
 			      "GuC failed to reset %s (reason=0x%08x)\n",
 			      engine->name, reason);
-- 
2.25.1

