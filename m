Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA5718872A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA576E4F1;
	Tue, 17 Mar 2020 14:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E5A6E42B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 12:54:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6C502AB64;
 Mon, 16 Mar 2020 12:54:31 +0000 (UTC)
Message-ID: <9d8e1679b755940d85c95d5df8714d4bb3505cdc.camel@suse.de>
Subject: Re: [PATCH 86/89] drm/vc4: hdmi: Adjust HSM clock rate depending on
 pixel rate
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Eric Anholt <eric@anholt.net>
Date: Mon, 16 Mar 2020 13:54:29 +0100
In-Reply-To: <abf64b907cd23488e06d2aca4991ac1be216ec8f.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <abf64b907cd23488e06d2aca4991ac1be216ec8f.1582533919.git-series.maxime@cerno.tech>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0976087856=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0976087856==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-2Nhzgdng4j8pr0d0VEie"


--=-2Nhzgdng4j8pr0d0VEie
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maxime,
On Mon, 2020-02-24 at 10:07 +0100, Maxime Ripard wrote:
> @@ -1460,6 +1456,7 @@ static int vc4_hdmi_dev_remove(struct platform_devi=
ce
> *pdev)
>  }
> =20
>  struct vc4_hdmi_variant bcm2835_variant =3D {
> +	.max_pixel_clock	=3D 148500000,

Just a reminder this might change in the close future:
https://www.spinics.net/lists/arm-kernel/msg793013.html

Regards,
Nicolas
j
>  	.audio_available	=3D true,
>  	.cec_available		=3D true,
>  	.registers		=3D vc4_hdmi_fields,
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdm=
i.h
> index cbb1d3ab85d7..ee9753255b68 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.h
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
> @@ -38,6 +38,9 @@ struct vc4_hdmi_variant {
>  	/* Set to true when the CEC support is available */
>  	bool cec_available;
> =20
> +	/* Maximum pixel clock supported by the controller (in Hz) */
> +	unsigned long long max_pixel_clock;
> +
>  	/* List of the registers available on that variant */
>  	const struct vc4_hdmi_register *registers;
> =20


--=-2Nhzgdng4j8pr0d0VEie
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl5vdwUACgkQlfZmHno8
x/5Emwf/c9TYjBffVgvOA41mykLV4Nr8lGqYlbGeCSqOkIJClpTw0XDG/Sam289n
NVS5OpnsEXJWm2HMrWgVqYqZHb3E609pjVeibMyMUhBIvounfpp5kiGI0ZUfCm68
+JarBt0WtkW+731jvBxEnmfWB5j8FpHiZrSJkU5Eo7C7OhIHEAXvU+ZH6TdPqll6
Zjic3+8SBELK0JfFzgB6qkVWFT4UBVpxQ53sokDF+NGROgOEdUkHWxivw9SGvFsg
ewD3v2fbRdUNVTXI/9htZH4I/lupf3byyRQRnx8IWrzI/1U3NzY1xiHU3qEKUW3Q
DQNY46wnSbAgfaRuOCuI0lgcGztljw==
=xZA/
-----END PGP SIGNATURE-----

--=-2Nhzgdng4j8pr0d0VEie--


--===============0976087856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0976087856==--

