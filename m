Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B84BBFEB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69E7410E99A;
	Fri, 18 Feb 2022 18:48:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300A310E8FA;
 Fri, 18 Feb 2022 18:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210098; x=1676746098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2McoXFW4blWiG44CtZCyhsypC8+YJg8m7+56KYFgi8Y=;
 b=Wd0oTb3bDfrHGunpaKL6cBwYtl+e7G0byKGg/WwpHyvx45i+06VoPwts
 fwAbsWTPCgS7Z2IcP7knPRgh4VHDF0Bn8pqdGc3U7aaK5G63H3m0HDifd
 6NehgC08xlY5YeUupTbMadU/0kohpbtj2eWgp4l6VE3BHt4/kg8zD9Mj9
 Qi1ggcriXDxqMrGKNWxWoqupwronnj0H5JnjQaETeioS9TpDb3WiC70TQ
 77wk1EKEmAL5zlthpfnubFQQ/u/auwVQ7DgDi0b0Lo9XaeMrEzQmGb3qt
 sROtIYYft/9KHvsQq3yLVMvrtYeM3PMQDWImFb5gxEFV/hVpypVQe8lxK Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="251388815"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="251388815"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="489642424"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:48:15 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/15] drm/i915/xehpsdv: Add has_flat_ccs to device info
Date: Sat, 19 Feb 2022 00:17:50 +0530
Message-Id: <20220218184752.7524-14-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220218184752.7524-1-ramalingam.c@intel.com>
References: <20220218184752.7524-1-ramalingam.c@intel.com>
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
Cc: lucas.demarchi@intel.com, CQ Tang <cq.tang@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Platforms of XeHP and beyond support 3D surface (buffer) compression and
various compression formats. This is accomplished by an additional
compression control state (CCS) stored for each surface.

Gen 12 devices(TGL family and DG1) stores compression states in a separate
region of memory. It is managed by user-space and has an associated set of
user-space managed page tables used by hardware for address translation.

In Xe HP and beyond (XEHPSDV, DG2, etc), there is a new feature introduced
i.e Flat CCS. It replaced AUX page tables with a flat indexed region of
device memory for storing compression states.

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_drv.h          | 6 ++++++
 drivers/gpu/drm/i915/i915_pci.c          | 1 +
 drivers/gpu/drm/i915/intel_device_info.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 4a3ac66e777a..1c2f4ae4ebf9 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -1356,6 +1356,12 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
 #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
 #define HAS_LMEM(i915) HAS_REGION(i915, REGION_LMEM)
 
+/*
+ * Platform has the dedicated compression control state for each lmem surfaces
+ * stored in lmem to support the 3D and media compression formats.
+ */
+#define HAS_FLAT_CCS(dev_priv)   (INTEL_INFO(dev_priv)->has_flat_ccs)
+
 #define HAS_GT_UC(dev_priv)	(INTEL_INFO(dev_priv)->has_gt_uc)
 
 #define HAS_POOLED_EU(dev_priv)	(INTEL_INFO(dev_priv)->has_pooled_eu)
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 8df8887d76ae..f449c454b6f8 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1005,6 +1005,7 @@ static const struct intel_device_info adl_p_info = {
 	XE_HP_PAGE_SIZES, \
 	.dma_mask_size = 46, \
 	.has_64bit_reloc = 1, \
+	.has_flat_ccs = 1, \
 	.has_global_mocs = 1, \
 	.has_gt_uc = 1, \
 	.has_llc = 1, \
diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
index f75673da768d..2508a47fb3f5 100644
--- a/drivers/gpu/drm/i915/intel_device_info.h
+++ b/drivers/gpu/drm/i915/intel_device_info.h
@@ -134,6 +134,7 @@ enum intel_ppgtt_type {
 	func(needs_compact_pt); \
 	func(gpu_reset_clobbers_display); \
 	func(has_reset_engine); \
+	func(has_flat_ccs); \
 	func(has_global_mocs); \
 	func(has_gt_uc); \
 	func(has_guc_deprivilege); \
-- 
2.20.1

