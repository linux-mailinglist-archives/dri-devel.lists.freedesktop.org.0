Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9D6461A78
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 15:57:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87F6EC65;
	Mon, 29 Nov 2021 14:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D9E6EC4D;
 Mon, 29 Nov 2021 14:57:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E7DCC1F44873
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638197821; bh=diE9jAw9lUIQQd/ekZxakvexYtMLMupgXaiQfjW+cc0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UO/jvS33cB5wBTB4cnZqRx3JAgkN85LgS7IOfCDwj4kYSxdjrk4D4opmiWmxHmwpe
 9V6FyjGLxQnjZhGqB7LAVFNl5PqtMkDUpsjUZykYr0bKNosMbGGIlBthGwXFXPVDeZ
 9mitBOEq70eDAdYOj7uvJzbLmy8bTEg2PF/WdQkZBIgfND7dNAd5q2n0qkznOh8kB/
 Oli2bJO55R53FmGMtzq55YIhnWPv8ssN9BRruJYhKz1KBoOodEpar2Td1cil4Ml2mJ
 Ak0Rb0E53FCmTpTDeQA2KU+4QcNH1k2wQc5koF1zcfScyevVnrmkqYUne2QMSCUYaL
 Xy7HFlYLJNUhA==
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <bf1540f1-4a9f-a9d6-d487-929107c487fd@linaro.org>
 <9a0158ae-a3b1-21b2-1ba3-82d4901eb873@collabora.com>
 <CAA8EJpq1Lmpe8v5OLuEHBJd8Ehid+Jpyzs42BURVmn4B-=yWJA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4e395a6f-e174-ca5c-4fce-197dc69cd185@collabora.com>
Date: Mon, 29 Nov 2021 15:56:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAA8EJpq1Lmpe8v5OLuEHBJd8Ehid+Jpyzs42BURVmn4B-=yWJA@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jami.kettunen@somainline.org, maxime@cerno.tech, marijn.suijten@somainline.org,
 kernel@collabora.com, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 29/11/21 15:53, Dmitry Baryshkov ha scritto:
> Hi,
> 
> On Mon, 29 Nov 2021 at 17:15, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 29/11/21 03:20, Dmitry Baryshkov ha scritto:
>>> Hi,
>>>
>>> On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
>>>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>>>> DSI host gets initialized earlier, but this caused unability to probe
>>>> the entire stack of components because they all depend on interrupts
>>>> coming from the main `mdss` node (mdp5, or dpu1).
>>>>
>>>> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
>>>> them at msm_pdev_probe() time: this will make sure that we add the
>>>> required interrupt controller mapping before dsi and/or other components
>>>> try to initialize, finally satisfying the dependency.
>>>>
>>>> While at it, also change the allocation of msm_drm_private to use the
>>>> devm variant of kzalloc().
>>>>
>>>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>> I have been thinking about this. I do not feel that this is the correct approach.
>>> Currently DRM device exists only when all components are bound. If any of the
>>> subdevices is removed, corresponding component is delteted (and thus all components
>>> are unbound), the DRM device is taken down. This results in the state cleanup,
>>> userspace notifications, etc.
>>>
>>> With your changes, DRM device will continue to exist even after one of subdevices
>>> is removed. This is not an expected behaviour, since subdrivers do not perform full
>>> cleanup, delegating that to DRM device takedown.
>>>
>>> I suppose that proper solution would be to split msm_drv.c into into:
>>> - generic components & drm code to be called from mdp4/mdp5/dpu driver (making
>>> mdp4, mdp5 or dpu1 the components master)
>>>
>>> - bare mdss driver, taking care only about IRQs, OF devices population - calling
>>> proper mdss_init/mdss_destroy functions. Most probably we can drop this part
>>> altogether and just make md5_mdss.c/dpu_mdss.c proper platform drivers.
>>>
>>
>>
>> Hmm... getting a better look on how things are structured... yes, I mostly agree
>> with you, though I'm not sure about making MDP{4,5}/DPU1 the component master; that
>> would result in a major change in drm-msm, which may be "a bit too much".
>>
>> Don't misunderstand me here, please, major changes are fine - but I feel urgency
>> to get this bug solved ASAP (since drm-msm is currently broken at least for drm
>> bridges) and, if we do anything major, that would require a very careful slow
>> review process that will leave this driver broken for a lot of time.
> 
> Yep. I wanted to hear your and Rob's opinion, that's why I did not
> rush into implementing it.
> I still think this is the way to go in the long term. What I really
> liked in your patchset was untying the knot between component binds
> returning EPROBE_DEFER and mdss subdevices being in place. This solved
> the "dsi host registration" infinite loop for me.
> 

Thanks. I'm also curious about Rob's opinion on this, as that'd be very valuable.

>>
>> I actually tried something else that "simplifies" the former approach, so here's
>> my proposal:
>> * we introduce {mdp5,dpu}_mdss_early_init(struct device, struct msm_drm_private)
>> * allocate only msm_drm_private in msm_pdev_probe, leaving the drm_dev_alloc call
>>     into msm_drm_init(), so that the drm_dev_put() stays in msm_drm_uninit()
>> * pass msm_drm_private as drvdata instead of drm_device
>> * change all the drvdata users to get drm_device from priv->dev, instead of getting
>>     msm_drm_private from drm_device->dev_private (like many other drm drivers are
>>     currently doing)
> 
> This sounds in a way that it should work. I'm looking forward to
> seeing (and testing) your patches.
> 

Alright then, I'm running some more tests and cleaning up the patches.
Expect a v2 between today and tomorrow at max! :))

>>
>> This way, we keep the current flow of creating the DRM device at msm_drm_init time
>> and tearing it down at msm_drm_unbind time, solving the issue that you are
>> describing.
>>
>> If you're okay with this kind of approach, I have two patches here that are 95%
>> ready, can finish them off and send briefly.
>>
>> Though, something else must be noted here... in the last mail where I'm pasting
>> a crash that happens when running 'rmmod panel_edp ti_sn65dsi86', I have implied
>> that this is happening due to the patch that I've sent: after some more research,
>> I'm not convinced anymore that this is a consequence of that. That crash may not
>> be related to my fix at all, but to something else (perhaps also related to commit
>> 8f59ee9a570c, the one that we're fixing here).
>>
>> Of course, that crash still happens even with the approach that I've just proposed.
>>
>>
>> Looking forward for your opinion!
>>
>> Cheers,
>> - Angelo
> 
> 
> 


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
