Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8148DFD3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 22:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21D010E13F;
	Thu, 13 Jan 2022 21:44:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9626A10E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 21:44:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E916FB82380;
 Thu, 13 Jan 2022 21:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95292C36AEA;
 Thu, 13 Jan 2022 21:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642110266;
 bh=9f4pER1EuDbwag5Si4PfYatM5rJz9h3g9M3ZIfhUhBQ=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fQus3Ie+WJB1Um+S0EEXE8L78sVxgEQok9HYXMzxUxW81RlzWJHN2EhwdnWtzPoiM
 oXBHkz2SIZLl0exHs6uVsKzNHVqCWpN1jJb0cENqw+s1ahro1kmeNfGfr5rlAVWJke
 083kWT8Wf4nPoFnl07YBMm9IW9241iRjY0qKMcuWAmYH6hQ+BtLLK/sKGu7bXYIxVt
 OkIz6kXsBTxo2nY/1Jk2diBRFQ+ZZ8uYnqlcbsgOs419vMo+ktfwmIAKJMX/vvauCp
 Ex4RaFKnECi9DWGAfGXtex/AZWrtAqPWTIRJKegVGoQDzki75atrWXPuI3y9u5qPbT
 G6M724eYOIfAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220112114652.hmfdcpqil5jg2vz6@houat>
References: <20210914093515.260031-1-maxime@cerno.tech>
 <20210914093515.260031-2-maxime@cerno.tech>
 <20220112033716.63631C36AEA@smtp.kernel.org>
 <20220112114652.hmfdcpqil5jg2vz6@houat>
Subject: Re: [PATCH v2 1/3] clk: Introduce a clock request API
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 13 Jan 2022 13:44:25 -0800
User-Agent: alot/0.9.1
Message-Id: <20220113214426.95292C36AEA@smtp.kernel.org>
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
Cc: Emma Anholt <emma@anholt.net>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, linux-clk@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-01-12 03:46:52)
> Hi Stephen,
>=20
> Thanks for your answer
>=20
> On Tue, Jan 11, 2022 at 07:37:15PM -0800, Stephen Boyd wrote:
> > Sorry for being super delayed on response here. I'm buried in other
> > work. +Jerome for exclusive clk API.
> >=20
> > Quoting Maxime Ripard (2021-09-14 02:35:13)
> > > It's not unusual to find clocks being shared across multiple devices
> > > that need to change the rate depending on what the device is doing at=
 a
> > > given time.
> > >=20
> > > The SoC found on the RaspberryPi4 (BCM2711) is in such a situation
> > > between its two HDMI controllers that share a clock that needs to be
> > > raised depending on the output resolution of each controller.
> > >=20
> > > The current clk_set_rate API doesn't really allow to support that case
> > > since there's really no synchronisation between multiple users, it's
> > > essentially a fire-and-forget solution.
> >=20
> > I'd also say a "last caller wins"
> >=20
> > >=20
> > > clk_set_min_rate does allow for such a synchronisation, but has anoth=
er
> > > drawback: it doesn't allow to reduce the clock rate once the work is
> > > over.
> >=20
> > What does "work over" mean specifically? Does it mean one of the clk
> > consumers has decided to stop using the clk?
>=20
> That, or it doesn't need to enforce that minimum anymore. We have
> several cases like this on the RPi. For example, during a change of
> display mode a (shared) clock needs to be raised to a minimum, but
> another shared one needs to raise its minimum based on the resolution.
>=20
> In the former case, we only need the minimum to be enforced during the
> resolution change, so it's fairly quick, but the latter requires its
> minimum for as long as the display is on.
>=20
> > Why doesn't clk_set_rate_range() work? Or clk_set_rate_range() combined
> > with clk_set_rate_exclusive()?
>=20
> clk_set_rate_range could work (it's what we have right now in mainline
> after all), but it's suboptimal since the clock is never scaled down.

Alright, I didn't see any mention of clk_set_rate_range() in the commit
text so did I miss it? Maybe it's used interchangeably with
clk_set_min_rate()?

>=20
> It's especially showing in my first example where we need to raise the
> clock only for the duration of the resolution change. Using
> clk_set_min_rate works but we end up with that fairly high clock (at
> least 500MHz) for the rest of the system life even though we usually can
> get away with using a clock around 200MHz outside of that (short) window.
>=20
> This is fairly inefficient, and is mostly what I'm trying to address.

