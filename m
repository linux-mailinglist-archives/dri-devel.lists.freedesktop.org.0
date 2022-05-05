Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44B151C49F
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 18:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F6A10E7BA;
	Thu,  5 May 2022 16:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7A310E7BA;
 Thu,  5 May 2022 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651766790; x=1683302790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=X5FQClVCDL4nLxf6aqXkmO7l6uoGKMf9bv2PVQvppsU=;
 b=NwY/t04mj9R42uKnmZH4OK/uRFfXDbmAvT/FOukESU4bAjDT+H/q3D24
 9qdRlHiQEoX4IBxyTQpO7ikHWnEsB/w+AW2akT62HWYuGWdWV/rLlJDdy
 +dqEg5kojvgndx35nmwo2tMUY1Kk/Vg0xt0TqaznaEHxcK59th/HkPII9
 7TGudG4r0b1l54rfGHO0j8FmqLV5oKt+Bj6QPdjvBVMtandCDy72qxGy4
 vWkyfG03b7AnaRPo0toigebI4Ybqfw8ioMchcGI3lSq/G8SawXRR7n/3M
 au/8M2kq1PFYpv+xcgO4KgrQ06Ek4E5kAxmsnb/ZI8Sp6uWldbYCoxTCj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268055257"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="268055257"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 09:05:21 -0700
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="654284462"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 09:05:21 -0700
Date: Thu, 5 May 2022 09:05:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH 1/2] drm/i915: Don't use DRM_DEBUG_WARN_ON for unexpected
 l3bank/mslice config
Message-ID: <YnP1v0sxrUMl/lOH@mdroper-desk1.amr.corp.intel.com>
References: <20220504120715.911045-1-tvrtko.ursulin@linux.intel.com>
 <YnKuX0F0bDBF5ahP@mdroper-desk1.amr.corp.intel.com>
 <12d849fb-3255-139a-7905-2d3dd679e3c8@linux.intel.com>
 <YnLDMANc6xdnjOdy@mdroper-desk1.amr.corp.intel.com>
 <a746320b-8431-a171-4c73-3ed64eedc726@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a746320b-8431-a171-4c73-3ed64eedc726@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 12:02:45PM +0100, Tvrtko Ursulin wrote:
> 
> On 04/05/2022 19:17, Matt Roper wrote:
> > On Wed, May 04, 2022 at 06:59:32PM +0100, Tvrtko Ursulin wrote:
> > > 
> > > On 04/05/2022 17:48, Matt Roper wrote:
> > > > On Wed, May 04, 2022 at 01:07:14PM +0100, Tvrtko Ursulin wrote:
> > > > > From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > 
> > > > > DRM_DEBUG_WARN_ON should only be used when we are certain CI is guaranteed
> > > > > to exercise a certain code path, so in case of values coming from MMIO
> > > > > reads we cannot be sure CI will have all the possible SKUs and parts.
> > > > > 
> > > > > Use drm_warn instead and move logging to init phase while at it.
> > > > 
> > > > Changing to drm_warn looks good, although moving the location changes
> > > > the intent a bit; I think originally the idea was to warn if we were
> > > > trying to do a steering lookup for a type that we never initialized
> > > > (e.g., an LNCF lookup for a !HAS_MSLICES platform where we never even
> > > > read the register in the first place).  But I don't think we've ever
> > > > made a mistake that would cause us to trip the warning, so it probably
> > > > isn't terribly important to keep it there.
> > > 
> > > Ah I see.. there we could put something like:
> > > 
> > > 	case MSLICE:
> > > 		GEM_WARN_ON(!HAS_MSLICES(...));
> > > 
> > 
> > Yeah, that would work for MSLICE and LNCF.  Although L3BANK is a bit
> > stranger since we have multiple platforms that obtain the L3 bank mask
> > in completely different ways (Xe_HP reads it from XEHP_FUSE4, whereas
> > gen11/gen12 reads it from GEN10_MIRROR_FUSE3).  We want to make sure
> > there that no matter which branch of init we take, we didn't forget to
> > initialize l3bank_mask somehow.
> 
> The two init paths are not something present in drm-tip at this point,
> right? At least I couldn't find it. In which case it could be handled later
> by moving the drm_warn to tail of intel_gt_init_mmio, give or take.

