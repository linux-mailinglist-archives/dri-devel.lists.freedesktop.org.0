Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8A77DBE3
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 10:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9F910E233;
	Wed, 16 Aug 2023 08:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8496B10E233
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:14:49 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE811B2A;
 Wed, 16 Aug 2023 10:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692173615;
 bh=ElXL6fYxDLsP/9sUEgVHcxzYyUCsen+i+kQs9f4MzQE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KyppgEgRNn/0vwjZ3IAxWZOVAc4lrgoLqpIsiRNgyw8h4S0hjp4zFj2mLXM8dhF/s
 LdRtGvZdIfG/iZuy6mdPsGjS38TBDICA5Aav1Lp1+I+4cf+aFSmgVznn2x8mHiPYoZ
 EZS1r2BOdwg+cnia5cEFatf691v4ZAnQViqE6G0I=
Message-ID: <5ffb773d-5a3e-cb88-db3b-522423f2b834@ideasonboard.com>
Date: Wed, 16 Aug 2023 11:14:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/11] drm/bridge: tc358768: Fix bit updates
To: Maxim Schwalm <maxim.schwalm@gmail.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-2-1afd44b7826b@ideasonboard.com>
 <cd5d39a2-4f4c-419a-8137-d2719135e205@gmail.com>
 <241937b4-1ef8-abad-7c4a-b26bfab86a3a@ideasonboard.com>
 <92396880-edb5-d8e0-4fcf-54aeaa2b40d7@gmail.com>
 <52151daa-90af-a6c0-9b03-f69081321253@ideasonboard.com>
 <d55fc4d3-015d-8cc2-417e-e92aa4687ca2@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <d55fc4d3-015d-8cc2-417e-e92aa4687ca2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/08/2023 20:21, Maxim Schwalm wrote:
> On 14.08.23 08:34, Tomi Valkeinen wrote:
>> On 13/08/2023 03:23, Maxim Schwalm wrote:
>>> Hi,
>>>
>>> On 11.08.23 19:02, Tomi Valkeinen wrote:
>>>> On 11/08/2023 19:23, Péter Ujfalusi wrote:
>>>>>
>>>>>
>>>>> On 04/08/2023 13:44, Tomi Valkeinen wrote:
>>>>>> The driver has a few places where it does:
>>>>>>
>>>>>> if (thing_is_enabled_in_config)
>>>>>> 	update_thing_bit_in_hw()
>>>>>>
>>>>>> This means that if the thing is _not_ enabled, the bit never gets
>>>>>> cleared. This affects the h/vsyncs and continuous DSI clock bits.
>>>>>
>>>>> I guess the idea was to keep the reset value unless it needs to be flipped.
>>>>>
>>>>>>
>>>>>> Fix the driver to always update the bit.
>>>>>>
>>>>>> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
>>>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/bridge/tc358768.c | 13 +++++++------
>>>>>>     1 file changed, 7 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>>>>>> index bc97a837955b..b668f77673c3 100644
>>>>>> --- a/drivers/gpu/drm/bridge/tc358768.c
>>>>>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>>>>>> @@ -794,8 +794,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>>>>>     		val |= BIT(i + 1);
>>>>>>     	tc358768_write(priv, TC358768_HSTXVREGEN, val);
>>>>>>     
>>>>>> -	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>>>>>> -		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
>>>>>> +	tc358768_write(priv, TC358768_TXOPTIONCNTRL,
>>>>>> +		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
>>>>>>     
>>>>>>     	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
>>>>>>     	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
>>>>>> @@ -861,11 +861,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>>>>>     	tc358768_write(priv, TC358768_DSI_HACT, hact);
>>>>>>     
>>>>>>     	/* VSYNC polarity */
>>>>>> -	if (!(mode->flags & DRM_MODE_FLAG_NVSYNC))
>>>>>> -		tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5), BIT(5));
>>>>>> +	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5),
>>>>>> +			     (mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIT(5) : 0);
>>>>>
>>>>> Was this the reverse before and should be:
>>>>> (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : BIT(5)
>>>>
>>>> Bit 5 is 1 for active high vsync polarity. The test was previously
>>>> !nvsync, i.e. the same as pvsync.
>>>
>>> this statement doesn't seem to be true, since this change causes a
>>> regression on the Asus TF700T. Apparently, !nvsync is true and pvsync is
>>> false in the present case.
>>
>> panasonic_vvx10f004b00_mode in panel_simple.c doesn't seem to have mode
>> flags set. I would say that means the panel doesn't care about the sync
>> polarities (which obviously is not the case), but maybe there's an
>> assumption that if sync polarities are not set, the default is...
>> positive? But I can't find any mention about this.
>>
>> Does it work for you if you set the polarities in
>> panasonic_vvx10f004b00_mode?
> 
> The panel seems to work with either negative or positive H-/Vsync in
> conjunction with the attached patch from Thierry. Currently, the display
> controller is unconditionally programmed for positive H-/Vsync though.
> What should be done in this case?
> 
> BTW, the vendor kernel configures the display controller as well as the
> bridge for negative H-/Vsync.

Ah, of course, I wasn't thinking. It's a DSI panel (obviously...), so it 
doesn't have sync polarities and as such it doesn't really make sense to 
define them in the panel-simple.c.

But we still need an agreed sync polarity between the tegra and the 
tc358768, as that is a parallel video bus. And that polarity is not 
defined anywhere, as it is expected to come from the panel.

Maybe tc358768 should have a mode-fixup, where it sets the polarities if 
they are not defined? I'll have to look at this a bit more.

  Tomi

