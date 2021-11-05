Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40004463AF
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 13:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DA96E1F6;
	Fri,  5 Nov 2021 12:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16806E1F6;
 Fri,  5 Nov 2021 12:59:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="229356195"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="229356195"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 05:59:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="450562978"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 05 Nov 2021 05:59:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 14:59:44 +0200
Date: Fri, 5 Nov 2021 14:59:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <YYUqwCBQwfL0SABl@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com>
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

On Wed, Nov 03, 2021 at 11:10:37AM -0400, Harry Wentland wrote:
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
> 
> Is the distribution of the 128 entries uniform?

I guess this is the plane gamma thing despite being in intel_color.c,
so yeah I think that's correct.

> If so, is a
> uniform distribution of 128 points across most of the LUT
> good enough for HDR with 128 entries?

No idea how good this actually is. It is .24 so at least
it does have a fair bit of precision.

> 
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
> 
> .start and .end are only a single entry apart. Is this correct?

One think I wanted to do is simplify this stuff by getting rid of
.end entirely. So I think this should just be '.start=1<<24' (or
whatever way we decide to specify the input precision, which is
I think another slightly open question).

So for this thing we could just have:
{ .count = 128, .min = 0, .max = (1 << 24) - 1, .start = 0       },
{ .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 1 << 24 },
{ .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 3 << 24 },
{ .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 7 << 24 },

+ flags/etc. which I left out for brevity.

So that is trying to indicate that the first 129 entries are equally
spaced, and would be used to interpolate for input values [0.0,1.0).
Input values [1.0,3.0) would interpolate between entry 128 and 129,
and [3.0,7.0) would interpolate between entry 129 and 130.

-- 
Ville Syrjälä
Intel
