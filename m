Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5149767C20C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:54:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39A010E8D6;
	Thu, 26 Jan 2023 00:54:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AB910E129;
 Thu, 26 Jan 2023 00:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674694471; x=1706230471;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GNyw7ajAmmWsgmDUsWUB0opvick3hwfEdGdwN6hpZHA=;
 b=TjbcbvdAn7kGfUXasdmTMZOLPL64Dex+okiwtRVDrNQflL6kba6Np17R
 0NAWonLDm1fF8NBCHAt47UY9znKvps6qmG6gZWexIBc6V6Y8UWEfOUr34
 RpgFXkksoDss3j2STs06lXpY9l+qDjxB6fcYYQifZVYqloOCbDknrfzeF
 NjGfFB3b647sH985l/k/mAMXZ0ChBn0hY/LpeHNoYemmPX4wi22l4dv9c
 n9kYS2T4j91L7dZZgsqQ7V/qHcqzV+eDoQYYyRltwOUuCisxvcdO5SfZ1
 iVXqmKtdFju55zukzz1KL5IDLauwRTqV/t1fjcOH5ry06jpy8s+NooSYB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389064422"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="389064422"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 16:54:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="751404271"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="751404271"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 16:54:29 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 1/8] drm/i915/guc: Fix locking when searching for a hung
 request
Date: Wed, 25 Jan 2023 16:54:13 -0800
Message-Id: <20230126005420.160070-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126005420.160070-1-John.C.Harrison@Intel.com>
References: <20230126005420.160070-1-John.C.Harrison@Intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

intel_guc_find_hung_context() was not acquiring the correct spinlock
before searching the request list. So fix that up. While at it, add
some extra whitespace padding for readability.

Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Michael Cheng <michael.cheng@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index b436dd7f12e42..3b34a82d692be 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -4820,6 +4820,8 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 
 	xa_lock_irqsave(&guc->context_lookup, flags);
 	xa_for_each(&guc->context_lookup, index, ce) {
+		bool found;
+
 		if (!kref_get_unless_zero(&ce->ref))
 			continue;
 
@@ -4836,10 +4838,18 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 				goto next;
 		}
 
+		found = false;
+		spin_lock(&ce->guc_state.lock);
 		list_for_each_entry(rq, &ce->guc_state.requests, sched.link) {
 			if (i915_test_request_state(rq) != I915_REQUEST_ACTIVE)
 				continue;
 
+			found = true;
+			break;
+		}
+		spin_unlock(&ce->guc_state.lock);
+
+		if (found) {
 			intel_engine_set_hung_context(engine, ce);
 
 			/* Can only cope with one hang at a time... */
@@ -4847,6 +4857,7 @@ void intel_guc_find_hung_context(struct intel_engine_cs *engine)
 			xa_lock(&guc->context_lookup);
 			goto done;
 		}
+
 next:
 		intel_context_put(ce);
 		xa_lock(&guc->context_lookup);
-- 
2.39.1

