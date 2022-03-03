Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847454CC713
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 21:31:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFA810F00F;
	Thu,  3 Mar 2022 20:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BDD10F00F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:31:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 354EFC8496
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 20:26:37 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D6AC91BF209;
 Thu,  3 Mar 2022 20:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646339192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OSOJ3kuQzCkZua/OeYAqnp+UFLiftx3F4xeTpKuHtx8=;
 b=bh6rpPVyHNxR10+DtwREKZgssQo0qhISq9txvfa6DW7D2wJbt+di9KAWOBOXsi0X/UJH5Z
 KEVi184duAp5nPl+TAO5XD1zInCfdm4Ej1JVMwpylVkWeYKZpBZFPxqqlCQFdoOwfAIl88
 YLd4iHcD6S9oB/rAe+fn6ls+TSJHg8JnF+Yd9V/fEM3O/5T1zxIVty8ML8iNRSsgg+J0Te
 ZXUd/Ekh+pmL++++c44edrw7PPgD9G+7gocrh6IuEZpDOHvS0yRW5Kze9gifHR2mUWsY1G
 FCrMheRjmqR4B8mLAxni7AT1E7mzxOM2Uc0mEkcv9VnBXXiXEiOlWqasii0krA==
Date: Thu, 3 Mar 2022 21:26:30 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v4] drm: of: Lookup if child node has panel or bridge
Message-ID: <YiEkaBO/lz05DkAD@aptenodytes>
References: <20220202160414.16493-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qKAQr4fJrEuSA+RI"
Content-Disposition: inline
In-Reply-To: <20220202160414.16493-1-jagan@amarulasolutions.com>
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
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amarula@amarulasolutions.com,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qKAQr4fJrEuSA+RI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jagan,

On Wed 02 Feb 22, 21:34, Jagan Teki wrote:
> Devices can also be child nodes when we also control that device
> through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
>=20
> drm_of_find_panel_or_bridge can lookup panel or bridge for a given
> device has port and endpoint and it fails to lookup if the device
> has a child nodes.

This patch breaks the logicvc drm driver that I'm currently developping.
The symptom is that drm_of_find_panel_or_bridge now always returns
-EPROBE_DEFER even after the panel has probed and is running well.
It seems that the function can no longer find the panel.

I haven't figured out the details, but reverting your patch makes
it work again. I suspect other drivers might be affected as well, so
it would probably be a good idea to revert the patch until the root
cause is clearly understood and the patch can be adapted accordingly.

Here is what the device-tree looks like:

/ {
	panel: panel-lvds {
		compatible =3D "panel-lvds";

		[...]

		port {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			panel_input: endpoint@0 {
				reg =3D <0>;
				remote-endpoint =3D <&logicvc_output>;
			};
		};
	};
};

&amba {
	logicvc: logicvc@43c00000 {
		compatible =3D "xylon,logicvc-3.02.a", "syscon", "simple-mfd";
		reg =3D <0x43c00000 0x6000>;

		#address-cells =3D <1>;
		#size-cells =3D <1>;

		[...]

		logicvc_display: display-engine@0 {
			compatible =3D "xylon,logicvc-4.01.a-display";

			[...]

			port {
				#address-cells =3D <1>;
				#size-ce/lls =3D <0>;

				logicvc_output: endpoint@0 {
					reg =3D <0>;
					remote-endpoint =3D <&panel_input>;
				};
			};
		};
	};
};

Cheers,

Paul

> This patch add support to lookup for a child node of the given parent
> that isn't either port or ports.
>=20
> Example OF graph representation of DSI host, which has port but
> not has ports and has child panel node.
>=20
> dsi {
> 	compatible =3D "allwinner,sun6i-a31-mipi-dsi";
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> 	port {
> 		dsi_in_tcon0: endpoint {
> 			remote-endpoint =3D <tcon0_out_dsi>;
> 	};
>=20
> 	panel@0 {
> 		reg =3D <0>;
> 	};
> };
>=20
> Example OF graph representation of DSI host, which has ports but
> not has port and has child panel node.
>=20
> dsi {
>         compatible =3D "samsung,exynos5433-mipi-dsi";
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>=20
> 	ports {
> 		#address-cells =3D <1>;
> 		#size-cells =3D <0>;
>=20
> 		port@0 {
> 			reg =3D <0>;
>=20
>                 	dsi_to_mic: endpoint {
>                         	remote-endpoint =3D <&mic_to_dsi>;
>                 	};
>                 };
>         };
>=20
>         panel@0 {
>                 reg =3D <0>;
>         };
> };
>=20
> Example OF graph representation of DSI host, which has neither a port
> nor a ports but has child panel node.
>=20
> dsi0 {
> 	compatible =3D "ste,mcde-dsi";
> 	#address-cells =3D <1>;
> 	#size-cells =3D <0>;
>=20
> 	panel@0 {
> 		reg =3D <0>;
> 	};
> };
>=20
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Changes for v4:
> - update comments and commit message
> Changes for v3:
> - updated based on other usecase where 'ports' used along with child
> Changes for v2:
> - drop of helper
> https://patchwork.kernel.org/project/dri-devel/cover/20211207054747.46102=
9-1-jagan@amarulasolutions.com/
> - support 'port' alone OF graph
> - updated comments
> - added simple code
>=20
>  drivers/gpu/drm/drm_of.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index 59d368ea006b..9d90cd75c457 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -249,6 +249,21 @@ int drm_of_find_panel_or_bridge(const struct device_=
node *np,
>  	if (panel)
>  		*panel =3D NULL;
> =20
> +	/**
> +	 * Devices can also be child nodes when we also control that device
> +	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> +	 *
> +	 * Lookup for a child node of the given parent that isn't either port
> +	 * or ports.
> +	 */
> +	for_each_available_child_of_node(np, remote) {
> +		if (of_node_name_eq(remote, "port") ||
> +		    of_node_name_eq(remote, "ports"))
> +			continue;
> +
> +		goto of_find_panel_or_bridge;
> +	}
> +
>  	/*
>  	 * of_graph_get_remote_node() produces a noisy error message if port
>  	 * node isn't found and the absence of the port is a legit case here,
> @@ -259,6 +274,8 @@ int drm_of_find_panel_or_bridge(const struct device_n=
ode *np,
>  		return -ENODEV;
> =20
>  	remote =3D of_graph_get_remote_node(np, port, endpoint);
> +
> +of_find_panel_or_bridge:
>  	if (!remote)
>  		return -ENODEV;
> =20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--qKAQr4fJrEuSA+RI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIhJHYACgkQ3cLmz3+f
v9FQpggAnC+9Vu+MTKOF5lbIfhAwANmGaaiTc7V+3btrmKbEQA7DkbZdBDiN+iwA
aJZOyWZpeM2ZMqgDAb71zqrlNZ0jOBFNGOLhgOGHQHCZ9vKnUrBd9VfnHiP1gs/i
JbBsNNbaOVjRq5i9pjG35muORiXSqnZRZ+8lZaUtSVyVWGSJquACCWJzc/cVjNyr
tyMUSxCACq4j1N8akExapLUc+PfUu/mhxNlCMxw8MhI8ikSIcM6vdp1aFw/VYRCH
DxjdsNRl68gjvNcFM9r3hW5OX1ZSYkcJ0MCQabBkDxTJPnVAwz+ud7LMvv9adRVA
ZbCIrk9W2fBhmBuRFZkjEvkv1W9K2w==
=a3nY
-----END PGP SIGNATURE-----

--qKAQr4fJrEuSA+RI--
