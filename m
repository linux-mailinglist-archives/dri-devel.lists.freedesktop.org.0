Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C829E524BC9
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CAA10FF19;
	Thu, 12 May 2022 11:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E08D610FF19
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fRQT5olMn4pkSqfwVjd40BV4gTHG/XYj7xcsO078aE4=; b=ED6wFW+cfsueBQw7HaAYWQurqO
 5wAaZSzYmbcKQRdUQcOZZI9XfIAzkuUSwvivdqWwRVZ7DV3J3DmKcXU3Wn8cm2uI2TZXAmODsYKNV
 34Pyy5XZrL7GSKjpT9RtxGsQaMhL8+k6TbbL26iMrQSwPHNBS2hHQEVLkw/R9nDkyJvpXN34chlV5
 iNy8RsMPTYaljWedGbwte+yQ8+XfUitsiTEJYJHbuudZGNdAV5WyIatuyImDjYtk5/ZKRXURD/uy9
 POVY0uH8huXBNNTFWGvDh9QN5Q18/VqAwSstutwpGU0iD7iRMMMkiUwQeQrFxhjVr4Q7VhSb5jeSM
 Os/ZXNgA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1np77r-000Bbq-UP; Thu, 12 May 2022 13:36:59 +0200
Date: Thu, 12 May 2022 10:36:42 -0100
From: Melissa Wen <mwen@igalia.com>
To: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/vkms: return early if compose_plane fails
Message-ID: <20220512113642.6bhkhikiprxks376@mail.igalia.com>
References: <20220415111300.61013-1-tales.aparecida@gmail.com>
 <20220415111300.61013-3-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ncdrrmpmlwtjosst"
Content-Disposition: inline
In-Reply-To: <20220415111300.61013-3-tales.aparecida@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <melissa.srw@gmail.com>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ncdrrmpmlwtjosst
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/15, Tales Lelo da Aparecida wrote:
> Do not exit quietly from compose_plane. If any plane has an invalid
> map, propagate the error value upwards. While here, add log messages
> for the invalid index.
>=20
> Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 30 ++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index b47ac170108c..c0a3b53cd155 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -149,16 +149,16 @@ static void blend(void *vaddr_dst, void *vaddr_src,
>  	}
>  }
> =20
> -static void compose_plane(struct vkms_composer *primary_composer,
> -			  struct vkms_composer *plane_composer,
> -			  void *vaddr_out)
> +static int compose_plane(struct vkms_composer *primary_composer,
> +			 struct vkms_composer *plane_composer,
> +			 void *vaddr_out)
>  {
>  	struct drm_framebuffer *fb =3D &plane_composer->fb;
>  	void *vaddr;
>  	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> =20
>  	if (WARN_ON(iosys_map_is_null(&plane_composer->map[0])))
> -		return;
> +		return -EINVAL;
> =20
>  	vaddr =3D plane_composer->map[0].vaddr;
> =20
> @@ -168,6 +168,8 @@ static void compose_plane(struct vkms_composer *prima=
ry_composer,
>  		pixel_blend =3D &x_blend;
> =20
>  	blend(vaddr_out, vaddr, primary_composer, plane_composer, pixel_blend);
> +
> +	return 0;
>  }
> =20
>  static int compose_active_planes(void **vaddr_out,
> @@ -177,7 +179,7 @@ static int compose_active_planes(void **vaddr_out,
>  	struct drm_framebuffer *fb =3D &primary_composer->fb;
>  	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
>  	const void *vaddr;
> -	int i;
> +	int i, ret;
> =20
>  	if (!*vaddr_out) {
>  		*vaddr_out =3D kzalloc(gem_obj->size, GFP_KERNEL);
> @@ -187,8 +189,10 @@ static int compose_active_planes(void **vaddr_out,
>  		}
>  	}
> =20
> -	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0])))
> +	if (WARN_ON(iosys_map_is_null(&primary_composer->map[0]))) {
> +		DRM_DEBUG_DRIVER("Failed to compose. Invalid map in the primary plane.=
");
>  		return -EINVAL;
yes, good to have a debug msg here. I would say `mapping`
> +	}
> =20
>  	vaddr =3D primary_composer->map[0].vaddr;
> =20
> @@ -198,10 +202,16 @@ static int compose_active_planes(void **vaddr_out,
>  	 * planes should be in z-order and compose them associatively:
>  	 * ((primary <- overlay) <- cursor)
>  	 */
> -	for (i =3D 1; i < crtc_state->num_active_planes; i++)
> -		compose_plane(primary_composer,
> -			      crtc_state->active_planes[i]->composer,
> -			      *vaddr_out);
> +	for (i =3D 1; i < crtc_state->num_active_planes; i++) {
> +		ret =3D compose_plane(primary_composer,
> +				    crtc_state->active_planes[i]->composer,
> +				    *vaddr_out);

tbh, I'm not sure on changing compose_plane behaviour here to
invalidate all composition in case of a invalid active plane mapping.

Warning about an inconsistent composition makes sense to me, but it
would be better if we can prevent all resources consumption around each pla=
ne
composition by checking the issue as soon as possible. One idea would be do=
ing
this validation at the time of active_plane selection. Another would be just
check all active_plane mapping right before this loop.

What do you think?

> +		if (ret) {
> +			DRM_DEBUG_DRIVER("Failed to compose. Invalid map in the active_planes=
[%d].",
> +					 i);
> +			return ret;
> +		}
> +	}
> =20
>  	return 0;
>  }
> --=20
> 2.35.1
>=20

--ncdrrmpmlwtjosst
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmJ88UYACgkQwqF3j0dL
ehx3tRAAgb/a71amCBHm/n8CI/NLAWfMcGZRJGjR5g0dn1tfvUh3Ns4p1X3q5/xt
ypHXY7m79fM5FUSji0WBTsQd2OJ3DmrzaPWbFmZKUIY42zVc4Sf4CU0w8kQ9BJER
oE1qPboocq9fn4f0f721HHweX8G+d7EYIJYQbaZC9zetNOe2GP3Knk+PlL6AxTfp
7G9YqQeMO2pY89/iEk46ldKa1DxoTgFA+jqwMyHHtcWYvO1b4DdVeLjH50VX/hal
eRmfq+3DM5qBlISmYn7w5OR5+h6bTpVI6/YdKHq4ppWTU8b6EpGrMHQyZr5KeWeR
18xqph3OccYJ3mNs0zwUxZe1/bxLMBKwQvUmX3tdv+6+NsyZc88tsbec5DjsoNDK
lnv84SLTztWVKxact3IkZk0En5S4KUlAxS5N1pmo3+dCdTma/D9PVh1Km1FbTGLh
Y2PN1XwYaTGH/uu2OX+rfB9jGHzWss7evyLxvWDGobjPwUjBbeoW/1a6kttsHSfl
zKvdyayAacdanWWN+e3NKTQqZbXFhrZw+VwrgqDpVAbzpFGW4GpiyK1l4YwH79wd
BZp4TQ+4mlLgvINeXHRtKU9igd7t5orq4OVCzgMBfnAoB11rpZLkO2J5s6xdiZM6
MyMk8eKCTH9vvRA9NXbuymAMLLX13e580TwFnrbsYRtdf8SsfKE=
=Ikba
-----END PGP SIGNATURE-----

--ncdrrmpmlwtjosst--
