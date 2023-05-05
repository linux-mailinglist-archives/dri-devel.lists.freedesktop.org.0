Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1056F864C
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 17:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5610E629;
	Fri,  5 May 2023 15:57:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A510210E629
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683302272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMfCTP4ItjofUzGKy3k09McA9DWM2PdNYyvLgz38qgo=;
 b=H5LFvHkJ5GBuzNPINylQvuB+13wpILBIDbJJ5QYUKOWm9A8zAqipJeJaNYcCvVNUl0HYTO
 8TICEXfwBj6xVL0HkhiVKeZaVOPnzkREJiMFHAWYdCc6dmGGd3XxhyHytY2lWIe0TFYtwR
 wYPgML9nJuv1xpRDF5OVeeM01wFWkQM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-cOTyxTiOPVSGbjbXVRguoA-1; Fri, 05 May 2023 11:57:50 -0400
X-MC-Unique: cOTyxTiOPVSGbjbXVRguoA-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2ac752eeaecso10211841fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 May 2023 08:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683302269; x=1685894269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMfCTP4ItjofUzGKy3k09McA9DWM2PdNYyvLgz38qgo=;
 b=HstlJqVdhaQvAT2EOlIIPitzLx3igg5dokhxSfvkaaqpocG/U/kNpimY5pmV9XxUjk
 6JZIQuDL8Iu+x0VmPpGlwX6FkBDxYSqdib4i90tARZk7xhcdy0qDuB5/crd5Uy5y2qZq
 W6wQw/j9RgQcJLYFGgUEkGGcuSgOipXh4WjFL9DKHvVVWZtSgOD/r4gdcrrYSIwpEt71
 VofPYHxK3gOwh1+Hc/49YMAQCQLZ25d6tUyVPezONosnK+v/ZPucNslpDDXqVYyv9gde
 CMn48C7pZsjSsM2m0AmubPFpYx7RWWHb08t32hPdpWWgcsTFbRt8lFx+In2Oj48QpZrX
 7fYA==
X-Gm-Message-State: AC+VfDzmKHoyl8ZpUrphjvEoF7lk26UHNIDgK5mxYcd43j7bR33O19ah
 wN8vOijKR0eecLfaIwCfpEaVXP4sCRgW/+3/7m0/jUczQpjypbXJNbIaa7Cecxl+FOEOIbmpAto
 /YBUpJpNzolB3ufRyEqw2MBjiZ9OB1gqYpawBCX6hNLit
X-Received: by 2002:a2e:a3d7:0:b0:2a7:79e6:1625 with SMTP id
 w23-20020a2ea3d7000000b002a779e61625mr607051lje.37.1683302269032; 
 Fri, 05 May 2023 08:57:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ47ls4Ouu34+n1PLg47pqhswIiiwUjSDsAlUFzuUucL3cP6fKWR7EyRvYunMgWH1YKi0GBuWtQltCHPo6bHn44=
X-Received: by 2002:a2e:a3d7:0:b0:2a7:79e6:1625 with SMTP id
 w23-20020a2ea3d7000000b002a779e61625mr607024lje.37.1683302268556; Fri, 05 May
 2023 08:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <ZFUgnMI4IIbv78By@phenom.ffwll.local>
In-Reply-To: <ZFUgnMI4IIbv78By@phenom.ffwll.local>
From: Sebastian Wick <sebastian.wick@redhat.com>
Date: Fri, 5 May 2023 17:57:37 +0200
Message-ID: <CA+hFU4wbU-FEkk2YrKOPOMNgODNbXXpmzi5EH5Pf3gJO08bQmw@mail.gmail.com>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
To: Daniel Vetter <daniel@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Joshua Ashton <joshua@froggi.es>, Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 5, 2023 at 5:28=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> On Thu, May 04, 2023 at 03:22:59PM +0000, Simon Ser wrote:
> > Hi all,
> >
> > The goal of this RFC is to expose a generic KMS uAPI to configure the c=
olor
> > pipeline before blending, ie. after a pixel is tapped from a plane's
> > framebuffer and before it's blended with other planes. With this new uA=
PI we
> > aim to reduce the battery life impact of color management and HDR on mo=
bile
> > devices, to improve performance and to decrease latency by skipping
> > composition on the 3D engine. This proposal is the result of discussion=
s at
> > the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
> > familiar with the AMD, Intel and NVIDIA hardware have participated in t=
he
> > discussion.
> >
> > This proposal takes a prescriptive approach instead of a descriptive ap=
proach.
> > Drivers describe the available hardware blocks in terms of low-level
> > mathematical operations, then user-space configures each block. We deci=
ded
> > against a descriptive approach where user-space would provide a high-le=
vel
> > description of the colorspace and other parameters: we want to give mor=
e
> > control and flexibility to user-space, e.g. to be able to replicate exa=
ctly the
> > color pipeline with shaders and switch between shaders and KMS pipeline=
s
> > seamlessly, and to avoid forcing user-space into a particular color man=
agement
> > policy.
>
> Ack on the prescriptive approach, but generic imo. Descriptive pretty muc=
h
> means you need the shaders at the same api level for fallback purposes,
> and we're not going to have that ever in kms. That would need something
> like hwc in userspace to work.

