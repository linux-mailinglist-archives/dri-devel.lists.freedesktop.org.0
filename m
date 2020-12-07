Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4442D136F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 15:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F51C6E854;
	Mon,  7 Dec 2020 14:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B06C6E854
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:20:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA31FABE9;
 Mon,  7 Dec 2020 14:20:40 +0000 (UTC)
Subject: Re: [PATCH v4 6/8] drm/vc4: hdmi: Use the connector state pixel rate
 for the PHY
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-7-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <497766d9-29ba-55c5-4b6f-0d6a068bdd5c@suse.de>
Date: Mon, 7 Dec 2020 15:20:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207133948.2109194-7-maxime@cerno.tech>
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============1486887336=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1486887336==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="99NM8WhtFaGpZpzcQzrMxUSjqxVFSX48r"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--99NM8WhtFaGpZpzcQzrMxUSjqxVFSX48r
Content-Type: multipart/mixed; boundary="BqIboZHMDXwANqLQQjdsybopVDrICvhHn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
Cc: bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <497766d9-29ba-55c5-4b6f-0d6a068bdd5c@suse.de>
Subject: Re: [PATCH v4 6/8] drm/vc4: hdmi: Use the connector state pixel rate
 for the PHY
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-7-maxime@cerno.tech>
In-Reply-To: <20201207133948.2109194-7-maxime@cerno.tech>

--BqIboZHMDXwANqLQQjdsybopVDrICvhHn
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> The PHY initialisation parameters are not based on the pixel clock but
> the TMDS clock rate which can be the pixel clock in the standard case,
> but could be adjusted based on some parameters like the bits per color.=

