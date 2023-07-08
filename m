Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFEF74BECE
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 21:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FAE10E04F;
	Sat,  8 Jul 2023 19:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFCB10E04F
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jul 2023 19:02:32 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BCE3C86122;
 Sat,  8 Jul 2023 21:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1688842948;
 bh=p+9gwoBP2nsJXqI0ShC8/rW6j0tP1mQAAZkMHFlKuTQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=qpJjMOPEpEBo4rop4VANC29QDARn8rl48j7+lBqxLjTe0zJ135Ua0DVPvklUItsBg
 BfsY2AEyAXQTb0WhwUiK3n3pW9nCM0QFC3Sia/KeYNrgyGANN84xmwgGJdEC5vhuKS
 vQZKgBoHYvpH5DMnZk8QyO+bYotSQixc5exeaUqQzrvHz5NAOtzi3DXBOrabJSJx1U
 Mvs8zmXc5qAbeOnKgb/GceB1Q1OMjqZaZOoLBjccoH0Yzhm0X9jKjxSHfnb2x94RVT
 DWH579jMV7UwcapjsoeZjJqnyMbcNdNLD+xtIHZsx6roBYcKEESvKWiYRVPQa0JRZF
 BtsRDgopra3yg==
Message-ID: <42d0c62a-e635-6314-5418-2a5afb0c45b4@denx.de>
Date: Sat, 8 Jul 2023 21:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] drm: bridge: tc358767: give VSDELAY some positive
 value
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
References: <20230602191501.4138433-1-l.stach@pengutronix.de>
 <20230602191501.4138433-2-l.stach@pengutronix.de>
 <70962376-c7f1-1adc-37e4-55fa33055ae9@denx.de>
 <7210bb5955a469134f3b072007bf98a74c8f17da.camel@pengutronix.de>
 <d7707a56-2b36-25d0-d5f2-79ef60b292bd@denx.de>
 <182004fb03699d04cbcc1b1b74c95c88a576621c.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <182004fb03699d04cbcc1b1b74c95c88a576621c.camel@pengutronix.de>
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

On 6/8/23 10:11, Lucas Stach wrote:
> Am Mittwoch, dem 07.06.2023 um 15:54 +0200 schrieb Marek Vasut:
>> On 6/7/23 14:53, Lucas Stach wrote:
>>> Am Freitag, dem 02.06.2023 um 23:34 +0200 schrieb Marek Vasut:
>>>> On 6/2/23 21:15, Lucas Stach wrote:
>>>>> From: David Jander <david@protonic.nl>
>>>>>
>>>>> The documentation is not clear about how this delay works.
>>>>> Empirical tests have shown that with a VSDELAY of 0, the first
>>>>> scanline is not properly formatted in the output stream when
>>>>> DSI->DP mode is used. The calculation spreadsheets from Toshiba
>>>>> seem to always make this value equal to the HFP + 10 for DSI->DP
>>>>> use-case. For DSI->DPI this value should be > 2 and for DPI->DP
>>>>> it seems to always be 0x64.
>>>>>
>>>>> Signed-off-by: David Jander <david@protonic.nl>
>>>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>>>> ---
>>>>>     drivers/gpu/drm/bridge/tc358767.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
>>>>> index 46916ae30f8f..9f2c67b4a488 100644
>>>>> --- a/drivers/gpu/drm/bridge/tc358767.c
>>>>> +++ b/drivers/gpu/drm/bridge/tc358767.c
>>>>> @@ -817,7 +817,7 @@ static int tc_set_common_video_mode(struct tc_data *tc,
>>>>>     	 * sync signals
>>>>>     	 */
>>>>>     	ret = regmap_write(tc->regmap, VPCTRL0,
>>>>> -			   FIELD_PREP(VSDELAY, 0) |
>>>>> +			   FIELD_PREP(VSDELAY, right_margin + 10) |
>>>>>     			   OPXLFMT_RGB888 | FRMSYNC_DISABLED | MSF_DISABLED);
>>>>>     	if (ret)
>>>>>     		return ret;
>>>>
>>>> Aren't you running into a problem due to VS timing misconfiguration on
>>>> the scanout engine or DSI serializer side ? The VSDELAY seems to
>>>> increase the length of VSYNC active .
>>>>
>>>
>>> No, as far as I understand the VSDELAY adds an offset between input an
>>> output side of the video FIFO. It shouldn't increase the length of any
>>> sync signal, but delays the read side of the FIFO, so the write (DSI)
>>> side has some margin to put data into the FIFO before DP side starts to
>>> assemble packets.
>>
>> Does this apply to DSI-to-DPI mode too ?
> 
> I guess it does the same thing, but the technical documents I have
> don't really say anything about it. I don't think the VSDELAY really
> matters in the DPI output case, as DPI is much slower in pulling data
> out of the FIFO compared to the DP packetizing, so the DSI side should
> always be able to keep up with the DPI side.
> 
>>
>>>>    Which DSI bus mode do you use, sync events/pulses/burst ?
>>>
>>> At the time when this patch was written it still was the SYNC_PULSE
>>> mode.
>>
>> Can you please double-check this with current burst mode ?
> 
> It works fine on a hardware in DSI to DPI mode. I could check that
> things are still as expected in DSI to DP mode later, but I don't
> expect any issues.

Tested-by: Marek Vasut <marex@denx.de> # TC9595
Reviewed-by: Marek Vasut <marex@denx.de>

Sorry for the delay
