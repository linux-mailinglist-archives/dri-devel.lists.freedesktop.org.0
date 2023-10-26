Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA027D8790
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 19:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6524A10E84C;
	Thu, 26 Oct 2023 17:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D906D10E841
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 17:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698341411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EYyjKImKeFdVC8GMzJEQyxEmS8bEsg1j4TcLU0oPCe4=;
 b=FYBqKt/mirHKJ/n0q4POq5FsINSnADAGFrg4i4b15q7xU+H9KMEDEV5L0cZC4R+xMyDB1F
 B2ja2rFpkYyr1ICl6JrXSBBeZl5LNXHAuAZTnzYnzRknc7b6IW0kPhVB4IIHh3GwnFB3tI
 8FP5lClvPV/7AE/Gc2uUztGXDLngfiM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-gGmGxecPP0y6yewtyE-WEQ-1; Thu, 26 Oct 2023 13:30:08 -0400
X-MC-Unique: gGmGxecPP0y6yewtyE-WEQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-507b8ac8007so1342978e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 10:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698341406; x=1698946206;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EYyjKImKeFdVC8GMzJEQyxEmS8bEsg1j4TcLU0oPCe4=;
 b=bUM6bmem+tuKb+3BuGH+WCyv1h1g6ezFCVdkbF6XZr709w/gF6+nQ6KTxCuYQLq5IL
 qOI6plSQ0PhZDEQSBtTFaTCJCj+/aMO1SH9rduTd5gGBTiqBL3lOTkVGtjljMWf3DC6G
 a7zpT9wbUIflHEtCHEIm0zvpw4p2giX5UEFBadWBYDw93VSNL9dbSYlgzcAgYo3qYL08
 4nmDaoavVB+hzItbehkvLbtt22ELnnwyJN2tRvS2/trVLn+3JgudLBoSXUqn9GJTx5Kb
 Eyc3xB5l8jElI6WQ0o25mgNnAH+QC4FTr3g9lCG6g4r9B6xDdhnj1+NG87tbQRoxDBVp
 9shQ==
X-Gm-Message-State: AOJu0Yw/68IKoNHmQT4Dz2YQttg+UiRg3WN3fqyuYtHVrIL4T6wD/C6o
 SqAFD80yOlqkdY2qBtm+QDFwBI/k7M2KZQP6ymXFvH4WO2YLm0oGgCkFugvhZ7bQCXss8rw44mX
 ZaVV6jgEILmocwQbfgyW2Zxja6p+9
X-Received: by 2002:ac2:5b4c:0:b0:507:a62c:5d0c with SMTP id
 i12-20020ac25b4c000000b00507a62c5d0cmr46500lfp.19.1698341406469; 
 Thu, 26 Oct 2023 10:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiYnJT7ncYTbMdCavGtUhzeKi2A12k4p5DETmpDx2B4Z4RvEb/eg1l6zfMQj0pXjHyK/EHbA==
X-Received: by 2002:ac2:5b4c:0:b0:507:a62c:5d0c with SMTP id
 i12-20020ac25b4c000000b00507a62c5d0cmr46452lfp.19.1698341405763; 
 Thu, 26 Oct 2023 10:30:05 -0700 (PDT)
Received: from toolbox ([2001:9e8:8982:c100:da01:6266:fbb4:ac1f])
 by smtp.gmail.com with ESMTPSA id
 m28-20020a05600c3b1c00b003feae747ff2sm3150722wms.35.2023.10.26.10.30.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Oct 2023 10:30:05 -0700 (PDT)
Date: Thu, 26 Oct 2023 19:30:03 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231026173003.GA319477@toolbox>
References: <20231019212133.245155-1-harry.wentland@amd.com>
 <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell>
