Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A1F1DE591
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 13:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A60F6E5CF;
	Fri, 22 May 2020 11:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F78A6E5CF
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 11:36:37 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6CF8206C3;
 Fri, 22 May 2020 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590147397;
 bh=z/6OXOepRElS/C2Gkk6RRZeDF9+60BoN0+lQKMHv4sc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SViwwqlJ87aevdHn4RYwBdrJnJkpk2rgiCE7e168UaD8MlGXvEupOGhOH7ejYfrbJ
 N3kZOSYajFR+FWCWBWyZDHjCeSTW6pHxtLB0BJj1sTzEGGQE0HGaQz/KalAcMtdjVw
 a7j7/Lewv8pBtYtgHXcvbty7bFHiOt4Q0y6gEdzA=
Date: Fri, 22 May 2020 12:36:34 +0100
From: Mark Brown <broonie@kernel.org>
To: dillon.minfei@gmail.com
Subject: Re: [PATCH v4 3/8] spi: stm32: Add 'SPI_SIMPLEX_RX', 'SPI_3WIRE_RX'
 support for stm32f4
Message-ID: <20200522113634.GE5801@sirena.org.uk>
References: <1589800165-3271-1-git-send-email-dillon.minfei@gmail.com>
 <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1589800165-3271-4-git-send-email-dillon.minfei@gmail.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org, sboyd@kernel.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, mcoquelin.stm32@gmail.com,
 sam@ravnborg.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, alexandre.torgue@st.com
Content-Type: multipart/mixed; boundary="===============0644016305=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0644016305==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HeFlAV5LIbMFYYuh"
Content-Disposition: inline


--HeFlAV5LIbMFYYuh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2020 at 07:09:20PM +0800, dillon.minfei@gmail.com wrote:

> 2, use stm32 spi's "In full-duplex (BIDIMODE=0 and RXONLY=0)", as tx_buf is
> null, we must add dummy data sent out before read data.
> so, add stm32f4_spi_tx_dummy() to handle this situation.

There are flags SPI_CONTROLLER_MUST_TX and SPI_CONTROLLER_MUST_RX flags
that the driver can set if it needs to, no need to open code this in the
driver.

--HeFlAV5LIbMFYYuh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7HuUEACgkQJNaLcl1U
h9DV4Qf/SihsJbdjpA046b8/NxOUN0XzKoBRryG9nf4DC4x3Fpb0tscXdk2/FeTd
JceAquzFzEEQ49acoXxDA2UQXUMtmlEiGfbWhNHS0Jwo9JVU3XPHLG5d+nX+sudU
L+O+LPQB61KcC2OQniMIjgApMjvyj2ePQY0lfjl1jnAb3PLHvlpaUt5Mjp8P0iVB
N2skbxjLqD/nDEDYXV+S0Jp689oOuNDJ/zeNk3ds99vhHEc55yvZxvZB8OcWNuop
AJ94iVaqJX+b7qak3V7Ts6Hb6GgkNvr/78bWpjGK5eB+a00Ia0l8yP9svyYdczOK
GS605iD0geP72ehzZUhOjifzaJ7rgg==
=XMsa
-----END PGP SIGNATURE-----

--HeFlAV5LIbMFYYuh--

--===============0644016305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0644016305==--
