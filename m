Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DDA136168
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 20:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA936E95D;
	Thu,  9 Jan 2020 19:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9523C6E95D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 19:49:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2264531B;
 Thu,  9 Jan 2020 11:49:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CFEA3F534;
 Thu,  9 Jan 2020 11:49:31 -0800 (PST)
Date: Thu, 9 Jan 2020 19:49:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator
 for the GPU
Message-ID: <20200109194930.GD3702@sirena.org.uk>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-5-drinkcat@chromium.org>
 <20200108132302.GA3817@sirena.org.uk>
 <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
 <09ddfac3-da8d-c039-92a0-d0f51dc3fea5@arm.com>
 <20200109162814.GB3702@sirena.org.uk>
 <a40baddb-cbab-d8fc-3fd9-0582f1b5b24e@arm.com>
MIME-Version: 1.0
In-Reply-To: <a40baddb-cbab-d8fc-3fd9-0582f1b5b24e@arm.com>
X-Cookie: Killing turkeys causes winter.
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1931812937=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1931812937==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline


--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 09, 2020 at 04:53:02PM +0000, Steven Price wrote:
> On 09/01/2020 16:28, Mark Brown wrote:
> > On Thu, Jan 09, 2020 at 02:14:42PM +0000, Steven Price wrote:

> > > I'm not sure if it's better, but could we just encode the list of
> > > regulators into device tree. I'm a bit worried about special casing an
> > > "sram" regulator given that other platforms might have a similar
> > > situation but call the second regulator a different name.

> > Obviously the list of regulators bound on a given platform is encoded in
> > the device tree but you shouldn't really be relying on that to figure
> > out what to request in the driver - the driver should know what it's
> > expecting.

> From a driver perspective we don't expect to have to worry about power
> domains/multiple regulators - the hardware provides a bunch of power
> registers to turn on/off various parts of the hardware and this should be
> linked (in hardware) to a PDC which sorts it out. The GPU/PDC handles the
> required sequencing. So it *should* be a case of turn power/clocks on and
> go.

Ah, the well abstracted and consistent hardware with which we are all so
fortunate to work :) .  More seriously perhaps the thing to do here is
create a driver that provides a soft PDC and then push all the special
case handling into that?  It can then get instantiated based on the
compatible or perhaps represented directly in the device tree if that
makes sense.

> However certain integrations may have quirks such that there are physically
> multiple supplies. These are expected to all be turned on before using the
> GPU. Quite how this is best represented is something I'm not sure about.

If they're always on and don't ever change then that's really easy to
represent in the DT without involving drivers, it's when you need to
actively manage them that it's more effort.

> > Bear in mind that getting regulator stuff wrong can result
> > in physical damage to the system so it pays to be careful and to
> > consider that platform integrators have a tendency to rely on things
> > that just happen to work but aren't a good idea or accurate
> > representations of the system.  It's certainly *possible* to do
> > something like that, the information is there, but I would not in any
> > way recommend doing things that way as it's likely to not be robust.

> > The possibility that the regulator setup may vary on other platforms
> > (which I'd expect TBH) does suggest that just requesting a bunch of
> > supply names optionally and hoping that we got all the ones that are
> > important on a given platform is going to lead to trouble down the line.

> Certainly if we miss a regulator the GPU isn't going to work properly (some
> cores won't be able to power up successfully). However at the moment the
> driver will happily do this if someone provides it with a DT which includes
> regulators that it doesn't know about. So I'm not sure how adding special
> case code for a SoC would help here.

I thought this SoC neeed to vary the voltage on both rails as part of
the power management?  Things like that can lead to hardware damage if
we go out of spec far enough for long enough - there can be requirements
like keeping one rail a certain voltage above another or whatever.

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4Xg8kACgkQJNaLcl1U
h9DhIQf9HZ2Q1blNvGt1n4U2y9oZgTgphMEa0JMJU6uCB4DzokV/ki8co9SwPcFC
feV+gosXXo6A98jenPsWIobEfWSUiwEYa5w3ClUYlcVrKLIwlUmThXvSiIS1+uva
LEnxvF+4WP37piAr891qK5iZdpOoMniy8m1bBXSm75midArEGcV2rqCorXEStIih
LNey+eFBxgweMQNmVL/FElCItrW6+x9HyxEGdBL4TLDMOpxC1cb/qyQUs9dAlRwQ
evp+V1ZYh5rSuQqAF5XEJwA+f8k33X0VJki7BJ+Nh3IkQpVWtg0ORKW3e4hw5+DW
B6Gvn1/3P+OYjc/Azm6w18G1USraiQ==
=M45L
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--

--===============1931812937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1931812937==--
