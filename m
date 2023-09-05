Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156547922AE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 14:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403010E4D8;
	Tue,  5 Sep 2023 12:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E576010E4D8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 12:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693917189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Slvmjn5iaKcyAIEaAiPIhtko6OZCu6rmVWnSBvHXbo=;
 b=UGwaFjVy6/lelMIwty+UVic/37yMyRSwKMwt65sojMMGWNaIAhAeHgnoRwCvtjYmd6ZmUV
 xGtbI/sSWIoXzEnXwR9g4xxOCsKGLPpxqvHN2MPYXOwIztGEEZ3akDIrLLiuY5tco+15yg
 OyCP+zrSNeZ/jSPeThlym8+Js7vXpOk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-rPwHagBoOxGdeJ33GZohJA-1; Tue, 05 Sep 2023 08:33:08 -0400
X-MC-Unique: rPwHagBoOxGdeJ33GZohJA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-993831c639aso177372066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Sep 2023 05:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693917187; x=1694521987;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Slvmjn5iaKcyAIEaAiPIhtko6OZCu6rmVWnSBvHXbo=;
 b=aqdio27r6RiMYNcoi+Pj8QeqjMcMuZ730OazyVwrqhRgcI9M5t15Qn6bxMtnmWkgwJ
 71ivoVtQImn4gD2WAivAi1XIDs6/ntkZ9gpEkjaXP3rOdsUc//EG+uxM8ILVukvG3Yy2
 b78CPrZQ0JTTjKLjKcwZvu2/Xdi2NPeTuQRLaBhRVR3KRqCT6j6FrUYRjBPgmnuvNZFA
 j0sPDan9cfsdeMqf9bIBbyAxKSEhtHjpHMJrRM4yTU71bAvQitLX7eqf4HapVBIK1Ps+
 dufiDyQojyVs+YjKHYWzPEs/O4zbehLqDRxClQuoTHZEceQXuhikvc7GPAk24b9GxGb2
 YyYQ==
X-Gm-Message-State: AOJu0YzRp5s3J09HNfO+zMY4nrjl4NBqwnTaSo08ajre3QF2fmEG3Xrq
 1hxYddW4T6VUu/1Vs/1muolfpAnVbZWVBZjZ8zz5LyfB0TlJnZCpDfMEReXJ00C8juvWKobFBoo
 f/eZVCKJg1/06bX2lSKHvX9up5FOz
X-Received: by 2002:a17:906:30c1:b0:9a1:f521:c404 with SMTP id
 b1-20020a17090630c100b009a1f521c404mr9478127ejb.52.1693917187311; 
 Tue, 05 Sep 2023 05:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdOCLuAjCWz7fIG0x91tQYiLtZA0qzsWjsJvRNXWZ6Avr7cZzXmxSZ7fvm3m5aSeOAI5FERg==
X-Received: by 2002:a17:906:30c1:b0:9a1:f521:c404 with SMTP id
 b1-20020a17090630c100b009a1f521c404mr9478104ejb.52.1693917186939; 
 Tue, 05 Sep 2023 05:33:06 -0700 (PDT)
Received: from toolbox ([2001:9e8:899e:bc00:ba8:f004:5f7b:725b])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a170906805800b009894b476310sm7511025ejw.163.2023.09.05.05.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 05:33:06 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:33:04 +0200
From: Sebastian Wick <sebastian.wick@redhat.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
Message-ID: <20230905123304.GA579774@toolbox>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
 <dbde0306-cc10-420f-a663-663481e127e2@amd.com>
 <PH7PR11MB63548CC6A606C9DD183B5954F4E6A@PH7PR11MB6354.namprd11.prod.outlook.com>
 <20230830211536.GA243703@toolbox>
 <IA1PR11MB63470B60E59FF5F359F6D4A6F4E9A@IA1PR11MB6347.namprd11.prod.outlook.com>
 <20230905143326.38fe5170@eldfell>
