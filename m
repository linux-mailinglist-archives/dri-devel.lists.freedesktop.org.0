Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FCB52E0C8
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 01:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68BA10E0F4;
	Thu, 19 May 2022 23:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B09610E033
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 23:46:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A109B828AF;
 Thu, 19 May 2022 23:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C6DC385AA;
 Thu, 19 May 2022 23:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653003959;
 bh=J/86NYRxXvo0kg+4FsDJ+dYPDoSwx3afdJ6QdTs8OyA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=D9rd4xxAzi+lnV0CSGhJNepB2FAXckzHnWQwdFd5MSxsL+/jhg/jVTREPtoj0gGPG
 ctTGSF3Qk1uBFZoNhz7QvMwg5z+JWEdvsXVn2B+6/x3PZNVX0rt4otOkfWITG/IOYu
 qlYc+Y3KAjPU+sRXBXmj5MtTMJTUshr/hvqzi7fPcZxCRnpAQyE1mZb6aBiBrH6AfX
 2L3+RMnZitJdoVtdpLLXMG2scFNHhq9OmgViHvJYun/lulKu747Xnf1H9aTJkyORy+
 9riGd3tUDuYRThZzmJVDGht+HDyYrVa6q9aGv+kZ6tgdLl6XFt67peXSMoK1CJ9o/X
 8i9/Qk6HWLj+A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v8 02/16] clk: Provide new devm_clk helpers for prepared
 and enabled clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Herbert Xu <herbert@gondor.apana.org.au>,
 Jean Delvare <jdelvare@suse.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee.jones@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matt Mackall <mpm@selenic.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong <narmstrong@bayli
 bre.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nuno =?utf-8?q?S=C3=A1?= <nuno.sa@analog.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Paul Cercueil <paul@crapouillou.net>,
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, UNGLinuxDriver@microchip.com,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
Date: Thu, 19 May 2022 16:45:57 -0700
User-Agent: alot/0.10
Message-Id: <20220519234559.90C6DC385AA@smtp.kernel.org>
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
Cc: Tomislav Denis <tomislav.denis@avl.com>,
	linux-iio@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	linux-i2c@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-rtc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	".kernel.org"@freedesktop.org, Andy Gross <agross@kernel.org>,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>, kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
	=?utf-8?q?Andr=C3=A9?= Gustavo Nakagomi Lopez <andregnl@usp.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-amlogic@lists.infradead.org, linux-pwm@vger,
	Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
	linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
	Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Cc list is huge. Here it goes!

Quoting Uwe Kleine-K=C3=B6nig (2022-03-14 07:16:29)
> When a driver keeps a clock prepared (or enabled) during the whole
> lifetime of the driver, these helpers allow to simplify the drivers.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alexandru Ardelean <aardelean@deviqon.com>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

I'm ready to merge it! I'm largely waiting for Russell to ack the clk.h
change, but if that doesn't happen then I think we'll have to merge it
anyway. Can you resend with collected acks, maybe just the ones you want
me to merge through clk tree? Then I'll go ahead and stage it. Some
nitpicks below.

>  drivers/clk/clk-devres.c | 31 ++++++++++++++
>  include/linux/clk.h      | 90 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 120 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index fb7761888b30..4707fe718f0b 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -67,12 +67,43 @@ struct clk *devm_clk_get(struct device *dev, const ch=
ar *id)
>  }
>  EXPORT_SYMBOL(devm_clk_get);
> =20
> +struct clk *devm_clk_get_prepared(struct device *dev, const char *id)
> +{
> +       return __devm_clk_get(dev, id, clk_get, clk_prepare, clk_unprepar=
e);
> +

Nitpick: Remove newline

> +}
> +EXPORT_SYMBOL(devm_clk_get_prepared);
> +
> +struct clk *devm_clk_get_enabled(struct device *dev, const char *id)
> +{
> +       return __devm_clk_get(dev, id, clk_get,
> +                             clk_prepare_enable, clk_disable_unprepare);
> +

Nitpick: Remove newline

> +}
> +EXPORT_SYMBOL(devm_clk_get_enabled);
> +
>  struct clk *devm_clk_get_optional(struct device *dev, const char *id)
>  {
>         return __devm_clk_get(dev, id, clk_get_optional, NULL, NULL);
>  }
>  EXPORT_SYMBOL(devm_clk_get_optional);
> =20
> +struct clk *devm_clk_get_optional_prepared(struct device *dev, const cha=
r *id)
> +{
> +       return __devm_clk_get(dev, id, clk_get_optional,
> +                             clk_prepare, clk_unprepare);
> +

Nitpick: Remove newline

> +}
> +EXPORT_SYMBOL(devm_clk_get_optional_prepared);
> +
> +struct clk *devm_clk_get_optional_enabled(struct device *dev, const char=
 *id)
