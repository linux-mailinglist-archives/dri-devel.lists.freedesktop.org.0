Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72495359858
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 10:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED4AC6E42A;
	Fri,  9 Apr 2021 08:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7F66E42A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 08:54:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38587B159;
 Fri,  9 Apr 2021 08:54:42 +0000 (UTC)
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-7-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 06/18] drm/vc4: Rework the encoder retrieval code
Message-ID: <0b1d634c-14cd-253f-1bfb-7a69f9115ef9@suse.de>
Date: Fri, 9 Apr 2021 10:54:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-7-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0926304957=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0926304957==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UNhBXaL4YS7lJGRcDc10e95PnBNoYJdhG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UNhBXaL4YS7lJGRcDc10e95PnBNoYJdhG
Content-Type: multipart/mixed; boundary="uwQ7qX5NsTc4FI2G67jZkVQSWsND1xNcP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <0b1d634c-14cd-253f-1bfb-7a69f9115ef9@suse.de>
Subject: Re: [PATCH 06/18] drm/vc4: Rework the encoder retrieval code
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-7-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-7-maxime@cerno.tech>

--uwQ7qX5NsTc4FI2G67jZkVQSWsND1xNcP
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> Due to a FIFO that cannot be flushed between the pixelvalve and the HDM=
I
> controllers on BCM2711, we need to carefully disable both at boot time
> if they were left enabled by the firmware.
>=20
> However, at the time we're running that code, the struct drm_connector
> encoder pointer isn't set yet, and thus we cannot retrieve the encoder
> associated to our CRTC.
>=20
> We can however make use of the fact that we have a less flexible setup
> than what DRM allows where we have a 1:1 relationship between our CRTCs=

> and encoders (and connectors), and thus store the crtc associated to ou=
r
> encoder at boot time.
>=20
> We cannot do that at the time the encoders are probed though, since the=

> CRTCs won't be probed yet and thus we don't know at that time which CRT=
C
> index we're going to get, so let's do this in two passes: we can first
> bind all the components and then once they all are bound, we can iterat=
e
> over all the encoders to find their associated CRTC and set the pointer=
=2E
>=20
> This is similar to what we're doing to set the possible_crtcs field.
>=20
> Fixes: 875a4d536842 ("drm/vc4: drv: Disable the CRTC at boot time")

