Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E71614FE7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 18:01:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B059F10E3FD;
	Tue,  1 Nov 2022 17:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30FE10E404
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 17:01:34 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E9F8882BAF;
 Tue,  1 Nov 2022 18:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1667322092;
 bh=mb47bQ7eumx7B1YHYyBH97yj8bB9r2yaHyRYaSGd2KQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=wSkUPzGMRduqD75jWER/q0CxZtirqq62TH1p1i0KwE5xM82DM8iHMRpE0ww3hDjaf
 s7kJUQZLYHxFeYYNpQBEUkdZ8ehX5QkYgIkOIqgb1UpskiSmRDxvWRaSJkmaQHoCYt
 Jx9SMiFP/8js8WJ9EXFwHH1sHEUOubyt+DTbUdoahku9qEakawEDH0iyi7NwPJjYDN
 BsLZK6pAMbCU08WHljnudIkIzLncWtJvu33U25JFNiZkqDJuwP9+6VKD6TY33ANY4F
 lVMUPQKafgwM/OAa+zRAVA84tvdrRZ5oaMOUykvB0XAW9JA8SDarJ7dqGMbICZe2aO
 axj5RpXQcuY+w==
Message-ID: <85973f6d-2f58-8893-716f-633f6d34f016@denx.de>
Date: Tue, 1 Nov 2022 18:01:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] drm: lcdif: Set and enable FIFO Panic threshold
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>
References: <e15680d8-3790-4907-0efa-a597b70ed0d0@denx.de>
 <20221101160648.yhujgbay3nvm5pto@pengutronix.de>
 <adfa959a-cf94-d815-a5b2-9de157f0a6ca@denx.de>
 <20221101165128.s7d3eqtjd6wbbhc5@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20221101165128.s7d3eqtjd6wbbhc5@pengutronix.de>
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

On 11/1/22 17:51, Marco Felsch wrote:
> On 22-11-01, Marek Vasut wrote:
>> On 11/1/22 17:06, Marco Felsch wrote:
>>
>> Hi,
>>
>>>>> Also I understood the thresholds in such a way, that the FIFO watermark
>>>>> must be higher but there is no place left when it is set to 3/3. In such
>>>>> case this means that the PANIC will never left once it was entered.
>>>>
>>>> I think this part is wrong.
>>>>
>>>> Consider that the FIFO fill drops below 2/3 so PANIC signal asserts.
>>>
>>> ? I thought the PANIC is triggered if the FIFO drops below the 1/3
>>> threshold and is active till the 2/3 threshold.
>>
>> Yes, although I think the ASSERT/DEASSERT are one-way switches.
>>
>>>> After a bit of time, the FIFO fill reaches full 3/3 (maybe during
>>>> blanking period, where the data can be read in quickly without being
>>>> scanned out again), and the PANIC signal de-asserts.
>>>>
>>>> So the LCDIF won't be in constant PANIC asserted, but it will be there for
>>>> quite a bit longer.
>>>>
>>>>>>> It also seems to me that tuning these thresholds might be related to
>>>>>>> some special use-case of the SoC, and it is most likely not just the
>>>>>>> LCDIF thresholds which have been adjusted in such case, I would
>>>>>>> expect
>>>>>>> the NOC and GPV NIC priorities to be adjusted at that point too.
>>>>>
>>>>> As far as I understood, the PANIC signal triggers the NOC to use the
>>>>> PANIC signal priorities instead of the normal ones. I found a patch
>>>>> laying in our downstream [1] repo which configures the threshold. This
>>>>> raises the question which PANIC prio do you use? Do you have a patch for
>>>>> this? If I remember correctly some TF-A's like the NXP downstream one
>>>>> configure this but the upstream TF-A don't. Which TF-A do you use?
>>>>
>>>> Upstream 2.6 or 2.7 , so this tuning does not apply.
>>>
>>> So your panic priority is what?
>>
>> If you tell me which register (physical address) to read, I will do that on
>> this board right now.
> 
> According our patch it is:
> 
> #define HDMI_TX_CONTROL0       0x200
> #define HDMI_LCDIF_NOC_HURRY_PRIO_MASK GENMASK(14, 12)
> #define HDMI_LCDIF_NOC_HURRY_PRIO(p)   (((p) << 12) & HDMI_LCDIF_NOC_HURRY_PRIO_MASK)
> 
> and we set it within imx8mp_hdmi_blk_ctrl_power_on() by:
> 
> regmap_set_bits(bc->regmap, HDMI_TX_CONTROL0,
>                  HDMI_LCDIF_NOC_HURRY_PRIO(7));
> 
> imx8mp_hdmi_blk_ctrl_power_off():
> 
> regmap_clear_bits(bc->regmap, HDMI_TX_CONTROL0,
>                  HDMI_LCDIF_NOC_HURRY_PRIO(7));

Hmmm, bc->regmap does not exist in either upstream or downstream ATF 
versions per git grep, maybe you can give me the exact physical address 
of the register you would like me to read?
