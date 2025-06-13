Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A25AD8A14
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 13:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8156B10E98F;
	Fri, 13 Jun 2025 11:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g4kKdw9S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67710E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 11:12:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F25544A96D;
 Fri, 13 Jun 2025 11:12:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE8AC4CEF1;
 Fri, 13 Jun 2025 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749813156;
 bh=3JSffdcKG1BEdfLxDkvCLXE5WcpkgQe1rrYaCHuFNrw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g4kKdw9SM2bno1fEAUiCi6mw5ZmG2oOwM9TdgZeIyT1IQbX7X77HcJ1LYqfuskboa
 JGRT3GgKJU7HfdKVHhEwM6RbZVBVlK/P5c4ZU4IqGpHDoM9jVWM/ytqZuhOEoKayrO
 xTsq76VB+ZzyRppRpOMFJJN6JOHbjdwagkrEFx3Ng0/lhqAyAceklyVmJaQug8641Q
 JSHHo90KaBC05xuTm1/zTU/9LwbDwYf8mzg7yZYfDEuuM89nlEVvUy9Ws3qrTN5xaj
 +W1kJlaU5hXI6P9GIWNe9FGwWwkVeh7uwqDhoiXxU9TaeL0RzbPSSxvPd6dZscVPeL
 2OG33FATjlbqg==
Date: Fri, 13 Jun 2025 12:12:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 14/20] ASoC: rockchip: i2s-tdm: switch to
 HWORD_UPDATE_CONST macro
Message-ID: <f38ea320-8eaa-4eea-85c1-63d44c8d359a@sirena.org.uk>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-14-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EoywhozqJ8iTP5HR"
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-14-f4afb8f6313f@collabora.com>
X-Cookie: Use extra care when cleaning on stairs.
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


--EoywhozqJ8iTP5HR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 08:56:16PM +0200, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
>=20
> Replace the implementation of this driver's HIWORD_UPDATE macro with an
> instance of HWORD_UPDATE_CONST. The const variant is chosen here because
> some of the header defines are then used in initializers.

Acked-by: Mark Brown <broonie@kernel.org>

--EoywhozqJ8iTP5HR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMB5YACgkQJNaLcl1U
h9Bobgf/dsPkAlIpLO/GS4oVRLlRiPIWa/agIoUuXFfDugqesR7MdX12gZHAzJ9s
BnznMlPSuOjDnlFPdVpRCgVr4iPfs88ixFAuy/SjKEjvV8VYAUBEs1sg2JykJyMZ
SkQ69/Iii/uButuWqecqljEHZvL7j67axT7KsEimeZ1zynLexrz7vtE6t4P8p+YE
7qrc1oKA5kjXrIug8enyLvuLzI75M7MfzuRaooCPej44mc4bjqpuH6zXCxPzAWt9
0LEzYDn7kdMZ5Yn0Vp35b8uKRqPdQs1heacEsmiHmKPfvnY/klYg1G9M71t9OVpm
EE2sy3C4QrYbYl73/UBH9Z7zoN/X2A==
=9PDr
-----END PGP SIGNATURE-----

--EoywhozqJ8iTP5HR--
