Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF659F72F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 12:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A3810E20F;
	Wed, 24 Aug 2022 10:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F6310E20F;
 Wed, 24 Aug 2022 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661335880; x=1692871880;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5udGRaOVi+E4EHyOG5S1NVC98eEfkvH0jzhsWIN+8Gc=;
 b=jzmquv9tbZXLdqATdR4HQ57a1ff+FnwuLAXjM5ACmbNTXvIMsGjxfReG
 j8zlkQnw6Vw88Lq3SAkvWs82kxDIZAY3kzsVpr4KagR59O3Ive6J7s8ru
 x8Q54qUlPGcvAH7synnuJI2OsxkDyKLUrqQ7yOkJFaMKP/oKjtX2KVMoM
 h2dPeJWjYlc57fT+Rk4dI7XGl6uBnJhxLD6qSdyFh2kjjzHVMeKrbSPxR
 zRUCzuninGzMasLK6XZBPJ3dRmJ3wX5HEqZtSYejNi7K5jvirSq8Dy9UC
 ZU1XmbHV9qHtCVGe+zdYZQgBpX4puyPrbt4NYFANoPuWJ3L/YeTe9Ncv7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="319985632"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="319985632"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 03:11:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="670440857"
Received: from zlim2-mobl.gar.corp.intel.com (HELO localhost) ([10.252.52.23])
 by fmsmga008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 03:10:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Radhakrishna Sripada
 <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 01/21] drm/i915: Read
 graphics/media/display arch version from hw
In-Reply-To: <Yv/esUh1nl4jUxSV@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
 <20220818234202.451742-2-radhakrishna.sripada@intel.com>
 <Yv/esUh1nl4jUxSV@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 24 Aug 2022 13:10:42 +0300
Message-ID: <87czcqj6jh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Thu, Aug 18, 2022 at 04:41:42PM -0700, Radhakrishna Sripada wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>> 
>> Going forward, the hardware teams no longer consider new platforms to
>> have a "generation" in the way we've defined it for past platforms.
>> Instead, each IP block (graphics, media, display) will have their own
>> architecture major.minor versions and stepping ID's which should be read
>> directly from a register in the MMIO space.  New hardware programming
>> styles, features, and workarounds should be conditional solely on the
>> architecture version, and should no longer be derived from the PCI
>> device ID, revision ID, or platform-specific feature flags.
>> 
>> v1.1: Fix build error
>
> As Jani noted on the previous version, this patch needs to be split into
> three patches (and/or be based on top of the other series that Jani has
> in flight).  Also the giant macro is no longer necessary on current
> drm-tip now that we the version values stored consistently in
> structures; we can just use a regular function and pass pointers to the
> structures.

I've merged my series now, making moving stuff between static and
runtime info easier.

Some further comments inline.

>
> Bala also had feedback on the previous version that hasn't been
> incorporated here yet either.
>
>
> Matt
>
>> 
>> Bspec: 63361, 64111
>> 
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       |  2 +
>>  drivers/gpu/drm/i915/i915_driver.c            | 80 ++++++++++++++++++-
>>  drivers/gpu/drm/i915/i915_drv.h               | 16 ++--
>>  drivers/gpu/drm/i915/i915_pci.c               |  1 +
>>  drivers/gpu/drm/i915/i915_reg.h               |  6 ++
>>  drivers/gpu/drm/i915/intel_device_info.c      | 32 ++++----
>>  drivers/gpu/drm/i915/intel_device_info.h      | 14 ++++
>>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 +
>>  8 files changed, 128 insertions(+), 24 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 94f9ddcfb3a5..a053493dae24 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -39,6 +39,8 @@
>>  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>>  #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>>  
>> +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
>> +
>>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
>> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>> index deb8a8b76965..33566f6e9546 100644
>> --- a/drivers/gpu/drm/i915/i915_driver.c
>> +++ b/drivers/gpu/drm/i915/i915_driver.c
>> @@ -70,6 +70,7 @@
>>  #include "gem/i915_gem_pm.h"
>>  #include "gt/intel_gt.h"
>>  #include "gt/intel_gt_pm.h"
>> +#include "gt/intel_gt_regs.h"
>>  #include "gt/intel_rc6.h"
>>  
>>  #include "pxp/intel_pxp_pm.h"
>> @@ -306,15 +307,83 @@ static void sanitize_gpu(struct drm_i915_private *i915)
>>  		__intel_gt_reset(to_gt(i915), ALL_ENGINES);
>>  }
>>  
>> +#define IP_VER_READ(offset, ri_prefix) \
>> +	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32)); \
>> +	if (drm_WARN_ON(&i915->drm, !addr)) { \
>> +		/* Fall back to whatever was in the device info */ \
>> +		RUNTIME_INFO(i915)->ri_prefix.ver = INTEL_INFO(i915)->ri_prefix.ver; \
>> +		RUNTIME_INFO(i915)->ri_prefix.rel = INTEL_INFO(i915)->ri_prefix.rel; \
>> +		goto ri_prefix##done; \
>> +	} \
>> +	\
>> +	ver = ioread32(addr); \
>> +	pci_iounmap(pdev, addr); \
>> +	\
>> +	RUNTIME_INFO(i915)->ri_prefix.ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, ver); \
>> +	RUNTIME_INFO(i915)->ri_prefix.rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, ver); \
>> +	RUNTIME_INFO(i915)->ri_prefix.step = REG_FIELD_GET(GMD_ID_STEP, ver); \
>> +	\
>> +	/* Sanity check against expected versions from device info */ \
>> +	if (RUNTIME_INFO(i915)->ri_prefix.ver != INTEL_INFO(i915)->ri_prefix.ver || \
>> +	    RUNTIME_INFO(i915)->ri_prefix.rel > INTEL_INFO(i915)->ri_prefix.rel) \
>> +		drm_dbg(&i915->drm, \
>> +			"Hardware reports " #ri_prefix " IP version %u.%u but minimum expected is %u.%u\n", \
>> +			RUNTIME_INFO(i915)->ri_prefix.ver, \
>> +			RUNTIME_INFO(i915)->ri_prefix.rel, \
>> +			INTEL_INFO(i915)->ri_prefix.ver, \
>> +			INTEL_INFO(i915)->ri_prefix.rel); \
>> +ri_prefix##done:

