Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB709572AB7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 03:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291F095160;
	Wed, 13 Jul 2022 01:19:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0131012A9F9;
 Wed, 13 Jul 2022 01:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657675174; x=1689211174;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T7pf7y94+3H5UQWPlEOZVzL4or85c0uyvauwKSD2CZg=;
 b=PayLxQDPCH/jCnn51bnD8JVLd2vY7MBPOzVJr5KtqF6aL1cDteIfOn+r
 dvcerfVvGs8WD9d2+BX4igJuJnbERCnvjGXNBxNqzDGy/CoAeU7M9PhiG
 EnBjlpqu/snBdGj9tgKwz9fEilb1LVtG5Yv0k8krALvxH2igkcT4NsFIE
 GNgaR/qajU9C4WIKSAcoDP2eWOMl3xiZKS4yRCgBnBkTtNvjRf+H6eYWm
 X6bjW6ZOp/203OGcYsxDB8SYgz2Diyez6GbmXgB+cZmHVrmSJsn7uCB+s
 vcCnwz1Z4fThOXrBmYk3VjqUjVKEW3Zw+0H+7SMlP6p6DHp5hx1RB+Z3V A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="268117392"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="268117392"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 18:19:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="570412462"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga006.jf.intel.com with ESMTP; 12 Jul 2022 18:19:33 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH] drm/i915/guc: Don't use pr_err when not necessary
Date: Tue, 12 Jul 2022 18:19:33 -0700
Message-Id: <20220713011933.1243676-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.36.0
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

A bunch of code was copy/pasted using pr_err as the default way to
report errors. However, drm_err is significantly more useful in
identifying where the error came from. So update the code to use that
instead.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 37 +++++++++----------
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   | 10 ++---
 3 files changed, 28 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index 27363091e1afa..19fde6bda8f9c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -195,11 +195,11 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 			    fw_blobs[i].rev < fw_blobs[i - 1].rev)
 				continue;
 
-			pr_err("invalid FW blob order: %s r%u comes before %s r%u\n",
-			       intel_platform_name(fw_blobs[i - 1].p),
-			       fw_blobs[i - 1].rev,
-			       intel_platform_name(fw_blobs[i].p),
-			       fw_blobs[i].rev);
+			drm_err(&i915->drm, "Invalid FW blob order: %s r%u comes before %s r%u\n",
+				intel_platform_name(fw_blobs[i - 1].p),
+				fw_blobs[i - 1].rev,
+				intel_platform_name(fw_blobs[i].p),
+				fw_blobs[i].rev);
 
 			uc_fw->path = NULL;
 		}
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
index 1df71d0796aec..20e0c39259fba 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc.c
@@ -62,7 +62,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
 			ret = PTR_ERR(ce);
