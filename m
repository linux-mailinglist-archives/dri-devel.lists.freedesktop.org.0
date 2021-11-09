Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B5144B519
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 23:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93946E8D4;
	Tue,  9 Nov 2021 22:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9396E8D8;
 Tue,  9 Nov 2021 22:02:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="232498378"
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="232498378"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 14:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,221,1631602800"; d="scan'208";a="500910450"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga007.fm.intel.com with SMTP; 09 Nov 2021 14:02:17 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 00:02:16 +0200
Date: Wed, 10 Nov 2021 00:02:16 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC v2 02/22] drm: Add Enhanced Gamma and color lut range
 attributes
Message-ID: <YYrv6Mlp0K+9pZ+A@intel.com>
References: <20210906213904.27918-1-uma.shankar@intel.com>
 <20210906213904.27918-3-uma.shankar@intel.com>
 <d67a9761-91b4-3432-dd55-f85bb0657b68@amd.com>
 <20211104103827.2cf48bb7@eldfell>
 <5780b3b6-5b12-df66-03be-5f1918d28989@amd.com>
 <20211108115427.5c3f162e@eldfell>
 <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f189780-707d-0dda-778f-1a42b74ff4ae@amd.com>
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

On Tue, Nov 09, 2021 at 03:47:58PM -0500, Harry Wentland wrote:
> On 2021-11-08 04:54, Pekka Paalanen wrote:
> > On Thu, 4 Nov 2021 12:27:56 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> > 
> >> On 2021-11-04 04:38, Pekka Paalanen wrote:
> >>> On Wed, 3 Nov 2021 11:08:13 -0400
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>   
> >>>> On 2021-09-06 17:38, Uma Shankar wrote:  
> >>>>> Existing LUT precision structure is having only 16 bit
> >>>>> precision. This is not enough for upcoming enhanced hardwares
> >>>>> and advance usecases like HDR processing. Hence added a new
> >>>>> structure with 32 bit precision values.
> >>>>>
> >>>>> This also defines a new structure to define color lut ranges,
> >>>>> along with related macro definitions and enums. This will help
> >>>>> describe multi segmented lut ranges in the hardware.
> >>>>>
> >>>>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> >>>>> ---
> >>>>>  include/uapi/drm/drm_mode.h | 58 +++++++++++++++++++++++++++++++++++++
> >>>>>  1 file changed, 58 insertions(+)
> >>>>>
> >>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> >>>>> index 90c55383f1ee..1079794c86c3 100644
> >>>>> --- a/include/uapi/drm/drm_mode.h
> >>>>> +++ b/include/uapi/drm/drm_mode.h
> >>>>> @@ -903,6 +903,64 @@ struct hdr_output_metadata {
> >>>>>  	};
> >>>>>  };
> >>>>>  
> >>>>> +/*
> >>>>> + * DRM_MODE_LUT_GAMMA|DRM_MODE_LUT_DEGAMMA is legal and means the LUT
> >>>>> + * can be used for either purpose, but not simultaneously. To expose
> >>>>> + * modes that support gamma and degamma simultaneously the gamma mode
> >>>>> + * must declare distinct DRM_MODE_LUT_GAMMA and DRM_MODE_LUT_DEGAMMA
> >>>>> + * ranges.
> >>>>> + */
> >>>>> +/* LUT is for gamma (after CTM) */
> >>>>> +#define DRM_MODE_LUT_GAMMA BIT(0)
> >>>>> +/* LUT is for degamma (before CTM) */
> >>>>> +#define DRM_MODE_LUT_DEGAMMA BIT(1)
> >>>>> +/* linearly interpolate between the points */
> >>>>> +#define DRM_MODE_LUT_INTERPOLATE BIT(2)
> >>>>> +/*
> >>>>> + * the last value of the previous range is the
> >>>>> + * first value of the current range.
> >>>>> + */
> >>>>> +#define DRM_MODE_LUT_REUSE_LAST BIT(3)
> >>>>> +/* the curve must be non-decreasing */
> >>>>> +#define DRM_MODE_LUT_NON_DECREASING BIT(4)
> >>>>> +/* the curve is reflected across origin for negative inputs */
> >>>>> +#define DRM_MODE_LUT_REFLECT_NEGATIVE BIT(5)
> >>>>> +/* the same curve (red) is used for blue and green channels as well */
> >>>>> +#define DRM_MODE_LUT_SINGLE_CHANNEL BIT(6)
> >>>>> +
> >>>>> +struct drm_color_lut_range {
> >>>>> +	/* DRM_MODE_LUT_* */
> >>>>> +	__u32 flags;
> >>>>> +	/* number of points on the curve */
> >>>>> +	__u16 count;
> >>>>> +	/* input/output bits per component */
> >>>>> +	__u8 input_bpc, output_bpc;
> >>>>> +	/* input start/end values */
> >>>>> +	__s32 start, end;
> >>>>> +	/* output min/max values */
> >>>>> +	__s32 min, max;
> >>>>> +};
> >>>>> +
> >>>>> +enum lut_type {
> >>>>> +	LUT_TYPE_DEGAMMA = 0,
> >>>>> +	LUT_TYPE_GAMMA = 1,
> >>>>> +};
> >>>>> +
> >>>>> +/*
> >>>>> + * Creating 64 bit palette entries for better data
> >>>>> + * precision. This will be required for HDR and
> >>>>> + * similar color processing usecases.
> >>>>> + */
> >>>>> +struct drm_color_lut_ext {
> >>>>> +	/*
> >>>>> +	 * Data is U32.32 fixed point format.
> >>>>> +	 */
> >>>>> +	__u64 red;
> >>>>> +	__u64 green;
> >>>>> +	__u64 blue;
> >>>>> +	__u64 reserved;
> >>>>> +};    
> >>>>
> >>>> I've been drawing out examples of drm_color_lut_range defined PWLs
> >>>> and understand a bit better what you and Ville are trying to accomplish
> >>>> with it. It actually makes a lot of sense and would allow for a generic
> >>>> way to populate different PWL definitions with a generic function.
> >>>>
> >>>> But I still have some key questions that either are not answered in these
> >>>> patch sets or that I somehow overlooked.
> >>>>
> >>>> Can you explain how the U32.32 fixed point format relates to the input_bpc
> >>>> and output_bpc in drm_color_lut_range, as we as to the pixel coming in from
> >>>> the framebuffer.
> >>>>
> >>>> E.g. if we have ARGB2101010 what happens to a 0x3ff red value (assuming alpha
> >>>> is non-multiplied)?
> >>>>
> >>>> If the drm_color_lut_range segments are defined with input_bpc of 24 bpc will
> >>>> 0x3ff be zero-expanded to 24-bit? Is the 24 bpc an integer? I.e. would our 3xff
> >>>> be interpreted as 0x3ff << (24-10)? 
> >>>>
> >>>> Assuming the output_bpc is 16 bpc and the programmed LUT makes this 1-to-1 would
> >>>> the output value be 0x3ff << (16-10)?
> >>>>
> >>>> On AMD HW the pipe-internal format is a custom floating point format. We could
> >>>> probably express that in terms of input/output_bpc and do the translation in our
> >>>> driver between that and the internal floating point format, depending on the
> >>>> framebuffer format, but there is the added complication of the magnitude of the
> >>>> pixel data and correlating HDR with SDR planes.
> >>>>
> >>>> E.g. any SDR data would map from 0.0 to 1.0 floating point, while HDR content would
> >>>> map from 0.0 to some value larger than 1.0. I don't (yet) have a clear picture how
> >>>> to represent that with the drm_color_lut_range definition.  
> >>>
> >>>
> >>> Hi Harry,
> >>>
> >>> I think you just would not. Conceptually an SDR plane gets its very own
> >>> LUT that converts the FB [0.0, 1.0] range to any appropriate [a >= 0.0,
> >>> b <= 1.0] range in HDR. This is purely conceptual, in the terms of the
> >>> abstract KMS color pipeline, where [0.0, 1.0] is always the full
> >>> dynamic range at any point of the pipeline, meaning it is relative to
> >>> its placement in the pipeline. If you want to use values >1.0 in hw,
> >>> you can do so under the hood.
> >>>
> >>> At least that is how I would imagine things. With LUTs in general, I
> >>> don't think I have ever seen LUT input domain being explicitly defined
> >>> to something else than [0.0, 1.0] relative to the elements in the LUT
> >>> where 0.0 maps exactly to the first element and 1.0 maps exactly to the
> >>> last element.
> >>>
> >>> I'm of course open to other suggestions, but having values outside of
> >>> [0.0, 1.0] range in the abstract pipeline will always raise the
> >>> question: how do you feed those to the LUT next in the pipeline.
> >>>   
> >>
> >> AMD HW defines the LUT addressing in floating point space and allows
> >> for addressing beyond 1.0. In fact on other OSes our driver uses
> >> [0.0, 1.0] for SDR LUTs and [0.0, 128.0] for HDR LUTs.
> > 
> > Hi Harry,
> > 
> > that sounds like some kind of absolute luminance encoding. Very much
> > like a PQ system. PQ system is very different to anything else, and
> > fitting that with a relative luminance system (which is everything else
> > in existence that I know of) has... things to be worked out.
> > 
> > I recall seeing some calculations where [0.0, 128.0] mapped very
> > nicely to exactly the theoretical absolute dynamic range of the PQ
> > system. It seems like that range is specifically tailored for operation
> > in the PQ system.
> > 
> >> There are color spaces that extend beyond 1.0 and even into the negative
> >> range: https://en.wikipedia.org/wiki/ScRGB
> > 
> > scRGB is really special. It's more like a pure mathematical
> > representation than a color space. Just like you can take a color
> > triplet in any well-defined color space, and multiply it with a totally
> > arbitrary but invertible 3x3 matrix. You get totally arbitrary values
> > as a result, but you are not actually changing anything. It's just a
> > different encoding.
> > 
> > scRGB has two peculiar and different properties.
> > 
> > First, if no color component is negative, the values above 1.0 simply
> > extend the dynamic range.
> > 
> > Second, if any color component has a negative value, that extends the
> > color gamut, not just dynamic range. You can represent for example a
> > red color out of your gamut by using slightly negative values for green
> > and blue and compensate for the "negative light intensity" by
> > increasing the red value above 1.0, without actually going outside of
> > the "original" dynamic range.
> > 
> > When color spaces are usually defined, the properties are chosen such
> > that all color components will be non-negative. That makes them
> > intuitive, particularly with additive color models (RGB in particular),
> > because the concept of negative light intensity does not exist in
> > physics (but it can be emulated in color matching experiments by adding
> > the negative component of the matching color as a positive component to
> > the reference color instead).
> > 
> > Then there are the considerations of color gamut and available dynamic
> > range, which are inter-dependent and together form the available color
> > volume.
> > 
> > Traditional color management works with relative coordinates where the
> > per-channel range [0.0, 1.0] defines the color volume with relative,
> > not absolute, dynamic range. You also were not able to send values
> > outside of min..max to a monitor, so might as well map those to 0.0 and
> > 1.0. One could say the color volume definition is implicit here, with
> > the added confusion that you don't actually know the absolute dynamic
> > range (cd/m²).
> > 
> > Nowadays we have color spaces like BT.2020 which are larger than any
> > actual display can realize. Therefore, it is not enough to know the
> > color space to understand the available color volume, but you need
> > explicit information about the color gamut as well.
> > 
> > We need to know the available color volume to be able to map content
> > color volume nicely for the display. Likewise, we need to know the
> > actual color volume of the content too for a good color mapping.
> > 
> > If you use scRGB, you lose all intuitiveness. You have the concept of
> > negative light intensity which does not exist, but it is used simply as
> > a means to represent a larger color gamut than what the primaries of
> > the color space would imply. It can even extend to imaginary colors,
> > colors that do not exist: there is no light spectrum that would result
> > in that color in the human eye. (BT.2020 may be big, but all its colors
> > are real.) So you need to be able to handle arbitrary color channel
> > values, and you need explicit knowledge of the color volume you are
> > working with.
> > 
> > Essentially I think this means that one would better be using floating
> > point for everything, or maybe you can get away with formats like
> > s32.32 which takes 64 bits when a 16-bit float might have been enough.
> > But that then ties with the value encoding (linear vs. non-linear), so
> > one can't make a blanket statement about it.
> > 
> > Anyway, all the above is for the userspace to figure out. I just think
> > that using the range [0.0, 1.0] is very natural for most workflows,
> > even HDR. I don't see a practical need to go beyond that range, but I'm
> > also not against it. One can always program the [0.0, 1.0] range
> > explicitly via KMS.
> > 
> 
> I agree that this should be for userspace to figure out. For that reason
> (and because we see OSes that do funky things) I prefer to not limit
> userspace to [0.0, 1.0].
> 
> > The choice of the encoding at any point is always arbitrary, as long as
> > it doesn't lose too much information. The important thing is to be
> > consistent in a pipeline. That is why I'm not really concerned about
> > what range the abstract KMS pipeline is going to be defined with, as
> > long as it is consistent. An example of inconsistent pipeline would be
> > to allow arbitrary values in a LUT output, but defining only [0.0, 1.0]
> > input domain for the next element in the pipeline. Since any pipeline
> > element could be missing, you can't rely on some elements acting as
> > "sanitizer" but any earlier element could be feeding directly into any
> > later element.
> > 
> >> I don't think we should define the LUT to be limited to [0.0, 1.0].
> > 
> > That is fine. You get to define the UAPI and semantics for that, and
> > you also need to retrofit the existing pipeline components like CRTC
> > GAMMA and DEGAMMA to work with it somehow or replace them. You also
> > need to define how arbitrary values get converted to the cable.
> > 
> > However, what happens if we define the abstract KMS color pipeline in
> > terms of supporting arbitrary values in any point of the pipeline, and
> > hardware just doesn't work that way because it happens to be using e.g.
> > limited integer arithmetic?
> > 
> >> If the framebuffer is not in FP16 the question then becomes how
> >> the integer pixel values relate to LUT addressing.
> > 
> > Traditionally, and in any API I've seen (GL, Vulkan), a usual mapping
> > is to match minimum unsigned integer value to 0.0, and unsigned maximum
> > integer value to 1.0. This is how things work on the cable too, right?
> > (Also taking full vs. limited range video signal into account. And
> > conversion to cable-YUV if that happens.)
> > 
> > If you want integer format FB values to map to something else, then you
> > have to tag the FB with that range information, somehow. New UAPI.
> > 
> 
> On the cable we send integer values, not floating point. AMD HW uses
> floating point internally, though, and the PWL API defines floating
> point entries, so on some level we need to be clear what the floating
> point entries mean. Either we document that to be [0.0, 1.0] or we
> have some UAPI to define it. I'm leaning toward the latter but have
> to think about it some more.

As for Intel hw if you have an integer pixel value of 0xff... (with
however many bits you have with a specific pixel format) it will get
extended to 0.fff... (to whatever precision the pipe has internally).
So if we go by that a fixed point 1.0 value in the proposed
drm_color_lut_range would be considered just outside the gamut. And
pretty sure fp16 input of 1.0 should also result in a 0.fff... internal
value as well [1]. I think that definition pretty much matches how GL
UNORM<->float conversion works as well.

[1] though IIRC some our hw did get that a bit wrong and it
    actually generates a 1.0 fixed point value for the pipe

-- 
Ville Syrjälä
Intel
