Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5868606C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 08:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFFC10E16B;
	Wed,  1 Feb 2023 07:18:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6FFD10E16B;
 Wed,  1 Feb 2023 07:18:08 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u21so16683497edv.3;
 Tue, 31 Jan 2023 23:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k57QBME2zsRw8TiZGEO9VF0jYvqKp8cblT2s2TqM3b4=;
 b=TbxXPW/6R33cESsfl/lR1YVDyVZVTP/snexRdY1WZ2F6+xNy2TIE1p8Ghi+EzLjcJF
 V7RS/KuBedF3Z3ekYhoz5KtL2p/HW4dnY7n6xBdPDP8ODp5xMEupAwiW6XnWHQtVaZdV
 7QMJ6//x2kGVcJz21gqtwC4nGdbsNI2YhfXXX6HLLQPZoKUg5TFAmjPBjvZEa1d9NSZJ
 5KBKV4f2Wpgeg4LzkYeC1VGYl+5Ft34mmRWjvy3NnRqcifZjHMiieRWXkGuFBEx5hhM6
 NskuOqCGZJ8G+fx3DR0rENoWyrf+IUyZPqX+N9FeNlKlE/JYRzs2bcAY8AANuqiNSYgh
 sEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k57QBME2zsRw8TiZGEO9VF0jYvqKp8cblT2s2TqM3b4=;
 b=iGD5Jk+RvQs41I10LDHmAoiMsuVAhZYh0m2lO+wGX3s7gg/5EFwJUJjdihtaOiUWA7
 aV5atoHCkKCcinCUjF9S9uZA6ueL+V+93rq5/w6A4j8yhHjVWR1JpLXwHUnZ6NatxnIR
 a8ZNsJlr/kr15LzNzNWXha2d183InbabMbxCF/pHSq8RC8qbZeKrjoLNTAdXA2TrUCMn
 AuUHJQMY9jo86q0wWzfRVRFJplCs+0F+HMcMtFDSL6GgjuSqIzLOw9oPGUUpKXUDsFvE
 sUZsEGzqW4nIgaY4gNnBsU7Hl5xQ7U5n4L2SjQmXR5PRGMcTclG6Ryvjso2rwsQDXBlc
 5gig==
X-Gm-Message-State: AO0yUKWq9YxV0uMvcX6Df8624Z/v7YvJ4+qxPB1/eYUCJwyc06MEqkxk
 l248zC1p2P8FNcdw9FPDwI4=
X-Google-Smtp-Source: AK7set8quFRwf2a6BMZiss6lnPvamscnmAY4EsyFeME7oj/yVQoK88i5+11+oanaDKao5QoR+zMwbA==
X-Received: by 2002:a50:d593:0:b0:4a2:51db:c7d2 with SMTP id
 v19-20020a50d593000000b004a251dbc7d2mr921226edi.15.1675235887089; 
 Tue, 31 Jan 2023 23:18:07 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:6ad1:ca73:7539:3ce6?
 ([2a02:908:1256:79a0:6ad1:ca73:7539:3ce6])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a50fa8b000000b0049e09105705sm9268667edr.62.2023.01.31.23.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:18:06 -0800 (PST)
Message-ID: <52dbfde8-8865-6b30-c32f-33cff2c87fcc@gmail.com>
Date: Wed, 1 Feb 2023 08:18:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched
 init/fini
Content-Language: en-US
To: "Chen, Guchun" <Guchun.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
References: <20230130214504.1305042-1-gpiccoli@igalia.com>
 <ac604d40-ef87-7147-b1ee-3620e68b3268@igalia.com>
 <CADnq5_NEyGNXpo3mZ=WR5Me8b9r24aq0MmMZ6GsvBRoBmNVGGQ@mail.gmail.com>
 <DM5PR12MB24693E815CAB63FE2DE06E4CF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <DM5PR12MB24696F955FF95A7AB00E1956F1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
 <984ee981-2906-0eaf-ccec-9f80975cb136@amd.com>
 <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <DM5PR12MB246930987580ACA15EA44C2BF1D09@DM5PR12MB2469.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "kernel@gpiccoli.net" <kernel@gpiccoli.net>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guchun,

no, that doesn't make any sense at all.

The ready flag indicates that the scheduler is fully prepared for hw 
submissions from userspace and is unrelated to the initialization 
status. It's set to true after IB testing was successful and only set to 
false only when a GPU reset fails and we can't get the hardware to work 
any more.

Please use sched.ops instead as I suggested before.

Regards,
Christian.

