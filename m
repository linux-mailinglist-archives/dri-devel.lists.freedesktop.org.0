Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D18CD25267F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 07:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311846E9F6;
	Wed, 26 Aug 2020 05:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E936E9F6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 05:14:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5853AC48;
 Wed, 26 Aug 2020 05:15:21 +0000 (UTC)
Subject: Re: [PATCH 11/23] drm/gem_vram/ttm: move to driver backend destroy
 function.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200826014428.828392-1-airlied@gmail.com>
 <20200826014428.828392-12-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <afaacd27-fdca-de0e-6227-3c26b87404c0@suse.de>
Date: Wed, 26 Aug 2020 07:14:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826014428.828392-12-airlied@gmail.com>
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
Cc: christian.koenig@amd.com, sroland@vmware.com, kraxel@redhat.com,
 bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1573215091=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1573215091==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="78yoFVXFpDP8fpEj6grmohxH0ecXwMzfW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--78yoFVXFpDP8fpEj6grmohxH0ecXwMzfW
Content-Type: multipart/mixed; boundary="hQFIlqBggDu14PqfOm1llKmhegveW8RXe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: kraxel@redhat.com, sroland@vmware.com, bskeggs@redhat.com,
 christian.koenig@amd.com
Message-ID: <afaacd27-fdca-de0e-6227-3c26b87404c0@suse.de>
Subject: Re: [PATCH 11/23] drm/gem_vram/ttm: move to driver backend destroy
 function.
References: <20200826014428.828392-1-airlied@gmail.com>
 <20200826014428.828392-12-airlied@gmail.com>
In-Reply-To: <20200826014428.828392-12-airlied@gmail.com>

--hQFIlqBggDu14PqfOm1llKmhegveW8RXe
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 26.08.20 um 03:44 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index 788557bc5c01..93586a310971 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -973,10 +973,6 @@ static void backend_func_destroy(struct ttm_bo_dev=
ice *bdev, struct ttm_tt *tt)
>  	kfree(tt);
>  }
> =20
> -static struct ttm_backend_func backend_func =3D {
> -	.destroy =3D backend_func_destroy
> -};
> -
>  /*
>   * TTM BO device
>   */
> @@ -991,8 +987,6 @@ static struct ttm_tt *bo_driver_ttm_tt_create(struc=
t ttm_buffer_object *bo,
>  	if (!tt)
>  		return NULL;
> =20
> -	tt->func =3D &backend_func;
> -
>  	ret =3D ttm_tt_init(tt, bo, page_flags);
>  	if (ret < 0)
>  		goto err_ttm_tt_init;
> @@ -1055,6 +1049,7 @@ static int bo_driver_io_mem_reserve(struct ttm_bo=
_device *bdev,
> =20
>  static struct ttm_bo_driver bo_driver =3D {
>  	.ttm_tt_create =3D bo_driver_ttm_tt_create,
> +	.ttm_tt_destroy =3D backend_func_destroy,

Please rename backend_func_destroy to bo_driver_ttm_tt_destroy. With
this change

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Best regards
Thomas

>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
>  	.evict_flags =3D bo_driver_evict_flags,
>  	.move_notify =3D bo_driver_move_notify,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--hQFIlqBggDu14PqfOm1llKmhegveW8RXe--

--78yoFVXFpDP8fpEj6grmohxH0ecXwMzfW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9F78kUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiMcUQf/cfv8ZL9JZiUF6jh1aWCack7KFbVW
cmtEYQKJgql3DPTDkKdJIppgqd2VEYqcFzDRH7sRQXyrJokXwTf5HtvyeKycSl7g
jngAlR5zMtKWdRSHFvS0t0v7Uv1oLsbU+n+EEq53AtFwg2gWcjWdXaCJOO1Hv6JQ
OUh2wpPsoPZ+Q8sditWuyTCEJlB1hcUdzLPVkEYJnDPlrkwB+FVxaEj3o7NKeIz+
xWhcF3go/kXUFCdMWEj7DgbYBVbnBn+pbQTG/4ZVnyEaFr9kArKkEQVg8TJJECpS
uhVjYQPEHyHIes7yPHSkU6mmSD/zXpfiQmoK50bpbVqjO3UIfBKgotT7iA==
=Gxlm
-----END PGP SIGNATURE-----

--78yoFVXFpDP8fpEj6grmohxH0ecXwMzfW--

--===============1573215091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1573215091==--
