Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D7FA33A05
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 09:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB1B10E297;
	Thu, 13 Feb 2025 08:32:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ePNp2+j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29DF10E03A;
 Thu, 13 Feb 2025 08:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739435538; x=1770971538;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=qBHHjVwD7FVC2V58nUn1U4BW00Ndof25mrZyHMARUH8=;
 b=ePNp2+j3hDVMHAYAf72dLzztHnHu95Z4TuXVJxInRR91hvlBYoSNUJec
 PmqAWqLlQpkiQr2yJX6Ebh24/wKVYdPSuAYCE87ySJpqczkotQAnZ6ltS
 acnESpF4bJvlyco4hbgJxOjvXr6wxlozgcPVqSzB0iVT+YMg0xerm0fI3
 p/dHmNo8+LDgAXaakLCrHmWsGKXKp9OI/c0XX237ArA0NflGz60Tm3WNX
 vzw7xDU4lD+C8O3UaOmTQmSgufvDSFe5gPJA7HBXyGIZeXpAQiHI7fpUl
 Nmsp5G/Q9bURGkEd1Wz8EXFwYG03+orliCUFGoH8BFozVnVmxikc/tJJB A==;
X-CSE-ConnectionGUID: 2MzrzYHbTQepOe/I+uGGyA==
X-CSE-MsgGUID: N/SGW0CqSQWV9TrFq9q3rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40242246"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40242246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 00:32:17 -0800
X-CSE-ConnectionGUID: UYPsP8FySCKaNNJbWZRkHw==
X-CSE-MsgGUID: na6lZiTvT0a2apfYSvO5wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="112937139"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 00:32:14 -0800
Date: Thu, 13 Feb 2025 10:33:11 +0200
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH] drm: Fix DSC BPP increment decoding
Message-ID: <Z62uR0dPIphkgb8z@ideak-desk.fi.intel.com>
References: <20250212161851.4007005-1-imre.deak@intel.com>
 <87h64zyutr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h64zyutr.fsf@intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 12, 2025 at 06:46:40PM +0200, Jani Nikula wrote:
> On Wed, 12 Feb 2025, Imre Deak <imre.deak@intel.com> wrote:
> > Starting with DPCD version 2.0 bits 6:3 of the DP_DSC_BITS_PER_PIXEL_INC
> > DPCD register contains the NativeYCbCr422_MAX_bpp_DELTA field, which can
> > be non-zero as opposed to earlier DPCD versions, hence decoding the
> > bit_per_pixel increment value at bits 2:0 in the same register requires
> > applying a mask, do so.
> >
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Fixes: 0c2287c96521 ("drm/display/dp: Add helper function to get DSC bpp precision")
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks, patch is pushed to drm-misc-fixes.

> But we should really clean up the macros:
> 
> #define DP_DSC_BITS_PER_PIXEL_INC           0x06F
> # define DP_DSC_RGB_YCbCr444_MAX_BPP_DELTA_MASK 0x1f
> # define DP_DSC_RGB_YCbCr420_MAX_BPP_DELTA_MASK 0xe0
> 
> These are both for DPCD 0x6e, not 0x6f. They're misleading here. And
> they should contain the /* DP 2.0 */ comment.
> 
> And a similar macro for 0x6f bits 6:3 could be added.

Ok, noted. Decoding and using these caps is still missing, the above
could be fixed when adding that.

> 
> BR,
> Jani.
> 
> 
> > ---
> >  drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
> >  include/drm/display/drm_dp.h            | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > index c488d160a3c1f..f5c596234729d 100644
> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > @@ -2602,7 +2602,7 @@ u8 drm_dp_dsc_sink_bpp_incr(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE])
> >  {
> >  	u8 bpp_increment_dpcd = dsc_dpcd[DP_DSC_BITS_PER_PIXEL_INC - DP_DSC_SUPPORT];
> >  
> > -	switch (bpp_increment_dpcd) {
> > +	switch (bpp_increment_dpcd & DP_DSC_BITS_PER_PIXEL_MASK) {
> >  	case DP_DSC_BITS_PER_PIXEL_1_16:
> >  		return 16;
> >  	case DP_DSC_BITS_PER_PIXEL_1_8:
> > diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> > index 784a32bfbad8f..c413ef68f9a30 100644
> > --- a/include/drm/display/drm_dp.h
> > +++ b/include/drm/display/drm_dp.h
> > @@ -359,6 +359,7 @@
> >  # define DP_DSC_BITS_PER_PIXEL_1_4          0x2
> >  # define DP_DSC_BITS_PER_PIXEL_1_2          0x3
> >  # define DP_DSC_BITS_PER_PIXEL_1_1          0x4
> > +# define DP_DSC_BITS_PER_PIXEL_MASK         0x7
> >  
> >  #define DP_PSR_SUPPORT                      0x070   /* XXX 1.2? */
> >  # define DP_PSR_IS_SUPPORTED                1
> 
> -- 
> Jani Nikula, Intel
