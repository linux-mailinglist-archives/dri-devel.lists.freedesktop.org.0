Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DC4ACED6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 03:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F1110E47C;
	Tue,  8 Feb 2022 02:21:00 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D30D610E51C;
 Tue,  8 Feb 2022 02:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644286855; x=1675822855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eAT3ptqYweN3fuDGJMq1cWQ+h4SNZQz/Sw/pnk2Rj3U=;
 b=elucdEUKys/TrLWumA1m7XcT+UVJQlxzr+8tyYHuSxD/4GxhSWw+acPU
 m3efpY4xavnzzgjpgeLUR4GxqTj7clc5V8Pckj/qi5pUYT4AnHcwto/l6
 LYxygRmCn0LsUNpdo+Nyi4r8ChyYMMCyne/3ytBTMI3R/xH/Cj00leURd
 f2JksUbVN/2ZQGKGVq/aMklgYLvDwL5Y/PF3AaxD8gKzHFG/gANQ7W5Bc
 L8VNImTEL79ikbdWFdJBsRuxAlz+bBBX4VRdoq3OBT62Q/ybwr17rhpcr
 6hs1u4c5cWdQyJRQ+sKtbSb/DUMQqTZAwBMirsPKwOBgKFaa9z9untHvs w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="335257344"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="335257344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 18:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="677960798"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 18:20:55 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/8] drm/i915/guc: Move lrc desc setup to where it is needed
Date: Mon,  7 Feb 2022 18:20:51 -0800
Message-Id: <20220208022054.2143332-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208022054.2143332-1-John.C.Harrison@Intel.com>
References: <20220208022054.2143332-1-John.C.Harrison@Intel.com>
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
index 282bc74fcbb1..aee24d6ba6b6 100644
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
 	context_registered = ctx_registered(guc, desc_idx);
 
-	prepare_context_registration_info(ce);
+	if (context_registered)
+		clr_ctx_registered(guc, desc_idx);
+	set_ctx_registered(guc, desc_idx, ce);
 
 	/*
 	 * The context_lookup xarray is used to determine if the hardware
-- 
2.25.1

