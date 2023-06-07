Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3E77263C3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA5F10E504;
	Wed,  7 Jun 2023 15:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEFB10E504
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 15:10:56 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D5EF085F52;
 Wed,  7 Jun 2023 17:10:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1686150653;
 bh=ilu4t5MfB/m1MzJmgwplp52WL1DIskHqT3lUx4DLq6w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h5qifyzF7rkNhicWqtguapyRPJqHF2bf5ouPi6t2pP08Qsl3DmMgmEyjMIkfeAc8e
 pPu7ngst8jKmd8MZvjvoXaKR4Bk9Oy3M6a8Vq1/jl6TyB0z28vrwhhdmkJXyHZVkai
 3/512bMvfqaFi7FdCddLdtziWOrPO2jaqyRKQSQPn4ce3dpHUUeOaXTF31TGXhb+H6
 OO4WB8+WOFnRWCrB4KkXMlba62E/3zWnng7mDf91c2kA6vx1rm9J2+iu0yiXQLS4sH
 1r+kMf5F/pW0xHF2pUbgaXQw5scH0ELMm0BF3iDFZpr61zWROSDlT0upeV5ZYjaxUU
 9e4eJlhzsBwZw==
Message-ID: <d7707a56-2b36-25d0-d5f2-79ef60b292bd@denx.de>
Date: Wed, 7 Jun 2023 15:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm: bridge: tc358767: give VSDELAY some positive
 value
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
 <20230602191501.4138433-2-l.stach@pengutronix.de>
 <70962376-c7f1-1adc-37e4-55fa33055ae9@denx.de>
 <7210bb5955a469134f3b072007bf98a74c8f17da.camel@pengutronix.de>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <7210bb5955a469134f3b072007bf98a74c8f17da.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/7/23 14:53, Lucas Stach wrote:
> Am Freitag, dem 02.06.2023 um 23:34 +0200 schrieb Marek Vasut:
>> On 6/2/23 21:15, Lucas Stach wrote:
>>> From: David Jander <david@protonic.nl>
>>>
>>> The documentation is not clear about how this delay works.
>>> Empirical tests have shown that with a VSDELAY of 0, the first
>>> scanline is not properly formatted in the output stream when
>>> DSI->DP mode is used. The calculation spreadsheets from Toshiba
>>> seem to always make this value equal to the HFP + 10 for DSI->DP
>>> use-case. For DSI->DPI this value should be > 2 and for DPI->DP
>>> it seems to always be 0x64.
>>>
>>> Signed-off-by: David Jander <david@protonic.nl>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> ---
>>>    drivers/gpu/drm/bridge/tc358767.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>>> index 46916ae30f8f..9f2c67b4a488 100644
>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>> @@ -817,7 +817,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
>>>    	 * sync signals
>>>    	 */
>>>    	ret = regmap_write(tc->regmap, VPCTRL0,
>>> -			   FIELD_PREP(VSDELAY, 0) |
>>> +			   FIELD_PREP(VSDELAY, right_margin + 10) |
>>>    			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
>>>    	if (ret)
>>>    		return ret;
>>
>> Aren't you running into a problem due to VS timing misconfiguration on
>> the scanout engine or DSI serializer side ? The VSDELAY seems to
>> increase the length of VSYNC active .
>>
> 
> No, as far as I understand the VSDELAY adds an offset between input an
> output side of the video FIFO. It shouldn't increase the length of any
> sync signal, but delays the read side of the FIFO, so the write (DSI)
> side has some margin to put data into the FIFO before DP side starts to
> assemble packets.

Does this apply to DSI-to-DPI mode too ?

>>   Which DSI bus mode do you use, sync events/pulses/burst ?
> 
> At the time when this patch was written it still was the SYNC_PULSE
> mode.

Can you please double-check this with current burst mode ?
