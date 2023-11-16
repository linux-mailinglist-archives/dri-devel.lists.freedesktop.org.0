Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938407EE4EC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 17:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E9010E628;
	Thu, 16 Nov 2023 16:06:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153D10E625
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 16:06:36 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>)
 id 1r3et1-0007qI-6r; Thu, 16 Nov 2023 17:06:35 +0100
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mkl@pengutronix.de>)
 id 1r3et0-009U4E-P8; Thu, 16 Nov 2023 17:06:34 +0100
Received: from pengutronix.de (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 (Authenticated sender: mkl-all@blackshift.org)
 by smtp.blackshift.org (Postfix) with ESMTPSA id 7B63624DF12;
 Thu, 16 Nov 2023 16:06:34 +0000 (UTC)
Date: Thu, 16 Nov 2023 17:06:34 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/5] drm/bridge: tc358762: Instruct DSI host to generate
 HSE packets
Message-ID: <20231116-tarantula-posing-b941e929b40d-mkl@pengutronix.de>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xqboflvdr2a56zih"
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-3-marex@denx.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xqboflvdr2a56zih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Marek,

On 15.06.2023 22:19:00, Marek Vasut wrote:
> This bridge seems to need the HSE packet, otherwise the image is
> shifted up and corrupted at the bottom. This makes the bridge
> work with Samsung DSIM on i.MX8MM and i.MX8MP.

I'm using v6.6 (which includes this series) on an i.MX8MP with the 7inch
Rspi Panel ("powertip,ph800480t013-idf02"), but I cannot get a stable
image.

With an unmodified imx8mp clock tree the lower 1/4 of the image sheers
to the left.

With 24.75 MHz on the media_disp1_pix and media_mipi_phy1_ref and 792
MHz on video_pll1_out, the image is not static, but wobbly and it's
wrapped around half of the image.

    video_pll1_ref_sel                1        1        0    24000000      =
    0     0  50000         Y
       video_pll1                     1        1        0   792000000      =
    0     0  50000         Y
          video_pll1_bypass           1        1        0   792000000      =
    0     0  50000         Y
             video_pll1_out           2        2        0   792000000      =
    0     0  50000         Y
                media_mipi_phy1_ref       1        1        0    24750000  =
        0     0  50000         Y
                   media_mipi_phy1_ref_root       0        0        0    24=
750000          0     0  50000         Y
                media_disp2_pix       0        0        0   792000000      =
    0     0  50000         N
                   media_disp2_pix_root_clk       0        0        0   792=
000000          0     0  50000         N
                media_disp1_pix       1        1        0    24750000      =
    0     0  50000         Y
                   media_disp1_pix_root_clk       1        1        0    24=
750000          0     0  50000         Y

Do you have a working device tree for such a setup? regards, Marc

Relevant DT snipped for my setup:

&{/} {
	panel {
		compatible =3D "powertip,ph800480t013-idf02";
		power-supply =3D <&attiny>;
		backlight =3D <&attiny>;

		port {
			panel_in: endpoint {
				remote-endpoint =3D <&bridge_out>;
			};
		};
	};
};

&mipi_dsi {
	samsung,esc-clock-frequency =3D <54000000>;
	assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>,
				 <&clk IMX8MP_VIDEO_PLL1_OUT>;
	assigned-clock-rates =3D <200000000>, <24750000>;
	status =3D "okay";

	bridge@0 {
		compatible =3D "toshiba,tc358762";
		reg =3D <0>;
		vddc-supply =3D <&attiny>;
		reset-gpio =3D <&attiny 0 0>;

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			port@0 {
				reg =3D <0>;

				bridge_in: endpoint {
					remote-endpoint =3D <&dsi_out>;
				};
			};

			port@1 {
				reg =3D <1>;

				bridge_out: endpoint {
					remote-endpoint =3D <&panel_in>;
				};
			};
		};
	};

	ports {
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		port@1 {
			reg =3D <1>;

			dsi_out: endpoint {
				data-lanes =3D <1 2>;
				remote-endpoint =3D <&bridge_in>;
			};
		};
	};
};

&media_blk_ctrl {
	assigned-clock-rates =3D <500000000>, <200000000>,
			       <0>, <0>, <792000000>;
};

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xqboflvdr2a56zih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmVWPgcACgkQvlAcSiqK
BOg3mAgArCxMpMsvngkM0SNNOAnHVHGlRVHe5rYI0oEQZEvycYex1ux/ArXvw5Zs
W02e1Oqed0k7EgUVZnUuGeRxvV0mncpiN5SZfoIS33a80WPHE/c+vl8VPo0Us1Kq
hfAcUfgGlI7eQ/siRkjGWVNwODQwosM+zQW9TpD9I9ogKFl4KddDai8F6J2B84Az
dVevq/+E0+hDOr1YYMcC86jeYbgPP6ZmfBW0PMaoW5TCiGN0zPrAG0xJx5nSu7ZU
/vU8EHgrci56XMNkAfb+KeAjMebKMTiDjzcoDKElPQVseHmQaiGOQWdK4Yy1/eEg
6KJ5SCeFAL+5EjBz5Fgs/nX+bM5MEw==
=XU2v
-----END PGP SIGNATURE-----

--xqboflvdr2a56zih--
