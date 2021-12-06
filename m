Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0735246A3AF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 19:01:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79977303A;
	Mon,  6 Dec 2021 18:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AEF7307D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 18:01:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso11042923wml.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Dec 2021 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q9TB5L3pJqH034RrkOc/VLuSxLmPEULukTAjdScgLdU=;
 b=AVXpJ0dqi4VCMNYAqPhtWJQ+fro0r3PuUy1JazShPyuuBHkW+5OIei4C53evuKsSGt
 g9d0wOK/EHsr++CTkUhtuJ/25aRA1SWNAWJxE2Ekk252YHJ5ThFf6Yx0axKziHJguO5s
 utXYBnvzFYaTSKArwuTnGBLTywFWYvKSm50SketT3fHg41ZuBYAPqpXN8bTDsvxrXHB3
 MoAaUXG6bSmJQFMf6G4QcOAtTTMNrFQJ5n4LLeAIgPFFgZ1kmnjIueEFIYailVO5+nr2
 lgylLezhj8FrWwy3Q77F0k6CpdRxjt3A1OW4MA/5GY2iqSLggGPesJw5KzE4AV7je9Ui
 QAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q9TB5L3pJqH034RrkOc/VLuSxLmPEULukTAjdScgLdU=;
 b=FOUUJbH3Jsl3eaP+Jy4v46BE42FPY9Lp9hhF6YdldXe5rzcN8ici38QcwLuG8DGwL5
 rKUcqnkc/2sfpUGNgkQSLSqVCpU0Vf5LRMTJp1HAFDTSxdy0j8/CC38L5HWEVqEPTD9v
 He7nZaIBn9SUjfbmda5ehP5/r9EPBIsDPFKVqSA/oqevW3hoBfS30AjnnFVJbI3DQfQw
 Iv/Qc66zncvWP5yJbD0UwejIm9sr2QSHg84iRwlETuPTIicPZi1rMAVQO3SVzDhgTD7C
 wNsNUnj4PRZp1f6E2HFqFicjjr+jTqxtJtEuX2UAYXoAy4QtB6QK6euWSbZaifUkpl3S
 NRiA==
X-Gm-Message-State: AOAM532B+GP/OC6y6Hr947T/P6JedelYmLG7/6mxoogDwCf6a4o4yJB1
 yk67jSyvIbSGl8b+MTJK+5BP39ELkHrljOtdz7saLA==
X-Google-Smtp-Source: ABdhPJw3wJVHQk5fL712h+2i+5UZqJ/uRIUPqQ0h6Zmn+o3zlFCOtjcZ0NUBHwEWwgtLoGV++aQY9WEjWOwiTJXzGmU=
X-Received: by 2002:a05:600c:358a:: with SMTP id
 p10mr84054wmq.180.1638813700438; 
 Mon, 06 Dec 2021 10:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20211127032405.283435-1-marex@denx.de>
 <20211127032405.283435-2-marex@denx.de>
In-Reply-To: <20211127032405.283435-2-marex@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 6 Dec 2021 18:01:24 +0000
Message-ID: <CAPY8ntAhWH0Wdg4EX2DOMPp-8CKimqmSHpMeJ64QFPpVfp1d2g@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: tc358767: Move hardware init to enable
 callback
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek

On Sat, 27 Nov 2021 at 03:24, Marek Vasut <marex@denx.de> wrote:
>
> The TC358767/TC358867/TC9595 are all capable of operating either from
> attached Xtal or from DSI clock lane clock. In case the later is used,
> all I2C accesses will fail until the DSI clock lane is running and
> supplying clock to the chip.
>
> Move all hardware initialization to enable callback to guarantee the
> DSI clock lane is running before accessing the hardware. In case Xtal
> is attached to the chip, this change has no effect.

This puzzles me as there seem to be a couple of ambiguities over how
it would be used.

Firstly the DT binding lists the clock as a required property, but
there isn't one present if deriving the clock from the DSI clock lane.

Secondly the datasheet states that the DSI Reference Clock Source
Division Selection is done by the MODE1 pin, and switches between
HSCKBY2 divided by 7 and HSCKBY2 divided by 9. There is a stated
assumption that HSCK is either 364MHz or 468MHz, thereby ending up
with 26MHz. To do this we have to be running DSI in burst mode, but
the support for that in DRM is near zero.

Can I ask how the chip has actually been configured and run in this mode?

Thanks
  Dave

> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 111 +++++++++++++++++-------------
>  1 file changed, 63 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 23a6f90b694b..f7fbf6f673e9 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1234,11 +1234,74 @@ static int tc_stream_disable(struct tc_data *tc)
>         return 0;
>  }
>
> +static int tc_hardware_init(struct tc_data *tc)
> +{
> +       int ret;
> +
> +       ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
> +       if (ret) {
> +               dev_err(tc->dev, "can not read device ID: %d\n", ret);
> +               return ret;
> +       }
> +
> +       if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
> +               dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
> +               return -EINVAL;
> +       }
> +
> +       tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
> +
> +       if (!tc->reset_gpio) {
> +               /*
> +                * If the reset pin isn't present, do a software reset. It isn't
> +                * as thorough as the hardware reset, as we can't reset the I2C
> +                * communication block for obvious reasons, but it's getting the
> +                * chip into a defined state.
> +                */
> +               regmap_update_bits(tc->regmap, SYSRSTENB,
> +                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> +                               0);
> +               regmap_update_bits(tc->regmap, SYSRSTENB,
> +                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> +                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
> +               usleep_range(5000, 10000);
> +       }
> +
> +       if (tc->hpd_pin >= 0) {
> +               u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
> +               u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
> +
> +               /* Set LCNT to 2ms */
> +               regmap_write(tc->regmap, lcnt_reg,
> +                            clk_get_rate(tc->refclk) * 2 / 1000);
> +               /* We need the "alternate" mode for HPD */
> +               regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
> +
> +               if (tc->have_irq) {
> +                       /* enable H & LC */
> +                       regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
> +               }
> +       }
> +
> +       if (tc->have_irq) {
> +               /* enable SysErr */
> +               regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
> +       }
> +
> +       return 0;
> +}
> +
>  static void tc_bridge_enable(struct drm_bridge *bridge)
>  {
>         struct tc_data *tc = bridge_to_tc(bridge);
>         int ret;
>
> +       ret = tc_hardware_init(tc);
> +       if (ret < 0) {
> +               dev_err(tc->dev, "failed to initialize bridge: %d\n", ret);
> +               return;
> +       }
> +
>         ret = tc_get_display_props(tc);
>         if (ret < 0) {
>                 dev_err(tc->dev, "failed to read display props: %d\n", ret);
> @@ -1626,9 +1689,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>         }
>
>         if (client->irq > 0) {
> -               /* enable SysErr */
> -               regmap_write(tc->regmap, INTCTL_G, INT_SYSERR);
> -
>                 ret = devm_request_threaded_irq(dev, client->irq,
>                                                 NULL, tc_irq_handler,
>                                                 IRQF_ONESHOT,
> @@ -1641,51 +1701,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>                 tc->have_irq = true;
>         }
>
> -       ret = regmap_read(tc->regmap, TC_IDREG, &tc->rev);
> -       if (ret) {
> -               dev_err(tc->dev, "can not read device ID: %d\n", ret);
> -               return ret;
> -       }
> -
> -       if ((tc->rev != 0x6601) && (tc->rev != 0x6603)) {
> -               dev_err(tc->dev, "invalid device ID: 0x%08x\n", tc->rev);
> -               return -EINVAL;
> -       }
> -
> -       tc->assr = (tc->rev == 0x6601); /* Enable ASSR for eDP panels */
> -
> -       if (!tc->reset_gpio) {
> -               /*
> -                * If the reset pin isn't present, do a software reset. It isn't
> -                * as thorough as the hardware reset, as we can't reset the I2C
> -                * communication block for obvious reasons, but it's getting the
> -                * chip into a defined state.
> -                */
> -               regmap_update_bits(tc->regmap, SYSRSTENB,
> -                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> -                               0);
> -               regmap_update_bits(tc->regmap, SYSRSTENB,
> -                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP,
> -                               ENBLCD0 | ENBBM | ENBDSIRX | ENBREG | ENBHDCP);
> -               usleep_range(5000, 10000);
> -       }
> -
> -       if (tc->hpd_pin >= 0) {
> -               u32 lcnt_reg = tc->hpd_pin == 0 ? INT_GP0_LCNT : INT_GP1_LCNT;
> -               u32 h_lc = INT_GPIO_H(tc->hpd_pin) | INT_GPIO_LC(tc->hpd_pin);
> -
> -               /* Set LCNT to 2ms */
> -               regmap_write(tc->regmap, lcnt_reg,
> -                            clk_get_rate(tc->refclk) * 2 / 1000);
> -               /* We need the "alternate" mode for HPD */
> -               regmap_write(tc->regmap, GPIOM, BIT(tc->hpd_pin));
> -
> -               if (tc->have_irq) {
> -                       /* enable H & LC */
> -                       regmap_update_bits(tc->regmap, INTCTL_G, h_lc, h_lc);
> -               }
> -       }
> -
>         ret = tc_aux_link_setup(tc);
>         if (ret)
>                 return ret;
> --
> 2.33.0
>
