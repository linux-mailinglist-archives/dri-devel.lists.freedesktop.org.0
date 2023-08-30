Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB5378E145
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 23:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE69F10E5EF;
	Wed, 30 Aug 2023 21:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2A910E5E4
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693430141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=auhLoaWK0atmYvdVNtn16/PpMkNg0AKfv4HdWl7VL3o=;
 b=EzclF9LA5q5xevXckDSpM1IlgALOvzsBmk+7ROZcEMFJJQNJQVbCV2FLaGruE3jkUO7OMP
 7OZ54GWxSPJmHqe+ERtt/vKKJXYiBZ6iaZpeXpAXXF3kRQatO5M4aBQ1SQxP3SlQ1EeN5W
 tcv/JYFW0IT8oT0pn/jm0sj/WNRDTF0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-wtP7DCBuN3WiLu-BEBJsTA-1; Wed, 30 Aug 2023 17:15:39 -0400
X-MC-Unique: wtP7DCBuN3WiLu-BEBJsTA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fe182913c5so880545e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 14:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693430138; x=1694034938;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=auhLoaWK0atmYvdVNtn16/PpMkNg0AKfv4HdWl7VL3o=;
 b=JgViCkJIBiiliWUXUMLR1UCThQyBbJHL1xfAcqtx1pyRiHU2v1CZZENwFJEV5tLwOs
 +YcmnRWeiIi7pdgfArvaNittsC6SrxCBujLg0VXfDRXOwfk6Y8b2j7VBju1o5W2aLpJJ
 pAxnEFrP/pECIw7HOi99/iNJA3yW/A9d1tx3kK2TWzypqvPG8S3MEKDFXTyow7OmCOVX
 oORCVl8vlFnEQ99kztSqSkoYfeIfbMQI1fFtzJ/AsSG9aPxF+67beeYaf0sMRxmnWbMj
 nt4aDnrbSrNhSSMJDTHnqBhnehXEGFKjr2wiYbP5uzR0FjLsDrORTu5/KZ0lvMvlHbww
 m9XA==
X-Gm-Message-State: AOJu0Yzn1vZ1gDpQXm3+eJlu3Ez5q1+7gPbMBj3dacT6UtJhYrO3TqIK
 /TGWpT2DQeDDbwEUHZdMcn8r7gS/csl54HrRXzhfZpgjeIsfzOb/noK3hCkFLTKNcQH++NBkcvr
 xZgDjc3q1w3cXb5JrYrAuBtd9t1y0
X-Received: by 2002:a1c:6a14:0:b0:401:b3a5:ebff with SMTP id
 f20-20020a1c6a14000000b00401b3a5ebffmr2890595wmc.13.1693430138448; 
 Wed, 30 Aug 2023 14:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZchniH7nevXr7mV5ddmPmK647ud+2h4qC0nRjmaLFnBl9zSLQu8VTysl2z6MpXa5w2Nog/w==
X-Received: by 2002:a1c:6a14:0:b0:401:b3a5:ebff with SMTP id
 f20-20020a1c6a14000000b00401b3a5ebffmr2890577wmc.13.1693430138095; 
 Wed, 30 Aug 2023 14:15:38 -0700 (PDT)
Received: from toolbox ([2001:9e8:89a9:ea00:188d:2ce5:eeb5:8d77])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a1c7704000000b003fefe70ec9csm3280612wmi.10.2023.08.30.14.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Aug 2023 14:15:37 -0700 (PDT)
Date: Wed, 30 Aug 2023 23:15:36 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
Message-ID: <20230830211536.GA243703@toolbox>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <dbde0306-cc10-420f-a663-663481e127e2@amd.com>
 <PH7PR11MB63548CC6A606C9DD183B5954F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH7PR11MB63548CC6A606C9DD183B5954F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 30, 2023 at 08:47:37AM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Harry Wentland <harry.wentland@amd.com>
