Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F09D45716D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 16:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E956EACD;
	Fri, 19 Nov 2021 15:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFDB16EACD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 15:08:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 24DC41F474CB
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637334493; bh=jSBE+FpE9LQGDFG5yykiQBxgj7BMWhGCKkFyH0YrgtU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kwRAMU0ygP+7zBt1YQJBaPGKRPg8Jivqkg41FGHtLhEXgKUNfKtKEeMdn3vbC3NjX
 y/hvku5BSUFgamWXGhOOSHMJZakEz/NNMVkzRJWe/FXlIlQduJo67ke9AX+Sz+vGC8
 B6hW20TM0JmvwL+N2QqcuVp8x81EYmcqKKnB4/asqP4qEeRvfK/8zgNNfh1o6d2n3D
 fNCFRm9zmiR+lxfFe6j/NXrl0eGO+IqyYk/1KxL9A8PzAbOmCgQ3nB+/DgALGXTl0K
 jyUix27DPvsIkI42gc3L16nlkY7zkHvO8TLwk/IWwvm29aWZK3u+JKb3d59BZvalsK
 9LiEBEUlXlm8Q==
Subject: Re: [PATCH v2 2/3] drm/bridge: parade-ps8640: Move real poweroff
 action to new function
To: Robert Foss <robert.foss@linaro.org>
References: <20211102093618.114928-1-angelogioacchino.delregno@collabora.com>
 <20211102093618.114928-2-angelogioacchino.delregno@collabora.com>
 <d2fe91c8-ab29-7706-80f4-fe6619f07327@collabora.com>
 <286beb55-00db-ba76-0a51-900d59e2ab34@collabora.com>
 <CAG3jFyvF7JAm8X42+f2u+ycqdsHLfNH2YebxYSjJJSBdAbc1aw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <7d6674a2-5f73-3c42-c832-0c85e0462093@collabora.com>
Date: Fri, 19 Nov 2021 16:08:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyvF7JAm8X42+f2u+ycqdsHLfNH2YebxYSjJJSBdAbc1aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, jonas@kwiboo.se,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, a.hajda@samsung.com,
 laurent.pinchart@ideasonboard.com, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/11/21 14:19, Robert Foss ha scritto:
> Hey Angelo,
> 
> On Wed, 10 Nov 2021 at 13:46, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 10/11/21 13:44, Dafna Hirschfeld ha scritto:
>>>
>>>
>>> On 02.11.21 11:36, AngeloGioacchino Del Regno wrote:
>>>> In preparation for varying the poweron error handling in function
>>>> ps8640_bridge_poweron(), move function ps8640_bridge_poweroff() up
>>>> and also move the actual logic to power off the chip to a new
>>>> __ps8640_bridge_poweroff() function.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/parade-ps8640.c | 37 ++++++++++++++------------
>>>>    1 file changed, 20 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> b/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> index 8c5402947b3c..41f5d511d516 100644
>>>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> @@ -293,6 +293,26 @@ static int ps8640_bridge_vdo_control(struct ps8640 *ps_bridge,
>>>>        return 0;
>>>>    }
>>>> +static void __ps8640_bridge_poweroff(struct ps8640 *ps_bridge)
>>>> +{
>>>> +    gpiod_set_value(ps_bridge->gpio_reset, 1);
>>>> +    gpiod_set_value(ps_bridge->gpio_powerdown, 1);
>>>> +    if (regulator_bulk_disable(ARRAY_SIZE(ps_bridge->supplies),
>>>> +                   ps_bridge->supplies)) {
>>>> +        DRM_ERROR("cannot disable regulators\n");
>>>> +    }
>>>
>>> That '{' is redundant
>>>
>>> Thanks,
>>> Danfa
>>>
>>
>> Hi Dafna,
>> the braces were added as a way to increase human readability.
> 
> Not to bikeshed this, but the kernel style guide is clear about this.
> No unneeded braces should be used where a single statement will do.
> 

Hey Robert!

That's right, style rules come before personal preferences.
I'll send a v3 without the braces as soon as possible!

Cheers,
- Angelo
