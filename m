Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D225837F867
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 15:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBD446E1F1;
	Thu, 13 May 2021 13:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915DF6E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 13:08:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1976BAE57;
 Thu, 13 May 2021 13:08:19 +0000 (UTC)
Subject: Re: [PATCH -next] drm/aperture: Fix missing unlock on error in
 devm_aperture_acquire()
To: Zou Wei <zou_wei@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
References: <1620895564-52367-1-git-send-email-zou_wei@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <bc0b8b71-507d-c6c2-9029-359c7f27daf4@suse.de>
Date: Thu, 13 May 2021 15:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1620895564-52367-1-git-send-email-zou_wei@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2LYd2hGxsv9U9ONrL0OFzeYrSnmGgUNVz"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2LYd2hGxsv9U9ONrL0OFzeYrSnmGgUNVz
Content-Type: multipart/mixed; boundary="Pv7MotVf5ovpQSqaWZ0JWXWfLBQj6bAYF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zou Wei <zou_wei@huawei.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <bc0b8b71-507d-c6c2-9029-359c7f27daf4@suse.de>
Subject: Re: [PATCH -next] drm/aperture: Fix missing unlock on error in
 devm_aperture_acquire()
References: <1620895564-52367-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1620895564-52367-1-git-send-email-zou_wei@huawei.com>

--Pv7MotVf5ovpQSqaWZ0JWXWfLBQj6bAYF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.05.21 um 10:46 schrieb Zou Wei:
> Add the missing unlock before return from function devm_aperture_acquir=
e()
> in the error handling case.
>=20
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

I added a Fixes tag and queued up the patch for drm-misc-next. Thanks!

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_aperture.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_aperture.c b/drivers/gpu/drm/drm_apert=
ure.c
> index 33bf018..9335d9d 100644
> --- a/drivers/gpu/drm/drm_aperture.c
> +++ b/drivers/gpu/drm/drm_aperture.c
> @@ -164,13 +164,17 @@ static int devm_aperture_acquire(struct drm_devic=
e *dev,
>  =20
>   	list_for_each(pos, &drm_apertures) {
>   		ap =3D container_of(pos, struct drm_aperture, lh);
> -		if (overlap(base, end, ap->base, ap->base + ap->size))
> +		if (overlap(base, end, ap->base, ap->base + ap->size)) {
> +			mutex_unlock(&drm_apertures_lock);
>   			return -EBUSY;
> +		}
>   	}
>  =20
>   	ap =3D devm_kzalloc(dev->dev, sizeof(*ap), GFP_KERNEL);
> -	if (!ap)
> +	if (!ap) {
> +		mutex_unlock(&drm_apertures_lock);
>   		return -ENOMEM;
> +	}
>  =20
>   	ap->dev =3D dev;
>   	ap->base =3D base;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Pv7MotVf5ovpQSqaWZ0JWXWfLBQj6bAYF--

--2LYd2hGxsv9U9ONrL0OFzeYrSnmGgUNVz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCdJMEFAwAAAAAACgkQlh/E3EQov+Bh
fw//T1Y3PBtm36xSAjECT3jg/7zd4WOP89zbgzF6GBPFGoDf+63SbcAP6AkbA9U8/wU1XwmMC5tn
7SqaE7h1mMp2d0+h/OtU7/WVInyFEVoYG3S1KtmdiqjNMu+YAtIbTbwaYnw+4NdgRD3pZ0VTYc1Z
fhyce77rCvruYxWLgPdUell2SylKe8URuGB8Rgh40v5DkAx/6DZ1m4RKSS8sKWZxydDliVWayXAs
uYzBdydq/XOoq+Nq8rzaJMC+MUCiE0T2iqLgC9PR5UYMIBM84VK/jefiLWrYWatUk5HLScPQmAb1
+7y5y4Aqt0kiom810plXO+DneYcCHm0q9PNPYEOHdsoaCE3+wHoV/VHnnzZ5ShTgJl6ovGrRMRm0
pxJ6p8aqALIQUDXJyBQPZLkTlMKS+92SR49WmKZzHAtvmXOKx6Vzx0Fuk3WKot2UHuNHiS3XAh/l
URyyDmylCGc5wm4YDR8NQRFf9FeYTqvPSxMxHro9s49y2JhXU2MC1qLCmm6TApceoI9Tw2yoEX/W
cejQGquZPKtNThZtVRPOejXwKNJbXhsGlDLKDJghVAkw+szKFartVXYpnS6U5sErAhEvOTGZFGlY
3h/eQ99RnnGLimHc4PFjmSwFKKCATkpslGbd8TEXCT+Al4myMRUnTYOYkkFExQtzYy98/vh8GjvN
JpQ=
=vxrH
-----END PGP SIGNATURE-----

--2LYd2hGxsv9U9ONrL0OFzeYrSnmGgUNVz--
