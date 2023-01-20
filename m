Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1667618D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EBC310EB31;
	Fri, 20 Jan 2023 23:28:54 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7549810EB22;
 Fri, 20 Jan 2023 23:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674257330; x=1705793330;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MXHjO/r51sJWf//8G91MF+USmcK0WCiA3qVITFrftH4=;
 b=YRxw8ohM+pJ67VXgzqjSExp1fqzW46JFfY5y3LeUG7tEyk5HeU1bABsj
 Ri2ZchsRIEBfdvCQXzvwzzdnn4mUlfzwidv/gp5sWfId4pGeSjnyFTtCJ
 iA/SL4sv2WfUxHcZ5f+EsVezwp8hMubwkkqmQYYScn/prTfR02vHtB097
 0ABgbxkTiVS+z9Ed2MVhAKsEnYhtL9R9hVqD/VJjkqDMcrioFohJoptuO
 btEFjsxAf3GuWxZdbf1jOicKAvgaSVFx9bHgpo8pzGO48iYPdkXtCCq7Y
 fm8X1sV4CUFOaFnOFKxAwc0Ad4CLHZ+fs7vx0o11oVR7FReCcty/PVrUz A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324413566"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="324413566"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693021621"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="693021621"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 15:28:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 5/7] drm/i915/guc: Look for a guilty context when an engine
 reset fails
Date: Fri, 20 Jan 2023 15:28:29 -0800
Message-Id: <20230120232831.28177-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120232831.28177-1-John.C.Harrison@Intel.com>
References: <20230120232831.28177-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Engine resets are supposed to never fail. But in the case when one
does (due to unknown reasons that normally come down to a missing
w/a), it is useful to get as much information out of the system as
possible. Given that the GuC intentionally dies on such a situation,
it is not possible to get a guilty context notification back. So do a
manual search instead. Given that GuC is dead, this is safe because
GuC won't be changing the engine state asynchronously.

v2: Change comment to be less alarming (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c   | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index ad4b2848b0f83..b6b4061e4b633 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4755,11 +4755,24 @@ static void reset_fail_worker_func(struct work_struct *w)
 	guc->submission_state.reset_fail_mask = 0;
 	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
 
-	if (likely(reset_fail_mask))
+	if (likely(reset_fail_mask)) {
+		struct intel_engine_cs *engine;
+		enum intel_engine_id id;
+
+		/*
+		 * GuC is toast at this point - it dead loops after sending the failed
+		 * reset notification. So need to manually determine the guilty context.
+		 * Note that it should be reliable to do this here because the GuC is
+		 * toast and will not be scheduling behind the KMD's back.
+		 */
+		for_each_engine_masked(engine, gt, reset_fail_mask, id)
+			intel_guc_find_hung_context(engine);
+
 		intel_gt_handle_error(gt, reset_fail_mask,
 				      I915_ERROR_CAPTURE,
-				      "GuC failed to reset engine mask=0x%x\n",
+				      "GuC failed to reset engine mask=0x%x",
 				      reset_fail_mask);
+	}
 }
 
 int intel_guc_engine_failure_process_msg(struct intel_guc *guc,
-- 
2.39.0

