Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF84AB0DD
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 18:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E935310E1F2;
	Sun,  6 Feb 2022 17:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CCE10E1CB;
 Sun,  6 Feb 2022 17:11:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m5so3643033wrb.2;
 Sun, 06 Feb 2022 09:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lHsscKQ4ZGzwxNKhQRFBOzvu8bkRXQ4hQkkCeKPYhNU=;
 b=WWt6ftPnLbSvbuk/yUKYIjptnlHotdoRYIcmgWAfiH9GpgH1yLZX5UnnJt7SCHbgeT
 cKH4y56KMCKgy6c7OE5FcpPBSIb6eU457AMqbmwhxEqf5w1rLR6X2oFkJSgoD141hfN+
 bO0bYViuOZHEojF3cZeaGKmkRnYp6GMk9Prwe+cTVy8GX2hy/R1cIr2NzPSh0+C5qH9E
 r9wBbSAOuLAcu9Ki/nGHGx6MzNmBmVltDAkTEGWMIEt+sS1Gys/wyZXrcjL4Z1mYypNd
 PBeVYbz975IlKRZRUOhheI0G9hkz0d+OuiaUPnU/cLbho+Gu9g5RgOxM1VMw9h7WR08i
 W34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lHsscKQ4ZGzwxNKhQRFBOzvu8bkRXQ4hQkkCeKPYhNU=;
 b=mufwQs5PXlLMzom5lrZGtPM8q5aYIGYxU0dJI1Upb8QArMAk3PITLTf/eqUlxCJgEF
 2QZV1DxHQ+t9L8EOaTkxapkfv114hOzMiDbpijyusVuKEXVMRCBI0ymvy6Cn+iiVqY7F
 W98XcMLr/G8+qWJKuMn6ndnP1Njg362Fub6B/SjhxTL8wgfHShzqZp0g9+9/irnQabW8
 H1+eeXpHqrHuwGMWH6oZ0DUuBtJZnTykbNNiZmMOP5JK9Ez8DwKufAsJ9epquAaenmlc
 6dRnWdP3N3tU8tjV3wOJ6/tGNUel1jnPxRh1Rz4PvjAZeclLZsNaR5KUtTwwiMDTBCoS
 3vkg==
X-Gm-Message-State: AOAM530GLbUJJtZCi+EsIp2v/Kn1jH3nSqrUfVwVH/rcenhyC294+CQ3
 35zxIVratpTCvaq6e4wRK6Y=
X-Google-Smtp-Source: ABdhPJxsAKssEf1jQGqzBBmAtJH/aSIg27SrOjlgCI8x1BpyAnqmsI28JVcJC5glavbfidCyWeoshw==
X-Received: by 2002:a05:6000:1a8f:: with SMTP id
 f15mr6829638wry.349.1644167486876; 
 Sun, 06 Feb 2022 09:11:26 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:17ed:d94c:ce91:f379?
 ([2a02:908:1252:fb60:17ed:d94c:ce91:f379])
 by smtp.gmail.com with ESMTPSA id v5sm8716825wrx.114.2022.02.06.09.11.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 09:11:26 -0800 (PST)
Message-ID: <a3016b01-1456-d571-a44d-6ed6cd6a66a0@gmail.com>
Date: Sun, 6 Feb 2022 18:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [BUG] gpu: drm: radeon: two possible deadlocks involving locking
 and waiting
Content-Language: en-US
To: Jia-Ju Bai <baijiaju1990@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <d5e4460f-7e26-81d2-2efe-6f47760b78d2@gmail.com>
 <7cdc2d3f-df52-f7a9-15bf-fe4bc01d3c4f@amd.com>
 <8fa82beb-468c-afb0-3eed-4240200395a3@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <8fa82beb-468c-afb0-3eed-4240200395a3@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 05.02.22 um 02:55 schrieb Jia-Ju Bai:
> Hi Christian,
>
> Thanks for the reply :)
>
> On 2022/2/1 15:56, Christian König wrote:
>> Hi Jia-Ju,
>>
>> interesting that you have found those issues with an automated tool.
>>
>> And yes that is a well design flaw within the radeon driver which can 
>> happen on hardware faults, e.g. when radeon_ring_backup() needs to be 
>> called.
>
> In fact, my tool finds dozens of similar possible deadlocks caused by 
> wait_event_timeout() in radeon_fence_wait_seq_timeout().

Those are false positives.

The call to radeon_fence_process() from radeon_fence_count_emitted() for 
example is just to speed things up, it's not mandatory for correct 
operation and so it doesn't matter if it isn't called because of the 
thread is blocked on the pm.mutex.

But I also don't see how your tool should be able to figure that out 
automated.

Regards,
Christian.

