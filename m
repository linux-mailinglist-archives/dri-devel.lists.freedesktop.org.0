Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 856B24C51B3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 23:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD80010EA01;
	Fri, 25 Feb 2022 22:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E35F10EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 22:44:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF24C61C1A;
 Fri, 25 Feb 2022 22:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1947FC340E7;
 Fri, 25 Feb 2022 22:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645829046;
 bh=Qjrl53nCL2BzmMtE1eNdfHJTZQC3VrNII70g1zW6sXg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ttpKGnQGBOvGP7yuFgsMXQw2rAQRs1OdcgsU6j7YKWfGzQ1e/3ui7qVmHEyGoMNdH
 IyEPmAXfYgYOvHZUyRt1eHchO5povJKGTRI3dpOcZ4zjCupuoqjRGw5PpRRiFtRM61
 KoLfyp3S9flyaVsZ+z54NHkdACrFX3cutwD+GZR/3dZMi5fpSPm80hs0GK2ZruQD+H
 iy1ghuLXgdZmYXbyRwkMUr80lP6DxnsQKHNmGiDGOtVGL/cTnh/s8166b7jxddQP5J
 cHr16P03WXlU80eoVM/uSpn1kHXu4vuHPHX7DH2ldaTfWp0QRrfwML/rsT+AmKIOow
 9KxjUbNgC8lqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220225142606.6xpq4nzh7ldtkekk@houat>
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
 <20220225142606.6xpq4nzh7ldtkekk@houat>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Fri, 25 Feb 2022 14:44:04 -0800
User-Agent: alot/0.10
Message-Id: <20220225224406.1947FC340E7@smtp.kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Latypov <dlatypov@google.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Mike Turquette <mturquette@baylibre.com>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-25 06:26:06)
> Hi Stephen,
>=20
> On Thu, Feb 24, 2022 at 02:54:20PM -0800, Stephen Boyd wrote:
> > Quoting Daniel Latypov (2022-02-23 14:50:59)
> > > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > Incremental coverage for 3/9 files in --diff_file
> > > Total incremental: 99.29% coverage (281/283 lines)
> > >   drivers/clk/clk.c: 84.62% coverage (11/13 lines)
> > >   drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
> > >   include/linux/clk.h: 100.00% coverage (1/1 lines)
> > >=20
> > > Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the dif=
f:
> > > +       if (ret) {
> > > +               /* rollback the changes */
> > > +               clk->min_rate =3D old_min; <- 2397
> > > +               clk->max_rate =3D old_max; <- 2398
> > >=20
> > > These are from before and were just moved around.
> >=20
> > We could trigger a failure in the provider when the rate is set, and
> > then we could call round_rate() again and make sure the boundaries from
> > before are maintained.
>=20
> I tried to do that, and it turns out we can't, since we ignore the
> set_rate return code:
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L2107
>=20
> We could make determine_rate fail, but then clk_round_rate would fail as
> well and wouldn't allow us to test whether the boundaries are still in
> place.
>=20

The test could still do it at a high level right? And when/if we decide
to bubble up the set_rate failure then we would be testing these lines.
Seems like a good idea to implement it with a TODO note that clk.c is
ignoring the set_rate clk_op returning failure.
