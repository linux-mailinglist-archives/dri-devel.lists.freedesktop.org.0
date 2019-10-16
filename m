Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9970D9DB1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 23:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A5AD6E431;
	Wed, 16 Oct 2019 21:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634A56E431
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 21:49:25 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iKrAV-0006KC-UE; Wed, 16 Oct 2019 21:49:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id EB915274325C; Wed, 16 Oct 2019 22:49:18 +0100 (BST)
Date: Wed, 16 Oct 2019 22:49:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH] spi: pxa2xx: Set controller->max_transfer_size in dma mode
Message-ID: <20191016214918.GA11473@sirena.co.uk>
References: <20191016195721.3714-1-daniel.vetter@ffwll.ch>
 <36610873-fa30-a286-d05c-5eceb3cbcb57@tronnes.org>
MIME-Version: 1.0
In-Reply-To: <36610873-fa30-a286-d05c-5eceb3cbcb57@tronnes.org>
X-Cookie: Auction:
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZufvcA61v5agVfmRZclKpGS8RTRtaYHF1QkCoX0ETPs=; b=l51SxgSoH+eyfT2mm1rmGeBDT
 yhHObXSSp07I53kvAtlsoaAsFbOHIxbXQ+5WvPbqdFhqeM5Btng1ceKWOY/GqEEy2ZUfVTEoxRXTa
 1c+E9q1JTFuFWhzN0HvBdTIi9uijXihuIrT+FpqUqznByX6wziQTTDR7YCaC4sXshvUbk=;
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
Cc: linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Mack <daniel@zonque.org>
Content-Type: multipart/mixed; boundary="===============1527627776=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1527627776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 11:30:51PM +0200, Noralf Tr=F8nnes wrote:

> As Andy mentioned, ->max_transfer_size is a callback:

> struct spi_controller {
> 	/*
> 	 * on some hardware transfer / message size may be constrained
> 	 * the limit may depend on device transfer settings
> 	 */
> 	size_t (*max_transfer_size)(struct spi_device *spi);

> (I looked at its users and they all return a static or probe time value
> so not sure why it's a callback.)

Huh, I wonder why we did that...  I can't find any clear record, and
like you say nothing is using it so we should probably fix it - however
that's best done separately to this :/  Sorry for the confusion, I
didn't register what Andy was saying as being pointing out the current
state of the code.

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2nkF4ACgkQJNaLcl1U
h9A+Pwf/W+TqlKqBacstyeP18KY0oRQ7ySrj544UYjH8VdN93ZMgWCSCZ5FgL9tv
APkLEB1mXcpDeqLbLHKrNBS+8yMpCzqOVIYjmA1COIRm627P28BGBF1IKaFaPg2N
fjG5vu2nWcgpCjPneFPOdCP0RLEiRd0qWLCbPv4VpKJpYHK4U44/m7bN8iuM9cHB
Chd4H3kndisVKQXkwsAT6emauaPLaf17Hbhovoar5TlHECfIwOYKanPDPIYqgol6
uOFs93BJbfky2Wj5rbCNh1F6T2zKpG8ctOvrPrDVvNcVF2vv0+EIlESSGM+aON42
h/DQKS+S9hNCPnEKRtbjv++nzuZbow==
=+n2p
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============1527627776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1527627776==--
