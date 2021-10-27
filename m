Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF143C361
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 08:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0E76E536;
	Wed, 27 Oct 2021 06:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCDE6E52E;
 Wed, 27 Oct 2021 06:57:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="210172488"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="210172488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:57:59 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="572803014"
Received: from dzhang-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.251.142.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 23:57:58 -0700
Date: Tue, 26 Oct 2021 23:57:55 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: Re: [Intel-gfx] [PATCH 03/11] drm/i915: Restructure probe to handle
 multi-tile platforms
Message-ID: <20211027065755.gp476mo3hwfbbbno@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211008215635.2026385-1-matthew.d.roper@intel.com>
 <20211008215635.2026385-4-matthew.d.roper@intel.com>
 <87ee8pxgvs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87ee8pxgvs.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 13, 2021 at 03:12:55PM +0300, Jani Nikula wrote:
>On Fri, 08 Oct 2021, Matt Roper <matthew.d.roper@intel.com> wrote:
>> On a multi-tile platform, each tile has its own registers + GGTT space,
>> and BAR 0 is extended to cover all of them.  Upcoming patches will start
>> exposing the tiles as multiple GTs within a single PCI device.  In
>> preparation for supporting such setups, restructure the driver's probe
>> code a bit.
>>
>> Only the primary/root tile is initialized for now; the other tiles will
>> be detected and plugged in by future patches once the necessary
>> infrastructure is in place to handle them.
>>
>> Original-author: Abdiel Janulgue
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_gt.c       | 45 ++++++++++++++++++++++++
>>  drivers/gpu/drm/i915/gt/intel_gt.h       |  3 ++
>>  drivers/gpu/drm/i915/gt/intel_gt_pm.c    |  9 ++++-
>>  drivers/gpu/drm/i915/gt/intel_gt_types.h |  5 +++
>>  drivers/gpu/drm/i915/i915_drv.c          | 20 +++++------
>>  drivers/gpu/drm/i915/intel_uncore.c      | 12 +++----
>>  drivers/gpu/drm/i915/intel_uncore.h      |  3 +-
>>  7 files changed, 76 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
>> index 1cb1948ac959..f4bea1f1de77 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
>> @@ -900,6 +900,51 @@ u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg)
>>  	return intel_uncore_read_fw(gt->uncore, reg);
>>  }
>>
>> +static int
>> +tile_setup(struct intel_gt *gt, unsigned int id, phys_addr_t phys_addr)
>> +{
>> +	int ret;
>> +
>> +	intel_uncore_init_early(gt->uncore, gt->i915);
>> +
>> +	ret = intel_uncore_setup_mmio(gt->uncore, phys_addr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	gt->phys_addr = phys_addr;
>> +
>> +	return 0;
>> +}
>> +
>> +static void tile_cleanup(struct intel_gt *gt)
>> +{
>> +	intel_uncore_cleanup_mmio(gt->uncore);
>> +}
>> +
>> +int intel_probe_gts(struct drm_i915_private *i915)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
>> +	phys_addr_t phys_addr;
>> +	unsigned int mmio_bar;
>> +	int ret;
>> +
>> +	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
>> +	phys_addr = pci_resource_start(pdev, mmio_bar);
>> +
>> +	/* We always have at least one primary GT on any device */
>> +	ret = tile_setup(&i915->gt, 0, phys_addr);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* TODO: add more tiles */
>> +	return 0;
>> +}
>> +
>> +void intel_gts_release(struct drm_i915_private *i915)
>> +{
>> +	tile_cleanup(&i915->gt);
>> +}
>
>Please call the functions intel_gt_*.

actually besides the name, the fact that these take i915 as argument
seems to suggest they are in the wrong place. Probably this part should
remain in i915_drv.c with name i915_setup_gts()?

then we could export tile_setup as intel_gt_setup() or something else
(name here is confusing IMO as in some places we have
`init(); ...; setup()` and in other this is `setup(); ...; init();` like
in patch 1. We already have

   - intel_gt_init_early()
   - intel_gt_init_hw_early()
   - intel_gt_init_mmio()
   - intel_gt_init()


given this is just initiliazing mmio for that specific gt (tile), do we
actually need a new init/setup entrypoint?

>
>BR,
>Jani.
>
>
>
>> +
>>  void intel_gt_info_print(const struct intel_gt_info *info,
>>  			 struct drm_printer *p)
>>  {
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
>> index 74e771871a9b..f4f35a70cbe4 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt.h
>> @@ -85,6 +85,9 @@ static inline bool intel_gt_needs_read_steering(struct intel_gt *gt,
>>
>>  u32 intel_gt_read_register_fw(struct intel_gt *gt, i915_reg_t reg);
>>
>> +int intel_probe_gts(struct drm_i915_private *i915);
>> +void intel_gts_release(struct drm_i915_private *i915);
>> +
>>  void intel_gt_info_print(const struct intel_gt_info *info,
>>  			 struct drm_printer *p);
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> index 524eaf678790..76f498edb0d5 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.c
>> @@ -126,7 +126,14 @@ static const struct intel_wakeref_ops wf_ops = {
>>
>>  void intel_gt_pm_init_early(struct intel_gt *gt)
>>  {
>> -	intel_wakeref_init(&gt->wakeref, gt->uncore->rpm, &wf_ops);
>> +	/*
>> +	 * We access the runtime_pm structure via gt->i915 here rather than
>> +	 * gt->uncore as we do elsewhere in the file because gt->uncore is not
>> +	 * yet initialized for all tiles at this point in the driver startup.
>> +	 * runtime_pm is per-device rather than per-tile, so this is still the
>> +	 * correct structure.
>> +	 */
>> +	intel_wakeref_init(&gt->wakeref, &gt->i915->runtime_pm, &wf_ops);
>>  	seqcount_mutex_init(&gt->stats.lock, &gt->wakeref.mutex);
>>  }
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> index 14216cc471b1..66143316d92e 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
>> @@ -180,6 +180,11 @@ struct intel_gt {
>>
>>  	const struct intel_mmio_range *steering_table[NUM_STEERING_TYPES];
>>
>> +	/*
>> +	 * Base of per-tile GTTMMADR where we can derive the MMIO and the GGTT.
>> +	 */
>> +	phys_addr_t phys_addr;

here and in the next patches it doesn't seem like we need to save
phys_addr (which should probably be better named as gttmmadr)? Looking
at what is coming it seems this will be needed only when initializing
ggtt... We could move this to when it's needed or, just to be clear this
is indeed desired for a future change, drop a comment in the commit
message the address will be needed for the ggtt initialization?

Lucas De Marchi
