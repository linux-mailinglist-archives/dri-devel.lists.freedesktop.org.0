Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1CA8FDB4F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:17:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B48A10E37C;
	Thu,  6 Jun 2024 00:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PnNJVOxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5112110E37C;
 Thu,  6 Jun 2024 00:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717633052; x=1749169052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xjtfn4sZ7WNbokQyGS4/ipg3CJbH0IuDDvhdnQIPnnU=;
 b=PnNJVOxXVy+N3+3tBl/uOS6pa2m/AuX3haM1z+UGEfi4SVgiUOUawvww
 zdHbDdVFT1+4B6rMXU64B/j59okOky+Z5hdxeOP84emaB2OhA+AFwSx4+
 kV0bNQJehYyZYk0Eulh/Gw0L9eOuVPZngL/ue9e3FUHjxa4T9YyE97NI+
 hHOKuOC1eRFdWq8go7IX03dy+PmEEDTeGCXb/O9TJENi4diwvujFwFrvg
 bmIfAUjV2Gsu1S9FpuQ1M9+TgMWhm6oQ95RCNA8EsXaCpvG+ADrFlBazO
 MBh+FDzyUHAz1Tu0Joln0Y0JydyxSNWE9oDgmeful41hs9PkG0EWVjcsE Q==;
X-CSE-ConnectionGUID: B8C6viv7RNefD1KK07OP+g==
X-CSE-MsgGUID: D4oP1/LhTUaW+7+Vwwcs8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18123143"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="18123143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:17:31 -0700
X-CSE-ConnectionGUID: JtXPUDZ5QTmqeHNDPPRxsw==
X-CSE-MsgGUID: jVBrJdgaRKmE3baR04REgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="42730147"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.215])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 17:17:29 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, stable@vger.kernel.org
Subject: [PATCH] drm/i915/gt/uc: Evaluate GuC priority within locks
Date: Thu,  6 Jun 2024 02:17:02 +0200
Message-ID: <20240606001702.59005-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

The ce->guc_state.lock was made to protect guc_prio, which
indicates the GuC priority level.

But at the begnning of the function we perform some sanity check
of guc_prio outside its protected section. Move them within the
locked region.

Use this occasion to expand the if statement to make it clearer.

Fixes: ee242ca704d3 ("drm/i915/guc: Implement GuC priority management")
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: <stable@vger.kernel.org> # v5.15+
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0eaa1064242c..1181043bc5e9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4267,13 +4267,18 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
 
 	/* Short circuit function */
-	if (prio < I915_PRIORITY_NORMAL ||
-	    rq->guc_prio == GUC_PRIO_FINI ||
-	    (rq->guc_prio != GUC_PRIO_INIT &&
-	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
+	if (prio < I915_PRIORITY_NORMAL)
 		return;
 
 	spin_lock(&ce->guc_state.lock);
+
+	if (rq->guc_prio == GUC_PRIO_FINI)
+		goto exit;
+
+	if (rq->guc_prio != GUC_PRIO_INIT &&
+	    !new_guc_prio_higher(rq->guc_prio, new_guc_prio))
+		goto exit;
+
 	if (rq->guc_prio != GUC_PRIO_FINI) {
 		if (rq->guc_prio != GUC_PRIO_INIT)
 			sub_context_inflight_prio(ce, rq->guc_prio);
@@ -4281,6 +4286,8 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 		add_context_inflight_prio(ce, rq->guc_prio);
 		update_context_prio(ce);
 	}
+
+exit:
 	spin_unlock(&ce->guc_state.lock);
 }
 
-- 
2.45.1

