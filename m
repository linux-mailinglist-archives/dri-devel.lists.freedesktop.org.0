Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717674ACE8E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A4810E3D3;
	Tue,  8 Feb 2022 02:07:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47110E324;
 Tue,  8 Feb 2022 02:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644286038; x=1675822038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R3/ys9ohxjEuZnYsD3UyY6kfSP3f1++9NkRvXXutvtE=;
 b=QRznG2XDoPZz4QCHC8ZRdlGTAAU6iayuAddB/xaRgG1rxUXW/9RuPPfa
 gdhUmvuxhlG7S4Li8xA4/SyLdcl5IQj2Z9mvMCPkRjXqgXv41TJ/2dqHS
 a2cLa72cag7DPS999Z8UkoR+nbWejCdvqAIP63kX1qNu5BgzT702JFa7f
 a7xOrimGIL2/8Q6ItjfDybwaZOQaq10dVTGNLYwrlN/ymstWjk4iacA/a
 lEExVhsSfM+SnXMqB8/AaSt/Opmv5vtlFesG8lma7OVIIre6IgUG3CN5S
 wyvnrTZ/yRyN7j7AfcUTc3Ip1deIddBcLBjlzgMyVRktEEta1exHbkHad w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="228821984"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="228821984"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 18:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="540386498"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 07 Feb 2022 18:07:16 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Fix flag query to not modify state
Date: Mon,  7 Feb 2022 18:07:16 -0800
Message-Id: <20220208020716.2140157-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A flag query helper was actually writing to the flags word rather than
just reading. Fix that. Also update the function's comment as it was
out of date.

Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
Signed-off-by: John Harrison <john.c.harrison@intel.com>
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

