Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CE4462FD
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 12:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34126E14B;
	Fri,  5 Nov 2021 11:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D395F6E139;
 Fri,  5 Nov 2021 11:49:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231729273"
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="231729273"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 04:49:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,211,1631602800"; d="scan'208";a="586336850"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga002.fm.intel.com with SMTP; 05 Nov 2021 04:49:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 05 Nov 2021 13:49:47 +0200
Date: Fri, 5 Nov 2021 13:49:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <YYUaWzxHZ7M2B7iY@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
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

On Thu, Nov 04, 2021 at 12:27:56PM -0400, Harry Wentland wrote:
> 
> 
> On 2021-11-04 04:38, Pekka Paalanen wrote:
> > On Wed, 3 Nov 2021 11:08:13 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> > 
> >> On 2021-09-06 17:38, Uma Shankar wrote:
> >>> Existing LUT precision structure is having only 16 bit
> >>> precision. This is not enough for upcoming enhanced hardwares
> >>> and advance usecases like HDR processing. Hence added a new
> >>> structure with 32 bit precision values.
> >>>
> >>> This also defines a new structure to define color lut ranges,
> >>> along with related macro definitions and enums. This will help
> >>> describe multi segmented lut ranges in the hardware.
> >>>
> >>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >>> ---
> >>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
> >>>  1 file changed, 58 insertions(+)
> >>>
> >>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >>> index 90c55383f1ee..1079794c86c3 100644
> >>> --- a/include/uapi/drm/drm_mode.h
> >>> +++ b/include/uapi/drm/drm_mode.h
> >>> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
> >>>  	};
> >>>  };
> >>>  
> >>> +/*
> >>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
> >>> + * can be used for either purpose, but not simultaneously. To expose
> >>> + * modes that support gamma and degamma simultaneously the gamma mode
> >>> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
> >>> + * ranges.
> >>> + */
> >>> +/* LUT is for gamma (after CTM) */
> >>> +#define DRM_MODE_LUT_GAMMA BIT(0)
> >>> +/* LUT is for degamma (before CTM) */
> >>> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
> >>> +/* linearly interpolate between the points */
> >>> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
> >>> +/*
> >>> + * the last value of the previous range is the
> >>> + * first value of the current range.
> >>> + */
> >>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> >>> +/* the curve must be non-decreasing */
> >>> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
> >>> +/* the curve is reflected across origin for negative inputs */
> >>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> >>> +/* the same curve (red) is used for blue and green channels as well */
> >>> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> >>> +
> >>> +struct drm_color_lut_range {
> >>> +	/* DRM_MODE_LUT_* */
> >>> +	__u32 flags;
> >>> +	/* number of points on the curve */
> >>> +	__u16 count;
> >>> +	/* input/output bits per component */
> >>> +	__u8 input_bpc, output_bpc;
> >>> +	/* input start/end values */
> >>> +	__s32 start, end;
> >>> +	/* output min/max values */
> >>> +	__s32 min, max;
> >>> +};
> >>> +
> >>> +enum lut_type {
> >>> +	LUT_TYPE_DEGAMMA = 0,
> >>> +	LUT_TYPE_GAMMA = 1,
> >>> +};
> >>> +
> >>> +/*
> >>> + * Creating 64 bit palette entries for better data
> >>> + * precision. This will be required for HDR and
> >>> + * similar color processing usecases.
> >>> + */
> >>> +struct drm_color_lut_ext {
> >>> +	/*
> >>> +	 * Data is U32.32 fixed point format.
> >>> +	 */
> >>> +	__u64 red;
> >>> +	__u64 green;
> >>> +	__u64 blue;
> >>> +	__u64 reserved;
> >>> +};  
> >>
> >> I've been drawing out examples of drm_color_lut_range defined PWLs
> >> and understand a bit better what you and Ville are trying to accomplish
> >> with it. It actually makes a lot of sense and would allow for a generic
> >> way to populate different PWL definitions with a generic function.
> >>
> >> But I still have some key questions that either are not answered in these
> >> patch sets or that I somehow overlooked.
> >>
> >> Can you explain how the U32.32 fixed point format relates to the input_bpc
> >> and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
> >> the framebuffer.
> >>
> >> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
> >> is non-multiplied)?
> >>
> >> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
> >> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
> >> be interpreted as 0x3ff << (24-10)? 
> >>
> >> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
> >> the output value be 0x3ff << (16-10)?
> >>
> >> On AMD HW the pipe-internal format is a custom floating point format. We could
> >> probably express that in terms of input/output_bpc and do the translation in our
> >> driver between that and the internal floating point format, depending on the
> >> framebuffer format, but there is the added complication of the magnitude of the
> >> pixel data and correlating HDR with SDR planes.
> >>
> >> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
> >> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
> >> to represent that with the drm_color_lut_range definition.
> > 
> > 
> > Hi Harry,
> > 
> > I think you just would not. Conceptually an SDR plane gets its very own
> > LUT that converts the FB [0.0, 1.0] range to any appropriate [a >= 0.0,
> > b <= 1.0] range in HDR. This is purely conceptual, in the terms of the
> > abstract KMS color pipeline, where [0.0, 1.0] is always the full
> > dynamic range at any point of the pipeline, meaning it is relative to
> > its placement in the pipeline. If you want to use values >1.0 in hw,
> > you can do so under the hood.
> > 
> > At least that is how I would imagine things. With LUTs in general, I
> > don't think I have ever seen LUT input domain being explicitly defined
> > to something else than [0.0, 1.0] relative to the elements in the LUT
> > where 0.0 maps exactly to the first element and 1.0 maps exactly to the
> > last element.
> > 
> > I'm of course open to other suggestions, but having values outside of
> > [0.0, 1.0] range in the abstract pipeline will always raise the
> > question: how do you feed those to the LUT next in the pipeline.
> > 
> 
> AMD HW defines the LUT addressing in floating point space and allows
> for addressing beyond 1.0. In fact on other OSes our driver uses
> [0.0, 1.0] for SDR LUTs and [0.0, 128.0] for HDR LUTs.
> 
> There are color spaces that extend beyond 1.0 and even into the negative
> range: https://en.wikipedia.org/wiki/ScRGB
> 
> I don't think we should define the LUT to be limited to [0.0, 1.0].

