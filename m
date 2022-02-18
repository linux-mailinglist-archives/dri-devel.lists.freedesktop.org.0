Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60FC4BB6B3
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6A410F240;
	Fri, 18 Feb 2022 10:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD07510F23D;
 Fri, 18 Feb 2022 10:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645179471; x=1676715471;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=hltEh65dOi4qDpPQ5B/7n2Of4MFMCNkDWjHYDM8J4eU=;
 b=FYC/NNX4lCVyzblvP9zUh+oHElFBPhhk6bEJ2E4iHAN1NLShMhfFtgRe
 FrqKIku4BrXJ81irU/06ioeKFoWQsAJuaA2Miwev0FRgLzP9JaQlKavJx
 l/oHXdFwoVaITsVoswCJDP9JVXKcRx1DBo9oxBvnpJDIwe6Q2u9m96RH6
 lcctM7dduNAtZ2TyKeSeaHqAEe0h4UxUuJkMrURT1WMi0rt3APmQ9/u7h
 jiuKkCC0mHgRF9WelepDgd2ALzD+NeF4SghR8+XEcsm/Lw+1U/J5yHWUZ
 7HU0uGp+UWPEZInlSNm73ApMPuvA/yhPCxyVd3u9CqEKSSK251Nd6HGCa g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337543548"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="337543548"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:17:50 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="530868476"
Received: from svaddara-mobl.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.212.147.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:17:50 -0800
Date: Fri, 18 Feb 2022 02:17:51 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH v5 11/19] drm/i915/lmem: Enable lmem for
 platforms with Flat CCS
Message-ID: <20220218101751.7owe5jplm6kexkpp@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220201104132.3050-1-ramalingam.c@intel.com>
 <20220201104132.3050-12-ramalingam.c@intel.com>
 <20220218100818.qv5iqqtj4jnjz24l@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218100818.qv5iqqtj4jnjz24l@ldmartin-desk2>
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

