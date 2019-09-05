Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BDAA915
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 18:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E929F6E05F;
	Thu,  5 Sep 2019 16:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EFF6E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 16:34:24 +0000 (UTC)
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5uiD-00053J-SL; Thu, 05 Sep 2019 16:34:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 175282742D07; Thu,  5 Sep 2019 17:34:21 +0100 (BST)
Date: Thu, 5 Sep 2019 17:34:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
Message-ID: <20190905163420.GD4053@sirena.co.uk>
References: <20190904123032.23263-1-broonie@kernel.org>
 <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
 <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
 <20190905124014.GA4053@sirena.co.uk>
 <93b8910d-fc01-4c16-fd7e-86abfc3cc617@arm.com>
MIME-Version: 1.0
In-Reply-To: <93b8910d-fc01-4c16-fd7e-86abfc3cc617@arm.com>
X-Cookie: You humans are all alike.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZAP4dBUwNvF31JJCVYPj21XLRrWDYvgUrqBRmt8DcDE=; b=hsBj26+0w9LJlDJX5zkkEFrAg
 Sn4pMSUj958UFFJMPEuKQna0DD71l/bJ4jFnZ4xneMBDw07Q0k2jlc4W5Kn18peibSbsPU0Qt0r/M
 Z7udtZu8eRhlBRNm9PwO5OqS6i7KkbPrB/p+YnUjLMjHRaFZYtcr91H3XyPyjNUeTWFCE=;
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1293311820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1293311820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2FkP9tdjPU2nyhF"
Content-Disposition: inline


--a2FkP9tdjPU2nyhF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 02:02:38PM +0100, Steven Price wrote:
> On 05/09/2019 13:40, Mark Brown wrote:

> > Is that safe?  You can't rely on being able to change voltages even if
> > there's a physical regulator available, system constraints or the
> > results of sharing the regulator with other users may prevent changes.

> Perhaps I didn't express myself clearly. I mean that in the case of the
> Hikey960 it would be convenient to have a "dummy regulator" that simply
> accepted any change because ultimately Linux doesn't have direct control
> of the voltages but simply requests a particular operating frequency via
> the mailbox.

There's more platforms than just HiKey supported here though, I'm pretty
sure some of them don't have the regulator under firmware control (and
HiKey doesn't seem to have this device enabled upstream at all?).

> > I guess at the minute the code is assuming that if you can't vary the
> > regulator it's fixed at the maximum voltage and that it's safe to run at
> > a lower clock with a higher voltage (some devices don't like doing that).

> No - at the moment if the regulator reports an error then the function
> bails out and doesn't change the frequency.

I'm talking about the case where you didn't get a regulator at all where
it won't even try to set anything (ie, current behaviour).

> > I do note that the current code requires exactly specified voltages with
> > no variation which doesn't match the behaviour you say you're OK with
> > here, what you're describing sounds like the driver should be specifying
> > a voltage range from the hardware specified maximum down to whatever the
> > minimum the OPP supports rather than exactly the OPP voltage.  As things
> > are you might also run into voltages that can't be hit exactly (eg, in
> > the Exynos 5433 case in mainline a regulator that only offers steps of
> > 2mV will error out trying to set several of the OPPs).

> Perhaps there's a better way of doing devfreq? Panfrost itself doesn't
> really care must about this - we just need to be able to scaling up/down
> the operating point depending on load.

The idiomatic thing for this sort of usage would be to set the voltage
to a range between the minimum voltage the OPP can support and the
maximum the hardware can support.  That's basically saying "try to set
the voltage to the lowest thing between this minimum and maximum" which
seems to be about what you're asking for here.

> On many platforms to set the frequency it's necessary to do the dance to
> set an appropriate voltage before/afterwards, but on the Hikey960
> because this is handled via a mailbox we don't actually have a regulator
> to set the voltage on. My commit[1] supports this by simply not listing
> the regulator in the DT and assuming that nothing is needed when
> switching frequency. I'm happy for some other way of handling this if
> there's a better method.

> At the moment your change from devm_regulator_get_optional() to
> devm_regulator_get() is a regression on this platform because it means
> there is now a dummy regulator which will always fail the
> regulator_set_voltage() calls preventing frequency changes. And I can't
> see anything I can do in the DT to fix that.

Like I say that system doesn't have any enablement at all for thse
devices upstream that I can see, the only thing with any OPPs is the
Exynos 5433 which does have a regulator.

The simplest thing to do what you're trying to do inside the driver is
the approach I suggested in my previous mail with checking to see what
voltages are actually supported on the system and do something with
that information, I'd recommend eliminating individual OPPs if some are
supported or just never doing any regulator configuration if none can be
set.

However you're probably better off hiding all this stuff with the
generic OPP code rather than open coding it - this already has much
better handling for this, it supports voltage ranges rather than single
voltages and optional regulators already.  I'm not 100% clear why this
is open coded TBH but I might be missing something, if there's some
restriction preventing the generic code being used it seems like those
sohuld be fixed.

In the short term I'd also strongly suggest adding documentation to the
code so it's clear that there's some intentionality to this, at the
minute it does not appear at all intentional.

--a2FkP9tdjPU2nyhF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1xOQwACgkQJNaLcl1U
h9C9QQf/WGTGTJRj3jwUDw92Aky2sWURbEACxMg0OER49fGjoSLZHNAP3azn5D9u
NXJbucWZ2h7vD4nBCd1NKI26XV0jneXvhkqSFCkzr398hB9lLuN1xWTJmsXDxq6e
2FPJryKgvipHrQziIrlkACbqDXDixoeQyZqQZuNYiEXCCQTVB8xjWsIECYebQ7tN
as2X/lPFU6IyKzdavIWw7UYKi/+RL4nL8z1TycgT1L8QjKmmbjj/94QdcXrK/T6h
CaelahRm0nETWOsgWUln1wWPK7C+H5CDJlFqxWpiWKm04yPL+BdmWo9t9Wim4bkj
mumvg57YRLi4iwhj/aAJyNju9XaAAA==
=9OEU
-----END PGP SIGNATURE-----

--a2FkP9tdjPU2nyhF--

--===============1293311820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1293311820==--
