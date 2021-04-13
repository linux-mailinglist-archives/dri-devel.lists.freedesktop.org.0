Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613E35DCBB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 12:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E88189CD8;
	Tue, 13 Apr 2021 10:48:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6CA89B27;
 Tue, 13 Apr 2021 10:48:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC2ADAEFB;
 Tue, 13 Apr 2021 10:47:58 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/shmem-helper: Align to page size in dumb_create
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20210413094937.3736541-1-daniel.vetter@ffwll.ch>
 <20210413094937.3736541-3-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <af920f32-4fc1-a96e-64e6-8352fb5da523@suse.de>
Date: Tue, 13 Apr 2021 12:47:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210413094937.3736541-3-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0322742422=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0322742422==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jVfcCROk7CxJ91gQLk00cE3D6GttNh4VX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jVfcCROk7CxJ91gQLk00cE3D6GttNh4VX
Content-Type: multipart/mixed; boundary="lWRzu6cbfPSWiUWanLTs6KEPAMCUK3JOu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <af920f32-4fc1-a96e-64e6-8352fb5da523@suse.de>
Subject: Re: [PATCH 3/3] drm/shmem-helper: Align to page size in dumb_create
References: <20210413094937.3736541-1-daniel.vetter@ffwll.ch>
 <20210413094937.3736541-3-daniel.vetter@ffwll.ch>
In-Reply-To: <20210413094937.3736541-3-daniel.vetter@ffwll.ch>

--lWRzu6cbfPSWiUWanLTs6KEPAMCUK3JOu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.04.21 um 11:49 schrieb Daniel Vetter:
> shmem helpers seem a bit sloppy here by automatically rounding up when
> actually creating the buffer, which results in under-reporting of what
> we actually have. Caught by igt/vgem_basic tests.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Drivers get it more wrong than right. I always felt that we should have=20
all this in generic code with a few parameters somewhere.

But makes sense.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/drm_gem_shmem_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/d=
rm_gem_shmem_helper.c
> index 6d625cee7a6a..d5e6d4568f99 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -505,13 +505,13 @@ int drm_gem_shmem_dumb_create(struct drm_file *fi=
le, struct drm_device *dev,
>  =20
>   	if (!args->pitch || !args->size) {
>   		args->pitch =3D min_pitch;
> -		args->size =3D args->pitch * args->height;
> +		args->size =3D PAGE_ALIGN(args->pitch * args->height);
>   	} else {
>   		/* ensure sane minimum values */
>   		if (args->pitch < min_pitch)
>   			args->pitch =3D min_pitch;
>   		if (args->size < args->pitch * args->height)
> -			args->size =3D args->pitch * args->height;
> +			args->size =3D PAGE_ALIGN(args->pitch * args->height);
>   	}
>  =20
>   	shmem =3D drm_gem_shmem_create_with_handle(file, dev, args->size, &a=
rgs->handle);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lWRzu6cbfPSWiUWanLTs6KEPAMCUK3JOu--

--jVfcCROk7CxJ91gQLk00cE3D6GttNh4VX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB1dt0FAwAAAAAACgkQlh/E3EQov+DP
4BAAygIlC8JQb0tw3dOLDSCRbqN6qGaeHa0YS17K+LZLhm50FcfzSmH9v/TOGJ+zzBIeC6crK01P
Dem2fb9GGYu3U5ECnvG8/i2kah3tE7aDQ9uylUaV/LlY2mg85sz7Y8NiQ3im7osjS2FmKroW19mB
W8PCAU655tFcXJzyje1uctIbxvql1jIPr75pKS+yi/nydJqcDi3B1a8fpoq6qnQ3QQ2/oUuolSMP
w14jWSIDAoRbMqhki9mef3sZXpi9LTDi/tlxielmfM2gizpZTwy1iWlKFqf8MpZu9UI84Aar8MJD
37TLqqiaKS7QNrzEaNIgKYieZ9e7r6gh4rjetg5vwZv8W9PaqEtTF6QALyAcMIQhE8bgkcaaNQ/p
ZcIGHQl3d/YnuQDamym3qXZKlirvgNj5eEKhRaVt5X1Hwmd2WaysCg+RY/ChQVQWY8umf+vfILtv
Yd+uYzUBE8ZP1/04drzjE8W0Pm40D/5h8hvJWD2/wufd8bWFwcRobVwSLDzV8xL/9+I3VPsKU2iC
h5oxDrgSN6fzLbZ6513oxwAPhBRgVfqb6I2utOLQGef37TNq9u6PW9SdK/a7lXzLMuGHoRHkQpme
hJxfh1JNHzpdz6xkxjamd7syddegBJDPBSq0YzBAvE9GaQRUJPtSVArwZshwnwi07wM7MHMo5qMp
UuQ=
=1po7
-----END PGP SIGNATURE-----

--jVfcCROk7CxJ91gQLk00cE3D6GttNh4VX--

--===============0322742422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0322742422==--
