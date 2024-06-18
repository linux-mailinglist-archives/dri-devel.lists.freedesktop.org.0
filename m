Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF390C551
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 11:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BB510E076;
	Tue, 18 Jun 2024 09:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J/BxB1HH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA99B10E076
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 09:28:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4859161682;
 Tue, 18 Jun 2024 09:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A363AC3277B;
 Tue, 18 Jun 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718702898;
 bh=lH0Dcqp9U5fD6GzqGhIWBPdf/RypdHix8vSzyUjzJpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/BxB1HHDmMqDXRlIflHWlQ69wc00em95nugblYtwkrV65J9nt9+EW46A8wjWhcHM
 buuaOsIbSEiqaYbPhnwLBY2HUCBu6p/Bp2uq1JlW7qeoUL+nUeVj/aNDCorwqId9kb
 cIX5Xu0wPMu+N30RmHDGtXjYzzfcdLEiu0FhkIpDP8S/gtXNxCbRTY51gL9eEo6w80
 g42kfXsiPIdXq3DStzrO8rM1SaIeUmIJhOJ2WbFRlA/W5Qu3opVWl1IhIspa2JP+Fj
 7OoAYgZfOYOiyPq4FMzcFpIiB7QnCEdVFM2PvkC2DrtW6zjNU7zi7PIWevFjd5QEhz
 N+xpWxi8kKF4A==
Date: Tue, 18 Jun 2024 11:28:15 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/vc4: Add monochrome mode to the VEC.
Message-ID: <20240618-sly-wealthy-nyala-b9cd1f@houat>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-3-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mna36ouuvlcpr2l6"
Content-Disposition: inline
In-Reply-To: <20240216184857.245372-3-dave.stevenson@raspberrypi.com>
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


--mna36ouuvlcpr2l6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 16, 2024 at 06:48:56PM GMT, Dave Stevenson wrote:
> The VEC supports not producing colour bursts for monochrome output.
> It also has an option for disabling the chroma input to remove
> chroma from the signal.
>=20
> Now that there is a DRM_MODE_TV_MODE_MONOCHROME defined, plumb
> this in.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/vc4/vc4_vec.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_vec.c b/drivers/gpu/drm/vc4/vc4_vec.c
> index 268f18b10ee0..f9e134dd1e3b 100644
> --- a/drivers/gpu/drm/vc4/vc4_vec.c
> +++ b/drivers/gpu/drm/vc4/vc4_vec.c
> @@ -234,6 +234,7 @@ enum vc4_vec_tv_mode_id {
>  	VC4_VEC_TV_MODE_PAL_60,
>  	VC4_VEC_TV_MODE_PAL_N,
>  	VC4_VEC_TV_MODE_SECAM,
> +	VC4_VEC_TV_MODE_MONOCHROME,
>  };
> =20
>  struct vc4_vec_tv_mode {
> @@ -324,6 +325,22 @@ static const struct vc4_vec_tv_mode vc4_vec_tv_modes=
[] =3D {
>  		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
>  		.custom_freq =3D 0x29c71c72,
>  	},
> +	{
> +		/* 50Hz mono */
> +		.mode =3D DRM_MODE_TV_MODE_MONOCHROME,
> +		.expected_htotal =3D 864,
> +		.config0 =3D VEC_CONFIG0_PAL_BDGHI_STD | VEC_CONFIG0_BURDIS |
> +			   VEC_CONFIG0_CHRDIS,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +	},
> +	{
> +		/* 60Hz mono */
> +		.mode =3D DRM_MODE_TV_MODE_MONOCHROME,
> +		.expected_htotal =3D 858,
> +		.config0 =3D VEC_CONFIG0_PAL_M_STD | VEC_CONFIG0_BURDIS |
> +			   VEC_CONFIG0_CHRDIS,
> +		.config1 =3D VEC_CONFIG1_C_CVBS_CVBS,
> +	},
>  };
> =20
>  static inline const struct vc4_vec_tv_mode *
> @@ -351,6 +368,7 @@ static const struct drm_prop_enum_list legacy_tv_mode=
_names[] =3D {
>  	{ VC4_VEC_TV_MODE_PAL_M, "PAL-M", },
>  	{ VC4_VEC_TV_MODE_PAL_N, "PAL-N", },
>  	{ VC4_VEC_TV_MODE_SECAM, "SECAM", },
> +	{ VC4_VEC_TV_MODE_MONOCHROME, "Mono", },
>  };
> =20
>  static enum drm_connector_status
> @@ -406,6 +424,10 @@ vc4_vec_connector_set_property(struct drm_connector =
*connector,
>  		state->tv.mode =3D DRM_MODE_TV_MODE_SECAM;
>  		break;
> =20
> +	case VC4_VEC_TV_MODE_MONOCHROME:
> +		state->tv.mode =3D DRM_MODE_TV_MODE_MONOCHROME;
> +		break;
> +
>  	default:
>  		return -EINVAL;
>  	}
> @@ -453,6 +475,9 @@ vc4_vec_connector_get_property(struct drm_connector *=
connector,
>  		*val =3D VC4_VEC_TV_MODE_SECAM;
>  		break;
> =20
> +	case DRM_MODE_TV_MODE_MONOCHROME:
> +		return VC4_VEC_TV_MODE_MONOCHROME;
> +
>  	default:
>  		return -EINVAL;
>  	}

We don't need to expose the new value here, that property is only for
the legacy, driver-specific property. So you should only need the
vc4_vec_tv_modes changes

Maxime

--mna36ouuvlcpr2l6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZnFTLwAKCRDj7w1vZxhR
xVwNAP407LFeintH3yQqM/zvcvU3iQlVo5LVQsFZ6GVsrqXEvQD+OIAnuZqkF9PS
VckaIRGPJnE77jLR2MMXJluJY9QuKAM=
=a4vd
-----END PGP SIGNATURE-----

--mna36ouuvlcpr2l6--
