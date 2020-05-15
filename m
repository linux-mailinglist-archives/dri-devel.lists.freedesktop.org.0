Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 364DA1D6024
	for <lists+dri-devel@lfdr.de>; Sat, 16 May 2020 11:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B906E128;
	Sat, 16 May 2020 09:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D4C6EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:32:29 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id h10so2074787iob.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mp1O72Xdq00O8JgDXWC/mDotxQHEbyc0hg/iAsVvAgY=;
 b=vcmQAMrEzsV4FG1L5QpLXkqBOrQ5OWuYdGlR8+ygcxJg+F5fPgRqdFWYKvqJJgU4mT
 zG2aAW2Aaxx8HmPIlfVGBlGU+Tu3x3HW3wNhOb0imgignadU5yAYy5edOXWWGXi/0Na4
 0SCSsnOjKh6NZ89GJ/Z1th6BYn3bZVjgPzwjCcYTGdFvmRZ+d8292zz6Fa+rLu1nDRVS
 nqtULSE9iytN1Ux/XqwoX0F6IiuTkU6cBgvLoTaXjmrYNhB/2fbpLk/00zSQBHvVF91s
 Hv+b2E+JxXaSCT1p0PXKvweG2iD7xl6BSOXRJs6N8uGBGhhsdZ7fLsuZ6pWRxwXozdGD
 zlCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mp1O72Xdq00O8JgDXWC/mDotxQHEbyc0hg/iAsVvAgY=;
 b=gImY5f2sQilAaW3WSZnGlBDVDOxsYwQ43Dn+HHOY5o76rh071zk1X08BuB78I1yuNj
 AodbEPm/X/jVpBBDQJHAUINODJEcJFnx6Cwk7T9qKdTaIi83nEaYIwVxx2tYRTZdP/0o
 +SVZn+pBjItNQsxXPcgqVHwUTCwQ8Ovp7YUaxNnWFzj00/aSxivVDRe2IRaJU9m6JFYs
 MqJxV0nJuCasJxUSjPaqPldatAJHX1L6+F9aSJSA2K4qIDrnMRDU0nTGmdBxUHKnz/W9
 8yjLGd2KmyS7g1SBvm+l8T0YI9gt2ePEMSmVxV48aZfFt8XxLdZtBNCTjbPjTKkJqxWc
 2tBg==
X-Gm-Message-State: AOAM533Wp7HcNe2rOBYhsYiQnJJq/yrt73SJL2eLntLhrZum8umaFPkm
 OCZ1LCPG5uM/wB7iEuxxlhu+eev8NUvSMPQ0rzExllWGLjQ=
X-Google-Smtp-Source: ABdhPJySFDwer7KjH89ACOdbQCrAFJYmz3PmcTnEmry2cPWkqSChoUu+TiNgN9tnSrdVOfv81ypAYcyv/WXFLRq7XEE=
X-Received: by 2002:a02:ac1:: with SMTP id 184mr2566280jaw.137.1589538748835; 
 Fri, 15 May 2020 03:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <1589267017-17294-1-git-send-email-dillon.minfei@gmail.com>
 <1589267017-17294-5-git-send-email-dillon.minfei@gmail.com>
 <158949014721.215346.12197373767247910756@swboyd.mtv.corp.google.com>
In-Reply-To: <158949014721.215346.12197373767247910756@swboyd.mtv.corp.google.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Fri, 15 May 2020 18:31:52 +0800
Message-ID: <CAL9mu0J7t5Qbe2VQexn8=ZDbcOiCzc0cSnfZRKTjeM5Uyi_x-A@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] clk: stm32: Fix stm32f429 ltdc driver loading hang
 in clk set rate. keep ltdc clk running after kernel startup
To: Stephen Boyd <sboyd@kernel.org>
X-Mailman-Approved-At: Sat, 16 May 2020 09:58:59 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Dave Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-clk <linux-clk@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen,

thanks for reviewing.

On Fri, May 15, 2020 at 5:02 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting dillon.minfei@gmail.com (2020-05-12 00:03:36)
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > as store stm32f4_rcc_register_pll return to the wrong offset of clks,
>
> Use () on functions, i.e. stm32f4_rcc_register_pll().
ok
>
> > so ltdc gate clk is null. need change clks[PLL_VCO_SAI] to clks[PLL_SAI]
>
> And quote variables like 'clks[PLL_VCO_SAI]'
ok
>
> >
> > add CLK_IGNORE_UNUSED for ltdc to make sure clk not be freed by
> > clk_disable_unused
>
> clk_disable_unused() doesn't free anything. Why does ltdc not need to be
> turned off if it isn't used? Is it critical to system operation? Should
> it be marked with the critical clk flag then? The CLK_IGNORE_UNUSED flag
> is almost always wrong to use.

Yes, you are right. thanks. CLK_IGNORE_UNUSED just hide the root
cause. after deeper debugging.
i need to drop the last changes , they are not the root cause.

post diff and analyse here first, i will resubmit clk's changes in
next patchset with gyro and ili9341.

