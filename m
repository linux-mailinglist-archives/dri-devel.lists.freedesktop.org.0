Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD79614F27
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 17:27:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4796510E3FC;
	Tue,  1 Nov 2022 16:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB53810E403
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 16:26:57 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1CF4684D44;
 Tue,  1 Nov 2022 17:26:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667320015;
 bh=/711bLeBx+ChoEm2ovoZx2DP7NwxMmU0UNDxtaySoSo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wVvtvzYyVrSXkytE5q93O2isFkBcbUD+Ha/l3XzsjvE9QyByZHz8QwmDO9y1k+fb4
 KZnCoXHLTVZtPc7PYieHy7JeAVCtLSkzKwUmMsl2vD+ljM6Hn7dEbEAqhqqTLzxlMH
 c24+pTuFTQACpClPaNh88OPRO7CY/UgtxgiC1GPwiQ1YkiyNWlpbV3F00D0BMABxd0
 szUoViOdLTA6/GrA5knbkRPFbKEkN4KUhgSsYMNTiypkRpSBb7j30pcgQk5ErX8H6F
 kGRwJENTJbhtYmobsXGZPE8yxEi/kDiSmOP699vrW0JEV1+q2+jk/NonvCP9whmX+x
 cNLZcYJsZ2ovA==
Message-ID: <adfa959a-cf94-d815-a5b2-9de157f0a6ca@denx.de>
Date: Tue, 1 Nov 2022 17:26:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
References: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
 <20221101160648.yhujgbay3nvm5pto@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221101160648.yhujgbay3nvm5pto@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Peng Fan <peng.fan@nxp.com>, Liu Ying <victor.liu@nxp.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Martyn Welch <martyn.welch@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, "jian.li" <jian.li@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/1/22 17:06, Marco Felsch wrote:

Hi,

>>> Also I understood the thresholds in such a way, that the FIFO watermark
>>> must be higher but there is no place left when it is set to 3/3. In such
>>> case this means that the PANIC will never left once it was entered.
>>
>> I think this part is wrong.
>>
>> Consider that the FIFO fill drops below 2/3 so PANIC signal asserts.
> 
> ? I thought the PANIC is triggered if the FIFO drops below the 1/3
> threshold and is active till the 2/3 threshold.

Yes, although I think the ASSERT/DEASSERT are one-way switches.

>> After a bit of time, the FIFO fill reaches full 3/3 (maybe during
>> blanking period, where the data can be read in quickly without being
>> scanned out again), and the PANIC signal de-asserts.
>>
>> So the LCDIF won't be in constant PANIC asserted, but it will be there for
>> quite a bit longer.
>>
>>>>> It also seems to me that tuning these thresholds might be related to
>>>>> some special use-case of the SoC, and it is most likely not just the
>>>>> LCDIF thresholds which have been adjusted in such case, I would
>>>>> expect
>>>>> the NOC and GPV NIC priorities to be adjusted at that point too.
>>>
>>> As far as I understood, the PANIC signal triggers the NOC to use the
>>> PANIC signal priorities instead of the normal ones. I found a patch
>>> laying in our downstream [1] repo which configures the threshold. This
>>> raises the question which PANIC prio do you use? Do you have a patch for
>>> this? If I remember correctly some TF-A's like the NXP downstream one
>>> configure this but the upstream TF-A don't. Which TF-A do you use?
>>
>> Upstream 2.6 or 2.7 , so this tuning does not apply.
> 
> So your panic priority is what?

If you tell me which register (physical address) to read, I will do that 
on this board right now.

>>>>> So unless there are further details for that use-case which justify
>>>>> making this somehow configurable, then maybe we should just stick to
>>>>> 1/3 and 2/3 for now. And once there is a valid use-case which does
>>>>> justify making this configurable, then we can add the DT properties
>>>>> and all.
>>>>>
>>>>> What do you think ?
>>>>
>>>> No strong opinion from me on using LOW=1/3 and HIGH=2/3 thresholds for
>>>> now if they satisfy all current users of the upstream kernel.  Tuning
>>>> them in a certain way will be indeed needed once an usecase comes along
>>>> and still suffers from the FIFO underflows with those thresholds.
>>>
>>> I think that 1/3 and 2/3 should be fine for now too.
>>
>> All right, lemme re-test this, send V2, and then we can go from there.
> 
> Okay :)
> 
>> btw. can you resend that [PATCH] drm: lcdif: change burst size to 256B with
>> Fixes tag , so it can trickle into stable releases ?
> 
> Shure I will resend it with the tag added.

Thanks, I'll pick it via drm-misc then.
