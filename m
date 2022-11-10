Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E86248C3
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 18:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD3610E773;
	Thu, 10 Nov 2022 17:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC17410E76F;
 Thu, 10 Nov 2022 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668102933; x=1699638933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nVpAkIDi1AZjZf4hWWAeqpz/m/6bM3s74RsXyVu1IwM=;
 b=Yn1LFb3E8DRGGfTI3QLFqjEXciKTWRt+VrTW+0t73YWXM7G8GkhifD9f
 c8N7AhAPE7Z3zuX8HlZqPCpxuqYtRwn5X7NSvaVyrH64ylonf/ZcO4+U4
 hQsSdIWgK2s8gKzEX8M6IsFf9tKrVIe/gH4/Vj/b+Qm+YSXNSds4m51st
 eeW9bSBiR6FT0YOQoK1PWQL7za6EHC5j9HGkVe92TR0mOXp04cmEYM2i7
 54yYe+fbNJuVvLYgenPlejTmBMSYCZei1tAdYkYFcdjEYCNQK9bBjfXsR
 RkSnyxBXQJcDi7GPh4MtlZp/lvOlyYZi7JswKVYpaLcI28HskdCnwNIF/ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397682158"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="397682158"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 09:55:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="700897009"
X-IronPort-AV: E=Sophos;i="5.96,154,1665471600"; d="scan'208";a="700897009"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 09:55:15 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: enable GuC GGTT invalidation from the start
Date: Thu, 10 Nov 2022 09:58:23 -0800
Message-Id: <20221110175823.3867135-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invalidating the GuC TLBs while GuC is not loaded does not have negative
consequences, so if we're starting the driver with GuC enabled we can
use the GGTT invalidation function from the get-go, iinstead of switching
to it when we initialize the GuC objects.

In MTL, this fixes and issue where we try to overwrite the invalidation
function twice (once for each GuC), due to the GGTT being shared between
the primary and media GTs

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c   | 28 ++++----------------------
 drivers/gpu/drm/i915/gt/intel_gtt.h    |  2 --
 drivers/gpu/drm/i915/gt/uc/intel_guc.c |  7 -------
 3 files changed, 4 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 2518cebbf931..2dbe6ad5c900 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -979,7 +979,10 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 			I915_VMA_GLOBAL_BIND | I915_VMA_LOCAL_BIND;
 	}
 
-	ggtt->invalidate = gen8_ggtt_invalidate;
+	if (intel_uc_wants_guc(&ggtt->vm.gt->uc))
+		ggtt->invalidate = guc_ggtt_invalidate;
+	else
+		ggtt->invalidate = gen8_ggtt_invalidate;
 
 	ggtt->vm.vma_ops.bind_vma    = intel_ggtt_bind_vma;
 	ggtt->vm.vma_ops.unbind_vma  = intel_ggtt_unbind_vma;
@@ -1216,29 +1219,6 @@ int i915_ggtt_enable_hw(struct drm_i915_private *i915)
 	return 0;
 }
 
-void i915_ggtt_enable_guc(struct i915_ggtt *ggtt)
-{
-	GEM_BUG_ON(ggtt->invalidate != gen8_ggtt_invalidate);
-
-	ggtt->invalidate = guc_ggtt_invalidate;
-
-	ggtt->invalidate(ggtt);
-}
-
-void i915_ggtt_disable_guc(struct i915_ggtt *ggtt)
-{
-	/* XXX Temporary pardon for error unload */
-	if (ggtt->invalidate == gen8_ggtt_invalidate)
-		return;
-
-	/* We should only be called after i915_ggtt_enable_guc() */
-	GEM_BUG_ON(ggtt->invalidate != guc_ggtt_invalidate);
-
-	ggtt->invalidate = gen8_ggtt_invalidate;
-
-	ggtt->invalidate(ggtt);
-}
-
 /**
  * i915_ggtt_resume_vm - Restore the memory mappings for a GGTT or DPT VM
  * @vm: The VM to restore the mappings for
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 4d75ba4bb41d..fcbbfed79f15 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -579,8 +579,6 @@ void intel_ggtt_unbind_vma(struct i915_address_space *vm,
 int i915_ggtt_probe_hw(struct drm_i915_private *i915);
 int i915_ggtt_init_hw(struct drm_i915_private *i915);
 int i915_ggtt_enable_hw(struct drm_i915_private *i915);
-void i915_ggtt_enable_guc(struct i915_ggtt *ggtt);
-void i915_ggtt_disable_guc(struct i915_ggtt *ggtt);
 int i915_init_ggtt(struct drm_i915_private *i915);
 void i915_ggtt_driver_release(struct drm_i915_private *i915);
 void i915_ggtt_driver_late_release(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 1bcd61bb50f8..4ec954b6b4e8 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -421,9 +421,6 @@ int intel_guc_init(struct intel_guc *guc)
 	/* now that everything is perma-pinned, initialize the parameters */
 	guc_init_params(guc);
 
-	/* We need to notify the guc whenever we change the GGTT */
-	i915_ggtt_enable_guc(gt->ggtt);
-
 	intel_uc_fw_change_status(&guc->fw, INTEL_UC_FIRMWARE_LOADABLE);
 
 	return 0;
@@ -448,13 +445,9 @@ int intel_guc_init(struct intel_guc *guc)
 
 void intel_guc_fini(struct intel_guc *guc)
 {
-	struct intel_gt *gt = guc_to_gt(guc);
-
 	if (!intel_uc_fw_is_loadable(&guc->fw))
 		return;
 
-	i915_ggtt_disable_guc(gt->ggtt);
-
 	if (intel_guc_slpc_is_used(guc))
 		intel_guc_slpc_fini(&guc->slpc);
 
-- 
2.37.3

