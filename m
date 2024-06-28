Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFA691C077
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 16:08:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2054110E135;
	Fri, 28 Jun 2024 14:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enjNmCvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175AA10E123;
 Fri, 28 Jun 2024 14:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719583732; x=1751119732;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=eLsYqIfzI+1FyKqq+zo3Wb6uRsnTNJpEftvwhUyaVv0=;
 b=enjNmCvTUbMXPceubPw+bGusV3B4vfAo+pyfOGFvypBYU1QatqiIazjJ
 09Rnj5WHIr8ZUYV+7IbIZDla1f8DSsvxJWWLirb1KuDNvTwe0LXr32PJd
 je6wIJwN8s5YbQpkXCtxwbc3AzPb7WYSyiVJnTHsRn6Xs2eJHIrt5i7jB
 h61KtcnxHi9AA1wUqYtohfBj69hy9rVk2Kb+MxRaYhmRZ+ZarPvhjdNEk
 5FjcBsZAomY5Gt7ac9SkXjG7886HfmnbUbxpeMZ+aSnk2DuBBEvtxmP8v
 EoepXECRLXHTMIY4PIG63q0sTdszj7vD6saVw718hHCxPOH/9I7PZ31OK w==;
X-CSE-ConnectionGUID: bWTLwEWNRom2x9wv/5lk3A==
X-CSE-MsgGUID: je9FYJLgQOK4ETQUgOncGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="19669050"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="19669050"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 07:08:51 -0700
X-CSE-ConnectionGUID: btw/6GdgSbuDL2lanA+iMA==
X-CSE-MsgGUID: ZxKemamYRkeT7bbUe4GSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="75483763"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 07:08:51 -0700
Date: Fri, 28 Jun 2024 17:09:01 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm: Add helpers for x16 fixed point values
Message-ID: <Zn7D/d9V1tcFy/T1@ideak-desk.fi.intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
 <20240614173911.3743172-2-imre.deak@intel.com>
 <87cyodfdku.fsf@intel.com>
 <ZnLIe+YFkDpMcXF7@ideak-desk.fi.intel.com>
 <875xtucs05.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875xtucs05.fsf@intel.com>
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

On Thu, Jun 27, 2024 at 06:41:46PM +0300, Jani Nikula wrote:
> On Wed, 19 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> > On Wed, Jun 19, 2024 at 01:10:09PM +0300, Jani Nikula wrote:
> >> On Fri, 14 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> >> > Add helpers to convert between x16 fixed point and integer/fraction
> >> > values. Also add the format/argument macros required to printk x16
> >> > fixed point variables.
> >> >
> >> > These are needed by later patches dumping the Display Stream Compression
> >> > configuration in DRM core and in the i915 driver to replace the
> >> > corresponding bpp_x16 helpers defined locally in the driver.
> >> >
> >> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
> >> >  include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
> >> >  2 files changed, 26 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> >> > index 79a615667aab1..806f9c9764995 100644
> >> > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> >> > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> >> > @@ -35,6 +35,7 @@
> >> >  #include <drm/display/drm_dp_helper.h>
> >> >  #include <drm/display/drm_dp_mst_helper.h>
> >> >  #include <drm/drm_edid.h>
> >> > +#include <drm/drm_fixed.h>
> >> >  #include <drm/drm_print.h>
> >> >  #include <drm/drm_vblank.h>
> >> >  #include <drm/drm_panel.h>
> >> > @@ -4151,9 +4152,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
> >> >  	int symbol_cycles;
> >> >  
> >> >  	if (lane_count == 0 || hactive == 0 || bpp_x16 == 0) {
> >> > -		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 %d.%04d\n",
> >> > +		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " DRM_X16_FMT "\n",
> >> >  			      lane_count, hactive,
> >> > -			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
> >> > +			      DRM_X16_ARGS(bpp_x16));
> >> >  		return 0;
> >> >  	}
> >> >  
> >> > diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> >> > index 81572d32db0c2..0fe2a7f50d54e 100644
> >> > --- a/include/drm/drm_fixed.h
> >> > +++ b/include/drm/drm_fixed.h
> >> > @@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
> >> >  	return sum;
> >> >  }
> >> >  
> >> > +static inline int drm_x16_from_int(int val_int)
> >> > +{
> >> > +	return val_int << 4;
> >> > +}
> >> > +
> >> > +static inline int drm_x16_to_int(int val_x16)
> >> > +{
> >> > +	return val_x16 >> 4;
> >> > +}
> >> > +
> >> > +static inline int drm_x16_to_int_roundup(int val_x16)
> >> > +{
> >> > +	return (val_x16 + 0xf) >> 4;
> >> > +}
> >> > +
> >> > +static inline int drm_x16_to_frac(int val_x16)
> >> > +{
> >> > +	return val_x16 & 0xf;
> >> > +}
> >> 
> >> Sad trombone about the completely different naming scheme compared to
> >> the rest of the file.
> >> 
> >> Not saying the existing naming is great, but neither is this. And
> >> there's no way to unify except by renaming *both* afterwards.
> >> 
> >> We could devise a scheme now that could be used for the existing stuff
> >> later, without renaming the new stuff.
> >
> > Based on [1]'s short variant, we could have:
> >
> > dfixed*(fixed20_12 v)  -> drm_uq12*(drm_uq20_12_t v)
> > drm_fixp*(s64 v)       -> drm_q32*(s64 v)
> > drm_x16*(int v)        -> drm_q4*(int v)
> 
> I like it. If you're brave, add them with a generic prefix instead of
> drm_ from the start, say fp_q4. ;)

Ok will do that, but using fxp_q4 is clearer I think.

> 
> BR,
> Jani.
> 
> >
> > Or instead of uq12/q32/q4 using ufp12/fp32/fp4.
> >
> > [1] https://en.wikipedia.org/wiki/Q_(number_format)
> >
> >> *shrug*
> >> 
> >> BR,
> >> Jani.
> >> 
> >> 
> >> 
> >> > +
> >> > +#define DRM_X16_FMT		"%d.%04d"
> >> > +#define DRM_X16_ARGS(val_x16)	drm_x16_to_int(val_x16), (drm_x16_to_frac(val_x16) * 625)
> >> > +
> >> >  #endif
> >> 
> >> -- 
> >> Jani Nikula, Intel
> 
> -- 
> Jani Nikula, Intel
