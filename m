Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE2309E63
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 20:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0706C6E069;
	Sun, 31 Jan 2021 19:47:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CABF6E069;
 Sun, 31 Jan 2021 19:47:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 190so10873118wmz.0;
 Sun, 31 Jan 2021 11:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H6wXPb6paYLXQl2pKsLEiIISXfXS8Hhcf27+U5ECNao=;
 b=UL6u9v++SVqEzWWq9c2IkrsMhf/Y2G1hktNz+etSCKnNhwzy6ljwWfgBOp1Enf30Fw
 yuB5ny4xWdX+XQK0LD7OF1X9qMM6AxajVBvLpy72hTpzltOqnIFyrcZpgI7wkALlB5Jo
 Pg3jpoR6CURyXPXRJOP9H3hcTvDycn+tIqHBoDkY8fUN0JJMP2shi16aAOKzhZtbMcZ0
 t4d/g/DNCkGs8WuMgT11L30CfQ8e1Fu5Q2JAZrMC48/iXll3VjHG6he8m9x/+qpzZbfR
 FeSBo/0cx4e5IvLgjmlNHwif9UUMC/49OFgSieWzV67INAg6qp4Mgqt1PeVgdlnbaWU1
 vvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H6wXPb6paYLXQl2pKsLEiIISXfXS8Hhcf27+U5ECNao=;
 b=H2zskAE7z/Hdx0XC6VxN9/Poq1YRHXouUh30lLgTDi8QHORJZg8w3bAiyE30gyGOpH
 0/WbL6xHl0gABDgfexIKL7v96y/VraFdJvQqyLTon9fs9rRSb/ev2PUfcKqWsXeR04fe
 cTAGStYtWFzlL6zdTw9NIS/4/s91bio4kgBHpEfmQLMuGVwD2FXg4aEVf71jaWbSuzzF
 0R4SIul65n90LaxjxPNf+f4CbLdbwOo3erPwscjbRdjF9maPzNFErXWbLqKlXUrA/2Nq
 u19zaF/HyOw7iRP0bY1SnvaE0n+uoynRzi/OVE7GasMQDIKN1Xz5Q/LIHij9L6gBPUFK
 A2Hg==
X-Gm-Message-State: AOAM533WoH9wcbDwCbVWNUoTID4JO4iORvjjhu/ocb2t1BhBWpvh2u/p
 ReBHMog5D75ujSdhKDp0nQnLlLlELncSkzxDEf4=
X-Google-Smtp-Source: ABdhPJxd6a+y2rJ9k825JiSPM8mEOyTrNoapVicPm39kXx0f+YJCfL63uiL+RjJBa8SkSBvsse6ESUUDXkBY6B03OvY=
X-Received: by 2002:a7b:c45a:: with SMTP id l26mr12019059wmi.164.1612122474995; 
 Sun, 31 Jan 2021 11:47:54 -0800 (PST)
MIME-Version: 1.0
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
 <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 31 Jan 2021 11:50:29 -0800
Message-ID: <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation
 and prescaler
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, martin.botka@somainline.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, marijn.suijten@somainline.org,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 9, 2021 at 5:51 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@somainline.org> wrote:
>
> The VCO rate was being miscalculated due to a big overlook during
> the process of porting this driver from downstream to upstream:
> here we are really recalculating the rate of the VCO by reading
> the appropriate registers and returning a real frequency, while
> downstream the driver was doing something entirely different.
>
> In our case here, the recalculated rate was wrong, as it was then
> given back to the set_rate function, which was erroneously doing
> a division on the fractional value, based on the prescaler being
> either enabled or disabled: this was actually producing a bug for
> which the final VCO rate was being doubled, causing very obvious
> issues when trying to drive a DSI panel because the actual divider
> value was multiplied by two!
>
> To make things work properly, remove the multiplication of the
> reference clock by two from function dsi_pll_calc_dec_frac and
> account for the prescaler enablement in the vco_recalc_rate (if
> the prescaler is enabled, then the hardware will divide the rate
> by two).
>
> This will make the vco_recalc_rate function to pass the right
> frequency to the (clock framework) set_rate function when called,
> which will - in turn - program the right values in both the
> DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
> registers, finally making the PLL to output the right clock.
>
> Also, while at it, remove the prescaler TODO by also adding the
> possibility of disabling the prescaler on the PLL (it is in the
> PLL_ANALOG_CONTROLS_ONE register).
> Of course, both prescaler-ON and OFF cases were tested.

This somehow breaks things on sc7180 (display gets stuck at first
frame of splash screen).  (This is a setup w/ an ti-sn65dsi86 dsi->eDP
bridge)

Also, something (I assume DSI related) that I was testing on
msm-next-staging seems to have effected the colors on the panel (ie.
they are more muted).. which seems to persist across reboots (ie. when
switching back to a good kernel), and interestingly if I reboot from a
good kernel I see part of the login prompt (or whatever was previously
on-screen) in the firmware ui screen !?!  (so maybe somehow triggered
the display to think it is in PSR mode??)

Not sure if that is caused by these patches, but if I can figure out
how to get the panel back to normal I can bisect.  I think for now
I'll drop this series.  Possibly it could be a
two-wrongs-makes-a-right situation that had things working before, but
I think someone from qcom who knows the DSI IP should take a look.

BR,
-R


> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> index 8b66e852eb36..5be562dfbf06 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
> @@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
>
>         pll_freq = pll->vco_current_rate;
>
> -       if (config->disable_prescaler)
> -               divider = fref;
> -       else
> -               divider = fref * 2;
> -
> +       divider = fref;
>         multiplier = 1 << config->frac_bits;
>         dec_multiple = div_u64(pll_freq * multiplier, divider);
>         dec = div_u64_rem(dec_multiple, multiplier, &frac);
> @@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
>
>  static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
>  {
> +       struct dsi_pll_config *config = &pll->pll_configuration;
>         void __iomem *base = pll->mmio;
> +       u32 val = config->disable_prescaler ? 0x0 : 0x80;
>
> -       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
> +       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
>         pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
> @@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>         frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
>                   0x3) << 16);
>
> -       /*
> -        * TODO:
> -        *      1. Assumes prescaler is disabled
> -        */
>         multiplier = 1 << config->frac_bits;
> -       pll_freq = dec * (ref_clk * 2);
> -       tmp64 = (ref_clk * 2 * frac);
> +       pll_freq = dec * ref_clk;
> +       tmp64 = ref_clk * frac;
>         pll_freq += div_u64(tmp64, multiplier);
> -
>         vco_rate = pll_freq;
>
> +       if (config->disable_prescaler)
> +               vco_rate = div_u64(vco_rate, 2);
> +
>         DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>             pll_10nm->id, (unsigned long)vco_rate, dec, frac);
>
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
