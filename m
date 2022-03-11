Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BE4D69DD
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F116C10E526;
	Fri, 11 Mar 2022 21:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B1110E32D;
 Fri, 11 Mar 2022 21:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647033100; x=1678569100;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jIj/TmhOfJe4tgDCZpdAyXX07YSLCn4OkzsEjEBMiXA=;
 b=HQEb9RAc02+WA+fP6xZVdLrwSP3vwi+o+URFuaAxQrWPflZQJ0Eb1nai
 YnMctbkOhMCFZ0sNZG59Mq9YnXjIZ57QTM22pk/eWOIGdUBIxmD5S6qW9
 Pn2qCnUfWI5BSEKxYlRdiozIzJphh+pZ34p6zZT/TMrxxzHasCCh6gtRE
 fjsGITdIEj/6YO1vVmrObwItZ+vExsVPLmYutoErpOmS4GKV5vkLpZFw+
 VdOM6nkR2Uzz4TjjbBnrSvj0rHgktcDruUcc7EUFC1mVuccoHfWRxrjdu
 MtIeSjBUmD+70NUo6Jl9Ez0WTzoLhEfWkCmTTSC9UDrlmixKwlO7eALhN A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="254483575"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="254483575"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 13:11:40 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="496882794"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 13:11:39 -0800
Date: Fri, 11 Mar 2022 13:11:38 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/sseu: Don't overallocate
 subslice storage
Message-ID: <Yiu7CmZHKfYphUCR@mdroper-desk1.amr.corp.intel.com>
References: <20220311061543.153611-1-matthew.d.roper@intel.com>
 <20220311190009.t54vclg3ywp3de6x@ldmartin-desk2>
 <YiuzN5iZRMXfroVR@mdroper-desk1.amr.corp.intel.com>
 <Yiu0fIwiRNfPWqVI@mdroper-desk1.amr.corp.intel.com>
 <20220311205233.gouq77jvvxv73tie@ldmartin-desk2>
 <Yiu4jTnBiZbHla/M@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yiu4jTnBiZbHla/M@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 11:01:01PM +0200, Ville Syrjälä wrote:
> On Fri, Mar 11, 2022 at 12:52:33PM -0800, Lucas De Marchi wrote:
> > On Fri, Mar 11, 2022 at 12:43:40PM -0800, Matt Roper wrote:
> > >On Fri, Mar 11, 2022 at 12:38:17PM -0800, Matt Roper wrote:
> > >> On Fri, Mar 11, 2022 at 11:00:09AM -0800, Lucas De Marchi wrote:
> > >> > On Thu, Mar 10, 2022 at 10:15:42PM -0800, Matt Roper wrote:
> > >> > > Xe_HP removed "slice" as a first-class unit in the hardware design.
> > >> > > Instead we now have a single pool of subslices (which are now referred
> > >> > > to as "DSS") that different hardware units have different ways of
> > >> > > grouping ("compute slices," "geometry slices," etc.).  For the purposes
> > >> > > of topology representation, we treat Xe_HP-based platforms as having a
> > >> > > single slice that contains all of the platform's DSS.  There's no need
> > >> > > to allocate storage space for (max legacy slices * max dss); let's
> > >> > > update some of our macros to minimize the storage requirement for sseu
> > >> > > topology.  We'll also document some of the constants to make it a little
> > >> > > bit more clear what they represent.
> > >> > >
> > >> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > >> > > ---
> > >> > > drivers/gpu/drm/i915/gt/intel_engine_types.h |  2 +-
> > >> > > drivers/gpu/drm/i915/gt/intel_sseu.h         | 47 +++++++++++++++-----
> > >> > > 2 files changed, 36 insertions(+), 13 deletions(-)
> > >> > >
> > >> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > >> > > index 4fbf45a74ec0..f9e246004bc0 100644
> > >> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > >> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> > >> > > @@ -645,7 +645,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
> > >> > >
> > >> > > #define for_each_instdone_gslice_dss_xehp(dev_priv_, sseu_, iter_, gslice_, dss_) \
> > >> > > 	for ((iter_) = 0, (gslice_) = 0, (dss_) = 0; \
> > >> > > -	     (iter_) < GEN_MAX_SUBSLICES; \
> > >> > > +	     (iter_) < GEN_SS_MASK_SIZE; \
> > >> > > 	     (iter_)++, (gslice_) = (iter_) / GEN_DSS_PER_GSLICE, \
> > >> > > 	     (dss_) = (iter_) % GEN_DSS_PER_GSLICE) \
> > >> > > 		for_each_if(intel_sseu_has_subslice((sseu_), 0, (iter_)))
> > >> > > diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> > >> > > index 8a79cd8eaab4..4f59eadbb61a 100644
> > >> > > --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> > >> > > +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> > >> > > @@ -15,26 +15,49 @@ struct drm_i915_private;
> > >> > > struct intel_gt;
> > >> > > struct drm_printer;
> > >> > >
> > >> > > -#define GEN_MAX_SLICES		(3) /* SKL upper bound */
> > >> > > -#define GEN_MAX_SUBSLICES	(32) /* XEHPSDV upper bound */
> > >> > > -#define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
> > >> > > -#define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
> > >> > > -#define GEN_MAX_EUS		(16) /* TGL upper bound */
> > >> > > -#define GEN_MAX_EU_STRIDE GEN_SSEU_STRIDE(GEN_MAX_EUS)
> > >> > > +/*
> > >> > > + * Maximum number of legacy slices.  Legacy slices no longer exist starting on
> > >> > > + * Xe_HP ("gslices," "cslices," etc. on Xe_HP and beyond are a different
> > >> > > + * concept and are not expressed through fusing).
> > >> > > + */
> > >> > > +#define GEN_MAX_LEGACY_SLICES		3
> > >> > > +
> > >> > > +/*
> > >> > > + * Maximum number of subslices that can exist within a legacy slice.  This is
> > >> > > + * only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the GEN_MAX_DSS
> > >> > > + * value below).
> > >> > > + */
> > >> > > +#define GEN_MAX_LEGACY_SUBSLICES	6
> > >> >
> > >> > instead of calling the old legacy, maybe just add the XEHP_ prefix to
> > >> > the new ones?
> > >>
> > >> Maybe a "HSW_" prefix on the old ones would be better?  People still use
> > >> the termm 'subslice' in casual discussion when talking about DSS, so I
> > >> want to somehow distinguish that what we're talking about here is a
> > >> different, older design than we have on modern platforms.
> > >
> > >Hmm, or maybe just "GEN_MAX_SUBSLICES_PER_LEGACY_SLICE" to tie it into
> > >the slice definition above?
> > 
> > I'm not too fond of calling it "legacy" when everywhere else in the driver
> > we just use the platform as prefix/suffix. Some may see legacy as
> > < ver 12, others as 12.50, etc.
> 
> Everything will become legacy at some point. This kind of naming
> scheme falls apart when the next shiny new thing comes around
> and we end up with multiple different leagacies. Are we going
> to have ANCIENT_LEGACY, RECENT_LEGACY, NOT_YET_LEGACY etc?

Well that's kind of the point --- there is no shiny new thing and never
will be.  "slice" is gone for good and the places we use the term are
_not_ the same thing as similar-sounding terms like gslice, cslice,
mslice, etc.

But I'll go ahead and switch it to "HSW_" and hope people figure out
that it stops being a meaningful concept Xe_HP.


Matt

> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
