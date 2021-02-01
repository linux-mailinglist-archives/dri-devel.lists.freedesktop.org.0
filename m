Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35730B9AD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C163E6E8FE;
	Tue,  2 Feb 2021 08:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C4336E14B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:11:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4C1473E7DE;
 Mon,  1 Feb 2021 11:11:31 +0100 (CET)
Subject: Re: [PATCH 3/5] drm/msm/dsi_pll_10nm: Fix bad VCO rate calculation
 and prescaler
To: Rob Clark <robdclark@gmail.com>
References: <20210109135112.147759-1-angelogioacchino.delregno@somainline.org>
 <20210109135112.147759-4-angelogioacchino.delregno@somainline.org>
 <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <8f8c7c37-f7b2-f763-19e1-d89e5c454ab4@somainline.org>
Date: Mon, 1 Feb 2021 11:11:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvDzdgDy7Znw6dQCV7Z=YxnF2_XsqkV+7BT+oY777TqHA@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/01/21 20:50, Rob Clark ha scritto:
> On Sat, Jan 9, 2021 at 5:51 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@somainline.org> wrote:
>>
>> The VCO rate was being miscalculated due to a big overlook during
>> the process of porting this driver from downstream to upstream:
>> here we are really recalculating the rate of the VCO by reading
>> the appropriate registers and returning a real frequency, while
>> downstream the driver was doing something entirely different.
>>
>> In our case here, the recalculated rate was wrong, as it was then
>> given back to the set_rate function, which was erroneously doing
>> a division on the fractional value, based on the prescaler being
>> either enabled or disabled: this was actually producing a bug for
>> which the final VCO rate was being doubled, causing very obvious
>> issues when trying to drive a DSI panel because the actual divider
>> value was multiplied by two!
>>
>> To make things work properly, remove the multiplication of the
>> reference clock by two from function dsi_pll_calc_dec_frac and
>> account for the prescaler enablement in the vco_recalc_rate (if
>> the prescaler is enabled, then the hardware will divide the rate
>> by two).
>>
>> This will make the vco_recalc_rate function to pass the right
>> frequency to the (clock framework) set_rate function when called,
>> which will - in turn - program the right values in both the
>> DECIMAL_DIV_START_1 and the FRAC_DIV_START_{LOW/MID/HIGH}_1
>> registers, finally making the PLL to output the right clock.
>>
>> Also, while at it, remove the prescaler TODO by also adding the
>> possibility of disabling the prescaler on the PLL (it is in the
>> PLL_ANALOG_CONTROLS_ONE register).
>> Of course, both prescaler-ON and OFF cases were tested.
> 
> This somehow breaks things on sc7180 (display gets stuck at first
> frame of splash screen).  (This is a setup w/ an ti-sn65dsi86 dsi->eDP
> bridge)
> 

First frame of the splash means that something is "a bit" wrong...
...like the DSI clock is a little off.

I don't have such hardware, otherwise I would've tried... but what you
describe is a bit strange.
Is there any other older qcom platform using this chip? Any other
non-qcom platform? Is the driver for the SN65DSI86 surely fine?
Anyway, as you know, I would never propose untested patches nor
partially working ones for any reason: I'm sorry that this happened.

In any case, just to be perfectly transparent, while being here waiting
for review, this patch series got tested on more smartphones, even ones
that I don't personally own, with different displays.

For your reference, here's a list (all MSM8998..):
- OnePlus 5               (1920x1080)
- F(x)Tec Pro 1           (2160x1080)
- Sony Xperia XZ1 Compact (1280x720)
- Sony Xperia XZ1         (1920x1080)
- Sony Xperia XZ Premium  (3840x2160)


> Also, something (I assume DSI related) that I was testing on
> msm-next-staging seems to have effected the colors on the panel (ie.
> they are more muted).. which seems to persist across reboots (ie. when

So much "fun". This makes me think something about the PCC block doing
the wrong thing (getting misconfigured).

> switching back to a good kernel), and interestingly if I reboot from a
> good kernel I see part of the login prompt (or whatever was previously
> on-screen) in the firmware ui screen !?!  (so maybe somehow triggered
> the display to think it is in PSR mode??)
> 

 From a fast read, the SN65DSI86 is on I2C.. giving it a wrong dsi clock
cannot produce (logically, at least) this, so I say that it is very
unlikely for this to be a consequence of the 10nm pll fixes...

...unless the bootloader is not configuring the DSI rates, but that's
also veeeeery unlikely (it always does, or it always does not).

> Not sure if that is caused by these patches, but if I can figure out
> how to get the panel back to normal I can bisect.  I think for now
> I'll drop this series.  Possibly it could be a
> two-wrongs-makes-a-right situation that had things working before, but
> I think someone from qcom who knows the DSI IP should take a look.
> 

I would be happy if someone from Qualcomm takes a look: after all, there
is no documentation and they're the only ones that can verify this kind
of stuff. Please, Qualcomm.

Besides that, if there's anything I can help with to solve this riddle,
I'm here for you.

Yours,
-- Angelo

> BR,
> -R
> 
> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
>> ---
>>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c | 22 +++++++++-------------
>>   1 file changed, 9 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
>> index 8b66e852eb36..5be562dfbf06 100644
>> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
>> @@ -165,11 +165,7 @@ static void dsi_pll_calc_dec_frac(struct dsi_pll_10nm *pll)
>>
>>          pll_freq = pll->vco_current_rate;
>>
>> -       if (config->disable_prescaler)
>> -               divider = fref;
>> -       else
>> -               divider = fref * 2;
>> -
>> +       divider = fref;
>>          multiplier = 1 << config->frac_bits;
>>          dec_multiple = div_u64(pll_freq * multiplier, divider);
>>          dec = div_u64_rem(dec_multiple, multiplier, &frac);
>> @@ -266,9 +262,11 @@ static void dsi_pll_ssc_commit(struct dsi_pll_10nm *pll)
>>
>>   static void dsi_pll_config_hzindep_reg(struct dsi_pll_10nm *pll)
>>   {
>> +       struct dsi_pll_config *config = &pll->pll_configuration;
>>          void __iomem *base = pll->mmio;
>> +       u32 val = config->disable_prescaler ? 0x0 : 0x80;
>>
>> -       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, 0x80);
>> +       pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_ONE, val);
>>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_TWO, 0x03);
>>          pll_write(base + REG_DSI_10nm_PHY_PLL_ANALOG_CONTROLS_THREE, 0x00);
>>          pll_write(base + REG_DSI_10nm_PHY_PLL_DSM_DIVIDER, 0x00);
>> @@ -499,17 +497,15 @@ static unsigned long dsi_pll_10nm_vco_recalc_rate(struct clk_hw *hw,
>>          frac |= ((pll_read(base + REG_DSI_10nm_PHY_PLL_FRAC_DIV_START_HIGH_1) &
>>                    0x3) << 16);
>>
>> -       /*
>> -        * TODO:
>> -        *      1. Assumes prescaler is disabled
>> -        */
>>          multiplier = 1 << config->frac_bits;
>> -       pll_freq = dec * (ref_clk * 2);
>> -       tmp64 = (ref_clk * 2 * frac);
>> +       pll_freq = dec * ref_clk;
>> +       tmp64 = ref_clk * frac;
>>          pll_freq += div_u64(tmp64, multiplier);
>> -
>>          vco_rate = pll_freq;
>>
>> +       if (config->disable_prescaler)
>> +               vco_rate = div_u64(vco_rate, 2);
>> +
>>          DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>>              pll_10nm->id, (unsigned long)vco_rate, dec, frac);
>>
>> --
>> 2.29.2
>>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
