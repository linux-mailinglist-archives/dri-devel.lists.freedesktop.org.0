Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C897795A1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 19:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE49E10E6CB;
	Fri, 11 Aug 2023 17:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFE0510E6CB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 17:06:03 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC780FA6;
 Fri, 11 Aug 2023 19:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691773493;
 bh=aaPoirlmZg6vlC83FhqXIwEasaSW+9wd+nAmaSdq26s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QZ3AH09xCtZ+D3q2U5Vuz+ewShCcXC+7lgdaJDLmdVx8d8wczR12ug4vWdtpCP1HE
 NiQFgcy/ea+zdMYuQ7PwwyxGmWZbOCaC6tX+JszlZP8CScAcXpxYEk/OK8By/FIRi9
 9hU/tSG+WOC/3gXB6QRO78xwWArbN7z8J5T/Qah4=
Message-ID: <af25e724-e06b-e3cd-665b-38281f0c7fad@ideasonboard.com>
Date: Fri, 11 Aug 2023 20:05:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/11] drm/bridge: tc358768: Print logical values, not raw
 register values
Content-Language: en-US
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
 <20230804-tc358768-v1-5-1afd44b7826b@ideasonboard.com>
 <e74e055d-b3df-4ac9-aef6-8b07b2062a7f@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <e74e055d-b3df-4ac9-aef6-8b07b2062a7f@gmail.com>
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

On 11/08/2023 19:31, Péter Ujfalusi wrote:
> 
> 
> On 04/08/2023 13:44, Tomi Valkeinen wrote:
>> The driver debug prints DSI related timings as raw register values in
>> hex. It is much more useful to see the "logical" value of the timing,
>> not the register value.
> 
> I'm a bit confused by the term 'logical' value, I think you meant
> decimal, easier to read by humans numbers.

Not just decimal. Previously the code printed the register values, which 
e.g. could contain two values ORed together. So, with "logical" I just 
meant the "real" value, instead of "register-encoded".

