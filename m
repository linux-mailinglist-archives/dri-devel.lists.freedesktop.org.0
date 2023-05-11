Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB586FFBCB
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 23:21:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BD710E5F5;
	Thu, 11 May 2023 21:21:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4323.proton.ch (mail-4323.proton.ch [185.70.43.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827F210E5F4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 21:21:21 +0000 (UTC)
Date: Thu, 11 May 2023 21:21:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1683840078; x=1684099278;
 bh=GItVvSyGOYFveOE8WwImi4y6+zV3IRjmkAxEabea+Bg=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=YczK1S9AxdD8VyLCC9d7kjes8qsYQJ64cReOvC7DNPJLcxd/BK0r8o9r5kLhV1HVB
 b3MsdtqJM0ANhY53aFnLZSfq9Bxijp0XkO0wOSwU6yGsgh1DKWItatPPN0lUC/l/UW
 bE5xbiSLKpUOaLtZ/mCkvUUTBB6w68lKpGwWNlSYFP2XXiMiP9oCKN8cfbPPpmttHN
 2iwKDrMbEu2moE6+UJPkjKA5vmbCkmG84Jl/0MsGGQ2OPGZBlwj889N3HNRHY1nTe5
 USlD55D+ysrZrTd5NzsFfs2L7ibBYnSAuCLLPHluasE376/P93+PiR4z7h7jwYPzRP
 Ghl8jPG1N04LA==
To: Joshua Ashton <joshua@froggi.es>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC] Plane color pipeline KMS uAPI
Message-ID: <2Hgr4eKR2afZmmRKS6oIKlF5l8IR1Gk_HOI8vd1mpZP8UQ4dq5vkRt354dDHogVi19uckId0RDOrycvlkLKofV9LbtcIphiR0roAAEuBpBU=@emersion.fr>
In-Reply-To: <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
References: <QMers3awXvNCQlyhWdTtsPwkp5ie9bze_hD5nAccFW7a_RXlWjYB7MoUW_8CKLT2bSQwIXVi5H6VULYIxCdgvryZoAoJnC5lZgyK1QWn488=@emersion.fr>
 <20230505144150.741a90e1@eldfell>
 <CAEZNXZDnCeZKTJvTwFYnrECzjLc+WEhUG5y-GBDmOeoMBCdJ+A@mail.gmail.com>
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
Cc: =?utf-8?Q?Jonas_=C3=85dahl?= <jadahl@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?utf-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Aleix Pol <aleixpol@kde.org>, Sebastian Wick <sebastian.wick@redhat.com>,
 wayland-devel <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, May 5th, 2023 at 15:30, Joshua Ashton <joshua@froggi.es> wrote:

> > > AMD would expose the following objects and properties:
> > >
> > >     Plane 10
> > >     =E2=94=9C=E2=94=80 "type": immutable enum {Overlay, Primary, Curs=
or} =3D Primary
> > >     =E2=94=94=E2=94=80 "color_pipeline": enum {0, 42} =3D 0
> > >     Color operation 42 (input CSC)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 43
> > >     Color operation 43
> > >     =E2=94=9C=E2=94=80 "type": enum {Scaling} =3D Scaling
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 44
> > >     Color operation 44 (DeGamma)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {sRGB, PQ, =E2=80=A6} =
=3D sRGB
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 45
>=20
> Some vendors have per-tap degamma and some have a degamma after the sampl=
e.
> How do we distinguish that behaviour?
> It is important to know.

Can you elaborate? What is "per-tap" and "sample"? Is the "Scaling" color
operation above not enough to indicate where in the pipeline the hw perform=
s
scaling?

> > >     Color operation 45 (gamut remap)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, Matrix} =3D Matrix
> > >     =E2=94=9C=E2=94=80 "matrix_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 46
> > >     Color operation 46 (shaper LUT RAM)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT} =3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 47
> > >     Color operation 47 (3D LUT RAM)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 3D LUT} =3D 3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 17
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 48
> > >     Color operation 48 (blend gamma)
> > >     =E2=94=9C=E2=94=80 "type": enum {Bypass, 1D curve} =3D 1D curve
> > >     =E2=94=9C=E2=94=80 "1d_curve_type": enum {LUT, sRGB, PQ, =
=E2=80=A6} =3D LUT
> > >     =E2=94=9C=E2=94=80 "lut_size": immutable range =3D 4096
> > >     =E2=94=9C=E2=94=80 "lut_data": blob
> > >     =E2=94=94=E2=94=80 "next": immutable color operation ID =3D 0
> > >
> > > To configure the pipeline for an HDR10 PQ plane (path at the top) and=
 a HDR
> > > display, gamescope would perform an atomic commit with the following =
property
> > > values:
> > >
> > >     Plane 10
> > >     =E2=94=94=E2=94=80 "color_pipeline" =3D 42
> > >     Color operation 42 (input CSC)
> > >     =E2=94=94=E2=94=80 "matrix_data" =3D PQ =E2=86=92 scRGB (TF)
>=20
> ^
> Not sure what this is.
> We don't use an input CSC before degamma.
>=20
> > >     Color operation 44 (DeGamma)
> > >     =E2=94=94=E2=94=80 "type" =3D Bypass
>=20
> ^
> If we did PQ, this would be PQ -> Linear / 80
> If this was sRGB, it'd be sRGB -> Linear
> If this was scRGB this would be just treating it as it is. So... Linear /=
 80.
>=20
> > >     Color operation 45 (gamut remap)
> > >     =E2=94=94=E2=94=80 "matrix_data" =3D scRGB (TF) =E2=86=92 PQ
>=20
> ^
> This is wrong, we just use this to do scRGB primaries (709) to 2020.
>=20
> We then go from scRGB -> PQ to go into our shaper + 3D LUT.
>=20
> > >     Color operation 46 (shaper LUT RAM)
> > >     =E2=94=94=E2=94=80 "lut_data" =3D PQ =E2=86=92 Display native
>=20
> ^
> "Display native" is just the response curve of the display.
> In HDR10, this would just be PQ -> PQ
> If we were doing HDR10 on SDR, this would be PQ -> Gamma 2.2 (mapped
> from 0 to display native luminance) [with a potential bit of headroom
> for tonemapping in the 3D LUT]
> For SDR on HDR10 this would be Gamma 2.2 -> PQ (Not intending to start
> an sRGB vs G2.2 argument here! :P)
>=20
> > >     Color operation 47 (3D LUT RAM)
> > >     =E2=94=94=E2=94=80 "lut_data" =3D Gamut mapping + tone mapping + =
night mode
> > >     Color operation 48 (blend gamma)
> > >     =E2=94=94=E2=94=80 "1d_curve_type" =3D PQ
>=20
> ^
> This is wrong, this should be Display Native -> Linearized Display Referr=
ed

In the HDR case, isn't this the inverse of PQ?

> > You cannot do a TF with a matrix, and a gamut remap with a matrix on
> > electrical values is certainly surprising, so the example here is a
> > bit odd, but I don't think that hurts the intention of demonstration.
>=20
> I have done some corrections inline.
>=20
> You can see our fully correct color pipeline here:
> https://raw.githubusercontent.com/ValveSoftware/gamescope/master/src/docs=
/Steam%20Deck%20Display%20Pipeline.png
>=20
> Please let me know if you have any more questions about our color pipelin=
e.

As expected, I got the gamescope part wrong. I'm pretty confident that the
proposed API would still work since the AMD vendor-specific props would jus=
t
be exposed as color operation objects. Can you confirm we can make the
gamescope pipeline work with the AMD color pipeline outlined above?
