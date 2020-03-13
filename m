Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566E183E4B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 02:08:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30ED6EB5F;
	Fri, 13 Mar 2020 01:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999F66EB5F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 01:08:06 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 68DC020637;
 Fri, 13 Mar 2020 01:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584061686;
 bh=huEXu4fEaR36Ih1ki6oSbyO2Ljqw/b2nps3dQae6quM=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tcCm+pFo0bI3PzNwHW1FNS0Y4pKCzoj7LBVNj6HrlHelXTg7D6IZqc8jxUhJmwh2Z
 cFo+kCWxnMVnulnTe8GdD1iMtzYLCkSq/hpA+Dwj5UvPHQRbU1NM1RyOgKdu9xH/3H
 ntfuyLUKfrnARLfjankKgWRjOnCfUozAQ5zUaToI=
MIME-Version: 1.0
In-Reply-To: <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <d197ab836d84b89b94ff1927872126767d921e94.1582533919.git-series.maxime@cerno.tech>
Subject: Re: [PATCH 22/89] clk: bcm: rpi: Discover the firmware clocks
From: Stephen Boyd <sboyd@kernel.org>
To: Eric Anholt <eric@anholt.net>, Maxime Ripard <maxime@cerno.tech>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Date: Thu, 12 Mar 2020 18:08:05 -0700
Message-ID: <158406168552.149997.10601766692457449295@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Maxime Ripard (2020-02-24 01:06:24)
> The firmware has an interface to discover the clocks it exposes.
> 
> Let's use it to discover, register the clocks in the clocks framework and
> then expose them through the device tree for consumers to use them.

Everyone's doing it! :)

> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
> index 3f21888a3e3e..bf6a1e2dc099 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -285,6 +285,95 @@ static struct clk_hw *raspberrypi_register_pllb_arm(struct raspberrypi_clk *rpi)
>         return &raspberrypi_clk_pllb_arm.hw;
>  }
>  
> +static long raspberrypi_fw_dumb_round_rate(struct clk_hw *hw,
> +                                          unsigned long rate,
> +                                          unsigned long *parent_rate)
> +{
> +       return rate;

Can we get a comment here like "The firmware does the rounding but
doesn't tell us so we have to assume anything goes!"

> +}
> +
> +static const struct clk_ops raspberrypi_firmware_clk_ops = {
> +       .is_prepared    = raspberrypi_fw_is_prepared,
> +       .recalc_rate    = raspberrypi_fw_get_rate,
> +       .round_rate     = raspberrypi_fw_dumb_round_rate,
> +       .set_rate       = raspberrypi_fw_set_rate,
> +};
> +
> +static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
> +                                              unsigned int parent,
> +                                              unsigned int id)
> +{
> +       struct raspberrypi_clk_data *data;
> +       struct clk_init_data init = {};
> +       int ret;
> +
> +       if (id == RPI_FIRMWARE_ARM_CLK_ID) {
> +               struct clk_hw *hw;
> +
> +               hw = raspberrypi_register_pllb(rpi);
> +               if (IS_ERR(hw)) {
> +                       dev_err(rpi->dev, "Failed to initialize pllb, %ld\n",
> +                               PTR_ERR(hw));
> +                       return hw;
> +               }
> +
> +               hw = raspberrypi_register_pllb_arm(rpi);
> +               if (IS_ERR(hw))
> +                       return hw;
> +
> +               return hw;

Why the double return? Not just

	return raspberrypi_register_pllb_arm(rpi);

> +       }
> +
> +       data = devm_kzalloc(rpi->dev, sizeof(data), GFP_KERNEL);
> +       if (!data)
> +               return ERR_PTR(-ENOMEM);
> +       data->rpi = rpi;
> +       data->id = id;
> +
> +       init.name = devm_kasprintf(rpi->dev, GFP_KERNEL, "fw-clk-%u", id);
> +       init.ops = &raspberrypi_firmware_clk_ops;
> +       init.flags = CLK_GET_RATE_NOCACHE | CLK_IGNORE_UNUSED;

Why ignore unused? Doesn't seem to support enable/disable anyway so not
sure this flag adds any value.

> +
> +       data->hw.init = &init;
> +
> +       ret = devm_clk_hw_register(rpi->dev, &data->hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return &data->hw;
> +}
> +
> +static int raspberrypi_discover_clocks(struct raspberrypi_clk *rpi,
> +                                      struct clk_hw_onecell_data *data)
> +{
> +       struct rpi_firmware_get_clocks_response *clks;
> +       size_t clks_size = NUM_FW_CLKS * sizeof(*clks);
> +       int ret;
> +
> +       clks = devm_kzalloc(rpi->dev, clks_size, GFP_KERNEL);

Use devm_kcalloc to avoid overflow and indicate it's an array.

> +       if (!clks)
> +               return -ENOMEM;
> +
> +       ret = rpi_firmware_property(rpi->firmware, RPI_FIRMWARE_GET_CLOCKS,
> +                                   clks, clks_size);
> +       if (ret)
> +               return ret;
> +
> +       while (clks->id) {
> +               struct clk_hw *hw;
> +
> +               hw = raspberrypi_clk_register(rpi, clks->parent, clks->id);
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +
> +               data->hws[clks->id] = hw;
> +               data->num = clks->id + 1;
> +               clks++;
> +       }
> +
> +       return 0;
> +}
> +
>  static int raspberrypi_clk_probe(struct platform_device *pdev)
>  {
>         struct clk_hw_onecell_data *clk_data;
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index 7800e12ee042..e5b7a41bba6b 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -135,6 +135,11 @@ enum rpi_firmware_property_tag {
>         RPI_FIRMWARE_GET_DMA_CHANNELS =                       0x00060001,
>  };
>  
> +struct rpi_firmware_get_clocks_response {
> +       __le32  parent;
> +       __le32  id;

Why double spaced or tabbed out?

> +};
> +
>  #if IS_ENABLED(CONFIG_RASPBERRYPI_FIRMWARE)
>  int rpi_firmware_property(struct rpi_firmware *fw,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
