Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC144D69CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 22:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7D010E5FF;
	Fri, 11 Mar 2022 21:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BFF10E5DD;
 Fri, 11 Mar 2022 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647032465; x=1678568465;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Be4FjX3l8sr19b+Qy6BxVGZVANHwMLrLPqfLJTQC/v4=;
 b=MSIAteFUSsr3rNMrgQtsqkzH7oZrD0GKGWjP+lzZWbNlf7+UkmOdxeXq
 kJ4XZpSCikK2NjFmHwWKqoLuP26xQUTmE/dER1EY8YCCOXdFW3qHN7Ho0
 XnH+ggINLj+whxunauutkMVXp2A6YkPVkY0xP6m1SGeMGmm7pG11BON4j
 MkrRczmnnHqYRQLmYoHCA2sIrAaA+SHHc3sBAUELhEU3Oep22qCclAOoY
 4mpKlNQz/yjiz7lMZ2UpJcNUCamJy/APmvznNz+DsM4mGoVz5e8qvxzYb
 Qy2ZGC82OWvyGId0GbDdLt5UCahQIt9ypoF60ifU1z06gmNUBH4Fj/D6u g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="237825040"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="237825040"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2022 13:01:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; d="scan'208";a="633535707"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by FMSMGA003.fm.intel.com with SMTP; 11 Mar 2022 13:01:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Mar 2022 23:01:01 +0200
Date: Fri, 11 Mar 2022 23:01:01 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/sseu: Don't overallocate
 subslice storage
Message-ID: <Yiu4jTnBiZbHla/M@intel.com>
References: <20220311061543.153611-1-matthew.d.roper@intel.com>
 <20220311190009.t54vclg3ywp3de6x@ldmartin-desk2>
 <YiuzN5iZRMXfroVR@mdroper-desk1.amr.corp.intel.com>
 <Yiu0fIwiRNfPWqVI@mdroper-desk1.amr.corp.intel.com>
 <20220311205233.gouq77jvvxv73tie@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220311205233.gouq77jvvxv73tie@ldmartin-desk2>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 11, 2022 at 12:52:33PM -0800, Lucas De Marchi wrote:
> On Fri, Mar 11, 2022 at 12:43:40PM -0800, Matt Roper wrote:
> >On Fri, Mar 11, 2022 at 12:38:17PM -0800, Matt Roper wrote:
> >> On Fri, Mar 11, 2022 at 11:00:09AM -0800, Lucas De Marchi wrote:
> >> > On Thu, Mar 10, 2022 at 10:15:42PM -0800, Matt Roper wrote:
> >> > > Xe_HP removed "slice" as a first-class unit in the hardware design.
> >> > > Instead we now have a single pool of subslices (which are now referred
> >> > > to as "DSS") that different hardware units have different ways of
> >> > > grouping ("compute slices," "geometry slices," etc.).  For the purposes
> >> > > of topology representation, we treat Xe_HP-based platforms as having a
> >> > > single slice that contains all of the platform's DSS.  There's no need
> >> > > to allocate storage space for (max legacy slices * max dss); let's
> >> > > update some of our macros to minimize the storage requirement for sseu
> >> > > topology.  We'll also document some of the constants to make it a little
> >> > > bit more clear what they represent.
> >> > >
> >> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >> > > ---
> >> > > drivers/gpu/drm/i915/gt/intel_engine_types.h |  2 +-
> >> > > drivers/gpu/drm/i915/gt/intel_sseu.h         | 47 +++++++++++++++-----
> >> > > 2 files changed, 36 insertions(+), 13 deletions(-)
> >> > >
> >> > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> >> > > index 4fbf45a74ec0..f9e246004bc0 100644
> >> > > --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> >> > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> >> > > @@ -645,7 +645,7 @@ intel_engine_has_relative_mmio(const struct intel_engine_cs * const engine)
> >> > >
> >> > > #define for_each_instdone_gslice_dss_xehp(dev_priv_, sseu_, iter_, gslice_, dss_) \
> >> > > 	for ((iter_) = 0, (gslice_) = 0, (dss_) = 0; \
> >> > > -	     (iter_) < GEN_MAX_SUBSLICES; \
> >> > > +	     (iter_) < GEN_SS_MASK_SIZE; \
> >> > > 	     (iter_)++, (gslice_) = (iter_) / GEN_DSS_PER_GSLICE, \
> >> > > 	     (dss_) = (iter_) % GEN_DSS_PER_GSLICE) \
> >> > > 		for_each_if(intel_sseu_has_subslice((sseu_), 0, (iter_)))
> >> > > diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
> >> > > index 8a79cd8eaab4..4f59eadbb61a 100644
> >> > > --- a/drivers/gpu/drm/i915/gt/intel_sseu.h
> >> > > +++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
> >> > > @@ -15,26 +15,49 @@ struct drm_i915_private;
> >> > > struct intel_gt;
> >> > > struct drm_printer;
> >> > >
> >> > > -#define GEN_MAX_SLICES		(3) /* SKL upper bound */
> >> > > -#define GEN_MAX_SUBSLICES	(32) /* XEHPSDV upper bound */
> >> > > -#define GEN_SSEU_STRIDE(max_entries) DIV_ROUND_UP(max_entries, BITS_PER_BYTE)
> >> > > -#define GEN_MAX_SUBSLICE_STRIDE GEN_SSEU_STRIDE(GEN_MAX_SUBSLICES)
> >> > > -#define GEN_MAX_EUS		(16) /* TGL upper bound */
> >> > > -#define GEN_MAX_EU_STRIDE GEN_SSEU_STRIDE(GEN_MAX_EUS)
> >> > > +/*
> >> > > + * Maximum number of legacy slices.  Legacy slices no longer exist starting on
> >> > > + * Xe_HP ("gslices," "cslices," etc. on Xe_HP and beyond are a different
> >> > > + * concept and are not expressed through fusing).
> >> > > + */
> >> > > +#define GEN_MAX_LEGACY_SLICES		3
> >> > > +
> >> > > +/*
> >> > > + * Maximum number of subslices that can exist within a legacy slice.  This is
> >> > > + * only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the GEN_MAX_DSS
> >> > > + * value below).
> >> > > + */
> >> > > +#define GEN_MAX_LEGACY_SUBSLICES	6
> >> >
> >> > instead of calling the old legacy, maybe just add the XEHP_ prefix to
> >> > the new ones?
> >>
> >> Maybe a "HSW_" prefix on the old ones would be better?  People still use
> >> the termm 'subslice' in casual discussion when talking about DSS, so I
> >> want to somehow distinguish that what we're talking about here is a
> >> different, older design than we have on modern platforms.
> >
> >Hmm, or maybe just "GEN_MAX_SUBSLICES_PER_LEGACY_SLICE" to tie it into
> >the slice definition above?
> 
> I'm not too fond of calling it "legacy" when everywhere else in the driver
> we just use the platform as prefix/suffix. Some may see legacy as
> < ver 12, others as 12.50, etc.

Everything will become legacy at some point. This kind of naming
scheme falls apart when the next shiny new thing comes around
and we end up with multiple different leagacies. Are we going
to have ANCIENT_LEGACY, RECENT_LEGACY, NOT_YET_LEGACY etc?

-- 
Ville Syrjälä
Intel
