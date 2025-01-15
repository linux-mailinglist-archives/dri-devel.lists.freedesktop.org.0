Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44413A11BA3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 09:14:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C47310E53A;
	Wed, 15 Jan 2025 08:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=emersion.fr header.i=@emersion.fr header.b="OzB5vCP8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181D610E52D;
 Wed, 15 Jan 2025 08:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1736928856; x=1737188056;
 bh=eQQAoUrWbVIy7Aqv7nX0E1kQ77K/KQutmFsneyx6nFU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=OzB5vCP86FXkTTSGQdlIKOwmRs01Nk8bCXPdq0oq39uTNnQS9C/H2kAkcOrE6lvvq
 SbC0b2f0tbm74JwIhXd7oYHRHZl70zG0OJxr5hVnn5SOkGUWODrZafvdFQF4eqgB2y
 Uz52/EkTKMA+uXYkpdLWjZtfeTwFSfZQzts0O++f+RANZuTESocNH7MWfjVXzerAHs
 Qvbq+drCGYgMgkdzTQ9YufLDCnKXx7MGAB5KX5w++x7d+GsQmx+4SuE9nvk9oBpYXX
 c7zn6MpPkkTU1Yrg5se3I+oGKSK1Qd8mdEg7q/e9UnE3kXfz+EKJwAwUSxnyri2anu
 xPTK0MAB78OiA==
Date: Wed, 15 Jan 2025 08:14:11 +0000
To: Alex Hung <alex.hung@amd.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
Subject: Re: [V7 33/45] drm/colorop: Add 1D Curve Custom LUT type
Message-ID: <bEQfY8v5JGKxFSuZE_Sx7wUPe4j7WtdrnKcY13WAyoMEA9vtUrCkyZoYUcFyPILmVZGW2Y8pOSk9hyhlp_Y0Stxx32osdADBMbpwJjBRPh8=@emersion.fr>
In-Reply-To: <20241220043410.416867-34-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-34-alex.hung@amd.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: fe772401f306acf9cb7bdea1173d4601c4d4516f
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

> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index a3e1fcad47ad..4744c12e429d 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -701,6 +701,9 @@ static int drm_atomic_color_set_data_property(struct =
drm_colorop *colorop,
>  =09bool replaced =3D false;
> =20
>  =09switch (colorop->type) {
> +=09case DRM_COLOROP_1D_LUT:
> +=09=09size =3D colorop->lut_size * sizeof(struct drm_color_lut);

Should we set the element size and the number of elements instead of
multiplying? Or is that only useful when either of these are controlled by
user-space to avoid integer overflows?

> +=09=09break;
>  =09case DRM_COLOROP_CTM_3X4:
>  =09=09size =3D sizeof(struct drm_color_ctm_3x4);
>  =09=09break;
> @@ -750,6 +753,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *c=
olorop,
>  =09=09*val =3D state->bypass;
>  =09} else if (property =3D=3D colorop->curve_1d_type_property) {
>  =09=09*val =3D state->curve_1d_type;
> +=09} else if (property =3D=3D colorop->lut_size_property) {
> +=09=09*val =3D colorop->lut_size;
>  =09} else if (property =3D=3D colorop->data_property) {
>  =09=09*val =3D (state->data) ? state->data->base.id : 0;
>  =09} else {
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 665b23900cc0..e6dea2713490 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -64,6 +64,7 @@
> =20
>  static const struct drm_prop_enum_list drm_colorop_type_enum_list[] =3D =
{
>  =09{ DRM_COLOROP_1D_CURVE, "1D Curve" },
> +=09{ DRM_COLOROP_1D_LUT, "1D Curve Custom LUT" },

Since we now have both a "normal" 1D curve, and a "special" one=E2=80=A6 Wo=
uld it make
sense to change our minds regarding the naming of the former? For instance,=
 we
could rename it to DRM_COLOROP_FIXED_1D_CURVE. Or is the current name clear
enough (and only the human-readable name can be switched to "1D Fixed Curve=
")?