MIME-Version: 1.0
In-Reply-To: <20230905143326.38fe5170@eldfell>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 Jonas =?iso-8859-1?Q?=C5dahl?= <jadahl@redhat.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 02:33:26PM +0300, Pekka Paalanen wrote:
> On Mon, 4 Sep 2023 14:29:56 +0000
> "Shankar, Uma" <uma.shankar@intel.com> wrote:
> 
> > > -----Original Message-----
> > > From: Sebastian Wick <sebastian.wick@redhat.com>
> > > Sent: Thursday, August 31, 2023 2:46 AM
> > > To: Shankar, Uma <uma.shankar@intel.com>
> > > Cc: Harry Wentland <harry.wentland@amd.com>; intel-
> > > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; wayland-
> > > devel@lists.freedesktop.org; Ville Syrjala <ville.syrjala@linux.intel.com>; Pekka
> > > Paalanen <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
> > > Melissa Wen <mwen@igalia.com>; Jonas Ådahl <jadahl@redhat.com>; Shashank
> > > Sharma <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>;
> > > Naseer Ahmed <quic_naseer@quicinc.com>; Christopher Braga
> > > <quic_cbraga@quicinc.com>
> > > Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
> > > 
> > > On Wed, Aug 30, 2023 at 08:47:37AM +0000, Shankar, Uma wrote:  
> > > >
> > > >  
> > > > > -----Original Message-----
> > > > > From: Harry Wentland <harry.wentland@amd.com>
> > > > > Sent: Wednesday, August 30, 2023 12:56 AM
> > > > > To: Shankar, Uma <uma.shankar@intel.com>;
> > > > > intel-gfx@lists.freedesktop.org; dri- devel@lists.freedesktop.org
> > > > > Cc: wayland-devel@lists.freedesktop.org; Ville Syrjala
> > > > > <ville.syrjala@linux.intel.com>; Pekka Paalanen
> > > > > <pekka.paalanen@collabora.com>; Simon Ser <contact@emersion.fr>;
> > > > > Melissa Wen <mwen@igalia.com>; Jonas Ådahl <jadahl@redhat.com>;
> > > > > Sebastian Wick <sebastian.wick@redhat.com>; Shashank Sharma
> > > > > <shashank.sharma@amd.com>; Alexander Goins <agoins@nvidia.com>;
> > > > > Naseer Ahmed <quic_naseer@quicinc.com>; Christopher Braga
> > > > > <quic_cbraga@quicinc.com>
> > > > > Subject: Re: [RFC 00/33] Add Support for Plane Color Pipeline
> > > > >
> > > > > +CC Naseer and Chris, FYI
> > > > >
> > > > > See https://patchwork.freedesktop.org/series/123024/ for whole series.
> > > > >
> > > > > On 2023-08-29 12:03, Uma Shankar wrote:  
> > > > > > Introduction
> > > > > > ============
> > > > > >
> > > > > > Modern hardwares have various color processing capabilities both
> > > > > > at pre-blending and post-blending phases in the color pipeline.
> > > > > > The current drm implementation exposes only the post-blending
> > > > > > color hardware blocks. Support for pre-blending hardware is missing.
> > > > > > There are multiple use cases where pre-blending color hardware
> > > > > > will be
> > > > > > useful:
> > > > > > 	a) Linearization of input buffers encoded in various transfer
> > > > > > 	   functions.
> > > > > > 	b) Color Space conversion
> > > > > > 	c) Tone mapping
> > > > > > 	d) Frame buffer format conversion
> > > > > > 	e) Non-linearization of buffer(apply transfer function)
> > > > > > 	f) 3D Luts
> > > > > >
> > > > > > and other miscellaneous color operations.
> > > > > >
> > > > > > Hence, there is a need to expose the color capabilities of the
> > > > > > hardware to user-space. This will help userspace/middleware to use
> > > > > > display hardware for color processing and blending instead of
> > > > > > doing it through GPU shaders.
> > > > > >  
> > > > >
> > > > > Thanks, Uma, for sending this. I've been working on something
> > > > > similar but you beat me to it. :)  
> > > >
> > > > Thanks Harry for the useful feedback and overall collaboration on this so far.
> > > >  
> > > > > >
> > > > > > Work done so far and relevant references
> > > > > > ========================================
> > > > > >
> > > > > > Some implementation is done by Intel and AMD/Igalia to address the same.
> > > > > > Broad consensus is there that we need a generic API at drm core to
> > > > > > suffice the use case of various HW vendors. Below are the links
> > > > > > capturing the discussion so far.
> > > > > >
> > > > > > Intel's Plane Color Implementation:
> > > > > > https://patchwork.freedesktop.org/series/90825/
> > > > > > AMD's Plane Color Implementation:
> > > > > > https://patchwork.freedesktop.org/series/116862/
> > > > > >
> > > > > >
> > > > > > Hackfest conclusions
> > > > > > ====================
> > > > > >
> > > > > > HDR/Color Hackfest was organised by Redhat to bring all the
> > > > > > industry stakeholders together and converge on a common uapi  
> > > expectations.  
> > > > > > Participants from Intel, AMD, Nvidia, Collabora, Redhat, Igalia
> > > > > > and other prominent user-space developers and maintainers.
> > > > > >
> > > > > > Discussions happened on the uapi expectations, opens, nature of
> > > > > > hardware of multiple hardware vendors, challenges in generalizing
> > > > > > the same and the path forward. Consensus was made that drm core
> > > > > > should implement descriptive APIs and not go with prescriptive
> > > > > > APIs. DRM core should just expose the hardware capabilities;
> > > > > > enabling, customizing and programming the same should be done by
> > > > > > the user-space. Driver should just  
> > > > > honor the user space request without doing any operations internally.  
> > > > > >
> > > > > > Thanks to Simon Ser, for nicely documenting the design consensus
> > > > > > and an UAPI RFC which can be referred to here:
> > > > > >
> > > > > > https://lore.kernel.org/dri-devel/QMers3awXvNCQlyhWdTtsPwkp5ie9bze
> > > > > > _hD5
> > > > > >  
> > > > >  
> > > nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1
> > > Q  
> > > > > Wn48  
> > > > > > 8=@emersion.fr/
> > > > > >
> > > > > >
> > > > > > Design considerations
> > > > > > =====================
> > > > > >
> > > > > > Following are the important aspects taken into account while
> > > > > > designing the current RFC
> > > > > > proposal:
> > > > > >
> > > > > > 	1. Individual HW blocks can be muxed. (e.g. out of two HW blocks
> > > > > > only one  
> > > > > can be used)  
> > > > > > 	2. Position of the HW block in the pipeline can be programmable
> > > > > > 	3. LUTs can be one dimentional or three dimentional
> > > > > > 	4. Number of LUT entries can vary across platforms
> > > > > > 	5. Precision of LUT entries can vary across platforms
> > > > > > 	6. Distribution of LUT entries may vary. e.g Mutli-segmented,  
> > > Logarithmic,  
> > > > > > 	   Piece-Wise Linear(PWL) etc
> > > > > > 	7. There can be parameterized/non-parameterized fixed function HW  
> > > > > blocks.  
> > > > > > 	   e.g. Just a hardware bit, to convert from one color space to another.
> > > > > > 	8. Custom non-standard HW implementation.
> > > > > > 	9. Leaving scope for some vendor defined pescriptive
> > > > > > implementation if  
> > > > > required.  
> > > > > > 	10.Scope to handle any modification in hardware as technology
> > > > > > evolves
> > > > > >
> > > > > > The current proposal takes into account the above considerations
> > > > > > while keeping the implementation as generic as possible leaving
> > > > > > scope for future  
> > > > > additions or modifications.  
> > > > > >
> > > > > > This proposal is also in line to the details mentioned by Simon's
> > > > > > RFC covering all the aspects discussed in hackfest.
> > > > > >
> > > > > >
> > > > > > Outline of the implementation
> > > > > > ============================
> > > > > >
> > > > > > Each Color Hardware block will be represented by a data structure  
> > > drm_color_op.  
> > > > > > These color operations will form the building blocks of a color
> > > > > > pipeline which best represents the underlying Hardware. Color
> > > > > > operations can be re-arranged, substracted or added to create
> > > > > > distinct color pipelines to accurately describe the Hardware
> > > > > > blocks present in the display  
> > > > > engine.
> > > > >
> > > > > Who is doing the arranging of color operations? IMO a driver should
> > > > > define one or more respective pipelines that can be selected by
> > > > > userspace. This seems to be what you're talking about after (I
> > > > > haven't reviewed the whole thing yet). Might be best to drop this sentence or  
> > > to add clarifications in order to avoid confusion.  
> > > >
> > > > Yes it's the driver who will set the pipeline based on the underlying
> > > > hardware arrangement and possible combinations. There can be multiple
> > > > pipelines possible if hardware can be muxed or order can be re-arranged (all  
> > > viable combinations should be defined as a pipeline in driver).  
> > > > Yeah, I will re-phrase this to help clarify it and avoid any ambiguity.
> > > >  
> > > > > >
> > > > > > In this proposal, a color pipeline is represented as an array of
> > > > > > struct drm_color_op. For individual color operation, we add blobs
> > > > > > to advertise the capability of the particular Hardware block.
> > > > > >
> > > > > > This color pipeline is then packaged within a blob for the user
> > > > > > space to retrieve it.
> > > > > >  
> > > > >
> > > > > Would it be better to expose the drm_color_ops directly, instead of
> > > > > packing a array of drm_color_ops into a blob and then giving that to  
> > > userspace.  
> > > >
> > > > Advantage we see in packing in blobs is that interface will be
> > > > cleaner. There will be just one GET_COLOR_PIPELINE property to invoke by user  
> > > and then its just parsing the data.  
> > > > This way the entire underlying hardware blocks with pipeline will be available to  
> > > user.
> > > 
> > > I don't see how parsing a blob is easier than requesting the color ops from the
> > > kernel. User space is already equiped with getting KMS objects and the igt test
> > > code from Harry shows that this is all pretty trivial plumbing.  
> > 
> > There are multiple color operations possible with unique lut distribution and
> > capabilities. Also the order of hardware blocks and possibility of multiple pipelines.
> > Having all the information with one query and property and also be able to set the
> > same with just one property call using blobs is better than multiple calls to driver.
> > This can be useful in high refresh rate cases where not much time is there to program
> > the hardware state. Latency of multiple calls to driver can be avoided.
> 
> Hi,
> 
> querying all that information only happens once, at KMS client start-up.
> 
> Setting up a color pipeline is already a single call: the atomic commit ioctl.

