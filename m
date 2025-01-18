Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951BBA15D41
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 14:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F56C10E0E6;
	Sat, 18 Jan 2025 13:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="I5uFrabS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471D910E009;
 Sat, 18 Jan 2025 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1737208501; x=1737467701;
 bh=YMqEqzZb4emZ/EHHBC69A4yNYzWStBugARDgfFqiDbc=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=I5uFrabSpyue1dQl0heu545NUym4XVXzSIpAxtv1LUsWtAKErb9Lq0OpBDEjbhnmY
 7QcA1kYiMvdrtpvBZGf0EJN9VNS+5Zf+v2Eqm01sN4yZdVtBC5hWs0R+yJ049wgQ3T
 Mg+loE5yKWmJwLUJAvOmdhhKmerTFCI+grikiod07t3QzDbJOgmtOKW4E37BqD5lSY
 Q5LOA0DHA1iKbdEDCy9xb074RMP8zaPcezfL+1bmeIdO3SjxXn1qAeuT481mXRIcRD
 ZkfVFqLPgCj5uxOGVZWebgF2SDTQmvpXadxVYaAysdkpOd4ogPYrQoZwb3oA72XHBP
 CG/dXDfSaynDg==
Date: Sat, 18 Jan 2025 13:54:57 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 33/45] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <fChzDU1JCPpRINsR2fDGg7EzolmLIrbkAGTUV9tpdwsC7OT9JnlT0ar23K1tMYLX_91yHHXXw2nFYaT-EbC9EAVnhrDcaNS4z22cKT5kuFA=@emersion.fr>
In-Reply-To: <4d13fddf-d3d1-4e94-b736-e240a4ba8658@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-34-alex.hung@amd.com>
 <bEQfY8v5JGKxFSuZE_Sx7wUPe4j7WtdrnKcY13WAyoMEA9vtUrCkyZoYUcFyPILmVZGW2Y8pOSk9hyhlp_Y0Stxx32osdADBMbpwJjBRPh8=@emersion.fr>
 <4d13fddf-d3d1-4e94-b736-e240a4ba8658@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 53a2afcd7ea79a0aee1fb64f76bc2feddf1bada4
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday, January 17th, 2025 at 00:33, Alex Hung <alex.hung@amd.com> wrote=
:

> On 1/15/25 01:14, Simon Ser wrote:
> >> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_a=
tomic_uapi.c
> >> index a3e1fcad47ad..4744c12e429d 100644
> >> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> >> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> >> @@ -701,6 +701,9 @@ static int drm_atomic_color_set_data_property(stru=
ct drm_colorop *colorop,
> >>   =09bool replaced =3D false;
> >>
> >>   =09switch (colorop->type) {
> >> +=09case DRM_COLOROP_1D_LUT:
> >> +=09=09size =3D colorop->lut_size * sizeof(struct drm_color_lut);
> >
> > Should we set the element size and the number of elements instead of
> > multiplying? Or is that only useful when either of these are controlled=
 by
> > user-space to avoid integer overflows?
>=20
> This multiplication here is to calculate the total size for the data blob=
.
>=20
> The user-space communicates the lut_size (which is read-only) without
> multiplying sizeof(drm_color_lut) in drm_atomic_colorop_get_property, i.e=
.,
>=20
> +=09} else if (property =3D=3D colorop->lut_size_property) {
> +=09=09*val =3D colorop->lut_size;
>=20
> Is this what you meant?

I mean that drm_property_replace_blob_from_id() takes two parameters:
expected_size and expected_elem_size.

But it seems expected_elem_size is just used for checking whether the size =
of
the blob set by user-space is divisible by the element size, and nothing mo=
re.
In particular, drm_property_replace_blob_from_id() doesn't internally multi=
ply
expected_size and expected_elem_size to check the total size when both of t=
hese
parameters are provided. In other words, it's useless to provide both
expected_size and expected_elem_size.

tl;dr my comment can be ignored.

> >> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_color=
op.c
> >> index 665b23900cc0..e6dea2713490 100644
> >> --- a/drivers/gpu/drm/drm_colorop.c
> >> +++ b/drivers/gpu/drm/drm_colorop.c
> >> @@ -64,6 +64,7 @@
> >>
> >>   static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =
=3D {
> >>   =09{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> >> +=09{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },
> >
> > Since we now have both a "normal" 1D curve, and a "special" one=
=E2=80=A6 Would it make
> > sense to change our minds regarding the naming of the former? For insta=
nce, we
> > could rename it to DRM_COLOROP_FIXED_1D_CURVE. Or is the current name c=
lear
> > enough (and only the human-readable name can be switched to "1D Fixed C=
urve")?
>=20
> How about keeping "1D Curve" and simplifying "1D Curve Custom LUT" to
> "1D LUT" such as the following?

Yeah, that sounds good to me!
