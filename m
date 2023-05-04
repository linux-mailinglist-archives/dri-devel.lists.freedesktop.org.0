Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031DC6F6ECF
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0492110E120;
	Thu,  4 May 2023 15:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853EF10E120
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 15:23:18 +0000 (UTC)
Date: Thu, 04 May 2023 15:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683213794; x=1683472994;
 bh=uKGUPbskPf0ueKV6JxWRpY143oboC0IA4lJxArzhuYc=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=YyW+8kc1CydqlweTw4oqqlWfMmeeP0o6JChCV5yGgV0jboJHCPMKqzkXUO8gNV0Qi
 HikCRthB2sAbsN4eUCUxO2ORkYfBJJtBXgNwN92xP1dL1UHBzBqRskVjRNdxh4y4UV
 nuyZnjFFSDXenZ7sJdMyNCmOlsUoJpHJeldZDNv8ZQSwET5R4Wo9EKIXixxdUSKu+j
 ZCG24laDOo44QGJBHnFBIx1bYNijBmJbjIREJuc8Gt7143JvGJ5JuWR1uEpxb6xlEt
 VzNOSeiHBvDYW9juqgLkTIs10a8S7KBbcr7U/dnjveXzEs2F2UIGslP3KzZNs1Pe+9
 HxzvdES8zh3aw==
To: DRI Development <dri-devel@lists.freedesktop.org>
From: Simon Ser <contact@emersion.fr>
Subject: [RFC] Plane color pipeline KMS uAPI
Message-ID: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>, Aleix Pol <aleixpol@kde.org>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The goal of this RFC is to expose a generic KMS uAPI to configure the color
pipeline before blending, ie. after a pixel is tapped from a plane's
framebuffer and before it's blended with other planes. With this new uAPI w=
e
aim to reduce the battery life impact of color management and HDR on mobile
devices, to improve performance and to decrease latency by skipping
composition on the 3D engine. This proposal is the result of discussions at
the Red Hat HDR hackfest [1] which took place a few days ago. Engineers
familiar with the AMD, Intel and NVIDIA hardware have participated in the
discussion.

This proposal takes a prescriptive approach instead of a descriptive approa=
ch.
Drivers describe the available hardware blocks in terms of low-level
mathematical operations, then user-space configures each block. We decided
against a descriptive approach where user-space would provide a high-level
description of the colorspace and other parameters: we want to give more
control and flexibility to user-space, e.g. to be able to replicate exactly=
 the
color pipeline with shaders and switch between shaders and KMS pipelines
seamlessly, and to avoid forcing user-space into a particular color managem=
ent
policy.

We've decided against mirroring the existing CRTC properties
DEGAMMA_LUT/CTM/GAMMA_LUT onto KMS planes. Indeed, the color management
pipeline can significantly differ between vendors and this approach cannot
accurately abstract all hardware. In particular, the availability, ordering=
 and
capabilities of hardware blocks is different on each display engine. So, we=
've
decided to go for a highly detailed hardware capability discovery.

This new uAPI should not be in conflict with existing standard KMS properti=
es,
since there are none which control the pre-blending color pipeline at the
moment. It does conflict with any vendor-specific properties like
NV_INPUT_COLORSPACE or the patches on the mailing list adding AMD-specific
properties. Drivers will need to either reject atomic commits configuring b=
oth
uAPIs, or alternatively we could add a DRM client cap which hides the vendo=
r
properties and shows the new generic properties when enabled.

To use this uAPI, first user-space needs to discover hardware capabilities =
via
KMS objects and properties, then user-space can configure the hardware via =
an
atomic commit. This works similarly to the existing KMS uAPI, e.g. planes.

Our proposal introduces a new "color_pipeline" plane property, and a new KM=
S
object type, "COLOROP" (short for color operation). The "color_pipeline" pl=
ane
property is an enum, each enum entry represents a color pipeline supported =
by
the hardware. The special zero entry indicates that the pipeline is in
"bypass"/"no-op" mode. For instance, the following plane properties describ=
e a
primary plane with 2 supported pipelines but currently configured in bypass
mode:

    Plane 10
    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor} =
