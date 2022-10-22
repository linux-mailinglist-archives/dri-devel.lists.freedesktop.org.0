Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C916082B6
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDF6310E352;
	Sat, 22 Oct 2022 00:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350710E27E;
 Sat, 22 Oct 2022 00:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397266; x=1697933266;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YjuJLhxL8cuvonMczKTH0HAEl2nd1P8lUB/x1PW9IBM=;
 b=LqKvjHWqkwrWmudQ5cGvJauwkzaVHH+yVY9o6mFBZpsbiVZWhNl1PLWi
 Gjn5iZtmV1e+0veM7ES3FB7wk6yaWt49fYDf/Sxz/BnS+JwNfgOH5z4ca
 QBxKKRv7tVwZzVPgA6jcM/vCzG976aFunRHHn4CbjXPCyS1pw1ILW4vi2
 QB1b0V8yZWV9em3p+KV2JCoNpafLNvfF8N/mOz9T4DDXPF4DCbXD/iW7j
 2iVGtFDu6j8YnROlCsDJRVidlVgFwrTL46fBDieAuuzLofE+DTKbAYv2c
 9h9xIsNVBfMS4m75BgRKM2o6DIorrfskEj9Wm6pAH0yCk3g9zySJllNae Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354917"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354917"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:46 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917186"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917186"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:46 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm/i915/huc: only load HuC on GTs that have VCS
 engines
Date: Fri, 21 Oct 2022 17:10:02 -0700
Message-Id: <20221022001008.2340224-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL the primary GT doesn't have any media capabilities, so no video
engines and no HuC. We must therefore skip the HuC fetch and load on
that specific case. Given that other multi-GT platforms might have HuC
on the primary GT, we can't just check for that and it is easier to
instead check for the lack of VCS engines.

Based on code from Aravind Iddamsetty

v2: clarify which engine_mask is used for each GT and why (Tvrtko)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 29 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h        |  9 +++++---
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index fbc8bae14f76..be855811d85d 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -211,12 +211,41 @@ void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *b
 	huc->delayed_load.nb.notifier_call = NULL;
 }
 
+static bool vcs_supported(struct intel_gt *gt)
+{
+	intel_engine_mask_t mask = gt->info.engine_mask;
+
+	/*
+	 * We reach here from i915_driver_early_probe for the primary GT before
+	 * its engine mask is set, so we use the device info engine mask for it;
+	 * this means we're not taking VCS fusing into account, but if the
+	 * primary GT supports VCS engines we expect at least one of them to
+	 * remain unfused so we're fine.
+	 * For other GTs we expect the GT-specific mask to be set before we
+	 * call this function.
+	 */
+	GEM_BUG_ON(!gt_is_root(gt) && !gt->info.engine_mask);
+
+	if (gt_is_root(gt))
+		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
+	else
+		mask = gt->info.engine_mask;
+
+	return __ENGINE_INSTANCES_MASK(mask, VCS0, I915_MAX_VCS);
+}
+
 void intel_huc_init_early(struct intel_huc *huc)
 {
 	struct drm_i915_private *i915 = huc_to_gt(huc)->i915;
+	struct intel_gt *gt = huc_to_gt(huc);
 
 	intel_uc_fw_init_early(&huc->fw, INTEL_UC_FW_TYPE_HUC);
 
+	if (!vcs_supported(gt)) {
+		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_NOT_SUPPORTED);
+		return;
+	}
+
 	if (GRAPHICS_VER(i915) >= 11) {
 		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
 		huc->status.mask = HUC_LOAD_SUCCESSFUL;
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 7c64f8a17493..9453fdd4205f 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -778,12 +778,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define __HAS_ENGINE(engine_mask, id) ((engine_mask) & BIT(id))
 #define HAS_ENGINE(gt, id) __HAS_ENGINE((gt)->info.engine_mask, id)
 
-#define ENGINE_INSTANCES_MASK(gt, first, count) ({		\
+#define __ENGINE_INSTANCES_MASK(mask, first, count) ({			\
 	unsigned int first__ = (first);					\
 	unsigned int count__ = (count);					\
-	((gt)->info.engine_mask &						\
-	 GENMASK(first__ + count__ - 1, first__)) >> first__;		\
+	((mask) & GENMASK(first__ + count__ - 1, first__)) >> first__;	\
 })
+
+#define ENGINE_INSTANCES_MASK(gt, first, count) \
+	__ENGINE_INSTANCES_MASK((gt)->info.engine_mask, first, count)
+
 #define RCS_MASK(gt) \
 	ENGINE_INSTANCES_MASK(gt, RCS0, I915_MAX_RCS)
 #define BCS_MASK(gt) \
-- 
2.37.3

