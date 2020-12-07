Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4FB2D1241
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 14:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F006E849;
	Mon,  7 Dec 2020 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F816E849;
 Mon,  7 Dec 2020 13:39:08 +0000 (UTC)
IronPort-SDR: LuuMQ/ErM/W1J+tI7Fe3q6RTrkCLu6OzZ/78qcN3Jyiujz/xbwAEAvwcL8LQIA1bkaXcH3HmKV
 xzDmQJtwGm5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9827"; a="152940408"
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="152940408"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 05:39:08 -0800
IronPort-SDR: vQW5Mc6jzMIJ8zvITpyplq5RekpHS5LQQ0c2VffRAtpgv8eONyH4XYgLKlp1rcJHsaluvDsEMr
 TE4oHasjiI+Q==
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="363146419"
Received: from srudgex-mobl.amr.corp.intel.com (HELO localhost)
 ([10.213.214.54])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2020 05:39:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [RFC PATCH 113/162] drm/i915: Create stolen memory
 region from local memory
In-Reply-To: <20201127120718.454037-114-matthew.auld@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-114-matthew.auld@intel.com>
Date: Mon, 07 Dec 2020 15:39:02 +0200
Message-ID: <87y2i9ag7d.fsf@intel.com>
MIME-Version: 1.0
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
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Chris P Wilson <chris.p.wilson@intel.com>, Neel Desai <neel.desai@intel.com>,
 Balestrieri@freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Nov 2020, Matthew Auld <matthew.auld@intel.com> wrote:
