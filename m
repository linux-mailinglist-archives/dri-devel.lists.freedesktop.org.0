Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F67776188
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 15:46:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B8E10E442;
	Wed,  9 Aug 2023 13:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Wed, 09 Aug 2023 13:46:29 UTC
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99C9F10E442
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:46:29 +0000 (UTC)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 18516124F;
 Wed,  9 Aug 2023 15:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1691588293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Btky6tTdvG25ZLsauzNmPRJKTtp0p2jrZzqQzvClL8=;
 b=r4wKl3ihNbNJWLLG5hf4K10pWKB/qcqJZWT79pdX14Hwy6cFCNoDp523ysrGvSxR0hF0sV
 S19UUVxjs0tcqcFDwaa/NkVjQnAj2+cyBE5RQNYWGpyiW44j/FWxQygtTL+wtS+237ZPBi
 AtOsW9She/DFFxiMreuzoOh5io7RuXTgqIlbCCUn4LHHa90Z+A4PZo97sfdrSy4KQLmkYs
 hhFi301ZV0pK+bOMSJlqwINPWSXFfHk08E4h61f4wk1UScNwCWh6iBthi3AlIm+EDBA4U6
 GVakjg8rtPJGDbRJZnIXlKnvbOR8bknUPLybW2kI3kAAfIaJexJ1gSpJk2GYOw==
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:38:12 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Message-ID: <a6ba206a709b2f4f1c817df8c868a683@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor.dooley@microchip.com>,
 Pavel Machek <pavel@ucw.cz>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev,
 Sascha Hauer <s.hauer@pengutronix.de>, Andy Shevchenko <andy@kernel.org>,
 Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Bjorn Andersson <quic_bjorande@quicinc.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Lee Jones <lee@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, greybus-dev@lists.linaro.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Alexander Shiyan <shc_work@mail.ru>,
 linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Weiss <luca@z3ntu.xyz>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch?= =?UTF-8?Q?=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Florian Fainelli <florian.fainelli@broadcom.com>,
 Sven Peter <sven@svenpeter.dev>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-tegra@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.
> 
> The upside is that new lowlevel drivers cannot forget the assignment 
> and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

...

>  drivers/pwm/pwm-sl28cpld.c            |  1 -

Acked-by: Michael Walle <michael@walle.cc>
