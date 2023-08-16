Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3616D77E674
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F8A10E38A;
	Wed, 16 Aug 2023 16:34:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D5310E38A
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692203640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wo5D95tyED+6Tl5thZKpJIybwvLVB8DxJJpl6u2ukUI=;
 b=JWE/U3ezEse1CCKPNqs4to6MrBoCUXzGBCbC2tIbJUWJtkiFxCN1xUEQlbdzXozyFrAIc+
 dzqvaVFD4bHX/q4iwfQylfR37HigeoFB9C42V/LoFmkM5DZrrxMCXDW+SUwtdG1II1lRaZ
 9xD8r7jsXsIa3CIqGr8+ScHE4GOCzwM=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-cgnXZUOjNZSERV4BV2YYrg-1; Wed, 16 Aug 2023 12:33:58 -0400
X-MC-Unique: cgnXZUOjNZSERV4BV2YYrg-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4ff8d9fdf11so1318424e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 09:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692203637; x=1692808437;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wo5D95tyED+6Tl5thZKpJIybwvLVB8DxJJpl6u2ukUI=;
 b=Ypikhl55hndx3ZIPaAtfEmqwsZPKqyKKuT3awrPY4Qa/FKEnn1ycrUdwZ+lDcbU0DE
 NNUpgIvWne43x/Auky0CSc08KONfGQXWnkCbsHDha8jWRyJnQMqfBT29sjeQKusm5DvB
 f0cqpTrn3umXJ3SfpVpi9gASd6hb9K+wMJIIIdD+rkBnIs+V2vLiRtq2tkPR7yYGwRS3
 DcCdz41NCnV+EFSq38AbET2LHGiOpFWEBxCvVVynuJDT0med2xhyD+rpGWHAlMBXj9xL
 Vk/I8kKja799PMI+4Xhj/6DWT5OKHgOuwJSYU/4EQExNVvyTNxnZR+ErPi3iTjslqENE
 CBsw==
X-Gm-Message-State: AOJu0Yx95hXv/9avj6jHXwKXTLja7ZuX57ps9WJYH5PMC1ybo9UL2ZLE
 BmGDC6KhsM7MGdX7QMDLkCYDwwLoSgHz526BBRJiooj61SxnPPXxPx9vVMLdJnXtCaqxyQL3mmy
 F6PpKZrOamH8OYeZTv+WFb6jZKJIv
X-Received: by 2002:ac2:5976:0:b0:4fd:c771:ed86 with SMTP id
 h22-20020ac25976000000b004fdc771ed86mr1657801lfp.67.1692203637285; 
 Wed, 16 Aug 2023 09:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFGMajjD3cyi2NffsYO9tSL87AalfncMUTZ15kYgzr6pwjifyEnzhwTpN76pDF5Y2E/zWlyQ==
X-Received: by 2002:ac2:5976:0:b0:4fd:c771:ed86 with SMTP id
 h22-20020ac25976000000b004fdc771ed86mr1657756lfp.67.1692203636853; 
 Wed, 16 Aug 2023 09:33:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 c24-20020aa7d618000000b0052333e5237esm8582880edr.88.2023.08.16.09.33.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 09:33:56 -0700 (PDT)
Message-ID: <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
Date: Wed, 16 Aug 2023 18:33:55 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
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

On 8/16/23 16:59, Christian König wrote:
> Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
>> On 8/16/23 16:05, Christian König wrote:
>>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>>> Hi Matt,
>>>>
>>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first 
>>>>> this
>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>
>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>> guaranteed to be the same completion even if targeting the same 
>>>>> hardware
>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>> which allowed to reorder, timeslice, and preempt submissions. If a 
>>>>> using
>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR 
>>>>> falls
>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>
>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if 
>>>>> the
>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get 
>>>>> flow
>>>>> control on the ring for free.
>>>>
>>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>>
>>>> In Nouveau we currently do have such a limitation as well, but it is 
>>>> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
>>>> always be 1. However, I think most jobs won't actually utilize the 
>>>> whole ring.
>>>
>>> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
>>> hw_submission_limit (or even hw_submission_limit - 1 when the hw 
>>> can't distinct full vs empty ring buffer).
>>
>> Not sure if I get you right, let me try to clarify what I was trying 
>> to say: I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really 
>> limited by anything other than the RING_SIZE and hence we'd never 
>> allow more than 1 active job.
> 
> But that lets the hw run dry between submissions. That is usually a 
> pretty horrible idea for performance.

Correct, that's the reason why I said it seems to be more efficient to 
base ring flow control on the actual size of each incoming job rather 
than the maximum size of a job.

> 
>>
>> However, it seems to be more efficient to base ring flow control on 
>> the actual size of each incoming job rather than the worst case, 
>> namely the maximum size of a job.
> 
> That doesn't sounds like a good idea to me. See we don't limit the 
> number of submitted jobs based on the ring size, but rather we calculate 
> the ring size based on the number of submitted jobs.
> 

My point isn't really about whether we derive the ring size from the job 
limit or the other way around. It's more about the job size (or its 
maximum size) being arbitrary.

As mentioned in my reply to Matt:

"In Nouveau, userspace can submit an arbitrary amount of addresses of 
indirect bufferes containing the ring instructions. The ring on the 
kernel side takes the addresses of the indirect buffers rather than the 
instructions themself. Hence, technically there isn't really a limit on 
the amount of IBs submitted by a job except for the ring size."

So, my point is that I don't really want to limit the job size 
artificially just to be able to fit multiple jobs into the ring even if 
they're submitted at their "artificial" maximum size, but rather track 
how much of the ring the submitted job actually occupies.

> In other words the hw_submission_limit defines the ring size, not the 
> other way around. And you usually want the hw_submission_limit as low as 
> possible for good scheduler granularity and to avoid extra overhead.

I don't think you really mean "as low as possible", do you? Because one 
really is the minimum if you want to do work at all, but as you 
mentioned above a job limit of one can let the ring run dry.

In the end my proposal comes down to tracking the actual size of a job 
rather than just assuming a pre-defined maximum job size, and hence a 
dynamic job limit.

I don't think this would hurt the scheduler granularity. In fact, it 
should even contribute to the desire of not letting the ring run dry 
even better. Especially for sequences of small jobs, where the current 
implementation might wrongly assume the ring is already full although 
actually there would still be enough space left.

> 
> Christian.
> 
>>
>>>
>>> Otherwise your scheduler might just overwrite the ring buffer by 
>>> pushing things to fast.
>>>
>>> Christian.
>>>
>>>>
>>>> Given that, it seems like it would be better to let the scheduler 
>>>> keep track of empty ring "slots" instead, such that the scheduler 
>>>> can deceide whether a subsequent job will still fit on the ring and 
>>>> if not re-evaluate once a previous job finished. Of course each 
>>>> submitted job would be required to carry the number of slots it 
>>>> requires on the ring.
>>>>
>>>> What to you think of implementing this as alternative flow control 
>>>> mechanism? Implementation wise this could be a union with the 
>>>> existing hw_submission_limit.
>>>>
>>>> - Danilo
>>>>
>>>>>
>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>> number of drm_gpu_scheduler are used. To work around the scaling 
>>>>> issue,
>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>
>>>>> v2:
>>>>>    - (Rob Clark) Fix msm build
>>>>>    - Pass in run work queue
>>>>> v3:
>>>>>    - (Boris) don't have loop in worker
>>>>> v4:
>>>>>    - (Tvrtko) break out submit ready, stop, start helpers into own 
>>>>> patch
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>
>>
> 

