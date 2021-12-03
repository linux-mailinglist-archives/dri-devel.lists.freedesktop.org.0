Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BA4677F9
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 14:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E227ABBD;
	Fri,  3 Dec 2021 13:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601A97ABBC;
 Fri,  3 Dec 2021 13:17:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 691801F4582B
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638537437; bh=aG5Nh5AeDAZ+4l5Vn2gzmMv9K1Qc96PFjH2Pr66f7qE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=c1xEg92EenV4e2ZpIMu/Aq738AXBeE8YAnB/m9JSDvp74+IuqUnrCkcOlEBoNLA5o
 aue0/fFt4BRR9yQ+Ww/QTeugwzXoCcjYcFs52K+167UCPhfmjKtBAOWe9vaS8g1RkB
 AQ7nI0iz8vze2o++A6er1Qxl1qUB3KAcFjFXzr/+94yqxboEhJ1YkPlXlwUGYvxkkg
 t8Ebywiwl8aAGQZsawJGyVEQNSRMlVshZQAiYrplB/S5EQm1kmwKxr94wq444zAP5U
 5bcGrGsKGts0E1rZfxy7cJ6hAhBLRAfAN1cEjpXKbAaI6pOQ+ijvmHMfywLFi0uzWd
 WHRF93mocPAhQ==
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20211201105210.24970-3-angelogioacchino.delregno@collabora.com>
 <20211201202023.2313971-1-dmitry.baryshkov@linaro.org>
 <21fe6cf4-3cef-91e1-7bf7-b94ac223e7c5@collabora.com>
 <4cb2fd68-6917-3ac3-f387-7cecb07177f3@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <75aeecbc-eff9-32d5-e682-826a5ce43c1f@collabora.com>
Date: Fri, 3 Dec 2021 14:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4cb2fd68-6917-3ac3-f387-7cecb07177f3@linaro.org>
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/12/21 14:14, Dmitry Baryshkov ha scritto:
> On 03/12/2021 13:43, AngeloGioacchino Del Regno wrote:
>> Il 01/12/21 21:20, Dmitry Baryshkov ha scritto:
>>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>>> DSI host gets initialized earlier, but this caused unability to probe
>>> the entire stack of components because they all depend on interrupts
>>> coming from the main `mdss` node (mdp5, or dpu1).
>>>
>>> To fix this issue, move mdss device initialization (which include irq
>>> domain setup) to msm_mdev_probe() time, as to make sure that the
>>> interrupt controller is available before dsi and/or other components try
>>> to initialize, finally satisfying the dependency.
>>>
>>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>>> Co-Developed-By: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>
>>> When checking your patch, I noticed that IRQ domain is created before
>>> respective MDSS clocks are enabled. This does not look like causing any
>>> issues at this time, but it did not look good. So I started moving
>>> clocks parsing to early_init() callbacks. And at some point it looked
>>> like we can drop the init()/destroy() callbacks in favour of
>>> early_init() and remove(). Which promted me to move init()/destroy() in
>>> place of early_init()/remove() with few minor fixes here and there.
>>>
>>
>>
>> Hey Dmitry,
>> I wanted to make the least amount of changes to Rob's logic... I know that
>> the clocks aren't up before registering the domain, but my logic was implying
>> that if the handlers aren't registered, then there's no interrupt coming, hence
>> no risk of getting issues. Same if the hardware is down, you can't get any
>> interrupt, because it can't generate any (but if bootloader leaves it up.. eh.)
> 
> We can get spurious interrupts for any reason, which puts us at risk of peeking 
> into unpowered registers. So, while your approach was working, it did not seem 
> fully correct.
> 

Yeah, that's right and I totally agree.

>>
>> I recognize that such approach is "fragile enough", lastly, I agree with this
>> patch which is, in the end, something that is in the middle between my first
>> and last approach.
>>
>> I've tested this one on trogdor-lazor-limozeen and seems to be working in an
>> analogous way to my v2/v3, so on my side it's validated.
>>
>>
>> Let's go for this one!
>> How do we proceeed now? Are you sending a new series with the new patches, or
>> should I?
> 
> I'll run a few more tests and then I'll probably include both patches into the next 
> series to be sent to Rob.
> 

That's perfect!

>>
>> Also, I don't think this is relevant, since I'm in co-dev, but in case it is:
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> P.S.: Sorry for the 1-day delay, got busy with other tasks!
> 
> No problem, it was just single day, no worries.
> 

Alright, thank you! :D
