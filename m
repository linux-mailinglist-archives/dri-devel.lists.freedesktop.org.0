Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D0E7AD278
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1297310E162;
	Mon, 25 Sep 2023 07:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE9710E162
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 07:57:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6EA8A60F30;
 Mon, 25 Sep 2023 07:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C156DC433C8;
 Mon, 25 Sep 2023 07:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695628645;
 bh=HkPITqCUb1Czlevgk15gK4oCE9WQFlhAe65KZC8dU7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fh2cBKHBZyorPsXFi8kRXGRJZsZO8Nf52Wm5fGOcXU8NiiUugNaw9IAW6VQZKm5Ne
 //OK/F80mvk8J+1ymR0nR7Wa0EJNTHEnwoHk573bekl2ChFAX4O/4J+kZooybPtZNL
 ZTiBvESRWQD8YPF2UhHOy7Xx4OlSt1JiyUfJUynMV5hl1KZ81ROCjF+G6CizUqBOBo
 kP5TT6jsf8YFiKWWfZRQMQ8t4qVEFh3DtcPrhHztpTIpWGM5DZD1zmCh68JHGCyPMf
 uxFRXskcLCDawcki9Ii3cdlIyVtj+5lx+xY2tgmsOcWnwqW2Oa1aCN0nksN9gTJ6f3
 026uw4aA2EXTA==
