Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE044E93B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D376ED8A;
	Fri, 12 Nov 2021 14:54:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351246ED83;
 Fri, 12 Nov 2021 14:54:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="296576949"
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="296576949"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2021 06:54:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,229,1631602800"; d="scan'208";a="453170148"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 12 Nov 2021 06:54:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 16:54:35 +0200
Date: Fri, 12 Nov 2021 16:54:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <YY6AK/sTiWooE+rQ@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
 <YY1H//+XISVMFZNL@intel.com>
 <edc4b80279354ec7bcdb0a890dae7d79@intel.com>
 <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a26ada6-feaa-76df-3ffe-d694e367d809@amd.com>
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
Cc: "Shashank.Sharma@amd.com" <Shashank.Sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sebastian@sebastianwick.net" <sebastian@sebastianwick.net>, "Shankar,
 Uma" <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 04:10:41PM -0500, Harry Wentland wrote:
> 
> 
> On 2021-11-11 15:42, Shankar, Uma wrote:
> > 
> > 
> >> -----Original Message-----
> >> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >> Sent: Thursday, November 11, 2021 10:13 PM
> >> To: Harry Wentland <harry.wentland@amd.com>
> >> Cc: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
> >> devel@lists.freedesktop.org; ppaalanen@gmail.com; brian.starkey@arm.com;
> >> sebastian@sebastianwick.net; Shashank.Sharma@amd.com
> >> Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct for
> >> HDR planes
> >>
> >> On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:
> >>>
> >>>
> >>> On 2021-09-06 17:38, Uma Shankar wrote:
> >>>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> >>>> planes have different capabilities, implemented respective structure
> >>>> for the HDR planes.
> >>>>
> >>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >>>> ---
> >>>>  drivers/gpu/drm/i915/display/intel_color.c | 52
> >>>> ++++++++++++++++++++++
> >>>>  1 file changed, 52 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> >>>> b/drivers/gpu/drm/i915/display/intel_color.c
> >>>> index afcb4bf3826c..6403bd74324b 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_color.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> >>>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state
> >> *crtc_state)
> >>>>  	}
> >>>>  }
> >>>>
> >>>> + /* FIXME input bpc? */
> >>>> +__maybe_unused
> >>>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> >>>> +	/* segment 1 */
> >>>> +	{
> >>>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>>> +		.count = 128,
> >>>> +		.input_bpc = 24, .output_bpc = 16,
> >>>> +		.start = 0, .end = (1 << 24) - 1,
> >>>> +		.min = 0, .max = (1 << 24) - 1,
> >>>> +	},
> >>>> +	/* segment 2 */
> >>>> +	{
> >>>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>>> +		.count = 1,
> >>>> +		.input_bpc = 24, .output_bpc = 16,
> >>>> +		.start = (1 << 24) - 1, .end = 1 << 24,
> >>>> +		.min = 0, .max = (1 << 27) - 1,
> >>>> +	},
> >>>> +	/* Segment 3 */
> >>>> +	{
> >>>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>>> +		.count = 1,
> >>>> +		.input_bpc = 24, .output_bpc = 16,
> >>>> +		.start = 1 << 24, .end = 3 << 24,
> >>>> +		.min = 0, .max = (1 << 27) - 1,
> >>>> +	},
> >>>> +	/* Segment 4 */
> >>>> +	{
> >>>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>>> +			  DRM_MODE_LUT_REUSE_LAST |
> >>>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>>> +		.count = 1,
> >>>> +		.input_bpc = 24, .output_bpc = 16,
> >>>> +		.start = 3 << 24, .end = 7 << 24,
> >>>> +		.min = 0, .max = (1 << 27) - 1,
> >>>> +	},
> >>>> +};
> >>>
> >>> If I understand this right, userspace would need this definition in
> >>> order to populate the degamma blob. Should this sit in a UAPI header?
> > 
> > Hi Harry, Pekka and Ville,
> > Sorry for being a bit late on the replies, got side tracked with various issues.
> > I am back on this. Apologies for delay.
> > 
> >> My original idea (not sure it's fully realized in this series) is to have a new
> >> GAMMA_MODE/etc. enum property on each crtc (or plane) for which each enum
> >> value points to a kernel provided blob that contains one of these LUT descriptors.
> >> Userspace can then query them dynamically and pick the best one for its current use
> >> case.
> > 
> > We have this as part of the series Ville. Patch 3 of this series creates a DEGAMMA_MODE
> > property just for this. With that userspace can just query the blob_id's and will get the
> > various degamma mode possible and the respective segment and lut distributions.
> > 
> > This will be generic, so for userspace it should just be able to query this and parse and get
> > the lut distribution and segment ranges.
> > 
> 
> Thanks for the explanation.
> 
> Uma, have you had a chance to sketch some of this out in IGT? I'm trying
> to see how userspace would do this in practice and will try to sketch an
> IGT test for this myself, but if you have it already we could share the
> effort.
> 
> >> The algorithm for choosing the best one might be something like:
> >> - prefer LUT with bpc >= FB bpc, but perhaps not needlessly high bpc
> >> - prefer interpolated vs. direct lookup based on current needs (eg. X
> >>   could prefer direct lookup to get directcolor visuals).
> >> - prefer one with extended range values if needed
> >> - for HDR prefer smaller step size in dark tones,
> >>   for SDR perhaps prefer a more uniform step size
> >>
> >> Or maybe we should include some kind of usage hints as well?
> > 
> > I think the segment range and distribution of lut should be enough for a userspace
> > to pick the right ones, but we can add some examples in UAPI descriptions as hints.
> > 
> 
> The range might be enough, but we're already parsing hints like "GAMMA"
> or "DEGAMMA". I wonder if it would make sense to add a flag for "HDR" or
> "SDR" as well.
> 
> >> And I was thinking of even adding a new property type (eg.
> >> ENUM_BLOB) just for this sort of usecase. That could let us have a bit more generic
> >> code to do all the validation around the property values and whatnot.
> >>
> >> The one nagging concern I really have with GAMMA_MODE is how a mix of old and
> >> new userspace would work. Though that is more of a generic issue with any new
> >> property really.
> > 
> > For plane properties getting added newly, old userspace will not get it so I think this should be ok.
> > Newer userspace will implement this and get the new functionality.
> > Problem will be in extending this to crtc where we have a legacy baggage, the client caps approach
> > may help us there. Have it as part of separate series just to not mix it with this new plane stuff, though
> > the idea remains same based on your design. Series below for reference:
> > https://patchwork.freedesktop.org/series/90821/>> 
> 
> Could we just assume we do a uniform LUT if userspace doesn't
> set a _MODE enum value for the respective gamma?
> 
> Maybe the _MODE should have a default enum value that means
> a uniform (legacy) LUT.

Yeah, it definitely needs a default like that. But the problem arises
when new userspace sets it to something else and then hands the reins
over to some old userspace that doesn't know how to reset it back to
default.

-- 
Ville Syrjälä
Intel
