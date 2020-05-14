Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3B31D3F83
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 23:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA7A6E392;
	Thu, 14 May 2020 21:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D876E392
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 21:02:28 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4298206F1;
 Thu, 14 May 2020 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589490148;
 bh=BpiNhcYdcKddO8cs3Vt8IZUscWTK1/Is8oqrDfZkC6w=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=hyfFgR+GL76NQf566ZtlB+WOryIov5DSxhUL5b5JUGfd+iX0ldBn3aeIuHEmGYr5F
 EJi9Wz7J28FNtt08VJYBztNyXwTQJ6uHS1pGhU4g7jeCKpOQ1WCr4QwXnoluVb/vcF
 CFUnP5fIMuLO3vUY90BKaBpUzqs5HHWHXbnfeD0k=
MIME-Version: 1.0
In-Reply-To: <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
Subject: Re: [PATCH v3 4/5] clk: stm32: Fix stm32f429 ltdc driver loading hang
 in clk set rate. keep ltdc clk running after kernel startup
From: Stephen Boyd <sboyd@kernel.org>
To: airlied@linux.ie, alexandre.torgue@st.com, daniel@ffwll.ch,
 dillon.minfei@gmail.com, mcoquelin.stm32@gmail.com, mturquette@baylibre.com,
 robh+dt@kernel.org, sam@ravnborg.org, thierry.reding@gmail.com
Date: Thu, 14 May 2020 14:02:27 -0700
Message-ID: <158949014721.215346.12197373767247910756@swboyd.mtv.corp.google.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon.minfei@gmail.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting dillon.minfei@gmail.com (2020-05-12 00:03:36)
> From: dillon min <dillon.minfei@gmail.com>
> 
> as store stm32f4_rcc_register_pll return to the wrong offset of clks,

Use () on functions, i.e. stm32f4_rcc_register_pll().

> so ltdc gate clk is null. need change clks[PLL_VCO_SAI] to clks[PLL_SAI]

And quote variables like 'clks[PLL_VCO_SAI]'

> 
> add CLK_IGNORE_UNUSED for ltdc to make sure clk not be freed by
> clk_disable_unused

clk_disable_unused() doesn't free anything. Why does ltdc not need to be
turned off if it isn't used? Is it critical to system operation? Should
it be marked with the critical clk flag then? The CLK_IGNORE_UNUSED flag
is almost always wrong to use.

> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  drivers/clk/clk-stm32f4.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> index 18117ce..0ba73de 100644
> --- a/drivers/clk/clk-stm32f4.c
> +++ b/drivers/clk/clk-stm32f4.c
> @@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
>         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
>         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> +       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div",
> +               CLK_IGNORE_UNUSED },
>  };
>  
>  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> @@ -1757,7 +1758,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>         clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
>                         &data->pll_data[1], &stm32f4_clk_lock);
>  
> -       clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
> +       clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
>                         &data->pll_data[2], &stm32f4_clk_lock);
>  
>         for (n = 0; n < MAX_POST_DIV; n++) {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
