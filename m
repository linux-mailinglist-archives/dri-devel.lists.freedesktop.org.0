Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB4363E7FA
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 03:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA4D10E531;
	Thu,  1 Dec 2022 02:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D3310E531
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 02:41:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C136061E43;
 Thu,  1 Dec 2022 02:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40610C433B5;
 Thu,  1 Dec 2022 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669862478;
 bh=oEKpzlNT5/2REuZbJ9nJL8V6rmg/O7EETT/KejHSD8k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TH8159Vsmt/10ITe/zhNEMAr0DJShK7lsDLNDN2pIZAVofrn3gusqAdnBs2Qu1cSN
 XCcRLrdtEkYyNEI8SEx6SJRIKDIfDVpLhJHBOP8HqdCgkPwJb3zObY5B7KiqXqV5dU
 YfnDxebKZS69mB2aEBYlCb+U3U7FjKzExxd/CI1VOI09SsnQ0ZvEFiiDbtdXex5IWG
 DBHET0gvgxZrW9389IzXKRfWjYTgc2EntD3p+73FzHGNoSLfnluPj2RUUWlbsAOWtR
 7osJ2K8rd4L8EqCVdL03V/id7vZ6u9INSzhje+ZXfzQM9dAVuQaVr5VyJGNqZHVtHm
 ohZr0MuVoVdZQ==
Date: Thu, 1 Dec 2022 10:41:06 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2 01/11] pwm: Make .get_state() callback return an error
 code
Message-ID: <Y4gUQhdeZGm67Js2@google.com>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221130152148.2769768-2-u.kleine-koenig@pengutronix.de>
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
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-riscv@lists.infradead.org, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev,
 Florian Fainelli <f.fainelli@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Sean Anderson <sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Stephen Boyd <swboyd@chromium.org>, linux-gpio@vger.kernel.org,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 30, 2022 at 04:21:38PM +0100, Uwe Kleine-König wrote:
> diff --git a/drivers/pwm/pwm-cros-ec.c b/drivers/pwm/pwm-cros-ec.c
> index 7f10f56c3eb6..11684edc0620 100644
> --- a/drivers/pwm/pwm-cros-ec.c
> +++ b/drivers/pwm/pwm-cros-ec.c
> @@ -183,8 +183,8 @@ static int cros_ec_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>  	return 0;
>  }
>  
> -static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> -				  struct pwm_state *state)
> +static int cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
> +				 struct pwm_state *state)
>  {
>  	struct cros_ec_pwm_device *ec_pwm = pwm_to_cros_ec_pwm(chip);
>  	struct cros_ec_pwm *channel = pwm_get_chip_data(pwm);
> @@ -193,7 +193,7 @@ static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  	ret = cros_ec_pwm_get_duty(ec_pwm, pwm->hwpwm);
>  	if (ret < 0) {
>  		dev_err(chip->dev, "error getting initial duty: %d\n", ret);
> -		return;
> +		return 0;
>  	}
>  
>  	state->enabled = (ret > 0);
> @@ -212,6 +212,8 @@ static void cros_ec_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
>  		state->duty_cycle = channel->duty_cycle;
>  	else
>  		state->duty_cycle = ret;
> +
> +	return 0;
>  }

For the cros-ec part:
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
