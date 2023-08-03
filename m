Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C69EA76F4D6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 23:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA45510E67A;
	Thu,  3 Aug 2023 21:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FAC10E67A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 21:52:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5DF12CF;
 Thu,  3 Aug 2023 23:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691099510;
 bh=4nr+pCFvRIDbDtYoKOpZHa11XbIzghHLOacwxCPgWv0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGUpWfWmlbDM/JBOqZX1yp/eoV/Rcz/Zn23aC6MnCRuqPimeo3C+zvWkqj5pmsWsF
 qv0j+Fh16ePKbMCewYGqMvxtSv439imwpmCOJFWYpqy22mz/We9dKU4kmGbLhtt0OS
 bhhdQ0NafJU6hdCRH2blWEIsRatPNcAPMTU3f7HU=
Date: Fri, 4 Aug 2023 00:53:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2] pwm: Manage owner assignment implicitly for drivers
Message-ID: <20230803215300.GH27752@pendragon.ideasonboard.com>
References: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
 <20230803140633.138165-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230803140633.138165-2-u.kleine-koenig@pengutronix.de>
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
 linux-staging@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Johan Hovold <johan@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@amd.com>, linux-riscv@lists.infradead.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>,
 Michael Walle <michael@walle.cc>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Sven Peter <sven@svenpeter.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Alex Elder <elder@kernel.org>, Alexander Shiyan <shc_work@mail.ru>,
 Scott Branden <sbranden@broadcom.com>, greybus-dev@lists.linaro.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, dri-devel@lists.freedesktop.org,
 Hector Martin <marcan@marcan.st>, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, asahi@lists.linux.dev,
 Kevin Hilman <khilman@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

Thank you for the patch.

On Thu, Aug 03, 2023 at 04:06:31PM +0200, Uwe Kleine-König wrote:
> Instead of requiring each driver to care for assigning the owner member
> of struct pwm_ops, handle that implicitly using a macro. Note that the
> owner member has to be moved to struct pwm_chip, as the ops structure
> usually lives in read-only memory and so cannot be modified.

While technically speaking the ops and pwm chip could be provided by
different modules, such a use case would likely require a high level of
self-inflicted pain, so I think the change is fine.

