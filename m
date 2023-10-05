Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 347247B9BDD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 10:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8466810E3D4;
	Thu,  5 Oct 2023 08:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B157410E3D4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 08:42:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 2CACCB82326;
 Thu,  5 Oct 2023 08:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB56C116AC;
 Thu,  5 Oct 2023 08:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696495328;
 bh=x5IOVXPxMwybYtsBnKXuwMU/ZSmvGv/1mnzztlkd9p0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ozlwv5kbPEY45CJJVLC77jrlKc8fbfZEZKBEkrq5msnlA87Neteu7W7XeKpiPFnsw
 LbqAkgMp1W9aDAmfBU/rhIiY6eK25H9Gm4FBU71Saf8WT92mCxCBYp+LcOdVeydagV
 uaR2a817qqDpkbNmV6Atvv83qYFuvigYu0V951KF49k0IWEIJGGBqpmlqD8bqYOtQk
 zoVi7zEpybzqKClRn9WLv5q9S8J4AZkDgwMCYWuvy91NE7km7MxieWr8oEPZBu6oZo
 RYDPaZp0K1emwxk6WUaevLtc9Dm7S08Ovei+dY54v5HNxzOC5g5DUCaGK88nyKJ2Wl
 UyrC6bJISY30g==
Date: Thu, 5 Oct 2023 10:42:05 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 3/7] drm/sun4i: dw-hdmi: Switch to bridge functions
Message-ID: <4gqwvecxjjlp32b3d5462b3fm33uppugwnm6nsyeprehj2bmbp@gcfierczq5av>
References: <20230924192604.3262187-1-jernej.skrabec@gmail.com>
 <20230924192604.3262187-4-jernej.skrabec@gmail.com>
 <vdwkqq3jovlgr6xrprq4mpqv6ldkcklf2v5ffbcetgifwrnatu@4jfjk3f5qbnu>
 <2167865.Icojqenx9y@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="k7k7qikbqnwcrqty"
Content-Disposition: inline
In-Reply-To: <2167865.Icojqenx9y@jernej-laptop>
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


