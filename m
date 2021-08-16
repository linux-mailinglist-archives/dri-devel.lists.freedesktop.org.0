Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 015563ED3A9
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 14:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC20489DFA;
	Mon, 16 Aug 2021 12:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213AD89DFA;
 Mon, 16 Aug 2021 12:06:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id f5so23189130wrm.13;
 Mon, 16 Aug 2021 05:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ym3y3mEzn1NGgfgKV/8lbqYu+w83+cCov5wvhZCSGAQ=;
 b=fw7aKyOmYxRlq/SiU/4S7R7PxLo0HIJ6x+hww7uCrPkMPDu+zQvqAa4CBVKUQ9zcrt
 TQT2RNfqcjNqR/hkW1udVIlnkeuA9CCaaF5z5+2Pv79EOuJfKwIJetGodyNDgzWxqA7S
 KQzYNzlEnltrBbmbl51k+b0suYyIt7KHcCC6BlBagWWhs0EopA6RmYOLVmhARfNRyHdX
 +Nb6hlAK86LdYWjUQqmad2fR1/as04gpl1HpKLbOgVACeZyLqoeaiLO+8kipEe9fZlsN
 65Ybm2NJFN6Q8qeKCNvbv7o1RhKBL69fqqREy/s+kSFG4K4idwkoKQv/23S6qXMJV8LJ
 UdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Ym3y3mEzn1NGgfgKV/8lbqYu+w83+cCov5wvhZCSGAQ=;
 b=Ify0OUylyUyHRejcIRAOxVhaB9jBB80Bvpf3XIwH+LPIbEYzaguX7raplbKSakrq5u
 eNNys8GnpOzdktxGQraoKekCb7I4EImipwdA2QOIGt2AgRvDIWTzgFqbXh5fElnwPWWb
 6WDTOozfN9Kj/aleKMix86+XUlWbAQ7e6eOyS+2H3wUg4WCD8M23AlFTsyWA0mdWvWZ7
 ++LkV+JC4oh8Tj0d+ussOzAFtvqGzoi94kGZm87oouM7gCBNVCqpw0+xivL0+iGKHlfj
 OzuKZ2UcRW0xBAXw4tn7thjsKSs2M6NJLhRLIQxIeJQW76cI7fAX+9FcbGGKthZyn1U/
 lB+Q==
X-Gm-Message-State: AOAM530jJQbpTr293FweOjVT1rjiI6iKGK2vQA5Tb0mEel46I/uqSFOH
 wjR3rHVCdrXgOh/h+q3YXm6OBUth1is=
X-Google-Smtp-Source: ABdhPJwPUMCEpN/ChgCR8Nu/eImopdQJVGPg3zof8j5MpxFfI8VIp0hwzdK1kywC+JJqxapF4/NIhg==
X-Received: by 2002:a5d:6e12:: with SMTP id h18mr18198463wrz.236.1629115574615; 
 Mon, 16 Aug 2021 05:06:14 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:f9:c3d:bbad:9698?
 ([2a02:908:1252:fb60:f9:c3d:bbad:9698])
 by smtp.gmail.com with ESMTPSA id m6sm3822069wms.42.2021.08.16.05.06.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 05:06:14 -0700 (PDT)
Subject: Re: [PATCH v3] drm/amdgpu: Cancel delayed work when GFXOFF is disabled
To: "Lazar, Lijo" <lijo.lazar@amd.com>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Leo Liu <leo.liu@amd.com>, James Zhu <James.Zhu@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210813102920.3458-1-michel@daenzer.net>
 <20210816103506.2671-1-michel@daenzer.net>
 <cc08735b-df2f-e8a6-a1b0-22e1dba02757@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ec4d551f-f1ca-3ccf-9b36-6522d529d128@gmail.com>
