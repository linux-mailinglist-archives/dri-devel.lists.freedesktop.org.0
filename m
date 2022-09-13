Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075845B7B83
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 21:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F510E28A;
	Tue, 13 Sep 2022 19:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F38B10E28A;
 Tue, 13 Sep 2022 19:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663098049; x=1694634049;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=gWiZIM0UUx5VUi4ahHmTDBKMCq7fR0De++9DFoQh6/4=;
 b=Lj9TUKqsZaVl8QJs/o4vKHI4ymKBtsrow3pujpOzX0YMOV3/uw9EoIWX
 8s3ZtaoaTqrRVu90/TDjAIR61Rx+vXzWdeKRTzGLOxvee0k9ToowCVIQE
 h7HqzFEiy5VRgncQ/a0wOGZZ8737eKI2EzKncPJ1WRqIakfwwaPz86V/Q
 h6MdC0XH+druOvMk4WxiI7eyC0zfCxwQIKhvrXFRVwZQkb4Hj6EUxJoxq
 QGmezw1zdKcnSd/v8AyyfiVE3+OikzRuNx4SqCh6gpTRod6Y9iwMO1bY3
 Gp9L8UwqJ+wyl4SIKey8osoZEKBBn7vyS1RDF4qaKTbLO813DqLwU2u6l Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="299574375"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="299574375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 12:40:48 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="678715384"
Received: from baumeish-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 12:40:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH v5 1/5] drm/i915: Read
 graphics/media/display arch version from hw
In-Reply-To: <20220913183341.908028-2-radhakrishna.sripada@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
 <20220913183341.908028-2-radhakrishna.sripada@intel.com>
Date: Tue, 13 Sep 2022 22:40:41 +0300
Message-ID: <871qsf3vwm.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Sep 2022, Radhakrishna Sripada <radhakrishna.sripada@intel.com> wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> Going forward, the hardware teams no longer consider new platforms to
> have a "generation" in the way we've defined it for past platforms.
> Instead, each IP block (graphics, media, display) will have their own
> architecture major.minor versions and stepping ID's which should be read
> directly from a register in the MMIO space.  New hardware programming
> styles, features, and workarounds should be conditional solely on the
> architecture version, and should no longer be derived from the PCI
> device ID, revision ID, or platform-specific feature flags.
>
> Bspec: 63361, 64111
>
> v2:
>   - Move the IP version readout to intel_device_info.c
>   - Convert the macro into a function
>
> v3:
>   - Move subplatform init to runtime early init
>   - Cache runtime ver, release info to compare with hardware values.
>   - Use IP_VER for snaity check(MattR)
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
>  drivers/gpu/drm/i915/i915_driver.c       |  3 +-
>  drivers/gpu/drm/i915/i915_drv.h          |  2 +
>  drivers/gpu/drm/i915/i915_pci.c          |  1 +
>  drivers/gpu/drm/i915/i915_reg.h          |  7 +++
>  drivers/gpu/drm/i915/intel_device_info.c | 74 +++++++++++++++++++++++-
>  drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
>  7 files changed, 98 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 2275ee47da95..2d2044f2ed9d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -39,6 +39,8 @@
>  #define FORCEWAKE_ACK_RENDER_GEN9		_MMIO(0xd84)
>  #define FORCEWAKE_ACK_MEDIA_GEN9		_MMIO(0xd88)
>  
> +#define GMD_ID_GRAPHICS				_MMIO(0xd8c)
> +
>  #define MCFG_MCR_SELECTOR			_MMIO(0xfd0)
>  #define SF_MCR_SELECTOR				_MMIO(0xfd8)
>  #define GEN8_MCR_SELECTOR			_MMIO(0xfdc)
> diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
> index c459eb362c47..e86798eaecb6 100644
> --- a/drivers/gpu/drm/i915/i915_driver.c
> +++ b/drivers/gpu/drm/i915/i915_driver.c
> @@ -337,7 +337,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>  	if (i915_inject_probe_failure(dev_priv))
>  		return -ENODEV;
>  
> -	intel_device_info_subplatform_init(dev_priv);
> +	intel_device_info_runtime_init_early(dev_priv);
> +
>  	intel_step_init(dev_priv);
>  
>  	intel_uncore_mmio_debug_init_early(dev_priv);
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 9f9372931fd2..bec48cb0efef 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -940,6 +940,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>  
>  #define HAS_GMCH(dev_priv) (INTEL_INFO(dev_priv)->display.has_gmch)
>  
> +#define HAS_GMD_ID(i915)	INTEL_INFO(i915)->has_gmd_id

