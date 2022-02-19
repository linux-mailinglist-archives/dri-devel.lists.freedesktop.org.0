Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602414BC4C2
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 03:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DCF10E1BF;
	Sat, 19 Feb 2022 02:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4559B10E1BF
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 02:20:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82BDBB8278E;
 Sat, 19 Feb 2022 02:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E1BC340E9;
 Sat, 19 Feb 2022 02:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645237248;
 bh=gZLSyNp8GcxUMQZfv1Fv56byD5uSuopBdnirDoV8GEA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=IJ6mSjLb1W+0Rw15AxvqmP2+ibBVdJ48p1znJiglBl6G8ZHVTd6FOIPzd7Aynf7yo
 0I9vt4rxmFbSB5nFMDNmPgC6xHbT5Lz4FDPdc9LPvR3S+/9uBk6h1xf3TJiy9QdS8U
 +PCLcCIy5Wq6DTAnTZlJjcHQ3/g+CRpqTSnchk8LN8RpcutnO6Y2+aKOkT23NEJkxJ
 poUwpsWMsLm/xsP43KpROXKmMjQ/cLTRiIgEUGuum+yudvD0wtOxtXVwn2dGo4uLlO
 qPbz/7jbF8VOCG56bOB1nfQGIGsh0J8EKApN71OPdUnzPxuFkjKjR6htOJqCypWwR8
 A3TPeczuPUk9Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220125141549.747889-2-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
 <20220125141549.747889-2-maxime@cerno.tech>
Subject: Re: [PATCH v4 01/10] clk: Introduce Kunit Tests for the framework
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>
Date: Fri, 18 Feb 2022 18:20:46 -0800
User-Agent: alot/0.10
Message-Id: <20220219022048.19E1BC340E9@smtp.kernel.org>
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
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2022-01-25 06:15:40)
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 6a98291350b6..2664aaab8068 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -2,6 +2,7 @@
>  # common clock types
>  obj-$(CONFIG_HAVE_CLK)         +=3D clk-devres.o clk-bulk.o clkdev.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk.o
> +obj-$(CONFIG_CLK_KUNIT_TEST)   +=3D clk-test.o

The file name should be clk_test.c with an underscore.