Date: Mon, 16 Aug 2021 14:06:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cc08735b-df2f-e8a6-a1b0-22e1dba02757@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 16.08.21 um 13:33 schrieb Lazar, Lijo:
> On 8/16/2021 4:05 PM, Michel Dänzer wrote:
>> From: Michel Dänzer <mdaenzer@redhat.com>
>>
>> schedule_delayed_work does not push back the work if it was already
>> scheduled before, so amdgpu_device_delay_enable_gfx_off ran ~100 ms
>> after the first time GFXOFF was disabled and re-enabled, even if GFXOFF
>> was disabled and re-enabled again during those 100 ms.
>>
>> This resulted in frame drops / stutter with the upcoming mutter 41
>> release on Navi 14, due to constantly enabling GFXOFF in the HW and
>> disabling it again (for getting the GPU clock counter).
>>
>> To fix this, call cancel_delayed_work_sync when the disable count
>> transitions from 0 to 1, and only schedule the delayed work on the
>> reverse transition, not if the disable count was already 0. This makes
>> sure the delayed work doesn't run at unexpected times, and allows it to
>> be lock-free.
>>
>> v2:
>> * Use cancel_delayed_work_sync & mutex_trylock instead of
>>    mod_delayed_work.
>> v3:
>> * Make amdgpu_device_delay_enable_gfx_off lock-free (Christian König)
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 11 +++++------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c    | 22 +++++++++++++++++-----
>>   2 files changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index f3fd5ec710b6..f944ed858f3e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2777,12 +2777,11 @@ static void 
>> amdgpu_device_delay_enable_gfx_off(struct work_struct *work)
>>       struct amdgpu_device *adev =
>>           container_of(work, struct amdgpu_device, 
>> gfx.gfx_off_delay_work.work);
>>   -    mutex_lock(&adev->gfx.gfx_off_mutex);
>> -    if (!adev->gfx.gfx_off_state && !adev->gfx.gfx_off_req_count) {
>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>> AMD_IP_BLOCK_TYPE_GFX, true))
>> -            adev->gfx.gfx_off_state = true;
>> -    }
>> -    mutex_unlock(&adev->gfx.gfx_off_mutex);
>> +    WARN_ON_ONCE(adev->gfx.gfx_off_state);
>
> Don't see any case for this. It's not expected to be scheduled in this 
> case, right?
>
>> + WARN_ON_ONCE(adev->gfx.gfx_off_req_count);
>> +
>
> Thinking about ON_ONCE here - this may happen more than once if it's 
> completed as part of cancel_ call. Is the warning needed?

WARN_ON_ONCE() is usually used to prevent spamming the system log with 
warnings. E.g. the warning is only printed once indicating a driver bug 
and that's it.

>
> Anyway,
>     Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

>
>> +    if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>> AMD_IP_BLOCK_TYPE_GFX, true))
>> +        adev->gfx.gfx_off_state = true;
>>   }
>>     /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> index a0be0772c8b3..ca91aafcb32b 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
>> @@ -563,15 +563,26 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device 
>> *adev, bool enable)
>>         mutex_lock(&adev->gfx.gfx_off_mutex);
>>   -    if (!enable)
>> -        adev->gfx.gfx_off_req_count++;
>> -    else if (adev->gfx.gfx_off_req_count > 0)
>> +    if (enable) {
>> +        /* If the count is already 0, it means there's an imbalance 
>> bug somewhere.
>> +         * Note that the bug may be in a different caller than the 
>> one which triggers the
>> +         * WARN_ON_ONCE.
>> +         */
>> +        if (WARN_ON_ONCE(adev->gfx.gfx_off_req_count == 0))
>> +            goto unlock;
>> +
>>           adev->gfx.gfx_off_req_count--;
>> +    } else {
>> +        adev->gfx.gfx_off_req_count++;
>> +    }
>>         if (enable && !adev->gfx.gfx_off_state && 
>> !adev->gfx.gfx_off_req_count) {
>> schedule_delayed_work(&adev->gfx.gfx_off_delay_work, 
>> GFX_OFF_DELAY_ENABLE);
>> -    } else if (!enable && adev->gfx.gfx_off_state) {
>> -        if (!amdgpu_dpm_set_powergating_by_smu(adev, 
>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>> +    } else if (!enable && adev->gfx.gfx_off_req_count == 1) {
>> + cancel_delayed_work_sync(&adev->gfx.gfx_off_delay_work);
>> +
>> +        if (adev->gfx.gfx_off_state &&
>> +            !amdgpu_dpm_set_powergating_by_smu(adev, 
>> AMD_IP_BLOCK_TYPE_GFX, false)) {
>>               adev->gfx.gfx_off_state = false;
>>                 if (adev->gfx.funcs->init_spm_golden) {
>> @@ -581,6 +592,7 @@ void amdgpu_gfx_off_ctrl(struct amdgpu_device 
>> *adev, bool enable)
>>           }
>>       }
>>   +unlock:
>>       mutex_unlock(&adev->gfx.gfx_off_mutex);
>>   }
>>

