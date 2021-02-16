Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946F31CAF0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 14:16:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A906E952;
	Tue, 16 Feb 2021 13:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC436E951;
 Tue, 16 Feb 2021 13:16:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F1523AF2C;
 Tue, 16 Feb 2021 13:16:27 +0000 (UTC)
Subject: Re: [PATCH 07/10] drm/qxl: fix prime kmap
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-8-kraxel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a5c31dc0-3b89-fbb2-b933-b28a89cf14e7@suse.de>
Date: Tue, 16 Feb 2021 14:16:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210216113716.716996-8-kraxel@redhat.com>
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
Content-Type: multipart/mixed; boundary="===============1712471074=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1712471074==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uKKinKeYKRMHvQbXcRlKSL8e4OX4eXTBp"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uKKinKeYKRMHvQbXcRlKSL8e4OX4eXTBp
Content-Type: multipart/mixed; boundary="vAkSA4xPbEBg28YfmM4zHXhoJSRUwKles";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Message-ID: <a5c31dc0-3b89-fbb2-b933-b28a89cf14e7@suse.de>
Subject: Re: [PATCH 07/10] drm/qxl: fix prime kmap
References: <20210216113716.716996-1-kraxel@redhat.com>
 <20210216113716.716996-8-kraxel@redhat.com>
In-Reply-To: <20210216113716.716996-8-kraxel@redhat.com>

--vAkSA4xPbEBg28YfmM4zHXhoJSRUwKles
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.02.21 um 12:37 schrieb Gerd Hoffmann:
> Use the correct kmap variant.  We don't have a reservation here,
> so we can't use the _locked version.

I'd merge this change into patch 6. So the new functions come with a call=
er.

Best regards
Thomas

>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   drivers/gpu/drm/qxl/qxl_prime.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_=
prime.c
> index dc295b2e2b52..4aa949799446 100644
> --- a/drivers/gpu/drm/qxl/qxl_prime.c
> +++ b/drivers/gpu/drm/qxl/qxl_prime.c
> @@ -59,7 +59,7 @@ int qxl_gem_prime_vmap(struct drm_gem_object *obj, st=
ruct dma_buf_map *map)
>   	struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
>   	int ret;
>  =20
> -	ret =3D qxl_bo_kmap_locked(bo, map);
> +	ret =3D qxl_bo_kmap(bo, map);
>   	if (ret < 0)
>   		return ret;
>  =20
> @@ -71,7 +71,7 @@ void qxl_gem_prime_vunmap(struct drm_gem_object *obj,=

>   {
>   	struct qxl_bo *bo =3D gem_to_qxl_bo(obj);
>  =20
> -	qxl_bo_kunmap_locked(bo);
> +	qxl_bo_kunmap(bo);
>   }
>  =20
>   int qxl_gem_prime_mmap(struct drm_gem_object *obj,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vAkSA4xPbEBg28YfmM4zHXhoJSRUwKles--

--uKKinKeYKRMHvQbXcRlKSL8e4OX4eXTBp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmArxaoFAwAAAAAACgkQlh/E3EQov+DX
qQ/7BvZtEpUlBoumZ69okz6fXrMEsbuaMjN1bickEAHHohlVO0SfwwEszsaj8b7myX+eqyyKppkZ
oP8ya7DtMITYmrOGmQQMwiGWKC44PD6RxXY7DdPMc30m0PZbNI4imf2+r6x9nr6SUztWLN6NrViu
v22jdzrG8uaulYNiUVLIBHb+Sr96apoATLzNS0iAMiEWu4otLs6v5+o8X2t0k+RXk2ACq3ikBJFG
zbSbqAWpM0hXtE+k6OFWa7ke/r/f250qVHXlMomkjKs2B/dcMixIRTOIqzwBPmzbsKe22JUoG1wN
swZLPwUg82WVjw15qamh6n3d1+r01dTIEQp5+lmqbfvsAgZzCrbb7UPFevmDxQVoEsCLza8VfzNU
TTH/mDGvgTUYRylxDCsa9NAEF9k3MEAuuSzA/WmeB+3yNO+Fc7ocFa2vUglNBLsFKgJ+2Kx+WUli
gtVjjoB9CfLeh82NRKVCyFVnXWd/KcsqwEHl8LvLwj0ncFLPv09Uv7CmBBnxurVE529/+M52cc2w
bes0j6XY1k1GhmTfM4m8kElYBYx9t+oXfBgu7vApf8Bp8UJT7rJqlE2k0wdG+Ji2neEva6gVQgUb
0TEFmYCL+/ctcxZsDWvhaKTcyNTn3I2t/yHcD7l4ovETIGlbPNQec+ptT3fCBGb2my/U+tDqkTqR
kng=
=fDtR
-----END PGP SIGNATURE-----

--uKKinKeYKRMHvQbXcRlKSL8e4OX4eXTBp--

--===============1712471074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1712471074==--
