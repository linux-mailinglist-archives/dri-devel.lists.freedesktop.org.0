Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AD4916DC2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 18:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F248510E0BC;
	Tue, 25 Jun 2024 16:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ly37V8fD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7EB10E00D;
 Tue, 25 Jun 2024 16:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719331674; x=1750867674;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=MDgdxgNl7MSkNCU0L3Dcb/XaLLUfRK22cgDOD/rKEhQ=;
 b=Ly37V8fD2SdvcxQfJaxemoAftkF7L9WXVnQpGaJSj0St0Hs8mgSTJtnK
 Qw8F5oG9za1bIjaG7Cf5dbpt67yEqrtLc5lyajGsAR2UNbzznOLA9CZGx
 9+t3HTexFBZYQ9P3WYHGfJa2tWi/VhwKTIeRifLl3Mit4i1B+fE2doi6Q
 O8KADrKGxoM0KiHXUSEf6ZHFtC1RzEnOnfA6cIdRNve5B/ayylOtpsKPW
 6WImfIXUY26ujGOqQqSzxgtUYkYwAm4CKqvlr5XyaPheM+zu1ZTWn9H+4
 ikfT5UWJtaOV5Lvjr65Ra33ju770w+Wl0eWIqmgvpIq6gnHZJsRpxKKMU w==;
X-CSE-ConnectionGUID: GQp/qJtBTRmc2FZkmwzwlg==
X-CSE-MsgGUID: BWpAFWtwQWik7sdWpy0Qiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16185188"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="16185188"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:07:53 -0700
X-CSE-ConnectionGUID: IJL50wMzRRy+Q60XcZuVIQ==
X-CSE-MsgGUID: LseDVwa9SpGVEV4DGfraTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43668969"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 09:07:51 -0700
Date: Tue, 25 Jun 2024 19:08:01 +0300
From: Imre Deak <imre.deak@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/9] drm: Add helpers for x16 fixed point values
Message-ID: <ZnrrYYmjl+ijAFyS@ideak-desk.fi.intel.com>
References: <20240614173911.3743172-1-imre.deak@intel.com>
 <20240614173911.3743172-2-imre.deak@intel.com>
 <87cyodfdku.fsf@intel.com>
 <ZnLIe+YFkDpMcXF7@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnLIe+YFkDpMcXF7@ideak-desk.fi.intel.com>
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

On Wed, Jun 19, 2024 at 03:01:03PM +0300, Imre Deak wrote:
> On Wed, Jun 19, 2024 at 01:10:09PM +0300, Jani Nikula wrote:
> > On Fri, 14 Jun 2024, Imre Deak <imre.deak@intel.com> wrote:
> > > Add helpers to convert between x16 fixed point and integer/fraction
> > > values. Also add the format/argument macros required to printk x16
> > > fixed point variables.
> > >
> > > These are needed by later patches dumping the Display Stream Compression
> > > configuration in DRM core and in the i915 driver to replace the
> > > corresponding bpp_x16 helpers defined locally in the driver.
> > >
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_helper.c |  5 +++--
> > >  include/drm/drm_fixed.h                 | 23 +++++++++++++++++++++++
> > >  2 files changed, 26 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> > > index 79a615667aab1..806f9c9764995 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> > > @@ -35,6 +35,7 @@
> > >  #include <drm/display/drm_dp_helper.h>
> > >  #include <drm/display/drm_dp_mst_helper.h>
> > >  #include <drm/drm_edid.h>
> > > +#include <drm/drm_fixed.h>
> > >  #include <drm/drm_print.h>
> > >  #include <drm/drm_vblank.h>
> > >  #include <drm/drm_panel.h>
> > > @@ -4151,9 +4152,9 @@ int drm_dp_bw_overhead(int lane_count, int hactive,
> > >  	int symbol_cycles;
> > >  
> > >  	if (lane_count == 0 || hactive == 0 || bpp_x16 == 0) {
> > > -		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 %d.%04d\n",
> > > +		DRM_DEBUG_KMS("Invalid BW overhead params: lane_count %d, hactive %d, bpp_x16 " DRM_X16_FMT "\n",
> > >  			      lane_count, hactive,
> > > -			      bpp_x16 >> 4, (bpp_x16 & 0xf) * 625);
> > > +			      DRM_X16_ARGS(bpp_x16));
> > >  		return 0;
> > >  	}
> > >  
> > > diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
> > > index 81572d32db0c2..0fe2a7f50d54e 100644
> > > --- a/include/drm/drm_fixed.h
> > > +++ b/include/drm/drm_fixed.h
> > > @@ -214,4 +214,27 @@ static inline s64 drm_fixp_exp(s64 x)
> > >  	return sum;
> > >  }
> > >  
> > > +static inline int drm_x16_from_int(int val_int)
> > > +{
> > > +	return val_int << 4;
> > > +}
> > > +
> > > +static inline int drm_x16_to_int(int val_x16)
> > > +{
> > > +	return val_x16 >> 4;
> > > +}
> > > +
> > > +static inline int drm_x16_to_int_roundup(int val_x16)
> > > +{
> > > +	return (val_x16 + 0xf) >> 4;
> > > +}
> > > +
> > > +static inline int drm_x16_to_frac(int val_x16)
> > > +{
> > > +	return val_x16 & 0xf;
> > > +}
> > 
> > Sad trombone about the completely different naming scheme compared to
> > the rest of the file.
> > 
> > Not saying the existing naming is great, but neither is this. And
> > there's no way to unify except by renaming *both* afterwards.
> > 
> > We could devise a scheme now that could be used for the existing stuff
> > later, without renaming the new stuff.
> 
> Based on [1]'s short variant, we could have:
> 
> dfixed*(fixed20_12 v)  -> drm_uq12*(drm_uq20_12_t v)
> drm_fixp*(s64 v)       -> drm_q32*(s64 v)
> drm_x16*(int v)        -> drm_q4*(int v)
> 
> Or instead of uq12/q32/q4 using ufp12/fp32/fp4.

Jani, any objection to using the drm_fp4_from_int() etc. names?

> [1] https://en.wikipedia.org/wiki/Q_(number_format)
> 
> > *shrug*
> > 
> > BR,
> > Jani.
> > 
> > 
> > 
> > > +
> > > +#define DRM_X16_FMT		"%d.%04d"
> > > +#define DRM_X16_ARGS(val_x16)	drm_x16_to_int(val_x16), (drm_x16_to_frac(val_x16) * 625)
> > > +
> > >  #endif
> > 
> > -- 
> > Jani Nikula, Intel