Which would be nice to have but that would be forcing a specific color
pipeline on everyone and we explicitly want to avoid that. There are
just too many trade-offs to consider.

> And not generic in it's ultimate consquence would mean we just do a blob
> for a crtc with all the vendor register stuff like adf (android display
> framework) does, because I really don't see a point in trying a
> generic-looking-but-not vendor uapi with each color op/stage split out.
>
> So from very far and pure gut feeling, this seems like a good middle
> ground in the uapi design space we have here.

Good to hear!

> > We've decided against mirroring the existing CRTC properties
> > DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
> > pipeline can significantly differ between vendors and this approach can=
not
> > accurately abstract all hardware. In particular, the availability, orde=
ring and
> > capabilities of hardware blocks is different on each display engine. So=
, we've
> > decided to go for a highly detailed hardware capability discovery.
> >
> > This new uAPI should not be in conflict with existing standard KMS prop=
erties,
> > since there are none which control the pre-blending color pipeline at t=
he
> > moment. It does conflict with any vendor-specific properties like
> > NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-speci=
fic
> > properties. Drivers will need to either reject atomic commits configuri=
ng both
> > uAPIs, or alternatively we could add a DRM client cap which hides the v=
endor
> > properties and shows the new generic properties when enabled.
> >
> > To use this uAPI, first user-space needs to discover hardware capabilit=
ies via
> > KMS objects and properties, then user-space can configure the hardware =
via an
> > atomic commit. This works similarly to the existing KMS uAPI, e.g. plan=
es.
> >
> > Our proposal introduces a new "color_pipeline" plane property, and a ne=
w KMS
> > object type, "COLOROP" (short for color operation). The "color_pipeline=
" plane
> > property is an enum, each enum entry represents a color pipeline suppor=
ted by
> > the hardware. The special zero entry indicates that the pipeline is in
> > "bypass"/"no-op" mode. For instance, the following plane properties des=
cribe a
> > primary plane with 2 supported pipelines but currently configured in by=
pass
> > mode:
> >
> >     Plane 10
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor=
} =3D Primary
> >     =E2=94=9C=E2=94=80 =E2=80=A6
> >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0
>
> A bit confused, why is this an enum, and not just an immutable prop that
> points at the first element? You already can disable elements with the
> bypass thing, also bypassing by changing the pointers to the next node in
> the graph seems a bit confusing and redundant.

We want to allow multiple pipelines to exist and a plane can choose
the pipeline by selecting the first element of the pipeline. The enum
here lists all the possible pipelines that can be attached to the
surface.

> > The non-zero entries describe color pipelines as a linked list of COLOR=
OP KMS
> > objects. The entry value is an object ID pointing to the head of the li=
nked
> > list (the first operation in the color pipeline).
> >
> > The new COLOROP objects also expose a number of KMS properties. Each ha=
s a
> > type, a reference to the next COLOROP object in the linked list, and ot=
her
> > type-specific properties. Here is an example for a 1D LUT operation:
>
> Ok no comments from me on the actual color operations and semantics of al=
l
> that, because I have simply nothing to bring to that except confusion :-)
>
> Some higher level thoughts instead:
>
> - I really like that we just go with graph nodes here. I think that was
>   bound to happen sooner or later with kms (we almost got there with
>   writeback, and with hindsight maybe should have).
>
> - Since there's other use-cases for graph nodes (maybe scaler modes, or
>   histogram samplers for adaptive backglight, or blending that goes beyon=
d
>   the stacked alpha blending we have now) it think we should make this al=
l
>   fairly generic:
>   * Add a new graph node kms object type.
>   * Add a class type so that userspace knows which graph nodes it must
>     understand for a feature (like "ColorOp" on planes here), and which i=
t
>     can ignore (like perhaps a scaler node to control the interpolation)
>   * Probably need to adjust the object property type. Currently that
>     accept any object of a given type (crtc, fb, blob are the major ones)=
.
>     I think for these graph nodes we want an explicit enumeration of the
>     possible next objects. In kms thus far we've done that with the
>     separate possible_* mask properties, but they're cumbersome.
>   * It sounds like for now we only have immutable next pointers, so that
>     would simplify the first iteration, but should probably anticipate al=
l
>     this.

