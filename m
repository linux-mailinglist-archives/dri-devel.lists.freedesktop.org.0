Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427AF4D06BF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 19:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 459B910E11F;
	Mon,  7 Mar 2022 18:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A91E10E114;
 Mon,  7 Mar 2022 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646678505; x=1678214505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bKurKu/gaucVTQeCu5Tt6+HPvUaaXxw0gooyFdcfM4Q=;
 b=nKc9dkvAeLm0AaMLFgEqfKSXZz774FMon/49oCACti7MfUDjK60+UPw5
 c9N0tQy34HzFmBb3q7tjiRMDlIsLjbTuv4CYwEx/MzaPrna1jut2QV4ZK
 Eg/gO/EEoAR/+x9P9iE6jTV+34K0DCzS5yNHOrtxvlWOpLLq1SibYHpoc
 IZnWpLfIsVfXWJal3lsXH/1F25ukwADKi8TvbRtdQ1EsnL4Y8sw1JKJiJ
 S9y/9gB+e+VrcJC4M7nk9013EROKDHAsPuYywFOJQkf4oXmg6D30c6MuK
 PXkEpUbHcASCNrs8sZciL2fnCRzgYqH3s7CaNB0/7MrcwMEYbIXdz+HtM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="241905051"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="241905051"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="546982712"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 07 Mar 2022 10:41:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Mar 2022 20:41:15 +0200
Date: Mon, 7 Mar 2022 20:41:15 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
Message-ID: <YiZRy78PW2n2I/HB@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
 <20220304172333.991778-8-matthew.auld@intel.com>
 <YiJpkwFRUHIAoh0F@intel.com>
 <ebfc9db8-e7b3-bb01-e96e-0b37f047bcd2@intel.com>
 <YiY7riuJH2I1UbDB@intel.com>
 <476964f2-772f-b734-1a17-8e65c74b309c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <476964f2-772f-b734-1a17-8e65c74b309c@intel.com>
X-Patchwork-Hint: comment
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 06:26:32PM +0000, Matthew Auld wrote:
> On 07/03/2022 17:06, Ville Syrjälä wrote:
> > On Mon, Mar 07, 2022 at 10:32:36AM +0000, Matthew Auld wrote:
> >> On 04/03/2022 19:33, Ville Syrjälä wrote:
> >>> On Fri, Mar 04, 2022 at 05:23:32PM +0000, Matthew Auld wrote:
> >>>> The offset we get looks to be the exact start of DSM, but the
> >>>> inital_plane_vma expects the address to be relative.
> >>>>
> >>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >>>> ---
> >>>>    .../drm/i915/display/intel_plane_initial.c    | 22 +++++++++++++++----
> >>>>    1 file changed, 18 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >>>> index f797fcef18fc..b39d3a8dfe45 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >>>> @@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i915,
> >>>>    	if (!mem || plane_config->size == 0)
> >>>>    		return NULL;
> >>>>    
> >>>> -	base = round_down(plane_config->base,
> >>>> -			  I915_GTT_MIN_ALIGNMENT);
> >>>> -	size = round_up(plane_config->base + plane_config->size,
> >>>> -			mem->min_page_size);
> >>>> +	base = plane_config->base;
> >>>> +	if (IS_DGFX(i915)) {
> >>>> +		/*
> >>>> +		 * On discrete the base address should be somewhere in LMEM, but
> >>>> +		 * depending on the size of LMEM the base address might
> >>>> +		 * intersect with the start of DSM, like on DG1, in which case
> >>>> +		 * we need the relative address. In such cases we might also
> >>>> +		 * need to choose between inital fb vs fbc, if space is limited.
> >>>> +		 *
> >>>> +		 * On future discrete HW, like DG2, we should be able to just
> >>>> +		 * allocate directly from LMEM, due to larger LMEM size.
> >>>> +		 */
> >>>> +		if (base >= i915->dsm.start)
> >>>> +			base -= i915->dsm.start;
> >>>
> >>> Subsequent code expects the object to actually be inside stolen.
> >>> If that is not the case we should just give up.
> >>
> >> Thanks for taking a look at this. Is that subsequent code outside
> >> initial_plane_vma()? In the next patch this is now using LMEM directly
> >> for dg2. Would that blow up somewhere else?
> > 
> > It uses i915_gem_object_create_stolen_for_preallocated() which assumes
> > the stuff is inside stolen.
> 
> At the start of the series that gets ripped out and replaced with 
> i915_gem_object_create_region_at(), where we can now just pass in the 
> intel_memory_region, and the backend hopefully takes care of the rest.

Why? Is the BIOS no longer allocating its fbs from stolen?

> 
> > 
> >>> The fact that we fail to confirm any of that on integrated
> >>> parts has always bugged me, but not enough to actually do
> >>> anything about it. Such a check would be somewhat more involved
> >>> since we'd have to look at the PTEs. But on discrete sounds like
> >>> we can get away with a trivial check.
> >>
> >> Which PTEs?
> > 
> > The PTEs the plane is actually using. We have no idea where they
> > actually point to and just assume they represent a 1:1 mapping of
> > stolen.
> > 
> > I suppose with lmem we'll just start assuming a 1:1 mapping of
> > the whole lmem rather than just stolen.
> 
> So IIUC the base that we read is actually some GGTT address(I guess it 
> comes pre-programmed or something?), and that hopefully 1:1 maps to 
> stolen. Ok, so as you say, I guess we only want to subtract the 
> dsm.start for the physical allocation, and not the GGTT address, when 
> dealing with stolen lmem.
> 
> > 

-- 
Ville Syrjälä
Intel