My earlier comment about the moster macro stands.

>> +
>> +/**
>> + * intel_ipver_early_init - setup IP version values
>> + * @dev_priv: device private
>> + *
>> + * Setup the graphics version for the current device.  This must be done before
>> + * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
>> + * function should be called very early in the driver initialization sequence.
>> + *
>> + * Regular MMIO access is not yet setup at the point this function is called so
>> + * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
>> + * part of an 'always on' power well by design, so we don't need to worry about
>> + * forcewake while reading it.
>> + */
>> +static void intel_ipver_early_init(struct drm_i915_private *i915)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>> +	void __iomem *addr;
>> +	u32 ver;
>> +
>> +	if (!HAS_GMD_ID(i915)) {
>> +		drm_WARN_ON(&i915->drm, INTEL_INFO(i915)->graphics.ver > 12);
>> +
>> +		RUNTIME_INFO(i915)->graphics.ver = INTEL_INFO(i915)->graphics.ver;
>> +		RUNTIME_INFO(i915)->graphics.rel = INTEL_INFO(i915)->graphics.rel;
>> +		/* media ver = graphics ver for older platforms */
>> +		RUNTIME_INFO(i915)->media.ver = INTEL_INFO(i915)->graphics.ver;
>> +		RUNTIME_INFO(i915)->media.rel = INTEL_INFO(i915)->graphics.rel;
>> +		RUNTIME_INFO(i915)->display.ver = INTEL_INFO(i915)->display.ver;
>> +		RUNTIME_INFO(i915)->display.rel = INTEL_INFO(i915)->display.rel;
>> +		return;

This will just go away with the commits 2c93e7b7f545 ("drm/i915: add
initial runtime info into device info") and 43ba44a176a4 ("drm/i915:
move graphics.ver and graphics.rel to runtime info"). You'll just need
to add additional changes to move media and display versions to runtime
info, and that should be a separate prep patch.

>> +	}
>> +
>> +	IP_VER_READ(i915_mmio_reg_offset(GMD_ID_GRAPHICS), graphics);
>> +	IP_VER_READ(i915_mmio_reg_offset(GMD_ID_DISPLAY), display);
>> +	IP_VER_READ(MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),
>> +		    media);
>> +}

All of the above should be moved to intel_device_info.c and the function
should be named something like intel_device_info_runtime_init_early().

