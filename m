Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5C1E0D8A
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 13:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBC889949;
	Mon, 25 May 2020 11:43:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC80089949
 for <dri-devel@lists.freedesktop.org>; Mon, 25 May 2020 11:43:38 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36CE020723;
 Mon, 25 May 2020 11:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590407018;
 bh=ohGuMmEbw6jcckmjGuy7SWze+kKppKGgRxKK0h8JEr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KM80Gu8HAcmZ1l6c68I4DnrdiD57M88zpiXWycjvRd03XGvrbG2HqVCawIo5VHm3F
 HJEWyIi+trARwAOz28eZPsmxmVUJW4EKfcNfq4Cq0gz0TOCHmckoj6KzZVgbzVQc1z
 SfCVNxC1mpxzGiTSEs5yrLbejv0JMu2jkSzODsaQ=
Date: Mon, 25 May 2020 12:43:36 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon min <dillon.minfei@gmail.com>
Subject: Re: [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
Message-ID: <20200525114336.GD4544@sirena.org.uk>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
 <20200522113634.GE5801@sirena.org.uk>
 <CAL9mu0LAnT+AfjpGs0O-MD2HYrpnQRmrj6qXtJQrJi9kbQLPUw@mail.gmail.com>
 <CAL9mu0JZ4Qy+m2oF9TSTRqA_mM0J89huCt3t_Gs7qHa=3LxhBw@mail.gmail.com>
 <20200522162901.GP5801@sirena.org.uk>
 <CAL9mu0+E5R0mDUW3f+aKpfE_457VimS-ow2z_xVOmCfCAMnKuA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAL9mu0+E5R0mDUW3f+aKpfE_457VimS-ow2z_xVOmCfCAMnKuA@mail.gmail.com>
X-Cookie: Help a swallow land at Capistrano.
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
Content-Type: multipart/mixed; boundary="===============1272026137=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1272026137==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline


--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 23, 2020 at 09:35:06AM +0800, dillon min wrote:

> -       if (ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) {
> +       if ((ctlr->flags & (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX)) &&
> +               !(msg->spi->mode & SPI_3WIRE)) {
>                 max_tx = 0;
>                 max_rx = 0;

> for my board, lcd panel ilitek ill9341 use 3wire mode, gyro l3gd20 use
> simplex rx mode.
> it's has benefits to l3gd20, no impact to ili9341.

> if it's fine to spi-core, i will include it to my next submits.

Yes, looks reasonable.

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Lr2cACgkQJNaLcl1U
h9Czfgf5AZokYX+RDns/ATZTiNwwtWO8zgdUKtvU2B95mvVnSoH/+u22jEMjyBEV
VTql9iv86CkoWuw8ClYb6Ii3VcZhJlMJjs6f6TPlihKzhOKSAvVrUwf0GXQlWaS5
+uyF6imcop10LBRU7tKfWP+LpK90XFTt8wGtpnHqquhnlvs4zDEFu/Yvp91raDXu
FfWKf+2Aqu7xuWMGdHJjF/SiRINbFZVw70Rv9GM06ywcTkThXhrKpn5z4fCdWlEQ
iDy1RvrcqNwjm9MtAgYmwoOF/NVEcZaygAE11tHi6JOjrXYW+29jJRQDn4N06CZZ
tIaKNPu+scagmjfGwKU2PSW4mVUAuA==
=Yagp
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--

--===============1272026137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1272026137==--