Cc: <stable@vger.kernel.org> # v5.10+

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/vc4/vc4_crtc.c | 25 +++++++++++++++++++++--
>   drivers/gpu/drm/vc4/vc4_drv.c  | 36 +++++++++++++++++++++++++++++++++=
+
>   drivers/gpu/drm/vc4/vc4_drv.h  |  1 +
>   3 files changed, 60 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_c=
rtc.c
> index f1f2e8cbce79..e2607e1f2520 100644
> --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> @@ -255,6 +255,19 @@ static u32 vc4_crtc_get_fifo_full_level_bits(struc=
t vc4_crtc *vc4_crtc,
>   				   PV_CONTROL_FIFO_LEVEL);
>   }
>  =20
> +struct drm_encoder *vc4_get_connector_encoder(struct drm_connector *co=
nnector)
> +{
> +	struct drm_encoder *encoder;
> +
> +	if (WARN_ON(hweight32(connector->possible_encoders) !=3D 1))

drm_WARN_ON

> +		return NULL;
> +
> +	drm_connector_for_each_possible_encoder(connector, encoder)
> +		return encoder;
> +
> +	return NULL;
> +}
> +
>   /*
>    * Returns the encoder attached to the CRTC.
>    *
> @@ -269,9 +282,17 @@ static struct drm_encoder *vc4_get_crtc_encoder(st=
ruct drm_crtc *crtc)
>  =20
>   	drm_connector_list_iter_begin(crtc->dev, &conn_iter);
>   	drm_for_each_connector_iter(connector, &conn_iter) {
> -		if (connector->state->crtc =3D=3D crtc) {
> +		struct drm_encoder *encoder;
> +		struct vc4_encoder *vc4_encoder;
> +
> +		encoder =3D vc4_get_connector_encoder(connector);
> +		if (!encoder)
> +			continue;
> +
> +		vc4_encoder =3D to_vc4_encoder(encoder);
> +		if (vc4_encoder->crtc =3D=3D crtc) {
>   			drm_connector_list_iter_end(&conn_iter);
> -			return connector->encoder;
> +			return encoder;
>   		}
>   	}
>   	drm_connector_list_iter_end(&conn_iter);
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_dr=
v.c
> index 556ad0f02a0d..cd1fb75c66a7 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -199,6 +199,41 @@ static int compare_dev(struct device *dev, void *d=
ata)
>   	return dev =3D=3D data;
>   }
>  =20
> +static struct drm_crtc *vc4_drv_find_crtc(struct drm_device *drm,
> +					  struct drm_encoder *encoder)
> +{
> +	struct drm_crtc *crtc;
> +
> +	if (WARN_ON(hweight32(encoder->possible_crtcs) !=3D 1))
> +		return NULL;
> +
> +	drm_for_each_crtc(crtc, drm) {
> +		if (!drm_encoder_crtc_ok(encoder, crtc))
> +			continue;
> +
> +		return crtc;
> +	}
> +
> +	return NULL;
> +}
> +
> +static void vc4_drv_set_encoder_data(struct drm_device *drm)
> +{
> +	struct drm_encoder *encoder;
> +
> +	drm_for_each_encoder(encoder, drm) {
> +		struct vc4_encoder *vc4_encoder;
> +		struct drm_crtc *crtc;
> +
> +		crtc =3D vc4_drv_find_crtc(drm, encoder);
> +		if (WARN_ON(!crtc))
> +			return;
> +
> +		vc4_encoder =3D to_vc4_encoder(encoder);
> +		vc4_encoder->crtc =3D crtc;
> +	}
> +}
> +
>   static void vc4_match_add_drivers(struct device *dev,
>   				  struct component_match **match,
>   				  struct platform_driver *const *drivers,
> @@ -261,6 +296,7 @@ static int vc4_drm_bind(struct device *dev)
>   	ret =3D component_bind_all(dev, drm);
>   	if (ret)
>   		return ret;
> +	vc4_drv_set_encoder_data(drm);
>  =20
>   	ret =3D vc4_plane_create_additional_planes(drm);
>   	if (ret)
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_dr=
v.h
> index a7500716cf3f..1b569dcc2154 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -438,6 +438,7 @@ enum vc4_encoder_type {
>  =20
>   struct vc4_encoder {
>   	struct drm_encoder base;
> +	struct drm_crtc *crtc;

I'd probably deserves a comment why this is explicitly stored here.

>   	enum vc4_encoder_type type;
>   	u32 clock_select;
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--uwQ7qX5NsTc4FI2G67jZkVQSWsND1xNcP--

--UNhBXaL4YS7lJGRcDc10e95PnBNoYJdhG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBwFk8FAwAAAAAACgkQlh/E3EQov+Ci
/RAAi7lHNOw29a5VYBdzw7ifFB5oVM8zz7ygwIWhFE5mSJtQ8SoWRrJMxD6rceYwLy4dztjrK7t1
Etwtvzj8qlyG/4WJjTuIOvOm9jUEYO3sIDYAI7vyiX0WVLx0Jy4jMktJvOKqvDO2dZ2HvvF5vIS6
5XZPl9+6HQ7hdA62vD3PPTOBN0lByw9N/jwtZXWIgwSkR8ry21aWPUOgS0zv8xCBMekOQ443mz0r
Suh3uwtO/JFVuKZWPSbjzjFKTggZgnjAqSKzSPNHzDi7om7vgdr6e/pftolBRliS9L754kwVpZKP
fi7vYw0K2pxo2EpVHyz3LAu0/HaRe3+5HB0WMuNB7OId0yDMKifaplH1CpiTxlE17cy7tD88bI9+
scyjhYjg7A9RnweVF79TtkzFr+dWXiuVe1R6uq0oigYErEDNxn5FhEOm/MXFklCpljYOoQrVK5xA
grMNiOiNUhF0nmzkVkPKCL4WTqyB7pcUHaOrFjDWmxM1iSFCuEqYazy1aK1WSxN1AVug9U+neBgZ
D8V5vddchUeVSm24aaA00sJ7pmF8Rz0IT/OarEyxvhFOE4cIzcxOEeDkl25e/lKE4k23wugydjL3
cd0nO1edkDetlWpFuTiFyu1FYsj0irN95I0o8CrJvtSzkSQvYjgvDPhH0lzAWXzfu7iK1mI1KsdO
VcM=
=NU8s
-----END PGP SIGNATURE-----

--UNhBXaL4YS7lJGRcDc10e95PnBNoYJdhG--

--===============0926304957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0926304957==--
