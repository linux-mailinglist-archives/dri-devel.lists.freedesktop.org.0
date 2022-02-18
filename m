Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5F4BC2CB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 00:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A298410EA6F;
	Fri, 18 Feb 2022 23:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C832510EA6F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 23:15:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CBBA61F22;
 Fri, 18 Feb 2022 23:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5FCC340E9;
 Fri, 18 Feb 2022 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645226108;
 bh=mnXS1IyKts+4zhJInJwCnH8tRAZaZSWpc+GpbYbfEoU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GuTAmwGJNxwkYXuhsNzaeapXcJPpeb2XfQnDw2MB4A+QdEttyYVbSVUj+LihggDjl
 fLsrdkauULbV3v6RdRPL5RE17pM8aG5jT/Gyw9RkZjQC1OyDAFRnHHvwTjpS0J9WfR
 LmBWo8lXDwPcrK9tVXxLHjIqBE8aZQ3vgR6aekx1g8BJWPpXQ/VKtf/rBedd/ToXmn
 nq66rAHUIYeq2Vuv5hqAApeem1Sx+UBI3fHTzQXP/L9WGtOoRiJ8SsGKzemX0T/MZc
 YcA6YhkS0wlS4Lrm+z2o/QNTmenQSd61K37UQTQ8AWg2ExVbpBaw1f0F3m2a/rDT2p
 zJ/4keXvI19RA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125141549.747889-3-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-3-maxime@cerno.tech>
Subject: Re: [PATCH v4 02/10] clk: Always clamp the rounded rate
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 18 Feb 2022 15:15:06 -0800
User-Agent: alot/0.10
Message-Id: <20220218231508.7B5FCC340E9@smtp.kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-01-25 06:15:41)
> The current core while setting the min and max rate properly in the
> clk_request structure will not make sure that the requested rate is
> within these boundaries, leaving it to each and every driver to make
> sure it is.

It would be good to describe why. Or decide that it was an oversight and
write that down here.

>=20
> Add a clamp call to make sure it's always done, and add a few unit tests
> to make sure we don't have any regression there.

I looked through the per-user constraint patch history on the list but I
couldn't really figure out why it was done this way. I guess we didn't
clamp the rate in the core because we wanted to give the clk providers
all the information, i.e. the rate that was requested and the boundaries
that the consumers have placed on the rate. With the round_rate() clk_op
the providers don't know the min/max because the rate request structure
isn't passed. I think my concern a long time ago was that a consumer
could call clk_round_rate() and get one frequency and then call
clk_set_rate() and get another frequency. We need to make sure that
round_rate and set_rate agree with each other. If we don't do that then
we don't uphold the contract that clk_round_rate() tells the consumer
what rate they'll get if they call clk_set_rate() with the same
frequency.

>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk-test.c | 46 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/clk.c      |  2 ++
>  2 files changed, 48 insertions(+)
>=20
> diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
> index 47a600d590c1..28c718ab82e1 100644
> --- a/drivers/clk/clk-test.c
> +++ b/drivers/clk/clk-test.c
> @@ -203,6 +203,50 @@ static void clk_range_test_set_range_invalid(struct =
kunit *test)
>                         0);
>  }
> =20
> +/*
> + * Test that if our clock has some boundaries and we try to round a rate
> + * lower than the minimum, the returned rate will be within range.
> + */
> +static void clk_range_test_set_range_round_rate_lower(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);

The comment says within range but this test says exactly the minimum
rate. Please change it to test that the rate is within rate 1 and rate
2. Also, we should call clk_get_rate() here to make sure the rate is
within the boundaries and matches what clk_round_rate() returned.

> +}
> +
> +/*
> + * Test that if our clock has some boundaries and we try to round a rate
> + * higher than the maximum, the returned rate will be within range.
> + */
> +static void clk_range_test_set_range_round_rate_higher(struct kunit *tes=
t)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_round_rate(clk, DUMMY_CLOCK_RATE_2 + 1000);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);

Same comment about within range.

> +}
> +
>  /*
>   * Test that if our clock has a rate lower than the minimum set by a
>   * call to clk_set_rate_range(), the rate will be raised to match the
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 8de6a22498e7..7bb5ae0fb688 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1330,6 +1330,8 @@ static int clk_core_determine_round_nolock(struct c=
lk_core *core,
>         if (!core)
>                 return 0;
> =20
> +       req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> +
>         /*
>          * At this point, core protection will be disabled
>          * - if the provider is not protected at all
> --=20
> 2.34.1
>
