Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2AB780C8C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70BFC10E513;
	Fri, 18 Aug 2023 13:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119E510E513
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692365493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3s//y+IyfbwkZGkF6S0djbBdJ44isVJor+2j/oRDSAg=;
 b=GvWigTi5iGjGxsolZJTAvk+9iu+DKEJM8W/qWwb3o62UH3LRcLGk88VXtW/dM+YmOlJJbV
 i0Oy0rPaT7WKHVcGIyXT55qZgXQtmL5QhqEO3eGl4X+HeNqRLZj8i9JW/N6qIJ3nVDDiWA
 Rx30/u6sXw/wjDcldfQ+7nTWjNTTyVg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-s6UejCDjOMKM-K-p_Voktw-1; Fri, 18 Aug 2023 09:31:30 -0400
X-MC-Unique: s6UejCDjOMKM-K-p_Voktw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99bfe6a531bso55994366b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692365489; x=1692970289;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3s//y+IyfbwkZGkF6S0djbBdJ44isVJor+2j/oRDSAg=;
 b=BuL+RyaMSol1V6S0OioZrhXrKhlJlB+nTGsMC/SODEy3eLS+fPUPHIVu6+1hbiJALj
 a8LyCcbWeKD54XbyCVK4qQvCZIcDjXGUqeYc+MuTp3TEvUWHoeGPU5W62lAj8/yF10pU
 Ut1MrZKlpz8T3NuMLqMPNXN7PzgztYsvC76xWvp/wdanpVKEA09ReJA0HZ96sZi1bp46
 dI+f6zyM5DD5hA/AXdMRJmVkeCqCyqeYU03wyYUSzKRT5+cnOmil442ge93ENgy4Mz9g
 CeY3AyfYDgH5+KU2LeMom2/uziomZFERD2ilgBr5ZjDDOgW1bQbyvDxc8nxB/hAcAXya
 qe1g==
X-Gm-Message-State: AOJu0Yz/83VVdaJ4NMXEL97EixU4d24cY7dn6bMVU2qaaVu1euYbwcdE
 9asNkFMFjmXOsB1JoZCpicstQb8z49EVY7G5v2Cgw1jfaR7HOE3BgOJWKEVMvS+A8kM2rtSVLSh
 ZHO2WarFC+A1H/5elmtNEht/9itsW
X-Received: by 2002:a17:906:ef8b:b0:99b:4ed4:5527 with SMTP id
 ze11-20020a170906ef8b00b0099b4ed45527mr1699831ejb.25.1692365489560; 
 Fri, 18 Aug 2023 06:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJuIGtydVI+c0Jd5aVypZM1T3a62Roquu83tD9SxioSaTxxb9Op43wHDEs3pu38c2sMJ9yAw==
X-Received: by 2002:a17:906:ef8b:b0:99b:4ed4:5527 with SMTP id
 ze11-20020a170906ef8b00b0099b4ed45527mr1699803ejb.25.1692365489228; 
 Fri, 18 Aug 2023 06:31:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a170906170600b0099e05fb8f95sm1191602eje.137.2023.08.18.06.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 06:31:28 -0700 (PDT)