> The upside is that new lowlevel drivers cannot forget the assignment and
> save one line each. The pwm-crc driver didn't assign .owner, that's not
> a problem in practise though as the driver cannot be compiled as a
> module.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpio/gpio-mvebu.c             |  1 -
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c |  1 -
>  drivers/leds/rgb/leds-qcom-lpg.c      |  1 -
>  drivers/pwm/core.c                    | 20 +++++++++++---------
>  drivers/pwm/pwm-ab8500.c              |  1 -
>  drivers/pwm/pwm-apple.c               |  1 -
>  drivers/pwm/pwm-atmel-hlcdc.c         |  1 -
>  drivers/pwm/pwm-atmel-tcb.c           |  1 -
>  drivers/pwm/pwm-atmel.c               |  1 -
>  drivers/pwm/pwm-bcm-iproc.c           |  1 -
>  drivers/pwm/pwm-bcm-kona.c            |  1 -
>  drivers/pwm/pwm-bcm2835.c             |  1 -
>  drivers/pwm/pwm-berlin.c              |  1 -
>  drivers/pwm/pwm-brcmstb.c             |  1 -
>  drivers/pwm/pwm-clk.c                 |  1 -
>  drivers/pwm/pwm-clps711x.c            |  1 -
>  drivers/pwm/pwm-cros-ec.c             |  1 -
>  drivers/pwm/pwm-dwc.c                 |  1 -
>  drivers/pwm/pwm-ep93xx.c              |  1 -
>  drivers/pwm/pwm-fsl-ftm.c             |  1 -
>  drivers/pwm/pwm-hibvt.c               |  1 -
>  drivers/pwm/pwm-img.c                 |  1 -
>  drivers/pwm/pwm-imx-tpm.c             |  1 -
>  drivers/pwm/pwm-imx1.c                |  1 -
>  drivers/pwm/pwm-imx27.c               |  1 -
>  drivers/pwm/pwm-intel-lgm.c           |  1 -
>  drivers/pwm/pwm-iqs620a.c             |  1 -
>  drivers/pwm/pwm-jz4740.c              |  1 -
>  drivers/pwm/pwm-keembay.c             |  1 -
>  drivers/pwm/pwm-lp3943.c              |  1 -
>  drivers/pwm/pwm-lpc18xx-sct.c         |  1 -
>  drivers/pwm/pwm-lpc32xx.c             |  1 -
>  drivers/pwm/pwm-lpss.c                |  1 -
>  drivers/pwm/pwm-mediatek.c            |  1 -
>  drivers/pwm/pwm-meson.c               |  1 -
>  drivers/pwm/pwm-microchip-core.c      |  1 -
>  drivers/pwm/pwm-mtk-disp.c            |  1 -
>  drivers/pwm/pwm-mxs.c                 |  1 -
>  drivers/pwm/pwm-ntxec.c               |  1 -
>  drivers/pwm/pwm-omap-dmtimer.c        |  1 -
>  drivers/pwm/pwm-pca9685.c             |  1 -
>  drivers/pwm/pwm-pxa.c                 |  1 -
>  drivers/pwm/pwm-raspberrypi-poe.c     |  1 -
>  drivers/pwm/pwm-rcar.c                |  1 -
>  drivers/pwm/pwm-renesas-tpu.c         |  1 -
>  drivers/pwm/pwm-rockchip.c            |  1 -
>  drivers/pwm/pwm-rz-mtu3.c             |  1 -
>  drivers/pwm/pwm-samsung.c             |  1 -
>  drivers/pwm/pwm-sifive.c              |  1 -
>  drivers/pwm/pwm-sl28cpld.c            |  1 -
>  drivers/pwm/pwm-spear.c               |  1 -
>  drivers/pwm/pwm-sprd.c                |  1 -
>  drivers/pwm/pwm-sti.c                 |  1 -
>  drivers/pwm/pwm-stm32-lp.c            |  1 -
>  drivers/pwm/pwm-stm32.c               |  1 -
>  drivers/pwm/pwm-stmpe.c               |  1 -
>  drivers/pwm/pwm-sun4i.c               |  1 -
>  drivers/pwm/pwm-sunplus.c             |  1 -
>  drivers/pwm/pwm-tegra.c               |  1 -
>  drivers/pwm/pwm-tiecap.c              |  1 -
>  drivers/pwm/pwm-tiehrpwm.c            |  1 -
>  drivers/pwm/pwm-twl-led.c             |  2 --
>  drivers/pwm/pwm-twl.c                 |  2 --
>  drivers/pwm/pwm-visconti.c            |  1 -
>  drivers/pwm/pwm-vt8500.c              |  1 -
>  drivers/pwm/pwm-xilinx.c              |  1 -
>  drivers/staging/greybus/pwm.c         |  1 -
>  include/linux/pwm.h                   |  8 +++++---
>  68 files changed, 16 insertions(+), 80 deletions(-)

[snip]

> diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> index dc66e3405bf5..96069c6d3d69 100644
> --- a/drivers/pwm/core.c
> +++ b/drivers/pwm/core.c
> @@ -89,13 +89,13 @@ static int pwm_device_request(struct pwm_device *pwm, const char *label)
>  	if (test_bit(PWMF_REQUESTED, &pwm->flags))
>  		return -EBUSY;
>  
> -	if (!try_module_get(pwm->chip->ops->owner))
> +	if (!try_module_get(pwm->chip->owner))
>  		return -ENODEV;
>  
>  	if (pwm->chip->ops->request) {
>  		err = pwm->chip->ops->request(pwm->chip, pwm);
>  		if (err) {
> -			module_put(pwm->chip->ops->owner);
> +			module_put(pwm->chip->owner);
>  			return err;
>  		}
>  	}
> @@ -253,14 +253,14 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
>  }
>  
>  /**
> - * pwmchip_add() - register a new PWM chip
> + * __pwmchip_add() - register a new PWM chip
>   * @chip: the PWM chip to add

Missing documentation for the new owner parameter.

>   *
>   * Register a new PWM chip.
>   *
>   * Returns: 0 on success or a negative error code on failure.
>   */
> -int pwmchip_add(struct pwm_chip *chip)
> +int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
>  {
>  	struct pwm_device *pwm;
>  	unsigned int i;
> @@ -272,6 +272,8 @@ int pwmchip_add(struct pwm_chip *chip)
>  	if (!pwm_ops_check(chip))
>  		return -EINVAL;
>  
> +	chip->owner = owner;
> +
>  	chip->pwms = kcalloc(chip->npwm, sizeof(*pwm), GFP_KERNEL);
>  	if (!chip->pwms)
>  		return -ENOMEM;
> @@ -306,7 +308,7 @@ int pwmchip_add(struct pwm_chip *chip)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL_GPL(pwmchip_add);
> +EXPORT_SYMBOL_GPL(__pwmchip_add);
>  
>  /**
>   * pwmchip_remove() - remove a PWM chip
> @@ -338,17 +340,17 @@ static void devm_pwmchip_remove(void *data)
>  	pwmchip_remove(chip);
>  }
>  
> -int devm_pwmchip_add(struct device *dev, struct pwm_chip *chip)
> +int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner)
>  {
>  	int ret;
>  
> -	ret = pwmchip_add(chip);
> +	ret = __pwmchip_add(chip, owner);
>  	if (ret)
>  		return ret;
>  
>  	return devm_add_action_or_reset(dev, devm_pwmchip_remove, chip);
>  }
> -EXPORT_SYMBOL_GPL(devm_pwmchip_add);
> +EXPORT_SYMBOL_GPL(__devm_pwmchip_add);
>  
>  /**
>   * pwm_request_from_chip() - request a PWM device relative to a PWM chip
> @@ -979,7 +981,7 @@ void pwm_put(struct pwm_device *pwm)
>  	pwm_set_chip_data(pwm, NULL);
>  	pwm->label = NULL;
>  
> -	module_put(pwm->chip->ops->owner);
> +	module_put(pwm->chip->owner);
>  out:
>  	mutex_unlock(&pwm_lock);
>  }

[snip]

> diff --git a/include/linux/pwm.h b/include/linux/pwm.h
> index d2f9f690a9c1..d9fa0114edfa 100644
> --- a/include/linux/pwm.h
> +++ b/include/linux/pwm.h
> @@ -278,7 +278,6 @@ struct pwm_ops {
>  		     const struct pwm_state *state);
>  	int (*get_state)(struct pwm_chip *chip, struct pwm_device *pwm,
>  			 struct pwm_state *state);
> -	struct module *owner;
>  };
>  
>  /**

Missing documentation update here too, for both pwm_ops and pwm_chip.

> @@ -295,6 +294,7 @@ struct pwm_ops {
>  struct pwm_chip {
>  	struct device *dev;
>  	const struct pwm_ops *ops;
> +	struct module *owner;
>  	int base;
>  	unsigned int npwm;
>  
> @@ -386,10 +386,12 @@ int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
>  int pwm_set_chip_data(struct pwm_device *pwm, void *data);
>  void *pwm_get_chip_data(struct pwm_device *pwm);
>  
> -int pwmchip_add(struct pwm_chip *chip);
> +int __pwmchip_add(struct pwm_chip *chip, struct module *owner);
> +#define pwmchip_add(chip) __pwmchip_add(chip, THIS_MODULE)
>  void pwmchip_remove(struct pwm_chip *chip);
>  
> -int devm_pwmchip_add(struct device *dev, struct pwm_chip *chip);
> +int __devm_pwmchip_add(struct device *dev, struct pwm_chip *chip, struct module *owner);
> +#define devm_pwmchip_add(dev, chip) __devm_pwmchip_add(dev, chip, THIS_MODULE)
>  
>  struct pwm_device *pwm_request_from_chip(struct pwm_chip *chip,
>  					 unsigned int index,

-- 
Regards,

Laurent Pinchart
