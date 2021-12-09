Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 638AD46EFDC
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136410E709;
	Thu,  9 Dec 2021 16:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A733D10E117;
 Thu,  9 Dec 2021 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639064783; x=1670600783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8rz3Ej5M/1T08ZmtKsi3p6GnsKx9XPO94uEWkVR6qvc=;
 b=TPUSZtIumHIe/DsALpdycVwQgH7NrLYjZEIrJhFGwScVGuV8Wt4qCWNf
 vujpGhWfAFffAwi/GB81EzjIpoAK0K3QDkQl063o6+FqYwZa5HEBRdV4I
 kthaKlVxkr6KoiA2BzxUCiBu9hYwiSQeSTs5hSONspGV9Vxw/Pjd0tBom
 HjPIcdqhh++/Y236Y4f3Nqc3U4yVZQ0/+tGZcBStrE7i3fJiHMSwGXZS0
 wIoMXGBlRsvp+idNqxeeSbk4V9MLiVG6X/5t0tzYVqOJWZThmnCocwu3T
 +GHJvQ3cSgHmJ3LhoPh8fWI5koTph1YZOja4SSevcxOj31Kz+JrqjpOaF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298916920"
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="298916920"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,192,1635231600"; d="scan'208";a="503535182"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.205])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 07:46:03 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v4 05/16] drm/i915/lmem: Enable lmem for platforms with Flat
 CCS
Date: Thu,  9 Dec 2021 21:15:22 +0530
Message-Id: <20211209154533.4084-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209154533.4084-1-ramalingam.c@intel.com>
References: <20211209154533.4084-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>

A portion of device memory is reserved for Flat CCS so usable
device memory will be reduced by size of Flat CCS. Size of
Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
So to get effective device memory we need to subtract
total device memory by Flat CCS memory size.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
 drivers/gpu/drm/i915/gt/intel_region_lmem.c | 22 +++++++++++++++++++--
 drivers/gpu/drm/i915/i915_reg.h             |  3 +++
 4 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f2422d48be32..510cda6a163f 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -902,6 +902,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
 	return intel_uncore_read_fw(gt->uncore, reg);
 }
 
+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
+{
+	int type;
+	u8 sliceid, subsliceid;
+
+	for (type = 0; type < NUM_STEERING_TYPES; type++) {
+		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
+			intel_gt_get_valid_steering(gt, type, &sliceid,
+						    &subsliceid);
+			return intel_uncore_read_with_mcr_steering(gt->uncore,
+								   reg,
+								   sliceid,
+								   subsliceid);
+		}
+	}
+
+	return intel_uncore_read(gt->uncore, reg);
+}
+
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p)
 {
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 74e771871a9b..24b78398a587 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -84,6 +84,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
 }
 
 u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
 
 void intel_gt_info_print(const struct intel_gt_info *info,
 			 struct drm_printer *p);
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index fde2dcb59809..a358fa14372b 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -205,8 +205,26 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!IS_DGFX(i915))
 		return ERR_PTR(-ENODEV);
 
-	/* Stolen starts from GSMBASE on DG1 */
-	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
+	if (HAS_FLAT_CCS(i915)) {
+		u64 tile_stolen, flat_ccs_base_addr_reg, flat_ccs_base;
+
+		lmem_size = pci_resource_len(pdev, 2);
+		flat_ccs_base_addr_reg = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
+		flat_ccs_base = (flat_ccs_base_addr_reg >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
+		tile_stolen = lmem_size - flat_ccs_base;
+
+		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
+		if (tile_stolen == lmem_size)
+			DRM_ERROR("CCS_BASE_ADDR register did not have expected value\n");
+
+		lmem_size -= tile_stolen;
+	} else {
+		/* Stolen starts from GSMBASE without CCS */
+		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
+		if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
+			return ERR_PTR(-ENODEV);
+	}
+
 
 	io_start = pci_resource_start(pdev, 2);
 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index d27ba273cc68..29f1cafb0f4b 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -12620,6 +12620,9 @@ enum skl_power_gate {
 #define   SGGI_DIS			REG_BIT(15)
 #define   SGR_DIS			REG_BIT(13)
 
+#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
+#define   XEHPSDV_CCS_BASE_SHIFT               8
+
 /* gamt regs */
 #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
 #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
-- 
2.20.1

