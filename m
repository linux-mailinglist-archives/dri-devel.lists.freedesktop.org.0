Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DB444B4E4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 22:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31228893BC;
	Tue,  9 Nov 2021 21:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B315F89203;
 Tue,  9 Nov 2021 21:46:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293382470"
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="293382470"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 13:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="533834234"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga001.jf.intel.com with SMTP; 09 Nov 2021 13:45:55 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 09 Nov 2021 23:45:54 +0200
Date: Tue, 9 Nov 2021 23:45:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 05/22] drm/i915/xelpd: Define Degamma Lut range struct
 for HDR planes
Message-ID: <YYrsErnyQ6oOFDps@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-6-uma.shankar@intel.com>
 <bc7e37d4-e8be-73ce-5478-02a0d5474a15@amd.com>
 <YYUqwCBQwfL0SABl@intel.com>
 <5c7b65b6-69ed-2259-0edd-cf04cffa9231@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c7b65b6-69ed-2259-0edd-cf04cffa9231@amd.com>
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

On Tue, Nov 09, 2021 at 03:19:47PM -0500, Harry Wentland wrote:
> On 2021-11-05 08:59, Ville Syrjälä wrote:
> > On Wed, Nov 03, 2021 at 11:10:37AM -0400, Harry Wentland wrote:
> >>
> >>
> >> On 2021-09-06 17:38, Uma Shankar wrote:
> >>> Define the structure with XE_LPD degamma lut ranges. HDR and SDR
> >>> planes have different capabilities, implemented respective
> >>> structure for the HDR planes.
> >>>
> >>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >>> ---
> >>>  drivers/gpu/drm/i915/display/intel_color.c | 52 ++++++++++++++++++++++
> >>>  1 file changed, 52 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> >>> index afcb4bf3826c..6403bd74324b 100644
> >>> --- a/drivers/gpu/drm/i915/display/intel_color.c
> >>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> >>> @@ -2092,6 +2092,58 @@ static void icl_read_luts(struct intel_crtc_state *crtc_state)
> >>>  	}
> >>>  }
> >>>  
> >>> + /* FIXME input bpc? */
> >>> +__maybe_unused
> >>> +static const struct drm_color_lut_range d13_degamma_hdr[] = {
> >>> +	/* segment 1 */
> >>> +	{
> >>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>> +		.count = 128,
> >>
> >> Is the distribution of the 128 entries uniform?
> > 
> > I guess this is the plane gamma thing despite being in intel_color.c,
> > so yeah I think that's correct.
> > 
> >> If so, is a
> >> uniform distribution of 128 points across most of the LUT
> >> good enough for HDR with 128 entries?
> > 
> > No idea how good this actually is. It is .24 so at least
> > it does have a fair bit of precision.
> > 
> 
> Precision is good but you also need enough samples. Though that's
> probably less my concern and more your concern and should become
> apparent once its used.

Yeah, for pipe gamma we have a few different variants with
non-uniform spacing of the samples. But not here AFAICS for 
whatever reason.

> 
> >>
> >>> +		.input_bpc = 24, .output_bpc = 16,
> >>> +		.start = 0, .end = (1 << 24) - 1,
> >>> +		.min = 0, .max = (1 << 24) - 1,
> >>> +	},
> >>> +	/* segment 2 */
> >>> +	{
> >>> +		.flags = (DRM_MODE_LUT_GAMMA |
> >>> +			  DRM_MODE_LUT_REFLECT_NEGATIVE |
> >>> +			  DRM_MODE_LUT_INTERPOLATE |
> >>> +			  DRM_MODE_LUT_REUSE_LAST |
> >>> +			  DRM_MODE_LUT_NON_DECREASING),
> >>> +		.count = 1,
> >>> +		.input_bpc = 24, .output_bpc = 16,
> >>> +		.start = (1 << 24) - 1, .end = 1 << 24,
> >>
> >> .start and .end are only a single entry apart. Is this correct?
> > 
> > One think I wanted to do is simplify this stuff by getting rid of
> > .end entirely. So I think this should just be '.start=1<<24' (or
> > whatever way we decide to specify the input precision, which is
> > I think another slightly open question).
> > 
> > So for this thing we could just have:
> > { .count = 128, .min = 0, .max = (1 << 24) - 1, .start = 0       },
> > { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 1 << 24 },
> > { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 3 << 24 },
> > { .count = 1,   .min = 0, .max = (7 << 24) - 1, .start = 7 << 24 },
> > 
> > + flags/etc. which I left out for brevity.
> > 
> 
> Makes sense. I like this.
> 
> > So that is trying to indicate that the first 129 entries are equally
> > spaced, and would be used to interpolate for input values [0.0,1.0).
> > Input values [1.0,3.0) would interpolate between entry 128 and 129,
> > and [3.0,7.0) would interpolate between entry 129 and 130.
> > 
> 
> What in the segment definition defines the 1.0 mark? In your example
> it seems to be at (1 << 24) but then we would have values that go
> beyond the input_bpc for the last three segments.

Yes, input_bpc would define the precision of the input values (.start).
so 1.0 would be at 1<<input_bpc. Tne range of input values is allowed to
extend outside the 0.0-1.0 range.

> 
> How about output_bpc? Would output_bpc somehow limit the U32.32 (or
> S31.32) entries, and if so, how?

output_bpc would define the actual precision of the output values,
so again 1.0 would be 1<<output_bpc, and .min and .max define the
min/max values (which can extend outside the 0.0-1.0 range). The
alternative I guess would be to not have .output_bpc at all and
just have .min/.max be s32.32 values. Though then you can't tell
what the actual precision is. Same could be done for .input_bpc
I suppose.

> 
> Or should we treat input_/output_bpc only as capability reporting, so
> userspace can calculate the possible error when programming the LUT?
> Again, this leaves us with the question what the input_/output_bpc
> means for our PWL entries.

Yeah, I mostly thought they might be interesting if userspace wants
to know the exact precision. But not strictly necessary if you want
just to go generate a "close enough" curve. 

What's PWL?

-- 
Ville Syrjälä
Intel