Am 31.01.23 um 14:58 schrieb Chen, Guchun:
> Hi Christian,
>
> Do you think if it makes sense that we can set 'ring->sched.ready' to be true in each ring init, even if before executing/setting up drm_sched_init in amdgpu_device_init_schedulers? As 'ready' is a member of gpu scheduler structure.
>
> Regards,
> Guchun
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, January 31, 2023 6:59 PM
> To: Chen, Guchun <Guchun.Chen@amd.com>; Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli <gpiccoli@igalia.com>
> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander <Alexander.Deucher@amd.com>
> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
>
> Am 31.01.23 um 10:17 schrieb Chen, Guchun:
>> Hi Piccoli,
>>
>> Please ignore my request of full dmesg log. I can reproduce the issue and get the same failure callstack by returning early with an error code prior to amdgpu_device_init_schedulers.
>>
>> Regards,
>> Guchun
>>
>> -----Original Message-----
>> From: Chen, Guchun
>> Sent: Tuesday, January 31, 2023 2:37 PM
>> To: Alex Deucher <alexdeucher@gmail.com>; Guilherme G. Piccoli
>> <gpiccoli@igalia.com>
>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Pan, Xinhui
>> <Xinhui.Pan@amd.com>; dri-devel@lists.freedesktop.org; Tuikov, Luben
>> <Luben.Tuikov@amd.com>; Limonciello, Mario
>> <Mario.Limonciello@amd.com>; kernel-dev@igalia.com; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Subject: RE: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>> drm_sched init/fini
>>
>> Hi Piccoli,
>>
>> I agree with Alex's point, using ring->sched.name for such check is not a good way. BTW, can you please attach a full dmesg long in bad case to help me understand more?
>>
>> Regards,
>> Guchun
>>
>> -----Original Message-----
>> From: Alex Deucher <alexdeucher@gmail.com>
>> Sent: Tuesday, January 31, 2023 6:30 AM
>> To: Guilherme G. Piccoli <gpiccoli@igalia.com>
>> Cc: amd-gfx@lists.freedesktop.org; kernel@gpiccoli.net; Chen, Guchun
>> <Guchun.Chen@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> dri-devel@lists.freedesktop.org; Tuikov, Luben <Luben.Tuikov@amd.com>;
>> Limonciello, Mario <Mario.Limonciello@amd.com>; kernel-dev@igalia.com;
>> Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
>> <Christian.Koenig@amd.com>
>> Subject: Re: [PATCH] drm/amdgpu/fence: Fix oops due to non-matching
>> drm_sched init/fini
>>
>> On Mon, Jan 30, 2023 at 4:51 PM Guilherme G. Piccoli <gpiccoli@igalia.com> wrote:
>>> + Luben
>>>
>>> (sorry, missed that in the first submission).
>>>
>>> On 30/01/2023 18:45, Guilherme G. Piccoli wrote:
>>>> Currently amdgpu calls drm_sched_fini() from the fence driver sw
>>>> fini routine - such function is expected to be called only after the
>>>> respective init function - drm_sched_init() - was executed successfully.
>>>>
>>>> Happens that we faced a driver probe failure in the Steam Deck
>>>> recently, and the function drm_sched_fini() was called even without
>>>> its counter-part had been previously called, causing the following oops:
>>>>
>>>> amdgpu: probe of 0000:04:00.0 failed with error -110
>>>> BUG: kernel NULL pointer dereference, address: 0000000000000090 PGD
>>>> 0 P4D 0
>>>> Oops: 0002 [#1] PREEMPT SMP NOPTI
>>>> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli
>>>> #338 Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
>>>> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched] [...] Call Trace:
>>>>    <TASK>
>>>>    amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>>>>    amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>>>>    amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>>>>    devm_drm_dev_init_release+0x49/0x70
>>>>    [...]
>>>>
>>>> To prevent that, check if the drm_sched was properly initialized for
>>>> a given ring before calling its fini counter-part.
>>>>
>>>> Notice ideally we'd use sched.ready for that; such field is set as
>>>> the latest thing on drm_sched_init(). But amdgpu seems to "override"
>>>> the meaning of such field - in the above oops for example, it was a
>>>> GFX ring causing the crash, and the sched.ready field was set to
>>>> true in the ring init routine, regardless of the state of the DRM scheduler. Hence, we ended-up using another sched field.
>>>>>> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence
>>>>>> driver fini in s3 test (v2)")
>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> Cc: Guchun Chen <guchun.chen@amd.com>
>>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>>>> ---
>>>>
>>>>
>>>> Hi folks, first of all thanks in advance for reviews / comments!
>>>> Notice that I've used the Fixes tag more in the sense to bring it to
>>>> stable, I didn't find a good patch candidate that added the call to
>>>> drm_sched_fini(), was reaching way too old commits...so
>>>> 067f44c8b459 seems a good candidate - or maybe not?
>>>>
>>>> Now, with regards sched.ready, spent a bit of time to figure what
>>>> was happening...would be feasible maybe to stop using that to mark
>>>> some kind ring status? I think it should be possible to add a flag
>>>> to the ring structure for that, and free sched.ready from being
>>>> manipulate by the amdgpu driver, what's your thoughts on that?
>> It's been a while, but IIRC, we used to have a ring->ready field in the driver which at some point got migrated out of the driver into the GPU scheduler and the driver side code never got cleaned up.  I think we should probably just drop the driver messing with that field and leave it up to the drm scheduler.
> To use ring->ready is not a good idea since this doesn't specify if the scheduler was initialized, but rather if bringup of the engine worked.
>
> It's perfectly possible that the scheduler was initialized, but then the IB test failed later on.
>
> I strongly suggest to use scheduler->ops instead since those are set during init and mandatory for correct operation.
>
> Christian.
>
>> Alex
>>
>>
>>>> I could try myself, but first of course I'd like to raise the
>>>> "temperature" on this topic and check if somebody is already working
>>>> on that.
>>>>
>>>> Cheers,
>>>>
>>>> Guilherme
>>>>
>>>>
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index 00444203220d..e154eb8241fb 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>>>>                 if (!ring || !ring->fence_drv.initialized)
>>>>                         continue;
>>>>
>>>> -             if (!ring->no_scheduler)
>>>> +             /*
>>>> +              * Notice we check for sched.name since there's some
>>>> +              * override on the meaning of sched.ready by amdgpu.
>>>> +              * The natural check would be sched.ready, which is
>>>> +              * set as drm_sched_init() finishes...
>>>> +              */
>>>> +             if (!ring->no_scheduler && ring->sched.name)
>>>>                         drm_sched_fini(&ring->sched);
>>>>
>>>>                 for (j = 0; j <= ring->fence_drv.num_fences_mask;
>>>> ++j)

