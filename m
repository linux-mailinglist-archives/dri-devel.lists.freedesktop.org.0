Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E7EAD67C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 12:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977C289B06;
	Mon,  9 Sep 2019 10:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F243589B06
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2019 10:12:21 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46RkVN3cwBz9sNT;
 Mon,  9 Sep 2019 20:12:12 +1000 (AEST)
Date: Mon, 9 Sep 2019 20:11:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190909201159.778590a0@canb.auug.org.au>
In-Reply-To: <20190908141307.GA7115@pc-sasha.localdomain>
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
 <20190908141307.GA7115@pc-sasha.localdomain>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=canb.auug.org.au; s=201702; t=1568023938;
 bh=WtZHNMKTkVbJZEkFoiX0iM3pmN7GlX1AZgEOXkQakSg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wsyn3E/2zaHCW4VqxqI5PS+I/rnEAQQ5mbiObekuOF7KTH3V19YqcE9FlHOBbZP1v
 uwq8/fSubckISd2IBOi+fIPEeIlwEN52ulKt2TKMqtAErLXMStfx4Aj4pzNnx/0q3v
 mxJzHFvjhf3fI5+7JcA69D0p+jmetgPyqMMz8cCqzhsFZxSiZzW5yVuGY2MPhKoijf
 H8jowi5wc09wIhSfkFMgqUw5Aio4zoEFpAqh0fxJgVddxJ5aJKqbsfLJPQKGdt4o+e
 W28JDvL6PgoEVkhELNM+wKDDGh7tJg/y3RwF/xHk7Fw0pBJE/SwrorGkZRfC94o20g
 UyUIA8xDfrrIw==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, mripard@kernel.org,
 linux-next@vger.kernel.org, dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: multipart/mixed; boundary="===============1376138799=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1376138799==
Content-Type: multipart/signed; boundary="Sig_/x+8al_Rd8L9FcNKBXNLv=W/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Sun, 8 Sep 2019 17:13:07 +0300 Alexander Kapshuk <alexander.kapshuk@gmai=
l.com> wrote:
>
> This is my first bisect. Here's what I've tried so far and based on the
> output I got, I seem to be taken in the opposit direction.
>=20
> git bisect start
> git bisect bad				# 7dc4585e0378:next-20190903
> git bisect good next-20190730	#70f4b4ac1655

If you are bisecting linux-next, I will suggest bisecting between the stabl=
e branch on linux-next (which is just Linus' tree when I started that day) =
and the top of the first linux-next that fails.  (Assuming that the stable =
branch is good).

so

git bisect start
git bisect good stable
git bisect bad next-20190903

and go from there.  It will (unfortunately) be quite a few commits to test
:-(

--=20
Cheers,
Stephen Rothwell

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl12JW8ACgkQAVBC80lX
0Gxqigf+I6xbGgy1s4thi/M2FwgBiKiGnIOia6WQIG+D0OhL0OKh1/YfMema9pzH
zC2rO39vF53JVihv1MQRe1HfTEj7nMrZjm6BPziPwtFbKjw5f67qkXOr7YhUTx5c
msTgV9Y0yzD+LHDYBm+CI0Vd29CQmXmFa6UlAaTDFY83yOXAYLUJgvDyPeyWzb3K
6zWUbV9+VIAY2ygo/YMH+6fFhEMqUm2g4AbzLjatQmhNq9gpUzDRgPnAXqsUPWXY
i7IDti6k+CbGWwj4w+CtUYwNEm8fA3RzXWgKnF2BxbdpnAURulM0N7dCokblBE9X
Wy44jyqIFkp/d4fCxxQRX2+dtnxwSA==
=94Wb
-----END PGP SIGNATURE-----

--Sig_/x+8al_Rd8L9FcNKBXNLv=W/--

--===============1376138799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1376138799==--
