Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9F77958B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 19:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AF510E6C9;
	Fri, 11 Aug 2023 17:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24F1010E6CA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 17:02:28 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 54800FA6;
 Fri, 11 Aug 2023 19:01:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691773277;
 bh=uDSexvpr2PnoMuFUNNtlPr7ZBmberNLh6mS6tWooTd4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WQAg12iAPxQQOS+xEojC9HcTfyWdQzilDz7msKKHvDvCVJ4hYmUrIe7MtsZqtwA8I
 5pioe+TemfMcJD0faPUlKxSqRuEW89AH8LD7i61i1o8WhI8w7v3JnElBvrULGFcbcD
 cT6TwOr9La+d3oKnXQtZMIWajn1zSwFVsSGCz0mE=
Message-ID: <241937b4-1ef8-abad-7c4a-b26bfab86a3a@ideasonboard.com>
Date: Fri, 11 Aug 2023 20:02:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/11] drm/bridge: tc358768: Fix bit updates
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-2-1afd44b7826b@ideasonboard.com>
 <cd5d39a2-4f4c-419a-8137-d2719135e205@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <cd5d39a2-4f4c-419a-8137-d2719135e205@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/08/2023 19:23, Péter Ujfalusi wrote:
> 
> 
> On 04/08/2023 13:44, Tomi Valkeinen wrote:
>> The driver has a few places where it does:
>>
>> if (thing_is_enabled_in_config)
>> 	update_thing_bit_in_hw()
>>
>> This means that if the thing is _not_ enabled, the bit never gets
>> cleared. This affects the h/vsyncs and continuous DSI clock bits.
> 
> I guess the idea was to keep the reset value unless it needs to be flipped.
> 
>>
>> Fix the driver to always update the bit.
>>
>> Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/tc358768.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>> index bc97a837955b..b668f77673c3 100644
>> --- a/drivers/gpu/drm/bridge/tc358768.c
>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>> @@ -794,8 +794,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>   		val |= BIT(i + 1);
>>   	tc358768_write(priv, TC358768_HSTXVREGEN, val);
>>   
>> -	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
>> -		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
>> +	tc358768_write(priv, TC358768_TXOPTIONCNTRL,
>> +		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
>>   
>>   	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
>>   	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
>> @@ -861,11 +861,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>   	tc358768_write(priv, TC358768_DSI_HACT, hact);
>>   
>>   	/* VSYNC polarity */
>> -	if (!(mode->flags & DRM_MODE_FLAG_NVSYNC))
>> -		tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5), BIT(5));
>> +	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5),
>> +			     (mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIT(5) : 0);
> 
> Was this the reverse before and should be:
> (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : BIT(5)

Bit 5 is 1 for active high vsync polarity. The test was previously 
!nvsync, i.e. the same as pvsync.

  Tomi

