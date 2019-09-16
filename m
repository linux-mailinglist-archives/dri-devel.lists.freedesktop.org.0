Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 295B6B3BF9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2019 15:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F34E6E97F;
	Mon, 16 Sep 2019 13:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89596E97F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 13:59:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y21so6310425wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 06:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=brJuMc+rs4JR/n8EvqMjQOPBaR33yKuj/pzrCTI3Phg=;
 b=SzjR98ze1OMlJF/BidGOwXuI1SxnUA3dgJi12t1ENfvqfod+sIRuQgJjQr6MmlWjBL
 57w3ciAq/isDNdNZXHWfqvJTkENL9QV2DN+F5ePjQQE62SiO9bIoKZV3haQqAqdr/I3m
 vk+urWoORLWQhavULL3xqDmyPGd8EM3HwdwtpkxFvnPPLH5SkfTTmYewYFuj5aCRHPQA
 o8mvVLwbskR4AxbhDIycfn9wQg9NlKNA0wj/Ejs55QfE7UclAXGgdoXFU74IEm2Ve0qk
 NVZghJ3RfS/Au2eSyYfUUO6oHd1hPVxJwe/iC4yZCIh9R3TVYlIj5tbja4uCeF35XZ9F
 xRvQ==
X-Gm-Message-State: APjAAAXz5uwcNDoxVFGMNHUV5BrCPwbWiZBmuSBpQw2ohv5Pk5Aa+gRY
 Zod8ERxosOkqE7Dt/RObjMg=
X-Google-Smtp-Source: APXvYqxVIYp+hvzl7WxC/wxt/UcHjrMyBHPfulpQ4YAEWW+bPJY5Oeh2WlonpVR6IhQ21M26ELAOCQ==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr587995wmi.151.1568642346427; 
 Mon, 16 Sep 2019 06:59:06 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id e30sm72168031wra.48.2019.09.16.06.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Sep 2019 06:59:05 -0700 (PDT)
Date: Mon, 16 Sep 2019 15:59:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] drm/tegra: switch to using devm_gpiod_get_optional
Message-ID: <20190916135904.GA7488@ulmo>
References: <20190915071323.GA36596@dtor-ws>
MIME-Version: 1.0
In-Reply-To: <20190915071323.GA36596@dtor-ws>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=brJuMc+rs4JR/n8EvqMjQOPBaR33yKuj/pzrCTI3Phg=;
 b=KovzaBM2E9VwackUkkqQWE5qLgCF5tU7k+skHR0jUbAVyKJumE9H9vhn5rc+p1KBKT
 SR93WUXmI/jHhn5Hy04NHVwXE84oAhfPiGA18xCoVgTCTmth5eHUIzYVBfe/WIo9+XXy
 g7oLzZXGRBW9gxhvx3fvVNa5UyG9JoT37rBV/I+wZWL6V7/A4UYiiX+vdpfMmWkM3IOp
 yXDvHKqcUVUwOHke+4OUmLOpaJ+ly1vNvfUcsCGapxhN6gv165FyM3H0Z1fesaQblcIk
 hlueZSZ4ORiWzRf/KMrSd1GQzDhzEr0G9FH/0n8oQY71AOK2m5S5PZhs9l6HM/GPZSMX
 Llrw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: multipart/mixed; boundary="===============0425438675=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0425438675==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2019 at 12:13:23AM -0700, Dmitry Torokhov wrote:
> We do not really need to use API that fetches GPIO data from an
> arbitrary device tree node, as we are dealing with device tree node
> assigned to the device structure. We can easily switch to
> devm_gpiod_get_optional() plus gpiod_set_consumer_name() and clean up
> the code.
>=20
> Note this is part of efforts to get rid of [devm_]gpiod_get_from_of_node
> in drivers so that gpiolib can be cleaned up.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

We can't do that. There's a special case in rgb.c that sets
output->of_node to something different than output->dev, so we actually
need to pass the struct device_node * separately.

Thierry

>=20
> diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/outpu=
t.c
> index bdcaa4c7168c..b4248125b844 100644
> --- a/drivers/gpu/drm/tegra/output.c
> +++ b/drivers/gpu/drm/tegra/output.c
> @@ -121,19 +121,15 @@ int tegra_output_probe(struct tegra_output *output)
>  		of_node_put(ddc);
>  	}
> =20
> -	output->hpd_gpio =3D devm_gpiod_get_from_of_node(output->dev,
> -						       output->of_node,
> -						       "nvidia,hpd-gpio", 0,
> -						       GPIOD_IN,
> -						       "HDMI hotplug detect");
> -	if (IS_ERR(output->hpd_gpio)) {
> -		if (PTR_ERR(output->hpd_gpio) !=3D -ENOENT)
> -			return PTR_ERR(output->hpd_gpio);
> -
> -		output->hpd_gpio =3D NULL;
> -	}
> +	output->hpd_gpio =3D devm_gpiod_get_optional(output->dev,
> +						   "nvidia,hpd", GPIOD_IN);
> +	if (IS_ERR(output->hpd_gpio))
> +		return PTR_ERR(output->hpd_gpio);
> =20
>  	if (output->hpd_gpio) {
> +		gpiod_set_consumer_name(output->hpd_gpio,
> +					"HDMI hotplug detect");
> +
>  		err =3D gpiod_to_irq(output->hpd_gpio);
>  		if (err < 0) {
>  			dev_err(output->dev, "gpiod_to_irq(): %d\n", err);
> --=20
> 2.23.0.237.gc6a4ce50a0-goog
>=20
>=20
> --=20
> Dmitry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1/lScACgkQ3SOs138+
s6GZHg/7BvOAV6GlmzRIMTWPhSZVXASdXGoC7OG5Tj/OolqXcAtfPTXIY2EuWnU8
4WWut1Tu2kEUxYOF220ygFHAYcq534dtEQ7tGb6aT2qo+SCs590ohhj5d0aaNP+p
W4gaGaoWabU6e8H0fGrFRayns+k+EMp4LzwkeAyhgVAXnrWSAU/TgLTuV1BVqJx5
/Cl4qvxRtrC4bXqqVpLTKAeu0uJ1/B/Qx8bqXmtWQO7dFVQvUyTubdhuV+qi3ah4
FkVvjAC1y7ipfeJxAOmh6U+zZE07WU2ig9VTk9rT5C5RQk0y7+VyXmn4jleR7QtC
3/sz688DG286/i0rdcgTTwgDPW4B6GC0jHnK7yX9QXus4GYKMW3Jb44MzpdT8njH
HlQzxuliHLsIHpH0bOhO2KIn/PB9WoTswi0A+5BKMzRlbRRbj+i0JSY0YkshiqIx
V6O6fzEYKGjAWmVBZjQLLotTnxPB+hPNA80w09yw6b4A+kTqyre5nUiMPlrQodB3
4+D33AyTq0J6jVM9vra6PxVL+qoQBDbqPdoZcTC19Hu7vHVQYkM9co3lDu6X8Uzo
NchZUvaY/3s2SK1HvkItxyeOsr0GQDqEo5wRDiayCzqiCcDcBqaYGgMuzag88CRZ
s47dRGofk4wxJOkC0NrwWYcLdZdLWKdECBUOo9FWVJM5Pl842KE=
=2VOz
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

--===============0425438675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0425438675==--
