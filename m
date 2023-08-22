Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D0F7846A4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16D388EF0;
	Tue, 22 Aug 2023 16:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F3188EF0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:13:42 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D84E899;
 Tue, 22 Aug 2023 18:12:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692720744;
 bh=pXAGmakmjiG9tclGDThSE3v81Zw+kHIuHhBkCItvcHU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AvI6AEbsnrJ2+uff57WM74SqJo5OnmTsDHukR6AJegRp/K+8DCDRk7JUvx9lBVk7J
 JpoeJ7cg4bgVBVaYWg49cy7C+S7l7tFDIXvPU5LweXk42go5On6RrWONLuaZrsoPw6
 hSix0SCR2eWhuJiKhazxdMBzvoxLhEUnbXsJlmWg=
Message-ID: <64087bda-aba5-dae4-40b4-3c6113a496ed@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:13:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 03/12] drm/bridge: tc358768: Fix bit updates
To: Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
 <20230816-tc358768-v2-3-242b9d5f703a@ideasonboard.com>
 <e151e29e-7dc7-e237-aeed-4005911d9583@gmail.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <e151e29e-7dc7-e237-aeed-4005911d9583@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2023 01:22, Maxim Schwalm wrote:
> Hi Tomi,
> 
> On 16.08.23 13:25, Tomi Valkeinen wrote:
>> The driver has a few places where it does:
>>
>> if (thing_is_enabled_in_config)
>> 	update_thing_bit_in_hw()
>>
>> This means that if the thing is _not_ enabled, the bit never gets
>> cleared. This affects the h/vsyncs and continuous DSI clock bits.
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
>> +
>>   	/* HSYNC polarity */
>> -	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
>> -		tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0), BIT(0));
>> +	tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0),
>> +			     (mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIT(0) : 0);
>>   
>>   	/* Start DSI Tx */
>>   	tc358768_write(priv, TC358768_DSI_START, 0x1);
>>
> 
> shouldn't the last patch of this series be moved before this one?
> Currently, this patch will still lead to a temporary regression until
> patch #12 is applied.

Indeed, good point. I'll change the patch order.

  Tomi

