Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F038D3C39
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:25:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30610E6D8;
	Wed, 29 May 2024 16:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ns2ZIr6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354AE10E6D8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:25:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A52E6166F;
 Wed, 29 May 2024 16:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79A2C116B1;
 Wed, 29 May 2024 16:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716999933;
 bh=XWTvgOpa/ROLa55P7YiVGDQAHxuXZkHUHPhWeWr2A8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ns2ZIr6VvO8DHPaypxlYrKfLH9G+32HhMEMwz/5JSbWg0D6qa4LfRSxhqKONCYa0R
 El5E2QewPGDcyBtgrGO4tkwMqTN+3Jkp4f7g57lV1+0mb/SSgaRIoCQ0TsIOuUugUv
 ee7i9V20WwHOmybWFY2JFqFiSMTAyw+jyguINTU0H+RDKDomlq1x0YEdX6wZy8B4I6
 U/brKIm/WxSoAKYHXNsoKaALvFcMjVN4mVCG5tfctZ17jIFlgw/Yf0EGjkDtN0V9I+
 9uwDykhAK3o4VunkJZ0BSmHGUaZSSqaHLNkYzJ96Vojh+b/yogx4ZSvfnX4gpTEa5j
 rxXvfmWYGvmqA==
Date: Wed, 29 May 2024 17:25:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [DO NOT MERGE v8 26/36] dt-bindings: ata: ata-generic: Add new
 targets
Message-ID: <20240529-arise-small-f3277feee4e4@spud>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <8ff46a90c7be5eea45984f60b9b0db99219c82e6.1716965617.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EwaFJRsUcMIAwW3R"
Content-Disposition: inline
In-Reply-To: <8ff46a90c7be5eea45984f60b9b0db99219c82e6.1716965617.git.ysato@users.sourceforge.jp>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--EwaFJRsUcMIAwW3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, May 29, 2024 at 05:01:12PM +0900, Yoshinori Sato wrote:
> Added new ata-generic target.
> - iodata,usl-5p-ata
> - renesas,rts7751r2d-ata
>=20
> Each boards have simple IDE Interface. Use ATA generic driver.
>=20
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Why do you keep dropping tags? Damien and I acked this back in v6 and
Krzysztof reminded you in v7:
https://lore.kernel.org/all/06fdb2cf7927681acf3099b826390ef75ba321af.170478=
8539.git.ysato@users.sourceforge.jp/
https://lore.kernel.org/all/53f85cc2e124d1c2e7394458b73293d797817d6d.171220=
7606.git.ysato@users.sourceforge.jp/

Dropping the tags just leads to wasted time re-reviewing patches that
already got approved. I don't see any valid reason to drop them on a
trivial patch like this :/ Please check back to previous revisions and
make sure that you picked up applicable tags.

Thanks,
Conor.

> ---
>  Documentation/devicetree/bindings/ata/ata-generic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/ata/ata-generic.yaml b/Doc=
umentation/devicetree/bindings/ata/ata-generic.yaml
> index 0697927f3d7e..1025b3b351d0 100644
> --- a/Documentation/devicetree/bindings/ata/ata-generic.yaml
> +++ b/Documentation/devicetree/bindings/ata/ata-generic.yaml
> @@ -18,6 +18,8 @@ properties:
>        - enum:
>            - arm,vexpress-cf
>            - fsl,mpc8349emitx-pata
> +          - iodata,usl-5p-ata
> +          - renesas,rts7751r2d-ata
>        - const: ata-generic
> =20
>    reg:
> --=20
> 2.39.2
>=20

--EwaFJRsUcMIAwW3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZldW7wAKCRB4tDGHoIJi
0rICAP9V1iNf3aedUZq4py3MAFbhxEMXF2XlH0Il+KuD+J/ZuAD9Eti+5ySYfFAX
cxCmNqYe51qJCuNdyoXp6/hLh6B1JwY=
=l0ak
-----END PGP SIGNATURE-----

--EwaFJRsUcMIAwW3R--
