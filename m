Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3A447CDA9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 08:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6BE1121B8;
	Wed, 22 Dec 2021 07:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F0A1121B8;
 Wed, 22 Dec 2021 07:50:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so948274wmd.5; 
 Tue, 21 Dec 2021 23:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=MdtgjKYpobEBx1vtlxyNvAdu1nuei7NEW9qX8scp1AU=;
 b=ga0UdqCQfv7tRhE25V0WynofhsZylsbFD/A/xtNx8JuOzw/TbwlheHnV2cJMngEO08
 DPso8DwEXKX2v+t+xChDtKMHuOWyJOM55+juFV4umUaAW1lr2p5uLcUnNvTTAPVt4TC+
 o/1q26MGMss52QhNMxqC6oFXLsjCfX6fzs4wZvoDtM5rhbzOS8SV6D5RB54MQaW5YVB7
 flp9jGf+a7we845anf+6FYOyuZFuMRHg1X+5bpUSQfCBNNTRuQY2ze5LbYF+m54/KXGL
 tmytL/NI7SvnxDYEN2YtHnaqsqOR5fXgemXAVwWZ8judyT/g9U2JAvVAlVtMZW08p1rb
 YyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=MdtgjKYpobEBx1vtlxyNvAdu1nuei7NEW9qX8scp1AU=;
 b=3oY6kXSZVMZ7wBM8s5dII9LIx71K+SJJ+VNhQjB/CooUL+xXRalGoPJWKYdIs3troB
 sewBYy6hmgDNQmGg/czP78YZ25OnIIhl2goSxd7Hfte2OKg1iorWEVrhGMhtAX1VV98t
 G7+7/wq3cx0/Flk1Nx58srauUohqO4eXSolDl/sF85cfWPnRdYEjTO+12VBHrGxbCbTs
 x3wELVZz8bNlYMKi7HrFfmH2l9zTHwV6PdIpKAkUvIdz/TxAx/5yz4B0CK8iVRjKx3VT
 ELVJV5T0BZrhImoz98du7Qfm8fbHHa5izIiS74wPnSnzkoyXnEthBXc8PM+W+ajQjq2t
 yomw==
X-Gm-Message-State: AOAM531iDA2gECsBj0ZNY2JSyniWwxJ6cBMzcB1jqsbho7eXhMJauH1y
 02aIyr4XcfYgz96a5/+vI5ykxkaxvMs=
X-Google-Smtp-Source: ABdhPJxj0INqQ3fAUj5MH3rK8LpkV1hB6zU0IqK5L0tik9mW19VJQyVwLgRVJTKjjc408G1LY31hbA==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr1395123wmf.91.1640159446390; 
 Tue, 21 Dec 2021 23:50:46 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id c4sm1167139wrr.37.2021.12.21.23.50.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 23:50:45 -0800 (PST)
Subject: Re: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-4-andrey.grodzovsky@amd.com>
 <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
 <72fe2521-ef31-63d8-6bcf-67af5a74330e@amd.com>
 <48f45e4d-7219-5031-44bf-d1aec3a4bb61@gmail.com>
 <dce7b2d7-ac9c-047c-365b-38added395b8@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9f32fed2-3a72-44d3-0eb9-474725fc86ab@gmail.com>
Date: Wed, 22 Dec 2021 08:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dce7b2d7-ac9c-047c-365b-38added395b8@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.12.21 um 17:03 schrieb Andrey Grodzovsky:
>
> On 2021-12-21 2:02 a.m., Christian König wrote:
>>
>>
>> Am 20.12.21 um 20:22 schrieb Andrey Grodzovsky:
>>>
>>> On 2021-12-20 2:17 a.m., Christian König wrote:
>>>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>>>> Restrict jobs resubmission to suspend case
>>>>> only since schedulers not initialised yet on
>>>>> probe.
>>>>>
>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> index 5527c68c51de..8ebd954e06c6 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>>> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct 
>>>>> amdgpu_device *adev)
>>>>>           if (!ring || !ring->fence_drv.initialized)
>>>>>               continue;
>>>>>   -        if (!ring->no_scheduler) {
>>>>> +        if (adev->in_suspend && !ring->no_scheduler) {
>>>>
>>>> Uff, why is that suddenly necessary? Because of the changed order?
>>>>
>>>> Christian.
>>>
>>>
>>> Yes.
>>
>> Mhm, that's quite bad design then.
>
>
> If you look at the original patch for this 
> https://www.spinics.net/lists/amd-gfx/msg67560.html you will
> see that that restarting scheduler here is only relevant for 
> suspend/resume case because there was
> a race to fix. There is no point in this code on driver init because 
> nothing was submitted to scheduler yet
> and so it seems to me ok to add condition that this code run only 
> in_suspend case.

Yeah, but having extra logic like this means that we have some design 
issue in the IP block handling.

We need to clean that and some other odd approaches up at some point, 
but probably not now.

Christian.

>
>
>>
>> How about we keep the order as is and allow specifying the reset work 
>> queue with drm_sched_start() ?
>
>
> As i mentioned above, the fact we even have drm_sched_start there is 
> just part of a solution to resolve a race
> during suspend/resume. It is not for device initialization and indeed, 
> other client drivers of gpu shcheduler never call
> drm_sched_start on device init. We must guarantee that reset work 
> queue already initialized before any job submission to scheduler
> and because of that IMHO the right place for this is drm_sched_init.
>
> Andrey
>
>
>>
>> Christian.
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>> drm_sched_resubmit_jobs(&ring->sched);
>>>>>               drm_sched_start(&ring->sched, true);
>>>>>           }
>>>>
>>

