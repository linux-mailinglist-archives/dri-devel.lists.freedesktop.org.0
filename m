Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F2F84009A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 09:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAB410F04C;
	Mon, 29 Jan 2024 08:49:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from whm50.louhi.net (whm50.louhi.net [77.240.19.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC6810F04C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 08:49:54 +0000 (UTC)
Received: from [194.136.85.206] (port=46446 helo=eldfell)
 by whm50.louhi.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96.2)
 (envelope-from <pekka.paalanen@haloniitty.fi>) id 1rUNKy-0007D5-0Q;
 Mon, 29 Jan 2024 10:49:52 +0200
Date: Mon, 29 Jan 2024 10:49:34 +0200
From: Pekka Paalanen <pekka.paalanen@haloniitty.fi>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH v3 1/3] drm/atomic: Allow drivers to write their own
 plane check for async flips
Message-ID: <20240129104934.0b887ec7@eldfell>
In-Reply-To: <20240128212515.630345-2-andrealmeid@igalia.com>
References: <20240128212515.630345-1-andrealmeid@igalia.com>
 <20240128212515.630345-2-andrealmeid@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CyNE1g.rxLQR/tPHNy8jH2s";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - whm50.louhi.net
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - haloniitty.fi
X-Get-Message-Sender-Via: whm50.louhi.net: authenticated_id:
 pekka.paalanen@haloniitty.fi
