Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD838907ED8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 00:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A6210EBDC;
	Thu, 13 Jun 2024 22:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gvr/FziJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E1010EBDC;
 Thu, 13 Jun 2024 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718317633; x=1749853633;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7QDd6cePhK8QHB5XjMVL3VXLSQFYxqKwR/SMxkipkhk=;
 b=gvr/FziJGsMppHXvZ7EIAZuIxxjr/Q/C0jw2PJZM0iNUn3E+8k3ihURL
 Q2LTS4ZmDS3+KsZ1zwKfqT84KbFfTzXPkOMmf/nkPdaYGKqutfE3XFZvn
 5sGRQGppt62BDc+8Yih3ps0+LYMl4dSEoxfQ/n6NZ8nKxj4N0mSD6cZlt
 LJmJ+c5mXDrRw/jQ/xdIxmjej3n5YeFpaZ+d2eIWhcJkDMoIT4HHz0mh1
 6ShINXsYtktkiLkfyXgExxWdG+oJt/Smxm0DDyzASTs0vzAViuGCwmF3f
 3+UU2h5rP0MRxGN6mi91latcbgNRBhyPxe3bhDn/fNUdRXURqr7XqTxpB A==;
X-CSE-ConnectionGUID: T1VIy+3iTpKdgsfgsW1DGw==
X-CSE-MsgGUID: WW9HO6I0Ssy3O6Dsova5Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25855172"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="25855172"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:24:19 -0700
X-CSE-ConnectionGUID: Bd3wn/CvSNqWtRRM4iePqg==
X-CSE-MsgGUID: B+dQYD1XR0+4DFWauxRZWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; d="scan'208";a="40963074"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.176])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 15:24:16 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH] drm/i915/gt/uc: Evaluate GuC priority within locks
Date: Fri, 14 Jun 2024 00:24:01 +0200
Message-ID: <20240613222402.551625-1-andi.shyti@linux.intel.com>
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

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Changelog
=========
 - Removed the stable tags as this path is not normally under
   multi task stress.
 - Refactored the if statements in order to remove unnecessary
   checks (thanks, Daniele)
 - Added Matt's r-b.


 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 27 +++++++++++--------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0eaa1064242c..9400d0eb682b 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4267,20 +4267,25 @@ static void guc_bump_inflight_request_prio(struct i915_request *rq,
 	u8 new_guc_prio = map_i915_prio_to_guc_prio(prio);
 
 	/* Short circuit function */
-	if (prio < I915_PRIORITY_NORMAL ||
-	    rq->guc_prio == GUC_PRIO_FINI ||
-	    (rq->guc_prio != GUC_PRIO_INIT &&
-	     !new_guc_prio_higher(rq->guc_prio, new_guc_prio)))
+	if (prio < I915_PRIORITY_NORMAL)
 		return;
 
 	spin_lock(&ce->guc_state.lock);
-	if (rq->guc_prio != GUC_PRIO_FINI) {
-		if (rq->guc_prio != GUC_PRIO_INIT)
-			sub_context_inflight_prio(ce, rq->guc_prio);
-		rq->guc_prio = new_guc_prio;
-		add_context_inflight_prio(ce, rq->guc_prio);
-		update_context_prio(ce);
-	}
+
+	if (rq->guc_prio == GUC_PRIO_FINI)
+		goto exit;
+
+	if (!new_guc_prio_higher(rq->guc_prio, new_guc_prio))
+		goto exit;
+
+	if (rq->guc_prio != GUC_PRIO_INIT)
+		sub_context_inflight_prio(ce, rq->guc_prio);
+
+	rq->guc_prio = new_guc_prio;
+	add_context_inflight_prio(ce, rq->guc_prio);
+	update_context_prio(ce);
+
+exit:
 	spin_unlock(&ce->guc_state.lock);
 }
 
-- 
2.45.1

