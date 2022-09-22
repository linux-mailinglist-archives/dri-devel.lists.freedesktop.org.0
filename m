Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA9D5E6F73
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535D910E4E1;
	Thu, 22 Sep 2022 22:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A979C10E449;
 Thu, 22 Sep 2022 22:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884626; x=1695420626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=34GnYgHUdTDyv2CFZjXJpJFe6qo4Bcbk59uWR5DuuPg=;
 b=e8s2g7AOwG2PFgoYf1k5CnaSTqBEq6ZFdntrU2pi7AYqx3D9y9PlGMQO
 PASrSG/ASBbsVY6FgZoLkFnHFQp7Xs5Vkbuae54IsLXFU3ZDkrcKLa2MC
 eayO6BjZUUjgq19wOXLJHTVGh4TAhY+vPbQV4g8nyVEILQo/DOyEh2rTd
 S85z1O9CpcwU7giRxGVr6Y3IpkR8DbkExto+TO8UVzTOFpeWW73+KzB9S
 MWuMxDqooyhoODXK3TeT2QbQaY3fKdf21CS91N+e0N62NfGV8kn/9ce3V
 mFOoMK3ou37PahCplFgVOjuJOQacYV5Cn8bV9VKZ4GWzBzWupAGh+5rFe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815490"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815490"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:26 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416209"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/7] drm/i915/huc: only load HuC on GTs that have VCS engines
Date: Thu, 22 Sep 2022 15:11:11 -0700
Message-Id: <20220922221117.458087-2-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL the primary GT doesn't have any media capabilities, so no video
engines and no HuC. We must therefore skip the HuC fetch and load on
that specific case. Given that other multi-GT platforms might have HuC
on the primary GT, we can't just check for that and it is easier to
instead check for the lack of VCS engines.

Based on code from Aravind Iddamsetty

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_drv.h        |  9 ++++++---
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index 3bb8838e325a..d4e2b252f16c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -42,12 +42,33 @@
  * HuC-specific commands.
  */
 
+static bool vcs_supported(struct intel_gt *gt)
+{
+	intel_engine_mask_t mask = gt->info.engine_mask;
+
+	/*
+	 * we can reach here from i915_driver_early_probe for primary
+	 * GT with it being not fully setup hence fall back to the device info's
+	 * engine mask
+	 */
+	if (!mask && gt_is_root(gt))
+		mask = RUNTIME_INFO(gt->i915)->platform_engine_mask;
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
index 134fc1621821..8ca575202e5d 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -777,12 +777,15 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
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