MIME-Version: 1.0
In-Reply-To: <20231026115747.44cbddad@eldfell>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Christopher Braga <quic_cbraga@quicinc.com>, Aleix Pol <aleixpol@kde.org>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote:
> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> Alex Goins <agoins@nvidia.com> wrote:
> 
> > Thank you Harry and all other contributors for your work on this. Responses
> > inline -
> > 
> > On Mon, 23 Oct 2023, Pekka Paalanen wrote:
> > 
> > > On Fri, 20 Oct 2023 11:23:28 -0400
> > > Harry Wentland <harry.wentland@amd.com> wrote:
> > >   
> > > > On 2023-10-20 10:57, Pekka Paalanen wrote:  
> > > > > On Fri, 20 Oct 2023 16:22:56 +0200
> > > > > Sebastian Wick <sebastian.wick@redhat.com> wrote:
> > > > >     
> > > > >> Thanks for continuing to work on this!
> > > > >>
> > > > >> On Thu, Oct 19, 2023 at 05:21:22PM -0400, Harry Wentland wrote:    
> > > > >>> v2:
> > > > >>>  - Update colorop visualizations to match reality (Sebastian, Alex Hung)
> > > > >>>  - Updated wording (Pekka)
> > > > >>>  - Change BYPASS wording to make it non-mandatory (Sebastian)
> > > > >>>  - Drop cover-letter-like paragraph from COLOR_PIPELINE Plane Property
> > > > >>>    section (Pekka)
> > > > >>>  - Use PQ EOTF instead of its inverse in Pipeline Programming example (Melissa)
> > > > >>>  - Add "Driver Implementer's Guide" section (Pekka)
> > > > >>>  - Add "Driver Forward/Backward Compatibility" section (Sebastian, Pekka)  
> > > > >
> > > > > ...
> > > > >  
> > > > >>> +An example of a drm_colorop object might look like one of these::
> > > > >>> +
> > > > >>> +    /* 1D enumerated curve */
> > > > >>> +    Color operation 42
> > > > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D enumerated curve
> > > > >>> +    ├─ "BYPASS": bool {true, false}
> > > > >>> +    ├─ "CURVE_1D_TYPE": enum {sRGB EOTF, sRGB inverse EOTF, PQ EOTF, PQ inverse EOTF, …}
> > > > >>> +    └─ "NEXT": immutable color operation ID = 43  
> > 
> > I know these are just examples, but I would also like to suggest the possibility
> > of an "identity" CURVE_1D_TYPE. BYPASS = true might get different results
> > compared to setting an identity in some cases depending on the hardware. See
> > below for more on this, RE: implicit format conversions.
> > 
> > Although NVIDIA hardware doesn't use a ROM for enumerated curves, it came up in
> > offline discussions that it would nonetheless be helpful to expose enumerated
> > curves in order to hide the vendor-specific complexities of programming
> > segmented LUTs from clients. In that case, we would simply refer to the
> > enumerated curve when calculating/choosing segmented LUT entries.
> 
> That's a good idea.
> 
> > Another thing that came up in offline discussions is that we could use multiple
> > color operations to program a single operation in hardware. As I understand it,
> > AMD has a ROM-defined LUT, followed by a custom 4K entry LUT, followed by an
> > "HDR Multiplier". On NVIDIA we don't have these as separate hardware stages, but
> > we could combine them into a singular LUT in software, such that you can combine
> > e.g. segmented PQ EOTF with night light. One caveat is that you will lose
> > precision from the custom LUT where it overlaps with the linear section of the
> > enumerated curve, but that is unavoidable and shouldn't be an issue in most
> > use-cases.
> 
> Indeed.
> 
> > Actually, the current examples in the proposal don't include a multiplier color
> > op, which might be useful. For AMD as above, but also for NVIDIA as the
> > following issue arises:
> > 
> > As discussed further below, the NVIDIA "degamma" LUT performs an implicit fixed
> > point to FP16 conversion. In that conversion, what fixed point 0xFFFFFFFF maps
> > to in floating point varies depending on the source content. If it's SDR
> > content, we want the max value in FP16 to be 1.0 (80 nits), subject to a
> > potential boost multiplier if we want SDR content to be brighter. If it's HDR PQ
> > content, we want the max value in FP16 to be 125.0 (10,000 nits). My assumption
> > is that this is also what AMD's "HDR Multiplier" stage is used for, is that
> > correct?
> 
> It would be against the UAPI design principles to tag content as HDR or
> SDR. What you can do instead is to expose a colorop with a multiplier of
> 1.0 or 125.0 to match your hardware behaviour, then tell your hardware
> that the input is SDR or HDR to get the expected multiplier. You will
> never know what the content actually is, anyway.
> 
> Of course, if we want to have a arbitrary multiplier colorop that is
> somewhat standard, as in, exposed by many drivers to ease userspace
> development, you can certainly use any combination of your hardware
> features you need to realize the UAPI prescribed mathematical operation.
> 
> Since we are talking about floating-point in hardware, a multiplier
> does not significantly affect precision.
> 
> In order to mathematically define all colorops, I believe it is
> necessary to define all colorops in terms of floating-point values (as
> in math), even if they operate on fixed-point or integer. By this I
> mean that if the input is 8 bpc unsigned integer pixel format for
> instance, 0 raw pixel channel value is mapped to 0.0 and 255 is mapped
> to 1.0, and the color pipeline starts with [0.0, 1.0], not [0, 255]
> domain. We have to agree on this mapping for all channels on all pixel
> formats. However, there is a "but" further below.
> 
> I also propose that quantization range is NOT considered in the raw
> value mapping, so that we can handle quantization range in colorops
> explicitly, allowing us to e.g. handle sub-blacks and super-whites when
> necessary. (These are currently impossible to represent in the legacy
> color properties, because everything is converted to full range and
> clipped before any color operations.)
> 
> > From the given enumerated curves, it's not clear how they would map to the
> > above. Should sRGB EOTF have a max FP16 value of 1.0, and the PQ EOTF a max FP16
> > value of 125.0? That may work, but it tends towards the "descriptive" notion of
> > assuming the source content, which may not be accurate in all cases. This is
> > also an issue for the custom 1D LUT, as the blob will need to be converted to
> > FP16 in order to populate our "degamma" LUT. What should the resulting max FP16
> > value be, given that we no longer have any hint as to the source content?
> 
> In my opinion, all finite non-negative transfer functions should
> operate with [0.0, 1.0] domain and [0.0, 1.0] range, and that includes
> all sRGB, power 2.2, and PQ curves.
> 
> If we look at BT.2100, there is no such encoding even mentioned where
> 125.0 would correspond to 10k cd/m². That 125.0 convention already has
> a built-in assumption what the color spaces are and what the conversion
> is aiming to do. IOW, I would say that choice is opinionated from the
> start. The multiplier in BT.2100 is always 10000.
> 
> Given that elements like various kinds of look-up tables inherently
> assume that the domain is [0.0, 1.0] (because the it is a table that
> has a beginning and an end, and the usual convention is that the
> beginning is zero and the end is one), I think it is best to stick to
> the [0.0, 1.0] range where possible. If we go out of that range, then
> we have to define how a LUT would apply in a sensible way.
> 
> Many TFs are intended to be defined only on [0.0, 1.0] -> [0.0, 1.0].
> Some curves, like power 2.2, have a mathematical form that naturally
> extends outside of that range. Power 2.2 generalizes to >1.0 input
> values as is, but not for negative input values. If needed for negative
> input values, it is common to use y = -TF(-x) for x < 0 mirroring.
> 
> scRGB is the prime example that intentionally uses negative channel
> values. We can also have negative channel values with limited
> quantization range, sometimes even intentionally (xvYCC chroma, or
> PLUGE test sub-blacks). Out-of-unit-range values can also appear as a
> side-effect of signal processing, and they should not get clipped
> prematurely. This is a challenge for colorops that fundamentally cannot
> handle out-of-unit-range values.
> 
> There are various workarounds. scRGB colorimetry can be converted into
> BT.2020 primaries for example, to avoid saturation induced negative
> values. Limited quantization range signal could be processed as-is,
> meaning that the limited range is mapped to [16.0/255, 235.0/255]
> instead of [0.0, 1.0] or so. But then, we have a complication with
> transfer functions.
> 
> > I think a multiplier color op solves all of these issues. Named curves and
> > custom 1D LUTs would by default assume a max FP16 value of 1.0, which would then
> > be adjusted by the multiplier.
> 
> Pretty much.
> 
> > For 80 nit SDR content, set it to 1, for 400
> > nit SDR content, set it to 5, for HDR PQ content, set it to 125, etc. 
> 
> That I think is a another story.
> 
> > > > >>> +
> > > > >>> +    /* custom 4k entry 1D LUT */
> > > > >>> +    Color operation 52
> > > > >>> +    ├─ "TYPE": immutable enum {1D enumerated curve, 1D LUT, 3x3 matrix, 3x4 matrix, 3D LUT, etc.} = 1D LUT
> > > > >>> +    ├─ "BYPASS": bool {true, false}
> > > > >>> +    ├─ "LUT_1D_SIZE": immutable range = 4096
> > > > >>> +    ├─ "LUT_1D": blob
> > > > >>> +    └─ "NEXT": immutable color operation ID = 0  
> > > > > 
> > > > > ...
> > > > >     
> > > > >>> +Driver Forward/Backward Compatibility
> > > > >>> +=====================================
> > > > >>> +
> > > > >>> +As this is uAPI drivers can't regress color pipelines that have been
> > > > >>> +introduced for a given HW generation. New HW generations are free to
> > > > >>> +abandon color pipelines advertised for previous generations.
> > > > >>> +Nevertheless, it can be beneficial to carry support for existing color
> > > > >>> +pipelines forward as those will likely already have support in DRM
> > > > >>> +clients.
> > > > >>> +
> > > > >>> +Introducing new colorops to a pipeline is fine, as long as they can be
> > > > >>> +disabled or are purely informational. DRM clients implementing support
> > > > >>> +for the pipeline can always skip unknown properties as long as they can
> > > > >>> +be confident that doing so will not cause unexpected results.
> > > > >>> +
> > > > >>> +If a new colorop doesn't fall into one of the above categories
> > > > >>> +(bypassable or informational) the modified pipeline would be unusable
> > > > >>> +for user space. In this case a new pipeline should be defined.      
> > > > >>
> > > > >> How can user space detect an informational element? Should we just add a
> > > > >> BYPASS property to informational elements, make it read only and set to
> > > > >> true maybe? Or something more descriptive?    
> > > > > 
> > > > > Read-only BYPASS set to true would be fine by me, I guess.
> > > > >     
> > > > 
> > > > Don't you mean set to false? An informational element will always do
> > > > something, so it can't be bypassed.  
> > > 
> > > Yeah, this is why we need a definition. I understand "informational" to
> > > not change pixel values in any way. Previously I had some weird idea
> > > that scaling doesn't alter color, but of course it may.  
> > 
> > On recent hardware, the NVIDIA pre-blending pipeline includes LUTs that do
> > implicit fixed-point to FP16 conversions, and vice versa.
> 
> Above, I claimed that the UAPI should be defined in nominal
> floating-point values, but I wonder, would that work? Would we need to
> have explicit colorops for converting from raw pixel data values into
> nominal floating-point in the UAPI?
> 
> > For example, the "degamma" LUT towards the beginning of the pipeline implicitly
> > converts from fixed point to FP16, and some of the following operations expect
> > to operate in FP16. As such, if you have a fixed point input and don't bypass
> > those following operations, you *must not* bypass the LUT, even if you are
> > otherwise just programming it with the identity. Conversely, if you have a
> > floating point input, you *must* bypass the LUT.
> 
> Interesting. Since the color pipeline is not(?) meant to replace pixel
> format definitions which already make the difference between fixed and
> floating point, wouldn't this little detail need to be taken care of by
> the driver under the hood?
> 
> What if I want to use degamma colorop with a floating-point
> framebuffer? Simply not possible on this hardware?
> 
> > Could informational elements and allowing the exclusion of the BYPASS property
> > be used to convey this information to the client?  For example, we could expose
> > one pipeline with the LUT exposed with read-only BYPASS set to false, and
> > sandwich it with informational "Fixed Point" and "FP16" elements to accommodate
> > fixed point input. Then, expose another pipeline with the LUT missing, and an
> > informational "FP16" element in its place to accommodate floating point input.
> > 
> > That's just an example; we also have other operations in the pipeline that do
> > similar implicit conversions. In these cases we don't want the operations to be
> > bypassed individually, so instead we would expose them as mandatory in some
> > pipelines and missing in others, with informational elements to help inform the
> > client of which to choose. Is that acceptable under the current proposal?
> > 
> > Note that in this case, the information just has to do with what format the
> > pixels should be in, it doesn't correspond to any specific operation. So, I'm
> > not sure that BYPASS has any meaning for informational elements in this context.
> 
> Very good questions. Do we have to expose those conversions in the UAPI
> to make things work for this hardware? Meaning that we cannot assume all
> colorops work in nominal floating-point from userspace perspective
> (perhaps with varying degrees of precision).

