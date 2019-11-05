Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B24EFE43
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:24:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8502689487;
	Tue,  5 Nov 2019 13:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02BA89487
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 13:24:27 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iRyor-0006do-Cv; Tue, 05 Nov 2019 13:24:25 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 82747274301E; Tue,  5 Nov 2019 13:24:24 +0000 (GMT)
Date: Tue, 5 Nov 2019 13:24:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/tegra: Fix regulator_get_optional() misuse
Message-ID: <20191105132424.GC4500@sirena.co.uk>
References: <20191105125943.34729-1-broonie@kernel.org>
 <20191105131511.GA1609273@ulmo>
MIME-Version: 1.0
In-Reply-To: <20191105131511.GA1609273@ulmo>
X-Cookie: Genius is pain.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aOnwuuyE4wyeka4isg54SdffRlAcGItM8q6cpU4foXY=; b=ILeoy2nShNLSoUyw7JGnHEx4W
 umS1Xk4mc+Lw8gTBVKKF4lun0NofOAAmyhEVVETOLGSIS/QSkY+946TI2BIh/i0/UG8PT1bUFZjhJ
 MGPPXu2QbtmL38yk65en+yxpHhjdZSG83ReRq/Y4AQnjRp6spKorowrb5hSGIdujpQriQ=;
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
Cc: David Airlie <airlied@linux.ie>, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: multipart/mixed; boundary="===============0865554082=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0865554082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ALfTUftag+2gvp1h"
Content-Disposition: inline


--ALfTUftag+2gvp1h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 05, 2019 at 02:15:11PM +0100, Thierry Reding wrote:

> It is in fact optional in this case. This code remains solely for
> backwards compatibility with old DTBs because back at the time the VDD
> supply was associated with the DPAUX block where it should've really
> been associated with the eDP panel.

That should really have some documentation, and in any case would be
better implemented by using the supply_alias feature to remap the supply
to the panel device so that we're using the same code path when actually
managing the regulator either way.

--ALfTUftag+2gvp1h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3BeAcACgkQJNaLcl1U
h9DFjwf/RAQXnf6UefNspZqwTvn7CnHYgUtYc+g2j5Kqjfn3g/FDBqWQD13gmWHF
9+AfIWIUlHoWBrvfui7ntXOuaCTGh9s2Y4l1eGvdDob6DivSG8r10hm/jdBmcQTJ
RKfsnDp2+av42ywyLzRQe8rKAv2a/gtLTASRW9jZvkGoXgt58GGQAkjA5KZ/JvRx
wbZxOotjlzahabP8crRinylwFaPrDwlymRWGawY4BlemKyAD1FVpn6KRhvIgtLyd
OFezRot1Z8W2pLZpkC1MfcJlp8Zx0LJvxeUW098KPnqDi4a/TR4IcrEVSVw+uUqM
+HuQhTMXG8LfrVgi+hwGu8fldMXadQ==
=qReC
-----END PGP SIGNATURE-----

--ALfTUftag+2gvp1h--

--===============0865554082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0865554082==--
