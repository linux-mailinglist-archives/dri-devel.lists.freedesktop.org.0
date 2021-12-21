Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 306D047BA68
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 08:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D244D10E279;
	Tue, 21 Dec 2021 07:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48DE10E1D1;
 Tue, 21 Dec 2021 07:02:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id c4so24869188wrd.9;
 Mon, 20 Dec 2021 23:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=U1m0sUp950UqsTS9LU6z6skgZZs0HZBH9PX5jS5xrWY=;
 b=YFvl1EltQOM8GTk9htqQgoGIz/6M0U7GJVC/aVx9gem6fe4aZ20BPhnjd4468y/M+Y
 VKanab0Lh513SbXLLnSH0Ung5MUn6YMfxJdTwKUYwIIY7uchE3YdQF6ecCmyHVkTIIOq
 9gTZN4O+NfZRN0cFi9KyPtE/dejZmRD/el8MUaTwlBirAX1VXwngFx7yZuHJY3jXMI9V
 FeBDFm1SsaehWMPen3vAF8hMFfWGPPakW9VKsw5AWcsJkL39QYjddJ45sEG8K3NgFa1P
 j1otEhsn+0V1RtJb2fY9Ij6pQAj5hMcchIeN6ShBaWo2XmP/95FbsbL/Vk8B1tvB8Uf6
 fz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=U1m0sUp950UqsTS9LU6z6skgZZs0HZBH9PX5jS5xrWY=;
 b=k+Gs0WDTEJl0QbR5YNhrf/7ez0BJFjk9+rFWzyCVOl05duZaq+YkjYuH5oiuzo+b5c
 yKiPVTxxe+47eiswErNUioT3a48A+1D27glbY7RRUt/O/YgDzDo6pKpJdRMTHxj/WwPr
 X2QE+u1q5y0qzreeSyBXnMdtUs4U0KkCpsvDhN7FBRNWRrwL1PYm7OnBLkKNxo/3lS6O
 V60nuC7F4LDt+9rJztmRJ6CrCtIRgknMKtdIXi5DpfQrI+xlimqxJg/PwBugvnSbknbd
 9fNptteBvtrt950vNsDpRqs5mjRKu/sksnfQKXd49eniF+6pkwGtds2EQ0sXjy4+YeV3
 V4bA==
X-Gm-Message-State: AOAM531LIv+MBALBMnQE4ZzIx164PzHrnWTgltS5HOvC8Qgyl6L3bOOp
 WlQ0I4NNPPavfT19ySf8VEc=
X-Google-Smtp-Source: ABdhPJxI5JUTEaSwS9ubuuf5pYRWJG2doIGHirvWcvn8SyjID2Gj8OU4vtwpe4mlC1XewT4/+POEwA==
X-Received: by 2002:a5d:6e85:: with SMTP id k5mr1442315wrz.545.1640070178429; 
 Mon, 20 Dec 2021 23:02:58 -0800 (PST)
Received: from [192.168.178.21] (p57b0bff8.dip0.t-ipconnect.de.
 [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a2sm2978946wri.17.2021.12.20.23.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 23:02:57 -0800 (PST)
Subject: Re: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-4-andrey.grodzovsky@amd.com>
 <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
 <72fe2521-ef31-63d8-6bcf-67af5a74330e@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <48f45e4d-7219-5031-44bf-d1aec3a4bb61@gmail.com>
Date: Tue, 21 Dec 2021 08:02:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <72fe2521-ef31-63d8-6bcf-67af5a74330e@amd.com>
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



Am 20.12.21 um 20:22 schrieb Andrey Grodzovsky:
>
> On 2021-12-20 2:17 a.m., Christian König wrote:
>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>> Restrict jobs resubmission to suspend case
>>> only since schedulers not initialised yet on
>>> probe.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> index 5527c68c51de..8ebd954e06c6 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct 
>>> amdgpu_device *adev)
>>>           if (!ring || !ring->fence_drv.initialized)
>>>               continue;
>>>   -        if (!ring->no_scheduler) {
>>> +        if (adev->in_suspend && !ring->no_scheduler) {
>>
>> Uff, why is that suddenly necessary? Because of the changed order?
>>
>> Christian.
>
>
> Yes.

Mhm, that's quite bad design then.

How about we keep the order as is and allow specifying the reset work 
queue with drm_sched_start() ?

Christian.

>
> Andrey
>
>
>>
>>> drm_sched_resubmit_jobs(&ring->sched);
>>>               drm_sched_start(&ring->sched, true);
>>>           }
>>