Message-ID: <a3937c17-eaa5-e0e9-e0ac-1610e0652982@redhat.com>
Date: Fri, 18 Aug 2023 13:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
 <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
 <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0d5af79a-ba3a-d4be-938f-81627db65b50@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, lina@asahilina.net,
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org, luben.tuikov@amd.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/23 18:17, Christian König wrote:
> Am 17.08.23 um 14:48 schrieb Danilo Krummrich:
>> On 8/17/23 15:35, Christian König wrote:
>>> Am 17.08.23 um 13:13 schrieb Danilo Krummrich:
>>>> On 8/17/23 07:33, Christian König wrote:
>>>>> [SNIP]
>>>>> My proposal would be to just keep the hw_submission_limit (maybe 
>>>>> rename it to submission_unit_limit) and add a submission_units 
>>>>> field to struct drm_sched_job. By default a jobs submission_units 
>>>>> field would be 0 and the scheduler would behave the exact same way 
>>>>> as it does now.
>>>>>
>>>>> Accordingly, jobs with submission_units > 1 would contribute more 
>>>>> than one unit to the submission_unit_limit.
>>>>>
>>>>> What do you think about that?
>>>
>>> I think you are approaching this from the completely wrong side.
>>
>> First of all, thanks for keeping up the discussion - I appreciate it. 
>> Some more comments / questions below.
>>
>>>
>>> See the UAPI needs to be stable, so you need a maximum job size 
>>> otherwise it can happen that a combination of large and small 
>>> submissions work while a different combination doesn't.
>>
>> How is this related to the uAPI being stable? What do you mean by 
>> 'stable' in this context?
> 
> Stable is in you don't get indifferent behavior, not stable is in the 
> sense of backward compatibility. Sorry for the confusing wording :)
> 
>>
>> The Nouveau uAPI allows userspace to pass EXEC jobs by supplying the 
>> ring ID (channel), in-/out-syncs and a certain amount of indirect push 
>> buffers. The amount of IBs per job is limited by the amount of IBs 
>> fitting into the ring. Just to be clear, when I say 'job size' I mean 
>> the amount of IBs per job.
> 
> Well that more or less sounds identical to all other hardware I know of, 
> e.g. AMD, Intel and the different ARM chips seem to all work like this. 
> But on those drivers the job size limit is not the ring size, but rather 
> a fixed value (at least as far as I know).
> 
>>
>> Maybe I should also mention that the rings we are talking about are 
>> software rings managed by a firmware scheduler. We can have an 
>> arbitrary amount of software rings and even multiple ones per FD.
>>
>> Given a constant ring size I really don't see why I should limit the 
>> maximum amount of IBs userspace can push per job just to end up with a 
>> hw_submission_limit > 1.
>>
>> For example, let's just assume the ring can take 128 IBs, why would I 
>> limit userspace to submit just e.g. 16 IBs at a time, such that the 
>> hw_submission_limit becomes 8?
> 
> Well the question is what happens when you have two submissions back to 
> back which use more than halve of the ring buffer?
> 
> I only see two possible outcomes:
> 1. You return -EBUSY (or similar) error code indicating the the hw can't 
> receive more commands.
> 2. Wait on previously pushed commands to be executed.
> (3. Your driver crash because you accidentally overwrite stuff in the 
> ring buffer which is still executed. I just assume that's prevented).
> 
> Resolution #1 with -EBUSY is actually something the UAPI should not do, 
> because your UAPI then depends on the specific timing of submissions 
> which is a really bad idea.
> 
> Resolution #2 is usually bad because it forces the hw to run dry between 
> submission and so degrade performance.

I agree, that is a good reason for at least limiting the maximum job 
size to half of the ring size.

However, there could still be cases where two subsequent jobs are 
submitted with just a single IB, which as is would still block 
subsequent jobs to be pushed to the ring although there is still plenty 
of space. Depending on the (CPU) scheduler latency, such a case can let 
the HW run dry as well.

Surely, we could just continue decrease the maximum job size even 
further, but this would result in further overhead on user and kernel 
for larger IB counts. Tracking the actual job size seems to be the 
better solution for drivers where the job size can vary over a rather 
huge range.

- Danilo

> 
>>
>> What is the advantage of doing that, rather than letting userspace 
>> submit *up to* 128 IBs per job and just letting the scheduler push IBs 
>> to the ring as long as there's actually space left on the ring?
> 
> Predictable behavior I think. Basically you want organize things so that 
> the hw is at least kept busy all the time without depending on actual 
> timing.
> 
>>
>>>
>>> So what you usually do, and this is driver independent because simply 
>>> a requirement of the UAPI, is that you say here that's my maximum job 
>>> size as well as the number of submission which should be pushed to 
>>> the hw at the same time. And then get the resulting ring size by the 
>>> product of the two.
>>
>> Given the above, how is that a requirement of the uAPI?
> 
> The requirement of the UAPI is actually pretty simple: You should get 
> consistent results, independent of the timing (at least as long as you 
> don't do stuff in parallel).
> 
> Otherwise you can run into issues when on a certain configuration stuff 
> suddenly runs faster or slower than expected. In other words you should 
> not depend on that stuff finishes in a certain amount of time.
> 
>>
>>>
>>> That the ring in this use case can't be fully utilized is not a draw 
>>> back, this is completely intentional design which should apply to all 
>>> drivers independent of the vendor.
>>
>> Why wouldn't we want to fully utilize the ring size?
> 
> As far as I know everybody restricts the submission size to something 
> fixed which is at least smaller than halve the ring size to avoid the 
> problems mentioned above.
> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>>>
>>>> Besides all that, you said that filling up the ring just enough to 
>>>> not let the HW run dry rather than filling it up entirely is 
>>>> desirable. Why do you think so? I tend to think that in most cases 
>>>> it shouldn't make difference.
>>>
>>> That results in better scheduling behavior. It's mostly beneficial if 
>>> you don't have a hw scheduler, but as far as I can see there is no 
>>> need to pump everything to the hw as fast as possible.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> - Danilo
>>>>
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Because one really is the minimum if you want to do work at all, 
>>>>>> but as you mentioned above a job limit of one can let the ring run 
>>>>>> dry.
>>>>>>
>>>>>> In the end my proposal comes down to tracking the actual size of a 
>>>>>> job rather than just assuming a pre-defined maximum job size, and 
>>>>>> hence a dynamic job limit.
>>>>>>
>>>>>> I don't think this would hurt the scheduler granularity. In fact, 
>>>>>> it should even contribute to the desire of not letting the ring 
>>>>>> run dry even better. Especially for sequences of small jobs, where 
>>>>>> the current implementation might wrongly assume the ring is 
>>>>>> already full although actually there would still be enough space 
>>>>>> left.
>>>>>>
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Otherwise your scheduler might just overwrite the ring buffer 
>>>>>>>>> by pushing things to fast.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Given that, it seems like it would be better to let the 
>>>>>>>>>> scheduler keep track of empty ring "slots" instead, such that 
>>>>>>>>>> the scheduler can deceide whether a subsequent job will still 
>>>>>>>>>> fit on the ring and if not re-evaluate once a previous job 
>>>>>>>>>> finished. Of course each submitted job would be required to 
>>>>>>>>>> carry the number of slots it requires on the ring.
>>>>>>>>>>
>>>>>>>>>> What to you think of implementing this as alternative flow 
>>>>>>>>>> control mechanism? Implementation wise this could be a union 
>>>>>>>>>> with the existing hw_submission_limit.
>>>>>>>>>>
>>>>>>>>>> - Danilo
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler 
>>>>>>>>>>> uses a
>>>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a 
>>>>>>>>>>> large
>>>>>>>>>>> number of drm_gpu_scheduler are used. To work around the 
>>>>>>>>>>> scaling issue,
>>>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>>>
>>>>>>>>>>> v2:
>>>>>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>>>>>    - Pass in run work queue
>>>>>>>>>>> v3:
>>>>>>>>>>>    - (Boris) don't have loop in worker
>>>>>>>>>>> v4:
>>>>>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers 
>>>>>>>>>>> into own patch
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