=3D Primary
    =E2=94=9C=E2=94=80 =E2=80=A6
    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42, 52} =3D 0

The non-zero entries describe color pipelines as a linked list of COLOROP K=
MS
objects. The entry value is an object ID pointing to the head of the linked
list (the first operation in the color pipeline).

The new COLOROP objects also expose a number of KMS properties. Each has a
type, a reference to the next COLOROP object in the linked list, and other
type-specific properties. Here is an example for a 1D LUT operation:

    Color operation 42
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, HLG, =
=E2=80=A6} =3D LUT
    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
    =E2=94=9C=E2=94=80 "lut_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43

To configure this hardware block, user-space can fill a KMS blob with 4096 =
u32
entries, then set "lut_data" to the blob ID. Other color operation types mi=
ght
have different properties.

Here is another example with a 3D LUT:

    Color operation 42
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
    =E2=94=9C=E2=94=80 "lut_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43

And one last example with a matrix:

    Color operation 42
    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
    =E2=94=9C=E2=94=80 "matrix_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43

[Simon note: having "Bypass" in the "type" enum, and making "type" mutable =
is
a bit weird. Maybe we can just add an "active"/"bypass" boolean property on
blocks which can be bypassed instead.]

[Jonas note: perhaps a single "data" property for both LUTs and matrices
would make more sense. And a "size" prop for both 1D and 3D LUTs.]

If some hardware supports re-ordering operations in the color pipeline, the
driver can expose multiple pipelines with different operation ordering, and
user-space can pick the ordering it prefers by selecting the right pipeline=
.
The same scheme can be used to expose hardware blocks supporting multiple
precision levels.

That's pretty much all there is to it, but as always the devil is in the
details.

First, we realized that we need a way to indicate where the scaling operati=
on
is happening. The contents of the framebuffer attached to the plane might b=
e
scaled up or down depending on the CRTC_W and CRTC_H properties. Depending =
on
the colorspace scaling is applied in, the result will be different, so we n=
eed
a way for the kernel to indicate which hardware blocks are pre-scaling, and
which ones are post-scaling. We introduce a special "scaling" operation typ=
e,
which is part of the pipeline like other operations but serves an informati=
onal
role only (effectively, the operation cannot be configured by user-space, a=
ll
of its properties are immutable). For example:

    Color operation 43
    =E2=94=9C=E2=94=80 "type": immutable enum {Scaling} =3D Scaling
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44

[Simon note: an alternative would be to split the color pipeline into two, =
by
having two plane properties ("color_pipeline_pre_scale" and
"color_pipeline_post_scale") instead of a single one. This would be similar=
 to
the way we want to split pre-blending and post-blending. This could be less
expressive for drivers, there may be hardware where there are dependencies
between the pre- and post-scaling pipeline?]

Then, Alex from NVIDIA described how their hardware works. NVIDIA hardware
contains some fixed-function blocks which convert from LMS to ICtCp and can=
not
be disabled/bypassed. NVIDIA hardware has been designed for descriptive API=
s
where user-space provides a high-level description of the colorspace
conversions it needs to perform, and this is at odds with our KMS uAPI
proposal. To address this issue, we suggest adding a special block type whi=
ch
describes a fixed conversion from one colorspace to another and cannot be
configured by user-space. Then user-space will need to accomodate its pipel=
ine
for these special blocks. Such fixed hardware blocks need to be well enough
documented so that they can be implemented via shaders.

We also noted that it should always be possible for user-space to completel=
y
disable the color pipeline and switch back to bypass/identity without a
modeset. Some drivers will need to fail atomic commits for some color
pipelines, in particular for some specific LUT payloads. For instance, AMD
doesn't support curves which are too steep, and Intel doesn't support curve=
s
which decrease. This isn't something which routinely happens, but there mig=
ht
be more cases where the hardware needs to reject the pipeline. Thus, when
user-space has a running KMS color pipeline, then hits a case where the
pipeline cannot keep running (gets rejected by the driver), user-space need=
s to
be able to immediately fall back to shaders without any glitch. This doesn'=
t
seem to be an issue for AMD, Intel and NVIDIA.

