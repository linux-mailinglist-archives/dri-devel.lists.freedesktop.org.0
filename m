Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 254604D04EC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 18:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6D410E0AB;
	Mon,  7 Mar 2022 17:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE50510E0A7;
 Mon,  7 Mar 2022 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646672817; x=1678208817;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Q7L9xRf2tcVTTnr8FAf0+fsv+jV9fMqBAMn8Sjv0jng=;
 b=Z4lMqHsEPYk6NVhrxqKnX1YOV8U9qSGuig9hJOFl4R3/f91DAhYYIm7d
 ARz/PP32QFtw1KPVMlAsDd9ZR9/vZIRxbYvU4XTY27p5TWKtoM7X5Dw9k
 lUqSevXAI21ftONcJII2o2rQEQm+HR8NVh2HKd1hnvmcvMjuvbFzkc0gI
 VN8MKVjdAk1Tx+oRHJDxHNtTmhuNkZwjt8r93kvGBp1I+zgVrgN03/PU8
 nUtHHKOHUXD5c7jUYN/+Ne3kJvsLZbXhSTD1p2JRbhEX9p3I/2CkCLIxW
 HiU5Bkq7/tIhbHgakHIJhFQCdSu+znthAVT2PHOvCIcxnDUSy8Ot+9/Op w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="340880646"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="340880646"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 09:06:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="687605308"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga001.fm.intel.com with SMTP; 07 Mar 2022 09:06:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Mar 2022 19:06:54 +0200
Date: Mon, 7 Mar 2022 19:06:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 7/8] drm/i915: fixup the initial fb base on DG1
Message-ID: <YiY7riuJH2I1UbDB@intel.com>
References: <20220304172333.991778-1-matthew.auld@intel.com>
 <20220304172333.991778-8-matthew.auld@intel.com>
 <YiJpkwFRUHIAoh0F@intel.com>
 <ebfc9db8-e7b3-bb01-e96e-0b37f047bcd2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebfc9db8-e7b3-bb01-e96e-0b37f047bcd2@intel.com>
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

On Mon, Mar 07, 2022 at 10:32:36AM +0000, Matthew Auld wrote:
> On 04/03/2022 19:33, Ville Syrjälä wrote:
> > On Fri, Mar 04, 2022 at 05:23:32PM +0000, Matthew Auld wrote:
> >> The offset we get looks to be the exact start of DSM, but the
> >> inital_plane_vma expects the address to be relative.
> >>
> >> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> >> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> >> ---
> >>   .../drm/i915/display/intel_plane_initial.c    | 22 +++++++++++++++----
> >>   1 file changed, 18 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/i915/display/intel_plane_initial.c b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> index f797fcef18fc..b39d3a8dfe45 100644
> >> --- a/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> +++ b/drivers/gpu/drm/i915/display/intel_plane_initial.c
> >> @@ -56,10 +56,24 @@ initial_plane_vma(struct drm_i915_private *i915,
> >>   	if (!mem || plane_config->size == 0)
> >>   		return NULL;
> >>   
> >> -	base = round_down(plane_config->base,
> >> -			  I915_GTT_MIN_ALIGNMENT);
> >> -	size = round_up(plane_config->base + plane_config->size,
> >> -			mem->min_page_size);
> >> +	base = plane_config->base;
> >> +	if (IS_DGFX(i915)) {
> >> +		/*
> >> +		 * On discrete the base address should be somewhere in LMEM, but
> >> +		 * depending on the size of LMEM the base address might
> >> +		 * intersect with the start of DSM, like on DG1, in which case
> >> +		 * we need the relative address. In such cases we might also
> >> +		 * need to choose between inital fb vs fbc, if space is limited.
> >> +		 *
> >> +		 * On future discrete HW, like DG2, we should be able to just
> >> +		 * allocate directly from LMEM, due to larger LMEM size.
> >> +		 */
> >> +		if (base >= i915->dsm.start)
> >> +			base -= i915->dsm.start;
> > 
> > Subsequent code expects the object to actually be inside stolen.
> > If that is not the case we should just give up.
> 
> Thanks for taking a look at this. Is that subsequent code outside 
> initial_plane_vma()? In the next patch this is now using LMEM directly 
> for dg2. Would that blow up somewhere else?

It uses i915_gem_object_create_stolen_for_preallocated() which assumes
the stuff is inside stolen.

> > The fact that we fail to confirm any of that on integrated
> > parts has always bugged me, but not enough to actually do
> > anything about it. Such a check would be somewhat more involved
> > since we'd have to look at the PTEs. But on discrete sounds like
> > we can get away with a trivial check.
> 
> Which PTEs?

The PTEs the plane is actually using. We have no idea where they
actually point to and just assume they represent a 1:1 mapping of
stolen.

I suppose with lmem we'll just start assuming a 1:1 mapping of
the whole lmem rather than just stolen.

-- 
Ville Syrjälä
Intel
