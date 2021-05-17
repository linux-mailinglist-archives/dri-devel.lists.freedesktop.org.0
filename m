Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D9383A73
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 18:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D0D6E9F0;
	Mon, 17 May 2021 16:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h1954565.stratoserver.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84A6F6E9F0;
 Mon, 17 May 2021 16:48:50 +0000 (UTC)
Received: by h1954565.stratoserver.net (Postfix, from userid 117)
 id 3BFCB163EEF; Mon, 17 May 2021 18:48:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 h1954565.stratoserver.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from mail.sebastianwick.net (localhost [IPv6:::1])
 by h1954565.stratoserver.net (Postfix) with ESMTP id 01F85163EE9;
 Mon, 17 May 2021 18:48:42 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 17 May 2021 18:48:42 +0200
From: Sebastian Wick <sebastian@sebastianwick.net>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
In-Reply-To: <20210517115726.4fc1c710@eldfell>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
Message-ID: <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
X-Sender: sebastian@sebastianwick.net
User-Agent: Roundcube Webmail/1.3.4
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, mcasas@google.com,
 Shashank.Sharma@amd.com, Bhawanpreet.Lakha@amd.com,
 dri-devel@lists.freedesktop.org, Shirish.S@amd.com, hersenxs.wu@amd.com,
 amd-gfx@lists.freedesktop.org, laurentiu.palcu@oss.nxp.com,
 Nicholas.Kazlauskas@amd.com, Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-05-17 10:57, Pekka Paalanen wrote:
> On Fri, 14 May 2021 17:05:11 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-04-27 10:50 a.m., Pekka Paalanen wrote:
>> > On Mon, 26 Apr 2021 13:38:49 -0400
>> > Harry Wentland <harry.wentland@amd.com> wrote:
> 
> ...
> 
>> >> ## Mastering Luminances
>> >>
>> >> Now we are able to use the PQ 2084 EOTF to define the luminance of
>> >> pixels in absolute terms. Unfortunately we're again presented with
>> >> physical limitations of the display technologies on the market today.
>> >> Here are a few examples of luminance ranges of displays.
>> >>
>> >> | Display                  | Luminance range in nits |
>> >> | ------------------------ | ----------------------- |
>> >> | Typical PC display       | 0.3 - 200               |
>> >> | Excellent LCD HDTV       | 0.3 - 400               |
>> >> | HDR LCD w/ local dimming | 0.05 - 1,500            |
>> >>
>> >> Since no display can currently show the full 0.0005 to 10,000 nits
>> >> luminance range the display will need to tonemap the HDR content, i.e
>> >> to fit the content within a display's capabilities. To assist with
>> >> tonemapping HDR content is usually accompanied with a metadata that
>> >> describes (among other things) the minimum and maximum mastering
>> >> luminance, i.e. the maximum and minimum luminance of the display that
>> >> was used to master the HDR content.
>> >>
>> >> The HDR metadata is currently defined on the drm_connector via the
>> >> hdr_output_metadata blob property.
>> >>
>> >> It might be useful to define per-plane hdr metadata, as different
>> >> planes might have been mastered differently.
>> >
>> > I don't think this would directly help with the dynamic range blending
>> > problem. You still need to establish the mapping between the optical
>> > values from two different EOTFs and dynamic ranges. Or can you know
>> > which optical values match the mastering display maximum and minimum
>> > luminances for not-PQ?
>> >
>> 
>> My understanding of this is probably best illustrated by this example:
>> 
>> Assume HDR was mastered on a display with a maximum white level of 500
>> nits and played back on a display that supports a max white level of 
>> 400
>> nits. If you know the mastering white level of 500 you know that this 
>> is
>> the maximum value you need to compress down to 400 nits, allowing you 
>> to
>> use the full extent of the 400 nits panel.
> 
> Right, but in the kernel, where do you get these nits values from?
> 
> hdr_output_metadata blob is infoframe data to the monitor. I think this
> should be independent of the metadata used for color transformations in
> the display pipeline before the monitor.
> 
> EDID may tell us the monitor HDR metadata, but again what is used in
> the color transformations should be independent, because EDIDs lie,
> lighting environments change, and users have different preferences.
> 
> What about black levels?
> 
> Do you want to do black level adjustment?
> 
> How exactly should the compression work?
> 
> Where do you map the mid-tones?
> 
> What if the end user wants something different?

