Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F962D8AA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 12:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7984D10E07E;
	Thu, 17 Nov 2022 10:59:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9632F10E07E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:59:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE96A60BA6;
 Thu, 17 Nov 2022 10:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C113CC433D6;
 Thu, 17 Nov 2022 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668682794;
 bh=FTcXBVf4xKuIE7vas46JjAXZsr5dkNSkrqRgK59BR3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3aCJYHiEH9yeDG4sHk7/Z9AsxDyOnRrOuUaaPmyFhDe4xZ7640/EoC+qQ21H+kXH
 08J0YkV0AvOWwkIZgeORvNcR7+Thk9/gFhQ+j/07CgdiSiqgHT9sIkpbJnlNSmSYy7
 F0s+Lkp/tCo9flUPLLLEOsKv77nTk0+dt8r9HQwPWNuFFrKmTl0g1PmuMnTR1dHuFK
 +EIKV6Bz/yqgXNyld4b+aneK1HPLhq8HFjHJiNQnrXiCMqPg/W7GwFnmcAzJ9Q24D4
 g/OdUB4RLlrAVnEBDmQqm2/TGfn+5SaqpKMM4hfxrlG03xxcvz/cnqRwwzEEYNWBF6
 8Rz0l/MIOY8Kg==
Date: Thu, 17 Nov 2022 10:59:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH 3/3] spi: meson-spicc: Lower CS between bursts
Message-ID: <Y3YUJjSTI9U9qz59@sirena.org.uk>
References: <20221116-s905x_spi_ili9486-v1-0-630401cb62d5@baylibre.com>
 <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sVW5maJnbV5GYFNa"
Content-Disposition: inline
In-Reply-To: <20221116-s905x_spi_ili9486-v1-3-630401cb62d5@baylibre.com>
X-Cookie: Ego sum ens omnipotens.
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sVW5maJnbV5GYFNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 17, 2022 at 09:47:41AM +0100, Carlo Caione wrote:
> On some hardware (reproduced on S905X) when a large payload is
> transmitted over SPI in bursts at the end of each burst, the clock line
> briefly fluctuates creating spurious clock transitions that are being
> recognised by the connected device as a genuine pulses, creating an
> offset in the data being transmitted.

> Lower the GPIO CS between bursts to avoid the clock being interpreted as
> valid.

This is just plain broken, *many* SPI devices attach meaning to
chip select edges - for example register writes will typically
have the register address followed by one or more register values
for sequential registers.  Bouncing chip select in the middle of
transfer will corrupt data.  If the device can't handle larger
transfers it needs to advertise this limit and refuse to handle
them.

--sVW5maJnbV5GYFNa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2FCYACgkQJNaLcl1U
h9BA1Af9GvKfza2vtRbu0JnM9pTzjygGkt+vf4n801Z7oafMH+9AsCMpa4yyr7Dq
zhMWNsKInloF+p+FGqJUx6iky4xR83YXfpR1dzXn9xh27MNjYMSvH9MgbDLKKPyZ
TG+uVFrFsaus8eR7mzZw80l7KCiw6ypiGWh5o+qtO7UWGCVnbcwl1NeD0RDolNE+
tmRoPMEoZohX3XIGL5NGihK0buq/ZFq4EkrpUK7mfJ5kHSCwtX7O4ZR4SUI2VB8g
WiLut2anQJ/MgXPdHnhKdrY47fwGRDi3TCI88Le+mb2gc3iUAf4r1rdqviUnMps7
6nf/3APDiJ0vw09mztpBv8KT1ASrrg==
=atc7
-----END PGP SIGNATURE-----

--sVW5maJnbV5GYFNa--
