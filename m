Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B2381FEE7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 11:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFCF10E298;
	Fri, 29 Dec 2023 10:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C281410E298;
 Fri, 29 Dec 2023 10:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703845836; x=1735381836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2EEXpt9cJNWwEb8ul6Ytk09eSzHRilJiMj4pz9x06Q=;
 b=ECEMeM5VcoL8FjCr3mEuYh5prhjFx0Zvu/MInajDkuHRjyhptx81BHAn
 0o8A6q9jEx8IVJy7TNgkbc5RdJFlBsn6LIVSlemCP95e70ljqpURZ6USv
 ND3bv6w5uBAdeDCWlm3HuWr2+auviJUPNqqlfQAcqSpHwob5TxmVLCMhG
 w+Z89+8y80RHwJQy5vU4ca97TzLV7SP0pVENQMWpTv3bVzp0gLE0/MHEM
 D8Am5MWNV9NV0AluaObhdP0zmBI95t7fEj5QVrs9oJD0+KXiIMsPknwea
 /mvhL/+JauR9iUqsNQoiNvp9Bf5Q+cJkAzAN/MdaeH70V0nQVvItOGpjK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="396364620"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="396364620"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10937"; a="771939379"
X-IronPort-AV: E=Sophos;i="6.04,314,1695711600"; d="scan'208";a="771939379"
Received: from jquigley-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.51.13])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2023 02:30:01 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 3/4] drm/i915: Use the new gt_to_guc() wrapper
Date: Fri, 29 Dec 2023 11:27:33 +0100
Message-ID: <20231229102734.674362-4-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231229102734.674362-1-andi.shyti@linux.intel.com>
References: <20231229102734.674362-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the guc reference from the gt using the gt_to_guc() helper.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
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

