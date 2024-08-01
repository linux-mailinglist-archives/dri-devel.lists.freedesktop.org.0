Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB89944829
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 11:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B61010E038;
	Thu,  1 Aug 2024 09:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WwijGCnH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB67D10E038
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 09:26:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5a156557026so9156844a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722504385; x=1723109185;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g3JZO8ZSFVuF+hnQnOqfsoJXypTyECUCeoc6zZyCuAc=;
 b=WwijGCnHFtJRI9yyNFkJo7Cniz13pC9ko8491SE90X/QRWErA2Hc0fnlKRpnKX7f5y
 mxExXcMYoh6snbWQKy9Y+i+jrxX8f/g6QKRtYkU5YoRCzYM22tf4zYpuWK2pu1oXre3k
 7p+odLAa1WozrhbPFYPM8fOJE6FE+5vQFZZFEW2yEpY1zBIOjUOEg6FHIhngJ8XGzzO9
 vQBIMpvnjLNap+Gppo9p5VxFIsA+JUO3rabvEZ7VUtHtjo6zBOjEKaKSacOxM/r2hsEC
 B2lX5h57JBdHAlYI7BnGTIgFlTT1NzNsU6U1WgzYhser1ix1TeBoNvrZc6d185tgz1P/
 W9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722504385; x=1723109185;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g3JZO8ZSFVuF+hnQnOqfsoJXypTyECUCeoc6zZyCuAc=;
 b=Pd4CRCGQ1D37SBeK91Izh50TpSiB5yyZgNNwOfAAJVaB9VEoPdYbZgWPHWcZX1wM0T
 Lc/xdC4vSAbCcQmaaIAKXryJCjY/KTUVJOzdcnDi3SZtGvG3tv/qjZ7kGYm908fElzBt
 WnAmAHsYvyEUVjJj8pEoRORqKhckvXqbovi3mJl3WiKPfaoIDa4sHd9wadPQBbuB9Ud8
 7CgGlFxJT9SVYadETi2a6CmQvVYzeDLoCnB0+zNuhYgcaRQo6SUsJjHrUkwjrf+Ppaow
 F0JMa/Rwxhu3AUDYL7W8tNZGQFCR4oW3PHHSz2GyCDF9Sg53Ty/3r78MTIXDZ0IoVjWN
 M8Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHAYokfmGXk9HA9365fHZkbpj4/NORWKqT4SOtycPCYJAVhQ6MVXGgdiSeyN1zR7fMzsmIuNZZttgr0qZdHwjF4/w0I8lr32lVxrLBKCNh
X-Gm-Message-State: AOJu0YzpE3XWgZjX1bjgvmF8AWb2G/CVG3+xnrlqsUNIfLGrWloAuR1C
 xcOlcAeycXQZ2g8D4pv/KBRN2qq1DQHR8VD0g+yQZdHyZr1yl/iYVtuBSYFfRcw=
X-Google-Smtp-Source: AGHT+IEVYXao/o41Djqdn17wcaP7RJtqK8n/QFbWtaCDyvUeQykgiFPJr+pTJuMhEJEC6R2BaL6qyg==
X-Received: by 2002:aa7:c74a:0:b0:58b:2d93:ad83 with SMTP id
 4fb4d7f45d1cf-5b6ff2f48d9mr1187110a12.21.1722504384678; 
 Thu, 01 Aug 2024 02:26:24 -0700 (PDT)
Received: from localhost ([193.196.194.3]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac6377d005sm9821822a12.38.2024.08.01.02.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 02:26:24 -0700 (PDT)
Date: Thu, 1 Aug 2024 11:26:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Martin =?utf-8?Q?Kepplinger-Novakovi=C4=87?=
 <martin.kepplinger-novakovic@ginzinger.com>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: pwm_bl: print errno for probe errors
Message-ID: <fjke5js43aqxdxmoau2l275a26o52sq7hyjgzwxnnsrptqlcvs@mohkvblfqkhg>
References: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o3qvcdtm3cmcqg2x"
Content-Disposition: inline
In-Reply-To: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o3qvcdtm3cmcqg2x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Martin,

On Thu, Aug 01, 2024 at 11:12:55AM +0200, Martin Kepplinger-Novakovi=C4=87 =
wrote:
> This makes debugging often easier.
>=20
> Signed-off-by: Martin Kepplinger-Novakovi=C4=87 <martin.kepplinger-novako=
vic@ginzinger.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/p=
wm_bl.c
> index f1005bd0c41e3..cc7e7af71891f 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -502,7 +502,8 @@ static int pwm_backlight_probe(struct platform_device=
 *pdev)
>  						  GPIOD_ASIS);
>  	if (IS_ERR(pb->enable_gpio)) {
>  		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb->enable_gpio),
> -				    "failed to acquire enable GPIO\n");
> +				    "failed to acquire enable GPIO: %ld\n",
> +				    PTR_ERR(pb->enable_gpio));

AFAIK dev_err_probe already emits the error code passed as 2nd
parameter. So I wonder about this patch's benefit.

Best regards
Uwe

--o3qvcdtm3cmcqg2x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmarVLwACgkQj4D7WH0S
/k4/3QgAiFoRKzJukU86K6iZEdrgbKL22xCsLB7W/ia/eBkBsscxYJG42UY3+WR8
j2mf2vRqS3G80eP/KK04dxbGrlsAkM7HubO8KxMMS9CZKz7BwfTOyP93alHUhrZ1
TUdMfceaT+dSkyha+cbucRYgZDW1BEEP9R5vy9+9SSdMZc/CsLMWU92MMA26wcye
t3BbMMvP5CGsnvcoWd8oCk7rdaD2pnbdLEYsR9bVsEr/g6dQooRBPsOoBkX7a1Au
06peYq525VSe9CLNWUFziGB+A31LPaSMzgWu9bdyG/7nxiHhMEwNMdXXT3x4PZtd
ILzQY1JcBlYzwMSNG30jtTNb9exWQg==
=U2oR
-----END PGP SIGNATURE-----

--o3qvcdtm3cmcqg2x--