I had this in my original proposal I think (maybe I only thought about
it, not sure).

We really should figure this one out. Can we get away with normalized
[0,1] fp as a user space abstraction or not?

> 
> > > > > I think we also need a definition of "informational".
> > > > > 
> > > > > Counter-example 1: a colorop that represents a non-configurable    
> > > > 
> > > > Not sure what's "counter" for these examples?
> > > >   
> > > > > YUV<->RGB conversion. Maybe it determines its operation from FB pixel
> > > > > format. It cannot be set to bypass, it cannot be configured, and it
> > > > > will alter color values.  
> > 
> > Would it be reasonable to expose this is a 3x4 matrix with a read-only blob and
> > no BYPASS property? I already brought up a similar idea at the XDC HDR Workshop
> > based on the principle that read-only blobs could be used to express some static
> > pipeline elements without the need to define a new type, but got mixed opinions.
> > I think this demonstrates the principle further, as clients could detect this
> > programmatically instead of having to special-case the informational element.
> 

I'm all for exposing fixed color ops but I suspect that most of those
follow some standard and in those cases instead of exposing the matrix
values one should prefer to expose a named matrix (e.g. BT.601, BT.709,
BT.2020).

As a general rule: always expose the highest level description. Going
from a name to exact values is trivial, going from values to a name is
much harder.

