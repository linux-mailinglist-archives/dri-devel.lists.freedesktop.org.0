Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BEB572A06
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 01:32:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0D0976C1;
	Tue, 12 Jul 2022 23:31:43 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3330976C2;
 Tue, 12 Jul 2022 23:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657668698; x=1689204698;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EszMBTrM3tmnOy5hUioPTWVuKtMomlV5dThX/JbF/V0=;
 b=eiHb64oULWS02c0JMr497glxwOzBAvEwZlCa8lV3wv1PNbMMRhJMcAz4
 wtRiNITDTMlXQYa11ge/1wh7qIRKjsVNoLcRqmKdEHk03VyD5M3wWt1s1
 4wyF/xJ417vEpOaRkZ5+PMldzIxgJv1R4z5EDpl2Eq95P+oTmyU6+4SIw
 YenFUYMBJLroVhz3RCdhXsj7+dOrMs7V2rD9PMN2FPIHBu5bLEoRUk0+F
 6NrwPzZt3xyquaOeaXNMb8/DjHidXYJ2oUbPlBSPcjJiGJytIVMTkeUpq
 7s0Cs86vCbjv29IfHexGOBWgxZCTW7gMSva14TcZpzOH6RQo02SUvr1Qm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="285812569"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="285812569"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 16:31:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="722137783"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga004.jf.intel.com with ESMTP; 12 Jul 2022 16:31:36 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 09/12] drm/i915/selftest: Cope with not having an RCS engine
Date: Tue, 12 Jul 2022 16:31:33 -0700
Message-Id: <20220712233136.1044951-10-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
References: <20220712233136.1044951-1-John.C.Harrison@Intel.com>
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

It is no longer guaranteed that there will always be an RCS engine.
So, use the helper function for finding the first available engine that
can be used for general purpose selftets.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
index 6493265d5f642..7f3bb1d34dfbf 100644
--- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
+++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
@@ -1302,13 +1302,15 @@ static int igt_reset_wait(void *arg)
 {
 	struct intel_gt *gt = arg;
 	struct i915_gpu_error *global = &gt->i915->gpu_error;
-	struct intel_engine_cs *engine = gt->engine[RCS0];
+	struct intel_engine_cs *engine;
 	struct i915_request *rq;
 	unsigned int reset_count;
 	struct hang h;
 	long timeout;
 	int err;
 
+	engine = intel_selftest_find_any_engine(gt);
+
 	if (!engine || !intel_engine_can_store_dword(engine))
 		return 0;
 
@@ -1432,7 +1434,7 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 				 int (*fn)(void *),
 				 unsigned int flags)
 {
-	struct intel_engine_cs *engine = gt->engine[RCS0];
+	struct intel_engine_cs *engine;
 	struct drm_i915_gem_object *obj;
 	struct task_struct *tsk = NULL;
 	struct i915_request *rq;
@@ -1444,6 +1446,8 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
 	if (!gt->ggtt->num_fences && flags & EXEC_OBJECT_NEEDS_FENCE)
 		return 0;
 
+	engine = intel_selftest_find_any_engine(gt);
+
 	if (!engine || !intel_engine_can_store_dword(engine))
 		return 0;
 
@@ -1819,12 +1823,14 @@ static int igt_handle_error(void *arg)
 {
 	struct intel_gt *gt = arg;
 	struct i915_gpu_error *global = &gt->i915->gpu_error;
-	struct intel_engine_cs *engine = gt->engine[RCS0];
+	struct intel_engine_cs *engine;
 	struct hang h;
 	struct i915_request *rq;
 	struct i915_gpu_coredump *error;
 	int err;
 
+	engine = intel_selftest_find_any_engine(gt);
+
 	/* Check that we can issue a global GPU and engine reset */
 
 	if (!intel_has_reset_engine(gt))
-- 
2.36.0

