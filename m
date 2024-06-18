Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B6C90C484
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499EA10E21A;
	Tue, 18 Jun 2024 07:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Hus3YdYD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4E710E21A
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 07:40:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45I7eNwQ130284;
 Tue, 18 Jun 2024 02:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1718696423;
 bh=mOuw0vOFF+jtYkz65pWfpn2/WyQP4i6TqlpZ7ARxTvs=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Hus3YdYDSM+RJlE82dC+X20qY97uaGFwOif4BTallVCuXaLcdYYQc7YOCq7ab5te5
 JAn7r1v/4yC7S9yiHqJQKcHdK8ORDSmbF+4UoNjLA59+MtRU6Q3vKBRE/qRo8MOVM5
 w3x9kY+epLm/HYXjtKVRT6YIJsdU7y8zX81op8kk=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45I7eNq5031856
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 18 Jun 2024 02:40:23 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Jun 2024 02:40:23 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Jun 2024 02:40:23 -0500
Received: from [172.24.227.55]
 (jayesh-hp-probook-440-g8-notebook-pc.dhcp.ti.com [172.24.227.55])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45I7eIoY062389;
 Tue, 18 Jun 2024 02:40:19 -0500
Message-ID: <b1591cd8-47b1-4764-b768-f3a8ef80d495@ti.com>
Date: Tue, 18 Jun 2024 13:10:17 +0530
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
 <279a1467-9ba4-449c-9076-9b2acef9336c@ti.com>
 <CAD=FV=VVs56wPGMVwuuwvHN8ob2bUeX1U-G=Zt_xGeGMyuchQA@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=VVs56wPGMVwuuwvHN8ob2bUeX1U-G=Zt_xGeGMyuchQA@mail.gmail.com>
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

On 11/04/24 10:12, Doug Anderson wrote:
> Hi,
> 
> On Wed, Apr 10, 2024 at 4:42 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Hello Doug,
>>
>> Thanks for the review.
>>
>> On 08/04/24 14:33, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Mon, Apr 8, 2024 at 12:36 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>>
>>>> Due to integer calculations, the rounding off can cause errors in the final
>>>> value propagated in the registers.
>>>> Considering the example of 1080p (very common resolution), the mode->clock
>>>> is 148500, dsi->lanes = 4, and bpp = 24, with the previous logic, the DSI
>>>> clock frequency would come as 444 when we are expecting the value 445.5
>>>> which would reflect in SN_DSIA_CLK_FREQ_REG.
>>>> So move the division to be the last operation where rounding off will not
>>>> impact the register value.
>>>
>>> Given that this driver is used on a whole pile of shipping Chromebooks
>>> and those devices have been working just fine (with 1080p resolution)
>>> for years, I'm curious how you noticed this. Was it actually causing
>>> real problems for you, or did you notice it just from code inspection?
>>> You should include this information in the commit message.
>>
>> I am trying to add display support for TI SoC which uses this particular
>> bridge. While debugging, I was trying to get all the register value in
>> sync with the datasheet and it was then that I observed this issue while
>> inspecting the code.
>> Maybe Chromebooks are using different set of parameters which does not
>> expose this issue. Since parameters for my display (mentioned in commit
>> message) yields the frequency at the border, I saw this issue. My debug
>> is still ongoing but since the value is not in sync with the
>> documentation, I sent out this patch.
> 
> OK, sounds good. It would be good to include some of this type of into
> in the patch description for the next version.
> 

I am re-rolling v2 patch.. So I will mention that this was found during
code inspection.

> 
>>> I'm travelling for the next two weeks so I can't actually check on a
>>> device to see if your patch makes any difference on hardware I have,
>>> but I'd presume that things were working "well enough" with the old
>>> value and they'll still work with the new value?
>>>
>>>
>>
>> Yes, ideally they should still work well with this change.
> 
> OK, I can validate it in a few weeks.
> 
> 
>>>> Also according to the SN65DSI86 datasheet[0], the minimum value for that
>>>> reg is 0x08 (inclusive) and the maximum value is 0x97 (exclusive). So add
>>>> check for that.
>>>
>>> Maybe the range checking should be a separate patch?
>>
>> Check should be done before propagating the register value so I added it
>> in the same function and hence in the same patch.
> 
> I was thinking you could have patch #1 add the checks. ...then patch
> #2 could fix the math.
> 

