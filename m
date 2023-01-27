Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C9E67DAC1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9210E157;
	Fri, 27 Jan 2023 00:29:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE95E10E146;
 Fri, 27 Jan 2023 00:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779339; x=1706315339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvBPqBJzrPZsz1udXkh/HMQaaXs7fmZnunh55oxpb5k=;
 b=TR9HpstX3OUeCWxztdz+5aXkQIPFmj1JULTILWEqvw/Lzl+FS2sRA9l6
 +M56yeKw9SMaQXB9+L7vfqFeQCQHwtPpdui1RBnT+NpjOEOVWE4rGY1nO
 gPVk/L4bxbvpN7zFwm0CZOSTF3apS9/fek7taeMKehT/oMJAtlPYJ6u3L
 XOfJYYri23lEGYd31S9ezOEkF/XpFTuwYzVDuC7OZbfq1GZwaiX0tBWih
 lokupyvaKk2ibQ/+1a7OOjG1G6StMOzuHAYFEDg0Vw9QoF04KuHd8IhDj
 2RV/IGPrYVeK6EiFm1F5+T1U7qZTpeIwJiZy3f18JDOju0FwNSAtWi27+ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324687298"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324687298"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805621884"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805621884"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 16:28:50 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v6 1/8] drm/i915/guc: Fix locking when searching for a hung
 request
Date: Thu, 26 Jan 2023 16:28:35 -0800
Message-Id: <20230127002842.3169194-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
References: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
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
 Chris Wilson <chris.p.wilson@intel.com>,
 Michael Cheng <michael.cheng@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Bruce Chang <yu.bruce.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

intel_guc_find_hung_context() was not acquiring the correct spinlock
before searching the request list. So fix that up. While at it, add
some extra whitespace padding for readability.

Fixes: dc0dad365c5e ("drm/i915/guc: Fix for error capture after full GPU reset with GuC")
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Michael Cheng <michael.cheng@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Bruce Chang <yu.bruce.chang@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
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

