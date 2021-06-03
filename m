Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49E39A0EA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 14:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BC36E171;
	Thu,  3 Jun 2021 12:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from h1954565.stratoserver.net (sebastianwick.net
 [IPv6:2a01:238:4226:4f00:79f5:2d39:beca:3cf1])
 by gabe.freedesktop.org (Postfix) with ESMTP id 039306E171
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 12:30:50 +0000 (UTC)
Received: by h1954565.stratoserver.net (Postfix, from userid 117)
 id 5CA2D16411A; Thu,  3 Jun 2021 14:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 h1954565.stratoserver.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.2
Received: from mail.sebastianwick.net (localhost [IPv6:::1])
 by h1954565.stratoserver.net (Postfix) with ESMTP id 188D6164106;
 Thu,  3 Jun 2021 14:30:41 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 03 Jun 2021 14:30:41 +0200
From: Sebastian Wick <sebastian@sebastianwick.net>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
In-Reply-To: <20210603114730.08e66ad0@eldfell>
References: <20210601105218.29185-1-uma.shankar@intel.com>
 <20210602122850.29412a29@eldfell>
 <5a9a8c3ee8d54c3ca2ccaca4aa5ad1d9@intel.com>
 <95e6a3e9-70d2-42d3-1289-a7de33f266c4@amd.com>
 <20210603114730.08e66ad0@eldfell>
Message-ID: <740c5f2c1db7d8152b3932a8d7cd7c55@sebastianwick.net>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Shankar,
 Uma" <uma.shankar@intel.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-03 10:47, Pekka Paalanen wrote:
> On Wed, 2 Jun 2021 19:42:19 -0400
> Harry Wentland <harry.wentland@amd.com> wrote:
> 
>> On 2021-06-02 4:22 p.m., Shankar, Uma wrote:
>> >
>> >
>> >> -----Original Message-----
>> >> From: Pekka Paalanen <ppaalanen@gmail.com>
>> >> Sent: Wednesday, June 2, 2021 2:59 PM
>> >> To: Shankar, Uma <uma.shankar@intel.com>
>> >> Cc: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Modem,
>> >> Bhanuprakash <bhanuprakash.modem@intel.com>; Harry Wentland
>> >> <harry.wentland@amd.com>
>> >> Subject: Re: [PATCH 00/21] Add Support for Plane Color Lut and CSC features
>> >>
>> >> On Tue,  1 Jun 2021 16:21:57 +0530
>> >> Uma Shankar <uma.shankar@intel.com> wrote:
>> >>
>> >>> This is how a typical display color hardware pipeline looks like:
> 
> ...
> 
>> >>> This patch series adds properties for plane color features. It adds
>> >>> properties for degamma used to linearize data and CSC used for gamut
>> >>> conversion. It also includes Gamma support used to again non-linearize
>> >>> data as per panel supported color space. These can be utilize by user
>> >>> space to convert planes from one format to another, one color space to
>> >>> another etc.
>> >>
>> >> This is very much welcome!
>> >>
>> >> There is also the thread:
>> >> https://lists.freedesktop.org/archives/dri-devel/2021-May/306726.html>>>
>> >> Everything mentioned will interact with each other by changing what the abstract
>> >> KMS pixel pipeline does. I think you and Harry should probably look at each others'
>> >> suggestions and see how to fit them all into a single abstract KMS pipeline.
>> >>
>> >> People are adding new pieces into KMS left and right, and I fear we lose sight of how
>> >> everything will actually work together when all KMS properties are supposed to be
>> >> generic and potentially present simultaneously. This is why I would very much like to
>> >> have that *whole* abstract KMS pipeline documented with *everything*. Otherwise
>> >> it is coming really hard fast to figure out how generic userspace should use all these
>> >> KMS properties together.
>> >>
>> >> Or if there cannot be a single abstract KMS pipeline, then sure, have multiple, as long
>> >> as they are documented and how userspace will know which pipeline it is dealing
>> >> with, and what things are mutually exclusive so we can avoid writing userspace code
>> >> for combinations that will never exist.
>> >
>> > This is a good suggestion to have the whole pipeline and properties documented along with
>> > the exact usages. We may end with 2 properties almost doing similar work but needed due to
>> > underlying hardware, but we can get that properly documented and defined.
>> >
>> > I will discuss with Harry and Ville as well to define this.
>> >
>> 
>> Just wanted to let you know that I've seen and read through both of 
>> Shankar's patchsets
>> and had some thoughts but haven't found the time to respond. I will 
>> respond soon.
> 
> Hi Harry,
> 
> awesome!
> 
>> I very much agree with Pekka. We need to make sure this all plays well 
>> together and is
>> well documented. Maybe a library to deal with DRM KMS color 
>> management/HDR would even
>> be helpful. Not sure yet how I feel about that.
> 
> That is an excellent question. While I am working on Weston CM&HDR, I
> already have issues with how to represent the color related
> transformations. These new hardware features exposed here are nothing I
> have prepared for, and would probably need changes to accommodate.
> 
> The main Weston roadmap is drafted in
> https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> 
> The MR that introduces the concept of a color transformation, and also
> the whole beginnings of color management, is
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582
> 
> In that MR, there is a patch introducing struct weston_color_transform:
> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/582/diffs?commit_id=cffbf7c6b2faf7391b73ff9202774f660343bd34#ba0b86259533d5000d81c9c88109c9010eb0f641_0_77
> 
> The design idea there is that libweston shall have what I call "color
> manager" module. That module handles all the policy decisions about
> color, it uses a CMM (Little CMS 2 in this case) for all the color
> profile computations, and based on all information it has available
> from display EDID, ICC profile files, Wayland clients via the CM&HDR
> protocol extension and more, it will ultimately produce
> weston_color_transform objects.
> 
> weston_color_transform is a complete description of how to map a pixel
> in one color model/space/encoding into another, maybe with user
> preferred tuning/tone-mapping. E.g. from client content to the output's
> blending space (output space but light-linear), or from output's
> blending space to output's framebuffer space or maybe even monitor wire
> space.
> 
> The mapping described by weston_color_transform shall be implemented by
> libweston's GL-renderer or by the DRM-backend using KMS properties,
> whatever works for each case. So the description cannot be opaque, it
> has to map to GLSL shaders (easy) and KMS properties (???).
> 
> Now the problem is, what should weston_color_transform look like?
> 
> The current design has two steps in a color transform:
> - Transfer function: identity, the traditional set of three 1D LUTs, or
>   something else.
> - Color mapping: identity, a 3D LUT, or something else.
> 
> "Something else" is a placeholder for whatever we want to have, but the
> problem in adding new types of transfer function or color mapping
> representations (e.g. the fancy new GAMMA_MODEs) is how will the color
> manager create the parameters for those?

