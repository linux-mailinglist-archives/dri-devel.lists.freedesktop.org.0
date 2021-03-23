Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7097F345C8E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 12:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C1F6E8B1;
	Tue, 23 Mar 2021 11:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A085F6E8B1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 11:15:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 58D151F45448
Received: by earth.universe (Postfix, from userid 1000)
 id C027B3C0C96; Tue, 23 Mar 2021 12:15:39 +0100 (CET)
Date: Tue, 23 Mar 2021 12:15:39 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [PATCH v2] drm/omap: dsi: Add missing IRQF_ONESHOT
Message-ID: <20210323111539.5wi3ldwfvxvzmio7@earth.universe>
References: <1616492093-68237-1-git-send-email-yang.lee@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1616492093-68237-1-git-send-email-yang.lee@linux.alibaba.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tomba@kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============0125528299=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0125528299==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pg4zoiacfcv4n37f"
Content-Disposition: inline


--pg4zoiacfcv4n37f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 23, 2021 at 05:34:53PM +0800, Yang Li wrote:
> fixed the following coccicheck:
> ./drivers/gpu/drm/omapdrm/dss/dsi.c:4329:7-27: ERROR: Threaded IRQ with
> no primary handler requested without IRQF_ONESHOT
>=20
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Also maybe add this, so that it is properly backported. OTOH old code did
not have IRQF_ONESHOT either.

Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")

-- Sebastian

> Change in v2:
> -Modify the fourth parameter, not the first
>=20
>  drivers/gpu/drm/omapdrm/dss/dsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/=
dss/dsi.c
> index b31d750..5f1722b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
> @@ -4327,7 +4327,8 @@ static int omap_dsi_register_te_irq(struct dsi_data=
 *dsi,
>  	irq_set_status_flags(te_irq, IRQ_NOAUTOEN);
> =20
>  	err =3D request_threaded_irq(te_irq, NULL, omap_dsi_te_irq_handler,
> -				   IRQF_TRIGGER_RISING, "TE", dsi);
> +				   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +				   "TE", dsi);
>  	if (err) {
>  		dev_err(dsi->dev, "request irq failed with %d\n", err);
>  		gpiod_put(dsi->te_gpio);
> --=20
> 1.8.3.1
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--pg4zoiacfcv4n37f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBZzdEACgkQ2O7X88g7
+prDmw//d020afWCghl0znptvXYhWJzyInpZFHBBOXUucLTHrVuptZ1GzfMQmesk
bR/tCHuC1nd55Ge6TETmN+RgYhgnjM7mu9ENOkog6A8157HVsO6jwo0XUkwbl4Qh
vH7qJ+ffhFJ8zsi+jLy7ooh0ki3YhK8lYduv/takXBXgF2GJ0N9TPlyBu71q/caD
4uw6y/1WiuhvZ5Fx+7L5kEKxWJTNAoCQkuaAqsDTFGqrspui+rPkZkwTqdAjda6y
YT/1P14r6Cl4S4IVFun3I2oPWpemHqTtQ05wFIEIHdOPn1e/ptVrQUhLL9INELeq
qjg1SbvSM4kVbaW7mA6wQf3U2G49z8ATDPhqS0DRuAiMTSGjObEIPk99fxR93QSH
hzd4GQu7iYnsxsjp5MYRp5cZb56hcWr+GTrT1kP/1Wygg2dphm3MxZGvVg/8/One
hgxWativFSE2pqkGbftn7CaHTOjQYUU6dwwVmxJuVN+VAQEKiGpOEWNaxXE257Rc
X69lIYE2AJsvhqrxruU6zp6VGMupAc/tFzjh8Fp3HUwYvFVNYq2Xoy/VDESC6DhZ
lYRexXR0H5vt5HKtYylSh8aE4xUc9iR50a0X8dLsZOEuV+jXBLe7RJtVgxg/dJt9
zgdZLy2DW01v4kaSM0a53xYbjoRXaw08PMduMq4U7Wb9zBbtLx4=
=329T
-----END PGP SIGNATURE-----

--pg4zoiacfcv4n37f--

--===============0125528299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0125528299==--