Well, clients also issue a bunch of ioctl to set some properties to the
desired state and then you might run through a whole bunch of
configurations to find one that actually works, so there is a case to be
made that there are a lot of ioctls involved.

I just don't think this is an issue right now. Nobody has been
complaining about the ioctls being a limiting factor so why should we
optimize for this? Especially because it brings with it a bunch of
disadvantages.

Anyway, I agree with the sentiment here: this is not something we should
optimize for.

> 
> > 
> > > > For a particular hardware block in pipeline, user can get the relevant
> > > > details from blob representing that particular block. We have created
> > > > IGT tests (links mentioned in cover-letter) to demonstrate how it can be done.  
> > > This is just to clarify the idea.
> > > 
> > > The blob is also not introspectable with the usual tools whereas exposing them as
> > > properties would be.
> > > 
> > > It also would, like Pekka correctly noted, bring a whole bunch of issues about
> > > compatibility and versioning that are well understood with objects
> > > + properties.  
> > 
> > The blob should be standardized in the UAPI and structures to parse them should be fixed.
> > With this compatibility issues can be prevented.
> 
> I think that is short-sighted.
> 
> > > > Also since info is passed via blobs we have the flexibility to even
> > > > define segmented LUTs and PWL hardware blocks. Also we have left scope
> > > > for custom private hardware blocks as well which driver can work with  
> > > respective HAL and get that implemented.
> > > 
> > > When color ops are real KMS objects they still can have properties which are
> > > blobs that can store LUTs and other data.
> > > 
> > > And we should avoid private blocks at all cost. In fact, I don't think the KMS rules
> > > have changed in that regard and it simply is not allowed.  
> > 
> > Private blocks are not standardized but are vendor specific. So generic userspace will
> > ignore these. However vendor and its respective HAL can make use of this field and leaves
> > a scope to cater to such hardware vendors need. This doesn't affect the expectation of the
> > standardized color operations which will be defined as enum in UAPI.
> 
> Vendors can have and expose their own unique snowflake operations
> without any "private" as well: pick an unused operation type code, and
> document what it does. Advertise it in some pipelines.
> 
> Vendor HALs can make use of it, but it also allows generic userspace to
> make use of it at will, and it allows other vendors to implement the
> same and benefit from it without needing to patch every userspace.
> 
> Or does Intel not want other vendors to potentially make use of their
> UAPIs?
> 
> > > > We can even define prescriptive operations as a private entry and
> > > > enable it if a certain driver and HAL agree.
> > > >  
> > > > > > To advertise the available color pipelines, an immutable ENUM
> > > > > > property "GET_COLOR_PIPELINE" is introduced. This enum property has  
> > > blob id's as values.  
> > > > > > With each blob id representing a distinct color pipeline based on
> > > > > > underlying HW capabilities and their respective combinations.
> > > > > >
> > > > > > Once the user space decides on a color pipeline, it can set the
> > > > > > pipeline and the corresponding data for the hardware blocks within
> > > > > > the pipeline with the BLOB property "SET_COLOR_PIPELINE".
> > > > > >  
> > > > >
> > > > > When I discussed this at the hackfest with Simon he proposed a new
> > > > > DRM object, (I've called it a drm_colorop) to represent a color operation.
> > > > > Each drm_colorop has a "NEXT" pointer to another drm_colorop, or
> > > > > NULL if its the last in the pipeline. You can then have a mutable
> > > > > enum property on the plane to discover and select a color pipeline.  
> > > >
> > > > Yes, the proposal is inspired by this idea. Sure, we can work together to enhance  
> > > the design.  
> > > > Personally I feel the one proposed in the current RFC will do the same
> > > > thing envisioned by Simon and you Harry. Management of the pipeline,
> > > > addition, deletion and flexibility to represent hardware is more with blobs with  
> > > the relevant structures agreed in UAPI.  
> > > >  
> > > > > This seems a bit more transparent than a blob. You can see my
> > > > > changes (unfortunately very WIP, don't look too closely at
> > > > > individual patches) at
> > > > > https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5/di
> > > > > ffs
> > > > >
> > > > > libdrm changes:
> > > > > https://gitlab.freedesktop.org/hwentland/drm/-/merge_requests/1/diff
> > > > > s  
> > > >
> > > > Sure, will check the same.
> > > >  
> > > > > IGT changes:
> > > > > https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/merge_reque
> > > > > sts/1/diffs
> > > > >
> > > > > I'll take time to review your whole series and will see whether we
> > > > > can somehow keep the best parts of each.  
> > > >
> > > > Thanks and agree. Let's work together and get this implemented in DRM.
> > > >  
> > > > > Curious to hear other opinions on the blob vs new DRM object question as  
> > > well.
> > > 
> > > I can see a few advantages with the blob approach.
> > > 
> > > User space can store the entire state in one blob and just assign a new blob to
> > > change to another pipeline configuration.  
> > 
> > Agree
> > 
> > > However, I would argue that changing a lot of properties is already common
> > > practice and works well. User space can deal with it and has abstractions to
> > > make this managable.  
> > 
> > Blob gives a lot of flexibility and ability to define the hardware capabilities generically.
> 
> The structure of the atomic commit ioctl and the KMS property system is
> even more flexible.
> 
> > Lut distribution, number of segments, samples in each segment, precision of luts etc.
> > can be precisely defined and userspace will get a complete picture of the underlying
> > hardware and its capabilities. Also this is being done with just 2 properties. Leaving
> > scope for future addition of any standard color operation as well.
> 
> The number of properties does not seem too useful to strictly minimise
> over other aspects.
> 
> 
> Thanks,
> pq
> 
> > 
> > I feel blob approach once properly documented is a bit more flexible and scalable.
> > Maybe I am bit biased here 😊 but all ideas are welcome. 
> > 
> > We have implemented some IGT's as well to explain the design better. Link below:
> > https://patchwork.freedesktop.org/series/123018/
> > 
> > Thanks Sebastian for the feedback.
> > 
> > Regards,
> > Uma Shankar


