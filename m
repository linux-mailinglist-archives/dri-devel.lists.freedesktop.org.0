Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85FB360325
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 09:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865926E9EC;
	Thu, 15 Apr 2021 07:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7266E9EC
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 07:19:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEEF4B039;
 Thu, 15 Apr 2021 07:19:21 +0000 (UTC)
Subject: Re: [PATCH 17/18] drm/vc4: hdmi: Move the pixel rate calculation to a
 helper
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-18-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <d7039a18-d9b9-4fb5-e6a1-a93f5cf880d7@suse.de>
Date: Thu, 15 Apr 2021 09:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-18-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0890007225=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0890007225==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KzbjMzmVyQgWV0aLMHInmsiTNqR6BZWwv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KzbjMzmVyQgWV0aLMHInmsiTNqR6BZWwv
Content-Type: multipart/mixed; boundary="l9fyASbCXKFBqz5o9bsaYa4Mv062x3QRZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 linux-rpi-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org
Message-ID: <d7039a18-d9b9-4fb5-e6a1-a93f5cf880d7@suse.de>
Subject: Re: [PATCH 17/18] drm/vc4: hdmi: Move the pixel rate calculation to a
 helper
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-18-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-18-maxime@cerno.tech>

--l9fyASbCXKFBqz5o9bsaYa4Mv062x3QRZ
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> In order to implement a fallback mechanism to YUV422 when the pixel rat=
e
> is too high, let's move the pixel rate computation to a function of its=

> own that will be shared across two functions.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 36 +++++++++++++++++++++++----------=
-
>   1 file changed, 25 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 407b468dab67..c4f91d39d91c 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -991,22 +991,16 @@ static void vc4_hdmi_bridge_post_crtc_enable(stru=
ct drm_bridge *bridge,
>   #define WIFI_2_4GHz_CH1_MIN_FREQ	2400000000ULL
>   #define WIFI_2_4GHz_CH1_MAX_FREQ	2422000000ULL
>  =20
> -static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> -					struct drm_bridge_state *bridge_state,
> -					struct drm_crtc_state *crtc_state,
> -					struct drm_connector_state *conn_state)
> +static unsigned long vc4_hdmi_calc_pixel_rate(struct drm_bridge *bridg=
e,
> +					      struct drm_bridge_state *bridge_state,
> +					      struct drm_crtc_state *crtc_state,
> +					      struct drm_connector_state *conn_state)
>   {
> -	struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc4_hdmi=
_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> -	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>   	unsigned long long pixel_rate =3D mode->clock * 1000;
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
>   	unsigned long long tmds_rate;
>  =20
> -	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
> -	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> -	     (mode->hsync_end % 2) || (mode->htotal % 2)))
> -		return -EINVAL;
> -
>   	/*
>   	 * The 1440p@60 pixel rate is in the same range than the first
>   	 * WiFi channel (between 2.4GHz and 2.422GHz with 22MHz
> @@ -1032,6 +1026,26 @@ static int vc4_hdmi_bridge_atomic_check(struct d=
rm_bridge *bridge,
>   	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>   		pixel_rate =3D pixel_rate * 2;
>  =20
> +	return pixel_rate;
> +}
> +
> +static int vc4_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
> +					struct drm_bridge_state *bridge_state,
> +					struct drm_crtc_state *crtc_state,
> +					struct drm_connector_state *conn_state)
> +{
> +	struct vc4_hdmi *vc4_hdmi =3D bridge_to_vc4_hdmi(bridge);
> +	struct vc4_hdmi_connector_state *vc4_state =3D
> +		conn_state_to_vc4_hdmi_conn_state(conn_state);
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> +	unsigned long long pixel_rate;
> +
> +	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
> +	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
> +	     (mode->hsync_end % 2) || (mode->htotal % 2)))
> +		return -EINVAL;
> +
> +	pixel_rate =3D vc4_hdmi_calc_pixel_rate(bridge, bridge_state, crtc_st=
ate, conn_state);
>   	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>   		return -EINVAL;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--l9fyASbCXKFBqz5o9bsaYa4Mv062x3QRZ--

--KzbjMzmVyQgWV0aLMHInmsiTNqR6BZWwv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB36PgFAwAAAAAACgkQlh/E3EQov+BR
KA/8CJA1v31XG69EvIJIPtPKJ0VfQkgICbZOmxGqBTRo85V1T0zR5T4e/n9pCdkEKMmQXdsUSI0E
rJZLjsk8GY+Mn42BnMS8KVeGfQABuzr7Qp87cneNSke+GhYE1AIrUQ3QrfKIVwzJ468tHaDFUrRt
MaVLr5P8z8WD0Fg/5tnJfoDz11Tibr3lJGR06ImlgVfKG0DGhI8Wcz9UmuVy1QVLHb5yQ8eZAeCs
CDPHnUGyR7slWgkApuTM/MXlRWkzXrpxUicKwPh5W90xKb5DKAg3wqMmvp1/GalDa8dmVJZf6Rxr
8+nH/2DX2RaW4p/XMaUuxqJMfM6cFutHFLVsRsoRvxo7v91xXOZEdSQshun77OB1RlkzzT0u7cKu
SRhbmQVl0WM+2+M914GeasuflNqkrZRfjywNf4Z22EDNhW5U4MZF70gaPASHiuXPmXNEPzuA7JOl
JSRI3WmgPcyOtKPJiaCFGr0F1adnc9t31AqU2Zht5NP5O53eDY4RKpuww8L7muxqmP1li6R1EBlO
2FDPPxw0XWy9p3MdMc3w5K1ajCj3NEC+HER+O85YEy5xhi/Lafy3mNVYakTEfe9yxIkctZ2z0TGv
L0I9KHyz8HFfA/1uK745FPNOWaHBu9dPYqexaVctt5B0KgvESKzeAr4fDXKe6JsmKXclbcEH2NfA
ytg=
=sGrP
-----END PGP SIGNATURE-----

--KzbjMzmVyQgWV0aLMHInmsiTNqR6BZWwv--

--===============0890007225==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0890007225==--
