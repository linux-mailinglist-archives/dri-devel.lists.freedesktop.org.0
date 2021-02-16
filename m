Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B249F31CB1B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 14:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4BD6E402;
	Tue, 16 Feb 2021 13:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7316E301;
 Tue, 16 Feb 2021 13:30:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E5E5ACBF;
 Tue, 16 Feb 2021 13:30:40 +0000 (UTC)
Subject: Re: [PATCH 10/10] drm/qxl: add lock asserts to qxl_bo_kmap_locked +
 qxl_bo_kunmap_locked
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-11-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f61561a4-f6c7-9237-cd10-1c69016e6e45@suse.de>
Date: Tue, 16 Feb 2021 14:30:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216113716.716996-11-kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============0935025378=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0935025378==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tFhe9PKG2q0fqzqCD5MFXWxnTuigfR9oA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tFhe9PKG2q0fqzqCD5MFXWxnTuigfR9oA
Content-Type: multipart/mixed; boundary="mHiYfAjZjkwogDjV1m7fAzeEA06jD8QEi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <f61561a4-f6c7-9237-cd10-1c69016e6e45@suse.de>
Subject: Re: [PATCH 10/10] drm/qxl: add lock asserts to qxl_bo_kmap_locked +
 qxl_bo_kunmap_locked
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-11-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-11-kraxel@redhat.com>

--mHiYfAjZjkwogDjV1m7fAzeEA06jD8QEi
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.02.21 um 12:37 schrieb Gerd Hoffmann:
> Try avoid re-introducing locking bugs.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

IMHO this should eventually be done in the rsp TTM functions. But so=20
far, I'd expect this to break some drivers.

Best regards
Thomas

> ---
>   drivers/gpu/drm/qxl/qxl_object.c | 4 ++++
>   1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl=
_object.c
> index 22748b9566af..90d5e5b7f927 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -162,6 +162,8 @@ int qxl_bo_kmap_locked(struct qxl_bo *bo, struct dm=
a_buf_map *map)
>   {
>   	int r;
>  =20
> +	dma_resv_assert_held(bo->tbo.base.resv);
> +
>   	if (bo->kptr) {
>   		bo->map_count++;
>   		goto out;
> @@ -236,6 +238,8 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qd=
ev,
>  =20
>   void qxl_bo_kunmap_locked(struct qxl_bo *bo)
>   {
> +	dma_resv_assert_held(bo->tbo.base.resv);
> +
>   	if (bo->kptr =3D=3D NULL)
>   		return;
>   	bo->map_count--;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mHiYfAjZjkwogDjV1m7fAzeEA06jD8QEi--

--tFhe9PKG2q0fqzqCD5MFXWxnTuigfR9oA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAryP4FAwAAAAAACgkQlh/E3EQov+Da
lBAApClBe1Rptsp/Inp0yQSpt5brR4TNcD4dqXLn3k3TU5AiH7SlkhVt3h0s8aGDbq/NdSVvXwKF
/iQXwI3PNSi21+LaQmsVNGpJDSv40TyCbyJTyAWZXvn56xOH3NZqWqNvJgAIWUUDJghJyHLFmNTs
dBjvPAFAr7pJVIhDbKYubtUZMWd6Qn/rAaDDBWBkyVmApWmp972ZOU0GV/z9YHQEDiXD1QDh/lni
H4yaD1MQ/gO3gaN56THnLqvD9tThGAQnqI190PqaDSRJGbFjEYvxVbty3+wAx4OlYn0QYDCS0A8N
4wmn1t8UH1KzNDF4X5R1OgLjn9mwehFikDgHrJ7bJZ3U/uL7UpQp4vZxdfqodUfnYr1ohHvIYLEk
pAGI9pHVtaNkhcvBj0KQV3KHobWi6Y2F5JFtwg0nIgP/llkCYvkRsZ3tNt8DygsPO4Gnt/jNAYLy
ahgIxMDQlcgvJvdqo/NPoCINcZ1qGlE7WCYXn65u9aO/pTC7MzcgtWw6VdZF/BXNDDDFo5D2hNqc
t949uMtohBjs0yp+3QL+OvnwAnoAOWO9bBPnnGzgSU3hzch4WKpUM3O1EGUBX+Lzv18y2echDOFY
PsiDWolQQHH++DHwbQt6R7y1mruXLRQtlsWvVD9I506qKaZIeNEYGZJ106ue7MlHgrQabUNgkuX3
d/E=
=Kcjb
-----END PGP SIGNATURE-----

--tFhe9PKG2q0fqzqCD5MFXWxnTuigfR9oA--

--===============0935025378==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0935025378==--