>=20
> Since the TMDS clock rate is stored in our custom connector state
> already, let's reuse it from there instead of computing it again.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c     | 2 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.h     | 9 ++++-----
>   drivers/gpu/drm/vc4/vc4_hdmi_phy.c | 8 +++++---
>   3 files changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index c1667cfe37db..795fd23c8f58 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -714,7 +714,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder,
>   		vc4_hdmi->variant->reset(vc4_hdmi);
>  =20
>   	if (vc4_hdmi->variant->phy_init)
> -		vc4_hdmi->variant->phy_init(vc4_hdmi, mode);
> +		vc4_hdmi->variant->phy_init(vc4_hdmi, vc4_conn_state);
>  =20
>   	HDMI_WRITE(HDMI_SCHEDULER_CONTROL,
>   		   HDMI_READ(HDMI_SCHEDULER_CONTROL) |
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index bca6943de884..6cc5b6652cca 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -21,10 +21,9 @@ to_vc4_hdmi_encoder(struct drm_encoder *encoder)
>   	return container_of(encoder, struct vc4_hdmi_encoder, base.base);
>   }
>  =20
> -struct drm_display_mode;
> -
>   struct vc4_hdmi;
>   struct vc4_hdmi_register;
> +struct vc4_hdmi_connector_state;
>  =20
>   enum vc4_hdmi_phy_channel {
>   	PHY_LANE_0 =3D 0,
> @@ -82,7 +81,7 @@ struct vc4_hdmi_variant {
>  =20
>   	/* Callback to initialize the PHY according to the mode */

Rather 'according to the connector state'? OTOH these comments don't=20
seem to add any information. They might just be removed. :)

The patch in general is

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>   	void (*phy_init)(struct vc4_hdmi *vc4_hdmi,
> -			 struct drm_display_mode *mode);
> +			 struct vc4_hdmi_connector_state *vc4_conn_state);
>  =20
>   	/* Callback to disable the PHY */
>   	void (*phy_disable)(struct vc4_hdmi *vc4_hdmi);
> @@ -192,13 +191,13 @@ conn_state_to_vc4_hdmi_conn_state(struct drm_conn=
ector_state *conn_state)
>   }
>  =20
>   void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> -		       struct drm_display_mode *mode);
> +		       struct vc4_hdmi_connector_state *vc4_conn_state);
>   void vc4_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
>   void vc4_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
>   void vc4_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
>  =20
>   void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> -		       struct drm_display_mode *mode);
> +		       struct vc4_hdmi_connector_state *vc4_conn_state);
>   void vc5_hdmi_phy_disable(struct vc4_hdmi *vc4_hdmi);
>   void vc5_hdmi_phy_rng_enable(struct vc4_hdmi *vc4_hdmi);
>   void vc5_hdmi_phy_rng_disable(struct vc4_hdmi *vc4_hdmi);
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c b/drivers/gpu/drm/vc4/v=
c4_hdmi_phy.c
> index 057796b54c51..36535480f8e2 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi_phy.c
> @@ -127,7 +127,8 @@
>  =20
>   #define OSCILLATOR_FREQUENCY	54000000
>  =20
> -void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_m=
ode *mode)
> +void vc4_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> +		       struct vc4_hdmi_connector_state *conn_state)
>   {
>   	/* PHY should be in reset, like
>   	 * vc4_hdmi_encoder_disable() does.
> @@ -339,11 +340,12 @@ static void vc5_hdmi_reset_phy(struct vc4_hdmi *v=
c4_hdmi)
>   	HDMI_WRITE(HDMI_TX_PHY_POWERDOWN_CTL, BIT(10));
>   }
>  =20
> -void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi, struct drm_display_m=
ode *mode)
> +void vc5_hdmi_phy_init(struct vc4_hdmi *vc4_hdmi,
> +		       struct vc4_hdmi_connector_state *conn_state)
>   {
>   	const struct phy_lane_settings *chan0_settings, *chan1_settings, *ch=
an2_settings, *clock_settings;
>   	const struct vc4_hdmi_variant *variant =3D vc4_hdmi->variant;
> -	unsigned long long pixel_freq =3D mode->clock * 1000;
> +	unsigned long long pixel_freq =3D conn_state->pixel_rate;
>   	unsigned long long vco_freq;
>   	unsigned char word_sel;
>   	u8 vco_sel, vco_div;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BqIboZHMDXwANqLQQjdsybopVDrICvhHn--

--99NM8WhtFaGpZpzcQzrMxUSjqxVFSX48r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OOjcFAwAAAAAACgkQlh/E3EQov+D2
yQ//aeYh+dX+Lqqzbk+Zj/rwfM/uyzNKnczLc8cRw26m6tcxzSfUHMso2fRuCeICVNeqjGStcoL6
hBl9cn4E7LQwBT6UBrIXUTw20ca8ZZm/dY0uNhY7Lp6hZmUApGowSu8FXmU+QYmJYTBLtv+X1vax
0EMYykzCXiQfOlHS+6NvYrspieD+aNSfo8gubcfwnq2kJnCFwH1ghrmKl5117eOWwPMB8ZlrAl7v
rNVW/0JeflN61dlH4sUwtRiXtzmS7NaFIKCf9lC6Qgs/ollPQG0jeyeP8Rxvaw45VZ+GW1/ncTcz
ns9LmcAgS10jduShkYr+IQuhz/tHSq/XNm7Lz+OnHPdcCp+n4ZCLd4icvxQjIN9hGH9qRNsz5eqv
rQvrjsLtwps8+Mzovyc8N5PqwQwPEP61ALxk5rau4ad2OZGudf3wCRuGKXBUSgA1xrM091LE0tQh
XLmFr9OO6q2/N/4ClkvWqC18I+ZEdXBST3zuHbfyUGh7bu/ixC/vppOmaMLKi2mAzqD0P2vBTuMi
uYr2SOnk/2r+GxxPyWHnR4BLdFNWtuTZ12geWpZGTaQbO+mitxEYLozhCJJMTvDqRhQg6o54PDHs
pUB1/KHhg78ERfhS2fKX/DOI8I1gzjTZKL4wte/AzC2mleew87LLNsB5JRiag4KJXjwbx90aOY5b
1OU=
=CLGw
-----END PGP SIGNATURE-----

--99NM8WhtFaGpZpzcQzrMxUSjqxVFSX48r--

--===============1486887336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1486887336==--
