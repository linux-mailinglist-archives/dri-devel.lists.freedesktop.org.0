Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CB8112415
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 09:01:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C876F442;
	Wed,  4 Dec 2019 08:01:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE316E86E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 18:26:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 2438D28FBCB
Date: Tue, 3 Dec 2019 13:26:45 -0500
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] drm/panfrost: Register devfreq cooling device
Message-ID: <20191203182645.GA4060@kevin>
References: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
MIME-Version: 1.0
In-Reply-To: <21f228099321f460d62e0ab7c77b2d2213dd4da8.1574974319.git.robin.murphy@arm.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Wed, 04 Dec 2019 08:01:16 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com
Content-Type: multipart/mixed; boundary="===============2104234632=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2104234632==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Not sure if this was already pushed but:

	Acked-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Thu, Nov 28, 2019 at 08:54:27PM +0000, Robin Murphy wrote:
> When we have devfreq, also try to register a basic cooling device in
> case GPU workloads manage to hit thermal throttling thresholds.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 32 ++++++++++++++-------
>  1 file changed, 21 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/dr=
m/panfrost/panfrost_devfreq.c
> index 4c4e8a30a1ac..fe8ee77c96e4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright 2019 Collabora ltd. */
>  #include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/clk.h>
> @@ -81,8 +82,11 @@ int panfrost_devfreq_init(struct panfrost_device *pfde=
v)
>  	int ret;
>  	struct dev_pm_opp *opp;
>  	unsigned long cur_freq;
> +	struct device *dev =3D &pfdev->pdev->dev;
> +	struct devfreq *devfreq;
> +	struct thermal_cooling_device *cooling;
> =20
> -	ret =3D dev_pm_opp_of_add_table(&pfdev->pdev->dev);
> +	ret =3D dev_pm_opp_of_add_table(dev);
>  	if (ret =3D=3D -ENODEV) /* Optional, continue without devfreq */
>  		return 0;
>  	else if (ret)
> @@ -92,29 +96,35 @@ int panfrost_devfreq_init(struct panfrost_device *pfd=
ev)
> =20
>  	cur_freq =3D clk_get_rate(pfdev->clock);
> =20
> -	opp =3D devfreq_recommended_opp(&pfdev->pdev->dev, &cur_freq, 0);
> +	opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
> =20
>  	panfrost_devfreq_profile.initial_freq =3D cur_freq;
>  	dev_pm_opp_put(opp);
> =20
> -	pfdev->devfreq.devfreq =3D devm_devfreq_add_device(&pfdev->pdev->dev,
> -			&panfrost_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> -			NULL);
> -	if (IS_ERR(pfdev->devfreq.devfreq)) {
> -		DRM_DEV_ERROR(&pfdev->pdev->dev, "Couldn't initialize GPU devfreq\n");
> -		ret =3D PTR_ERR(pfdev->devfreq.devfreq);
> -		pfdev->devfreq.devfreq =3D NULL;
> -		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
> -		return ret;
> +	devfreq =3D devm_devfreq_add_device(dev, &panfrost_devfreq_profile,
> +					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
> +	if (IS_ERR(devfreq)) {
> +		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
> +		dev_pm_opp_of_remove_table(dev);
> +		return PTR_ERR(devfreq);
>  	}
> +	pfdev->devfreq.devfreq =3D devfreq;
> +
> +	cooling =3D of_devfreq_cooling_register(dev->of_node, devfreq);
> +	if (IS_ERR(cooling))
> +		DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> +	else
> +		pfdev->devfreq.cooling =3D cooling;
> =20
>  	return 0;
>  }
> =20
>  void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>  {
> +	if (pfdev->devfreq.cooling)
> +		devfreq_cooling_unregister(pfdev->devfreq.cooling);
>  	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
>  }
> =20
> --=20
> 2.17.1
>=20

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl3mqOAACgkQ/v5QWgr1
WA3Mag/+McdSCrM1Uw+sbIOKo1SnS4HJ1rDMOXoPToi9Q/gLTB4Ysh75238ho0ao
8opJgjB5dwl/JfcwNYgsh6Lk6z0KR7DFVbhq9rAteHJZJht0F3WGJ7Nwy37zrjED
XkZGVhyh9RjmwoNYWwHfOFHwi95SQpNGHQRVb7srYcDwUyu1UBYla/Ko5TVPGtHB
zHz/Vk39SqYVVmp8iMyjWmHdJwRPYXHI/cBfBSnp/tsgNmMmSK/4mQWtscUAqyOB
9KsyYQCjsrDjctZ7WExVP3WNlpnJGjBXgPJfFNWnPaPGiQ3lTPcs4SDVS+B2Flf3
yXZQQhSRFCsZMjOcgEyXqh3CnBI2cV9D9EgoLRLWMNmykaYewwo+3xhNNVhdhNOX
xPohOLRDc8N6XceYtfDqdjUD2DiytP8qBOk8PflQvZWM07gnBfiQrtb2aJmAsxan
a+oRMCqs482W2FnAyjek93YazCqtSTskNBe9cJaMyfn5j2QMJyUByvsjN1WKYahD
gPrngJaD0qZ37VkBL0tgDhRoiX8a5cXsLChcq0Aw0vLYsPWruOWnS3Y/rcxsbFip
QnNBz7J7d4LX05olo13HjgfCB1EWTz0MlyuZxwNeHJuyjyIr3/0+EIn/nWic5Q1Z
FkcyEsn8opKBu6iHoqd9YKZLTJ+2H7OC0hCFrumHIbCJ1Q69BFw=
=kXGT
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============2104234632==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2104234632==--
