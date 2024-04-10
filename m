Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 237FA89F10E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 13:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BD410E4C2;
	Wed, 10 Apr 2024 11:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Irffg5GU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC18010E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 11:42:50 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ABgb77088904;
 Wed, 10 Apr 2024 06:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1712749357;
 bh=Orwcw5Ia2AB+nDmlojgten3vjJ8b47E/GgQ/goc3VCs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Irffg5GUmt1x5SB5XAssmEXglhk4JTfwjhwxNUahC4Jt/FU0S0ptXlDoVgqqoVWnN
 sYpSHpHIkFZnTHjliZuxwo8ZrCoTqBUTTRTacWGNCzCou7fn49W8jYh0V2rxd/HF3t
 bgh5SJ6O5Ig6fIGTo4U7EtpSbjPlDQ1gRfHQnnMQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ABgbCK022407
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Apr 2024 06:42:37 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 06:42:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Wed, 10 Apr
 2024 06:42:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 06:42:36 -0500
Received: from [172.24.227.252]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.252])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ABgVU9078615;
 Wed, 10 Apr 2024 06:42:32 -0500
Message-ID: <279a1467-9ba4-449c-9076-9b2acef9336c@ti.com>
Date: Wed, 10 Apr 2024 17:12:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix ti_sn_bridge_set_dsi_rate
 function
To: Doug Anderson <dianders@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <andersson@kernel.org>,
 <robdclark@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240408073623.186489-1-j-choudhary@ti.com>
 <CAD=FV=V6vUgcPn0zhA+9k4cHVpqqeSVCSJG23XEE5KMAHUCCoQ@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=V6vUgcPn0zhA+9k4cHVpqqeSVCSJG23XEE5KMAHUCCoQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Doug,

Thanks for the review.

On 08/04/24 14:33, Doug Anderson wrote:
> Hi,
> 
> On Mon, Apr 8, 2024 at 12:36 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Due to integer calculations, the rounding off can cause errors in the final
>> value propagated in the registers.
>> Considering the example of 1080p (very common resolution), the mode->clock
>> is 148500, dsi->lanes = 4, and bpp = 24, with the previous logic, the DSI
>> clock frequency would come as 444 when we are expecting the value 445.5
>> which would reflect in SN_DSIA_CLK_FREQ_REG.
>> So move the division to be the last operation where rounding off will not
>> impact the register value.
> 
> Given that this driver is used on a whole pile of shipping Chromebooks
> and those devices have been working just fine (with 1080p resolution)
> for years, I'm curious how you noticed this. Was it actually causing
> real problems for you, or did you notice it just from code inspection?
> You should include this information in the commit message.

I am trying to add display support for TI SoC which uses this particular
bridge. While debugging, I was trying to get all the register value in
sync with the datasheet and it was then that I observed this issue while
inspecting the code.
Maybe Chromebooks are using different set of parameters which does not
expose this issue. Since parameters for my display (mentioned in commit
message) yields the frequency at the border, I saw this issue. My debug
is still ongoing but since the value is not in sync with the
documentation, I sent out this patch.

> 
> I'm travelling for the next two weeks so I can't actually check on a
> device to see if your patch makes any difference on hardware I have,
> but I'd presume that things were working "well enough" with the old
> value and they'll still work with the new value?
> 
> 

Yes, ideally they should still work well with this change.

>> Also according to the SN65DSI86 datasheet[0], the minimum value for that
>> reg is 0x08 (inclusive) and the maximum value is 0x97 (exclusive). So add
>> check for that.
> 
> Maybe the range checking should be a separate patch?

Check should be done before propagating the register value so I added it
in the same function and hence in the same patch.

> 
> 
>> [0]: <https://www.ti.com/lit/gpn/sn65dsi86>
>>
>> Fixes: ca1b885cbe9e ("drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates")
> 
> Are you sure that's the commit you're fixing? In the commit text of
> that commit I wrote that it was supposed to "have zero functional
> change". Looking back at the change I still believe it had zero
> functional change. The rounding error looks like it predates the
> patch.
> 
> As far as I can tell the rounding error has been there since commit
> a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver").
> 

Yes. Now I see that it fixes the initial support patch.
I will fix that.

