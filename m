Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3A24BB663
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFE010F059;
	Fri, 18 Feb 2022 10:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E9A10F04E;
 Fri, 18 Feb 2022 10:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178898; x=1676714898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NL0qZO6Q51NwuLE3xq73LdrjI3Xg/7heFZK3q3vYHxY=;
 b=CcrdCpbOBT4aVWjy87ZTyrbMkE6WspoOTv7mSorZZkIgZDh3rFODg7k8
 YrPpNETaY7+ZMRpTgWezrbQPkQZVLt+cXctckG8fXjEnPFY1Kwd8tHY6w
 Lqrx8TWRsMAE+vuggIX1H0U5n51PRvjXx4jip+N1+KO5Ketjhvt+j/1Nx
 3gYMqRM7SKerH/GRC97mCof/d62zk0p/Bl5K6wamUXwZ+Yr/SgdIjZ40O
 yhQpOTyx+lmGhUcn4DI/1q2MqEmovFLB4yk1JnU7EirFMdWXYojEqRkFO
 zjVA/KGD5R0ubBDgozjx+Vbt8DCD48KxLQtLh3I6RwaK8BTOIS7HyEMUQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238502782"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="238502782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:08:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546220535"
Received: from svaddara-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.37])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:08:17 -0800
Date: Fri, 18 Feb 2022 02:08:18 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 11/19] drm/i915/lmem: Enable lmem for
 platforms with Flat CCS
Message-ID: <20220218100818.qv5iqqtj4jnjz24l@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-12-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220201104132.3050-12-ramalingam.c@intel.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 01, 2022 at 04:11:24PM +0530, Ramalingam C wrote:
>From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
>
>A portion of device memory is reserved for Flat CCS so usable
>device memory will be reduced by size of Flat CCS. Size of
>Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
>So to get effective device memory we need to subtract
>total device memory by Flat CCS memory size.
>
>v2:
>  Addressed the small bar related issue [Matt]
>  Removed a reduntant check [Matt]
>
>Cc: Matthew Auld <matthew.auld@intel.com>
>Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>---
> drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++
> drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
> drivers/gpu/drm/i915/gt/intel_region_lmem.c | 24 +++++++++++++++++++--
> drivers/gpu/drm/i915/i915_reg.h             |  3 +++
> 4 files changed, 45 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>index f59933abbb3a..e40d98cb3a2d 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>@@ -911,6 +911,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
> 	return intel_uncore_read_fw(gt->uncore, reg);
> }
>
>+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
>+{
>+	int type;
>+	u8 sliceid, subsliceid;
>+
>+	for (type = 0; type < NUM_STEERING_TYPES; type++) {
>+		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
>+			intel_gt_get_valid_steering(gt, type, &sliceid,
>+						    &subsliceid);
>+			return intel_uncore_read_with_mcr_steering(gt->uncore,
>+								   reg,
>+								   sliceid,
>+								   subsliceid);
>+		}
>+	}
>+
>+	return intel_uncore_read(gt->uncore, reg);
>+}
>+
> void intel_gt_info_print(const struct intel_gt_info *info,
> 			 struct drm_printer *p)
> {
>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>index 2dad46c3eff2..0f571c8ee22b 100644
>--- a/drivers/gpu/drm/i915/gt/intel_gt.h
>+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>@@ -85,6 +85,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
> }
>
> u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
>+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
>
> void intel_gt_info_print(const struct intel_gt_info *info,
> 			 struct drm_printer *p);
>diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>index 21215a080088..f1d37b46b505 100644
>--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>@@ -205,8 +205,28 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
> 	if (!IS_DGFX(i915))
> 		return ERR_PTR(-ENODEV);
>
>-	/* Stolen starts from GSMBASE on DG1 */
>-	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
>+	if (HAS_FLAT_CCS(i915)) {
>+		u64 tile_stolen, flat_ccs_base_addr_reg, flat_ccs_base;
>+
>+		lmem_size = pci_resource_len(pdev, 2);
>+		flat_ccs_base_addr_reg = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);

nit since this will need a respin due to conflicts:
we usually call _reg an i915_reg_t variable. But here you have the
value, not the register. Maybe "flat_ccs_base_addr"?


>+		flat_ccs_base = (flat_ccs_base_addr_reg >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
>+
>+		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
>+			return ERR_PTR(-ENODEV);
>+
>+		tile_stolen = lmem_size - flat_ccs_base;
>+
>+		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
>+		if (tile_stolen == lmem_size)
>+			DRM_ERROR("CCS_BASE_ADDR register did not have expected value\n");

drm_err()

>+
>+		lmem_size -= tile_stolen;
>+	} else {
>+		/* Stolen starts from GSMBASE without CCS */
>+		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
>+	}
>+
>
> 	io_start = pci_resource_start(pdev, 2);
> 	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>index 0f36af8dc3a1..9b5423572fe9 100644
>--- a/drivers/gpu/drm/i915/i915_reg.h
>+++ b/drivers/gpu/drm/i915/i915_reg.h
>@@ -11651,6 +11651,9 @@ enum skl_power_gate {
> #define   SGGI_DIS			REG_BIT(15)
> #define   SGR_DIS			REG_BIT(13)
>
>+#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
>+#define   XEHPSDV_CCS_BASE_SHIFT               8
>+

you will have a conflict here... I fixed it locally by moving to
gt/intel_gt_regs.h


With the above,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> /* gamt regs */
> #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
> #define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
>-- 
>2.20.1
>
