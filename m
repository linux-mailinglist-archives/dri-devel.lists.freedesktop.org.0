Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 887DA4EDFC4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 19:36:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A11010E239;
	Thu, 31 Mar 2022 17:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF6910E3DB;
 Thu, 31 Mar 2022 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648748158; x=1680284158;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=O4d9ADveTBMWpKM8ntIVMPXgt3aQWdhHSigGHxxoQyg=;
 b=g89m3VHgYGFKR+snRlyyp3dve7P914a3qXuEc9OTWEZeVbFU2xReuFUc
 i7RSByuTn2qXULIHXBFxO1PBd0/+C/kdEr6xu8V3e/2eFty5tpqfIFUoM
 8HplfYwaB8uiL9LHsGZ+YTEtzTEinjcr5suqOZebU73yBWk4U4o2FevVM
 cnkuqcJbKRkqsMF9LJ4G/ZhIgqf55F008URdEkk5jEDjCF370SmunGRZB
 aQMb0KihFyBB8Q6oRFl2t/7pui2eXgSxjPtuczqrppQigZMg/B6KCmZQt
 4qpFt6h+Y5V4d9EBfffIFCdejE4VoKKLapZlZiAFMg8Ec0PXjbhrlVLIu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260090701"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260090701"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 10:35:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="654932129"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.215.247])
 ([10.213.215.247])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 10:35:56 -0700
Message-ID: <14359c1d-506c-1c60-51a6-33e1d0a50420@linux.intel.com>
Date: Thu, 31 Mar 2022 18:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 15/15] drm/i915/xehp: Eliminate
 shared/implicit steering
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220330232858.3204283-1-matthew.d.roper@intel.com>
 <20220330232858.3204283-16-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220330232858.3204283-16-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 31/03/2022 00:28, Matt Roper wrote:
> Historically we've selected and programmed a single MCR group/instance
> ID at driver startup that will steer register accesses for GSLICE/DSS
> ranges to a non-terminated instance.  Any reads of these register ranges
> that don't need a specific unicast access won't bother explicitly
> resteering because the control register should already be set to a
> suitable value to receive a non-terminated response.  Any accesses to
> other types of MCR ranges (MSLICE, LNCF, etc.) that are also satisfied
> by the default steering target will also skip explicit re-steering at
> runtime.
> 
> This approach has worked well for many years and many platforms, but our
> hardware teams have recently advised us that they're not 100%
> comfortable with our strategy going forward.  They now suggest
> explicitly steering reads of any multicast register at the time the
> register access happens rather than relying on previously-programmed
> steering values.  In debug settings there could be external agents that
> have adjusted the default steering without the driver's knowledge (e.g.,
> we could do this manually with IGT's intel_reg today, although the
> hardware teams also have other tools they use for debug and analysis).
> In theory it would also be possible for bad firmware and/or incorrect
> handling of power management events to clobber/wipe the steering
> value we had previously initialized because they assume we'll be
> re-programming it anyway.

That external agent of any kind can mess with registers behind drivers 
back is kind of a weak justification, no? Because steering is just one 
small part of what can go wrong in this case.

Also, someone at some point has to know which are the affected 
registers. Be it a range table, or at actual point of submitting patches 
which add register definitions. At any of those points mistakes are 
possible.

So I guess I am not immediately buying the need to refactor all this. 
Apart from churn, the main downside that I see is that all accesses need 
separate helpers. Question is why. Driver could choose to always steer 
before reading today, right?

Regards,

Tvrtko

> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 40 +++++++++
>   drivers/gpu/drm/i915/gt/intel_gt_types.h    |  1 +
>   drivers/gpu/drm/i915/gt/intel_workarounds.c | 98 ++++-----------------
>   3 files changed, 56 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index a9a9fa6881f2..787752367337 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -35,6 +35,7 @@
>    */
>   
>   static const char * const intel_steering_types[] = {
> +	"GSLICE/DSS",
>   	"L3BANK",
>   	"MSLICE",
>   	"LNCF",
> @@ -45,6 +46,35 @@ static const struct intel_mmio_range icl_l3bank_steering_table[] = {
>   	{},
>   };
>   
> +static const struct intel_mmio_range xehpsdv_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },
> +	{ 0x005400, 0x007FFF },
> +	{ 0x008140, 0x00815F },
> +	{ 0x008D00, 0x008DFF },
> +	{ 0x0094D0, 0x00955F },
> +	{ 0x009680, 0x0096FF },
> +	{ 0x00DC00, 0x00DCFF },
> +	{ 0x00DE80, 0x00E8FF },
> +	{ 0x017000, 0x017FFF },
> +	{ 0x024A00, 0x024A7F },
> +	{},
> +};
> +
> +static const struct intel_mmio_range dg2_dss_steering_table[] = {
> +	{ 0x005200, 0x0052FF },
> +	{ 0x005400, 0x007FFF },
> +	{ 0x008140, 0x00815F },
> +	{ 0x008D00, 0x008DFF },
> +	{ 0x0094D0, 0x00955F },
> +	{ 0x009680, 0x0096FF },
> +	{ 0x00D800, 0x00D87F },
> +	{ 0x00DC00, 0x00DCFF },
> +	{ 0x00DE80, 0x00E8FF },
> +	{ 0x017000, 0x017FFF },
> +	{ 0x024A00, 0x024A7F },
> +	{},
> +};
> +
>   static const struct intel_mmio_range xehpsdv_mslice_steering_table[] = {
>   	{ 0x004000, 0x004AFF },
>   	{ 0x00C800, 0x00CFFF },
> @@ -87,9 +117,11 @@ void intel_gt_mcr_init(struct intel_gt *gt)
>   			 GEN12_MEML3_EN_MASK);
>   
>   	if (IS_DG2(i915)) {
> +		gt->steering_table[DSS] = dg2_dss_steering_table;
>   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>   		gt->steering_table[LNCF] = dg2_lncf_steering_table;
>   	} else if (IS_XEHPSDV(i915)) {
> +		gt->steering_table[DSS] = xehpsdv_dss_steering_table;
>   		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
>   		gt->steering_table[LNCF] = xehpsdv_lncf_steering_table;
>   	} else if (GRAPHICS_VER(i915) >= 11 &&
> @@ -317,7 +349,15 @@ static void get_valid_steering(struct intel_gt *gt,
>   			       enum intel_steering_type type,
>   			       u8 *group, u8 *instance)
>   {
> +	u32 dssmask = intel_sseu_get_subslices(&gt->info.sseu, 0);
> +
>   	switch (type) {
> +	case DSS:
> +		drm_WARN_ON(&gt->i915->drm, dssmask == 0);
> +
> +		*group = __ffs(dssmask) / GEN_DSS_PER_GSLICE;
> +		*instance = __ffs(dssmask) % GEN_DSS_PER_GSLICE;
> +		break;
>   	case L3BANK:
>   		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> index 937b2e1a305e..b77bbaac7622 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
> @@ -54,6 +54,7 @@ struct intel_mmio_range {
>    * are listed here.
>    */
>   enum intel_steering_type {
> +	DSS,
>   	L3BANK,
>   	MSLICE,
>   	LNCF,
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> index 818ba71f4909..2486c6aa9d9d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
> @@ -1160,87 +1160,6 @@ icl_wa_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
>   	__add_mcr_wa(gt, wal, slice, subslice);
>   }
>   
> -static void
> -xehp_init_mcr(struct intel_gt *gt, struct i915_wa_list *wal)
> -{
> -	const struct sseu_dev_info *sseu = &gt->info.sseu;
> -	unsigned long slice, subslice = 0, slice_mask = 0;
> -	u64 dss_mask = 0;
> -	u32 lncf_mask = 0;
> -	int i;
> -
> -	/*
> -	 * On Xe_HP the steering increases in complexity. There are now several
> -	 * more units that require steering and we're not guaranteed to be able
> -	 * to find a common setting for all of them. These are:
> -	 * - GSLICE (fusable)
> -	 * - DSS (sub-unit within gslice; fusable)
> -	 * - L3 Bank (fusable)
> -	 * - MSLICE (fusable)
> -	 * - LNCF (sub-unit within mslice; always present if mslice is present)
> -	 *
> -	 * We'll do our default/implicit steering based on GSLICE (in the
> -	 * sliceid field) and DSS (in the subsliceid field).  If we can
> -	 * find overlap between the valid MSLICE and/or LNCF values with
> -	 * a suitable GSLICE, then we can just re-use the default value and
> -	 * skip and explicit steering at runtime.
> -	 *
> -	 * We only need to look for overlap between GSLICE/MSLICE/LNCF to find
> -	 * a valid sliceid value.  DSS steering is the only type of steering
> -	 * that utilizes the 'subsliceid' bits.
> -	 *
> -	 * Also note that, even though the steering domain is called "GSlice"
> -	 * and it is encoded in the register using the gslice format, the spec
> -	 * says that the combined (geometry | compute) fuse should be used to
> -	 * select the steering.
> -	 */
> -
> -	/* Find the potential gslice candidates */
> -	dss_mask = intel_sseu_get_subslices(sseu, 0);
> -	slice_mask = intel_slicemask_from_dssmask(dss_mask, GEN_DSS_PER_GSLICE);
> -
> -	/*
> -	 * Find the potential LNCF candidates.  Either LNCF within a valid
> -	 * mslice is fine.
> -	 */
> -	for_each_set_bit(i, &gt->info.mslice_mask, GEN12_MAX_MSLICES)
> -		lncf_mask |= (0x3 << (i * 2));
> -
> -	/*
> -	 * Are there any sliceid values that work for both GSLICE and LNCF
> -	 * steering?
> -	 */
> -	if (slice_mask & lncf_mask) {
> -		slice_mask &= lncf_mask;
> -		gt->steering_table[LNCF] = NULL;
> -	}
> -
> -	/* How about sliceid values that also work for MSLICE steering? */
> -	if (slice_mask & gt->info.mslice_mask) {
> -		slice_mask &= gt->info.mslice_mask;
> -		gt->steering_table[MSLICE] = NULL;
> -	}
> -
> -	slice = __ffs(slice_mask);
> -	subslice = __ffs(dss_mask >> (slice * GEN_DSS_PER_GSLICE));
> -	WARN_ON(subslice > GEN_DSS_PER_GSLICE);
> -	WARN_ON(dss_mask >> (slice * GEN_DSS_PER_GSLICE) == 0);
> -
> -	__add_mcr_wa(gt, wal, slice, subslice);
> -
> -	/*
> -	 * SQIDI ranges are special because they use different steering
> -	 * registers than everything else we work with.  On XeHP SDV and
> -	 * DG2-G10, any value in the steering registers will work fine since
> -	 * all instances are present, but DG2-G11 only has SQIDI instances at
> -	 * ID's 2 and 3, so we need to steer to one of those.  For simplicity
> -	 * we'll just steer to a hardcoded "2" since that value will work
> -	 * everywhere.
> -	 */
> -	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
> -	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
> -}
> -
>   static void
>   icl_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
> @@ -1388,8 +1307,9 @@ static void
>   xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
>   	struct drm_i915_private *i915 = gt->i915;
> +	struct drm_printer p = drm_debug_printer("MCR Steering:");
>   
> -	xehp_init_mcr(gt, wal);
> +	intel_gt_mcr_report_steering(&p, gt, false);
>   
>   	/* Wa_1409757795:xehpsdv */
>   	wa_mcr_write_or(wal, SCCGCTL94DC, CG3DDISURB);
> @@ -1441,10 +1361,22 @@ xehpsdv_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   static void
>   dg2_gt_workarounds_init(struct intel_gt *gt, struct i915_wa_list *wal)
>   {
> +	struct drm_printer p = drm_debug_printer("MCR Steering:");
>   	struct intel_engine_cs *engine;
>   	int id;
>   
> -	xehp_init_mcr(gt, wal);
> +	intel_gt_mcr_report_steering(&p, gt, false);
> +
> +	/*
> +	 * SQIDI ranges are special because they use different steering
> +	 * registers than everything else we work with.  On DG2-G10, any value
> +	 * in the steering registers will work fine since all instances are
> +	 * present, but DG2-G11 only has SQIDI instances at ID's 2 and 3, so we
> +	 * need to steer to one of those.  For simplicity we'll just steer to a
> +	 * hardcoded "2" since that value will work everywhere.
> +	 */
> +	__set_mcr_steering(wal, MCFG_MCR_SELECTOR, 0, 2);
> +	__set_mcr_steering(wal, SF_MCR_SELECTOR, 0, 2);
>   
>   	/* Wa_14011060649:dg2 */
>   	wa_14011060649(gt, wal);
