Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA662D134F
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 15:14:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82A6D892F6;
	Mon,  7 Dec 2020 14:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4F892F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:14:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30469AB63;
 Mon,  7 Dec 2020 14:14:51 +0000 (UTC)
Subject: Re: [PATCH v4 5/8] drm/vc4: hdmi: Store pixel frequency in the
 connector state
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Eric Anholt <eric@anholt.net>
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <201be890-781d-0c94-7f42-df761e4facac@suse.de>
Date: Mon, 7 Dec 2020 15:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201207133948.2109194-6-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============1387063467=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1387063467==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1hpOarlmVyDEdNwwnvMFUkumP1iRaAEoJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1hpOarlmVyDEdNwwnvMFUkumP1iRaAEoJ
Content-Type: multipart/mixed; boundary="LgpNhZFXsgCYpFYBE1ukPvzJaJlFqjiXf";
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
Message-ID: <201be890-781d-0c94-7f42-df761e4facac@suse.de>
Subject: Re: [PATCH v4 5/8] drm/vc4: hdmi: Store pixel frequency in the
 connector state
References: <20201207133948.2109194-1-maxime@cerno.tech>
 <20201207133948.2109194-6-maxime@cerno.tech>
In-Reply-To: <20201207133948.2109194-6-maxime@cerno.tech>

--LgpNhZFXsgCYpFYBE1ukPvzJaJlFqjiXf
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.12.20 um 14:39 schrieb Maxime Ripard:
> The pixel rate is for now quite simple to compute, but with more featur=
es
> (30 and 36 bits output, YUV output, etc.) will depend on a bunch of
> connectors properties.
>=20
> Let's store the rate we have to run the pixel clock at in our custom
> connector state, and compute it in atomic_check.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 26 +++++++++++++++++++++++++-
>   drivers/gpu/drm/vc4/vc4_hdmi.h |  1 +
>   2 files changed, 26 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 862c93708e9a..c1667cfe37db 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -194,6 +194,7 @@ vc4_hdmi_connector_duplicate_state(struct drm_conne=
ctor *connector)
>   	if (!new_state)
>   		return NULL;
>  =20
> +	new_state->pixel_rate =3D vc4_state->pixel_rate;
>   	__drm_atomic_helper_connector_duplicate_state(connector, &new_state-=
>base);
>  =20
>   	return &new_state->base;
> @@ -611,9 +612,29 @@ static void vc4_hdmi_recenter_fifo(struct vc4_hdmi=
 *vc4_hdmi)
>   		  "VC4_HDMI_FIFO_CTL_RECENTER_DONE");
>   }
>  =20
> +static struct drm_connector_state *
> +vc4_hdmi_encoder_get_connector_state(struct drm_encoder *encoder,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct drm_connector *connector;
> +	unsigned int i;
> +
> +	for_each_new_connector_in_state(state, connector, conn_state, i) {
> +		if (conn_state->best_encoder =3D=3D encoder)
> +			return conn_state;
> +	}
> +
> +	return NULL;
> +}
> +
>   static void vc4_hdmi_encoder_pre_crtc_configure(struct drm_encoder *e=
ncoder,
>   						struct drm_atomic_state *state)
>   {
> +	struct drm_connector_state *conn_state =3D
> +		vc4_hdmi_encoder_get_connector_state(encoder, state);
> +	struct vc4_hdmi_connector_state *vc4_conn_state =3D
> +		conn_state_to_vc4_hdmi_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mo=
de;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	unsigned long pixel_rate, hsm_rate;
> @@ -625,7 +646,7 @@ static void vc4_hdmi_encoder_pre_crtc_configure(str=
uct drm_encoder *encoder,
>   		return;
>   	}
>  =20
> -	pixel_rate =3D mode->clock * 1000 * ((mode->flags & DRM_MODE_FLAG_DBL=
CLK) ? 2 : 1);

Has (mode->flags & DRM_MODE_FLAG_DBLCLK) been lost? I cannot find it any =

longer. The code in atomic_check() looks significantly different.

Best regards
Thomas

> +	pixel_rate =3D vc4_conn_state->pixel_rate;
>   	ret =3D clk_set_rate(vc4_hdmi->pixel_clock, pixel_rate);
>   	if (ret) {
>   		DRM_ERROR("Failed to set pixel clock rate: %d\n", ret);
> @@ -797,6 +818,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
>   					 struct drm_crtc_state *crtc_state,
>   					 struct drm_connector_state *conn_state)
>   {
> +	struct vc4_hdmi_connector_state *vc4_state =3D conn_state_to_vc4_hdmi=
_conn_state(conn_state);
>   	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>   	struct vc4_hdmi *vc4_hdmi =3D encoder_to_vc4_hdmi(encoder);
>   	unsigned long long pixel_rate =3D mode->clock * 1000;
> @@ -824,6 +846,8 @@ static int vc4_hdmi_encoder_atomic_check(struct drm=
_encoder *encoder,
>   	if (pixel_rate > vc4_hdmi->variant->max_pixel_clock)
>   		return -EINVAL;
>  =20
> +	vc4_state->pixel_rate =3D pixel_rate;
> +
>   	return 0;
>   }
>  =20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_h=
dmi.h
> index 2cf5362052e2..bca6943de884 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -182,6 +182,7 @@ encoder_to_vc4_hdmi(struct drm_encoder *encoder)
>  =20
>   struct vc4_hdmi_connector_state {
>   	struct drm_connector_state	base;
> +	unsigned long long		pixel_rate;
>   };
>  =20
>   static inline struct vc4_hdmi_connector_state *
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--LgpNhZFXsgCYpFYBE1ukPvzJaJlFqjiXf--

--1hpOarlmVyDEdNwwnvMFUkumP1iRaAEoJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/OONkFAwAAAAAACgkQlh/E3EQov+Bz
jQ//fRVYPfSp8pYhmpzx/ZE5j9yF/PCkkrdjA0drOcVMOjNf7jWVCuqySdORXIiyyvfvwcvMv0Hm
ckCvRMobODVuGXa8M4xUrc+1QK6ntmsu9AqDGCbFStMunIEMScZ+N0rKk6n9gqdDPjRrbUaCIK+y
mQy/msL6AkpjjgVbxc1wjR9HZd4pBohVOvxWSaW/XoXbKLZWQ5ImGG+flbhj9yCzVoHicBEKorOY
mWIlsWoiz1myPoipnY1BnFiE7BQndeuXKnlZ4Gpefq47e7cA2Ow8AYCTidtxmkPwqy414oHux/yA
lEARJ1t7YsjsN2uzUyfwFnkaHaR1u96Kq/t2M3lU+SJZyP2g0/rZIIoeHK/66cyEacsceA+WQ06Q
lQPMBVjhlhimoxKW/GqBL6F4P4N2EApglmFAc+PWEocH3r3G3B/LHDYEMLyEEdsXN2LMM2Sp+Xgz
TU+3yKOUCHS+BLi6NMYQg375lTcL6O1vfG5ZRSdp1hI2K5JGYTcHwsC4K8LeLKk3itZa3biyC1pL
28cNPxhqK7ctJ6tRqjsABDnZXS/xfalD9bEJQngoGbOgAqgZB2RQSCi3/wfg0PkN4wnD78OKXzOl
9nSzMkAbmiGqGeP0mLBbpOSsvtrhIeOpm2AOaMz5XEMUd3to9T7MVBu3J4aKrkTlp6G8aznXdiTe
O5A=
=DFpi
-----END PGP SIGNATURE-----

--1hpOarlmVyDEdNwwnvMFUkumP1iRaAEoJ--

--===============1387063467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1387063467==--