I think the weston_color_transform is going a bit in the wrong
direction. While the 3D LUT can describe everything if it has enough
precision it indeed makes sense to apply a transform before to get the
required precision down. It doesn't have to be a TF though and we really
don't care what it is as long as in the end the content is in the
correct color space and dynamic range. This might be enough to get
something off the ground right now though.

In the long run however it probably makes more sense to convert the
color transform to a complete pipeline of enumerated, parametric and
numerical elements together with some helpers to lower (enumerated >
parametric > numerical) and fuse elements (to the point that you can
always convert the pipeline to a 3D LUT). The color manager ideally
should provide a pipeline with the highest abstraction and avoid fusing
elements if it would result in a lose of information. This is a lot more
complex but it also gives us much better chances of finding a way to
offload the transform.

AFAIR lcms uses such a model and gives you access to the pipeline. If we
want to be independent of lcms we would need our own descriptions and
possibly lower some lcms elements to our own stuff. I'm also not sure
how good lcms is at retaining the high level description if possible.

> If we have ICC profiles as the original data, then we are probably
> limited to what LCMS2 can produce. The issue with ICC profiles is that
> they may contain 3D LUTs themselves, so not what I would call a
> parametric model. OTOH, if we have, say, enumerated operations defined
> by various HDR standards, we have to code those ourselves and then
> producing whatever fancy representation is less of a problem.
> 
> Maybe that is how it has to be. If the color transformations are
> defined by ICC profiles, we might be stuck with old-school KMS color
> properties, but HDR stuff that doesn't rely on ICC can use the fancier
> KMS properties. I'm sure interesting questions will arise when e.g. you
> have the monitor in HDR mode, described with standard HDR terms, and
> then you have application content described with an ICC profile (maybe
> SDR, maybe not).
> 
> We can always get a 3D LUT out of LCMS2, so theoretically it would be
> possible to get a huge LUT and then optimise whatever parameterised
> model you have to that data set. But I worry that might be too costly
> to do in-flight, at least in a way that blocks the compositor. Maybe do
> what I hear shader compilers do: produce an unoptimal model fast, then
> compute an optimised model asynchronously and replace when ready. And
> disk cache(?).
> 
> A library probably makes sense in the long run, but for now, I would
> have no idea at all what it should look like.
> 
> 
> Thanks,
> pq
