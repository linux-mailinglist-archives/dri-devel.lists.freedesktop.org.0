Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A7A77F93A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5F210E4AE;
	Thu, 17 Aug 2023 14:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982A110E4AE
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692283098;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IU2tly2AhtdFtbxtaCxJNcdKsYvG8JAXPFPJT3GasHg=;
 b=ViThy5DRTEo61YJQuS/RPzFn6t0R8gD47j22/9EE3+Ji4kJQqFSoeUcXTF3qltQI81nY0d
 yCwR3Fbb3jnadcdIfNyJ8J4JJxpUlpag5o7w9RM1Iv+xNGYI2KOe3fTGhIGb+NL28V1kSF
 xY61XQoX8vgOHbPPi8KqKNKz9gzLOfE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-dTce1jJhPrO411n1Fi_s4A-1; Thu, 17 Aug 2023 10:38:17 -0400
X-MC-Unique: dTce1jJhPrO411n1Fi_s4A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-98e40d91fdfso103753166b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 07:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692283096; x=1692887896;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IU2tly2AhtdFtbxtaCxJNcdKsYvG8JAXPFPJT3GasHg=;
 b=H46akgas4Lszhhmy9KgUTdCGqAlS20IcSMrDXuexnA1sXw8cQtZD3mgP+FyS0bGJP9
 4qFw7KMc9KfnJT3c6h1HhJIgMebxGWB/SO6Eac4Cf2zDa3i1it2hu6XUjTzLKB4sqXv3
 CsGRu4SpPr/9MKn/0UyVrkuMYW/t+ZbBNx2rorAV8Uj3cPt2p3/AD3KxqmTMDea9O9eB
 dpgX1regZJx2d456tEPrAfSHrn02hd7V+egjHvC/mPdi3wshBtSg4i3Y/B7KO3z60rct
 KYVMENE/xiCZV9RzdIjPFzKgZJnKNqN6Bor0feKnJ/iBgCi0KIO+WjfelDNKoi9guyNE
 H9pg==
X-Gm-Message-State: AOJu0Yy6e1MDEr7QvGLwcVqRn75/9N3OfzT5EGU8hm3y+61c3MKVf7vU
 tnkL8Q0Gdwz6KRsAOBPSfgjWOw7VM+oaOfC/mEevDHBYuQMlhFjGedMGauz9dnVS3dL5YP/m+0F
 HmlAONSBfByi3YcYEXYCNPUBkh6uv
X-Received: by 2002:a17:906:2112:b0:993:d7fe:7f1d with SMTP id
 18-20020a170906211200b00993d7fe7f1dmr3900013ejt.28.1692283096248; 
 Thu, 17 Aug 2023 07:38:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+F5+H0WBzKpmCycE5M9iD9rlXxyLNJ0FNlmJHuWqXoqxBweptuKKx/57ngEDeKO3xkkDsgw==
X-Received: by 2002:a17:906:2112:b0:993:d7fe:7f1d with SMTP id
 18-20020a170906211200b00993d7fe7f1dmr3899999ejt.28.1692283095934; 
 Thu, 17 Aug 2023 07:38:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a1709060e9700b00977eec7b7e8sm10165987ejf.68.2023.08.17.07.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Aug 2023 07:38:15 -0700 (PDT)
Message-ID: <a80be2c1-132e-5ee1-4278-47655916494a@redhat.com>
Date: Thu, 17 Aug 2023 14:48:31 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ef4d2c78-6927-3d3b-7aac-27d013af7ea6@amd.com>
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

