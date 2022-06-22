Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A6554551
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 12:36:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2E810E361;
	Wed, 22 Jun 2022 10:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB16010E361
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 10:36:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id z19so6425634edb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 03:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
 b=C60jruRIr3l7H20jbT6Re8q4TAOBzwgoJniFeCwP9jUCkCeFfZSyKWDXzuiR3+WsFk
 iug9mCtL5f/362puhR37XxfXjPTn+feFC8tv5f+bUCGxDr5RecoUaz5WL/iKgw40h3f5
 nRLlZkcl+Cgcr2kX9I7VZkqGcpVV39vi0d4feUx7Mg7xkPeRevq2RrFsFeI4kgEh2RbO
 1N8lkUgvGsbvP6nJ0yewhGBY+YbTQLHkQCH0wrxztTUCL3jR2tFJCgJ4iW4RmvFKBM5x
 9Wx0qhacGBBsF/oQxleSmTbsTojFMMwK1Y3Znaa7mITTI9ctZr+bJEAD7fH9uR2Py1m/
 LCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YFwi1vxkzrvgsqoCKPo5AQXebahZiMS5qtbuazVoioY=;
 b=mkNjPH8F1c6XW1NWZRSgtbvN6qxiLiXRNfgzNBRA91QwntDU5mJE6jqC7ysZOZW8Oq
 AOJCegCWBYQVTDryNffuYxIf7wnQDjgC9Bkb3fs2vMyiYzOrDjUaS+XwUDveBOfMqgF2
 Q4+gRS2IZ9bRwx0QJxUcKAVayR3a6RAh3HLH/p2R/RMV6nRiQLcTqzi+4TvQovyAS8k0
 uTiHJy59NzrPRCe1os/ajj/bCl+eCs5t4KDM00mVykDG92WbXHBZBtPo60OHQQ+CuJxL
 KvCsuQCQcgAwHLfcNSMzf13X+Jhabob6S2Z6NLtJGh41X4s+Ap5MPnLYp7wok+Yvx5mW
 oxCQ==
X-Gm-Message-State: AJIora8ihIUYm+z7+kodO6WD3BBX7u6LVvrYYqGI3hFrRvmhaDd3ffQA
 VNBUC/7ApMWljZdOO6FinuTsXLRFrNmZRxytvRI=
X-Google-Smtp-Source: AGRyM1tnnFr1LC7h/zRLo+HkB47D6IcosyajAFO4R/Wl+PPHAqyQruG56xeyLIJB7dGNj2Z8gyVtab2tS/XsOjguV9k=
X-Received: by 2002:a05:6402:5002:b0:435:1ff1:99ee with SMTP id
 p2-20020a056402500200b004351ff199eemr3312157eda.230.1655894208315; Wed, 22
 Jun 2022 03:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
 <d6b890c8-bfb5-cfa5-c6d8-ee245701c077@nvidia.com>
 <20220621204914.byokkrxiznvod7vq@pengutronix.de>
In-Reply-To: <20220621204914.byokkrxiznvod7vq@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 22 Jun 2022 12:36:11 +0200
Message-ID: <CAHp75VcBEpLo+pYy+RG3O2BbePJbGEQ89jxi-oG1W6=+2hgXrQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Alexandru Ardelean <aardelean@deviqon.com>,
 Tomislav Denis <tomislav.denis@avl.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-i2c <linux-i2c@vger.kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>,
 linux-iio <linux-iio@vger.kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Cai Huoqing <caihuoqing@baidu.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, NXP Linux Team <linux-imx@nxp.com>,
 linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Michal Simek <michal.simek@xilinx.com>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Lars Povlsen <lars.povlsen@microchip.com>, linux-hwmon@vger.kernel.org,
 Alessandro Zummo <a.zummo@towertech.it>,
 Keguang Zhang <keguang.zhang@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dmaengine <dmaengine@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-crypto <linux-crypto@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 21, 2022 at 11:01 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jun 21, 2022 at 08:57:00PM +0100, Jon Hunter wrote:

...

> (Pro tipp: The commit in next has a Link: footer. If you follow the
> link, you find the thread that was actually applied (i.e. v9) and where
> the fix is also contained.)

Even easier, you may take a message-id from the Link and supply to `b4`:

  b4 mbox ${message-id}
  mutt -f ${message-id}.mbx # or whatever MUA that handles mboxes


Dunno if `b4` has capability to parse Link instead of message-id.

--=20
With Best Regards,
Andy Shevchenko
