Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A972A031
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 18:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0766310E077;
	Fri,  9 Jun 2023 16:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E17510E12B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 16:30:12 +0000 (UTC)
Date: Fri, 09 Jun 2023 16:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1686328209; x=1686587409;
 bh=XzMICg0tAei1KsLo/VoCQFzmZRO/H/l3ozADiFKh/ac=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=iiovOlEiik21EFCol2giDUOuMK6pzMhr8JDqOfUftpVEqyGJ/yAx7yaJuMiswY9WD
 vTU980Jij8RQka85/KFn8DqgDaH7fRwlrNQIs6BKB0C/YVgzocmwflizYMo9ikozrk
 5P2HUy8+KZaLsP3U0mZb5/5XwAWcjea+yOTiAn9hYoZ6gm1sO+NoT7psZhxvwhudc1
 +2FMHGQLX+VNPTQhjNfeExLlWA6obUesVqMbgdtbiXpoQuBWkUxHDM5OvzBZ6KcQMn
 YhO9pDp2DXvW+T95UEriQ274vCTq478bywZTZZeEIx9n1H+5NMJrPvCJc2qP/UufyV
 2DcwJnxz4SGTQ==
To: Christopher Braga <quic_cbraga@quicinc.com>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <jerhZxCOWoQ2gv55pCK0JNVXMT_OY_j9KLewfG5me25cpqVzfOibpr4b9gZpjWPLQOaKWO2zD2KUI5mWge4mA74DmV1qmLB_LxsSRlKtvbk=@emersion.fr>
In-Reply-To: <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <4341dac6-ada1-2a75-1c22-086d96408a85@quicinc.com>
 <84d5dad7-5e8e-ce92-d08e-4609970f6604@quicinc.com>
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
Cc: Aleix Pol <aleixpol@kde.org>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>,
 =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christopher,

On Friday, June 9th, 2023 at 17:52, Christopher Braga <quic_cbraga@quicinc.=
com> wrote:

> > The new COLOROP objects also expose a number of KMS properties. Each ha=
s a
> > type, a reference to the next COLOROP object in the linked list, and ot=
her
> > type-specific properties. Here is an example for a 1D LUT operation:
> >
> >      Color operation 42
> >      =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> >      =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, BT.709, H=
LG, =E2=80=A6} =3D LUT
> The options sRGB / PQ / BT.709 / HLG would select hard-coded 1D
> curves? Will different hardware be allowed to expose a subset of these
> enum values?

Yes. Only hardcoded LUTs supported by the HW are exposed as enum entries.

> >      =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> >      =E2=94=9C=E2=94=80 "lut_data": blob
> >      =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> Some hardware has per channel 1D LUT values, while others use the same
> LUT for all channels.  We will definitely need to expose this in the
> UAPI in some form.

Hm, I was assuming per-channel 1D LUTs here, just like the existing GAMMA_L=
UT/
DEGAMMA_LUT properties work. If some hardware can't support that, it'll nee=
d
to get exposed as another color operation block.

> > To configure this hardware block, user-space can fill a KMS blob with
> > 4096 u32
> > entries, then set "lut_data" to the blob ID. Other color operation type=
s
> > might
> > have different properties.
> >
> The bit-depth of the LUT is an important piece of information we should
> include by default. Are we assuming that the DRM driver will always
> reduce the input values to the resolution supported by the pipeline?
> This could result in differences between the hardware behavior
> and the shader behavior.
>=20
> Additionally, some pipelines are floating point while others are fixed.
> How would user space know if it needs to pack 32 bit integer values vs
> 32 bit float values?

Again, I'm deferring to the existing GAMMA_LUT/DEGAMMA_LUT. These use a com=
mon
definition of LUT blob (u16 elements) and it's up to the driver to convert.

Using a very precise format for the uAPI has the nice property of making th=
e
uAPI much simpler to use. User-space sends high precision data and it's up =
to
drivers to map that to whatever the hardware accepts.