All other macro values around here are wrapped in parenthesis to be
safe.

> +
>  #define HAS_LSPCON(dev_priv) (IS_DISPLAY_VER(dev_priv, 9, 10))
>  
>  #define HAS_L3_CCS_READ(i915) (INTEL_INFO(i915)->has_l3_ccs_read)
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 77e7df21f539..cace897e1db1 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1143,6 +1143,7 @@ static const struct intel_device_info mtl_info = {
>  	.display.has_modular_fia = 1,
>  	.extra_gt_list = xelpmp_extra_gt,
>  	.has_flat_ccs = 0,
> +	.has_gmd_id = 1,
>  	.has_snoop = 1,
>  	.__runtime.memory_regions = REGION_SMEM | REGION_STOLEN_LMEM,
>  	.__runtime.platform_engine_mask = BIT(RCS0) | BIT(BCS0) | BIT(CCS0),
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 09752a7217f8..0ab5fe70b482 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -5828,6 +5828,11 @@
>  #define ICL_DSSM_CDCLK_PLL_REFCLK_19_2MHz	(1 << 29)
>  #define ICL_DSSM_CDCLK_PLL_REFCLK_38_4MHz	(2 << 29)
>  
> +#define GMD_ID_DISPLAY				_MMIO(0x510a0)
> +#define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> +#define   GMD_ID_RELEASE_MASK			REG_GENMASK(21, 14)
> +#define   GMD_ID_STEP				REG_GENMASK(5, 0)
> +
>  /*GEN11 chicken */
>  #define _PIPEA_CHICKEN				0x70038
>  #define _PIPEB_CHICKEN				0x71038
> @@ -8345,4 +8350,6 @@ enum skl_power_gate {
>  #define   MTL_TRAS_MASK			REG_GENMASK(16, 8)
>  #define   MTL_TRDPRE_MASK		REG_GENMASK(7, 0)
>  
> +#define MTL_MEDIA_GSI_BASE		0x380000
> +
>  #endif /* _I915_REG_H_ */
> diff --git a/drivers/gpu/drm/i915/intel_device_info.c b/drivers/gpu/drm/i915/intel_device_info.c
> index 1434dc33cf49..68c58e38fe62 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.c
> +++ b/drivers/gpu/drm/i915/intel_device_info.c
> @@ -29,6 +29,7 @@
>  
>  #include "display/intel_cdclk.h"
>  #include "display/intel_de.h"
> +#include "gt/intel_gt_regs.h"
>  #include "intel_device_info.h"
>  #include "i915_drv.h"
>  #include "i915_utils.h"
> @@ -231,7 +232,7 @@ static bool find_devid(u16 id, const u16 *p, unsigned int num)
>  	return false;
>  }
>  
> -void intel_device_info_subplatform_init(struct drm_i915_private *i915)
> +static void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>  {
>  	const struct intel_device_info *info = INTEL_INFO(i915);
>  	const struct intel_runtime_info *rinfo = RUNTIME_INFO(i915);
> @@ -288,6 +289,77 @@ void intel_device_info_subplatform_init(struct drm_i915_private *i915)
>  	RUNTIME_INFO(i915)->platform_mask[pi] |= mask;
>  }
>  
> +static void ip_ver_read(struct drm_i915_private *i915, u32 offset, struct ip_version *ip)
> +{
> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
> +	void __iomem *addr;
> +	u32 val;
> +	u8 ver = ip->ver;
> +	u8 rel = ip->rel;
> +
> +	addr = pci_iomap_range(pdev, 0, offset, sizeof(u32));
> +	if (drm_WARN_ON(&i915->drm, !addr))
> +		return;
> +
> +	val = ioread32(addr);
> +	pci_iounmap(pdev, addr);
> +
> +	ip->ver = REG_FIELD_GET(GMD_ID_ARCH_MASK, val);
> +	ip->rel = REG_FIELD_GET(GMD_ID_RELEASE_MASK, val);
> +	ip->step = REG_FIELD_GET(GMD_ID_STEP, val);
> +
> +	/* Sanity check against expected versions from device info */
> +	if (IP_VER(ip->ver, ip->rel) < IP_VER(ver, rel))
> +		drm_dbg(&i915->drm,
> +			"Hardware reports GMD IP version %u.%u but minimum expected is %u.%u\n",
> +			ip->ver, ip->rel, ver, rel);
> +}
> +
> +/**

This isn't and doesn't need to be a kernel-doc comment, please drop the
extra *.

> + * Setup the graphics version for the current device.  This must be done before
> + * any code that performs checks on GRAPHICS_VER or DISPLAY_VER, so this
> + * function should be called very early in the driver initialization sequence.
> + *
> + * Regular MMIO access is not yet setup at the point this function is called so
> + * we peek at the appropriate MMIO offset directly.  The GMD_ID register is
> + * part of an 'always on' power well by design, so we don't need to worry about
> + * forcewake while reading it.
> + */
> +static void intel_ipver_early_init(struct drm_i915_private *i915)
> +{
> +	struct intel_runtime_info *runtime = RUNTIME_INFO(i915);
> +
> +	if (!HAS_GMD_ID(i915))
> +		return;
> +
> +	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> +		    &runtime->graphics.ip);
> +	ip_ver_read(i915, i915_mmio_reg_offset(GMD_ID_DISPLAY),
> +		    &runtime->display.ip);
> +	ip_ver_read(i915, MTL_MEDIA_GSI_BASE + i915_mmio_reg_offset(GMD_ID_GRAPHICS),
> +		    &runtime->media.ip);
> +}
> +
> +/**
> + * intel_device_info_runtime_init_early - initialize early runtime info
> + * @i915: the i915 device
> + *
> + * Determine early intel_device_info fields at runtime.
> + *
> + * Use it when:
> + *   - Early init of certain runtime info fields are to be initialized
> + *
> + * This function needs to be called:
> + *   - before the MMIO has been setup as we are reading registers,
> + *   - before the PCH has been detected,
> + *   - before the first usage of the fields it can tweak.
> + */