This uAPI is extensible: we can add more color operations, and we can add m=
ore
properties for each color operation type. For instance, we might want to ad=
d
support for Intel piece-wise linear (PWL) 1D curves, or might want to adver=
tise
the effective precision of the LUTs. The uAPI is deliberately somewhat mini=
mal
to keep the scope of the proposal manageable.

Later on, we plan to re-use the same machinery for post-blending color
pipelines. There are some more details about post-blending which have been
separately debated at the hackfest, but we believe it's a viable plan. This
solution would supersede the existing DEGAMMA_LUT/CTM/GAMMA_LUT properties,=
 so
we'd like to introduce a client cap to hide the old properties and show the=
 new
post-blending color pipeline properties.

We envision a future user-space library to translate a high-level descripti=
ve
color pipeline into low-level prescriptive KMS color pipeline ("libliftoff =
but
for color pipelines"). The library could also offer a translation into shad=
ers.
This should help share more infrastructure between compositors and ease KMS
offloading. This should also help dealing with the NVIDIA case.

To wrap things up, let's take a real-world example: how would gamescope [2]
configure the AMD DCN 3.0 hardware for its color pipeline? The gamescope co=
lor
pipeline is described in [3]. The AMD DCN 3.0 hardware is described in [4].

AMD would expose the following objects and properties:

    Plane 10
    =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Cursor} =
=3D Primary
    =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
    Color operation 42 (input CSC)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
    =E2=94=9C=E2=94=80 "matrix_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
    Color operation 43
    =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
    Color operation 44 (DeGamma)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
    =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =3D sRGB
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
    Color operation 45 (gamut remap)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
    =E2=94=9C=E2=94=80 "matrix_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
    Color operation 46 (shaper LUT RAM)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
    =E2=94=9C=E2=94=80 "lut_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
    Color operation 47 (3D LUT RAM)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
    =E2=94=9C=E2=94=80 "lut_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
    Color operation 48 (blend gamma)
    =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
    =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =E2=80=A6} =3D=
 LUT
    =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
    =E2=94=9C=E2=94=80 "lut_data": blob
    =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0

To configure the pipeline for an HDR10 PQ plane (path at the top) and a HDR
display, gamescope would perform an atomic commit with the following proper=
ty
values:

    Plane 10
    =E2=94=94=E2=94=80 "color_pipeline" =3D 42
    Color operation 42 (input CSC)
    =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)
    Color operation 44 (DeGamma)
    =E2=94=94=E2=94=80 "type" =3D Bypass
    Color operation 45 (gamut remap)
    =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ
    Color operation 46 (shaper LUT RAM)
    =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native
    Color operation 47 (3D LUT RAM)
    =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + night =
mode
    Color operation 48 (blend gamma)
    =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ

I hope comparing these properties to the diagrams linked above can help
understand how the uAPI would be used and give an idea of its viability.

Please feel free to provide feedback! It would be especially useful to have
someone familiar with Arm SoCs look at this, to confirm that this proposal
would work there.

Unless there is a show-stopper, we plan to follow up this RFC with
implementations for AMD, Intel, NVIDIA, gamescope, and IGT.

Many thanks to everybody who contributed to the hackfest, on-site or remote=
ly!
Let's work together to make this happen!

Simon, on behalf of the hackfest participants

[1]: https://wiki.gnome.org/Hackfests/ShellDisplayNext2023
[2]: https://github.com/ValveSoftware/gamescope
[3]: https://github.com/ValveSoftware/gamescope/blob/5af321724c8b8a29cef5ae=
9e31293fd5d560c4ec/src/docs/Steam%20Deck%20Display%20Pipeline.png
[4]: https://kernel.org/doc/html/latest/_images/dcn3_cm_drm_current.svg
