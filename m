Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6669753AC0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC6A10E87F;
	Fri, 14 Jul 2023 12:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD8610E87B;
 Fri, 14 Jul 2023 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b1Gph0vuGXSeRBOUXNrnFyU+mX28k/NdwjFLIR6GaPw=; b=GmhqCPA6yfKkTaZwzAhwBcaA82
 1wZqmYKBvGQs/NT6daPi0IramA0DwS0ycGIPhjFVw6itABCVfJlgifWaCVpnsFo2wU3bLBYQlWfAp
 iVhUrrrbp3ZX0i3JtzW8HaDg5AI3mKcstAkk99rP1S0YwEK1HzsSOHZN5ijwnUIP/TjrgN8T1lLmO
 Ef7XI4/i+dIh1CON8pHnkAj3Z6UxKrznt50Ie5GhwyUsyFKRoc0nQEVmtGA+LHVMRs5vQtVwciaGD
 aHRXkrdIMZU4EpRO+eNZhvqjDzqjH+Fi9E8baadyYXUqBx2F3NiydLssYawZJ55silcoDl+N1DG6I
 e9r/OqTw==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qKHq3-00EVOo-L8; Fri, 14 Jul 2023 14:23:59 +0200
Message-ID: <50fa1365-ab6a-58a1-e82f-ebaf1b623010@igalia.com>
Date: Fri, 14 Jul 2023 09:23:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/6] drm/amdgpu: Log IBs and ring name at coredump
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230713213242.680944-1-andrealmeid@igalia.com>
 <20230713213242.680944-6-andrealmeid@igalia.com>
 <6485568b-da41-b549-f6bd-36139df59215@gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <6485568b-da41-b549-f6bd-36139df59215@gmail.com>
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 michel.daenzer@mailbox.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Em 14/07/2023 04:57, Christian König escreveu:
> Am 13.07.23 um 23:32 schrieb André Almeida:
>> Log the IB addresses used by the hung job along with the stuck ring
>> name. Note that due to nested IBs, the one that caused the reset itself
>> may be in not listed address.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  3 +++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 +++++++++++++++++++++-
>>   2 files changed, 33 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index e1cc83a89d46..cfeaf93934fd 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1086,6 +1086,9 @@ struct amdgpu_coredump_info {
>>       struct amdgpu_task_info         reset_task_info;
>>       struct timespec64               reset_time;
>>       bool                            reset_vram_lost;
>> +    u64                *ibs;
>> +    u32                num_ibs;
>> +    char                ring_name[16];
>>   };
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 07546781b8b8..431ccc3d7857 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5008,12 +5008,24 @@ static ssize_t amdgpu_devcoredump_read(char 
>> *buffer, loff_t offset,
>>                      coredump->adev->reset_dump_reg_value[i]);
>>       }
>> +    if (coredump->num_ibs) {
>> +        drm_printf(&p, "IBs:\n");
>> +        for (i = 0; i < coredump->num_ibs; i++)
>> +            drm_printf(&p, "\t[%d] 0x%llx\n", i, coredump->ibs[i]);
>> +    }
>> +
>> +    if (coredump->ring_name[0] != '\0')
>> +        drm_printf(&p, "ring name: %s\n", coredump->ring_name);
>> +
>>       return count - iter.remain;
>>   }
>>   static void amdgpu_devcoredump_free(void *data)
>>   {
>> -    kfree(data);
>> +    struct amdgpu_coredump_info *coredump = data;
>> +
>> +    kfree(coredump->ibs);
>> +    kfree(coredump);
>>   }
>>   static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>> @@ -5021,6 +5033,8 @@ static void amdgpu_coredump(struct amdgpu_device 
>> *adev, bool vram_lost,
>>   {
>>       struct amdgpu_coredump_info *coredump;
>>       struct drm_device *dev = adev_to_drm(adev);
>> +    struct amdgpu_job *job = reset_context->job;
>> +    int i;
>>       coredump = kmalloc(sizeof(*coredump), GFP_NOWAIT);
>> @@ -5038,6 +5052,21 @@ static void amdgpu_coredump(struct 
>> amdgpu_device *adev, bool vram_lost,
>>       coredump->adev = adev;
>> +    if (job && job->num_ibs) {
> 
> I really really really don't want any dependency of the core dump 
> feature towards the job.
> 

Because of the lifetime of job?

Do you think implementing amdgpu_job_get()/put() would help here?

> What we could do is to record the first executed IB VAs in the hw fence, 
> but I'm not sure how useful this is in the first place.
> 

I see, any hint here of the timedout job would be helpful AFAIK.

> We have some internal feature in progress to query the VA of the draw 
> command which cause the waves currently executing in the SQ to be 
> retrieved.
> 
>> +        struct amdgpu_ring *ring = to_amdgpu_ring(job->base.sched);
>> +        u32 num_ibs = job->num_ibs;
>> +
>> +        coredump->ibs = kmalloc_array(num_ibs, sizeof(coredump->ibs), 
>> GFP_NOWAIT);
> 
> This can fail pretty easily.

Because of its size?

> 
> Christian.
> 
>> +        if (coredump->ibs)
>> +            coredump->num_ibs = num_ibs;
>> +
>> +        for (i = 0; i < coredump->num_ibs; i++)
>> +            coredump->ibs[i] = job->ibs[i].gpu_addr;
>> +
>> +        if (ring)
>> +            strncpy(coredump->ring_name, ring->name, 16);
>> +    }
>> +
>>       ktime_get_ts64(&coredump->reset_time);
>>       dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
> 
