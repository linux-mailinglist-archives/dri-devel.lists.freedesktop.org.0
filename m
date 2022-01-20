Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDD4955FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 22:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F209A10E6B9;
	Thu, 20 Jan 2022 21:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A8710E3B3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 21:31:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6912618CC;
 Thu, 20 Jan 2022 21:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F0AC340E3;
 Thu, 20 Jan 2022 21:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642714278;
 bh=w4KknEB25vhzusDTKTx09THhG0azhgBC3uwxP0DQsh4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=a0E1dWGOkyDgvP3ChDIdkzmuCUmWv+hP2ESrYZGXX5jZGmk16r1caNrVl4f4ZGWRH
 IcOyZqghOd8P8lCXDE/+Brkz99U3DlsoXLohOlYnThC8d+MLEICdyPCSedamW/gVWq
 7YXIItNw+Vo+OAhpU665/SA5NXVKoXem1qe4b5bDl6O+5RmH+BFACx5b/c5kTIcMHh
 ZNyL+9hCPYWF+gf3bbYKCMQZC1Ma35EMg29Yum9h8o96VDkmSYtA1rFZzNVU/V+lhu
 y87uRhEB1wFOGGx5BIl8zNvGRg+Gs1R3nrU0j2BtNkcunuCLe7vbLuAUTP8PCRIBnf
 NxNkuQzGnv3oQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220120143417.543744-2-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
 <20220120143417.543744-2-maxime@cerno.tech>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>, Mike Turquette <mturquette@baylibre.com>,
 Daniel Latypov <dlatypov@google.com>
Date: Thu, 20 Jan 2022 13:31:16 -0800
User-Agent: alot/0.10
Message-Id: <20220120213118.40F0AC340E3@smtp.kernel.org>
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

Quoting Maxime Ripard (2022-01-20 06:34:08)
> Let's test various parts of the rate-related clock API with the kunit
> testing framework.
>=20
> Cc: kunit-dev@googlegroups.com
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

This is great! Thanks for doing this.

>  drivers/clk/Kconfig         |   7 +
>  drivers/clk/Makefile        |   1 +
>  drivers/clk/clk-rate-test.c | 278 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 286 insertions(+)
>  create mode 100644 drivers/clk/clk-rate-test.c

I was thinking this would be more generic so that one file tests clk.c
and all the code in there, but I guess there may be config dependencies
like CONFIG_OF that we may want to extract out and depend on
differently. I'm not sure how kunit will handle testing different paths
depending on build configuration so this approach may head off future
problems. If it doesn't then we can always slam the test together.

>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index f5807d190ba2..7ae48a91f738 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -436,4 +436,11 @@ config CLK_GATE_TEST
>         help
>           Kunit test for the basic clk gate type.
> =20
> +config CLK_RATE_TEST

See v3 here[1] and have it follow that.

> +       tristate "Basic Core Rate Kunit Tests"
> +       depends on KUNIT
> +       default KUNIT
> +       help
> +         Kunit test for the basic clock rate management.
> +
>  endif
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index b940c6d35922..0238a595167a 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -2,6 +2,7 @@
>  # common clock types
>  obj-$(CONFIG_HAVE_CLK)         +=3D clk-devres.o clk-bulk.o clkdev.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk.o
> +obj-$(CONFIG_CLK_RATE_TEST)    +=3D clk-rate-test.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-divider.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-factor.o
>  obj-$(CONFIG_COMMON_CLK)       +=3D clk-fixed-rate.o
> diff --git a/drivers/clk/clk-rate-test.c b/drivers/clk/clk-rate-test.c
> new file mode 100644
> index 000000000000..f2d3df791b5a
> --- /dev/null
> +++ b/drivers/clk/clk-rate-test.c
> @@ -0,0 +1,278 @@
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
> +struct clk_dummy_rate_context {
> +       struct clk_hw hw;
> +       unsigned long rate;
> +};
> +
> +static unsigned long clk_dummy_rate_recalc_rate(struct clk_hw *hw,
> +                                               unsigned long parent_rate)
> +{
> +       struct clk_dummy_rate_context *ctx =3D
> +               container_of(hw, struct clk_dummy_rate_context, hw);
> +
> +       return ctx->rate;
> +}
> +
> +static int clk_dummy_rate_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       /* Just return the same rate without modifying it */
> +       return 0;
> +}
> +
> +static int clk_dummy_rate_set_rate(struct clk_hw *hw,
> +                                  unsigned long rate,
> +                                  unsigned long parent_rate)
> +{
> +       struct clk_dummy_rate_context *ctx =3D
> +               container_of(hw, struct clk_dummy_rate_context, hw);
> +
> +       ctx->rate =3D rate;
> +       return 0;
> +}
> +
> +const static struct clk_ops clk_dummy_rate_ops =3D {

static const?

> +       .recalc_rate =3D clk_dummy_rate_recalc_rate,
> +       .determine_rate =3D clk_dummy_rate_determine_rate,
> +       .set_rate =3D clk_dummy_rate_set_rate,
> +};
> +
> +static int clk_rate_test_init_with_ops(struct kunit *test,
> +                                      const struct clk_ops *ops)
> +{
> +       struct clk_dummy_rate_context *ctx;
> +       struct clk_init_data init =3D { };
> +       int ret;
> +
> +       ctx =3D kzalloc(sizeof(*ctx), GFP_KERNEL);

Use kunit_kzalloc() here

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
> +static int clk_rate_test_init(struct kunit *test)
> +{
> +       return clk_rate_test_init_with_ops(test, &clk_dummy_rate_ops);
> +}
> +
> +static void clk_rate_test_exit(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +
> +       clk_hw_unregister(&ctx->hw);
> +       kfree(ctx);

And drop the kfree as it is now test managed.

> +}
> +
> +/*
> + * Test that the actual rate matches what is returned by clk_get_rate()
> + */
> +static void clk_rate_test_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);
> +       KUNIT_ASSERT_EQ(test, rate, ctx->rate);

