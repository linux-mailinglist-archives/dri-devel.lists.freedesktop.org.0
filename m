Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E4135E3B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE206E450;
	Thu,  9 Jan 2020 16:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 51E136E450
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2020 16:28:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6271FB;
 Thu,  9 Jan 2020 08:28:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52D173F703;
 Thu,  9 Jan 2020 08:28:16 -0800 (PST)
Date: Thu, 9 Jan 2020 16:28:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 4/7] drm/panfrost: Add support for a second regulator
 for the GPU
Message-ID: <20200109162814.GB3702@sirena.org.uk>
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-5-drinkcat@chromium.org>
 <20200108132302.GA3817@sirena.org.uk>
 <CANMq1KBo8ND+YDHaCw3yZZ0RUr69-NSUcVbqu38DuZvHUB-LFw@mail.gmail.com>
 <09ddfac3-da8d-c039-92a0-d0f51dc3fea5@arm.com>
MIME-Version: 1.0
In-Reply-To: <09ddfac3-da8d-c039-92a0-d0f51dc3fea5@arm.com>
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
Content-Type: multipart/mixed; boundary="===============0511491510=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0511491510==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 09, 2020 at 02:14:42PM +0000, Steven Price wrote:
> On 08/01/2020 22:52, Nicolas Boichat wrote:

> > That'd be a bit awkward to match, though... Currently all bifrost
> > share the same compatible "arm,mali-bifrost", and it'd seem
> > weird/wrong to match "mediatek,mt8183-mali" in this driver? I have no
> > idea if any other Mali implementation will require a second regulator,
> > but with the MT8183 we do need it, see below.

This doesn't sound particularly hard, just new.  Plenty of other devices
have quirks done based on the SoC they're in or the IP revision, this
would just be another of those quirks.

> > Well if devfreq was working (see patch 7
> > https://patchwork.kernel.org/patch/11322851/ for a partial
> > implementation), it would adjust both mali and sram regulators, see
> > the OPP table in patch 2
> > (https://patchwork.kernel.org/patch/11322825/): SRAM voltage needs to
> > be increased for frequencies >=698Mhz.

> > Now if you have some better idea how to implement this, I'm all ears!

Set a flag based on the compatible, then base runtime decisions off
that.

> I'm not sure if it's better, but could we just encode the list of
> regulators into device tree. I'm a bit worried about special casing an
> "sram" regulator given that other platforms might have a similar
> situation but call the second regulator a different name.

Obviously the list of regulators bound on a given platform is encoded in
the device tree but you shouldn't really be relying on that to figure
out what to request in the driver - the driver should know what it's
expecting.  Bear in mind that getting regulator stuff wrong can result
in physical damage to the system so it pays to be careful and to
consider that platform integrators have a tendency to rely on things
that just happen to work but aren't a good idea or accurate
representations of the system.  It's certainly *possible* to do
something like that, the information is there, but I would not in any
way recommend doing things that way as it's likely to not be robust.

The possibility that the regulator setup may vary on other platforms
(which I'd expect TBH) does suggest that just requesting a bunch of
supply names optionally and hoping that we got all the ones that are
important on a given platform is going to lead to trouble down the line.

Steve, please fix your mail client to word wrap within paragraphs at
something substantially less than 80 columns.  Doing this makes your
messages much easier to read and reply to.

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4XVJ0ACgkQJNaLcl1U
h9AYxwf+KvXLp3chGCrua6k7mYwzuRnBu6lxudNUYlU35S6W/jvj7j24xoetg2SJ
9bvm5PnWREES8yFnNE3P0v0XhwZ7KP223VeOsNEUEXaD34txxpfgIsFJ0pBSl5MY
2s7l8R4CSe0EYuBc2Rg1g+KGb8mOwvdVaOYKdgMXHiscQ4Iq2QNNA+1kVjLFGE72
kTPnycN7SvQLsxzJbMm7zday5eObx2CHrfxZjdlnSjGnao7fIcyIRnc6rjSf4VkG
+WjOYltzHe0oe9yfN+4+wjawAPt5OIr9BeD3L/Vdm9Lvy59wTPuairTYgV1e0+oV
GDQ1CHWCdcr1P9Yi96zKy/4P4eEShw==
=+CID
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--

--===============0511491510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0511491510==--