> There are three other examples in Linux 5.16:
>
> #BUG 1
> radeon_dpm_change_power_state_locked()
>   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
>   radeon_fence_wait_empty()
>     radeon_fence_wait_seq_timeout()
>       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>
> radeon_fence_driver_fini()
>   mutex_lock(&rdev->ring_lock); --> Line 917 (Lock A)
>   wake_up_all(&rdev->fence_queue); --> Line 927 (Wake X)
>
> #BUG 2
> radeon_set_pm_profile()
>   mutex_lock(&rdev->pm.mutex); --> Line 382 (Lock A)
>   radeon_pm_set_clocks()
>     radeon_fence_wait_empty()
>       radeon_fence_wait_seq_timeout()
>         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>
> radeon_dynpm_idle_work_handler()
>   mutex_lock(&rdev->pm.mutex); --> Line 1861 (Lock A)
>   radeon_fence_count_emitted()
>     radeon_fence_process()
>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>
> #BUG 3
> radeon_pm_fini_old()
>   mutex_lock(&rdev->pm.mutex); --> Line 1642 (Lock A)
>   radeon_pm_set_clocks()
>     radeon_fence_wait_empty()
>       radeon_fence_wait_seq_timeout()
>         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>
> radeon_dynpm_idle_work_handler()
>   mutex_lock(&rdev->pm.mutex); --> Line 1861 (Lock A)
>   radeon_fence_count_emitted()
>     radeon_fence_process()
>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>
> Thus, to fix these possible deadlocks, we could moditify the code 
> related to radeon_fence_wait_seq_timeout().
> But I am not quite familar with the radeon driver, so I am not sure 
> how to moditify the code properly.
>
>>
>> But that happens so rarely and the driver is not developed further 
>> that we decided to not address this any more.
>
> Ah, okay.
>
>>
>> Regards,
>> Christian.
>>
>> Am 01.02.22 um 08:40 schrieb Jia-Ju Bai:
>>> Hello,
>>>
>>> My static analysis tool reports a possible deadlock in the radeon 
>>> driver in Linux 5.16:
>>>
>>> #BUG 1
>>> radeon_dpm_change_power_state_locked()
>>>   mutex_lock(&rdev->ring_lock); --> Line 1133 (Lock A)
>>>   radeon_fence_wait_empty()
>>>     radeon_fence_wait_seq_timeout()
>>>       wait_event_timeout(rdev->fence_queue, ...) --> Line 504 (Wait X)
>>>
>>> radeon_ring_backup()
>>>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>>>   radeon_fence_count_emitted()
>>>     radeon_fence_process()
>>>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>>>
>>> When radeon_dpm_change_power_state_locked() is executed, "Wait X" is 
>>> performed by holding "Lock A". If radeon_ring_backup() is executed 
>>> at this time, "Wake X" cannot be performed to wake up "Wait X" in 
>>> radeon_dpm_change_power_state_locked(), because "Lock A" has been 
>>> already hold by radeon_dpm_change_power_state_locked(), causing a 
>>> possible deadlock.
>>> I find that "Wait X" is performed with a timeout 
>>> MAX_SCHEDULE_TIMEOUT, to relieve the possible deadlock; but I think 
>>> this timeout can cause inefficient execution.
>>>
>>> #BUG 2
>>> radeon_ring_lock()
>>>   mutex_lock(&rdev->ring_lock); --> Line 147 (Lock A)
>>>   radeon_ring_alloc()
>>>     radeon_fence_wait_next()
>>>       radeon_fence_wait_seq_timeout()
>>>         wait_event_timeout(rdev->fence_queue, ...) --> Line 504 
>>> (Wait X)
>>>
>>> radeon_ring_backup()
>>>   mutex_lock(&rdev->ring_lock); --> Line 289(Lock A)
>>>   radeon_fence_count_emitted()
>>>     radeon_fence_process()
>>>       wake_up_all(&rdev->fence_queue); --> Line 323 (Wake X)
>>>
>>> When radeon_ring_lock() is executed, "Wait X" is performed by 
>>> holding "Lock A". If radeon_ring_backup() is executed at this time, 
>>> "Wake X" cannot be performed to wake up "Wait X" in 
>>> radeon_ring_lock(), because "Lock A" has been already hold by 
>>> radeon_ring_lock(), causing a possible deadlock.
>>> I find that "Wait X" is performed with a timeout 
>>> MAX_SCHEDULE_TIMEOUT, to relieve the possible deadlock; but I think 
>>> this timeout can cause inefficient execution.
>>>
>>> I am not quite sure whether these possible problems are real and how 
>>> to fix them if they are real.
>>> Any feedback would be appreciated, thanks :)
>>>
>>>
>>> Best wishes,
>>> Jia-Ju Bai
>>>
>>
>