>> +
>>  /**
>>   * i915_driver_early_probe - setup state not requiring device access
>>   * @dev_priv: device private
>> + * @ent: PCI device info entry matched

???

>>   *
>>   * Initialize everything that is a "SW-only" state, that is state not
>>   * requiring accessing the device or exposing the driver via kernel internal
>>   * or userspace interfaces. Example steps belonging here: lock initialization,
>>   * system memory allocation, setting up device specific attributes and
>>   * function hooks not requiring accessing the device.
>> + *
>> + * GRAPHICS_VER, DISPLAY_VER, etc. are not yet usable at this point.  For

???

>>   */
>>  static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>  {
>> @@ -855,13 +924,22 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		return PTR_ERR(i915);
>>  
>>  	/* Disable nuclear pageflip by default on pre-ILK */
>> -	if (!i915->params.nuclear_pageflip && DISPLAY_VER(i915) < 5)
>> +	if (!i915->params.nuclear_pageflip &&
>> +	    !HAS_GMD_ID(i915) && DISPLAY_VER(i915) < 5)
>>  		i915->drm.driver_features &= ~DRIVER_ATOMIC;
>>  

This should just be moved after the
intel_device_info_runtime_init_early() call.

>>  	ret = pci_enable_device(pdev);
>>  	if (ret)
>>  		goto out_fini;
>>  
>> +	/*
>> +	 * GRAPHICS_VER() and DISPLAY_VER() will return 0 before this is

That's not universally true. At least not after switching to the initial
runtime info thing.

>> +	 * called, so we want to take care of this very early in the
>> +	 * initialization process (as soon as we can peek into the MMIO BAR),
>> +	 * even before we setup regular MMIO access.
>> +	 */

Maybe the whole comment belongs above the function definition, not the
call site.

>> +	intel_ipver_early_init(i915);
>> +
>>  	ret = i915_driver_early_probe(i915);
>>  	if (ret < 0)
>>  		goto out_pci_disable;
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 086bbe8945d6..7ebddde200bc 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -856,19 +856,19 @@ static inline struct intel_gt *to_gt(struct drm_i915_private *i915)
>>  
>>  #define IP_VER(ver, rel)		((ver) << 8 | (rel))
>>  
>> -#define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics.ver)
>> -#define GRAPHICS_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->graphics.ver, \
>> -					       INTEL_INFO(i915)->graphics.rel)
>> +#define GRAPHICS_VER(i915)		(RUNTIME_INFO(i915)->graphics.ver)
>> +#define GRAPHICS_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->graphics.ver, \
>> +					       RUNTIME_INFO(i915)->graphics.rel)
>>  #define IS_GRAPHICS_VER(i915, from, until) \
>>  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
>>  
>> -#define MEDIA_VER(i915)			(INTEL_INFO(i915)->media.ver)
>> -#define MEDIA_VER_FULL(i915)		IP_VER(INTEL_INFO(i915)->media.ver, \
>> -					       INTEL_INFO(i915)->media.rel)
>> +#define MEDIA_VER(i915)			(RUNTIME_INFO(i915)->media.ver)
>> +#define MEDIA_VER_FULL(i915)		IP_VER(RUNTIME_INFO(i915)->media.ver, \
>> +					       RUNTIME_INFO(i915)->media.rel)
>>  #define IS_MEDIA_VER(i915, from, until) \
>>  	(MEDIA_VER(i915) >= (from) && MEDIA_VER(i915) <= (until))
>>  
>> -#define DISPLAY_VER(i915)	(INTEL_INFO(i915)->display.ver)
>> +#define DISPLAY_VER(i915)		(RUNTIME_INFO(i915)->display.ver)
>>  #define IS_DISPLAY_VER(i915, from, until) \
>>  	(DISPLAY_VER(i915) >= (from) && DISPLAY_VER(i915) <= (until))
>>  
>> @@ -1300,6 +1300,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>   */
>>  #define NEEDS_COMPACT_PT(dev_priv) (INTEL_INFO(dev_priv)->needs_compact_pt)
>>  
>> +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id
>> +

AFAICT this should only be used at one location,
intel_device_info_runtime_init_early(). No need to add a wrapper macro,
giving the idea this should be used more widely.