Just to be clear: right now we don't expect any pipeline to be a graph
but only linked lists. It probably doesn't hurt to generalize this to
graphs but that's not what we want to do here (for now).

> - I think the graph node should be built on top of the driver private
>   atomic obj/state stuff, and could then be further subclassed for
>   specific types. It's a bit much stacking, but avoids too much wheel
>   reinventing, and the worst boilerplate can be avoided with some macros
>   that combine the pointer chasing with the containter_of upcast. With
>   that you can easily build some helpers to walk the graph for a crtc or
>   plane or whatever really.
>
> - I guess core atomic code should at least do the graph link validation
>   and basic things like that, probably not really more to do. And
>   validating the standard properties on some graph nodes ofc.
>
> - I have no idea how we should support the standardization of the state
>   structures. Doing a separate subclass for each type sounds extremely
>   painful, but unions otoh are ugly. Ideally type-indexed and type safe
>   union but C isn't good enough for that. I do think that we should keep
>   up the goal that standard properties are decoded into state structures
>   in core atomic code, and not in each implementation individaully.
>
> - I think the only other precendent for something like this is the media
>   control api in the media subystem. I think it'd be really good to get
>   someone like Laurent to ack the graph node infrastructure to make sure
>   we're missing any lesson they've learned already. If there's anything
>   else we should pull these folks in too ofc.
>
> For merge plan I dropped some ideas already on Harry's rfc for
> vendor-private properties, the only thing to add is that we might want to
> type up the consensus plan into a merged doc like
> Documentation/gpu/rfc/hdr-plane.rst or whatever you feel like for a name.
>
> Cheers, Daniel
>
>
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HL=
G, =E2=80=A6} =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > To configure this hardware block, user-space can fill a KMS blob with 4=
096 u32
> > entries, then set "lut_data" to the blob ID. Other color operation type=
s might
> > have different properties.
> >
> > Here is another example with a 3D LUT:
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > And one last example with a matrix:
> >
> >     Color operation 42
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> > [Simon note: having "Bypass" in the "type" enum, and making "type" muta=
ble is
> > a bit weird. Maybe we can just add an "active"/"bypass" boolean propert=
y on
> > blocks which can be bypassed instead.]
> >
> > [Jonas note: perhaps a single "data" property for both LUTs and matrice=
s
> > would make more sense. And a "size" prop for both 1D and 3D LUTs.]
> >
> > If some hardware supports re-ordering operations in the color pipeline,=
 the
> > driver can expose multiple pipelines with different operation ordering,=
 and
> > user-space can pick the ordering it prefers by selecting the right pipe=
line.
> > The same scheme can be used to expose hardware blocks supporting multip=
le
> > precision levels.
> >
> > That's pretty much all there is to it, but as always the devil is in th=
e
> > details.
> >
> > First, we realized that we need a way to indicate where the scaling ope=
ration
> > is happening. The contents of the framebuffer attached to the plane mig=
ht be
> > scaled up or down depending on the CRTC_W and CRTC_H properties. Depend=
ing on
> > the colorspace scaling is applied in, the result will be different, so =
we need
> > a way for the kernel to indicate which hardware blocks are pre-scaling,=
 and
> > which ones are post-scaling. We introduce a special "scaling" operation=
 type,
> > which is part of the pipeline like other operations but serves an infor=
mational
> > role only (effectively, the operation cannot be configured by user-spac=
e, all
> > of its properties are immutable). For example:
> >
> >     Color operation 43
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Scaling} =3D Scaling
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> >
> > [Simon note: an alternative would be to split the color pipeline into t=
wo, by
> > having two plane properties ("color_pipeline_pre_scale" and
> > "color_pipeline_post_scale") instead of a single one. This would be sim=
ilar to
> > the way we want to split pre-blending and post-blending. This could be =
less
> > expressive for drivers, there may be hardware where there are dependenc=
ies
> > between the pre- and post-scaling pipeline?]
> >
> > Then, Alex from NVIDIA described how their hardware works. NVIDIA hardw=
are
> > contains some fixed-function blocks which convert from LMS to ICtCp and=
 cannot
> > be disabled/bypassed. NVIDIA hardware has been designed for descriptive=
 APIs
> > where user-space provides a high-level description of the colorspace
> > conversions it needs to perform, and this is at odds with our KMS uAPI
> > proposal. To address this issue, we suggest adding a special block type=
 which
