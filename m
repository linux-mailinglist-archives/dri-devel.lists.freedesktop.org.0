Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6121E521053
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 11:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C7310EC89;
	Tue, 10 May 2022 09:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AEEF10EC89
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 09:08:11 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8A46E8425F;
 Tue, 10 May 2022 11:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652173689;
 bh=E6jkbDPEEarmL3Z4kt6DvgqRMtKVSM7w2MC9iPpvJE8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fdct4VUwakfeWrbIhy8K3x+szmYkr4jr4LI7RiBlUiHfKO5+y1TO1yZSfik7/ZBK6
 5AmCoRcJTKZSEl3mVxXrL6xAxjsU0/QKfO1jMDSoG4nAVIGe0qP/yAr0Vuq8f1eHwg
 FHmlrvAEmkHbK1YhSmchEFvXmkktPU2Piik7ZjKY0dl57FzpV6HY3JU9rvOhCIJ5C0
 KuqnvnOdyUgI+vr6YP+x0P0k5RYtf0WwWoxc5Jf9oPhZC7IaoMv0E0uZK+EBZaSq4F
 qnJiAVcQ1BMGaUT6RL0T0oDrLUWOv1m3hZBChFm4Wn6PXw4J1+X6WSCzDv5KO9BifW
 rKP+322X1lXyA==
Message-ID: <20b52520-537f-92e4-3da0-7b0e434a7f50@denx.de>
Date: Tue, 10 May 2022 11:08:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/stm: dsi: Enable wrapper glue regulator early
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 dri-devel@lists.freedesktop.org
References: <20220429204519.241549-1-marex@denx.de>
 <56f6fc01-4f33-b240-5539-492b2c115476@foss.st.com>
 <24f18d45-09d9-05b6-b1ad-9ee2854c53ec@denx.de>
 <c04661ca-20a4-17c6-8170-f3ed2594bdbd@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <c04661ca-20a4-17c6-8170-f3ed2594bdbd@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, robert.foss@linaro.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/10/22 10:51, Raphael Gallais-Pou wrote:
> 
> On 5/5/22 19:40, Marek Vasut wrote:
>> On 5/4/22 09:59, Raphael Gallais-Pou wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>> [...]
>>
>>>> @@ -499,8 +512,16 @@ static int dw_mipi_dsi_stm_probe(struct platform_device
>>>> *pdev)
>>>>        }
>>>>          dsi->hw_version = dsi_read(dsi, DSI_VERSION) & VERSION;
>>>> +
>>>> +    ret = dw_mipi_dsi_phy_regulator_on(dsi);
>>>>        clk_disable_unprepare(pclk);
>>>>    +    if (ret) {
>>>> +        DRM_ERROR("%s: Failed to enable wrapper regulator, ret=%d\n",
>>>> +              __func__, ret);
>>>> +        goto err_dsi_probe;
>>>> +    }
>>>> +
>>>
>>> I have no problem until here. If I understand this correctly, it enables the
>>> regulator during all the life of the driver.
>>>
>>> If you feel an urge to merge this patch into the Linux kernel, the st display
>>> team could gladly do it because it enables more hardware bridges. However
>>> another solution could be to rework a bit the regulator part of the driver so
>>> that you would have only device tree to change, introducing a 'reg-always-on'
>>> property.
>>>
>>> This driver needs in fact a bit of a rework with the power management. A
>>> solution could be to move the regulator-related part in
>>> dw_mipi_dsi_stm_power_on/off() so that it is only activated when needed.
>>> Those functions would integrate the enabling of the regulator, the switch for
>>> the internal regulator, and eventually handle the PLL if it cannot lock when
>>> the regulator is off.
>>>
>>> With the DT property, the power management would be only in the
>>> probe()/remove(). In that way the DSI bridges would have the logic they need
>>> to work.
>>>
>>> Ultimately there is two possibilities :
>>>    * You really need this patch to be merged asap
>>>    * You are ok to wait until we send the solution described above
>>>
>>> If you want to write those patches (each for DT and regulator), feel free to
>>> do it.
>>>
>>> What do you think about it ?
>>
>> Maybe a more generic question first -- is there a way to pull the data lanes
>> to LP11 without enabling the regulator ?
>>
>> Also note that you likely want to wait with this patch, there is likely soon
>> going to be a discussion about how to handle all those different requirements
>> for initial DSI LP states and clock needed by DSI bridges, encoding such
>> policy into DT is not the right approach.
> 
> 
> After quite some time of internal research, it is unfortunately not possible to
> adjust data lanes state to LP11 without the regulator enabled.
> 
> So I guess, without a change to handle DSI LP states differently within DRM,
> your patch may be the best approach to operate such bridges.
> 
> Note that I am still trying to understand how other chip vendors managed the
> case. Maybe their hardware can effectively handle the DL states without enabling
> their regulator ?

I think they just keep the DSI data lanes in LP11 when the bridge comes 
up, but this is probably currently inconsistent and totally ad-hoc, 
hence the need for some sort of new API to control these states better.

> I wonder if another solution could be to move the TC356787 bridge reset outside
> the probe, so we could also delay the regulator_enable on STM driver side.

No, you cannot do that, because of the (e)DP aux channel which has to be 
available early on that bridge, i.e. in probe. That is also something 
which makes clocking it from DSI HS clock hard on that chip.

> Anyway I agree with you that modifying the device tree is not the right method,
> and having the driver always powered is not so nice either.

Let's postpone this patch until we know what to do about the LP states 
in general. Of course, if another bridge which has problems like this 
TC358767 pops up on STM32, you can just apply this patch then, oh well.
