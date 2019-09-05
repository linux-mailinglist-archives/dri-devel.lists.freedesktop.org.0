Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE34AA35F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 14:40:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3EB789CBC;
	Thu,  5 Sep 2019 12:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 86981 seconds by postgrey-1.36 at gabe;
 Thu, 05 Sep 2019 12:40:19 UTC
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D089BB0
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 12:40:19 +0000 (UTC)
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5r3g-0004X8-0K; Thu, 05 Sep 2019 12:40:16 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0F1422742D07; Thu,  5 Sep 2019 13:40:14 +0100 (BST)
Date: Thu, 5 Sep 2019 13:40:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] drm/panfrost: Fix regulator_get_optional() misuse
Message-ID: <20190905124014.GA4053@sirena.co.uk>
References: <20190904123032.23263-1-broonie@kernel.org>
 <CAL_JsqK8hn8aHa0e-QhT5=dMqCd0_HzNWMHM1YbEC_2z8n-tXg@mail.gmail.com>
 <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
MIME-Version: 1.0
In-Reply-To: <feaf7338-9aa1-5065-7a83-028aeadd5578@arm.com>
X-Cookie: You humans are all alike.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T3FCFMN2z9Bt1GK8k3lpSyj2uENPY0dUEXr7VygNtFI=; b=G2bixAfMhR1u99XuvPXclaQZA
 EDcHSToBuaWXxAm/tT74GMleq2mBrO1d4/MaIah/qObMNDAFDiAslubrLpAaKnCUIsPZNU42io1u8
 EAOo7eDdGzWpvlL6oX+L22CxJLkFbFdHtCzvNTcFWOrnLlJwCVLxEspaRDt7lU5ZVJ0WI=;
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
Cc: David Airlie <airlied@linux.ie>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1796057387=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1796057387==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 10:37:53AM +0100, Steven Price wrote:

> Ah, I didn't realise that regulator_get() will return a dummy regulator
> if none is provided in the DT. In theory that seems like a nicer
> solution to my two commits. However there's still a problem - the dummy
> regulator returned from regulator_get() reports errors when
> regulator_set_voltage() is called. So I get errors like this:

> [  299.861165] panfrost e82c0000.mali: Cannot set voltage 1100000 uV
> [  299.867294] devfreq devfreq0: dvfs failed with (-22) error

> (And therefore the frequency isn't being changed)

> Ideally we want a dummy regulator that will silently ignore any
> regulator_set_voltage() calls.

Is that safe?  You can't rely on being able to change voltages even if
there's a physical regulator available, system constraints or the
results of sharing the regulator with other users may prevent changes.
I guess at the minute the code is assuming that if you can't vary the
regulator it's fixed at the maximum voltage and that it's safe to run at
a lower clock with a higher voltage (some devices don't like doing that).
If the device always starts up at full speed I guess that's OK.  It's
certainly in general a bad idea to do this in general, we can't tell how
important it is to the consumer that they actually get the voltage that
they asked for - for some applications like this it's just adding to the
power saving it's likely fine but for others it might break things.

If you're happy to change the frequency without the ability to vary the
voltage you can query what's supported through the API (the simplest
interface is regulator_is_supported_voltage()).  You should do the
regulator API queries at initialization time since they can be a bit
expensive, the usual pattern would be to go through your OPP table and
disable states where you can't support the voltage but you *could* also
flag states where you just don't set the voltage.  That seems especially
reasonable if no voltages in the range the device supports can be set.

I do note that the current code requires exactly specified voltages with
no variation which doesn't match the behaviour you say you're OK with
here, what you're describing sounds like the driver should be specifying
a voltage range from the hardware specified maximum down to whatever the
minimum the OPP supports rather than exactly the OPP voltage.  As things
are you might also run into voltages that can't be hit exactly (eg, in
the Exynos 5433 case in mainline a regulator that only offers steps of
2mV will error out trying to set several of the OPPs).

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1xAisACgkQJNaLcl1U
h9Dktwf/cU2P46lDZKOxus22wJ39FsrKnSMmarYUxJuVwMOvHiUCedJgRxcjMSJG
8qxD91/c5mLJn2adGdZx/3Wrf0RbY/EEjpk/Ru3sbFl/LEow2OwsAWLG9U/RBmJV
GfPwPTRgCOcKIJIEnrCkJV/XjaJhVdAQ6akUaOQtE8N5/+UAgi1qnmDkwndsLPcJ
SPvfK7oVN4/xtwxmwomTqz92oCIlcfwubjEl07jZB/DZARaN6LjhGFj18aHSiZqM
HV/6gNWaxeVMUpQktnuKzW5fGhAPmutN/+67cx0S9pUXIOeHENz8pE/H9RGeLKo0
oiXGbcDp/ied1I8DHJF8j5PiQ0qUdw==
=aLW0
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--

--===============1796057387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1796057387==--
