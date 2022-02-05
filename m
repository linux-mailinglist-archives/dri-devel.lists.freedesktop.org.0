Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D74AA57A
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 02:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83AB10E3EB;
	Sat,  5 Feb 2022 01:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EB210E3EB;
 Sat,  5 Feb 2022 01:55:47 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 v13-20020a17090ac90d00b001b87bc106bdso727918pjt.4; 
 Fri, 04 Feb 2022 17:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=hGTVW+01e4GIAkWOjoFjzjXZ+1intL+wDAwZzXY0atY=;
 b=MKyUMfHjlP5/X/3UuWqXNYJLGgIfTcrMciakaNzzdl5lJSqfrUaaYEygfM0LRmxhOs
 fw6VQzFRdQQS9LGthD5la6HPu7wjOr4eBuXNeuQpQiSy7Zi0S3mhtvRyxIuOgvEBueGQ
 Cyjl//36hjg0rLX6YXFubWfp0VLeNtiZQ26SqNw7w6wDFYbS/sOQrz4rLh5iSiAIq87l
 ntU2ZymE3/eEO7ZdR6Gn5814oVCx0HsotkhlahfaX6mPky2zND6sXRtO6M3meyMvQ2q4
 dZxORk6lg4X98K8vzE0i6JFArp4i+tI82K/464s+Z74VIpUSuEOF8rplAqWyeuYcG7h8
 U5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hGTVW+01e4GIAkWOjoFjzjXZ+1intL+wDAwZzXY0atY=;
 b=GRvM1C5bgdnFbpPX0hQyx9B/saVevP0fltjmOk9cT9nCSyyqPJUVOiFLVkUALitf3Y
 P7OhHs/yFrdSgVAT6KZeAxcehofLk1CrEYvGhXhz6FIsIsmTfQ1EipVKbLY3kyhA+oxG
 3HIhcGTTeG5VFSYngjoX3oStw+PaPPCsr087/PsMb7pnlD9QyAeecreV2p97ZfGVQ5TJ
 xTKSFXuT0qiNnEAU8I9TXde8WmdFifc9wRQOu3XaJagJgtyVde6jSm6Le2S8IR2x/aGY
 zJU9P2B4wZXy16cKPSAqW1Dees3+VabmRGTlaMOXOq9byoydIU1oH98NlnNCD/wNqqSL
 es2g==
X-Gm-Message-State: AOAM5325kWb6jWcudYBmwz287+4vO/3BRiyWTPItW4cbZ1gMFsnb8W4Z
 Fg9hF04ZN+K5QX2BDhTqdfk=
X-Google-Smtp-Source: ABdhPJzkj9ah/MKJt0tBrGU4CnDflWStMfgavXmyxNOSvps0iRQxrimCRm86/5KuVkfVZjtIIJTnPw==
X-Received: by 2002:a17:902:e803:: with SMTP id
 u3mr5800746plg.41.1644026147342; 
 Fri, 04 Feb 2022 17:55:47 -0800 (PST)
Received: from [10.200.0.18] ([85.203.23.14])
 by smtp.gmail.com with ESMTPSA id y41sm3913585pfa.213.2022.02.04.17.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 17:55:46 -0800 (PST)
Message-ID: <8fa82beb-468c-afb0-3eed-4240200395a3@gmail.com>
Date: Sat, 5 Feb 2022 09:55:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [BUG] gpu: drm: radeon: two possible deadlocks involving locking
 and waiting
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <d5e4460f-7e26-81d2-2efe-6f47760b78d2@gmail.com>
 <7cdc2d3f-df52-f7a9-15bf-fe4bc01d3c4f@amd.com>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
In-Reply-To: <7cdc2d3f-df52-f7a9-15bf-fe4bc01d3c4f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

Thanks for the reply :)

On 2022/2/1 15:56, Christian König wrote:
> Hi Jia-Ju,
>
> interesting that you have found those issues with an automated tool.
>
> And yes that is a well design flaw within the radeon driver which can 
> happen on hardware faults, e.g. when radeon_ring_backup() needs to be 
> called.

