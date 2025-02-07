Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15674A2CCD6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 20:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E22910E0E4;
	Fri,  7 Feb 2025 19:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7882010E0E4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 19:42:32 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1tgUEq-0001XR-Nk; Fri, 07 Feb 2025 20:42:08 +0100
Message-ID: <cfc5b39e21fb214c53fda3276847b8e235af818f.camel@pengutronix.de>
Subject: Re: [PATCH v6 08/14] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
From: Lucas Stach <l.stach@pengutronix.de>
To: Damon Ding <damon.ding@rock-chips.com>, heiko@sntech.de
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 rfoss@kernel.org,  vkoul@kernel.org, sebastian.reichel@collabora.com, 
 cristian.ciocaltea@collabora.com, dmitry.baryshkov@linaro.org, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
Date: Fri, 07 Feb 2025 20:42:06 +0100
In-Reply-To: <20250123100747.1841357-9-damon.ding@rock-chips.com>
References: <20250123100747.1841357-1-damon.ding@rock-chips.com>
 <20250123100747.1841357-9-damon.ding@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Damon,

Am Donnerstag, dem 23.01.2025 um 18:07 +0800 schrieb Damon Ding:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The functio=
n
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
>=20
> If failed to get the panel from the DP AUX bus, it will then try the othe=
r
> way to get panel information through the platform bus.
>=20
The changes in this patch effectively revert 86caee745e45
("drm/rockchip: analogix_dp: allow to work without panel"). Please
correct this in the next revision of this patchset.

Regards,
Lucas

> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>=20
> ---
>=20
> Changes in v4:
> - Use done_probing() to call drm_of_find_panel_or_bridge() and
>   component_add() when getting panel from the DP AUX bus
>=20
> Changes in v5:
> - Use the functions exported by the Analogix side to get the pointers of
>   struct analogix_dp_plat_data and struct drm_dp_aux.
> - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
>=20
> Changes in v6:
> - Keep drm_err() in rockchip_dp_poweron()
> - Pass 'dp' in drm_...() rather than 'dp->drm_dev'
> ---
>  .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 37 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gp=
u/drm/rockchip/analogix_dp-rockchip.c
> index 13f32aeea7ca..004b1b68d1cf 100644
> --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> @@ -393,11 +393,27 @@ static const struct component_ops rockchip_dp_compo=
nent_ops =3D {
>  	.unbind =3D rockchip_dp_unbind,
>  };
> =20
> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
> +{
> +	struct analogix_dp_plat_data *plat_data =3D analogix_dp_aux_to_plat_dat=
a(aux);
> +	struct rockchip_dp_device *dp =3D pdata_encoder_to_dp(plat_data);
> +	int ret;
> +
> +	ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat_data-=
>panel, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D component_add(dp->dev, &rockchip_dp_component_ops);
> +	if (ret)
> +		return ret;
> +
> +	return ret;
> +}
> +
>  static int rockchip_dp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	const struct rockchip_dp_chip_data *dp_data;
> -	struct drm_panel *panel =3D NULL;
>  	struct rockchip_dp_device *dp;
>  	struct resource *res;
>  	int i;
> @@ -407,10 +423,6 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>  	if (!dp_data)
>  		return -ENODEV;
> =20
> -	ret =3D drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
> -	if (ret < 0 && ret !=3D -ENODEV)
> -		return ret;
> -
>  	dp =3D devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
>  	if (!dp)
>  		return -ENOMEM;
> @@ -434,7 +446,6 @@ static int rockchip_dp_probe(struct platform_device *=
pdev)
> =20
>  	dp->dev =3D dev;
>  	dp->adp =3D ERR_PTR(-ENODEV);
> -	dp->plat_data.panel =3D panel;
>  	dp->plat_data.dev_type =3D dp->data->chip_type;
>  	dp->plat_data.power_on =3D rockchip_dp_poweron;
>  	dp->plat_data.power_off =3D rockchip_dp_powerdown;
> @@ -450,9 +461,17 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>  	if (IS_ERR(dp->adp))
>  		return PTR_ERR(dp->adp);
> =20
> -	ret =3D component_add(dev, &rockchip_dp_component_ops);
> -	if (ret)
> -		return ret;
> +	ret =3D devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp), rockc=
hip_dp_link_panel);
> +	if (ret) {
> +		if (ret !=3D -ENODEV) {
> +			drm_err(dp, "failed to populate aux bus : %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret =3D rockchip_dp_link_panel(analogix_dp_get_aux(dp->adp));
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	return 0;
>  }