Got it!

>=20
> > > In our previous example, this means that if we were to raise the
> > > resolution of one HDMI controller to the largest resolution and then
> > > changing for a smaller one, we would still have the clock running at =
the
> > > largest resolution rate resulting in a poor power-efficiency.
> >=20
> > Does this example have two HDMI controllers where they share one clk and
> > want to use the most efficient frequency for both of the HDMI devices? I
> > think I'm following along but it's hard. It would be clearer if there
> > was some psuedo-code explaining how it is both non-workable with current
> > APIs and workable with the new APIs.
>=20
> The fact that we have two HDMI controllers that share one clock is why
> we use clk_set_min_rate in the first place, but you can have that
> behavior with clk_set_min_rate only with a single user.
>=20
> With pseudo-code, if you do something like
>=20
> clk =3D clk_get(NULL);
> clk_set_min_rate(600 * 1000 * 1000);
> clk_set_min_rate(1000);
>=20
> The clock will still remain at 600MHz, even though you would be totally
> fine with the clock running at 1kHz.

That looks like a bug. While we could happily ignore the rate floor
being lowered because we're still within constraints, it looks like we
should always re-evaluate the constraints when they change.

>=20
> If you really wanted to make the clock run at 1kHz, you'd need to have:
>=20
> clk =3D clk_get(NULL);
> clk_set_min_rate(600 * 1000 * 1000);
> clk_set_min_rate(1000);
> clk_set_rate(1000);
>=20
> And that works fine for a single user.
>=20
> If you have a clock shared by multiple drivers though, things get
> tricky. Indeed, you can't really find out what the minimum for that
> clock is, so figuring out the rate to pass to the clk_set_rate call
> would be difficult already. And it wouldn't be atomic anyway.

Right.

>=20
> It's made even more difficult since in clk_calc_new_rates the core
> checks that the rate is within the boundaries and will error out if it
> isn't, so even using clk_set_rate(0) wouldn't work.

clk_set_rate(0) is pretty gross!

>=20
> It could work if the clock driver makes sure in round/determine_rate
> that the rate passed in within the boundaries of the clock, but then you
> start working around the core and relying on the behavior of clock
> drivers, which is a fairly significant abstraction violation.
>=20
> > > In order to address both issues, let's create an API that allows user=
 to
> > > create temporary requests to increase the rate to a minimum, before
> > > going back to the initial rate once the request is done.
> > >=20
> > > This introduces mainly two side-effects:
> > >=20
> > >   * There's an interaction between clk_set_rate and requests. This has
> > >     been addressed by having clk_set_rate increasing the rate if it's
> > >     greater than what the requests asked for, and in any case changing
> > >     the rate the clock will return to once all the requests are done.
> > >=20
> > >   * Similarly, clk_round_rate has been adjusted to take the requests
> > >     into account and return a rate that will be greater or equal to t=
he
> > >     requested rates.
> > >=20
> >=20
> > I believe clk_set_rate_range() is broken but it can be fixed. I'm
> > forgetting the details though. If the intended user of this new API
> > can't use that range API then it would be good to understand why it
> > can't be used. I imagine it would be something like
> >=20
> >       struct clk *clk_hdmi1, *clk_hdmi2;
> >=20
> >       clk_set_rate_range(&clk_hdmi1, HDMI1_MIN, HDMI1_MAX);
> >       clk_set_rate_range(&clk_hdmi2, HDMI2_MIN, HDMI2_MAX);
> >       clk_set_rate_range(&clk_hdmi2, 0, UINT_MAX);
> >=20
> > and then the goal would be for HDMI1_MIN to be used, or at the least for
> > the last call to clk_set_rate_range() to drop the rate constraint and
> > re-evaluate the frequency of the clk again based on hdmi1's rate range.
>=20
> This is pretty much what this series was doing. I was being conservative
> and didn't really want to modify the behavior of existing functions, but
> that will work fine.
>=20

I don't see a problem with re-evaluating the rate every time we call
clk_set_rate_range(). That's probably the bug that I can't recall. Can
you fix the API so it works that way?