> > Sent: Wednesday, August 30, 2023 12:56 AM
> > To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
> > devel@lists.freedesktop.org
> > Cc: wayland-devel@lists.freedesktop.org; Ville Syrjala
> > <ville.syrjala@linux.intel.com>; Pekka Paalanen <pekka.paalanen@collabora.com>;
> > Simon Ser <contact@emersion.fr>; Melissa Wen <mwen@igalia.com>; Jonas Ådahl
> > <jadahl@redhat.com>; Sebastian Wick <sebastian.wick@redhat.com>; Shashank
> > Sharma <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>;
> > Naseer Ahmed <quic_naseer@quicinc.com>; Christopher Braga
> > <quic_cbraga@quicinc.com>
> > Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
> > 
> > +CC Naseer and Chris, FYI
> > 
> > See https://patchwork.freedesktop.org/series/123024/ for whole series.
> > 
> > On 2023-08-29 12:03, Uma Shankar wrote:
> > > Introduction
> > > ============
> > >
> > > Modern hardwares have various color processing capabilities both at
> > > pre-blending and post-blending phases in the color pipeline.
> > > The current drm implementation exposes only the post-blending color
> > > hardware blocks. Support for pre-blending hardware is missing.
> > > There are multiple use cases where pre-blending color hardware will be
> > > useful:
> > > 	a) Linearization of input buffers encoded in various transfer
> > > 	   functions.
> > > 	b) Color Space conversion
> > > 	c) Tone mapping
> > > 	d) Frame buffer format conversion
> > > 	e) Non-linearization of buffer(apply transfer function)
> > > 	f) 3D Luts
> > >
> > > and other miscellaneous color operations.
> > >
> > > Hence, there is a need to expose the color capabilities of the
> > > hardware to user-space. This will help userspace/middleware to use
> > > display hardware for color processing and blending instead of doing it
> > > through GPU shaders.
> > >
> > 
> > Thanks, Uma, for sending this. I've been working on something similar but you beat
> > me to it. :)
> 
> Thanks Harry for the useful feedback and overall collaboration on this so far.
> 
> > >
> > > Work done so far and relevant references
> > > ========================================
> > >
> > > Some implementation is done by Intel and AMD/Igalia to address the same.
> > > Broad consensus is there that we need a generic API at drm core to
> > > suffice the use case of various HW vendors. Below are the links
> > > capturing the discussion so far.
> > >
> > > Intel's Plane Color Implementation:
> > > https://patchwork.freedesktop.org/series/90825/
> > > AMD's Plane Color Implementation:
> > > https://patchwork.freedesktop.org/series/116862/
> > >
> > >
> > > Hackfest conclusions
> > > ====================
> > >
> > > HDR/Color Hackfest was organised by Redhat to bring all the industry
> > > stakeholders together and converge on a common uapi expectations.
> > > Participants from Intel, AMD, Nvidia, Collabora, Redhat, Igalia and
> > > other prominent user-space developers and maintainers.
> > >
> > > Discussions happened on the uapi expectations, opens, nature of
> > > hardware of multiple hardware vendors, challenges in generalizing the
> > > same and the path forward. Consensus was made that drm core should
> > > implement descriptive APIs and not go with prescriptive APIs. DRM core
> > > should just expose the hardware capabilities; enabling, customizing
> > > and programming the same should be done by the user-space. Driver should just
> > honor the user space request without doing any operations internally.
> > >
> > > Thanks to Simon Ser, for nicely documenting the design consensus and
> > > an UAPI RFC which can be referred to here:
> > >
> > > https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5
> > >
> > nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1Q
> > Wn48
> > > 8=@emersion.fr/
> > >
> > >
> > > Design considerations
> > > =====================
> > >
> > > Following are the important aspects taken into account while designing
> > > the current RFC
> > > proposal:
> > >
> > > 	1. Individual HW blocks can be muxed. (e.g. out of two HW blocks only one
> > can be used)
> > > 	2. Position of the HW block in the pipeline can be programmable
> > > 	3. LUTs can be one dimentional or three dimentional
> > > 	4. Number of LUT entries can vary across platforms
> > > 	5. Precision of LUT entries can vary across platforms
> > > 	6. Distribution of LUT entries may vary. e.g Mutli-segmented, Logarithmic,
> > > 	   Piece-Wise Linear(PWL) etc
> > > 	7. There can be parameterized/non-parameterized fixed function HW
> > blocks.
> > > 	   e.g. Just a hardware bit, to convert from one color space to another.
> > > 	8. Custom non-standard HW implementation.
> > > 	9. Leaving scope for some vendor defined pescriptive implementation if
> > required.
> > > 	10.Scope to handle any modification in hardware as technology evolves
> > >
> > > The current proposal takes into account the above considerations while
> > > keeping the implementation as generic as possible leaving scope for future
> > additions or modifications.
> > >
> > > This proposal is also in line to the details mentioned by Simon's RFC
> > > covering all the aspects discussed in hackfest.
> > >
> > >
> > > Outline of the implementation
> > > ============================
> > >
> > > Each Color Hardware block will be represented by a data structure drm_color_op.
> > > These color operations will form the building blocks of a color
> > > pipeline which best represents the underlying Hardware. Color
> > > operations can be re-arranged, substracted or added to create distinct
> > > color pipelines to accurately describe the Hardware blocks present in the display
> > engine.
> > 
> > Who is doing the arranging of color operations? IMO a driver should define one or
> > more respective pipelines that can be selected by userspace. This seems to be what
> > you're talking about after (I haven't reviewed the whole thing yet). Might be best to
> > drop this sentence or to add clarifications in order to avoid confusion.
> 
> Yes it's the driver who will set the pipeline based on the underlying hardware arrangement
> and possible combinations. There can be multiple pipelines possible if hardware can be
> muxed or order can be re-arranged (all viable combinations should be defined as a pipeline in driver).
> Yeah, I will re-phrase this to help clarify it and avoid any ambiguity.
> 
> > >
> > > In this proposal, a color pipeline is represented as an array of
> > > struct drm_color_op. For individual color operation, we add blobs to
> > > advertise the capability of the particular Hardware block.
> > >
> > > This color pipeline is then packaged within a blob for the user space
> > > to retrieve it.
> > >
> > 
> > Would it be better to expose the drm_color_ops directly, instead of packing a array
> > of drm_color_ops into a blob and then giving that to userspace.
> 
> Advantage we see in packing in blobs is that interface will be cleaner. There will be just
> one GET_COLOR_PIPELINE property to invoke by user and then its just parsing the data.
> This way the entire underlying hardware blocks with pipeline will be available to user.

