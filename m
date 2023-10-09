Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1737BD6CA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6B710E24B;
	Mon,  9 Oct 2023 09:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9F010E24B
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:23:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 90B1F60FAF;
 Mon,  9 Oct 2023 09:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B8A5C433CB;
 Mon,  9 Oct 2023 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696843389;
 bh=MOixYtjgC+jFK+ozB2lXZyQEyZ01mgvzgxPkOoCRIiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WmNnDvcpgacm8aiHUdsrPgE+ku4g9by7BPLUpUtnAX8gpu7wVnHwNKdv2xfjFAX7A
 hxJC0kFFNL1iFx9kSn1yLQ8X5df+dwInqg3yejydjK2Okrb2BnD0xhVxYDgPf1vZUh
 KU4q8quKCa9f8kXQtvmIc2qYwU59R4fDKbxI8yb20DbU43f4sCVz+1NeBcolGRPucW
 5abtooqX1OSfq+XNlun14gG2rrcKYRbTH4WicZ/ISdZ4JUTa5lfMplFkJegyBQGlDx
 dHzXT6hkCpukNLi8s9SPlx9ZyZcB6mrESuKL6jfxRfTaqvVVSp5h7UxXd919wwXPt/
 nTOA8kSLIt0tA==
Date: Mon, 9 Oct 2023 11:23:06 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Subject: Re: [PATCH] drm/tidss: Power up attached PM domains on probe
Message-ID: <bmemgnq3emddmjsho3c3h4cj2fyyyp3xll73ozpsxxmxxcr3bn@lffrmuqqpbl3>
References: <20231009075018.2836020-1-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mrqzgt3fldn3kjr2"
Content-Disposition: inline
In-Reply-To: <20231009075018.2836020-1-devarsht@ti.com>
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
Cc: nm@ti.com, j-choudhary@ti.com, j-luthra@ti.com, a-bhatia1@ti.com,
 praneeth@ti.com, tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, r-ravikumar@ti.com, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mrqzgt3fldn3kjr2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Devarsh,

On Mon, Oct 09, 2023 at 01:20:18PM +0530, Devarsh Thakkar wrote:
> Some SoC's such as AM62P have dedicated power domains
> for OLDI which need to be powered on separetely along
> with display controller.
>=20
> So during driver probe, power up all attached PM domains
> enumerated in devicetree node for DSS.
>=20
> This also prepares base to add display support for AM62P.
>=20
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_drv.c | 76 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/tidss/tidss_drv.h |  5 ++
>  2 files changed, 81 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/ti=
dss_drv.c
> index 4d063eb9cd0b..a703a27d17bf 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -8,6 +8,7 @@
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
> =20
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -114,6 +115,72 @@ static const struct drm_driver tidss_driver =3D {
>  	.minor			=3D 0,
>  };
> =20
> +static int tidss_detach_pm_domains(struct tidss_device *tidss)
> +{
> +	int i;
> +
> +	if (tidss->num_domains <=3D 1)
> +		return 0;
> +
> +	for (i =3D 0; i < tidss->num_domains; i++) {
> +		if (tidss->pd_link[i] && !IS_ERR(tidss->pd_link[i]))
> +			device_link_del(tidss->pd_link[i]);
> +		if (tidss->pd_dev[i] && !IS_ERR(tidss->pd_dev[i]))
> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
> +		tidss->pd_dev[i] =3D NULL;
> +		tidss->pd_link[i] =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
> +{
> +	struct device *dev =3D tidss->dev;
> +	int i;
> +	int ret;
> +	struct platform_device *pdev =3D to_platform_device(dev);
> +	struct device_node *np =3D pdev->dev.of_node;
> +
> +	tidss->num_domains =3D of_count_phandle_with_args(np, "power-domains",
> +							"#power-domain-cells");
> +	if (tidss->num_domains <=3D 1) {
> +		dev_dbg(dev, "One or less power domains, no need to do attach domains\=
n");
> +		return 0;
> +	}
> +
> +	tidss->pd_dev =3D devm_kmalloc_array(dev, tidss->num_domains,
> +					   sizeof(*tidss->pd_dev), GFP_KERNEL);
> +	if (!tidss->pd_dev)
> +		return -ENOMEM;
> +
> +	tidss->pd_link =3D devm_kmalloc_array(dev, tidss->num_domains,
> +					    sizeof(*tidss->pd_link), GFP_KERNEL);
> +	if (!tidss->pd_link)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < tidss->num_domains; i++) {
> +		tidss->pd_dev[i] =3D dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(tidss->pd_dev[i])) {
> +			ret =3D PTR_ERR(tidss->pd_dev[i]);
> +			goto fail;
> +		}
> +
> +		tidss->pd_link[i] =3D device_link_add(dev, tidss->pd_dev[i],
> +						    DL_FLAG_STATELESS |
> +						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +		if (!tidss->pd_link[i]) {
> +			ret =3D -EINVAL;
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +fail:
> +	tidss_detach_pm_domains(tidss);
> +	return ret;
> +}

My understanding is that this will be done automatically at probe time.
Why do we need to roll our own there? A comment on top of the function
and the commit log would help.

Thanks!
Maxime

--mrqzgt3fldn3kjr2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZSPGegAKCRDj7w1vZxhR
xQblAQDdpRuB3koCfhA6yeFq9+OCkuzwb/iHURYBnN1uENA07AEA25uctX3wDw0u
/YjPlDpuhGFxweCfFLXH1VeE5ht1NAQ=
=p9/r
-----END PGP SIGNATURE-----

--mrqzgt3fldn3kjr2--