On Fri, Feb 18, 2022 at 02:08:18AM -0800, Lucas De Marchi wrote:
>On Tue, Feb 01, 2022 at 04:11:24PM +0530, Ramalingam C wrote:
>>From: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
>>
>>A portion of device memory is reserved for Flat CCS so usable
>>device memory will be reduced by size of Flat CCS. Size of
>>Flat CCS is specified in “XEHPSDV_FLAT_CCS_BASE_ADDR”.
>>So to get effective device memory we need to subtract
>>total device memory by Flat CCS memory size.
>>
>>v2:
>> Addressed the small bar related issue [Matt]
>> Removed a reduntant check [Matt]
>>
>>Cc: Matthew Auld <matthew.auld@intel.com>
>>Signed-off-by: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
>>Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
>>---
>>drivers/gpu/drm/i915/gt/intel_gt.c          | 19 ++++++++++++++++
>>drivers/gpu/drm/i915/gt/intel_gt.h          |  1 +
>>drivers/gpu/drm/i915/gt/intel_region_lmem.c | 24 +++++++++++++++++++--
>>drivers/gpu/drm/i915/i915_reg.h             |  3 +++
>>4 files changed, 45 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>>index f59933abbb3a..e40d98cb3a2d 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>>@@ -911,6 +911,25 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
>>	return intel_uncore_read_fw(gt->uncore, reg);
>>}
>>
>>+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg)
>>+{
>>+	int type;
>>+	u8 sliceid, subsliceid;
>>+
>>+	for (type = 0; type < NUM_STEERING_TYPES; type++) {
>>+		if (intel_gt_reg_needs_read_steering(gt, reg, type)) {
>>+			intel_gt_get_valid_steering(gt, type, &sliceid,
>>+						    &subsliceid);
>>+			return intel_uncore_read_with_mcr_steering(gt->uncore,
>>+								   reg,
>>+								   sliceid,
>>+								   subsliceid);
>>+		}
>>+	}
>>+
>>+	return intel_uncore_read(gt->uncore, reg);
>>+}
>>+
>>void intel_gt_info_print(const struct intel_gt_info *info,
>>			 struct drm_printer *p)
>>{
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>>index 2dad46c3eff2..0f571c8ee22b 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gt.h
>>+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>>@@ -85,6 +85,7 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
>>}
>>
>>u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
>>+u32 intel_gt_read_register(struct intel_gt *gt, i915_reg_t reg);
>>
>>void intel_gt_info_print(const struct intel_gt_info *info,
>>			 struct drm_printer *p);
>>diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>index 21215a080088..f1d37b46b505 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
>>@@ -205,8 +205,28 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
>>	if (!IS_DGFX(i915))
>>		return ERR_PTR(-ENODEV);
>>
>>-	/* Stolen starts from GSMBASE on DG1 */
>>-	lmem_size = intel_uncore_read64(uncore, GEN12_GSMBASE);
>>+	if (HAS_FLAT_CCS(i915)) {
>>+		u64 tile_stolen, flat_ccs_base_addr_reg, flat_ccs_base;
>>+
>>+		lmem_size = pci_resource_len(pdev, 2);
>>+		flat_ccs_base_addr_reg = intel_gt_read_register(gt, XEHPSDV_FLAT_CCS_BASE_ADDR);
>
>nit since this will need a respin due to conflicts:
>we usually call _reg an i915_reg_t variable. But here you have the
>value, not the register. Maybe "flat_ccs_base_addr"?
>
>
>>+		flat_ccs_base = (flat_ccs_base_addr_reg >> XEHPSDV_CCS_BASE_SHIFT) * SZ_64K;
>>+
>>+		if (GEM_WARN_ON(lmem_size < flat_ccs_base))
>>+			return ERR_PTR(-ENODEV);
>>+
>>+		tile_stolen = lmem_size - flat_ccs_base;
>>+
>>+		/* If the FLAT_CCS_BASE_ADDR register is not populated, flag an error */
>>+		if (tile_stolen == lmem_size)
>>+			DRM_ERROR("CCS_BASE_ADDR register did not have expected value\n");
>
>drm_err()
>
>>+
>>+		lmem_size -= tile_stolen;
>>+	} else {
>>+		/* Stolen starts from GSMBASE without CCS */
>>+		lmem_size = intel_uncore_read64(&i915->uncore, GEN12_GSMBASE);
>>+	}
>>+
>>
>>	io_start = pci_resource_start(pdev, 2);
>>	if (GEM_WARN_ON(lmem_size > pci_resource_len(pdev, 2)))
>>diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>>index 0f36af8dc3a1..9b5423572fe9 100644
>>--- a/drivers/gpu/drm/i915/i915_reg.h
>>+++ b/drivers/gpu/drm/i915/i915_reg.h
>>@@ -11651,6 +11651,9 @@ enum skl_power_gate {
>>#define   SGGI_DIS			REG_BIT(15)
>>#define   SGR_DIS			REG_BIT(13)
>>
>>+#define XEHPSDV_FLAT_CCS_BASE_ADDR             _MMIO(0x4910)
>>+#define   XEHPSDV_CCS_BASE_SHIFT               8
>>+
>
>you will have a conflict here... I fixed it locally by moving to
>gt/intel_gt_regs.h
>
>
>With the above,
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Also, I may be wrong and couldn't test it today. But... to finally have BAT
on CI working, this and "drm/i915/xehpsdv: Add has_flat_ccs to device info" are
the only changes from the FlatCCS part that are strictly
needed, isn't it?
"drm/i915/migrate: add acceleration support for DG2", all the plane
format, support for clearing ccs etc are things that could be on top.

Lucas De Marchi

>
>Lucas De Marchi
>
>>/* gamt regs */
>>#define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
>>#define   GEN8_L3_LRA_1_GPGPU_DEFAULT_VALUE_BDW  0x67F1427F /* max/min for LRA1/2 */
>>-- 
>>2.20.1
>>