--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -129,8 +129,6 @@ static const struct stm32f4_gate_data
stm32f429_gates[] __initconst = {
        { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
        { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
        { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
-       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div",
-               CLK_IGNORE_UNUSED },
 };

 static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
@@ -558,13 +556,13 @@ static const struct clk_div_table post_divr_table[] = {

 #define MAX_POST_DIV 3
 static const struct stm32f4_pll_post_div_data  post_div_data[MAX_POST_DIV] = {
-       { CLK_I2SQ_PDIV, PLL_I2S, "plli2s-q-div", "plli2s-q",
+       { CLK_I2SQ_PDIV, PLL_VCO_I2S, "plli2s-q-div", "plli2s-q",
                CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 0, 5, 0, NULL},

-       { CLK_SAIQ_PDIV, PLL_SAI, "pllsai-q-div", "pllsai-q",
+       { CLK_SAIQ_PDIV, PLL_VCO_SAI, "pllsai-q-div", "pllsai-q",
                CLK_SET_RATE_PARENT, STM32F4_RCC_DCKCFGR, 8, 5, 0, NULL },

-       { NO_IDX, PLL_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
+       { NO_IDX, PLL_VCO_SAI, "pllsai-r-div", "pllsai-r", CLK_SET_RATE_PARENT,
                STM32F4_RCC_DCKCFGR, 16, 2, 0, post_divr_table },
 };

@@ -1758,7 +1756,7 @@ static void __init stm32f4_rcc_init(struct
device_node *np)
        clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
                        &data->pll_data[1], &stm32f4_clk_lock);

-       clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
+       clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
                        &data->pll_data[2], &stm32f4_clk_lock);

        for (n = 0; n < MAX_POST_DIV; n++) {

issue 1: ili9341 hang in clk set rate, the root cause should be
PLL_VCO_SAI, PLL_SAI mismatch
for 'clks[]'

1, first at stm32f4_rcc_init() ,
    clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
                        &data->pll_data[2], &stm32f4_clk_lock);
   the clk_hw from stm32f4_rcc_register_pll() is store to 'clks[7]', defined in
   'include/dt-bindings/clock/stm32fx-clock.h'

2, next
hw = clk_register_pll_div(post_div->name,
                                post_div->parent,
                                post_div->flag,
                                base + post_div->offset,
                                post_div->shift,
                                post_div->width,
                                post_div->flag_div,
                                post_div->div_table,
                                clks[post_div->pll_num],
                                &stm32f4_clk_lock);
the 'clks[post_div->pll_num]', the pll_num is PLL_SAI, the value is 2,
defined at
enum {
        PLL,
        PLL_I2S,
        PLL_SAI,
};
'post_div_data[]'

so 7 != 2 offset of 'clks[]', input the wrong 'clks[]' to
clk_register_pll_div. cause to_clk_gate result is null,
crashed in ltdc driver's loading.

issue 2: clk_disable_unused() turn off ltdc clock.
1, ltdc clk is defined in 'stm32f429_gates[]', register to clk core,
but there is no user to use it.
    ltdc driver use dts binding name "lcd", connect to CLK_LCD, then
aux clk 'lcd-tft '
2, as no one use 'stm32f429_gates[]' s ltdc clock , so the
enable_count is zero, after kernel startup
    it's been turn off by clk_disable_unused() is fine.

my chages for this is remove the ltdc from 'stm32f429_gates[]'
but this modification still need 'clk-stm32f4.c''s maintainer to check
if there is side effect.

>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  drivers/clk/clk-stm32f4.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
> > index 18117ce..0ba73de 100644
> > --- a/drivers/clk/clk-stm32f4.c
> > +++ b/drivers/clk/clk-stm32f4.c
> > @@ -129,7 +129,8 @@ static const struct stm32f4_gate_data stm32f429_gates[] __initconst = {
> >         { STM32F4_RCC_APB2ENR, 20,      "spi5",         "apb2_div" },
> >         { STM32F4_RCC_APB2ENR, 21,      "spi6",         "apb2_div" },
> >         { STM32F4_RCC_APB2ENR, 22,      "sai1",         "apb2_div" },
> > -       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div" },
> > +       { STM32F4_RCC_APB2ENR, 26,      "ltdc",         "apb2_div",
> > +               CLK_IGNORE_UNUSED },
> >  };
> >
> >  static const struct stm32f4_gate_data stm32f469_gates[] __initconst = {
> > @@ -1757,7 +1758,7 @@ static void __init stm32f4_rcc_init(struct device_node *np)
> >         clks[PLL_VCO_I2S] = stm32f4_rcc_register_pll("vco_in",
> >                         &data->pll_data[1], &stm32f4_clk_lock);
> >
> > -       clks[PLL_VCO_SAI] = stm32f4_rcc_register_pll("vco_in",
> > +       clks[PLL_SAI] = stm32f4_rcc_register_pll("vco_in",
> >                         &data->pll_data[2], &stm32f4_clk_lock);
> >
> >         for (n = 0; n < MAX_POST_DIV; n++) {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
