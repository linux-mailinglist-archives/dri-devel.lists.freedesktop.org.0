Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B360A609BA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 08:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7246510E23C;
	Fri, 14 Mar 2025 07:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AZJUWeP3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E32B10E23C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:17:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36ED2A48826;
 Fri, 14 Mar 2025 07:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B100C4CEE3;
 Fri, 14 Mar 2025 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741936627;
 bh=UQ9+UxxXMrfNzmzYIXUgXpda8cS4hyKtx7pSVVB4XT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AZJUWeP3sHk6WCJL0OtYdbiCuY/p+7aX9aOSQ5yYdne4MyGWo/SNiSeMrs1gYa+JO
 CWwzl04PnwppTgZp8gLgNPVG5202ypbgmU2+TjMJuSKYHHOVdcVkQ7JeaCyHz63Vc4
 yWtuEBPoUM45XMJle6OmEdnV9w1PH9lwGWqTT3vTpWOvue1kLL8noa57uuzJh9Jh+B
 lCMpnwKHoFrjFVBL36k1eflre4uvWPrckExcnzh1t/UfGeQYnQcVnEir5wE9wAFYsd
 7xXzAGwysS+21vOCMj9FdBfiGWEi+PuhZYCgD6viaU1zfl5o7laAY45ofEvF1GrLlq
 fLQqcA28rGXaw==
Date: Fri, 14 Mar 2025 08:17:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chenyuan Yang <chenyuan0y@gmail.com>
Cc: wens@csie.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, jernej.skrabec@gmail.com,
 samuel@sholland.org, 
 neil.armstrong@linaro.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
Message-ID: <20250314-prophetic-attentive-platypus-3ab214@houat>
References: <20250314012029.668306-1-chenyuan0y@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6q3hnszpv4smntsm"
Content-Disposition: inline
In-Reply-To: <20250314012029.668306-1-chenyuan0y@gmail.com>
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


--6q3hnszpv4smntsm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/sun4i: backend: Fix error pointers in
 sun4i_backend_atomic_check
MIME-Version: 1.0

Hi,

On Thu, Mar 13, 2025 at 08:20:29PM -0500, Chenyuan Yang wrote:
> The function sun4i_backend_atomic_check was dereferencing pointers
> returned by drm_atomic_get_plane_state without checking for errors. This
> could lead to undefined behavior if the function returns an error pointer.
>=20
> This commit adds checks using IS_ERR to ensure that plane_state is
> valid before dereferencing them.
>=20
> Similar to commit da29abe71e16
> ("drm/amd/display: Fix error pointers in amdgpu_dm_crtc_mem_type_changed"=
).
>=20
> Fixes: 96180dde23b7 ("drm/sun4i: backend: Add a custom atomic_check for t=
he frontend")
> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_backend.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4=
i/sun4i_backend.c
> index 2dded3b828df..a8e0e2123764 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_backend.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
> @@ -490,6 +490,10 @@ static int sun4i_backend_atomic_check(struct sunxi_e=
ngine *engine,
>  	drm_for_each_plane_mask(plane, drm, crtc_state->plane_mask) {
>  		struct drm_plane_state *plane_state =3D
>  			drm_atomic_get_plane_state(state, plane);
> +
> +		if (IS_ERR(plane_state))
> +			return PTR_ERR(plane_state);
> +

This introduces a build warning. You shouldn't mix declarations and code.

Maxime

--6q3hnszpv4smntsm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9PX8AAKCRAnX84Zoj2+
digtAYDNEX1uj/4n3Y1V97Pum0BMwqi1SG9ZsgnDjPQggA14QSrt5669uvj0YJTA
3iABKQIBgMzzgD0FMGNquJ6X6rm3DTbMEwkB184/UVSwGcm7tvHmz5pua6n6Vv8l
gD3dBQbbBw==
=ecRp
-----END PGP SIGNATURE-----

--6q3hnszpv4smntsm--