>>  #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
>>  
>>  #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>> index 9fd788e147a3..b60f01d072a7 100644
>> --- a/drivers/gpu/drm/i915/i915_pci.c
>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>> @@ -1127,6 +1127,7 @@ static const struct intel_device_info mtl_info = {
>>  	PLATFORM(INTEL_METEORLAKE),
>>  	.display.has_modular_fia = 1,
>>  	.has_flat_ccs = 0,
>> +	.has_gmd_id = 1,
>>  	.has_snoop = 1,
>>  	.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>>  	.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
>> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
>> index 50d7bfd541ad..15a53cb5e1ee 100644
>> --- a/drivers/gpu/drm/i915/i915_reg.h
>> +++ b/drivers/gpu/drm/i915/i915_reg.h
>> @@ -5860,6 +5860,11 @@
>>  #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
>>  #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>>  
>> +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
>> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
>> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
>> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
>> +
>>  /*GEN11 chicken */
>>  #define _PIPEA_CHICKEN				0x70038
>>  #define _PIPEB_CHICKEN				0x71038
>> @@ -8353,4 +8358,5 @@ enum skl_power_gate {
>>  #define GEN12_CULLBIT2			_MMIO(0x7030)
>>  #define GEN12_STATE_ACK_DEBUG		_MMIO(0x20BC)
>>  
>> +#define MTL_MEDIA_GSI_BASE		0x380000

Seems like a pretty random place?

\n missing here.

>>  #endif /* _I915_REG_H_ */
>> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
>> index d98fbbd589aa..4ca8f78bfbd7 100644
>> --- a/drivers/gpu/drm/i915/intel_device_info.c
>> +++ b/drivers/gpu/drm/i915/intel_device_info.c
>> @@ -91,22 +91,6 @@ const char *intel_platform_name(enum intel_platform platform)
>>  void intel_device_info_print_static(const struct intel_device_info *info,
>>  				    struct drm_printer *p)
>>  {
>> -	if (info->graphics.rel)
>> -		drm_printf(p, "graphics version: %u.%02u\n", info->graphics.ver,
>> -			   info->graphics.rel);
>> -	else
>> -		drm_printf(p, "graphics version: %u\n", info->graphics.ver);
>> -
>> -	if (info->media.rel)
>> -		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
>> -	else
>> -		drm_printf(p, "media version: %u\n", info->media.ver);
>> -
>> -	if (info->display.rel)
>> -		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
>> -	else
>> -		drm_printf(p, "display version: %u\n", info->display.ver);
>> -
>>  	drm_printf(p, "gt: %d\n", info->gt);
>>  	drm_printf(p, "memory-regions: %x\n", info->memory_regions);
>>  	drm_printf(p, "page-sizes: %x\n", info->page_sizes);
>> @@ -127,6 +111,22 @@ void intel_device_info_print_static(const struct intel_device_info *info,
>>  void intel_device_info_print_runtime(const struct intel_runtime_info *info,
>>  				     struct drm_printer *p)
>>  {
>> +	if (info->graphics.rel)
>> +		drm_printf(p, "graphics version: %u.%02u\n", info->graphics.ver,
>> +			   info->graphics.rel);
>> +	else
>> +		drm_printf(p, "graphics version: %u\n", info->graphics.ver);
>> +
>> +	if (info->media.rel)
>> +		drm_printf(p, "media version: %u.%02u\n", info->media.ver, info->media.rel);
>> +	else
>> +		drm_printf(p, "media version: %u\n", info->media.ver);
>> +
>> +	if (info->display.rel)
>> +		drm_printf(p, "display version: %u.%02u\n", info->display.ver, info->display.rel);
>> +	else
>> +		drm_printf(p, "display version: %u\n", info->display.ver);
>> +
>>  	drm_printf(p, "rawclk rate: %u kHz\n", info->rawclk_freq);

This will need a rebase, no need to for the code movement now, just a
switch from info to runtime.

>>  }
>>  
>> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
>> index 23bf230aa104..327e62875871 100644
>> --- a/drivers/gpu/drm/i915/intel_device_info.h
>> +++ b/drivers/gpu/drm/i915/intel_device_info.h
>> @@ -146,6 +146,7 @@ enum intel_ppgtt_type {
>>  	func(has_64bit_reloc); \
>>  	func(has_64k_pages); \
>>  	func(needs_compact_pt); \
>> +	func(has_gmd_id); \
>>  	func(gpu_reset_clobbers_display); \
>>  	func(has_reset_engine); \
>>  	func(has_3d_pipeline); \
>> @@ -200,6 +201,7 @@ enum intel_ppgtt_type {
>>  struct ip_version {
>>  	u8 ver;
>>  	u8 rel;
>> +	u8 step;
>>  };
>>  
>>  struct intel_device_info {
>> @@ -271,6 +273,18 @@ struct intel_runtime_info {
>>  	 */
>>  	u32 platform_mask[2];
>>  
>> +	/*
>> +	 * On modern platforms, the architecture major.minor version numbers
>> +	 * and stepping are read directly from the hardware rather than derived
>> +	 * from the PCI device and revision ID's.
>> +	 *
>> +	 * Note that the hardware gives us a single "graphics" number that
>> +	 * should represent render, compute, and copy behavior.
>> +	 */
>> +	struct ip_version graphics;
>> +	struct ip_version media;
>> +	struct ip_version display;
>> +
>>  	u16 device_id;
>>  
>>  	u8 num_sprites[I915_MAX_PIPES];
>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> index 9c31a16f8380..91ad444cd532 100644
>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>> @@ -173,6 +173,7 @@ struct drm_i915_private *mock_gem_device(void)
>>  	drm_mode_config_init(&i915->drm);
>>  
>>  	mkwrite_device_info(i915)->graphics.ver = -1;
>> +	RUNTIME_INFO(i915)->graphics.ver = ~0;

-1 to ~0 is an unrelated change.

BR,
Jani.

>>  
>>  	mkwrite_device_info(i915)->page_sizes =
>>  		I915_GTT_PAGE_SIZE_4K |
>> -- 
>> 2.25.1
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