The comment seems excessive, but *shrug*.

BR,
Jani.

> +void intel_device_info_runtime_init_early(struct drm_i915_private *i915)
> +{
> +	intel_ipver_early_init(i915);
> +	intel_device_info_subplatform_init(i915);
> +}
> +
>  /**
>   * intel_device_info_runtime_init - initialize runtime info
>   * @dev_priv: the i915 device
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 09b18910d3ab..e3aa88d33d63 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -153,6 +153,7 @@ enum intel_ppgtt_type {
>  	func(has_4tile); \
>  	func(has_flat_ccs); \
>  	func(has_global_mocs); \
> +	func(has_gmd_id); \
>  	func(has_gt_uc); \
>  	func(has_heci_pxp); \
>  	func(has_heci_gscfi); \
> @@ -198,9 +199,18 @@ enum intel_ppgtt_type {
>  struct ip_version {
>  	u8 ver;
>  	u8 rel;
> +	u8 step;
>  };
>  
>  struct intel_runtime_info {
> +	/*
> +	 * On modern platforms, the architecture major.minor version numbers
> +	 * and stepping are read directly from the hardware rather than derived
> +	 * from the PCI device and revision ID's.
> +	 *
> +	 * Note that the hardware gives us a single "graphics" number that
> +	 * should represent render, compute, and copy behavior.
> +	 */
>  	struct {
>  		struct ip_version ip;
>  	} graphics;
> @@ -309,7 +319,7 @@ struct intel_driver_caps {
>  
>  const char *intel_platform_name(enum intel_platform platform);
>  
> -void intel_device_info_subplatform_init(struct drm_i915_private *dev_priv);
> +void intel_device_info_runtime_init_early(struct drm_i915_private *dev_priv);
>  void intel_device_info_runtime_init(struct drm_i915_private *dev_priv);
>  
>  void intel_device_info_print(const struct intel_device_info *info,

-- 
Jani Nikula, Intel Open Source Graphics Center