> 
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> 
> It's great to see a TI engineer contributing to this driver! Awesome!
> 
> 
>> ---
>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 48 +++++++++++++++++++++------
>>   1 file changed, 37 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> index 84698a0b27a8..f9cf6b14d85e 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
>> @@ -111,7 +111,14 @@
>>   #define  AUX_IRQ_STATUS_AUX_SHORT              BIT(5)
>>   #define  AUX_IRQ_STATUS_NAT_I2C_FAIL           BIT(6)
>>
>> -#define MIN_DSI_CLK_FREQ_MHZ   40
>> +/*
>> + * NOTE: DSI clock frequency range: [40MHz,755MHz)
>> + * DSI clock frequency range is in 5-MHz increments
>> + * So minimum frequency 40MHz translates to 0x08
>> + * And maximum frequency 755MHz translates to 0x97
>> + */
>> +#define MIN_DSI_CLK_RANGE      0x8
>> +#define MAX_DSI_CLK_RANGE      0x97
> 
> It's a little weird to call this min/max and have one be inclusive and
> one be exclusive. Be consistent and say that this is the minimum legal
> value and the maximum legal value. I think that means the MAX should
> be 0x96.

The comment above does specify the inclusive/exclusive behavior.
Since a value corresponds to 5MHz range, associating the value with
the range makes more sense if I keep it 0x97 (0x97 * 5 -> 755MHz)
0x96 corresponds to the range of [750Mz,755MHz).

If this argument does not make sense, I can change it to 0x96 and handle
it with the inequalities in the function call.

> 
> 
>>   /* fudge factor required to account for 8b/10b encoding */
>>   #define DP_CLK_FUDGE_NUM       10
>> @@ -820,22 +827,37 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
>>          regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
>>   }
>>
>> -static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>> +static int ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
>>   {
>> -       unsigned int bit_rate_mhz, clk_freq_mhz;
>> +       unsigned int bit_rate_khz;
>>          unsigned int val;
>>          struct drm_display_mode *mode =
>>                  &pdata->bridge.encoder->crtc->state->adjusted_mode;
>>
>> -       /* set DSIA clk frequency */
>> -       bit_rate_mhz = (mode->clock / 1000) *
>> -                       mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
>> -       clk_freq_mhz = bit_rate_mhz / (pdata->dsi->lanes * 2);
>> +       /*
>> +        * Set DSIA clk frequency
>> +        * Maximum supported value of bit_rate_khz turns out to be
>> +        * 6040000 which can be put in 32-bit variable so no overflow
>> +        * possible in this calculation.
> 
> The way you've written this comment makes me worried. You're saying
> that the only supported result of the math has to fit in 32-bits so
> we're OK. ...and then _after_ you do the math you check to see if the
> clock rate is within the supported range. It makes me feel like you
> could still overflow.

I did use reverse calculation for the value that I used in comments. xD

> 
> I think your comment here should say something like:
> 
> The maximum value returned by mipi_dsi_pixel_format_to_bpp() is 24.
> That means that as long as "mode->clock" is less than 178,956,971 kHz
> then the calculation can't overflow and can fit in 32-bits.
> 
> If you wanted to be really good you could even put a check earlier in
> the function to make sure that mode->clock wasn't something totally
> crazy (could confirm it's < 100GHz maybe?) so you absolutely knew it
> couldn't overflow.

Okay. This makes sense. Will take this into account for v2.


> 
>> +        */
>> +       bit_rate_khz = mode->clock *
>> +                      mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
>> +
>> +       /*
>> +        * For each increment in val, frequency increases by 5MHz
>> +        * and the factor of 1000 comes from kHz to MHz conversion
>> +        */
>> +       val = (bit_rate_khz / (pdata->dsi->lanes * 2 * 1000 * 5)) & 0xFF;
>> +
>> +       if (val >= MAX_DSI_CLK_RANGE || val < MIN_DSI_CLK_RANGE) {
>> +               drm_err(pdata->bridge.dev,
>> +                       "DSI clock frequency not in the supported range\n");
>> +               return -EINVAL;
>> +       }
> 
> Shouldn't the above be in atomic_check()? There's a reason why
> atomic_enable() can't return error codes.

Oops.
I will handle it how we are handling errors in case of link_training:
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/ti-sn65dsi86.c#L1152

That should be okay I guess?

Warm Regards,
Jayesh

> 
> -Doug
