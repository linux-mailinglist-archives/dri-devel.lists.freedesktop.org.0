Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2163E365CD9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962486E847;
	Tue, 20 Apr 2021 16:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF2A6E846;
 Tue, 20 Apr 2021 16:06:37 +0000 (UTC)
IronPort-SDR: vnGlqQyZm7d6DtwAg6sCvz0NO03IRNxIp42SKIj/2+NdkTAWctx+aK4Q6IUbNr31gusXbpmKwq
 FTeOkyBvfthA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="193411811"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="193411811"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:06:36 -0700
IronPort-SDR: 1ipUxI4o9TMnhz3Urziv0wyhC+5Sg41iRNgWfKjAJt7SW95kjjNNC9paa+Zfm5HBpC3cFJSTy+
 V6TYV4/FhiIg==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="385385468"
Received: from nmuniand-mobl1.gar.corp.intel.com (HELO [10.213.128.245])
 ([10.213.128.245])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 09:06:30 -0700
Subject: Re: [PATCH 1/5] drm/i915: Create stolen memory region from local
 memory
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210420131842.164163-1-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7e598c2a-2145-2512-e7fe-cc6e565557b4@linux.intel.com>
Date: Tue, 20 Apr 2021 17:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420131842.164163-1-matthew.auld@intel.com>
Content-Language: en-US
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
Cc: CQ Tang <cq.tang@intel.com>, Xinyun Liu <xinyun.liu@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/04/2021 14:18, Matthew Auld wrote:
> From: CQ Tang <cq.tang@intel.com>
> 
> Add "REGION_STOLEN" device info to dg1, create stolen memory
> region from upper portion of local device memory, starting
> from DSMBASE.
> 
> v2:
>      - s/drm_info/drm_dbg; userspace likely doesn't care about stolen.
>      - mem->type is only setup after the region probe, so setting the name
>        as stolen-local or stolen-system based on this value won't work. Split
>        system vs local stolen setup to fix this.
>      - kill all the region->devmem/is_devmem stuff. We already differentiate
>        the different types of stolen so such things shouldn't be needed
>        anymore.
> v3:
>      - split stolen lmem vs smem ops(Tvrtko)
>      - add shortcut for stolen region in i915(Tvrtko)
>      - sanity check dsm base vs bar size(Xinyun)
> 
> Signed-off-by: CQ Tang <cq.tang@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Xinyun Liu <xinyun.liu@intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_stolen.c | 137 ++++++++++++++++++---
>   drivers/gpu/drm/i915/i915_drv.h            |   7 ++
>   drivers/gpu/drm/i915/i915_pci.c            |   2 +-
>   drivers/gpu/drm/i915/i915_reg.h            |   1 +
>   drivers/gpu/drm/i915/intel_memory_region.c |   8 ++
>   drivers/gpu/drm/i915/intel_memory_region.h |   5 +-
>   6 files changed, 140 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index b0597de206de..2ed1ca9aec75 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -10,6 +10,7 @@
>   #include <drm/drm_mm.h>
>   #include <drm/i915_drm.h>
>   
> +#include "gem/i915_gem_lmem.h"
>   #include "gem/i915_gem_region.h"
>   #include "i915_drv.h"
>   #include "i915_gem_stolen.h"
> @@ -121,6 +122,14 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>   		}
>   	}
>   
> +	/*
> +	 * With device local memory, we don't need to check the address range,
> +	 * this is device memory physical address, could overlap with system
> +	 * memory.
> +	 */
> +	if (HAS_LMEM(i915))
> +		return 0;

The grammar in the comment is a bit hard to parse for me, but more 
importantly, this is now not on the device stolen path, right?

[Comes back later, hm no, still called okay at least there is a comment 
now explaining which are the relevant bits.]

