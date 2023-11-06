Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F8E7E1B97
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 09:02:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC13510E275;
	Mon,  6 Nov 2023 08:02:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05C10E275
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 08:02:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 80DCDCE0AE3;
 Mon,  6 Nov 2023 08:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A191C433C8;
 Mon,  6 Nov 2023 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699257754;
 bh=B2J3tYwWs8unjrG1R06v2y9BPdzrC6cCQw+FiMQOotM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KWbORS22YQ2++WmwX3m64ZLcVMEK8GXlY6QliYHgd1996iWKxVtwUSwkx/aVZLGzy
 sSeekCi/0B0fNx11SKHW/KeDHi78McSSyRQwJpcu9wOxNqwRP1RfQVt7i6bylDABlN
 9M6sNML4dVfuOb9wcOYYigdEilrHemvXe6FMOxLJF6Qt9BYLtK4yJvyeQd+/jvX2b1
 BVjPmvHTbVTMuSLoLcTKvtV4qUuQpPxeXpFeCUlmtXF9lWF5qg5bgwy41YPzE41es+
 4+79XEx4Nom6g3PqtmObE4WMCu9A5vmYvcMKQKVzlYYT/OgCMwaMS8UdUEHku7tMdd
 iC51iu1eSY4vQ==
Date: Mon, 6 Nov 2023 09:02:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH 3/3] drm/panel-edp: Choose correct preferred mode
Message-ID: <rgnaddxpuljjjcolz4cvudp7neudvtvcti6hezk56dktq2ij6v@cd4t2qy6mx4z>
References: <20231101212604.1636517-1-hsinyi@chromium.org>
 <20231101212604.1636517-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="waxprhmhdgzl4ous"
Content-Disposition: inline
In-Reply-To: <20231101212604.1636517-4-hsinyi@chromium.org>
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
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--waxprhmhdgzl4ous
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 01, 2023 at 02:20:11PM -0700, Hsin-Yi Wang wrote:
> If a non generic edp-panel is under aux-bus, the mode read from edid would
> still be selected as preferred and results in multiple preferred modes,
> which is ambiguous.
>=20
> If a hard-coded mode is present, unset the preferred bit of the modes read
> from edid.
>=20
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/drm_modes.c       | 16 ++++++++++++++++
>  drivers/gpu/drm/panel/panel-edp.c |  7 +++++--
>  include/drm/drm_modes.h           |  1 +
>  3 files changed, 22 insertions(+), 2 deletions(-)

This should be in two separate patches, with kunit tests for the helper
you create.

> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index ac9a406250c5..35927467f4b0 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1933,6 +1933,22 @@ void drm_connector_list_update(struct drm_connecto=
r *connector)
>  }
>  EXPORT_SYMBOL(drm_connector_list_update);
> =20
> +/**
> + * drm_mode_unset_preferred - clear the preferred status on existing mod=
es.
> + * @connector: the connector to update
> + *
> + * Walk the mode list for connector, clearing the preferred status on ex=
isting
> + * modes.
> + */
> +void drm_mode_unset_preferred_modes(struct drm_connector *connector)
> +{
> +	struct drm_display_mode *cur_mode;
> +
> +	list_for_each_entry(cur_mode, &connector->probed_modes, head)
> +		cur_mode->type &=3D ~DRM_MODE_TYPE_PREFERRED;
> +}
> +EXPORT_SYMBOL_GPL(drm_mode_unset_preferred_modes);
> +

More importantly, why do you need a helper for this at all? If it's only
useful in a single driver for now, then just add it to that driver.

>  static int drm_mode_parse_cmdline_bpp(const char *str, char **end_ptr,
>  				      struct drm_cmdline_mode *mode)
>  {
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 0883ff312eba..b3ac473b2554 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -622,10 +622,13 @@ static int panel_edp_get_modes(struct drm_panel *pa=
nel,
>  	 * and no modes (the generic edp-panel case) because it will clobber
>  	 * the display_info that was already set by drm_add_edid_modes().
>  	 */
> -	if (p->desc->num_timings || p->desc->num_modes)
> +	if (p->desc->num_timings || p->desc->num_modes) {
> +		/* hard-coded modes present, unset preferred modes from edid. */
> +		drm_mode_unset_preferred_modes(connector);
>  		num +=3D panel_edp_get_non_edid_modes(p, connector);
> -	else if (!num)
> +	} else if (!num) {
>  		dev_warn(p->base.dev, "No display modes\n");
> +	}

It's also not clear to me why you need to mess with the modes at all. If
the mode is unreliable and needs to be overloaded, then just ignore the
EDIDs entirely and report the mode you have hardcoded in the driver. You
then don't need to play with the flags at all.

Maxime

--waxprhmhdgzl4ous
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUidjwAKCRDj7w1vZxhR
xSJkAPsHDamy1dLJRTi+5dbBulJ2mpxrcxu6WVXfbKUnFeOWfgD+MqRXsdB0pXpb
EF6KGkVBrTAneLMEUAHEcp13e2J3ygo=
=iFih
-----END PGP SIGNATURE-----

--waxprhmhdgzl4ous--
