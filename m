Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC8583605
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 02:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB9710E1FB;
	Thu, 28 Jul 2022 00:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFAE510E0A7;
 Thu, 28 Jul 2022 00:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658968432; x=1690504432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Vh9Uj/lCgrtpiA/QgFT3wn94Dp5RIGIvWLiG6bMUAwU=;
 b=Gx/uEpKXXkYovSc8S+Hk3w00vSUnUgsz14bVqhMLbYPLE37m9vmm8TkG
 tMznEDUD9vzGxmev1cREarBH/GqXw/XdzZsUgI9jHegKaVeq3dpWuMCzh
 iYIkFDMZKP6ZI4xULrixmTU+/2jOCKqmomkXEYH4G2IQUSrjLgkaB9+nf
 mKcFKswy/grzSZC+D0UqqOV0F8xhWjndagOClnBJ86Y6BAYVaACKXlr0v
 TnxCmW3hvBd1r4nGIy8N3mR6cUQ28mpPNkvD4A6XwmWeQlcGI6Hsj9DG6
 lC2cPxe8rJxPEeHntpCdLe5M20OKqOCEeBmCRjLi/Y97bpI2gO8uANZ92 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="268762895"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="268762895"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 17:33:52 -0700
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; d="scan'208";a="628602173"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2022 17:33:51 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Don't send policy update for child contexts.
Date: Wed, 27 Jul 2022 17:33:39 -0700
Message-Id: <20220728003339.2361010-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GuC FW applies the parent context policy to all the children,
so individual updates to the children are not supported and we
should not send them.

Note that sending the message did not have any functional consequences,
because the GuC just drops it and logs an error; since we were trying
to set the child policy to match the parent anyway the message being
dropped was not a problem.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 26 +------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 76916aed897a..5e31e2540297 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2420,7 +2420,6 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 	struct context_policy policy;
 	u32 execution_quantum;
 	u32 preemption_timeout;
-	bool missing = false;
 	unsigned long flags;
 	int ret;
 
@@ -2438,32 +2437,9 @@ static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
 		__guc_context_policy_add_preempt_to_idle(&policy, 1);
 
 	ret = __guc_context_set_context_policies(guc, &policy, loop);
-	missing = ret != 0;
-
-	if (!missing && intel_context_is_parent(ce)) {
-		struct intel_context *child;
-
-		for_each_child(ce, child) {
-			__guc_context_policy_start_klv(&policy, child->guc_id.id);
-
-			if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
-				__guc_context_policy_add_preempt_to_idle(&policy, 1);
-
-			child->guc_state.prio = ce->guc_state.prio;
-			__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
-			__guc_context_policy_add_execution_quantum(&policy, execution_quantum);
-			__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
-
-			ret = __guc_context_set_context_policies(guc, &policy, loop);
-			if (ret) {
-				missing = true;
-				break;
-			}
-		}
-	}
 
 	spin_lock_irqsave(&ce->guc_state.lock, flags);
-	if (missing)
+	if (ret != 0)
 		set_context_policy_required(ce);
 	else
 		clr_context_policy_required(ce);
-- 
2.25.1

