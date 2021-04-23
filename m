Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB3F369179
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 13:48:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBB96E0D7;
	Fri, 23 Apr 2021 11:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB16E0D7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 11:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 760D86144D;
 Fri, 23 Apr 2021 11:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619178484;
 bh=Nso+Npc+3ue078XmTC6Z8rq554dlaIy0y0IZvc0L4j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgrhGeDWQKDwDgzc0U2oo8W0xIXto5ga2sHax46ojxl9XfDadv1hoilzWHf31hy/a
 xkLmuksSJ6XrwYcyuOD+SYMirF10GO5vlvm+G2rHAL8fxhtkeCT3ImmsMb3r5zvxdD
 nOUOF+LBuBWBOcU090MKOwS7kzhDWv0RhtXAHX5o6Mq3rTirfpRN3SR1Un7PcTHhh5
 yEH9o7OrhS/2Vq5OcKQr7OnUf8hwHB0yRF5OZnxMA/+IOUAYiczj+9hHoPFIDB9Yrw
 Yyu5mubFhx9y3GNT5UuG7CGYpYGvskajIn9kq6gybJuO48AqDQYFNNIL8ErFXsz+Sa
 W0R4winzEm41w==
Date: Fri, 23 Apr 2021 12:47:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Artem Lapkin <email2tema@gmail.com>
Subject: Re: [PATCH] SPI: meson-spifc add missed calls to remove function
Message-ID: <20210423114735.GA5507@sirena.org.uk>
References: <20210423034247.992052-1-art@khadas.com>
MIME-Version: 1.0
In-Reply-To: <20210423034247.992052-1-art@khadas.com>
X-Cookie: This is now.  Later is later.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: gouwa@khadas.com, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: multipart/mixed; boundary="===============0360869110=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0360869110==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline


--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 11:42:47AM +0800, Artem Lapkin wrote:
> Problem: rmmod meson_gx_mmc - not stable without spi_master_suspend call
> and we can get stuck when try unload this module

> +++ b/drivers/spi/spi-meson-spifc.c
> @@ -359,6 +359,7 @@ static int meson_spifc_remove(struct platform_device =
*pdev)
>  	struct spi_master *master =3D platform_get_drvdata(pdev);
>  	struct meson_spifc *spifc =3D spi_master_get_devdata(master);
> =20
> +	spi_master_suspend(master);
>  	pm_runtime_get_sync(&pdev->dev);
>  	clk_disable_unprepare(spifc->clk);
>  	pm_runtime_disable(&pdev->dev);

I would expect the driver to unregister the controller at the start of
the remove function, suspend doesn't really make sense here.

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCCs9YACgkQJNaLcl1U
h9AxQgf+NlVIXfo4DOWLGzUTZV9JpnM/W5ePWMfS5eiwLH2U4IkyBKd4pMwv590c
P2VHkZMC+XNYg+5Awbqpx8ayhuD4qbKspg+px/r6HrJ0pdXL6hIKfQ5nx3yWn41w
TSkY44nLWNKrKMWJo3moixzryzv+vVAXkaNYpNi5gRijEZnpLE4LbZihh0d6bIja
uSKmBE0Q9KuXo83ENaVGjPofkSVrdHovWQb4cC7NnKqi6JX0/9ZqYEMX7FAxgh0p
3ewJqVtXwbfapK2FwhufuRpwaMKN7cCMqqf0GAdLIDZ+jp4p2NsWjv9syeaQ6R5U
yjmI4PA1Le3oAZFmU6ZMcsDP68YaLw==
=AYVf
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--

--===============0360869110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0360869110==--
