Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC147E5A62
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 16:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C989510E7BC;
	Wed,  8 Nov 2023 15:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428C010E7AF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 15:45:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CF93BB81CE3;
 Wed,  8 Nov 2023 15:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D685EC433C7;
 Wed,  8 Nov 2023 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699458318;
 bh=lBMI4J6F6WP9AJ3sXxQyAKK3/NBzr65lBcvF7WukdOE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RgeosvNMSVgxHz7b+k/Sax/Yl+Bmt2pgB+/qvwD4dwwojX4H1iz84EI37e/ppPb0z
 SuBe9QnJaiLjBGwd2i/WaBddDCM/xbHa0oNvopQS7g01ihO1Au50eyFnGVvzjDnwaR
 EeGi6di0wi1+uQ0pN5Hgvi3bXV0QfLfJ0RegVEjybzMqhHuTsGa4qXUe/npBAIJIrO
 U6mH4mzdC62sqRP19ZMMKbppbJmuZ+nq5kE/NmOPs1sljB3WMufBsoeMI1ovLSiUAb
 Jkg2D0ydVCUCGkVArHnjt+bb9QrRBptW6nnu2Wv3qA6MIOe9q3tqxiu2adQ/dF5x49
 6vbV8TtS8ooYg==
Date: Wed, 8 Nov 2023 16:45:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v6 4/5] drm/panel-edp: Add override_edid_mode quirk for
 generic edp
Message-ID: <xnyf3ul7pwsgrmxgbareh5lhhmpfuvfksj3nyd4zmup7khaer2@fbwgbrq4vywb>
References: <20231107204611.3082200-1-hsinyi@chromium.org>
 <20231107204611.3082200-5-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ayx5plwb3tznjjb3"
Content-Disposition: inline
In-Reply-To: <20231107204611.3082200-5-hsinyi@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ayx5plwb3tznjjb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 12:41:54PM -0800, Hsin-Yi Wang wrote:
> Generic edp gets mode from edid. However, some panels report incorrect
> mode in this way, resulting in glitches on panel. Introduce a new quirk
> additional_mode to the generic edid to pick a correct hardcoded mode.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> ---
> no change.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 67 ++++++++++++++++++++++++++++---
>  1 file changed, 62 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 599a949d74d1..c0c24d94c3a0 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -203,6 +203,9 @@ struct edp_panel_entry {
> =20
>  	/** @name: Name of this panel (for printing to logs). */
>  	const char *name;
> +
> +	/** @override_edid_mode: Override the mode obtained by edid. */
> +	const struct drm_display_mode *override_edid_mode;
>  };
> =20
>  struct panel_edp {
> @@ -301,6 +304,24 @@ static unsigned int panel_edp_get_display_modes(stru=
ct panel_edp *panel,
>  	return num;
>  }
> =20
> +static int panel_edp_override_edid_mode(struct panel_edp *panel,
> +					struct drm_connector *connector,
> +					const struct drm_display_mode *override_mode)
> +{
> +	struct drm_display_mode *mode;
> +
> +	mode =3D drm_mode_duplicate(connector->dev, override_mode);
> +	if (!mode) {
> +		dev_err(panel->base.dev, "failed to add additional mode\n");
> +		return 0;
> +	}
> +
> +	mode->type |=3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
> +	drm_mode_set_name(mode);
> +	drm_mode_probed_add(connector, mode);
> +	return 1;
> +}
> +
>  static int panel_edp_get_non_edid_modes(struct panel_edp *panel,
>  					struct drm_connector *connector)
>  {
> @@ -568,6 +589,9 @@ static int panel_edp_get_modes(struct drm_panel *pane=
l,
>  {
>  	struct panel_edp *p =3D to_panel_edp(panel);
>  	int num =3D 0;
> +	bool has_override_edid_mode =3D p->detected_panel &&
> +				      p->detected_panel !=3D ERR_PTR(-EINVAL) &&
> +				      p->detected_panel->override_edid_mode;
> =20
>  	/* probe EDID if a DDC bus is available */
>  	if (p->ddc) {
> @@ -575,9 +599,18 @@ static int panel_edp_get_modes(struct drm_panel *pan=
el,
> =20
>  		if (!p->edid)
>  			p->edid =3D drm_get_edid(connector, p->ddc);
> -
> -		if (p->edid)
> -			num +=3D drm_add_edid_modes(connector, p->edid);
> +		if (p->edid) {
> +			if (has_override_edid_mode) {

It's not clear to me why the override mechanism is only there when
there's a ddc bus?

You mentioned before that you were following panel-simple, but that's a
clear deviation from what I can see. If there's a reason for that
deviation, that's fine by me, but it should at least be documented in
the commit log.

> +				/*
> +				 * override_edid_mode is specified. Use
> +				 * override_edid_mode instead of from edid.
> +				 */
> +				num +=3D panel_edp_override_edid_mode(p, connector,
> +						p->detected_panel->override_edid_mode);
> +			} else {
> +				num +=3D drm_add_edid_modes(connector, p->edid);
> +			}
> +		}
> =20
>  		pm_runtime_mark_last_busy(panel->dev);
>  		pm_runtime_put_autosuspend(panel->dev);
> @@ -950,6 +983,19 @@ static const struct panel_desc auo_b101ean01 =3D {
>  	},
>  };
> =20
> +static const struct drm_display_mode auo_b116xa3_mode =3D {
> +	.clock =3D 70589,
> +	.hdisplay =3D 1366,
> +	.hsync_start =3D 1366 + 40,
> +	.hsync_end =3D 1366 + 40 + 40,
> +	.htotal =3D 1366 + 40 + 40 + 32,
> +	.vdisplay =3D 768,
> +	.vsync_start =3D 768 + 10,
> +	.vsync_end =3D 768 + 10 + 12,
> +	.vtotal =3D 768 + 10 + 12 + 6,
> +	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};

That should be a separate patch

Maxime

--ayx5plwb3tznjjb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUutCwAKCRDj7w1vZxhR
xS/8AP9oGQObgxgUfVUv9qDrc35Q0duN6Y+yritr19Har0fx/wD+Lh59iZ9Htk/2
5f7yys9Gu7xDbg5aLOISf3PKNmszrwA=
=Mmp7
-----END PGP SIGNATURE-----

--ayx5plwb3tznjjb3--