--k7k7qikbqnwcrqty
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 05:29:20PM +0200, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 25. september 2023 ob 09:57:22 CEST je Maxime Ripard napi=
sal(a):
> > On Sun, Sep 24, 2023 at 09:26:00PM +0200, Jernej Skrabec wrote:
> > > Since ddc-en property handling was moved from sun8i dw-hdmi driver to
> > > display connector driver, probe order of drivers determines if EDID is
> > > properly read at boot time or not.
> > >=20
> > > In order to fix this, let's switch to bridge functions which allows us
> > > to build proper chain and defer execution until all drivers are probe=
d.
> > >=20
> > > Fixes: 920169041baa ("drm/sun4i: dw-hdmi: Fix ddc-en GPIO consumer co=
nflict")
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > ---
> > >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 114 ++++++++++++++++++++++++=
+-
> > >  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h |   5 ++
> > >  2 files changed, 117 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/=
sun4i/sun8i_dw_hdmi.c
> > > index 8f8d3bdba5ce..93831cdf1917 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> > > @@ -8,14 +8,82 @@
> > >  #include <linux/of.h>
> > >  #include <linux/platform_device.h>
> > > =20
> > > +#include <drm/drm_atomic_state_helper.h>
> > > +#include <drm/drm_bridge_connector.h>
> > >  #include <drm/drm_managed.h>
> > >  #include <drm/drm_modeset_helper_vtables.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_simple_kms_helper.h>
> > > =20
> > > +#include <media/cec-notifier.h>
> > > +
> > >  #include "sun8i_dw_hdmi.h"
> > >  #include "sun8i_tcon_top.h"
> > > =20
> > > +#define bridge_to_sun8i_dw_hdmi(x) \
> > > +	container_of(x, struct sun8i_dw_hdmi, enc_bridge)
> > > +
> > > +static int sun8i_hdmi_enc_attach(struct drm_bridge *bridge,
> > > +				 enum drm_bridge_attach_flags flags)
> > > +{
> > > +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> > > +
> > > +	return drm_bridge_attach(&hdmi->encoder, hdmi->hdmi_bridge,
> > > +				 &hdmi->enc_bridge, flags);
> > > +}
> > > +
> > > +static void sun8i_hdmi_enc_detach(struct drm_bridge *bridge)
> > > +{
> > > +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> > > +
> > > +	cec_notifier_conn_unregister(hdmi->cec_notifier);
> > > +	hdmi->cec_notifier =3D NULL;
> > > +}
> > > +
> > > +static void sun8i_hdmi_enc_hpd_notify(struct drm_bridge *bridge,
> > > +				      enum drm_connector_status status)
> > > +{
> > > +	struct sun8i_dw_hdmi *hdmi =3D bridge_to_sun8i_dw_hdmi(bridge);
> > > +	struct edid *edid;
> > > +
> > > +	if (!hdmi->cec_notifier)
> > > +		return;
> > > +
> > > +	if (status =3D=3D connector_status_connected) {
> > > +		edid =3D drm_bridge_get_edid(hdmi->hdmi_bridge, hdmi->connector);
> > > +		if (edid)
> > > +			cec_notifier_set_phys_addr_from_edid(hdmi->cec_notifier,
> > > +							     edid);
> > > +	} else {
> > > +		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
> > > +	}
> > > +}
> > > +
> > > +static int sun8i_hdmi_enc_atomic_check(struct drm_bridge *bridge,
> > > +				       struct drm_bridge_state *bridge_state,
> > > +				       struct drm_crtc_state *crtc_state,
> > > +				       struct drm_connector_state *conn_state)
> > > +{
> > > +	struct drm_connector_state *old_conn_state =3D
> > > +		drm_atomic_get_old_connector_state(conn_state->state,
> > > +						   conn_state->connector);
> > > +
> > > +	if (!drm_connector_atomic_hdr_metadata_equal(old_conn_state, conn_s=
tate))
> > > +		crtc_state->mode_changed =3D true;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct drm_bridge_funcs sun8i_hdmi_enc_bridge_funcs =3D=
 {
> > > +	.attach =3D sun8i_hdmi_enc_attach,
> > > +	.detach =3D sun8i_hdmi_enc_detach,
> > > +	.hpd_notify =3D sun8i_hdmi_enc_hpd_notify,
> > > +	.atomic_check =3D sun8i_hdmi_enc_atomic_check,
> > > +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_stat=
e,
> > > +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
> > > +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
> > > +};
> > > +
> > >  static void sun8i_dw_hdmi_encoder_mode_set(struct drm_encoder *encod=
er,
> > >  					   struct drm_display_mode *mode,
> > >  					   struct drm_display_mode *adj_mode)
> > > @@ -99,6 +167,8 @@ static int sun8i_dw_hdmi_bind(struct device *dev, =
struct device *master,
> > >  {
> > >  	struct platform_device *pdev =3D to_platform_device(dev);
> > >  	struct dw_hdmi_plat_data *plat_data;
> > > +	struct cec_connector_info conn_info;
> > > +	struct drm_connector *connector;
> > >  	struct drm_device *drm =3D data;
> > >  	struct device_node *phy_node;
> > >  	struct drm_encoder *encoder;
> > > @@ -187,18 +257,57 @@ static int sun8i_dw_hdmi_bind(struct device *de=
v, struct device *master,
> > > =20
> > >  	plat_data->mode_valid =3D hdmi->quirks->mode_valid;
> > >  	plat_data->use_drm_infoframe =3D hdmi->quirks->use_drm_infoframe;
> > > +	plat_data->output_port =3D 1;
> > >  	sun8i_hdmi_phy_set_ops(hdmi->phy, plat_data);
> > > =20
> > >  	platform_set_drvdata(pdev, hdmi);
> > > =20
> > > -	hdmi->hdmi =3D dw_hdmi_bind(pdev, encoder, plat_data);
> > > +	hdmi->hdmi =3D dw_hdmi_probe(pdev, plat_data);
> > >  	if (IS_ERR(hdmi->hdmi)) {
> > >  		ret =3D PTR_ERR(hdmi->hdmi);
> > >  		goto err_deinit_phy;
> > >  	}
> > > =20
> > > +	hdmi->hdmi_bridge =3D of_drm_find_bridge(dev->of_node);
> >=20
> > So you're also adding child bridge support? This should be mentioned in
> > the commit log.
> >=20
> > > +	hdmi->enc_bridge.funcs =3D &sun8i_hdmi_enc_bridge_funcs;
> > > +	hdmi->enc_bridge.type =3D DRM_MODE_CONNECTOR_HDMIA;
> > > +	hdmi->enc_bridge.interlace_allowed =3D true;
> > > +
> > > +	drm_bridge_add(&hdmi->enc_bridge);
> > > +
> > > +	ret =3D drm_bridge_attach(encoder, &hdmi->enc_bridge, NULL,
> > > +				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > > +	if (ret)
> > > +		goto err_remove_dw_hdmi;
> > > +
> > > +	connector =3D drm_bridge_connector_init(drm, encoder);
> > > +	if (IS_ERR(connector)) {
> > > +		dev_err(dev, "Unable to create HDMI bridge connector\n");
> > > +		ret =3D PTR_ERR(connector);
> > > +		goto err_remove_dw_hdmi;
> > > +	}
> > > +
> > > +	hdmi->connector =3D connector;
> > > +	drm_connector_attach_encoder(connector, encoder);
> > > +
> > > +	if (hdmi->quirks->use_drm_infoframe)
> > > +		drm_connector_attach_hdr_output_metadata_property(connector);
> > > +
> > > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > > +
> > > +	hdmi->cec_notifier =3D cec_notifier_conn_register(&pdev->dev, NULL,
> > > +							&conn_info);
> > > +	if (!hdmi->cec_notifier) {
> > > +		ret =3D -ENOMEM;
> > > +		goto err_remove_dw_hdmi;
> > > +	}
> > > +
> > >  	return 0;
> >=20
> > Yeah, I'm not sure. We now have two different yet redundant set of
> > operations with no clear definition wrt what belongs where. I'm really
> > not impressed with the use of bridges for things that are clearly not
> > bridges.
>=20
> DRM bridges should be taken as more broad concept than just a physical
> bridge.
>=20
> >=20
> > The "nothing happens until all drivers are loaded" argument is also
> > supposed to be covered by the component framework, so why do we even
> > have to use a bridge here?
>=20
> There is more than one reason:
> - Display connector driver, which sets ddc-en gpio, is purely bridge driv=
er.

You can still use a bridge with an encoder. Plus, there's strictly no
reason that driver should be a bridge driver only.

> - In long term, I plan to add format negotiation between display, dw-hdmi
>   and DE3 (I already have WIP code). This is already implemented in bridge
>   infrastructure.
> - There is a plan to remove connector handling from DW HDMI handling
>   and use display connector driver instead. This again involves bridges.
>   sun4i-drm and rockchip-drm are the only remaining drivers, which are
>   not yet converted.

And those are great examples of why bridges are a mess right now. They
have severe limitations, but yet we put more and more features into them
for no particular reason.

I don't know who decided that, but I was not part of that discussion.

> > You were saying that it's an issue of probe order going wrong, could you
> > explain a bit more what goes wrong so we can try to figure something out
> > that doesn't involve a bridge?
>=20
> Not sure how to make this clearer than in cover letter and this commit
> message. ddc-en pin is responsibility of display-connector driver (see
> commit mentioned in fixes tag), so it must probe before sun8i dw hdmi.
>=20
> Why are you so against bridges?

=46rom a fundamental point of view, we went from a model where we had:

 Framebuffer -> Plane -> CRTC -> Encoder -> Connector -> Monitor / Panel / =
Bridge

 ^                                                   ^  ^                  =
      ^
 +-------------------- Source -----------------------+  +---------- Sink --=
------+

To effectively merging together panels, bridges and encoders together
into bridges, and before the connector.

As this discussion shows, there's no separation anymore between a source
and a sink, and it gets hard to know what is what anymore.

=46rom a more technical point of view, it makes it hard to share code.
Most of the bridges will no longer create their connector anymore, so if
you want to modify the connector or add attributes for some reason,
well, you can't anymore because you don't even know what structure /
driver it's going to use anymore.

Oh, and if you want to add a property, you can't either.

Bridges really are second-class citizen, but we're encouraging everyone
to move to a solution with less capabilities for some reason.

> As I explained above, format negotiation is really implemented only
> there, so they are needed at some point anyway.

Format negociation is often abused to handle HDMI format output
negociation. If that's what you meant, then it's very much implemented
in several drivers already without bridges (i915, vc4), and I have a
series to tackle that generically here:
https://lore.kernel.org/dri-devel/20230920-kms-hdmi-connector-state-v2-0-17=
932daddd7d@kernel.org/

The ones in the bridge don't follow the same logic though, so they end
up with a behaviour different to what most of the userspace app expect.

If you meant format negociation as in "my (actual) bridge can only take
a couple of formats and I need to make sure the encoder chooses the
right one", then yeah, that makes sense. That has nothing to do with
HDMI or dw-hdmi though.

Maxime

--k7k7qikbqnwcrqty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZR523QAKCRDj7w1vZxhR
xS0WAP9SXlqeMutWHaFIKIEY5cKskYDQ4oBcElyee7Q7+MiTvgD/SCaRQAV61AQP
vHr7wRJiwfVLS/eSC1uY/UUlDe18Rgs=
=l1zf
-----END PGP SIGNATURE-----

--k7k7qikbqnwcrqty--