-			pr_err("Failed to create context, %d: %d\n", i, ret);
+			drm_err(&gt->i915->drm, "Failed to create context, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -83,7 +83,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 
 		if (IS_ERR(rq)) {
 			ret = PTR_ERR(rq);
-			pr_err("Failed to create request, %d: %d\n", i, ret);
+			drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n", i, ret);
 			goto err;
 		}
 
@@ -93,7 +93,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	for (i = 0; i < 3; ++i) {
 		ret = i915_request_wait(last[i], 0, HZ);
 		if (ret < 0) {
-			pr_err("Last request failed to complete: %d\n", ret);
+			drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
 			goto err;
 		}
 		i915_request_put(last[i]);
@@ -110,7 +110,7 @@ static int intel_guc_scrub_ctbs(void *arg)
 	/* GT will not idle if G2H are lost */
 	ret = intel_gt_wait_for_idle(gt, HZ);
 	if (ret < 0) {
-		pr_err("GT failed to idle: %d\n", ret);
+		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
 		goto err;
 	}
 
@@ -150,7 +150,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 
 	ce = kcalloc(GUC_MAX_CONTEXT_ID, sizeof(*ce), GFP_KERNEL);
 	if (!ce) {
-		pr_err("Context array allocation failed\n");
+		drm_err(&gt->i915->drm, "Context array allocation failed\n");
 		return -ENOMEM;
 	}
 
@@ -164,24 +164,24 @@ static int intel_guc_steal_guc_ids(void *arg)
 	if (IS_ERR(ce[context_index])) {
 		ret = PTR_ERR(ce[context_index]);
 		ce[context_index] = NULL;
-		pr_err("Failed to create context: %d\n", ret);
+		drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
 		goto err_wakeref;
 	}
 	ret = igt_spinner_init(&spin, engine->gt);
 	if (ret) {
-		pr_err("Failed to create spinner: %d\n", ret);
+		drm_err(&gt->i915->drm, "Failed to create spinner: %d\n", ret);
 		goto err_contexts;
 	}
 	spin_rq = igt_spinner_create_request(&spin, ce[context_index],
 					     MI_ARB_CHECK);
 	if (IS_ERR(spin_rq)) {
 		ret = PTR_ERR(spin_rq);
-		pr_err("Failed to create spinner request: %d\n", ret);
+		drm_err(&gt->i915->drm, "Failed to create spinner request: %d\n", ret);
 		goto err_contexts;
 	}
 	ret = request_add_spin(spin_rq, &spin);
 	if (ret) {
-		pr_err("Failed to add Spinner request: %d\n", ret);
+		drm_err(&gt->i915->drm, "Failed to add Spinner request: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -191,7 +191,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 		if (IS_ERR(ce[context_index])) {
 			ret = PTR_ERR(ce[context_index--]);
 			ce[context_index] = NULL;
-			pr_err("Failed to create context: %d\n", ret);
+			drm_err(&gt->i915->drm, "Failed to create context: %d\n", ret);
 			goto err_spin_rq;
 		}
 
@@ -200,8 +200,8 @@ static int intel_guc_steal_guc_ids(void *arg)
 			ret = PTR_ERR(rq);
 			rq = NULL;
 			if (ret != -EAGAIN) {
-				pr_err("Failed to create request, %d: %d\n",
-				       context_index, ret);
+				drm_err(&gt->i915->drm, "Failed to create request, %d: %d\n",
+					context_index, ret);
 				goto err_spin_rq;
 			}
 		} else {
@@ -215,7 +215,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	igt_spinner_end(&spin);
 	ret = intel_selftest_wait_for_rq(spin_rq);
 	if (ret) {
-		pr_err("Spin request failed to complete: %d\n", ret);
+		drm_err(&gt->i915->drm, "Spin request failed to complete: %d\n", ret);
 		i915_request_put(last);
 		goto err_spin_rq;
 	}
@@ -227,7 +227,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(last, 0, HZ * 30);
 	i915_request_put(last);
 	if (ret < 0) {
-		pr_err("Last request failed to complete: %d\n", ret);
+		drm_err(&gt->i915->drm, "Last request failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
@@ -235,7 +235,7 @@ static int intel_guc_steal_guc_ids(void *arg)
 	rq = nop_user_request(ce[context_index], NULL);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		pr_err("Failed to steal guc_id, %d: %d\n", context_index, ret);
+		drm_err(&gt->i915->drm, "Failed to steal guc_id, %d: %d\n", context_index, ret);
 		goto err_spin_rq;
 	}
 
@@ -243,21 +243,20 @@ static int intel_guc_steal_guc_ids(void *arg)
 	ret = i915_request_wait(rq, 0, HZ);
 	i915_request_put(rq);
 	if (ret < 0) {
-		pr_err("Request with stolen guc_id failed to complete: %d\n",
-		       ret);
+		drm_err(&gt->i915->drm, "Request with stolen guc_id failed to complete: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Wait for idle */
 	ret = intel_gt_wait_for_idle(gt, HZ * 30);
 	if (ret < 0) {
-		pr_err("GT failed to idle: %d\n", ret);
+		drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
 		goto err_spin_rq;
 	}
 
 	/* Verify a guc_id was stolen */
 	if (guc->number_guc_id_stolen == number_guc_id_stolen) {
-		pr_err("No guc_id was stolen");
+		drm_err(&gt->i915->drm, "No guc_id was stolen");
 		ret = -EINVAL;
 	} else {
 		ret = 0;
diff --git a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
index 812220a43df81..d17982c36d256 100644
--- a/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
+++ b/drivers/gpu/drm/i915/gt/uc/selftest_guc_multi_lrc.c
@@ -115,30 +115,30 @@ static int __intel_guc_multi_lrc_basic(struct intel_gt *gt, unsigned int class)
 
 	parent = multi_lrc_create_parent(gt, class, 0);
 	if (IS_ERR(parent)) {
-		pr_err("Failed creating contexts: %ld", PTR_ERR(parent));
+		drm_err(&gt->i915->drm, "Failed creating contexts: %ld", PTR_ERR(parent));
 		return PTR_ERR(parent);
 	} else if (!parent) {
-		pr_debug("Not enough engines in class: %d", class);
+		drm_dbg(&gt->i915->drm, "Not enough engines in class: %d", class);
 		return 0;
 	}
 
 	rq = multi_lrc_nop_request(parent);
 	if (IS_ERR(rq)) {
 		ret = PTR_ERR(rq);
-		pr_err("Failed creating requests: %d", ret);
+		drm_err(&gt->i915->drm, "Failed creating requests: %d", ret);
 		goto out;
 	}
 
 	ret = intel_selftest_wait_for_rq(rq);
 	if (ret)
-		pr_err("Failed waiting on request: %d", ret);
+		drm_err(&gt->i915->drm, "Failed waiting on request: %d", ret);
 
 	i915_request_put(rq);
 
 	if (ret >= 0) {
 		ret = intel_gt_wait_for_idle(gt, HZ * 5);
 		if (ret < 0)
-			pr_err("GT failed to idle: %d\n", ret);
+			drm_err(&gt->i915->drm, "GT failed to idle: %d\n", ret);
 	}
 
 out:
-- 
2.36.0

