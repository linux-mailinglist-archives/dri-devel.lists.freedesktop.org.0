Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9751DED42
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 18:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728076E918;
	Fri, 22 May 2020 16:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254D6E918
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 16:29:05 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADB3720723;
 Fri, 22 May 2020 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590164944;
 bh=AZ6aR48aUG//ESbctyBmG+YOjGowh1YxgZdIw6aq6bI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s4FsV2uAqu/tX3pg7NewFoApyD7oEoZMnhAmmnKcl+3LRNhjjTs3275VGylctu3f1
 VIIKKiPn2SeIxaQfZeSKskq4enff164K3HACIxgju7ARsCEVTOOkAQ6sTcTGMSy5FX
 F6WMIvtZwCuLj5fXUKnSYt3O04BwosCqqhf4twPs=
Date: Fri, 22 May 2020 17:29:01 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Subject: Re: [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
Message-ID: <20200522162901.GP5801@sirena.org.uk>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
 <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
X-Cookie: C for yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, linux-kernel@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, thierry.reding@gmail.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: multipart/mixed; boundary="===============1394908231=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1394908231==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WZLuFERxa6Y0cbOt"
Content-Disposition: inline


--WZLuFERxa6Y0cbOt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2020 at 11:59:25PM +0800, dillon min wrote:

> but, after spi-core create a dummy tx_buf or rx_buf, then i can't get
> the correct spi_3wire direction.
> actually, this dummy tx_buf is useless for SPI_3WIRE. it's has meaning
> for SPI_SIMPLE_RX mode,
> simulate SPI_FULL_DUMPLEX

Oh, that's annoying.  I think the fix here is in the core, it should
ignore MUST_TX and MUST_RX in 3WIRE mode since they clearly make no
sense there.

--WZLuFERxa6Y0cbOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7H/c0ACgkQJNaLcl1U
h9Cejgf9HdcJ4wfZ4TAHuSVLhSZ1f3OnJd4SsU3i35KhZ712W6yrHngXy+nbYV4N
NhjTvvpDmzBo349gEEKpFG3dhTYbtS1kgzaVDbDeHh2B9M5YrRLkIYAjflSzwLeg
Yti6Jgi8Lx7rwmbBx7ACHi/MwbFhTgRxmebmW/EprvqsF+Q1LPKwoqZzgewibxLc
PHCGuWASzrD+VUARI8yApx4c0VvYevsCX3SqhAgEVABuyv5unCyrdK6feQ4pOe6j
AWVdgGrscUVgis28iFGnfmjKc72Ilct0g+jn6CcMAxcNH75lYFazRIihBrGTjh2j
TLYng7hGWV16ZT1d0tdphETvEKKG5A==
=R/O9
-----END PGP SIGNATURE-----

--WZLuFERxa6Y0cbOt--

--===============1394908231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1394908231==--