Creating 2 patches. 1st for atomic check and another fixing the math.

> 
>>>> -#define MIN_DSI_CLK_FREQ_MHZ   40
>>>> +/*
>>>> + * NOTE: DSI clock frequency range: [40MHz,755MHz)
>>>> + * DSI clock frequency range is in 5-MHz increments
>>>> + * So minimum frequency 40MHz translates to 0x08
>>>> + * And maximum frequency 755MHz translates to 0x97
>>>> + */
>>>> +#define MIN_DSI_CLK_RANGE      0x8
>>>> +#define MAX_DSI_CLK_RANGE      0x97
>>>
>>> It's a little weird to call this min/max and have one be inclusive and
>>> one be exclusive. Be consistent and say that this is the minimum legal
>>> value and the maximum legal value. I think that means the MAX should
>>> be 0x96.
>>
>> The comment above does specify the inclusive/exclusive behavior.
>> Since a value corresponds to 5MHz range, associating the value with
>> the range makes more sense if I keep it 0x97 (0x97 * 5 -> 755MHz)
>> 0x96 corresponds to the range of [750Mz,755MHz).
>>
>> If this argument does not make sense, I can change it to 0x96 and handle
>> it with the inequalities in the function call.
> 
> Right that the comment is correct so that's good, but I'd still like
> to see the constants changing. For instance, if I had code like this:
> 
> /*
>   * I know 2 * 2 is not really 5, but it makes my math work out
>   * so we'll just define it that way.
>   */
> #define TWO_TIMES_TWO 5
> 
> ...and then later you had code:
> 
> if (x * y >= TWO_TIMES_TWO)
> 
> When you read the code you probably wouldn't go back and read the
> comment so you'd be confused. AKA the above would be better as:
> 
> #define TWO_TIMES_TWO 4
> 
> if (x * y > TWO_TIMES_TWO)
> 
> Better to make the name of the #define make sense on its own. In this
> case "min" and "max" should be the minimum legal value and the maximum
> legal value, not "one past".
> 

Okay will use correct values.

> 
>>>> +        */
>>>> +       bit_rate_khz = mode->clock *
>>>> +                      mipi_dsi_pixel_format_to_bpp(pdata->dsi->format);
>>>> +
>>>> +       /*
>>>> +        * For each increment in val, frequency increases by 5MHz
>>>> +        * and the factor of 1000 comes from kHz to MHz conversion
>>>> +        */
>>>> +       val = (bit_rate_khz / (pdata->dsi->lanes * 2 * 1000 * 5)) & 0xFF;
>>>> +
>>>> +       if (val >= MAX_DSI_CLK_RANGE || val < MIN_DSI_CLK_RANGE) {
>>>> +               drm_err(pdata->bridge.dev,
>>>> +                       "DSI clock frequency not in the supported range\n");
>>>> +               return -EINVAL;
>>>> +       }
>>>
>>> Shouldn't the above be in atomic_check()? There's a reason why
>>> atomic_enable() can't return error codes.
>>
>> Oops.
>> I will handle it how we are handling errors in case of link_training:
>> https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/ti-sn65dsi86.c#L1152
>>
>> That should be okay I guess?
> 
> I'm pretty sure it should be in atomic_check(). The atomic_check() is
> supposed to confirm that all parameters are within valid ranges and
> the enable function shouldn't fail because the caller passed bad
> parameters. Specifically this could allow the caller to try different
> parameters and see if those would work instead.
> 
> In the case of the link training failure it's not something we could
> have detected until we actually tried to enable, so there's no choice.
> 
> -Doug


I will have to move the whole calculation to atomic check since
atomic check will be called first and then in bridge_enable I will
write to the register.

Thanks
-Jayesh
