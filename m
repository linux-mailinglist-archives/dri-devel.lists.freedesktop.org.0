Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DE61E59CB
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7226E4E6;
	Thu, 28 May 2020 07:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA6B6E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 20:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id 299B22A3C1D
Date: Wed, 27 May 2020 16:43:34 -0400
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3] drm/panfrost: Reduce the amount of logs on deferred
 probe
Message-ID: <20200527204334.GA15485@kevin>
References: <20200527200544.7849-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200527200544.7849-1-krzk@kernel.org>
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:53 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>
Content-Type: multipart/mixed; boundary="===============2079111568=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2079111568==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Content-Disposition: inline


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

On Wed, May 27, 2020 at 10:05:44PM +0200, Krzysztof Kozlowski wrote:
> There is no point to print deferred probe (and its failures to get
> resources) as an error.  Also there is no need to print regulator errors
> twice.
>=20
> In case of multiple probe tries this would pollute the dmesg.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Steven Price <steven.price@arm.com>
>=20
> ---
>=20
> Changes since v2:
> 1. Rebase
> 2. Add Steven's review
>=20
> Changes since v1:
> 1. Remove second error message from calling panfrost_regulator_init()
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 8136babd3ba9..b172087eee6a 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -101,7 +101,9 @@ static int panfrost_regulator_init(struct panfrost_de=
vice *pfdev)
>  				      pfdev->comp->num_supplies,
>  				      pfdev->regulators);
>  	if (ret < 0) {
> -		dev_err(pfdev->dev, "failed to get regulators: %d\n", ret);
> +		if (ret !=3D -EPROBE_DEFER)
> +			dev_err(pfdev->dev, "failed to get regulators: %d\n",
> +				ret);
>  		return ret;
>  	}
> =20
> @@ -213,10 +215,8 @@ int panfrost_device_init(struct panfrost_device *pfd=
ev)
>  	}
> =20
>  	err =3D panfrost_regulator_init(pfdev);
> -	if (err) {
> -		dev_err(pfdev->dev, "regulator init failed %d\n", err);
> +	if (err)
>  		goto err_out0;
> -	}
> =20
>  	err =3D panfrost_reset_init(pfdev);
>  	if (err) {
> --=20
> 2.17.1
>=20

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl7O0O8ACgkQ/v5QWgr1
WA3p3g/8DCZyn9SS5HpC/u7NXQd7gR9kT/h96A3UERjq1qb+BOg/Cll9aB/GzZ9v
c6ux7qhSOwGhHXRhrcM3ar/9XPZBasjIgMPdsu0To1G00Yl78LtYoM8csLjIQB7k
zGa3QHQj/m1G3/jCBNrBqiDLsBPsAI5wQEHrmDTakp6xW2qFsa8yy54+7rgbHmm0
oBefDrKUqukbBsaoiL/p1R1M3gTeTMinUy1/Ec2MMR7Vn/1ySpzGAQ7tgD04qnB4
uSgLcWGZHNSMKWiAjclsJLOgL1HpSFwXFzlWCe9bwdzoCroldKHC3vkhazzewpG9
q3MhbyDE4AhSl4v8sEieJvvAOpCQ9VtMLk/+a9COMDfQ0gYWnvzgFHcOrVJvyS8P
aQ2URoHkH0KRL6VRBwiSLi9IqUqMmR66GrCIG+69OfR1dMDaFyHCGBhM8yyUWBhh
AmVNnwUyaFJoUGx24o6HqlCY0M/f1PPeLh8o6wO+zfWWL8N4Sdp2D7XMSkYiNK5U
ZPWdFBCfY1KUENlco7k/AB6xMy6bpq7YSQkzwpHN5i7dTBmLi2MBGV7E8sm0QUdh
0UFCt7Qf9qHqP3uhHcZ+PGovkd2/5FA9lNFzVLLd52NYdsRognfHN4MfC/5JESx6
dv1aaqHmOKVck/eiA03/nW0l1Yjz9ScvVDz1p4x0Z47B6l17HrI=
=srst
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--

--===============2079111568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2079111568==--