> From: CQ Tang <cq.tang@intel.com>
>
> Add "REGION_STOLEN" device info to dg1, create stolen memory
> region from upper portion of local device memory, starting
> from DSMBASE.
>
> The memory region is marked with "is_devmem=true".
>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
> Cc: Chris P Wilson <chris.p.wilson@intel.com>
> Cc: Balestrieri, Francesco <francesco.balestrieri@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Venkata S Dhanalakota <venkata.s.dhanalakota@intel.com>
> Cc: Neel Desai <neel.desai@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Sudeep Dutt <sudeep.dutt@intel.com>
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.c   |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_lmem.h   |  7 +++
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 56 +++++++++++++++++++++-
>  drivers/gpu/drm/i915/i915_pci.c            |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h            |  1 +
>  drivers/gpu/drm/i915/intel_memory_region.c |  5 ++
>  drivers/gpu/drm/i915/intel_memory_region.h |  2 +-
>  7 files changed, 71 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> index 71c07e1f6f26..b2fd2bc862c0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.c
> @@ -111,8 +111,8 @@ int i915_gem_object_lmem_pread(struct drm_i915_gem_object *obj,
>  	return ret;
>  }
>  
> -static int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
> -				       const struct drm_i915_gem_pwrite *arg)
> +int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
> +				const struct drm_i915_gem_pwrite *arg)
>  {
>  	struct drm_i915_private *i915 = to_i915(obj->base.dev);
>  	struct intel_runtime_pm *rpm = &i915->runtime_pm;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> index e11e0545e39c..c59aa6c014c7 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_lmem.h
> @@ -11,9 +11,16 @@
>  struct drm_i915_private;
>  struct drm_i915_gem_object;
>  struct intel_memory_region;
> +struct drm_i915_gem_pread;
> +struct drm_i915_gem_pwrite;
>  
>  extern const struct drm_i915_gem_object_ops i915_gem_lmem_obj_ops;
>  
> +int i915_gem_object_lmem_pread(struct drm_i915_gem_object *obj,
> +			       const struct drm_i915_gem_pread *args);
> +int i915_gem_object_lmem_pwrite(struct drm_i915_gem_object *obj,
> +				const struct drm_i915_gem_pwrite *args);
> +
>  void __iomem *
>  i915_gem_object_lmem_io_map(struct drm_i915_gem_object *obj,
>  			    unsigned long n,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 0ddf48e472a0..633745336f40 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_mm.h>
>  #include <drm/i915_drm.h>
>  
> +#include "gem/i915_gem_lmem.h"
>  #include "gem/i915_gem_region.h"
>  #include "i915_drv.h"
>  #include "i915_gem_stolen.h"
> @@ -121,6 +122,14 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>  		}
>  	}
>  
> +	/*
> +	 * With device local memory, we don't need to check the address range,
> +	 * this is device memory physical address, could overlap with system
> +	 * memory.
> +	 */
> +	if (HAS_LMEM(i915))
> +		return 0;
> +
>  	/*
>  	 * Verify that nothing else uses this physical address. Stolen
>  	 * memory should be reserved by the BIOS and hidden from the
> @@ -607,7 +616,7 @@ static void i915_gem_object_put_pages_stolen(struct drm_i915_gem_object *obj,
>  	kfree(pages);
>  }
>  
> -static const struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {
> +static struct drm_i915_gem_object_ops i915_gem_object_stolen_ops = {

Making driver specific ops non-const seems suspicious...

>  	.name = "i915_gem_object_stolen",
>  	.get_pages = i915_gem_object_get_pages_stolen,
>  	.put_pages = i915_gem_object_put_pages_stolen,
> @@ -716,7 +725,19 @@ i915_gem_object_create_stolen(struct drm_i915_private *i915,
>  
>  static int init_stolen(struct intel_memory_region *mem)
>  {
> -	intel_memory_region_set_name(mem, "stolen");
> +	if (mem->type == INTEL_MEMORY_STOLEN_SYSTEM)
> +		intel_memory_region_set_name(mem, "stolen-system");
> +	else
> +		intel_memory_region_set_name(mem, "stolen-local");
> +
> +	if (HAS_LMEM(mem->i915)) {
> +		i915_gem_object_stolen_ops.pread = i915_gem_object_lmem_pread;
> +		i915_gem_object_stolen_ops.pwrite = i915_gem_object_lmem_pwrite;

...and AFAICT this modifies the ops for all devices, including the
integrated GPU, if any of the devices HAS_LMEM().

BR,
Jani.

> +		if (!io_mapping_init_wc(&mem->iomap,
> +					mem->io_start,
> +					resource_size(&mem->region)))
> +			return -EIO;
> +	}
>  
>  	/*
>  	 * Initialise stolen early so that we may reserve preallocated
> @@ -736,8 +757,39 @@ static const struct intel_memory_region_ops i915_region_stolen_ops = {
>  	.create_object = i915_gem_object_create_stolen_region,
>  };
>  
> +static
> +struct intel_memory_region *setup_lmem_stolen(struct drm_i915_private *i915)
> +{
> +	struct intel_uncore *uncore = &i915->uncore;
> +	struct pci_dev *pdev = i915->drm.pdev;
> +	struct intel_memory_region *mem;
> +	resource_size_t io_start;
> +	resource_size_t lmem_size;
> +	u64 lmem_base;
> +
> +	lmem_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
> +	io_start = pci_resource_start(pdev, 2) + lmem_base;
> +
> +	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
> +					 I915_GTT_PAGE_SIZE_4K, io_start,
> +					 &i915_region_stolen_ops);
> +	if (!IS_ERR(mem)) {
> +		DRM_INFO("Intel graphics stolen LMEM: %pR\n", &mem->region);
> +		DRM_INFO("Intel graphics stolen LMEM IO start: %llx\n",
> +			 (u64)mem->io_start);
> +		/* this is real device memory */
> +		mem->is_devmem = true;
> +	}
> +
> +	return mem;
> +}
> +
>  struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915)
>  {
> +	if (HAS_LMEM(i915))
> +		return setup_lmem_stolen(i915);
> +
>  	return intel_memory_region_create(i915,
>  					  intel_graphics_stolen_res.start,
>  					  resource_size(&intel_graphics_stolen_res),
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 8243178a56f9..c3d9b36ef651 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -907,7 +907,7 @@ static const struct intel_device_info rkl_info = {
>  
>  #define GEN12_DGFX_FEATURES \
>  	GEN12_FEATURES, \
> -	.memory_regions = REGION_SMEM | REGION_LMEM, \
> +	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
>  	.has_master_unit_irq = 1, \
>  	.has_llc = 0, \
>  	.has_snoop = 1, \
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index 0e01ea0cb0a4..3c8350f108e4 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -12067,6 +12067,7 @@ enum skl_power_gate {
>  #define   LMEM_ENABLE			(1 << 31)
>  
>  #define GEN12_GSMBASE			_MMIO(0x108100)
> +#define GEN12_DSMBASE			_MMIO(0x1080C0)
>  
>  /* gamt regs */
>  #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index 043541d409bd..c7a1d84e7ee8 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -19,6 +19,10 @@ const struct intel_memory_region_info intel_region_map[] = {
>                 .class = INTEL_MEMORY_STOLEN_SYSTEM,
>                 .instance = 0,
>         },
> +       [INTEL_REGION_STOLEN_LMEM] = {
> +	       .class = INTEL_MEMORY_STOLEN_LOCAL,
> +	       .instance = 0,
> +       },
>  };
>  
>  struct intel_memory_region *
> @@ -311,6 +315,7 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
>  		case INTEL_MEMORY_SYSTEM:
>  			mem = i915_gem_shmem_setup(i915);
>  			break;
> +		case INTEL_MEMORY_STOLEN_LOCAL: /* fallthrough */
>  		case INTEL_MEMORY_STOLEN_SYSTEM:
>  			mem = i915_gem_stolen_setup(i915);
>  			break;
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index b7a9e34faaf1..8da82cb2afe3 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -93,7 +93,7 @@ struct intel_memory_region {
>  	u16 type;
>  	u16 instance;
>  	enum intel_region_id id;
> -	char name[8];
> +	char name[16];
>  	struct intel_gt *gt; /* GT closest to this region. */
>  	bool is_devmem;	/* true for device memory */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
