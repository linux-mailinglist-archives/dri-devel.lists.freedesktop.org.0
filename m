Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CDE559B98
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 16:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F44010E076;
	Fri, 24 Jun 2022 14:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8748A10E1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:35:30 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B1ECC2000A;
 Fri, 24 Jun 2022 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656081326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=19T0/4IPPW1GQWI31VpPxCmK00qIsCKpQrmNNviZXf8=;
 b=epq+BuYnxlAKsTU/Ce94aJ1lSbVtGjNy0FuSDoSsFQooJpdVjQuH2hQnsiEernff1IrM8V
 5zjEs8L9RGNMp1webmA82qcYjxm4/yGVdXOZt0tvo0hWd1GobIO62N5hxUK2mHOyJK6C+q
 +pmEPCGD1S+sZkktRQbgNKxRlhlMGy3toKVH05+94v7Lwwdgt48SF5COtbhnDi2ytDRT1O
 GgfLTRaa3E7w44hHeQ4cYkGHT2Yv8s4okbzzGI9yXtuD5zJaaj6K6BlW/aDboL7njDZXjq
 pQ/u/gJIQu0HdXQ/0E0Q9Q93R4n5FipkM2Rq2LZML1Xv49Mr257OBj4V8pzQTA==
Date: Fri, 24 Jun 2022 16:35:25 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: logicvc: Fix uninitialized variable in probe
Message-ID: <YrXLrVUIavGWC4sx@aptenodytes>
References: <Yqh6OfSiPFuVrGo4@kili>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DwiraIsIEPc2Ikp+"
Content-Disposition: inline
In-Reply-To: <Yqh6OfSiPFuVrGo4@kili>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--DwiraIsIEPc2Ikp+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Tue 14 Jun 22, 15:08, Dan Carpenter wrote:
> The "regmap" is supposed to be initialized to NULL but it's used
> without being initialized.
>=20
> Fixes: efeeaefe9be5 ("drm: Add support for the LogiCVC display controller=
")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, thanks a lot!

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logi=
cvc/logicvc_drm.c
> index df1805cf0f95..0b983a33f9ff 100644
> --- a/drivers/gpu/drm/logicvc/logicvc_drm.c
> +++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
> @@ -298,7 +298,7 @@ static int logicvc_drm_probe(struct platform_device *=
pdev)
>  	struct logicvc_drm *logicvc;
>  	struct device *dev =3D &pdev->dev;
>  	struct drm_device *drm_dev;
> -	struct regmap *regmap;
> +	struct regmap *regmap =3D NULL;
>  	struct resource res;
>  	void __iomem *base;
>  	int irq;
> --=20
> 2.35.1
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--DwiraIsIEPc2Ikp+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK1y60ACgkQ3cLmz3+f
v9F7Kwf/QJpFMndulFNyA2x3mb7KHVGg3dQKG+3a7CvlFT2m+N0OUW6HcXSkmz+x
Z7Ccffbm4Lb2E+gQucPwwPDReZieX4IrVhiHQfoc5IRTq5916CRouPxGGmzzq5KS
pUYjhWq9PNNNU+oDiZ6k04H2ozX8T8fABH7/U2ZBeRZ0oocBXMZL2hXnvNbLou4C
1dPE5D/rMZ7qGKkFi7Oks5c1IWz3Sx9ieku6ZH+AGbq7yr5ILxt5zfIuEH02NPZ9
DpaVENSmpOccaOZcM00rIbUFwVpLptmV56Woar15J9NZBcgewR2j655GQk/M1jG9
hMSQofNJAMMQRLPA3S7vgd8+lnQTrA==
=Ojhr
-----END PGP SIGNATURE-----

--DwiraIsIEPc2Ikp+--