Exposing the actual hardware precision is something we've talked about duri=
ng
the hackfest. It'll probably be useful to some extent, but will require som=
e
discussion to figure out how to design the uAPI. Maybe a simple property is
enough, maybe not (e.g. fully describing the precision of segmented LUTs wo=
uld
probably be trickier).

I'd rather keep things simple for the first pass, we can always add more
properties for bit depth etc later on.

> > Here is another example with a 3D LUT:
> >
> >      Color operation 42
> >      =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> >      =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 33
> >      =E2=94=9C=E2=94=80 "lut_data": blob
> >      =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> We are going to need to expose the packing order here to avoid any
> programming uncertainty. I don't think we can safely assume all hardware
> is equivalent.

The driver can easily change the layout of the matrix and do any conversion
necessary when programming the hardware. We do need to document what layout=
 is
used in the uAPI for sure.

> > And one last example with a matrix:
> >
> >      Color operation 42
> >      =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> >      =E2=94=9C=E2=94=80 "matrix_data": blob
> >      =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> >
> It is unclear to me what the default sizing of this matrix is. Any
> objections to exposing these details with an additional property?

The existing CTM property uses 9 uint64 (S31.32) values. Is there a case wh=
ere
that wouldn't be enough?

> Dithering logic exists in some pipelines. I think we need a plan to
> expose that here as well.

Hm, I'm not too familiar with dithering. Do you think it would make sense t=
o
expose as an additional colorop block? Do you think it would have more
consequences on the design?

I want to re-iterate that we don't need to ship all features from day 1. We
just need to come up with a uAPI design on which new features can be built =
on.

> > [Simon note: an alternative would be to split the color pipeline into
> > two, by
> > having two plane properties ("color_pipeline_pre_scale" and
> > "color_pipeline_post_scale") instead of a single one. This would be
> > similar to
> > the way we want to split pre-blending and post-blending. This could be =
less
> > expressive for drivers, there may be hardware where there are dependenc=
ies
> > between the pre- and post-scaling pipeline?]
> >
> As others have noted, breaking up the pipeline with immutable blocks
> makes the most sense to me here. This way we don't have to predict ahead
> of time every type of block that maybe affected by pipeline ordering.
> Splitting the pipeline into two properties now means future
> logical splits would require introduction of further plane properties.

Right, if there are more "breaking points", then we'll need immutable block=
s
anyways.

> > Then, Alex from NVIDIA described how their hardware works. NVIDIA hardw=
are
> > contains some fixed-function blocks which convert from LMS to ICtCp and
> > cannot
> > be disabled/bypassed. NVIDIA hardware has been designed for descriptive
> > APIs
> > where user-space provides a high-level description of the colorspace
> > conversions it needs to perform, and this is at odds with our KMS uAPI
> > proposal. To address this issue, we suggest adding a special block type
> > which
> > describes a fixed conversion from one colorspace to another and cannot =
be
> > configured by user-space. Then user-space will need to accomodate its
> > pipeline
> > for these special blocks. Such fixed hardware blocks need to be well en=
ough
> > documented so that they can be implemented via shaders.
> >
> A few questions here. What is the current plan for documenting the
> mathematical model for each exposed block? Will each defined 'type' enum
> value be locked to a definition in the kernel documents? As an example,
> when we say '3D LUT' in this proposal does this mean the block will
> expose a tri-linear interpolated 3D LUT interface? Is '1D Curve' a
> direct in to out LUT mapping?

I think we'll want to document these things, yes. We do want to give _some_
slack to drivers, so that they can e.g. implement the "1D LUT" colorop via
hardware segmented LUTs with a different number of elements per LUT segment=
.
But being mathematically precise (probably with formulae in the docs) is
definitely a goal, and absolutely necessary to implement a shader-based
fallback.

> Overall I am a fan of this proposal though. The prescriptive color
> pipeline UAPI is simple and easy to follow.

Thank you for the comments! Let me know if you disagree with some of the ab=
ove,
or if my answers are unclear.
