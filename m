Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4D1C0255B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 18:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E97C10E920;
	Thu, 23 Oct 2025 16:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ssc1LJJh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE0910E920
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 16:11:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C255640E6;
 Thu, 23 Oct 2025 16:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDB9C4CEE7;
 Thu, 23 Oct 2025 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761235880;
 bh=vtdnEujN+5EGnXsa9gZxRMk9lx4CqDUgeqYrAsdXB3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ssc1LJJhPTSzQlQIdEbHNwBQs+Nj+JtVa+41YYR8nUtpbe7NP2c2/L0ZHnFagoAkY
 fkxKK51zWvnrYitxyZVma56B8wnQoRiMS8r3H/D13rPv7bbQGWSYsTxtfb9fWmQ81/
 zE5SzCYZ8OK5hRrZwDBQ4GnPClgOPkpBk9XmWfT5z7BsCZ6m/ogNHVM/0YLaf0jI+R
 WXam7+ZXifG2u8TkCxJCPaOkHTD4Fldqj7Q43VP4wl4A7bWM58mHLWf90SFFIwzKCL
 tssxsFSqXD0sHvJu3hoxlyz0PAm1L1/nts8x3xb0z1psl5G9X2mHuEymyUDMfzh9op
 3O4Rjd3dIwa4w==
Date: Thu, 23 Oct 2025 18:11:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 
 Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Georgi Djakov <djakov@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Joerg Roedel <joro@8bytes.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Lee Jones <lee@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 dmaengine@vger.kernel.org, 
 linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-media@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <4iitvr64hrxoj6pwl32bvd7erc3uwfp5pcfiunpumhskzpnmph@g3xhro7zb5qa>
References: <20251023143957.2899600-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vogfejml6xdyeipj"
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>
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


--vogfejml6xdyeipj
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
MIME-Version: 1.0

Hello Rob,

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
>  .../devicetree/bindings/pwm/allwinner,sun4i-a10-pwm.yaml     | 1 -

I have nothing pending for this file, and even if, any conflict is
likely trivial. So feel free to take this change via your tree.

Acked-by: Uwe Kleine-K=F6nig <ukleinek@kernel.org> # for allwinner,sun4i-a1=
0-pwm.yaml

Best regards
Uwe

--vogfejml6xdyeipj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmj6U6MACgkQj4D7WH0S
/k4RaAf/fCWD+WfbVDOAhcR/7epkQB2tQn+JLBXBxasNnAoyAylmxOooXhE4hfhj
SU4fMYQlp3veFvx5y8tNYc3sFcgDQf67pKLQT0G8IVx8zxkZemL6SxFJi1IwFKSA
Q/8MhcPqloQ11C2d/hakVfGh6b/qfDRIdDpJYesPgIQF3Qt9HUGchUGWkxhugoca
iKITZ2Yf10aMr9chCSazkIHNX2Hpv2qXMJM2tCZXcgHCMhN2AYn+qtsfpBxVz3H7
cSqvL+mtqXvx0TwEX2G/SfX1f8Jeh3qKN82uS6IJt+tR/Dgs5uIlxJz5h+dIZ3cW
Mtoip3h3HRFtcP+gNdXc333IYQ0g3A==
=azcw
-----END PGP SIGNATURE-----

--vogfejml6xdyeipj--