>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-rate.o
> diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
> new file mode 100644
> index 000000000000..47a600d590c1
> --- /dev/null
> +++ b/drivers/clk/clk-test.c
> @@ -0,0 +1,285 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Kunit test for clk rate management
> + */
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/slab.h>
> +
> +#include <kunit/test.h>
> +
> +#define DUMMY_CLOCK_INIT_RATE  (42 * 1000 * 1000)
> +#define DUMMY_CLOCK_RATE_1     (142 * 1000 * 1000)
> +#define DUMMY_CLOCK_RATE_2     (242 * 1000 * 1000)
> +
> +struct clk_dummy_context {
> +       struct clk_hw hw;
> +       unsigned long rate;
> +};
> +
> +static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
> +                                          unsigned long parent_rate)
> +{
> +       struct clk_dummy_context *ctx =3D
> +               container_of(hw, struct clk_dummy_context, hw);
> +
> +       return ctx->rate;
> +}
> +
> +static int clk_dummy_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       /* Just return the same rate without modifying it */
> +       return 0;
> +}
> +
> +static int clk_dummy_set_rate(struct clk_hw *hw,
> +                             unsigned long rate,
> +                             unsigned long parent_rate)
> +{
> +       struct clk_dummy_context *ctx =3D
> +               container_of(hw, struct clk_dummy_context, hw);
> +
> +       ctx->rate =3D rate;
> +       return 0;
> +}
> +
> +static const struct clk_ops clk_dummy_ops =3D {

Maybe clk_dummy_rate_ops? So we don't mix it up with other dummy ops in
this file testing things that aren't rates.

> +       .recalc_rate =3D clk_dummy_recalc_rate,
> +       .determine_rate =3D clk_dummy_determine_rate,
> +       .set_rate =3D clk_dummy_set_rate,
> +};
> +
> +static int clk_test_init_with_ops(struct kunit *test, const struct clk_o=
ps *ops)
> +{
> +       struct clk_dummy_context *ctx;
> +       struct clk_init_data init =3D { };
> +       int ret;
> +
> +       ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +       if (!ctx)
> +               return -ENOMEM;
> +       ctx->rate =3D DUMMY_CLOCK_INIT_RATE;
> +       test->priv =3D ctx;
> +
> +       init.name =3D "test_dummy_rate";
> +       init.ops =3D ops;
> +       ctx->hw.init =3D &init;
> +
> +       ret =3D clk_hw_register(NULL, &ctx->hw);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int clk_test_init(struct kunit *test)
> +{
> +       return clk_test_init_with_ops(test, &clk_dummy_ops);
> +}
> +
> +static void clk_test_exit(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +
> +       clk_hw_unregister(&ctx->hw);
> +}
> +
> +/*
> + * Test that the actual rate matches what is returned by clk_get_rate()
> + */
> +static void clk_test_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);
> +       KUNIT_EXPECT_EQ(test, rate, ctx->rate);
> +}
> +
> +/*
> + * Test that, after a call to clk_set_rate(), the rate returned by
> + * clk_get_rate() matches.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_test_set_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate(clk, DUMMY_CLOCK_RATE_1),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +}
> +
> +/*
> + * Test that, after several calls to clk_set_rate(), the rate returned
> + * by clk_get_rate() matches the last one.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_test_set_set_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate(clk, DUMMY_CLOCK_RATE_1),
> +                       0);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate(clk, DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +}
> +
> +static struct kunit_case clk_test_cases[] =3D {
> +       KUNIT_CASE(clk_test_get_rate),
> +       KUNIT_CASE(clk_test_set_get_rate),
> +       KUNIT_CASE(clk_test_set_set_get_rate),
> +       {}
> +};
> +
> +static struct kunit_suite clk_test_suite =3D {
> +       .name =3D "clk-test",
> +       .init =3D clk_test_init,
> +       .exit =3D clk_test_exit,
> +       .test_cases =3D clk_test_cases,
> +};
> +
> +/*
> + * Test that clk_set_rate_range won't return an error for a valid range.
> + */
> +static void clk_range_test_set_range(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1);
> +       KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
> +}
> +
> +/*
> + * Test that calling clk_set_rate_range with a minimum rate higher than
> + * the maximum rate returns an error.
> + */
> +static void clk_range_test_set_range_invalid(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +
> +       KUNIT_EXPECT_LT(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1 + 1000,
> +                                          DUMMY_CLOCK_RATE_1),
> +                       0);
> +}
> +
> +/*
> + * Test that if our clock has a rate lower than the minimum set by a
> + * call to clk_set_rate_range(), the rate will be raised to match the
> + * new minimum.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_range_test_set_range_get_rate_raised(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000),
> +                       0);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +}
> +
> +/*
> + * Test that if our clock has a rate higher than the maximum set by a
> + * call to clk_set_rate_range(), the rate will be lowered to match the
> + * new maximum.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_range_test_set_range_get_rate_lowered(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate(clk, DUMMY_CLOCK_RATE_2 + 1000),
> +                       0);
> +
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +}
> +
> +static struct kunit_case clk_range_test_cases[] =3D {
> +       KUNIT_CASE(clk_range_test_set_range),
> +       KUNIT_CASE(clk_range_test_set_range_invalid),
> +       KUNIT_CASE(clk_range_test_set_range_get_rate_raised),
> +       KUNIT_CASE(clk_range_test_set_range_get_rate_lowered),

Can you add a test case for round_rate matching what set_rate did, i.e.
calling clk_round_rate() and then clk_set_rate() followed by
clk_get_rate() with the same argument for round and set rate leads to
the same frequency?

It would also be good to add a test that tries to set the clk rate with
clk_set_rate() after a range has been set that is outside the acceptable
range and verify that it fails, and one that tries to set it within the
range and make sure it succeeds (and changes it to be exactly what was
set). Similarly, a call to set two disjoint ranges and verify that the
call that tries to set the second disjoint range fails. We want to test
the failure paths as well, to make sure we don't start causing them to
pass, unless it's expected. This patch could also contain the failure
scenario you're experiencing and mark it as expecting to fail. Then the
patch that fixes it in the core could mark the test as expecting to
pass, which may help us understand more easily what exactly changed
instead of having to figure that out after the fact by reading the
entire test.

> +       {}
> +};
> +
> +static struct kunit_suite clk_range_test_suite =3D {
> +       .name =3D "clk-range-test",
> +       .init =3D clk_test_init,
> +       .exit =3D clk_test_exit,
> +       .test_cases =3D clk_range_test_cases,
> +};
