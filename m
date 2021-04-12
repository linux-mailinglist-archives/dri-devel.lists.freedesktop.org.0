Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DCD35C3F5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1376E48E;
	Mon, 12 Apr 2021 10:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADF36E088
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:28:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 721EBAF11;
 Mon, 12 Apr 2021 10:28:09 +0000 (UTC)
Subject: Re: [PATCH 11/18] drm/vc4: hdmi: Move XBAR setup to csc_setup
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-12-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f6f5c30d-798a-4795-7395-67000a70f501@suse.de>
Date: Mon, 12 Apr 2021 12:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-12-maxime@cerno.tech>
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
Content-Type: multipart/mixed; boundary="===============0608299715=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0608299715==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bK36Lq6QuzrM1V9nUcEX36mVIwQlohktF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bK36Lq6QuzrM1V9nUcEX36mVIwQlohktF
Content-Type: multipart/mixed; boundary="c5Gtoe5rC09wdRI3gkC4fFTUeBVb5YSWr";
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
Message-ID: <f6f5c30d-798a-4795-7395-67000a70f501@suse.de>
Subject: Re: [PATCH 11/18] drm/vc4: hdmi: Move XBAR setup to csc_setup
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-12-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-12-maxime@cerno.tech>

--c5Gtoe5rC09wdRI3gkC4fFTUeBVb5YSWr
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> On the BCM2711, the HDMI_VEC_INTERFACE_XBAR register configuration
> depends on whether we're using an RGB or YUV output. Let's move that
> configuration to the CSC setup.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 4ce0aea6ba17..9ba555d24187 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -530,6 +530,8 @@ static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4=
_hdmi,
>   {
>   	u32 csc_ctl;
>  =20
> +	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
> +
>   	csc_ctl =3D 0x07;	/* RGB_CONVERT_MODE =3D custom matrix, || USE_RGB_=
TO_YCBCR */
>  =20
>   	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
> @@ -636,7 +638,6 @@ static void vc5_hdmi_set_timings(struct vc4_hdmi *v=
c4_hdmi,
>   	bool gcp_en;
>   	u32 reg;
>  =20
> -	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
>   	HDMI_WRITE(HDMI_HORZA,
>   		   (vsync_pos ? VC5_HDMI_HORZA_VPOS : 0) |
>   		   (hsync_pos ? VC5_HDMI_HORZA_HPOS : 0) |
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--c5Gtoe5rC09wdRI3gkC4fFTUeBVb5YSWr--

--bK36Lq6QuzrM1V9nUcEX36mVIwQlohktF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0ILgFAwAAAAAACgkQlh/E3EQov+C6
TxAAwpBMurkesl+1f5vZQS/kLDo8uhT4hkTuEXH3c6wEU/GpzJdlBSVHCjwhXQUeAfiwXW0YC3kg
KAJygBN7dKMv+LOy0dNg/AF2H6ijar4WMc1j13qkUEQYRjBuFIbxrNY3kClmJtftEiKBRr+th3QF
y6WnlYGfrgebvVVy6EqZyWELwm4jnFjF3FqNKvUCGXeqwzzeeUHKNOKvj/lgwQCFujJReuxiwZUW
yWgYjuvkq9bAOJgyrl01gCdhTAr6vgdYymop6BJCzar0EjbpXsG7PzvuOJt14hL9hUrp3qbCQtAI
08YNIqzaPYxz9vFqFFyfa8opHTsEyRsmbkWWqtMbuu7cyX/M50aVrj21te4hZRcfcaEZwTnklz8a
TGdvxMx3paipDpczVUzfzJeLy0jrhZIJPZt89SioG/GJBmyP9nJPHnu5sFMPCsr9FeSvRBJeZrgq
P8cNwKUmnfWYUBICHenJn4oIKDnxtA8qqjkuw3WewQYtrFLTd4STdj73tdMTlWUKyiNF64iiPwNx
fRiantlq4Qr1maPfcatmjmb0owzkm1EiXPQCL9qmlU7U9yd5CcXNLJh26xxwDoUa1XUMPWkCBGIp
zxK/F2KONP5femBSeVVq29NXqRYgyD1gQYvcHFEb32rRxhgGcn4eI+oHW6zcfRfJZDoHTiTaqnz1
WZQ=
=gyDE
-----END PGP SIGNATURE-----

--bK36Lq6QuzrM1V9nUcEX36mVIwQlohktF--

--===============0608299715==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0608299715==--
