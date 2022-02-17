Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9180C4BAD77
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722D710E17D;
	Thu, 17 Feb 2022 23:52:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7C710E83D;
 Thu, 17 Feb 2022 23:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645141929; x=1676677929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mYnLfD3C+DpXlEv6s34laC5kejqNxhVVAtl/DeShwHE=;
 b=Fq941dnsiqgmh+CEkrt7IVVX6C2LjcXJFqsGXE8JhgYVwKwyvxqCOx9E
 74Vq9GxYJ8XVAEXRDOOx/MNOxuWUs7dJVfzT1x8wyyvp8atK0zgxebWYM
 lTqmqhjR6NdDngz8dIBSPOoRDRsZGLD7tkeMd7bh04/JG1X1QyCsxavLh
 YN3yclULJiVExZjK/DZBV8DGqsNRumQK+0QMJsKNFM6lXJ5C8f9NS0tJD
 3GBm+WNI0Jn42n6/b3Fe49X9OCIKnuN8z7sibgBjtc9PTve+ECOw0WBuO
 zCjO0w4ZUW0I1ndG6Qt65O/6XjgZM7Ub0jYe3BbC5vmyYqQK1c34PgCO9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="311748996"
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="311748996"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 15:52:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,377,1635231600"; d="scan'208";a="545964441"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga008.jf.intel.com with ESMTP; 17 Feb 2022 15:52:08 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/8] drm/i915/guc: Move lrc desc setup to where it is needed
Date: Thu, 17 Feb 2022 15:52:04 -0800
Message-Id: <20220217235207.930153-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217235207.930153-1-John.C.Harrison@Intel.com>
References: <20220217235207.930153-1-John.C.Harrison@Intel.com>
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

The LRC descriptor was being initialised early on in the context
registration sequence. It could then be determined that the actual
registration needs to be delayed and the descriptor would be wiped
out. This is inefficient, so move the setup to later in the process
after the point of no return.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 0ab2d1a24bf6..aa74ec74194a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -2153,6 +2153,8 @@ static int __guc_action_register_context(struct intel_guc *guc,
 					     0, loop);
 }
 
+static void prepare_context_registration_info(struct intel_context *ce);
+
 static int register_context(struct intel_context *ce, bool loop)
 {
 	struct intel_guc *guc = ce_to_guc(ce);
@@ -2163,6 +2165,8 @@ static int register_context(struct intel_context *ce, bool loop)
 	GEM_BUG_ON(intel_context_is_child(ce));
 	trace_intel_context_register(ce);
 
+	prepare_context_registration_info(ce);
+
 	if (intel_context_is_parent(ce))
 		ret = __guc_action_register_multi_lrc(guc, ce, ce->guc_id.id,
 						      offset, loop);
@@ -2246,7 +2250,6 @@ static void prepare_context_registration_info(struct intel_context *ce)
 	struct intel_context *child;
 
 	GEM_BUG_ON(!engine->mask);
-	GEM_BUG_ON(!sched_state_is_init(ce));
 
 	/*
 	 * Ensure LRC + CT vmas are is same region as write barrier is done
@@ -2314,9 +2317,13 @@ static int try_context_registration(struct intel_context *ce, bool loop)
 	bool context_registered;
 	int ret = 0;
 
+	GEM_BUG_ON(!sched_state_is_init(ce));
+
 	context_registered = ctx_id_mapped(guc, desc_idx);
 
-	prepare_context_registration_info(ce);
+	if (context_registered)
+		clr_ctx_id_mapping(guc, desc_idx);
+	set_ctx_id_mapping(guc, desc_idx, ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
-- 
2.25.1

