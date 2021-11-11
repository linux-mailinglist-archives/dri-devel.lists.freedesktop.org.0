Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B844DAA0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 17:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656A56E17D;
	Thu, 11 Nov 2021 16:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436BC6E17D;
 Thu, 11 Nov 2021 16:42:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="319157569"
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="319157569"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 08:42:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,226,1631602800"; d="scan'208";a="470848936"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga002.jf.intel.com with SMTP; 11 Nov 2021 08:42:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 18:42:39 +0200
Date: Thu, 11 Nov 2021 18:42:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <YY1H//+XISVMFZNL@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52ce874c-64ae-d7a9-bc4e-255cfa49f410@amd.com>
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
Cc: Shashank.Sharma@amd.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, sebastian@sebastianwick.net,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 11, 2021 at 10:17:17AM -0500, Harry Wentland wrote:
> 
> 
> On 2021-09-06 17:38, Uma Shankar wrote:
> > Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> > planes have different capabilities, implemented respective
> > structure for the HDR planes.
> > 
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> > index afcb4bf3826c..6403bd74324b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
> >  	}
> >  }
> >  
> > + /* FIXME input bpc? */
> > +__maybe_unused
> > +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> > +	/* segment 1 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 128,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 0, .end = (1 << 24) - 1,
> > +		.min = 0, .max = (1 << 24) - 1,
> > +	},
> > +	/* segment 2 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = (1 << 24) - 1, .end = 1 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +	/* Segment 3 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 1 << 24, .end = 3 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +	/* Segment 4 */
> > +	{
> > +		.flags = (DRM_MODE_LUT_GAMMA |
> > +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> > +			  DRM_MODE_LUT_INTERPOLATE |
> > +			  DRM_MODE_LUT_REUSE_LAST |
> > +			  DRM_MODE_LUT_NON_DECREASING),
> > +		.count = 1,
> > +		.input_bpc = 24, .output_bpc = 16,
> > +		.start = 3 << 24, .end = 7 << 24,
> > +		.min = 0, .max = (1 << 27) - 1,
> > +	},
> > +};
> 
> If I understand this right, userspace would need this definition in order
> to populate the degamma blob. Should this sit in a UAPI header?

My original idea (not sure it's fully realized in this series) is to
have a new GAMMA_MODE/etc. enum property on each crtc (or plane) for
which each enum value points to a kernel provided blob that contains
one of these LUT descriptors. Userspace can then query them dynamically
and pick the best one for its current use case.

The algorithm for choosing the best one might be something like:
- prefer LUT with bpc >= FB bpc, but perhaps not needlessly high bpc
- prefer interpolated vs. direct lookup based on current needs (eg. X
  could prefer direct lookup to get directcolor visuals).
- prefer one with extended range values if needed
- for HDR prefer smaller step size in dark tones,
  for SDR perhaps prefer a more uniform step size

Or maybe we should include some kind of usage hints as well?

And I was thinking of even adding a new property type (eg.
ENUM_BLOB) just for this sort of usecase. That could let us
have a bit more generic code to do all the validation around
the property values and whatnot.

The one nagging concern I really have with GAMMA_MODE is how a
mix of old and new userspace would work. Though that is more 
of a generic issue with any new property really.

-- 
Ville Syrjälä
Intel