That is not the intention, or at least wasn't my intention when
originally I proposed this gamma mode stuff. I specifically wanted
support for extended values. So 0.0-1.0 is supposed to be just the
range for the in gamut values.

> 
> If the framebuffer is not in FP16 the question then becomes how
> the integer pixel values relate to LUT addressing.

The idea again is that 0.0-1.0 is the range for the in gamut
values. IIRC our hw does have the possibility of scaling all
the fp16 input values by some programmable constant factor,
but exposing that would require yet another uapi addition.

> 
> As well, LUT entries are defined to be U32.32 fixed point, also
> allowing for entries much greater than 1.0. If those are programmed
> as entries in the input (degamma) LUT how will they be used to address
> entries in the output (gamma) LUT?

The u32.32 is a mistake I think. IMO we should be going for signed
values everywhere. Though our hw does not actually let us directly
program negative values for the LUT, rather the hw just reflects
the whole curve across the origin so the lookup is basically just
something like:
output = input < 0 ? -lut[abs(input)] : lut[input];

That is why there is that proposed DRM_MODE_LUT_REFLECT_NEGATIVE flag.

I think nouveau had something funny in its lut programming that
made me think that it might actually have straight up programmable
LUT entries for negative inputs as well. But I'm not sure if anyone
has actually tested that.

> 
> Maybe we want to say the actual input values are being used to
> address the LUT entries? But if we look at segment 1 of Uma's
> d13_degamma_hdr definition we see that the range of 0 to
> (1 << 24) -1 is covered by 128 (1 << 7) entries, so the range
> of 0 to 256 (for RGB with 8 bpc) would only be covered by 2
> LUT entries. So this interpretation doesn't make sense.
> 
> You can see, I'm still confused by these definitions. An IGT
> test would help explain the API intentions a bit better, though
> I would like to see more precise documentation.
> 
> Despite my confusion I think the segmented PWL definitions are
> a neat way to concisely describe the HW capabilities to
> userspace and a concise way for userspace to provide the LUT
> more precisely than with a uniformly spaced LUT.
> 
> Harry
> 
> > Yeah, I have no idea what it should mean if an FB has a format that
> > allows values beyond [0.0, 1.0].
> > 
> > 
> > Thanks,
> > pq
> > 
> > 
> >> If some of these questions should be obvious I apologize for being a bit dense,
> >> though it helps to make this accessible to the lowest common denominator
> >> to ensure not only the smartest devs can work with this.
> >>
> >> Harry
> >>
> >>> +
> >>>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> >>>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
> >>>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
> >>>   
> >>
> > 

-- 
Ville Syrjälä
Intel