I suspect that this is not about tone mapping at all. The use cases
listed always have the display in PQ mode and just assume that no
content exceeds the PQ limitations. Then you can simply bring all
content to the color space with a matrix multiplication and then map the
linear light content somewhere into the PQ range. Tone mapping is
performed in the display only.

 From a generic wayland compositor point of view this is uninteresting.

I completely agree with what you said below though. I would even argue
that all generic KMS abstract pipeline elements must have a well defined
place in the pipeline and follow an exact specified formula.

> 
>> If you do not know the mastering luminance is 500 nits you would
>> have to compress 10,000 nits down to 400 (assuming PQ), losing quite
>> a bit of the full 400 nits available as you'll need room to map the 
>> 500
>> to 10,000 nits range which in reality is completely unused. You might 
>> end
>> up with mapping 500 nits to 350 nits, instead of mapping it to 400.
> 
> The quality of the result depends on the compression (tone-mapping)
> algorithm. I believe no-one will ever do a simple linear compression of
> ranges.
> 
> Instead, you probably do something smooth in the black end, keep
> mid-tones roughly as they are, and the again do a smooth saturation to
> some "reasonable" level that goes well with the monitor in the current
> lighting environment without introducing coloring artifacts, and just
> clip the huge overshoot of the full PQ-range.
> 
> There are many big and small decisions to be made in how to map
> out-of-gamut or out-of-brightness values into the displayable range,
> and no algorithm fits all use cases. I believe this is why e.g. ICC
> has several different "render intents", some of which are so vaguely
> defined that they are practically undefined - just like what "a good
> picture" means. You have essentially three dimensions: luminance, hue,
> and saturation. Which one will you sacrifice, shift or emphasize and to
> what degree to fit the square content peg into the round display hole?
> 
> A naive example: Let's say content has 300 nits red. Your display can
> show max 400 nits white or max 180 nits red, and anything in between.
> What will you show?
> 
> The problem is, that if UAPI does not define exactly what happens, then
> taking advantage of these hardware capabilities means you have no idea
> what happens to your content. This may be fine for closed systems, 
> where
> the software has been carefully built for the specific hardware
> revision and the use cases of the complete system have been
> pre-defined, so that it can assume what should and will happen. But
> should that be exposed as a generic UAPI, when generic userspace has no
> chance of knowing what it will do?
> 
> 
> ...
> 
>> >> ## Displays and Tonemapping
>> >>
>> >> External displays are able to do their own tone and color mapping,
>> >> based on the mastering luminance, color primaries, and white space
>> >> defined in the HDR metadata.
>> >>
>> >> Internal panels (which are currently few and far between) usually
>> >> don't include the complex HW to do tone and color mapping on their
>> >> own and will require the display driver to perform appropriate
>> >> mapping.
>> >
>> > FWIW, when designing Weston's color management, we are aiming for
>> > the latter "simple" panels foremost, because that gives us full control
>> > of all color conversions and tone mappings.
>> >
>> > OTOH, if Weston has to present to a display which only accepts e.g.
>> > BT.2020/PQ signal, the display might always mangle the image in
>> > unexpected ways. Therefore I expect that by default Weston will do
>> > everything it can to try to make the display not apply anything magic
>> > image enhancement: trust that EDID description of the display gamut and
>> > dynamic range are correct, and use HDR metadata to tell the display
>> > that those values are exactly what we are using. And we use them.
>> >
>> > IMO, a display doing its tone mapping magically is only useful when you
>> > want to be able to use "simple" playback devices that cannot adapt to
>> > the display they are driving. Magic tone mapping is also a way for
>> > hardware vendors to differentiate, which from the color management
>> > perspective is harmful as it makes it more difficult or impossible to
>> > predict the display behaviour or to keep it consistent.
>> >
>> > So there are two opposing goals:
>> >
>> > - Traditional color management wants absolute control of the display,
>> >   leaving nothing unpredictable and preferably also nothing undefined.
>> >   Undefined behaviour can always be measured (profiled) which makes it
>> >   predictable and known. The viewing environment is controlled and
>> >   constant.
>> >
>> > - Entertainment wants the most visually impressive image quality by
>> >   dynamically adapting to both displayed content and to the viewing
>> >   environment conditions.
>> >
>> 
>> I feel much of the mess around HDR and CM is all the magic that 
>> everyone
>> tries to do to differentiate themselves. I'm not a fan of that.
>> 
>> One thing to watch out for is that the definitions for some of these
>> things (I'm thinking PWL LUTs, 3D LUT, SDR boots) might differ a fair
>> bit between HW vendors and we'd want to find a way to hide these
>> complexities to KMS clients.
> 
> How could we hide them?
> 
> Actually, what do you mean with "hide"?
> 
> 
> ...
> 
>> >> **One ARGB8888 SDR Plane + One P010 HDR Plane:** A normal 8bpc
>> >> desktop plane, with a P010 HDR video plane underlayed. The HDR plane
>> >> shall be PQ BT.2020 formatted. The desktop plane shall specify an SDR
>> >> boost value. The drm_connector's hdr_output_metadata shall be set.
>> >
>> > This use case requires blending in KMS, so is the primary goal I
>> > suppose.
>> >
>> 
>> Correct, my understanding is that the key here is to ensure blending 
>> in KMS
>> is done in same blending space (linear RGB) as blending using GPU 
>> shaders and
>> SDR boost is applied in the same fashion.
> 
> Yes, but this is also something I think cannot be achieved by telling
> the kernel about color spaces and letting the driver come up with a
> color transformation. I believe this can only be achieved by telling
> the kernel the color transformation directly, and also describing to
> userspace what kind of color transformations are possible (1D LUT, 3D
> LUT, other; precision...).
> 
> ...
> 
>> >> ## Summary of proposed interface changes
>> >>
>> >> per drm_plane:
>> >> - new RGB color space definitions, mirroring the existing YUV color
>> >> space definitions
>> >> - new transfer function property
>> >> - new SDR maximum white level property
>> >
>> > How will these new KMS properties interact with per-plane DEGAMMA, CTM
>> > and/or GAMMA properties?
>> >
>> > Why go with your proposal instead of per-plane CTM and LUT?
>> >
>> > I think the ideal KMS pipeline for me, assuming I cannot have 3D LUTs
>> > both per-plane and on CRTC, would be:
>> >
>> > plane:
>> > 	FB -> M1 -> LUT1 -> M2 -> blending input
>> >
>> > CRTC:
>> > 	blending output -> LUT2 -> M3 -> connector
>> >
>> > FB: framebuffer
>> > M1: matrix transform, capable of converting e.g. YCbCr to RGB
>> > LUT1: 1D LUT for content EOTF, to produce light-linear RGB
>> > M2: matrix transform for color space transformation
>> >
>> > LUT2: 1D LUT for applying monitor EOTF^-1
>> > M3: matrix transform, e.g. if you need to push YCbCr on the connector
>> >
>> > We also need to know where and how clipping happens.
>> >
>> > I think this scheme would allow implementing everything you want, and
>> > it would not be tied to rigid enumerations, and it won't have any
>> > magical conversions done under the hood as you would need to do to
>> > convert from one enum space to another. It leaves the render intent to
>> > be defined by the userspace compositor, rather than building a fixed
>> > policy in the kernel.
>> >
>> > Userspace would be setting transformation operators, not color spaces,
>> > to the kernel, allowing the blending space to be chosen by userspace.
>> > In Weston we aim to choose then blending color space to be the same as
>> > the output color space, except in optical (linear) encoding. The output
>> > color space can be non-standard, e.g. measured with a display profiler
>> > equipment.
>> >
>> > I would expect gamut mapping, dynamic range mapping and tone mapping to
>> > be places where most experimentation and innovation happens, so
>> > implementing them in the kernel with just few or no controllable
>> > parameters at this time seems like it could become useless fast.
>> >
>> 
>> How important from a Wayland compositor perspective would it be to 
>> have fully
>> configurable LUTs per plane, as opposed to providing KMS with a named 
>> transfer
>> function, such as PQ or BT709, for LUT1 and LUT2?
> 
> For Wayland desktop compositors, absolutely essential in my opinion.
> 
> I would strongly advice against any desktop compositor from using the
> "named transfer function" API and instead do everything in GPU shaders
> if no other KMS way exists, unless the KMS UAPI definition gives the
> exact mathematical formula of what that step will do.
> 
> For entertainment devices using Wayland as an internal detail, who
> cares. The system manufacturer makes things work any way they want, and
> you cannot run non-curated apps on those devices, so there are no
> compatibility issues.
> 
> Then there would be systems between those two extremes, which would
> likely use a mixture of those approaches, e.g. Kodi on bare hardware I
> imagine (no Wayland there, but Wayland is kind of unrelated except for
> the ideology).
> 
> Mind, I'm not talking only about EOTFs here, but thinking of the whole
> color management. EOTFs per se are simple. Tone-mapping, including 
> gamut
> mapping and luminance mapping, are hard because there is no one correct
> formula.
> 
> However, if we are talking about *only* EOTFs, then an enumeration of
> the curves could be usable. But you were also talking about configuring
> dynamic ranges and doing luminance range mapping in the driver, which I
> think won't work with enums, but could perhaps be accounted for in M2
> by userspace. Then again, if you have enums and not a LUT, you cannot
> implement custom non-linear per-channel mapping which might be useful
> for e.g. adapting SDR content for a HDR blending space. Or HDR content
> to a different HDR blending space.
> 
> See, a LUT can be more than just EOTF: it can apply a part of the
> tone-mapping too. An enum cannot.
> 
> I have a feeling that most tone-mapping curves would be non-linear with
> some sort of S-shape and clipping of black and white ends. But that is
> also a naive view, because tone-mapping is not a 1D-curve, it's a
> mapping from R^3 to R^3 in RGB since on a 600 nit monitor you cannot do
> 600 nit red for instance. On a 600 nit monitor you can do exactly one
> color with 600 nits: white.
> 
>> M1 on AMD's driver is currently hidden in our driver and essentially 
>> always
>> set to BT709 at the moment, though we should look at color_encoding to 
>> pick
>> the right M1. Are the color_encoding and color_range properties enough 
>> for
>> what you'd like to achieve for M1?
> 
> Probably yes, for standard format content, until a new standard comes 
> up
> again and then you have to add another enum value in the UAPI. M1 is
> probably the best place where an enum fits in the pipeline though, and
> for M3 as well because non-RGB inputs to monitors are quite
> standardised, and at those steps I would assume there are no parts of
> tone-mapping done.
> 
>> M3, currently the only matrix exposed by KMS (on drm_crtc) currently 
>> seems to be
>> applied at M2 by AMD's driver. I need to dig into this a bit more. It 
>> would
>> make sense to expose M2 and M3 as part of KMS (on drm_crtc and 
>> drm_plane).
> 
> Good, it's really important to make sure that all drivers agree on the
> pipeline layout that is defined(???) in the KMS UAPI specification.
> 
>> I did a bunch of reading and thinking since your comments and created 
>> a v2 of
>> the patchset. I don't think it's where we need it to be but I hope 
>> it's a
>> step in the right direction. I will send it shortly.
> 
> I have to say I'm still very sceptical about this enum-based approach
> as you have noticed. :-)
> 
> 
> Thanks,
> pq
