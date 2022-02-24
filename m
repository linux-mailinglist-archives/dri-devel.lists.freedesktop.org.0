Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323054C38D9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217FB10E460;
	Thu, 24 Feb 2022 22:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C38010E460
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:39:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83CD3B829D9;
 Thu, 24 Feb 2022 22:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15246C340E9;
 Thu, 24 Feb 2022 22:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645742362;
 bh=XrTCazwincKjtwDT6Eor2EdDbcq+R1mpZ9I8nlWlLvI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RryR7GlKCKyOkj0mH9LkR/Jj5KowgyH1JE5zBUUuUSW/bhYOy8S//2pNsLa2LS2BM
 kC5Soxw8hZdGBjMTGjEXmTkJezQVZfYHWIbztSQzRx+G4mjv59knFPu4MEyyJzLizl
 AaCZNbw/goJpY63Zp5JOp1UUKHk6u9NDGybCz20be2su7cIjHE78QWLudUsAbt4FyQ
 xHTz6l4cSkWHNllWHe4FqTq6pi451JAxk8EFaeadr1oQAHKigHoQqQHi8ez8VkhhzG
 b9p3w/V4RkPffe//fpJCf46bFmL0vzFrDXIXaoF4wI9o2jkhfgf+uVm6YiW5///TDM
 ioXw1cPTAgYIg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220221164323.6xacozlk3usiidfy@houat>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
 <20220218231508.7B5FCC340E9@smtp.kernel.org>
 <20220221161821.jbktbgx2t6aaxds3@houat>
 <20220221164323.6xacozlk3usiidfy@houat>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 24 Feb 2022 14:39:20 -0800
User-Agent: alot/0.10
Message-Id: <20220224223922.15246C340E9@smtp.kernel.org>
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
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-02-21 08:43:23)
> Hi again,
>=20
> On Mon, Feb 21, 2022 at 05:18:21PM +0100, Maxime Ripard wrote:
> > On Fri, Feb 18, 2022 at 03:15:06PM -0800, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2022-01-25 06:15:41)
> > > > +/*
> > > > + * Test that if our clock has some boundaries and we try to round =
a rate
> > > > + * lower than the minimum, the returned rate will be within range.
> > > > + */
> > > > +static void clk_range_test_set_range_round_rate_lower(struct kunit=
 *test)
> > > > +{
> > > > +       struct clk_dummy_context *ctx =3D test->priv;
> > > > +       struct clk_hw *hw =3D &ctx->hw;
> > > > +       struct clk *clk =3D hw->clk;
> > > > +       long rate;
> > > > +
> > > > +       KUNIT_ASSERT_EQ(test,
> > > > +                       clk_set_rate_range(clk,
> > > > +                                          DUMMY_CLOCK_RATE_1,
> > > > +                                          DUMMY_CLOCK_RATE_2),
> > > > +                       0);
> > > > +
> > > > +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> > > > +       KUNIT_ASSERT_GT(test, rate, 0);
> > > > +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> > >=20
> > > The comment says within range but this test says exactly the minimum
> > > rate. Please change it to test that the rate is within rate 1 and rate
> > > 2. Also, we should call clk_get_rate() here to make sure the rate is
> > > within the boundaries and matches what clk_round_rate() returned.
> >=20
> > Ok
>=20
> Actually, that doesn't work. Calling clk_round_rate() won't affect the
> clock rate, so the rate returned by clk_get_rate() won't match what
> clk_round_rate() will return.

Huh? This is asking "what rate will I get if I call clk_set_rate() with
DUMMY_CLOCK_RATE_1 - 1000 after setting the range to be rate 1 and rate
2. It should round that up to some value (and we should enforce that it
is inclusive or exclusive). I think I missed that this is
clk_round_rate().

Either way, the clk provider implementation could say that if you call
clk_set_rate() with a frequency below the minimum that it lies somewhere
between the rate 1 and rate 2. The expectation should only check that it
is within the range and not exactly the minimum because we're not
testing the clk provider implementation of the rounding here, just that
the constraints are satisfied and the rate is within range. That's my
understanding of the comment above the function and the function name.
