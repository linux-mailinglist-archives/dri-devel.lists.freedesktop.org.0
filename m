Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6148137A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536836E2B6;
	Mon,  5 Aug 2019 07:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCC66E02C
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 22:28:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id E663828CBBF
Date: Fri, 2 Aug 2019 15:28:14 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 6/8] drm/panfrost: Convert MMU IRQ handler to threaded
 handler
Message-ID: <20190802222814.GA15297@kevin>
References: <20190802195150.23207-1-robh@kernel.org>
 <20190802195150.23207-7-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190802195150.23207-7-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: multipart/mixed; boundary="===============0610590211=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0610590211==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GvXjxJ+pjyke8COw"
Content-Disposition: inline


--GvXjxJ+pjyke8COw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

A-b, I think.

On Fri, Aug 02, 2019 at 01:51:48PM -0600, Rob Herring wrote:
> In preparation to handle mapping of page faults, we need the MMU handler
> to be threaded as code paths take a mutex.
>=20
> As the IRQ may be shared, we can't use the default handler and must
> disable the MMU interrupts locally.
>=20
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/gpu/drm/panfrost/panfrost_mmu.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index eba6ce785ef0..7d44328b280f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -300,12 +300,20 @@ static const char *access_type_name(struct panfrost=
_device *pfdev,
>  static irqreturn_t panfrost_mmu_irq_handler(int irq, void *data)
>  {
>  	struct panfrost_device *pfdev =3D data;
> -	u32 status =3D mmu_read(pfdev, MMU_INT_STAT);
> -	int i;
> =20
> -	if (!status)
> +	if (!mmu_read(pfdev, MMU_INT_STAT))
>  		return IRQ_NONE;
> =20
> +	mmu_write(pfdev, MMU_INT_MASK, 0);
> +	return IRQ_WAKE_THREAD;
> +}
> +
> +static irqreturn_t panfrost_mmu_irq_handler_thread(int irq, void *data)
> +{
> +	struct panfrost_device *pfdev =3D data;
> +	u32 status =3D mmu_read(pfdev, MMU_INT_RAWSTAT);
> +	int i;
> +
>  	dev_err(pfdev->dev, "mmu irq status=3D%x\n", status);
> =20
>  	for (i =3D 0; status; i++) {
> @@ -350,6 +358,7 @@ static irqreturn_t panfrost_mmu_irq_handler(int irq, =
void *data)
>  		status &=3D ~mask;
>  	}
> =20
> +	mmu_write(pfdev, MMU_INT_MASK, ~0);
>  	return IRQ_HANDLED;
>  };
> =20
> @@ -368,8 +377,9 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  	if (irq <=3D 0)
>  		return -ENODEV;
> =20
> -	err =3D devm_request_irq(pfdev->dev, irq, panfrost_mmu_irq_handler,
> -			       IRQF_SHARED, "mmu", pfdev);
> +	err =3D devm_request_threaded_irq(pfdev->dev, irq, panfrost_mmu_irq_han=
dler,
> +					panfrost_mmu_irq_handler_thread,
> +					IRQF_SHARED, "mmu", pfdev);
> =20
>  	if (err) {
>  		dev_err(pfdev->dev, "failed to request mmu irq");
> --=20
> 2.20.1
>=20

--GvXjxJ+pjyke8COw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1EuPgACgkQ/v5QWgr1
WA3JQA//ZvG4umlxsWJSxAhWOJTMWFJp69dvE/pOZ7vKsd4l9pUfkEDJuWW3kEQ7
QgriRPEfWL1ihLpgqRYRYne6Akj0qu4gwR8aiNMBmCV2zs10cDxOBIS2JcFWB/HW
aY+LBxpcy7zmniphTNiA3v7LlvKW2KFiB0CnxXtl0oYllDTNxoiYDEnOvXTycADN
4YXMKRv0AHCGvTXmF+pZCiRwA+kBBUN0GUrDqeKx+TFdij+9OTMTb6YrL3wILWu0
eTcUYS12K/KxARGf8VBpIFGHaQpEZ107tIlaDjtfotkTJhw2jCKR0j5T5wsN2Odk
EUgc169ju/Kx+LxkFRqxX/wIeIwJoVS4Rq7GWUenDqb7TZm1jEfusXdLfblYyMqC
RbeKFyDUTBYjCH9lVSt4hcp1f/ShpubXbY+eAPIN06MoqDTuoLzNvLb+ZOijuGC4
meuNGFlQD6cMMkwpydMiaJ5ncy760GGIwy4M7/XbfaPi92JpuzgeTjcUyEx3SQl3
MbfnlkbbCmQ8X7T4IJrUNRzm89AN6rtSrO1dCC/AqEFZMv5Pb1ptAr8AL9DVoZrV
dPcMV56efMgtMDOIlPCTbELO5v5mIAgIYpo7w1etnV+/wrq1HEkv+z6Skis1eD3B
llbY+APbYJ10yIIuY0NxNKmW/3BHHx0XFp4wKDSd2FRRzP5S008=
=EP+m
-----END PGP SIGNATURE-----

--GvXjxJ+pjyke8COw--

--===============0610590211==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0610590211==--
