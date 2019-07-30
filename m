Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF47A919
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 15:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC4A6E4E8;
	Tue, 30 Jul 2019 13:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747386E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 13:00:53 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hsRkG-0007Vi-CY; Tue, 30 Jul 2019 13:00:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 80F6C2742CB5; Tue, 30 Jul 2019 14:00:47 +0100 (BST)
Date: Tue, 30 Jul 2019 14:00:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: Re: next/master boot: 265 boots: 17 failed, 184 passed with 64
 offline (next-20190730)
Message-ID: <20190730130047.GC4264@sirena.org.uk>
References: <5d403574.1c69fb81.14163.65d3@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <5d403574.1c69fb81.14163.65d3@mx.google.com>
X-Cookie: Times approximate.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R/SyRq6FyELxtxiORJjLbvIf0Y67FRULyN5eHL7APCE=; b=TSc8MgeA+4AglHkUpwuoCE7yM
 Ekffh0gSHlCpNHED7yw8ZuR+jj/bX5/Fxlmx51J4EUuFni/t6CBKgn37C2b81hRIHf69fQzhnoKOX
 z7FsljtFmaxza50MuxWymGgWOMNMtMTPSMC245xt1EMr5lBk2ClcAlibc4MoBl/KALxH8=;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: kernel-build-reports@lists.linaro.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1715351966=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1715351966==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline


--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2019 at 05:17:56AM -0700, kernelci.org bot wrote:

The previously reported issues with booting -next on
meson-gxm-khadas-vim2 are still present today, though seemingly only
manifesting with CONFIG_RANDOMIZE_BASE and not defconfig (there are
failures with big endian too but they don't look device specific):

> arm64:

>     defconfig+CONFIG_RANDOMIZE_BASE=y:
>         gcc-8:
>             meson-gxm-khadas-vim2: 1 failed lab

It looks like it gets to userspace and then hangs (end of the log
below).  More details at:

	https://kernelci.org/boot/id/5d40069859b5148b3931b2bf/

The last message in the log indicates it was initializing the Panfrost
driver:

08:53:47.332143  <6>[   15.172833] panfrost d00c0000.gpu: clock rate = 666666666
08:55:40.299880  ShellCommand command timed out.: Sending # in case of corruption. Connection timeout 00:04:14, retry in 00:02:07

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1AP34ACgkQJNaLcl1U
h9Csfwf/XsFzkhd2FswYbeGTTmMLf9k5KdI/kIbIqm9iw0JA6z8okdcGhwiUIRXA
fzrZI0iAXkijMLlUHPHWuNZYRu1zra5/a6jxxP01F8SoYCl88urfZ4sTBkQdAunE
1Gvu8vgxkkqxfHMaEldGMEaKu6xHh7vyYW+XjHJ1XWAeiMZYbL25GoSER+EH5XOy
4T/7RglA/lKrz96R2q4femYzT2Mb/f1//gmaXyu0m15yDSNd7aNPy8aTgEpNoNgL
3E8XMKtSJ0/lNFZPOgSah808rAqOr2wEM+V7DEJ13mCDrXyJS4HWmvGKN6VwZUq2
RMk9zVuGeA0v09fh8Q5dU8pOWF+9Cw==
=N+Ek
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--

--===============1715351966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1715351966==--
