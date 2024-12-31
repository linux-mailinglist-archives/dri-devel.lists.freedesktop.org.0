Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9119FEC1B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 02:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA3710E0BC;
	Tue, 31 Dec 2024 01:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oju9zuw9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F3410E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 01:23:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38F16A40FFB;
 Tue, 31 Dec 2024 01:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF35C4CED0;
 Tue, 31 Dec 2024 01:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735608178;
 bh=6/KQluQbR5WRrJVNS61IDNDVMHTHXFHLqi2YBMMnL7E=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=oju9zuw93COQ2rtTWFexnlWlteo1qU+an7SDYhpN9lzLpkLGgo5z4z6HmMHI+bY4T
 AcNBdMMO6hRDqzEYbdPkM68RbTixFlRKGd5saCzCVCktXMmFI0LiBjwCBpzLnrJmDc
 Lc/vHXyiaEEL8MqCD7tTwXPMMasfZMkvt/tIkfHwzL1N3MIZvY6W4zcpnzAD6YXE4t
 LFcjaV+VocNNiz7a8gt0Ygu+zF+CGmDIZ94+7McZa3FKWU/CbsNawe08UgTZunef2P
 MgxvtyUYJCqNL5cVj5Be9T2f6g7tM19jhtxnPUIYdaAZmT9zO0Upt3fYXRPXjJEAu/
 cHOXrbzPgahww==
Message-ID: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87bjx2tf3y.fsf@bootlin.com>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
 <20241217-brown-wapiti-of-promotion-e3bec6@houat>
 <87bjx2tf3y.fsf@bootlin.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
From: Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>,
 Marek Vasut <marex@denx.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Ian Ray <ian.ray@ge.com>
To: Maxime Ripard <mripard@redhat.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 30 Dec 2024 17:22:56 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Miquel Raynal (2024-12-23 10:43:13)
> Hi Maxime,
>=20
> On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:
>=20
> > On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> >> There are mainly two ways to change a clock frequency.
> >
> > There's much more than that :)
>=20
> "mainly"
>=20
> Or maybe I should have added "on purpose".
>=20
> >
> > Off the top of my head, setting/clearing a min/max rate and changing the
> > parent might also result in a rate change.
> >
> > And then, the firmware might get involved too.
> >
> >> The active way requires calling ->set_rate() in order to ask "on
> >> purpose" for a frequency change. Otherwise, a clock can passively see
> >> its frequency being updated depending on upstream clock frequency
> >> changes. In most cases it is fine to just accept the new upstream
> >> frequency - which by definition will have an impact on downstream
> >> frequencies if we do not recalculate internal divisors. But there are
> >> cases where, upon an upstream frequency change, we would like to
> >> maintain a specific rate.
> >
> > Why is clk_set_rate_exclusive not enough?
>=20
> I am trying to protect these rate changes from subtree walks, I don't
> see where setting an exclusive rate would have an effect? But I might be
> overlooking something, definitely.
>=20
> ...
>=20
> >> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *c=
ore)
> >>  {
> >>      struct clk_core *child;
> >> =20
> >> -    core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> >> +    if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> >> +            core->new_rate =3D clk_determine(core, core->rate);
> >> +            if (!core->new_rate)
> >> +                    core->new_rate =3D clk_recalc(core, core->parent-=
>new_rate);
> >> +    } else {
> >> +            core->new_rate =3D clk_recalc(core, core->parent->new_rat=
e);
> >> +    }
> >
> > Sorry, it's not clear to me how it works. How will the parent clocks
> > will get notified to adjust their dividers in that scenario? Also, what
> > if they can't?
>=20
> The idea is: if the flag is set, instead of accepting the new upstream
> rate and recalculate the downstream rate based on a previously set
> divider value, we change our divider value to match the same frequency
> as before. But if we cannot, then we just keep the old way.
>=20

The exclusive rate code could support this if it doesn't already do so.
If you call clk_set_rate_exclusive(child, <constant rate>) followed by
clk_set_rate(parent, <new rate>) the core code should try to keep the
child at the constant rate, or fail the clk_set_rate() call on the
parent. It should be possible to confirm this with some KUnit tests for
clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
parent changes the parent rate, we should speculate the new rate of the
child_A that's protected and fail if we can't maintain the rate. We need
to start generating a list of clks that we operate a rate change on to
support this though, because right now we rely on the stack to track the
clks that we change the rate of.

Initially we thought that we could do this with clk notifiers. That may
work here, but I suspect it will be clunky to get working because clk
notifiers operate on struct clk.