I don't see how parsing a blob is easier than requesting the color ops
from the kernel. User space is already equiped with getting KMS objects
and the igt test code from Harry shows that this is all pretty trivial
plumbing.

> For a particular hardware block in pipeline, user can get the relevant details from blob
> representing that particular block. We have created IGT tests (links mentioned in cover-letter)
> to demonstrate how it can be done. This is just to clarify the idea.

The blob is also not introspectable with the usual tools whereas
exposing them as properties would be.

It also would, like Pekka correctly noted, bring a whole bunch of issues
about compatibility and versioning that are well understood with objects
+ properties.

> Also since info is passed via blobs we have the flexibility to even define segmented LUTs and PWL
> hardware blocks. Also we have left scope for custom private hardware blocks as well which driver
> can work with respective HAL and get that implemented.

When color ops are real KMS objects they still can have properties which
are blobs that can store LUTs and other data.

And we should avoid private blocks at all cost. In fact, I don't think
the KMS rules have changed in that regard and it simply is not allowed.

> We can even define prescriptive operations as a private entry and enable it if a certain driver and HAL
> agree.
> 
> > > To advertise the available color pipelines, an immutable ENUM property
> > > "GET_COLOR_PIPELINE" is introduced. This enum property has blob id's as values.
> > > With each blob id representing a distinct color pipeline based on
> > > underlying HW capabilities and their respective combinations.
> > >
> > > Once the user space decides on a color pipeline, it can set the
> > > pipeline and the corresponding data for the hardware blocks within the
> > > pipeline with the BLOB property "SET_COLOR_PIPELINE".
> > >
> > 
> > When I discussed this at the hackfest with Simon he proposed a new DRM object,
> > (I've called it a drm_colorop) to represent a color operation.
> > Each drm_colorop has a "NEXT" pointer to another drm_colorop, or NULL if its the
> > last in the pipeline. You can then have a mutable enum property on the plane to
> > discover and select a color pipeline.
> 
> Yes, the proposal is inspired by this idea. Sure, we can work together to enhance the design.
> Personally I feel the one proposed in the current RFC will do the same thing envisioned by Simon
> and you Harry. Management of the pipeline, addition, deletion and flexibility to represent
> hardware is more with blobs with the relevant structures agreed in UAPI.
> 
> > This seems a bit more transparent than a blob. You can see my changes
> > (unfortunately very WIP, don't look too closely at individual patches) at
> > https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5/diffs
> >
> > libdrm changes:
> > https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1/diffs
> 
> Sure, will check the same.
>  
> > IGT changes:
> > https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_requests/1/diffs
> > 
> > I'll take time to review your whole series and will see whether we can somehow
> > keep the best parts of each.
> 
> Thanks and agree. Let's work together and get this implemented in DRM.
> 
> > Curious to hear other opinions on the blob vs new DRM object question as well.

I can see a few advantages with the blob approach.

User space can store the entire state in one blob and just assign a new
blob to change to another pipeline configuration.

However, I would argue that changing a lot of properties is already
common practice and works well. User space can deal with it and has
abstractions to make this managable.

There also is no need for a new KMS object kindbu from Harrys work so
far the new KMS object kind is surprisingly simple and works just as
expected, which is a good sign.

With the blobs one can store general information about the pipeline and
not only about the color ops themselves. So far it's not clear if we
actually need this, and if we do, we could probably use color ops at the
start of the pipeline which apply to all ops.

There are also a few drawbacks to the blob design. It's not very KMS-y
which makes working with it different than with the rest of KMS and this
mismatch just adds more mental burden. It probably also introduces a new
set of problems that we might not even be aware of. It also makes it
less introspectable as Pekka noted.

When I came up with the KMS Color Pipeline API, I also started with the
blob approach because of the flexibility in it but it does add a fair
amount of hidden complexity. At the hackfest Simon managed to convince
me of the idea of using a new KMS object kind for it and it seemed to
simplify a bunch of things. With Harrys work I would argue that it is
ineed that case. It's pretty simple and still seems to do everything it
needs to.

So, yeah, I'm favoring the color op approach and not the blob approach.

> 
> Yeah, request community and stakeholders to share feedback and suggestions.
> We will work on the feedback to improve the design.
> 
> > > Refer to Documentation/gpu/rfc/plane_color_pipeline.rst added in the
> > > patch
> > >
> > > IGT and test details
> > > ====================
> > >
> > > A set of IGT tests is written to demonstrate the usage of the proposed
> > > UAPIs along with some sanity validation.
> > >
> > > Details of the IGT test can be found here:
> > > https://patchwork.freedesktop.org/series/123018/
> > >
> > > Opens
> > > =====
> > >
> > > a. To come up with a list of common HW blocks which can be defined generically
> > by the DRM
> > >     core in agreement with all the stakeholders b. To enhance/finalize
> > > the data structure to define segmented LUTs generically.
> > >
> > 
> > It would be good to add some basic support in VKMS. My work has been based on
> > VKMS. Once we kinda settle on an approach I'll look at exposing the AMD private
> > properties from Melissa through the API.
> 
> Yeah sure Harry.

I think this is a great idea! Let's see if we can learn some lessons
from both patch series and then continue with the VKMS implementation
and igt tests for it before every vendor implements their view of how
this should all work.

> 
> > >
> > > Out of Scope
> > > ============
> > >
> > > a. The coefficients for CTM and LUT value calculations are out of scope of the
> > proposal.
> > > b. The onus of programming the HW blocks and their values is on user-space.
> > Driver will
> > >     just provide the interface for the same.
> > > c. In order to compute LUT values and coefficients, a helper library can be created
> > in
> > >     user-space. However, it is out of scope for the current proposal.
> > >
> > > Acknowledgements and credits
> > > ============================
> > >
> > > There are multiple contributors who have helped us to reach to this
> > > proposal. Special mention to Ville
> > > Syrjala<ville.syrjala@linux.intel.com>, Pekka
> > > Paalanen<pekka.paalanen@collabora.com>,
> > > Simon Ser<contact@emersion.fr>, Harry
> > > Wentland<harry.wentland@amd.com>, Melissa Wen<mwen@igalia.com>,
> > > Jonas<jadahl@redhat.com>, Sebastian Wick<sebastian.wick@redhat.com>,
> > Bhanu<bhanuprakash.modem@intel.com> and
> > Shashank<shashank.sharma@amd.com>.
> > >
> > > Also, thanks to Carlos <csoriano@redhat.com> and the Redhat team for
> > organizing the HDR hackfest.
> > >
> > >
> > > UAPI dependency and Usermode development
> > > ========================================
> > >
> > > The current KMS implementation requires a user space consumer for it to be
> > accepted upstream.
> > > Work is ongoing in weston and mutter community to get color management
> > > and HDR support implemented in the respective stacks.
> > >
> > 
> > If we can get AMD properties encoded using a Color Pipeline API we can probably
> > use gamescope as the userspace vehicle.
> 
> Yeah, nice.
> 
> > I'm reviewing this in sequence, so there's a chance I'm missing context.
> > Please bear with me if some of my comments are answered later in the series.
> 
> No worries, really appreciate the feedback and support.
> 
> > Again, thanks for sending this.
> 
> Always welcome.
> 
> Regards,
> Uma Shankar
> 
> > Harry
> > 
> > >
> > ====================================================================
> > ==
> > > ===========
> > >
> > > We have tried to take care of all the scenarios and use-cases which
> > > possibly could exists in the current proposal. Thanks to everyone who
> > > has contributed in all color management discussions so far. Let's work
> > > together to improve the current proposal and get this thing implemented in
> > upstream linux. All the feedback and suggestions to enhance the design are
> > welcome.
> > >
> > > Regards,
> > > Uma Shankar
> > > Chaitanya Kumar Borah
> > >
> > > Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> > > Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> > > Cc: Simon Ser <contact@emersion.fr>
> > > Cc: Harry Wentland <harry.wentland@amd.com>
> > > Cc: Melissa Wen <mwen@igalia.com>
> > > Cc: Jonas Ådahl <jadahl@redhat.com>
> > > Cc: Sebastian Wick <sebastian.wick@redhat.com>
> > > Cc: Shashank Sharma <shashank.sharma@amd.com>
> > > Cc: Alexander Goins <agoins@nvidia.com>
> > >
> > > Chaitanya Kumar Borah (14):
> > >    drm: Add color operation structure
> > >    drm: Add plane get color pipeline property
> > >    drm: Add helper to add color pipeline
> > >    drm: Manage color blob states
> > >    drm: Replace individual color blobs
> > >    drm: Reset pipeline when user sends NULL blob
> > >    drm: Reset plane color state on pipeline switch request
> > >    drm/i915/color: Add HDR plane LUT range data to color pipeline
> > >    drm/i915/color: Add SDR plane LUT range data to color pipeline
> > >    drm/i915/color: Add color pipelines to plane
> > >    drm/i915/color: Create and attach set color pipeline property
> > >    drm/i915/color: Enable plane color features
> > >    drm/i915/color: Add a dummy pipeline with 3D LUT
> > >    drm/i915/color: Add example implementation for vendor specific color
> > >      operation
> > >
> > > Uma Shankar (19):
> > >    drm/doc/rfc: Add RFC document for proposed Plane Color Pipeline
> > >    drm: Add structures for setting color pipeline
> > >    drm: Add set colorpipeline property
> > >    drm: Add Enhanced Gamma LUT precision structure
> > >    drm: Add color lut range structure
> > >    drm: Add color information to plane state
> > >    drm/i915/color: Add lut range for SDR planes
> > >    drm/i915/color: Add lut range for HDR planes
> > >    drm/i915/color: Add color pipeline for HDR planes
> > >    drm/i915/color: Add color pipeline for SDR planes
> > >    drm/i915/color: Add plane color callbacks
> > >    drm/i915/color: Load plane color luts from atomic flip
> > >    drm/i915/xelpd: Add plane color check to glk_plane_color_ctl
> > >    drm/i915/xelpd: Add register definitions for Plane Degamma
> > >    drm/i915/color: Add color functions for ADL
> > >    drm/i915/color: Program Plane Pre-CSC Registers
> > >    drm/i915/xelpd: Add register definitions for Plane Post CSC
> > >    drm/i915/xelpd: Program Plane Post CSC Registers
> > >    drm/i915/color: Enable Plane CSC
> > >
> > >   .../gpu/rfc/plane_color_pipeline.rst          | 394 ++++++++++
> > >   drivers/gpu/drm/drm_atomic_state_helper.c     |  21 +
> > >   drivers/gpu/drm/drm_atomic_uapi.c             | 218 ++++++
> > >   drivers/gpu/drm/drm_color_mgmt.c              | 130 ++++
> > >   drivers/gpu/drm/i915/display/intel_color.c    | 684 +++++++++++++++++-
> > >   drivers/gpu/drm/i915/display/intel_color.h    |   7 +-
> > >   .../drm/i915/display/skl_universal_plane.c    |  21 +-
> > >   drivers/gpu/drm/i915/i915_reg.h               | 124 ++++
> > >   include/drm/drm_plane.h                       |  82 +++
> > >   include/uapi/drm/drm_mode.h                   | 196 +++++
> > >   include/uapi/drm/i915_drm.h                   |  25 +
> > >   11 files changed, 1899 insertions(+), 3 deletions(-)
> > >   create mode 100644 Documentation/gpu/rfc/plane_color_pipeline.rst
> > >

