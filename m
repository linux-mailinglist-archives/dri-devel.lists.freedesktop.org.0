Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B229E838D
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 09:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AE86E146;
	Tue, 29 Oct 2019 08:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150546E146
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 08:54:21 +0000 (UTC)
Received: from localhost (unknown [91.217.168.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C04E20663;
 Tue, 29 Oct 2019 08:54:19 +0000 (UTC)
Date: Tue, 29 Oct 2019 09:54:01 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v11 4/7] drm/sun4i: dsi: Handle bus clock explicitly
Message-ID: <20191029085401.gvqpwmmpyml75vis@hendrix>
References: <20191025175625.8011-1-jagan@amarulasolutions.com>
 <20191025175625.8011-5-jagan@amarulasolutions.com>
 <20191028153427.pc3tnoz2d23filhx@hendrix>
 <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMty3ZCisTrFGjzHyqSofqFAsKSLV1n2xP5Li3Lonhdi0WUZVA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572339260;
 bh=mkkA0nt6hx3V0z0UwVIpSj9LslS/iQ3ZT+43Z9OvzN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rvOQbaioo47qLALm3l14AHXxcxc5IYfpvJjlT7KDT/WEkmyjOQKlnSyb7eRV3WHdu
 fT9PRURUDToD06zrggmqZ8s9PCAusIcDS7FYlIzzysiQ+pR5BD6oYTZIy5palfhN14
 W5T1c8taWx9dN6yvQ24GVdJ6SbVbEiiXmQ0VWT9s=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: multipart/mixed; boundary="===============0651951794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0651951794==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="unkpttpyvqhvobfg"
Content-Disposition: inline


--unkpttpyvqhvobfg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 29, 2019 at 04:03:56AM +0530, Jagan Teki wrote:
> > > explicit handling of common clock would require since the A64
> > > doesn't need to mention the clock-names explicitly in dts since it
> > > support only one bus clock.
> > >
> > > Also pass clk_id NULL instead "bus" to regmap clock init function
> > > since the single clock variants no need to mention clock-names
> > > explicitly.
> >
> > You don't need explicit clock handling. Passing NULL as the argument
> > in regmap_init_mmio_clk will make it use the first clock, which is the
> > bus clock.
>
> Indeed I tried that, since NULL clk_id wouldn't enable the bus clock
> during regmap_mmio_gen_context code, passing NULL triggering vblank
> timeout.

There's a bunch of users of NULL in tree, so finding out why NULL
doesn't work is the way forward.

Maxime

--unkpttpyvqhvobfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbf+KQAKCRDj7w1vZxhR
xQUaAQCp7d+DSgK2CMprYRTRP+TGzpbEjN4u+W/Tt1seOujvoQEA9cGaIr4yjPsP
iK0Vn3o2jO7HYtqHE03IewfUWRW4OgM=
=D4qQ
-----END PGP SIGNATURE-----

--unkpttpyvqhvobfg--

--===============0651951794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0651951794==--