On 8/17/23 15:35, Christian König wrote:
> Am 17.08.23 um 13:13 schrieb Danilo Krummrich:
>> On 8/17/23 07:33, Christian König wrote:
>>> [SNIP]
>>> The hardware seems to work mostly the same for all vendors, but you 
>>> somehow seem to think that filling the ring is somehow beneficial 
>>> which is really not the case as far as I can see.
>>
>> I think that's a misunderstanding. I'm not trying to say that it is 
>> *always* beneficial to fill up the ring as much as possible. But I 
>> think it is under certain circumstances, exactly those circumstances I 
>> described for Nouveau.
> 
> As far as I can see this is not correct for Nouveau either.
> 
>>
>> As mentioned, in Nouveau the size of a job is only really limited by 
>> the ring size, which means that one job can (but does not necessarily) 
>> fill up the whole ring. We both agree that this is inefficient, 
>> because it potentially results into the HW run dry due to 
>> hw_submission_limit == 1.
>>
>> I recognize you said that one should define hw_submission_limit and 
>> adjust the other parts of the equation accordingly, the options I see 
>> are:
>>
>> (1) Increase the ring size while keeping the maximum job size.
>> (2) Decrease the maximum job size while keeping the ring size.
>> (3) Let the scheduler track the actual job size rather than the 
>> maximum job size.
>>
>> (1) results into potentially wasted ring memory, because we're not 
>> always reaching the maximum job size, but the scheduler assumes so.
>>
>> (2) results into more IOCTLs from userspace for the same amount of IBs 
>> and more jobs result into more memory allocations and more work being 
>> submitted to the workqueue (with Matt's patches).
>>
>> (3) doesn't seem to have any of those draw backs.
>>
>> What would be your take on that?
>>
>> Actually, if none of the other drivers is interested into a more 
>> precise way of keeping track of the ring utilization, I'd be totally 
>> fine to do it in a driver specific way. However, unfortunately I don't 
>> see how this would be possible.
>>
>> My proposal would be to just keep the hw_submission_limit (maybe 
>> rename it to submission_unit_limit) and add a submission_units field 
>> to struct drm_sched_job. By default a jobs submission_units field 
>> would be 0 and the scheduler would behave the exact same way as it 
>> does now.
>>
>> Accordingly, jobs with submission_units > 1 would contribute more than 
>> one unit to the submission_unit_limit.
>>
>> What do you think about that?
> 
> I think you are approaching this from the completely wrong side.

First of all, thanks for keeping up the discussion - I appreciate it. 
Some more comments / questions below.

> 
> See the UAPI needs to be stable, so you need a maximum job size 
> otherwise it can happen that a combination of large and small 
> submissions work while a different combination doesn't.

How is this related to the uAPI being stable? What do you mean by 
'stable' in this context?

The Nouveau uAPI allows userspace to pass EXEC jobs by supplying the 
ring ID (channel), in-/out-syncs and a certain amount of indirect push 
buffers. The amount of IBs per job is limited by the amount of IBs 
fitting into the ring. Just to be clear, when I say 'job size' I mean 
the amount of IBs per job.

Maybe I should also mention that the rings we are talking about are 
software rings managed by a firmware scheduler. We can have an arbitrary 
amount of software rings and even multiple ones per FD.

Given a constant ring size I really don't see why I should limit the 
maximum amount of IBs userspace can push per job just to end up with a 
hw_submission_limit > 1.

For example, let's just assume the ring can take 128 IBs, why would I 
limit userspace to submit just e.g. 16 IBs at a time, such that the 
hw_submission_limit becomes 8?

What is the advantage of doing that, rather than letting userspace 
submit *up to* 128 IBs per job and just letting the scheduler push IBs 
to the ring as long as there's actually space left on the ring?

> 
> So what you usually do, and this is driver independent because simply a 
> requirement of the UAPI, is that you say here that's my maximum job size 
> as well as the number of submission which should be pushed to the hw at 
> the same time. And then get the resulting ring size by the product of 
> the two.

Given the above, how is that a requirement of the uAPI?

> 
> That the ring in this use case can't be fully utilized is not a draw 
> back, this is completely intentional design which should apply to all 
> drivers independent of the vendor.

Why wouldn't we want to fully utilize the ring size?

- Danilo

> 
>>
>> Besides all that, you said that filling up the ring just enough to not 
>> let the HW run dry rather than filling it up entirely is desirable. 
>> Why do you think so? I tend to think that in most cases it shouldn't 
>> make difference.
> 
> That results in better scheduling behavior. It's mostly beneficial if 
> you don't have a hw scheduler, but as far as I can see there is no need 
> to pump everything to the hw as fast as possible.
> 
> Regards,
> Christian.
> 
>>
>> - Danilo
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Because one really is the minimum if you want to do work at all, but 
>>>> as you mentioned above a job limit of one can let the ring run dry.
>>>>
>>>> In the end my proposal comes down to tracking the actual size of a 
>>>> job rather than just assuming a pre-defined maximum job size, and 
>>>> hence a dynamic job limit.
>>>>
>>>> I don't think this would hurt the scheduler granularity. In fact, it 
>>>> should even contribute to the desire of not letting the ring run dry 
>>>> even better. Especially for sequences of small jobs, where the 
>>>> current implementation might wrongly assume the ring is already full 
>>>> although actually there would still be enough space left.
>>>>
>>>>>
>>>>> Christian.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> Otherwise your scheduler might just overwrite the ring buffer by 
>>>>>>> pushing things to fast.
>>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>
>>>>>>>> Given that, it seems like it would be better to let the 
>>>>>>>> scheduler keep track of empty ring "slots" instead, such that 
>>>>>>>> the scheduler can deceide whether a subsequent job will still 
>>>>>>>> fit on the ring and if not re-evaluate once a previous job 
>>>>>>>> finished. Of course each submitted job would be required to 
>>>>>>>> carry the number of slots it requires on the ring.
>>>>>>>>
>>>>>>>> What to you think of implementing this as alternative flow 
>>>>>>>> control mechanism? Implementation wise this could be a union 
>>>>>>>> with the existing hw_submission_limit.
>>>>>>>>
>>>>>>>> - Danilo
>>>>>>>>
>>>>>>>>>
>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a 
>>>>>>>>> large
>>>>>>>>> number of drm_gpu_scheduler are used. To work around the 
>>>>>>>>> scaling issue,
>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>
>>>>>>>>> v2:
>>>>>>>>>    - (Rob Clark) Fix msm build
>>>>>>>>>    - Pass in run work queue
>>>>>>>>> v3:
>>>>>>>>>    - (Boris) don't have loop in worker
>>>>>>>>> v4:
>>>>>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into 
>>>>>>>>> own patch
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>
> 