These should be KUNIT_EXPECT_*() as we don't want to stop the test if
the rate is wrong, we want to check that the rate is what we expected it
to be. Assertions are about making sure things are sane and if not we
should stop testing, whereas expectations are about testing the code. A
test must have an EXPECT while it can have an ASSERT.

Maybe kunit should check that there was an EXPECT on return from the
test. Daniel?

> +}
> +
> +/*
> + * Test that, after a call to clk_set_rate(), the rate returned by
> + * clk_get_rate() matches.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_rate_test_set_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +       int ret;
> +
> +       ret =3D clk_set_rate(clk, DUMMY_CLOCK_RATE_1);
> +       KUNIT_ASSERT_EQ(test, ret, 0);

I'd like to throw the ret check directly into KUNIT_ASSERT_EQ() here.

	KUNIT_ASSERT_EQ(test, clk_set_rate(clk, DUMMY_CLOCK_RATE_1), 0);

so we can easily see if something goes wrong that the set rate failed.
Good use of assert here, we don't want to continue with the test unless
the set rate actually worked.

> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);
> +       KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
> +}
> +
> +/*
> + * Test that, after several calls to clk_set_rate(), the rate returned
> + * by clk_get_rate() matches the last one.
> + *
> + * This assumes that clk_ops.determine_rate or clk_ops.round_rate won't
> + * modify the requested rate, which is our case in clk_dummy_rate_ops.
> + */
> +static void clk_rate_test_set_set_get_rate(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +       int ret;
> +
> +       ret =3D clk_set_rate(clk, DUMMY_CLOCK_RATE_1);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D clk_set_rate(clk, DUMMY_CLOCK_RATE_2);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);
> +       KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
> +}
> +
> +static struct kunit_case clk_rate_test_cases[] =3D {
> +       KUNIT_CASE(clk_rate_test_get_rate),
> +       KUNIT_CASE(clk_rate_test_set_get_rate),
> +       KUNIT_CASE(clk_rate_test_set_set_get_rate),
> +       {}
> +};
> +
> +static struct kunit_suite clk_rate_test_suite =3D {
> +       .name =3D "clk-rate-test",
> +       .init =3D clk_rate_test_init,
> +       .exit =3D clk_rate_test_exit,
> +       .test_cases =3D clk_rate_test_cases,
> +};
> +
> +/*
> + * Test that clk_set_rate_range won't return an error for a valid range.
> + */
> +static void clk_rate_range_test_set_range(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       int ret;
> +
> +       ret =3D clk_set_rate_range(clk,
> +                                DUMMY_CLOCK_RATE_1,
> +                                DUMMY_CLOCK_RATE_2);
> +       KUNIT_ASSERT_EQ(test, ret, 0);

Also make sure that the rate is within the bounds of rate_1 and rate_2?

> +}
> +
> +/*
> + * Test that calling clk_set_rate_range with a minimum rate higher than
> + * the maximum rate returns an error.
> + */
> +static void clk_rate_range_test_set_range_invalid(struct kunit *test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       int ret;
> +
> +       ret =3D clk_set_rate_range(clk,
> +                                DUMMY_CLOCK_RATE_1 + 1000,
> +                                DUMMY_CLOCK_RATE_1);
> +       KUNIT_ASSERT_EQ(test, ret, -EINVAL);

Let's not check for a specific error, but a negative value instead. I'd
rather not encode particular error values unless we need them to be
particular.

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
> +static void clk_rate_range_test_set_range_get_rate_raised(struct kunit *=
test)
> +{
> +       struct clk_dummy_rate_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +       int ret;
> +
> +       ret =3D clk_set_rate(clk, DUMMY_CLOCK_RATE_1 - 1000);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       ret =3D clk_set_rate_range(clk,
> +                                DUMMY_CLOCK_RATE_1,
> +                                DUMMY_CLOCK_RATE_2);
> +       KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_TRUE(test, rate > 0);

KUNIT_EXPECT_LE(test, clk_get_rate(clk), DUMMY_CLOCK_RATE_2);

Or just drop it entirely as DUMMY_CLOCK_RATE_1 is greater than 0 and
it's tested next.

> +       KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);

KUNIT_EXPECT_EQ(test, clk_get_rate(clk), DUMMY_CLOCK_RATE_1);

> +}
> +