> If the blob depends on the pixel format (i.e. the driver automatically
> chooses a different blob per pixel format), then I think we would need
> to expose all the blobs and how they correspond to pixel formats.
> Otherwise ok, I guess.
> 
> However, do we want or need to make a color pipeline or colorop
> conditional on pixel formats? For example, if you use a YUV 4:2:0 type
> of pixel format, then you must use this pipeline and not any other. Or
> floating-point type of pixel format. I did not anticipate this before,
> I assumed that all color pipelines and colorops are independent of the
> framebuffer pixel format. A specific colorop might have a property that
> needs to agree with the framebuffer pixel format, but I didn't expect
> further limitations.

We could simply fail commits when the pipeline and pixel format don't
work together. We'll probably need some kind of ingress no-op node
anyway and maybe could list pixel formats there if required to make it
easier to find a working configuration.

> "Without the need to define a new type" is something I think we need to
> consider case by case. I have a hard time giving a general opinion.
> 
> > > > > 
> > > > > Counter-example 2: image size scaling colorop. It might not be
> > > > > configurable, it is controlled by the plane CRTC_* and SRC_*
> > > > > properties. You still need to understand what it does, so you can
> > > > > arrange the scaling to work correctly. (Do not want to scale an image
> > > > > with PQ-encoded values as Josh demonstrated in XDC.)
> > > > >     
> > > > 
> > > > IMO the position of the scaling operation is the thing that's important
> > > > here as the color pipeline won't define scaling properties.  
> > 
> > I agree that blending should ideally be done in linear space, and I remember
> > that from Josh's presentation at XDC, but I don't recall the same being said for
> > scaling. In fact, the NVIDIA pre-blending scaler exists in a stage of the
> > pipeline that is meant to be in PQ space (more on this below), and that was
> > found to achieve better results at HDR/SDR boundaries. Of course, this only
> > bolsters the argument that it would be helpful to have an informational "scaler"
> > element to understand at which stage scaling takes place.
> 
> Both blending and scaling are fundamentally the same operation: you
> have two or more source colors (pixels), and you want to compute a
> weighted average of them following what happens in nature, that is,
> physics, as that is what humans are used to.
> 
> Both blending and scaling will suffer from the same problems if the
> operation is performed on not light-linear values. The result of the
> weighted average does not correspond to physics.
> 
> The problem may be hard to observe with natural imagery, but Josh's
> example shows it very clearly. Maybe that effect is sometimes useful
> for some imagery in some use cases, but it is still an accidental
> side-effect. You might get even better results if you don't rely on
> accidental side-effects but design a separate operation for the exact
> goal you have.
> 
> Mind, by scaling we mean changing image size. Not scaling color values.
> 
> > > > > Counter-example 3: image sampling colorop. Averages FB originated color
> > > > > values to produce a color sample. Again do not want to do this with
> > > > > PQ-encoded values.
> > > > >     
> > > > 
> > > > Wouldn't this only happen during a scaling op?  
> > > 
> > > There is certainly some overlap between examples 2 and 3. IIRC SRC_X/Y
> > > coordinates can be fractional, which makes nearest vs. bilinear
> > > sampling have a difference even if there is no scaling.
> > > 
> > > There is also the question of chroma siting with sub-sampled YUV. I
> > > don't know how that actually works, or how it theoretically should work.  
> > 
> > We have some operations in our pipeline that are intended to be static, i.e. a
> > static matrix that converts from RGB to LMS, and later another that converts
> > from LMS to ICtCp. There are even LUTs that are intended to be static,
> > converting from linear to PQ and vice versa. All of this is because the
> > pre-blending scaler and tone mapping operator are intended to operate in ICtCp
> > PQ space. Although the stated LUTs and matrices are intended to be static, they
> > are actually programmable. In offline discussions, it was indicated that it
> > would be helpful to actually expose the programmability, as opposed to exposing
> > them as non-bypassable blocks, as some compositors may have novel uses for them.
> 
> Correct. Doing tone-mapping in ICtCp etc. are already policy that
> userspace might or might not agree with.
> 
> Exposing static colorops will help usages that adhere to current
> prevalent standards around very specific use cases. There may be
> millions of devices needing exactly that processing in their usage, but
> it is also quite limiting in what one can do with the hardware.
> 
> > Despite being programmable, the LUTs are updated in a manner that is less
> > efficient as compared to e.g. the non-static "degamma" LUT. Would it be helpful
> > if there was some way to tag operations according to their performance,
> > for example so that clients can prefer a high performance one when they
> > intend to do an animated transition? I recall from the XDC HDR workshop
> > that this is also an issue with AMD's 3DLUT, where updates can be too
> > slow to animate.
> 
> I can certainly see such information being useful, but then we need to
> somehow quantize the performance.
> 
> What I was left puzzled about after the XDC workshop is that is it
> possible to pre-load configurations in the background (slow), and then
> quickly switch between them? Hardware-wise I mean.

We could define that pipelines with a lower ID are to be preferred over
higher IDs.

The issue is that if programming a pipeline becomes too slow to be
useful it probably should just not be made available to user space.

The prepare-commit idea for blob properties would help to make the
pipelines usable again, but until then it's probably a good idea to just
not expose those pipelines.

> 
> 
> Thanks,
> pq


