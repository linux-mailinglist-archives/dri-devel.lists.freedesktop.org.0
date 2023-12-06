Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9288079C9
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 21:48:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 476DF10E696;
	Wed,  6 Dec 2023 20:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF3D210E5E8;
 Wed,  6 Dec 2023 20:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701895720; x=1733431720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NaOVKNAlhkEKJwfoGkHQgfDRfBIgXa82mIB8nWlu7A0=;
 b=SNw+MzbXU2we7SmRe+CEYVPM0GlykXq2429xG3cUO/QP3NXUpQSdzuNr
 fOKJRxS0j4HIXELmSfcXiCjDTm9MLbWRnEHf2djRfBcaRWftSt+7KaZ46
 P5wj0p4j9pTQfexTJpohsTgFxJHc+GhE1M0XvlK8FuWsGMr/lyTiSiJBs
 HQ6fjPsZQV5j2c8E6IycUqk6n5Owm+wkhU2HPOs9q1ocqMOH1NZJEQpsH
 BQPCMvfirCV9QYY5Fq5Gn+yAIKJ34E6kCTEB0CFJxlNKvW6BXAiA5zmcs
 ZyJGuhxrPc6JC27aY6Xzfy0j5/z2U7gxnbSBiXOtf9QlfN1e+Hi5n3Cs/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396914569"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="396914569"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775139872"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="775139872"
Received: from karthik-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.178])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2023 12:47:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 3/4] drm/i915: Use the new gt_to_guc() wrapper
Date: Wed,  6 Dec 2023 21:46:43 +0100
Message-ID: <20231206204644.105064-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206204644.105064-1-andi.shyti@linux.intel.com>
References: <20231206204644.105064-1-andi.shyti@linux.intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the gt using the gt_to_guc() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_debugfs_params.c               | 2 +-
 drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_debugfs_params.c b/drivers/gpu/drm/i915/i915_debugfs_params.c
index 8bca02025e09..74b7f2fd8b57 100644
--- a/drivers/gpu/drm/i915/i915_debugfs_params.c
+++ b/drivers/gpu/drm/i915/i915_debugfs_params.c
@@ -43,7 +43,7 @@ static int notify_guc(struct drm_i915_private *i915)
 
 	for_each_gt(gt, i915, i) {
 		if (intel_uc_uses_guc_submission(&gt->uc))
-			ret = intel_guc_global_policies_update(&gt->uc.guc);
+			ret = intel_guc_global_policies_update(gt_to_guc(gt));
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
index 2990dd4d4a0d..d9d8f0336702 100644
--- a/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
+++ b/drivers/gpu/drm/i915/selftests/intel_scheduler_helpers.c
@@ -65,7 +65,7 @@ int intel_selftest_modify_policy(struct intel_engine_cs *engine,
 	if (!intel_engine_uses_guc(engine))
 		return 0;
 
-	err = intel_guc_global_policies_update(&engine->gt->uc.guc);
+	err = intel_guc_global_policies_update(gt_to_guc(engine->gt));
 	if (err)
 		intel_selftest_restore_policy(engine, saved);
 
@@ -84,7 +84,7 @@ int intel_selftest_restore_policy(struct intel_engine_cs *engine,
 	if (!intel_engine_uses_guc(engine))
 		return 0;
 
-	return intel_guc_global_policies_update(&engine->gt->uc.guc);
+	return intel_guc_global_policies_update(gt_to_guc(engine->gt));
 }
 
 int intel_selftest_wait_for_rq(struct i915_request *rq)
-- 
2.43.0