> +
>   	/*
>   	 * Verify that nothing else uses this physical address. Stolen
>   	 * memory should be reserved by the BIOS and hidden from the
> @@ -374,8 +383,9 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>   	}
>   }
>   
> -static int i915_gem_init_stolen(struct drm_i915_private *i915)
> +static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   {
> +	struct drm_i915_private *i915 = mem->i915;
>   	struct intel_uncore *uncore = &i915->uncore;
>   	resource_size_t reserved_base, stolen_top;
>   	resource_size_t reserved_total, reserved_size;
> @@ -396,10 +406,10 @@ static int i915_gem_init_stolen(struct drm_i915_private *i915)
>   		return 0;
>   	}
>   
> -	if (resource_size(&intel_graphics_stolen_res) == 0)
> +	if (resource_size(&mem->region) == 0)
>   		return 0;
>   
> -	i915->dsm = intel_graphics_stolen_res;
> +	i915->dsm = mem->region;
>   
>   	if (i915_adjust_stolen(i915, &i915->dsm))
>   		return 0;
> @@ -688,39 +698,130 @@ struct drm_i915_gem_object *
>   i915_gem_object_create_stolen(struct drm_i915_private *i915,
>   			      resource_size_t size)
>   {
> -	return i915_gem_object_create_region(i915->mm.regions[INTEL_REGION_STOLEN_SMEM],
> +	return i915_gem_object_create_region(i915->mm.stolen_region,
>   					     size, I915_BO_ALLOC_CONTIGUOUS);
>   }
>   
> -static int init_stolen(struct intel_memory_region *mem)
> +static int init_stolen_smem(struct intel_memory_region *mem)
>   {
> -	intel_memory_region_set_name(mem, "stolen");
> -
>   	/*
>   	 * Initialise stolen early so that we may reserve preallocated
>   	 * objects for the BIOS to KMS transition.
>   	 */
> -	return i915_gem_init_stolen(mem->i915);
> +	return i915_gem_init_stolen(mem);
> +}
> +
> +static void release_stolen_smem(struct intel_memory_region *mem)
> +{
> +	i915_gem_cleanup_stolen(mem->i915);
> +}
> +
> +static const struct intel_memory_region_ops i915_region_stolen_smem_ops = {
> +	.init = init_stolen_smem,
> +	.release = release_stolen_smem,
> +	.init_object = _i915_gem_object_stolen_init,
> +};
> +
> +static int init_stolen_lmem(struct intel_memory_region *mem)
> +{
> +	int err;
> +
> +	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
> +		return -ENODEV;
> +
> +	if (!io_mapping_init_wc(&mem->iomap,
> +				mem->io_start,
> +				resource_size(&mem->region)))
> +		return -EIO;
> +
> +	/*
> +	 * For stolen lmem we mostly just care about populating the dsm related
> +	 * bits and setting up the drm_mm allocator for the range.
> +	 */
> +	err = i915_gem_init_stolen(mem);

Ideally we would be able to split this into two so there would be no 
further smem/lmem stolen forking inside it. That way we would also avoid 
the "mostly" and reach total clarity but okay, can leave for later.

> +	if (err)
> +		goto err_fini;
> +
> +	return 0;
> +
> +err_fini:
> +	io_mapping_fini(&mem->iomap);
> +	return err;
>   }
>   
> -static void release_stolen(struct intel_memory_region *mem)
> +static void release_stolen_lmem(struct intel_memory_region *mem)
>   {
> +	io_mapping_fini(&mem->iomap);
>   	i915_gem_cleanup_stolen(mem->i915);
>   }
>   
> -static const struct intel_memory_region_ops i915_region_stolen_ops = {
> -	.init = init_stolen,
> -	.release = release_stolen,
> +static const struct intel_memory_region_ops i915_region_stolen_lmem_ops = {
> +	.init = init_stolen_lmem,
> +	.release = release_stolen_lmem,
>   	.init_object = _i915_gem_object_stolen_init,
>   };
>   
> +static struct intel_memory_region *
> +setup_lmem_stolen(struct drm_i915_private *i915)
> +{
> +	struct intel_uncore *uncore = &i915->uncore;
> +	struct pci_dev *pdev = i915->drm.pdev;
> +	struct intel_memory_region *mem;
> +	resource_size_t io_start;
> +	resource_size_t lmem_size;
> +	u64 lmem_base;
> +
> +	if (!IS_DGFX(i915))
> +		return ERR_PTR(-ENODEV);

Is this check needed? Looks like the caller will only call this based on 
HAS_REGION. GEM_DEBUG_WARN_ON(!IS_DGFX())?

> +
> +	lmem_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
> +	if (GEM_WARN_ON(lmem_base >= pci_resource_len(pdev, 2)))
> +		return ERR_PTR(-ENODEV);
> +
> +	lmem_size = pci_resource_len(pdev, 2) - lmem_base;
> +	io_start = pci_resource_start(pdev, 2) + lmem_base;
> +
> +	mem = intel_memory_region_create(i915, lmem_base, lmem_size,
> +					 I915_GTT_PAGE_SIZE_4K, io_start,
> +					 &i915_region_stolen_lmem_ops);
> +	if (IS_ERR(mem))
> +		return mem;
> +
> +	drm_dbg(&i915->drm, "Stolen Local memory IO start: %pa\n",
> +		&mem->io_start);

Printouts I'd prefer if they were done by the common code which calls 
region->init(). Afterwards it could generically print all the region 
data with common formatting and using the set region name. Optional, 
later, is fine.

> +
> +	intel_memory_region_set_name(mem, "stolen-local");

Should the name just be passed in to intel_memory_region_create or there 
is a good reason for it to be a follow up step?

> +
> +	return mem;
> +}
> +
> +static struct intel_memory_region*
> +setup_smem_stolen(struct drm_i915_private *i915)
> +{
> +	struct intel_memory_region *mem;
> +
> +	mem = intel_memory_region_create(i915,
> +					 intel_graphics_stolen_res.start,
> +					 resource_size(&intel_graphics_stolen_res),
> +					 PAGE_SIZE, 0,
> +					 &i915_region_stolen_smem_ops);
> +	if (IS_ERR(mem))
> +		return mem;
> +
> +	intel_memory_region_set_name(mem, "stolen-system");
> +
> +	return mem;
> +}
> +
>   struct intel_memory_region *i915_gem_stolen_setup(struct drm_i915_private *i915)
>   {
> -	return intel_memory_region_create(i915,
> -					  intel_graphics_stolen_res.start,
> -					  resource_size(&intel_graphics_stolen_res),
> -					  PAGE_SIZE, 0,
> -					  &i915_region_stolen_ops);
> +	struct intel_memory_region *mem;
> +
> +	mem = setup_lmem_stolen(i915);
> +	if (mem == ERR_PTR(-ENODEV))
> +		mem = setup_smem_stolen(i915);

This helper is possibly not needed any more since the caller is a switch 
statement with a fallthrough. So eliminate the falltrough and call the 
correct setup directly from there? There is the i915->mm.stolen 
assignment to be duplicated in that case so up to you.

> +
> +	return mem;
>   }
>   
>   struct drm_i915_gem_object *
> @@ -728,7 +829,7 @@ i915_gem_object_create_stolen_for_preallocated(struct drm_i915_private *i915,
>   					       resource_size_t stolen_offset,
>   					       resource_size_t size)
>   {
> -	struct intel_memory_region *mem = i915->mm.regions[INTEL_REGION_STOLEN_SMEM];
> +	struct intel_memory_region *mem = i915->mm.stolen_region;
>   	struct drm_i915_gem_object *obj;
>   	struct drm_mm_node *stolen;
>   	int ret;
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e20294e9227a..0b44333eb703 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -514,6 +514,13 @@ struct intel_l3_parity {
>   };
>   
>   struct i915_gem_mm {
> +	/*
> +	 * Shortcut for the stolen region. This points to either
> +	 * INTEL_REGION_STOLEN_SMEM for integrated platforms, or
> +	 * INTEL_REGION_STOLEN_LMEM for discrete, or NULL if the device doesn't
> +	 * support stolen.
> +	 */
> +	struct intel_memory_region *stolen_region;
>   	/** Memory allocator for GTT stolen memory */
>   	struct drm_mm stolen;
>   	/** Protects the usage of the GTT stolen memory allocator. This is
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 44e7b94db63d..d4673e43a46d 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -908,7 +908,7 @@ static const struct intel_device_info rkl_info = {
>   };
>   
>   #define DGFX_FEATURES \
> -	.memory_regions = REGION_SMEM | REGION_LMEM, \
> +	.memory_regions = REGION_SMEM | REGION_LMEM | REGION_STOLEN_LMEM, \
>   	.has_master_unit_irq = 1, \
>   	.has_llc = 0, \
>   	.has_snoop = 1, \
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index f80d656331f4..ea20058bc13f 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -12191,6 +12191,7 @@ enum skl_power_gate {
>   #define GEN12_GLOBAL_MOCS(i)	_MMIO(0x4000 + (i) * 4) /* Global MOCS regs */
>   
>   #define GEN12_GSMBASE			_MMIO(0x108100)
> +#define GEN12_DSMBASE			_MMIO(0x1080C0)
>   
>   /* gamt regs */
>   #define GEN8_L3_LRA_1_GPGPU _MMIO(0x4dd4)
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.c b/drivers/gpu/drm/i915/intel_memory_region.c
> index bf837b6bb185..9941a4a07fde 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.c
> +++ b/drivers/gpu/drm/i915/intel_memory_region.c
> @@ -22,6 +22,10 @@ static const struct {
>   		.class = INTEL_MEMORY_STOLEN_SYSTEM,
>   		.instance = 0,
>   	},
> +	[INTEL_REGION_STOLEN_LMEM] = {
> +		.class = INTEL_MEMORY_STOLEN_LOCAL,
> +		.instance = 0,
> +	},
>   };
>   
>   struct intel_memory_region *
> @@ -278,8 +282,12 @@ int intel_memory_regions_hw_probe(struct drm_i915_private *i915)
>   		case INTEL_MEMORY_SYSTEM:
>   			mem = i915_gem_shmem_setup(i915);
>   			break;
> +		case INTEL_MEMORY_STOLEN_LOCAL:
> +			fallthrough;
>   		case INTEL_MEMORY_STOLEN_SYSTEM:
>   			mem = i915_gem_stolen_setup(i915);
> +			if (!IS_ERR(mem))
> +				i915->mm.stolen_region = mem;
>   			break;
>   		default:
>   			continue;
> diff --git a/drivers/gpu/drm/i915/intel_memory_region.h b/drivers/gpu/drm/i915/intel_memory_region.h
> index edd49067c8ca..4c8ec15af55f 100644
> --- a/drivers/gpu/drm/i915/intel_memory_region.h
> +++ b/drivers/gpu/drm/i915/intel_memory_region.h
> @@ -26,18 +26,21 @@ enum intel_memory_type {
>   	INTEL_MEMORY_SYSTEM = 0,
>   	INTEL_MEMORY_LOCAL,
>   	INTEL_MEMORY_STOLEN_SYSTEM,
> +	INTEL_MEMORY_STOLEN_LOCAL,
>   };
>   
>   enum intel_region_id {
>   	INTEL_REGION_SMEM = 0,
>   	INTEL_REGION_LMEM,
>   	INTEL_REGION_STOLEN_SMEM,
> +	INTEL_REGION_STOLEN_LMEM,
>   	INTEL_REGION_UNKNOWN, /* Should be last */
>   };
>   
>   #define REGION_SMEM     BIT(INTEL_REGION_SMEM)
>   #define REGION_LMEM     BIT(INTEL_REGION_LMEM)
>   #define REGION_STOLEN_SMEM   BIT(INTEL_REGION_STOLEN_SMEM)
> +#define REGION_STOLEN_LMEM   BIT(INTEL_REGION_STOLEN_LMEM)
>   
>   #define I915_ALLOC_MIN_PAGE_SIZE  BIT(0)
>   #define I915_ALLOC_CONTIGUOUS     BIT(1)
> @@ -82,7 +85,7 @@ struct intel_memory_region {
>   	u16 type;
>   	u16 instance;
>   	enum intel_region_id id;
> -	char name[8];
> +	char name[16];
>   
>   	struct list_head reserved;
>   
>
Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
