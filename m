Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10A4C3B3B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:52:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFDD10E680;
	Fri, 25 Feb 2022 01:52:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6644E10E54E;
 Fri, 25 Feb 2022 01:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645753954; x=1677289954;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U4o5QhYU+Bzbn5kNKnkP6D23YyY4EpT+ZKBZxF6tb6k=;
 b=HIk1uBKqn7JDmmaNhgOXpyDf7xRabGJ20SwXP9u+JzmZSuatzPMMSiC2
 rlq6jr8qy7AVJ4Mgs2LLd/s6CfzcLbZm+4ML7qvgwfeYj9OmB8EuIvF83
 nDrC2u4BtsvuTSCUbnKvHti2V4DL9uNr0WbNbuzAVD4UzozqVz4G0RO8v
 wcNyTIyk+bsTgSmqHgHgPoo5fPjxYR/XfTttDmoW6klkdl/qFihfEZdkY
 +NCtAkvAYTyWxsRr9ydyTlVG6oxX6/UBXUDe0KTINi9ok1PLzGMGTIuJ5
 DNq3jkW7Z/MSV2bD7YBbyvF0aYUyq/m/y73f8Tt4DBU57Z+7JRBYbAmY3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="315615779"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="315615779"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 17:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="639953284"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 24 Feb 2022 17:52:32 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3] drm/i915/guc: Do not complain about stale reset
 notifications
Date: Thu, 24 Feb 2022 17:52:32 -0800
Message-Id: <20220225015232.1939497-1-John.C.Harrison@Intel.com>
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

It is possible for reset notifications to arrive for a context that is
in the process of being banned. So don't flag these as an error, just
report it as informational (because it is still useful to know that
resets are happening even if they are being ignored).

v2: Better wording for the message (review feedback from Tvrtko).
v3: Fix rebase issue (review feedback from Daniele).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b3a429a92c0d..d39d74d39794 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4022,10 +4022,9 @@ static void guc_handle_context_reset(struct intel_guc *guc,
 		capture_error_state(guc, ce);
 		guc_context_replay(ce);
 	} else {
-		drm_err(&guc_to_gt(guc)->i915->drm,
-			"Invalid GuC engine reset notificaion for 0x%04X on %s: banned = %d, blocked = %d",
-			ce->guc_id.id, ce->engine->name, intel_context_is_banned(ce),
-			context_blocked(ce));
+		drm_info(&guc_to_gt(guc)->i915->drm,
+			 "Ignoring context reset notification of banned context 0x%04X on %s",
+			 ce->guc_id.id, ce->engine->name);
 	}
 }
 
-- 
2.25.1