Oh, you're right.  The new fuse register actually shows up on a future
platform rather than Xe_HP so the two init paths aren't present yet.

> 
> Anyway, I've sent v2 out with your r-b and GEM_WARN_ON for mslice/lncf. I
> won't merge it though until you definitely are okay with it so please have a
> look and confirm.

Yeah, v2 looks fine.  Thanks.


Matt

> 
> Regards,
> 
> Tvrtko
> 
> 
> > 
> > Matt
> > 
> > > ?
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > 
> > > > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> > > > 
> > > > > 
> > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > ---
> > > > >    drivers/gpu/drm/i915/gt/intel_gt.c | 13 ++++++-------
> > > > >    1 file changed, 6 insertions(+), 7 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > index 53307ca0eed0..c474e5c3ea5e 100644
> > > > > --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> > > > > @@ -153,11 +153,14 @@ int intel_gt_init_mmio(struct intel_gt *gt)
> > > > >    	 * An mslice is unavailable only if both the meml3 for the slice is
> > > > >    	 * disabled *and* all of the DSS in the slice (quadrant) are disabled.
> > > > >    	 */
> > > > > -	if (HAS_MSLICES(i915))
> > > > > +	if (HAS_MSLICES(i915)) {
> > > > >    		gt->info.mslice_mask =
> > > > >    			slicemask(gt, GEN_DSS_PER_MSLICE) |
> > > > >    			(intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
> > > > >    			 GEN12_MEML3_EN_MASK);
> > > > > +		if (!gt->info.mslice_mask) /* should be impossible! */
> > > > > +			drm_warn(&i915->drm, "mslice mask all zero!\n");
> > > > > +	}
> > > > >    	if (IS_DG2(i915)) {
> > > > >    		gt->steering_table[MSLICE] = xehpsdv_mslice_steering_table;
> > > > > @@ -171,6 +174,8 @@ int intel_gt_init_mmio(struct intel_gt *gt)
> > > > >    		gt->info.l3bank_mask =
> > > > >    			~intel_uncore_read(gt->uncore, GEN10_MIRROR_FUSE3) &
> > > > >    			GEN10_L3BANK_MASK;
> > > > > +		if (!gt->info.l3bank_mask) /* should be impossible! */
> > > > > +			drm_warn(&i915->drm, "L3 bank mask is all zero!\n");
> > > > >    	} else if (HAS_MSLICES(i915)) {
> > > > >    		MISSING_CASE(INTEL_INFO(i915)->platform);
> > > > >    	}
> > > > > @@ -882,20 +887,14 @@ static void intel_gt_get_valid_steering(struct intel_gt *gt,
> > > > >    {
> > > > >    	switch (type) {
> > > > >    	case L3BANK:
> > > > > -		GEM_DEBUG_WARN_ON(!gt->info.l3bank_mask); /* should be impossible! */
> > > > > -
> > > > >    		*sliceid = 0;		/* unused */
> > > > >    		*subsliceid = __ffs(gt->info.l3bank_mask);
> > > > >    		break;
> > > > >    	case MSLICE:
> > > > > -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
> > > > > -
> > > > >    		*sliceid = __ffs(gt->info.mslice_mask);
> > > > >    		*subsliceid = 0;	/* unused */
> > > > >    		break;
> > > > >    	case LNCF:
> > > > > -		GEM_DEBUG_WARN_ON(!gt->info.mslice_mask); /* should be impossible! */
> > > > > -
> > > > >    		/*
> > > > >    		 * An LNCF is always present if its mslice is present, so we
> > > > >    		 * can safely just steer to LNCF 0 in all cases.
> > > > > -- 
> > > > > 2.32.0
> > > > > 
> > > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