Date: Mon, 25 Sep 2023 09:57:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/7] drm/sun4i: dw-hdmi: Switch to bridge functions
Message-ID: <vdwkqq3jovlgr6xrprq4mpqv6ldkcklf2v5ffbcetgifwrnatu@4jfjk3f5qbnu>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-4-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y3n3vwdwwkbm5yhj"
Content-Disposition: inline
In-Reply-To: <20230924192604.3262187-4-jernej.skrabec@gmail.com>
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
Cc: samuel@sholland.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, wens@csie.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y3n3vwdwwkbm5yhj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Sep 24, 2023 at 09:26:00PM +0200, Jernej Skrabec wrote:
> Since ddc-en property handling was moved from sun8i dw-hdmi driver to
> display connector driver, probe order of drivers determines if EDID is
> properly read at boot time or not.
>=20
> In order to fix this, let's switch to bridge functions which allows us
> to build proper chain and defer execution until all drivers are probed.
>=20
> Fixes: 920169041baa ("drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer confli=
ct")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 114 +++++++++++++++++++++++++-
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |   5 ++
>  2 files changed, 117 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4=
i/sun8i_dw_hdmi.c
> index 8f8d3bdba5ce..93831cdf1917 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -8,14 +8,82 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> =20
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_simple_kms_helper.h>
> =20
> +#include <media/cec-notifier.h>
> +
>  #include "sun8i_dw_hdmi.h"
>  #include "sun8i_tcon_top.h"
> =20
> +#define bridge_to_sun8i_dw_hdmi(x) \
> +	container_of(x, struct sun8i_dw_hdmi, enc_bridge)
> +
> +static int sun8i_hdmi_enc_attach(struct drm_bridge *bridge,
> +				 enum drm_bridge_attach_flags flags)
> +{
> +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> +
> +	return drm_bridge_attach(&hdmi->encoder, hdmi->hdmi_bridge,
> +				 &hdmi->enc_bridge, flags);
> +}
> +
> +static void sun8i_hdmi_enc_detach(struct drm_bridge *bridge)
> +{
> +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> +
> +	cec_notifier_conn_unregister(hdmi->cec_notifier);
> +	hdmi->cec_notifier =3D NULL;
> +}
> +
> +static void sun8i_hdmi_enc_hpd_notify(struct drm_bridge *bridge,
> +				      enum drm_connector_status status)
> +{
> +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> +	struct edid *edid;
> +
> +	if (!hdmi->cec_notifier)
> +		return;
> +
> +	if (status =3D=3D connector_status_connected) {
> +		edid =3D drm_bridge_get_edid(hdmi->hdmi_bridge, hdmi->connector);
> +		if (edid)
> +			cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier,
> +							     edid);
> +	} else {
> +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> +	}
> +}
> +
> +static int sun8i_hdmi_enc_atomic_check(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state)
> +{
> +	struct drm_connector_state *old_conn_state =3D
> +		drm_atomic_get_old_connector_state(conn_state->state,
> +						   conn_state->connector);
> +
> +	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_state=
))
> +		crtc_state->mode_changed =3D true;
> +
> +	return 0;
> +}
> +
> +static const struct drm_bridge_funcs sun8i_hdmi_enc_bridge_funcs =3D {
> +	.attach =3D sun8i_hdmi_enc_attach,
> +	.detach =3D sun8i_hdmi_enc_detach,
> +	.hpd_notify =3D sun8i_hdmi_enc_hpd_notify,
> +	.atomic_check =3D sun8i_hdmi_enc_atomic_check,
> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> +};
> +
>  static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encoder,
>  					   struct drm_display_mode *mode,
>  					   struct drm_display_mode *adj_mode)
> @@ -99,6 +167,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, stru=
ct device *master,
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct dw_hdmi_plat_data *plat_data;
> +	struct cec_connector_info conn_info;
> +	struct drm_connector *connector;
>  	struct drm_device *drm =3D data;
>  	struct device_node *phy_node;
>  	struct drm_encoder *encoder;
> @@ -187,18 +257,57 @@ static int sun8i_dw_hdmi_bind(struct device *dev, s=
truct device *master,
> =20
>  	plat_data->mode_valid =3D hdmi->quirks->mode_valid;
>  	plat_data->use_drm_infoframe =3D hdmi->quirks->use_drm_infoframe;
> +	plat_data->output_port =3D 1;
>  	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
> =20
>  	platform_set_drvdata(pdev, hdmi);
> =20
> -	hdmi->hdmi =3D dw_hdmi_bind(pdev, encoder, plat_data);
> +	hdmi->hdmi =3D dw_hdmi_probe(pdev, plat_data);
>  	if (IS_ERR(hdmi->hdmi)) {
>  		ret =3D PTR_ERR(hdmi->hdmi);
>  		goto err_deinit_phy;
>  	}
> =20
> +	hdmi->hdmi_bridge =3D of_drm_find_bridge(dev->of_node);

So you're also adding child bridge support? This should be mentioned in
the commit log.

> +	hdmi->enc_bridge.funcs =3D &sun8i_hdmi_enc_bridge_funcs;
> +	hdmi->enc_bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> +	hdmi->enc_bridge.interlace_allowed =3D true;
> +
> +	drm_bridge_add(&hdmi->enc_bridge);
> +
> +	ret =3D drm_bridge_attach(encoder, &hdmi->enc_bridge, NULL,
> +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		goto err_remove_dw_hdmi;
> +
> +	connector =3D drm_bridge_connector_init(drm, encoder);
> +	if (IS_ERR(connector)) {
> +		dev_err(dev, "Unable to create HDMI bridge connector\n");
> +		ret =3D PTR_ERR(connector);
> +		goto err_remove_dw_hdmi;
> +	}
> +
> +	hdmi->connector =3D connector;
> +	drm_connector_attach_encoder(connector, encoder);
> +
> +	if (hdmi->quirks->use_drm_infoframe)
> +		drm_connector_attach_hdr_output_metadata_property(connector);
> +
> +	cec_fill_conn_info_from_drm(&conn_info, connector);
> +
> +	hdmi->cec_notifier =3D cec_notifier_conn_register(&pdev->dev, NULL,
> +							&conn_info);
> +	if (!hdmi->cec_notifier) {
> +		ret =3D -ENOMEM;
> +		goto err_remove_dw_hdmi;
> +	}
> +
>  	return 0;

Yeah, I'm not sure. We now have two different yet redundant set of
operations with no clear definition wrt what belongs where. I'm really
not impressed with the use of bridges for things that are clearly not
bridges.

The "nothing happens until all drivers are loaded" argument is also
supposed to be covered by the component framework, so why do we even
have to use a bridge here?

You were saying that it's an issue of probe order going wrong, could you
explain a bit more what goes wrong so we can try to figure something out
that doesn't involve a bridge?

Maxime

--y3n3vwdwwkbm5yhj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZRE9YgAKCRDj7w1vZxhR
xQRbAPoCVmFYOgCWSKKM1QA1uixJ8CwC0IMEWdKHGkkEkyfoBwEAvzO4u0+pqk8B
u9fSQ57aRZyCmgLCdKL5omUzvgY4+gk=
=sCuA
-----END PGP SIGNATURE-----

--y3n3vwdwwkbm5yhj--