> > describes a fixed conversion from one colorspace to another and cannot =
be
> > configured by user-space. Then user-space will need to accomodate its p=
ipeline
> > for these special blocks. Such fixed hardware blocks need to be well en=
ough
> > documented so that they can be implemented via shaders.
> >
> > We also noted that it should always be possible for user-space to compl=
etely
> > disable the color pipeline and switch back to bypass/identity without a
> > modeset. Some drivers will need to fail atomic commits for some color
> > pipelines, in particular for some specific LUT payloads. For instance, =
AMD
> > doesn't support curves which are too steep, and Intel doesn't support c=
urves
> > which decrease. This isn't something which routinely happens, but there=
 might
> > be more cases where the hardware needs to reject the pipeline. Thus, wh=
en
> > user-space has a running KMS color pipeline, then hits a case where the
> > pipeline cannot keep running (gets rejected by the driver), user-space =
needs to
> > be able to immediately fall back to shaders without any glitch. This do=
esn't
> > seem to be an issue for AMD, Intel and NVIDIA.
> >
> > This uAPI is extensible: we can add more color operations, and we can a=
dd more
> > properties for each color operation type. For instance, we might want t=
o add
> > support for Intel piece-wise linear (PWL) 1D curves, or might want to a=
dvertise
> > the effective precision of the LUTs. The uAPI is deliberately somewhat =
minimal
> > to keep the scope of the proposal manageable.
> >
> > Later on, we plan to re-use the same machinery for post-blending color
> > pipelines. There are some more details about post-blending which have b=
een
> > separately debated at the hackfest, but we believe it's a viable plan. =
This
> > solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT propert=
ies, so
> > we'd like to introduce a client cap to hide the old properties and show=
 the new
> > post-blending color pipeline properties.
> >
> > We envision a future user-space library to translate a high-level descr=
iptive
> > color pipeline into low-level prescriptive KMS color pipeline ("liblift=
off but
> > for color pipelines"). The library could also offer a translation into =
shaders.
> > This should help share more infrastructure between compositors and ease=
 KMS
> > offloading. This should also help dealing with the NVIDIA case.
> >
> > To wrap things up, let's take a real-world example: how would gamescope=
 [2]
> > configure the AMD DCN 3.0 hardware for its color pipeline? The gamescop=
e color
> > pipeline is described in [3]. The AMD DCN 3.0 hardware is described in =
[4].
> >
> > AMD would expose the following objects and properties:
> >
> >     Plane 10
> >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor=
} =3D Primary
> >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> >     Color operation 42 (input CSC)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >     Color operation 43
> >     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> >     Color operation 44 (DeGamma)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D =
sRGB
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
> >     Color operation 45 (gamut remap)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >     =E2=94=9C=E2=94=80 "matrix_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> >     Color operation 46 (shaper LUT RAM)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> >     Color operation 47 (3D LUT RAM)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> >     Color operation 48 (blend gamma)
> >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6}=
 =3D LUT
> >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >     =E2=94=9C=E2=94=80 "lut_data": blob
> >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> >
> > To configure the pipeline for an HDR10 PQ plane (path at the top) and a=
 HDR
> > display, gamescope would perform an atomic commit with the following pr=
operty
> > values:
> >
> >     Plane 10
> >     =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> >     Color operation 42 (input CSC)
> >     =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)
> >     Color operation 44 (DeGamma)
> >     =E2=94=94=E2=94=80 "type" =3D Bypass
> >     Color operation 45 (gamut remap)
> >     =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ
> >     Color operation 46 (shaper LUT RAM)
> >     =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native
> >     Color operation 47 (3D LUT RAM)
> >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + ni=
ght mode
> >     Color operation 48 (blend gamma)
> >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ
> >
> > I hope comparing these properties to the diagrams linked above can help
> > understand how the uAPI would be used and give an idea of its viability=
.
> >
> > Please feel free to provide feedback! It would be especially useful to =
have
> > someone familiar with Arm SoCs look at this, to confirm that this propo=
sal
> > would work there.
> >
> > Unless there is a show-stopper, we plan to follow up this RFC with
> > implementations for AMD, Intel, NVIDIA, gamescope, and IGT.
> >
> > Many thanks to everybody who contributed to the hackfest, on-site or re=
motely!
> > Let's work together to make this happen!
> >
> > Simon, on behalf of the hackfest participants
> >
> > [1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
> > [2]: https://github.com/ValveSoftware/gamescope
> > [3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29ce=
f5ae9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
> > [4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