>> Change the prints to print the values separately, in case a single
>> register contains multiple values, and use %u to have it in a more human
>> consumable form.
> 
> But, yes, decimal is better for the dmesg, as I recall I had a tool
> which was using hex numbers so it was better to have the prints also in hex.
> 
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> 
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/gpu/drm/bridge/tc358768.c | 21 ++++++++++++---------
>>   1 file changed, 12 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
>> index 9b633038af33..0ef51d04bb21 100644
>> --- a/drivers/gpu/drm/bridge/tc358768.c
>> +++ b/drivers/gpu/drm/bridge/tc358768.c
>> @@ -739,57 +739,59 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>   
>>   	/* LP11 > 100us for D-PHY Rx Init */
>>   	val = tc358768_ns_to_cnt(100 * 1000, dsibclk_nsk) - 1;
>> -	dev_dbg(priv->dev, "LINEINITCNT: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "LINEINITCNT: %u\n", val);
>>   	tc358768_write(priv, TC358768_LINEINITCNT, val);
>>   
>>   	/* LPTimeCnt > 50ns */
>>   	val = tc358768_ns_to_cnt(50, dsibclk_nsk) - 1;
>>   	lptxcnt = val;
>> -	dev_dbg(priv->dev, "LPTXTIMECNT: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "LPTXTIMECNT: %u\n", val);
>>   	tc358768_write(priv, TC358768_LPTXTIMECNT, val);
>>   
>>   	/* 38ns < TCLK_PREPARE < 95ns */
>>   	val = tc358768_ns_to_cnt(65, dsibclk_nsk) - 1;
>> +	dev_dbg(priv->dev, "TCLK_PREPARECNT %u\n", val);
>>   	/* TCLK_PREPARE + TCLK_ZERO > 300ns */
>>   	val2 = tc358768_ns_to_cnt(300 - tc358768_to_ns(2 * ui_nsk),
>>   				  dsibclk_nsk) - 2;
>> +	dev_dbg(priv->dev, "TCLK_ZEROCNT %u\n", val2);
>>   	val |= val2 << 8;
>> -	dev_dbg(priv->dev, "TCLK_HEADERCNT: 0x%x\n", val);
>>   	tc358768_write(priv, TC358768_TCLK_HEADERCNT, val);
>>   
>>   	/* TCLK_TRAIL > 60ns AND TEOT <= 105 ns + 12*UI */
>>   	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(2 * ui_nsk), dsibclk_nsk) - 5;
>>   	val = clamp(raw_val, 0, 127);
>> -	dev_dbg(priv->dev, "TCLK_TRAILCNT: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "TCLK_TRAILCNT: %u\n", val);
>>   	tc358768_write(priv, TC358768_TCLK_TRAILCNT, val);
>>   
>>   	/* 40ns + 4*UI < THS_PREPARE < 85ns + 6*UI */
>>   	val = 50 + tc358768_to_ns(4 * ui_nsk);
>>   	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
>> +	dev_dbg(priv->dev, "THS_PREPARECNT %u\n", val);
>>   	/* THS_PREPARE + THS_ZERO > 145ns + 10*UI */
>>   	raw_val = tc358768_ns_to_cnt(145 - tc358768_to_ns(3 * ui_nsk), dsibclk_nsk) - 10;
>>   	val2 = clamp(raw_val, 0, 127);
>> +	dev_dbg(priv->dev, "THS_ZEROCNT %u\n", val2);
>>   	val |= val2 << 8;
>> -	dev_dbg(priv->dev, "THS_HEADERCNT: 0x%x\n", val);
>>   	tc358768_write(priv, TC358768_THS_HEADERCNT, val);
>>   
>>   	/* TWAKEUP > 1ms in lptxcnt steps */
>>   	val = tc358768_ns_to_cnt(1020000, dsibclk_nsk);
>>   	val = val / (lptxcnt + 1) - 1;
>> -	dev_dbg(priv->dev, "TWAKEUP: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "TWAKEUP: %u\n", val);
>>   	tc358768_write(priv, TC358768_TWAKEUP, val);
>>   
>>   	/* TCLK_POSTCNT > 60ns + 52*UI */
>>   	val = tc358768_ns_to_cnt(60 + tc358768_to_ns(52 * ui_nsk),
>>   				 dsibclk_nsk) - 3;
>> -	dev_dbg(priv->dev, "TCLK_POSTCNT: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "TCLK_POSTCNT: %u\n", val);
>>   	tc358768_write(priv, TC358768_TCLK_POSTCNT, val);
>>   
>>   	/* max(60ns + 4*UI, 8*UI) < THS_TRAILCNT < 105ns + 12*UI */
>>   	raw_val = tc358768_ns_to_cnt(60 + tc358768_to_ns(18 * ui_nsk),
>>   				     dsibclk_nsk) - 4;
>>   	val = clamp(raw_val, 0, 15);
>> -	dev_dbg(priv->dev, "THS_TRAILCNT: 0x%x\n", val);
>> +	dev_dbg(priv->dev, "THS_TRAILCNT: %u\n", val);
>>   	tc358768_write(priv, TC358768_THS_TRAILCNT, val);
>>   
>>   	val = BIT(0);
>> @@ -803,10 +805,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
>>   	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
>>   	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
>>   	val = tc358768_ns_to_cnt(val, dsibclk_nsk) / 4 - 1;
>> +	dev_dbg(priv->dev, "TXTAGOCNT: %u\n", val);
>>   	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
>>   				  dsibclk_nsk) - 2;
>> +	dev_dbg(priv->dev, "RXTASURECNT: %u\n", val2);
>>   	val = val << 16 | val2;
>> -	dev_dbg(priv->dev, "BTACNTRL1: 0x%x\n", val);
>>   	tc358768_write(priv, TC358768_BTACNTRL1, val);
>>   
>>   	/* START[0] */
>>
> 