X-Authenticated-Sender: whm50.louhi.net: pekka.paalanen@haloniitty.fi
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: daniel@ffwll.ch, 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Joshua Ashton <joshua@froggi.es>, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/CyNE1g.rxLQR/tPHNy8jH2s
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Jan 2024 18:25:13 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Some hardware are more flexible on what they can flip asynchronously, so
> rework the plane check so drivers can implement their own check, lifting
> up some of the restrictions.
>=20
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
> v3: no changes
>=20
>  drivers/gpu/drm/drm_atomic_uapi.c | 62 ++++++++++++++++++++++---------
>  include/drm/drm_atomic_uapi.h     | 12 ++++++
>  include/drm/drm_plane.h           |  5 +++
>  3 files changed, 62 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atom=
ic_uapi.c
> index aee4a65d4959..6d5b9fec90c7 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -620,7 +620,7 @@ static int drm_atomic_plane_set_property(struct drm_p=
lane *plane,
>  	return 0;
>  }
> =20
> -static int
> +int
>  drm_atomic_plane_get_property(struct drm_plane *plane,
>  		const struct drm_plane_state *state,
>  		struct drm_property *property, uint64_t *val)
> @@ -683,6 +683,7 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(drm_atomic_plane_get_property);
> =20
>  static int drm_atomic_set_writeback_fb_for_connector(
>  		struct drm_connector_state *conn_state,
> @@ -1026,18 +1027,54 @@ int drm_atomic_connector_commit_dpms(struct drm_a=
tomic_state *state,
>  	return ret;
>  }
> =20
> -static int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint=
64_t prop_value,
> +int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t pr=
op_value,

Hi,

should the word "async" be somewhere in the function name?

>  					 struct drm_property *prop)
>  {
>  	if (ret !=3D 0 || old_val !=3D prop_value) {
>  		drm_dbg_atomic(prop->dev,
> -			       "[PROP:%d:%s] No prop can be changed during async flip\n",
> +			       "[PROP:%d:%s] This prop cannot be changed during async flip\n",
>  			       prop->base.id, prop->name);
>  		return -EINVAL;
>  	}
> =20
>  	return 0;
>  }
> +EXPORT_SYMBOL(drm_atomic_check_prop_changes);
> +
> +/* plane changes may have exceptions, so we have a special function for =
them */
> +static int drm_atomic_check_plane_changes(struct drm_property *prop,
> +					  struct drm_plane *plane,
> +					  struct drm_plane_state *plane_state,
> +					  struct drm_mode_object *obj,
> +					  u64 prop_value, u64 old_val)
> +{
> +	struct drm_mode_config *config =3D &plane->dev->mode_config;
> +	int ret;
> +
> +	if (plane->funcs->check_async_props)
> +		return plane->funcs->check_async_props(prop, plane, plane_state,
> +							     obj, prop_value, old_val);

Is it really ok to allow drivers to opt-in to also *reject* the FB_ID
and IN_FENCE_FD props on async commits?

Either intentionally or by accident.

> +
> +	/*
> +	 * if you are trying to change something other than the FB ID, your
> +	 * change will be either rejected or ignored, so we can stop the check
> +	 * here
> +	 */
> +	if (prop !=3D config->prop_fb_id) {
> +		ret =3D drm_atomic_plane_get_property(plane, plane_state,
> +						    prop, &old_val);
> +		return drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);

When I first read this code, it seemed to say: "If the prop is not
FB_ID, then do the usual prop change checking that happens on all
changes, not only async.". Reading this patch a few more times over, I
finally realized drm_atomic_check_prop_changes() is about async
specifically.

> +	}
> +
> +	if (plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMARY) {
> +		drm_dbg_atomic(prop->dev,
> +			       "[OBJECT:%d] Only primary planes can be changed during async f=
lip\n",
> +			       obj->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> =20
>  int drm_atomic_set_property(struct drm_atomic_state *state,
>  			    struct drm_file *file_priv,
> @@ -1100,7 +1137,6 @@ int drm_atomic_set_property(struct drm_atomic_state=
 *state,
>  	case DRM_MODE_OBJECT_PLANE: {
>  		struct drm_plane *plane =3D obj_to_plane(obj);
>  		struct drm_plane_state *plane_state;
> -		struct drm_mode_config *config =3D &plane->dev->mode_config;
> =20
>  		plane_state =3D drm_atomic_get_plane_state(state, plane);
>  		if (IS_ERR(plane_state)) {
> @@ -1108,19 +1144,11 @@ int drm_atomic_set_property(struct drm_atomic_sta=
te *state,
>  			break;
>  		}
> =20
> -		if (async_flip && prop !=3D config->prop_fb_id) {
> -			ret =3D drm_atomic_plane_get_property(plane, plane_state,
> -							    prop, &old_val);
> -			ret =3D drm_atomic_check_prop_changes(ret, old_val, prop_value, prop);
> -			break;
> -		}
> -
> -		if (async_flip && plane_state->plane->type !=3D DRM_PLANE_TYPE_PRIMARY=
) {
> -			drm_dbg_atomic(prop->dev,
> -				       "[OBJECT:%d] Only primary planes can be changed during async =
flip\n",
> -				       obj->id);
> -			ret =3D -EINVAL;
> -			break;
> +		if (async_flip) {
> +			ret =3D drm_atomic_check_plane_changes(prop, plane, plane_state,

Should there be "async" somewhere in the name of
drm_atomic_check_plane_changes()?


Thanks,
pq

> +							     obj, prop_value, old_val);
> +			if (ret)
> +				break;
>  		}
> =20
>  		ret =3D drm_atomic_plane_set_property(plane,
> diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
> index 4c6d39d7bdb2..d65fa8fbbca0 100644
> --- a/include/drm/drm_atomic_uapi.h
> +++ b/include/drm/drm_atomic_uapi.h
> @@ -29,6 +29,8 @@
>  #ifndef DRM_ATOMIC_UAPI_H_
>  #define DRM_ATOMIC_UAPI_H_
> =20
> +#include <linux/types.h>
> +
>  struct drm_crtc_state;
>  struct drm_display_mode;
>  struct drm_property_blob;
> @@ -37,6 +39,9 @@ struct drm_crtc;
>  struct drm_connector_state;
>  struct dma_fence;
>  struct drm_framebuffer;
> +struct drm_mode_object;
> +struct drm_property;
> +struct drm_plane;
> =20
>  int __must_check
>  drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
> @@ -53,4 +58,11 @@ int __must_check
>  drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
>  				  struct drm_crtc *crtc);
> =20
> +int drm_atomic_plane_get_property(struct drm_plane *plane,
> +				  const struct drm_plane_state *state,
> +				  struct drm_property *property, uint64_t *val);
> +
> +int drm_atomic_check_prop_changes(int ret, uint64_t old_val, uint64_t pr=
op_value,
> +				  struct drm_property *prop);
> +
>  #endif
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index c6565a6f9324..73dac8d76831 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -540,6 +540,11 @@ struct drm_plane_funcs {
>  	 */
>  	bool (*format_mod_supported)(struct drm_plane *plane, uint32_t format,
>  				     uint64_t modifier);
> +
> +	int (*check_async_props)(struct drm_property *prop, struct drm_plane *p=
lane,
> +				 struct drm_plane_state *plane_state,
> +				 struct drm_mode_object *obj,
> +				 u64 prop_value, u64 old_val);
>  };
> =20
>  /**


--Sig_/CyNE1g.rxLQR/tPHNy8jH2s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmW3Zp4ACgkQI1/ltBGq
qqc8ehAAooc9fYyi2pAyuNuCwLMhuUV+A791NMTj40g1r5gP0brsb6TlW+iX8+Ge
rNYw4wHQRPKqAhhd/JywuMR1YP/tRHLrOZiG2381ZWk8QJmhW6aT1Q3RtojeraxK
ubNMvzadC7Di6VmkKVvH/9rLgCs79Brz2nAEAPCdEWJ/Q4fiXhajk8maKM4Zf21l
q3+AVBpIbP0OFpvw+HKu1EkDV8TdlWHRJYebWR+ju5L7LxDStSL5PuUFNA2TFWbG
kQfpoS4TLmeM2BA4GjaADB32mo5a6y6GEAHolGsp9AHxRrCaN0+wCLObNmCgz/Xs
EcylMgMUvHWJuL9Nhr2UzDwb668fJa2Drirmx62bXubjsmqTEMACvmdiLtYNPFHd
tmrskOq2jquNsYdSOO1lyNsrU5wL27mOR2qkY/L/niMKtKOxD+e7SNzYe8YiJDAT
gup/t+jSEVj5uEP9Fh5KWQLjGpv5M7ZOx4El3BZ5OfmD48lEkUWm4Ol4Cvwgn79d
7+x62h69VWFskO05OLt/c7rkCiPxMwl6JDQA7GXSS5lAkjFVfrlIPDlT62E7xWTm
TH0gdwCKbZNh81QuZ7hxKX6GLyk5Z9Ir5SzX8kHRdnMENiyKWLtW9rIvj7nCCgli
PMckBk7wycSe6xUZkDBsDsJpreMhNDu/oXn1Tl+unqMWmfStaUk=
=19nM
-----END PGP SIGNATURE-----

--Sig_/CyNE1g.rxLQR/tPHNy8jH2s--