In fact, my tool finds dozens of similar possible deadlocks caused by 
wait_event_timeout() in radeon_fence_wait_seq_timeout().
There are three other examples in Linux 5.16:

#BUG 1
radeon_dpm_change_power_state_locked()
   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
   radeon_fence_wait_empty()
     radeon_fence_wait_seq_timeout()
       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)

radeon_fence_driver_fini()
   mutex_lock(&rdev->ring_lock); --> Line 917 (Lock A)
   wake_up_all(&rdev->fence_queue); --> Line 927 (Wake X)

#BUG 2
radeon_set_pm_profile()
   mutex_lock(&rdev->pm.mutex); --> Line 382 (Lock A)
   radeon_pm_set_clocks()
     radeon_fence_wait_empty()
       radeon_fence_wait_seq_timeout()
         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)

radeon_dynpm_idle_work_handler()
   mutex_lock(&rdev->pm.mutex); --> Line 1861 (Lock A)
   radeon_fence_count_emitted()
     radeon_fence_process()
       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)

#BUG 3
radeon_pm_fini_old()
   mutex_lock(&rdev->pm.mutex); --> Line 1642 (Lock A)
   radeon_pm_set_clocks()
     radeon_fence_wait_empty()
       radeon_fence_wait_seq_timeout()
         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)

radeon_dynpm_idle_work_handler()
   mutex_lock(&rdev->pm.mutex); --> Line 1861 (Lock A)
   radeon_fence_count_emitted()
     radeon_fence_process()
       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)

Thus, to fix these possible deadlocks, we could moditify the code 
related to radeon_fence_wait_seq_timeout().
But I am not quite familar with the radeon driver, so I am not sure how 
to moditify the code properly.

>
> But that happens so rarely and the driver is not developed further 
> that we decided to not address this any more.

Ah, okay.

>
> Regards,
> Christian.
>
> Am 01.02.22 um 08:40 schrieb Jia-Ju Bai:
>> Hello,
>>
>> My static analysis tool reports a possible deadlock in the radeon 
>> driver in Linux 5.16:
>>
>> #BUG 1
>> radeon_dpm_change_power_state_locked()
>>   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
>>   radeon_fence_wait_empty()
>>     radeon_fence_wait_seq_timeout()
>>       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>>
>> radeon_ring_backup()
>>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>>   radeon_fence_count_emitted()
>>     radeon_fence_process()
>>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>>
>> When radeon_dpm_change_power_state_locked() is executed, "Wait X" is 
>> performed by holding "Lock A". If radeon_ring_backup() is executed at 
>> this time, "Wake X" cannot be performed to wake up "Wait X" in 
>> radeon_dpm_change_power_state_locked(), because "Lock A" has been 
>> already hold by radeon_dpm_change_power_state_locked(), causing a 
>> possible deadlock.
>> I find that "Wait X" is performed with a timeout 
>> MAX_SCHEDULE_TIMEOUT, to relieve the possible deadlock; but I think 
>> this timeout can cause inefficient execution.
>>
>> #BUG 2
>> radeon_ring_lock()
>>   mutex_lock(&rdev->ring_lock); --> Line 147 (Lock A)
>>   radeon_ring_alloc()
>>     radeon_fence_wait_next()
>>       radeon_fence_wait_seq_timeout()
>>         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>>
>> radeon_ring_backup()
>>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>>   radeon_fence_count_emitted()
>>     radeon_fence_process()
>>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>>
>> When radeon_ring_lock() is executed, "Wait X" is performed by holding 
>> "Lock A". If radeon_ring_backup() is executed at this time, "Wake X" 
>> cannot be performed to wake up "Wait X" in radeon_ring_lock(), 
>> because "Lock A" has been already hold by radeon_ring_lock(), causing 
>> a possible deadlock.
>> I find that "Wait X" is performed with a timeout 
>> MAX_SCHEDULE_TIMEOUT, to relieve the possible deadlock; but I think 
>> this timeout can cause inefficient execution.
>>
>> I am not quite sure whether these possible problems are real and how 
>> to fix them if they are real.
>> Any feedback would be appreciated, thanks :)
>>
>>
>> Best wishes,
>> Jia-Ju Bai
>>
>