> +{
> +       return __devm_clk_get(dev, id, clk_get_optional,
> +                             clk_prepare_enable, clk_disable_unprepare);
> +

Nitpick: Remove newline

> +}
> +EXPORT_SYMBOL(devm_clk_get_optional_enabled);

EXPORT_SYMBOL_GPL for all of these? Or make them macros and cut down on
the number of symbols.

> +
>  struct clk_bulk_devres {
>         struct clk_bulk_data *clks;
>         int num_clks;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 266e8de3cb51..b011dbba7109 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -449,7 +449,7 @@ int __must_check devm_clk_bulk_get_all(struct device =
*dev,
>   * the clock producer.  (IOW, @id may be identical strings, but
>   * clk_get may return different clock producers depending on @dev.)
>   *
> - * Drivers must assume that the clock source is not enabled.
> + * Drivers must assume that the clock source is neither prepared nor ena=
bled.
>   *
>   * devm_clk_get should not be called from within interrupt context.
>   *

Can you split this off to another patch? It's updating the doc to
clarify the assumed state of a clk returned from this API.

> @@ -458,6 +458,47 @@ int __must_check devm_clk_bulk_get_all(struct device=
 *dev,
>   */
>  struct clk *devm_clk_get(struct device *dev, const char *id);
> =20
> +/**
> + * devm_clk_get_prepared - devm_clk_get() + clk_prepare()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Returns a struct clk corresponding to the clock producer, or
> + * valid IS_ERR() condition containing errno.  The implementation
> + * uses @dev and @id to determine the clock consumer, and thereby
> + * the clock producer.  (IOW, @id may be identical strings, but
> + * clk_get may return different clock producers depending on @dev.)
> + *
> + * The returned clk (if valid) is prepared. Drivers must however assume =
that the
> + * clock is not enabled.
> + *
> + * devm_clk_get_prepared should not be called from within interrupt cont=
ext.

There's 'Context:' for this. Please use it.

> + *
> + * The clock will automatically be unprepared and freed when the
> + * device is unbound from the bus.
> + */
> +struct clk *devm_clk_get_prepared(struct device *dev, const char *id);
> +
> +/**
> + * devm_clk_get_enabled - devm_clk_get() + clk_prepare_enable()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Returns a struct clk corresponding to the clock producer, or valid IS=
_ERR()

There's 'Return:' for this. Please use it.

> + * condition containing errno.  The implementation uses @dev and @id to
> + * determine the clock consumer, and thereby the clock producer.  (IOW, =
@id may
> + * be identical strings, but clk_get may return different clock producers
> + * depending on @dev.)
> + *
> + * The returned clk (if valid) is prepared and enabled.
> + *
> + * devm_clk_get_prepared should not be called from within interrupt cont=
ext.
> + *
> + * The clock will automatically be disabled, unprepared and freed when t=
he
> + * device is unbound from the bus.
> + */
> +struct clk *devm_clk_get_enabled(struct device *dev, const char *id);
> +
>  /**
>   * devm_clk_get_optional - lookup and obtain a managed reference to an o=
ptional
>   *                        clock producer.
> @@ -469,6 +510,29 @@ struct clk *devm_clk_get(struct device *dev, const c=
har *id);
>   */
>  struct clk *devm_clk_get_optional(struct device *dev, const char *id);
> =20
> +/**
> + * devm_clk_get_optional_prepared - devm_clk_get_optional() + clk_prepar=
e()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Behaves the same as devm_clk_get_prepared() except where there is no =
clock
> + * producer.  In this case, instead of returning -ENOENT, the function r=
eturns
> + * NULL.

When it comes to kernel-doc I think the DRY principle should not apply.
I don't want to have to jump to one doc block to jump to another doc
block while holding the previous verbage in my head to understand what
the difference is. Please be repetitive with documentation for APIs :)

> + */
> +struct clk *devm_clk_get_optional_prepared(struct device *dev, const cha=
r *id);
> +
> +/**
> + * devm_clk_get_optional_enabled - devm_clk_get_optional() +
> + *                                 clk_prepare_enable()
> + * @dev: device for clock "consumer"
> + * @id: clock consumer ID
> + *
> + * Behaves the same as devm_clk_get_enabled() except where there is no c=
lock
> + * producer.  In this case, instead of returning -ENOENT, the function r=
eturns
> + * NULL.
> + */
> +struct clk *devm_clk_get_optional_enabled(struct device *dev, const char=
 *id);
> +
>  /**
>   * devm_get_clk_from_child - lookup and obtain a managed reference to a
>   *                          clock producer from child node.
