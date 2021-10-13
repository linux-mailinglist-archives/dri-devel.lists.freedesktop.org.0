Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D781642C649
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 18:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D573B6EA8B;
	Wed, 13 Oct 2021 16:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522D76EA8B;
 Wed, 13 Oct 2021 16:24:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id F2D4C1F43B79
Received: by earth.universe (Postfix, from userid 1000)
 id 339733C0CA8; Wed, 13 Oct 2021 18:24:55 +0200 (CEST)
Date: Wed, 13 Oct 2021 18:24:55 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Stephen Boyd <swboyd@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Saravana Kannan <saravanak@google.com>
Subject: Re: [PATCH v2 28/34] power: supply: ab8500: Migrate to aggregate
 driver
Message-ID: <20211013162455.2srbgmxw6dgoplzo@earth.universe>
References: <20211006193819.2654854-1-swboyd@chromium.org>
 <20211006193819.2654854-29-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5zizh2cyz6jxazcg"
Content-Disposition: inline
In-Reply-To: <20211006193819.2654854-29-swboyd@chromium.org>
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


--5zizh2cyz6jxazcg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

[+cc Linus Walleij (I guess we should add a MAINTAINERS entry for
the ab8500* power-supply drivers)]

On Wed, Oct 06, 2021 at 12:38:13PM -0700, Stephen Boyd wrote:
> Use an aggregate driver instead of component ops so that we can get
> proper driver probe ordering of the aggregate device with respect to all
> the component devices that make up the aggregate device.
>=20
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: <linux-pm@vger.kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---

Acked-by: Sebastian Reichel <sre@kernel.org>

-- Sebastian

>  drivers/power/supply/ab8500_charger.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/power/supply/ab8500_charger.c b/drivers/power/supply=
/ab8500_charger.c
> index 15eadaf46f14..52d4105e28f2 100644
> --- a/drivers/power/supply/ab8500_charger.c
> +++ b/drivers/power/supply/ab8500_charger.c
> @@ -3312,8 +3312,9 @@ static const struct power_supply_desc ab8500_usb_ch=
g_desc =3D {
>  	.get_property	=3D ab8500_charger_usb_get_property,
>  };
> =20
> -static int ab8500_charger_bind(struct device *dev)
> +static int ab8500_charger_bind(struct aggregate_device *adev)
>  {
> +	struct device *dev =3D adev->parent;
>  	struct ab8500_charger *di =3D dev_get_drvdata(dev);
>  	int ch_stat;
>  	int ret;
> @@ -3354,8 +3355,9 @@ static int ab8500_charger_bind(struct device *dev)
>  	return 0;
>  }
> =20
> -static void ab8500_charger_unbind(struct device *dev)
> +static void ab8500_charger_unbind(struct aggregate_device *adev)
>  {
> +	struct device *dev =3D adev->parent;
>  	struct ab8500_charger *di =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> @@ -3380,9 +3382,13 @@ static void ab8500_charger_unbind(struct device *d=
ev)
>  	component_unbind_all(dev, di);
>  }
> =20
> -static const struct component_master_ops ab8500_charger_comp_ops =3D {
> -	.bind =3D ab8500_charger_bind,
> -	.unbind =3D ab8500_charger_unbind,
> +static struct aggregate_driver ab8500_charger_aggregate_driver =3D {
> +	.probe =3D ab8500_charger_bind,
> +	.remove =3D ab8500_charger_unbind,
> +	.driver =3D {
> +		.name =3D "ab8500_charger_agg",
> +		.owner =3D THIS_MODULE,
> +	},
>  };
> =20
>  static struct platform_driver *const ab8500_charger_component_drivers[] =
=3D {
> @@ -3663,9 +3669,7 @@ static int ab8500_charger_probe(struct platform_dev=
ice *pdev)
>  	}
> =20
> =20
> -	ret =3D component_master_add_with_match(&pdev->dev,
> -					      &ab8500_charger_comp_ops,
> -					      match);
> +	ret =3D component_aggregate_register(&pdev->dev, &ab8500_charger_aggreg=
ate_driver, match);
>  	if (ret) {
>  		dev_err(dev, "failed to add component master\n");
>  		goto free_notifier;
> @@ -3688,7 +3692,7 @@ static int ab8500_charger_remove(struct platform_de=
vice *pdev)
>  {
>  	struct ab8500_charger *di =3D platform_get_drvdata(pdev);
> =20
> -	component_master_del(&pdev->dev, &ab8500_charger_comp_ops);
> +	component_aggregate_unregister(&pdev->dev, &ab8500_charger_aggregate_dr=
iver);
> =20
>  	usb_unregister_notifier(di->usb_phy, &di->nb);
>  	usb_put_phy(di->usb_phy);
> --=20
> https://chromeos.dev
>=20

--5zizh2cyz6jxazcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmFnCFcACgkQ2O7X88g7
+poL0g/9HRcH5yucLIwM0Y2DrOctm8HymvKJoN7B93ea2cEtO6LZKjyEhlOl5vtp
75+K607L5FgwhV/GFgrbfZxK3vdQw5CN0srVtZRpXVB05EURul1GLGKlPQEKW1kY
cOzqPLZx6lJtO80OnDuClJSI+uP5MpwRZzXRdjCm63BR3/+rVHM1NY8LY7SCLM9v
Edr812kResYp7WkbtYLwy5z/ddCebtE+t+3Cv31Ber6MVbhHHuM0igQ24FiEVQI8
SIUXFKMMAv1n7eRfWRMJf84ZBOzC7yFxFo4ZwC/saCiePvttjiE64KlG5TLcNjTA
tPd/FWHeM6YVCU+YJ1vqfvh1tW69XpGFxv90eAX+nMIo0znaZir5pykGfDKCP1zL
3uVSiz+KnGdCNwljg8MEBXd2E742pLSwnnr/Sckyk6O4zDbTBul7pTSY6NIy2dZW
+4ahnTtc0qq62+RH1wfbLHsVu04WTxZTMFbpTlQI7EGQsVMzGdx/TAwqbb1cVxjS
9hiZsgvXoP4C58VGLC/3DHcjzEm+O1U/emJRwo3MZ8M0K1bQY36bj3NWnIpDAgY+
hf/FkBbjSesZtBqG81wT85DA/rcDc+8qoEGVTnCt7jQrdyDqmQvKtioZLEhGtB/P
BZOx9e+yo8JHDUlGSwPCZSvl3Uk9jBNIjstThsEjuZU6U+lcx1Q=
=A2IV
-----END PGP SIGNATURE-----

--5zizh2cyz6jxazcg--
