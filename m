Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E468780CA6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D66310E51C;
	Fri, 18 Aug 2023 13:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D7610E51B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692365946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqG4iscjLJT2yujfKZMRVXa7X34JfeQ+wVEFDVDChQU=;
 b=d/BRTrHtlAwSATbpcQtOmLCmZUyIuoI6iZUgBINnD4e3WN1LpuGtJ8y7GZTTRBBKMLeI6/
 F+myRol6oH3xNd+nuQnfpbsXmXRWd3VoYGW/HbwrHkL3vX9RkPQv6Ck13U2Pzf9zpoU9qw
 UA+AdL0D7GcZvEfsH70mdqfJn90OYkM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-CQ3tTmEiN0yjKVSunSOgKA-1; Fri, 18 Aug 2023 09:39:05 -0400
X-MC-Unique: CQ3tTmEiN0yjKVSunSOgKA-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99c0bd2ca23so55721966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692365944; x=1692970744;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cqG4iscjLJT2yujfKZMRVXa7X34JfeQ+wVEFDVDChQU=;
 b=TupVONpM0xj4W6qurlD9H/pCk0Y4HNCw1klxzFx9Q9S7LC4mnV+ZQLP5YmOsU5Brge
 ahfsef59d0Z2fZ9oJzIp5x9orprHC23OKpoweZWELYJxMmgggO6WTSmpubaxT+lKZAUo
 3oIPKv4VIgdkJpSd3pfJ0F5U2kpx2D70hmfamyyEr7XYGpMfdACVWWi/E+iX/1HUW17v
 AYrP/+/OD1gZviqaxudz6lF8QCjNyZ7juNSBOhxt9T/807xDiLfJ8sT1S12StaeP3TtN
 VAsrMd9sScOkxoxSvcbPbuuw57WRoBunqONNlQCJjZgtiCtF6Y6zUFV4WLtkeNLenMqO
 Y+Cg==
X-Gm-Message-State: AOJu0YyDsppYVHipri8gX5rtYPmVKyUqpa/gUQUW+rUCkQW8eziH1ZIH
 d+LUxoDQNyDhvE4pf4JueEMzeYSbJrTiaPjooYqJD5F0S8LxHn4hVmy7B1ZM7ujJCmjrqu3ZJ0b
 ytElpoL9G1BklPfk8LoRgMhQRYPI0
X-Received: by 2002:a17:907:2e19:b0:99b:ed53:5c12 with SMTP id
 ig25-20020a1709072e1900b0099bed535c12mr1993359ejc.17.1692365943739; 
 Fri, 18 Aug 2023 06:39:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6kI0qGSNTO3EIwKZbVUSmNGGS6SdW542Tu74a7ZpkWLspyow0r9Xb2icNWPkdNwyuniqquA==
X-Received: by 2002:a17:907:2e19:b0:99b:ed53:5c12 with SMTP id
 ig25-20020a1709072e1900b0099bed535c12mr1993343ejc.17.1692365943430; 
 Fri, 18 Aug 2023 06:39:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a170906a20100b00997e99a662bsm1204947ejy.20.2023.08.18.06.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Aug 2023 06:39:03 -0700 (PDT)
Message-ID: <f2794271-bae1-751d-eefd-73e447fa8956@redhat.com>
Date: Fri, 18 Aug 2023 14:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <982800c1-e7d3-f276-51d0-1a431f92eacb@amd.com>
 <5fdf7d59-3323-24b5-a35a-bd60b06b4ce5@redhat.com>
 <0bf839df-db7f-41fa-8b34-59792d2ba8be@amd.com>
 <e8fa305a-0ac8-ece7-efeb-f9cec2892d44@redhat.com>
 <ZN7gxBpnZD8OW9ZW@DUT025-TGLU.fm.intel.com>
 <3aa630e6-db3e-c03b-b3c2-aca517170a1c@amd.com>
 <ZN9o8paxwsYYQrb+@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZN9o8paxwsYYQrb+@DUT025-TGLU.fm.intel.com>
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

On 8/18/23 14:49, Matthew Brost wrote:
> On Fri, Aug 18, 2023 at 07:40:41AM +0200, Christian König wrote:
>> Am 18.08.23 um 05:08 schrieb Matthew Brost:
>>> On Thu, Aug 17, 2023 at 01:13:31PM +0200, Danilo Krummrich wrote:
>>>> On 8/17/23 07:33, Christian König wrote:
>>>>> Am 16.08.23 um 18:33 schrieb Danilo Krummrich:
>>>>>> On 8/16/23 16:59, Christian König wrote:
>>>>>>> Am 16.08.23 um 14:30 schrieb Danilo Krummrich:
>>>>>>>> On 8/16/23 16:05, Christian König wrote:
>>>>>>>>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>>>>>>>>> Hi Matt,
>>>>>>>>>>
>>>>>>>>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>>>>>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>>>>>>>> mapping between a drm_gpu_scheduler and
>>>>>>>>>>> drm_sched_entity. At first this
>>>>>>>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>>>>>>>
>>>>>>>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>>>>>>>> guaranteed to be the same completion even if
>>>>>>>>>>> targeting the same hardware
>>>>>>>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>>>>>>>> which allowed to reorder, timeslice, and preempt
>>>>>>>>>>> submissions. If a using
>>>>>>>>>>> shared drm_gpu_scheduler across multiple
>>>>>>>>>>> drm_sched_entity, the TDR falls
>>>>>>>>>>> apart as the TDR expects submission order ==
>>>>>>>>>>> completion order. Using a
>>>>>>>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>>>>>>>
>>>>>>>>>>> 2. In XE submissions are done via programming a
>>>>>>>>>>> ring buffer (circular
>>>>>>>>>>> buffer), a drm_gpu_scheduler provides a limit on
>>>>>>>>>>> number of jobs, if the
>>>>>>>>>>> limit of number jobs is set to RING_SIZE /
>>>>>>>>>>> MAX_SIZE_PER_JOB we get flow
>>>>>>>>>>> control on the ring for free.
>>>>>>>>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>>>>>>>>
>>>>>>>>>> In Nouveau we currently do have such a limitation as
>>>>>>>>>> well, but it is derived from the RING_SIZE, hence
>>>>>>>>>> RING_SIZE / MAX_SIZE_PER_JOB would always be 1.
>>>>>>>>>> However, I think most jobs won't actually utilize
>>>>>>>>>> the whole ring.
>>>>>>>>> Well that should probably rather be RING_SIZE /
>>>>>>>>> MAX_SIZE_PER_JOB = hw_submission_limit (or even
>>>>>>>>> hw_submission_limit - 1 when the hw can't distinct full
>>>>>>>>> vs empty ring buffer).
>>>>>>>> Not sure if I get you right, let me try to clarify what I
>>>>>>>> was trying to say: I wanted to say that in Nouveau
>>>>>>>> MAX_SIZE_PER_JOB isn't really limited by anything other than
>>>>>>>> the RING_SIZE and hence we'd never allow more than 1 active
>>>>>>>> job.
>>>>>>> But that lets the hw run dry between submissions. That is
>>>>>>> usually a pretty horrible idea for performance.
>>>>>> Correct, that's the reason why I said it seems to be more efficient
>>>>>> to base ring flow control on the actual size of each incoming job
>>>>>> rather than the maximum size of a job.
>>>>>>
>>>>>>>> However, it seems to be more efficient to base ring flow
>>>>>>>> control on the actual size of each incoming job rather than
>>>>>>>> the worst case, namely the maximum size of a job.
>>>>>>> That doesn't sounds like a good idea to me. See we don't limit
>>>>>>> the number of submitted jobs based on the ring size, but rather
>>>>>>> we calculate the ring size based on the number of submitted
>>>>>>> jobs.
>>>>>>>
>>>>>> My point isn't really about whether we derive the ring size from the
>>>>>> job limit or the other way around. It's more about the job size (or
>>>>>> its maximum size) being arbitrary.
>>>>>>
>>>>>> As mentioned in my reply to Matt:
>>>>>>
>>>>>> "In Nouveau, userspace can submit an arbitrary amount of addresses
>>>>>> of indirect bufferes containing the ring instructions. The ring on
>>>>>> the kernel side takes the addresses of the indirect buffers rather
>>>>>> than the instructions themself. Hence, technically there isn't
>>>>>> really a limit on the amount of IBs submitted by a job except for
>>>>>> the ring size."
>>>>>>
>>>>>> So, my point is that I don't really want to limit the job size
>>>>>> artificially just to be able to fit multiple jobs into the ring even
>>>>>> if they're submitted at their "artificial" maximum size, but rather
>>>>>> track how much of the ring the submitted job actually occupies.
>>>>>>
>>>>>>> In other words the hw_submission_limit defines the ring size,
>>>>>>> not the other way around. And you usually want the
>>>>>>> hw_submission_limit as low as possible for good scheduler
>>>>>>> granularity and to avoid extra overhead.
>>>>>> I don't think you really mean "as low as possible", do you?
>>>>> No, I do mean as low as possible or in other words as few as possible.
>>>>>
>>>>> Ideally the scheduler would submit only the minimum amount of work to
>>>>> the hardware to keep the hardware busy. >
>>>>> The hardware seems to work mostly the same for all vendors, but you
>>>>> somehow seem to think that filling the ring is somehow beneficial which
>>>>> is really not the case as far as I can see.
>>>> I think that's a misunderstanding. I'm not trying to say that it is *always*
>>>> beneficial to fill up the ring as much as possible. But I think it is under
>>>> certain circumstances, exactly those circumstances I described for Nouveau.
>>>>
>>>> As mentioned, in Nouveau the size of a job is only really limited by the
>>>> ring size, which means that one job can (but does not necessarily) fill up
>>>> the whole ring. We both agree that this is inefficient, because it
>>>> potentially results into the HW run dry due to hw_submission_limit == 1.
>>>>
>>>> I recognize you said that one should define hw_submission_limit and adjust
>>>> the other parts of the equation accordingly, the options I see are:
>>>>
>>>> (1) Increase the ring size while keeping the maximum job size.
>>>> (2) Decrease the maximum job size while keeping the ring size.
>>>> (3) Let the scheduler track the actual job size rather than the maximum job
>>>> size.
>>>>
>>>> (1) results into potentially wasted ring memory, because we're not always
>>>> reaching the maximum job size, but the scheduler assumes so.
>>>>
>>>> (2) results into more IOCTLs from userspace for the same amount of IBs and
>>>> more jobs result into more memory allocations and more work being submitted
>>>> to the workqueue (with Matt's patches).
>>>>
>>>> (3) doesn't seem to have any of those draw backs.
>>>>
>>>> What would be your take on that?
>>>>
>>>> Actually, if none of the other drivers is interested into a more precise way
>>>> of keeping track of the ring utilization, I'd be totally fine to do it in a
>>>> driver specific way. However, unfortunately I don't see how this would be
>>>> possible.
>>>>
>>>> My proposal would be to just keep the hw_submission_limit (maybe rename it
>>>> to submission_unit_limit) and add a submission_units field to struct
>>>> drm_sched_job. By default a jobs submission_units field would be 0 and the
>>>> scheduler would behave the exact same way as it does now.
>>>>
>>>> Accordingly, jobs with submission_units > 1 would contribute more than one
>>>> unit to the submission_unit_limit.
>>>>
>>>> What do you think about that?
>>>>
>>> This seems reasonible to me and a very minimal change to the scheduler.
>>
>> If you have a good use case for this then the approach sounds sane to me as
>> well.
>>
> 
> Xe does not have a use case as the difference between the minimum size
> of a job and the maximum is not all that large (maybe 100-192 bytes is
> the range) so the accounting of a unit of 1 per job is just fine for now
> even though it may waste space.
> 
> In Nouveau it seems like the min / max for size of job can vary wildly
> so it needs finer grained units to mke effective use of the ring space.
> Updating the scheduler to support this is rather trivial, hence no real
> opposition from me. Also I do see this valid use case that other driver
> or even perhaps Xe may use someday.

Yes, exactly that.

> 
>> My question is rather how exactly does Nouveau comes to have this use case?
>> Allowing the full ring size in the UAPI sounds a bit questionable.
>>
> 
> I agree allowing the user completely fill the ring is a bit
> questionable, surely there has to be some upper limit. But lets say it
> allows 1-64 IB, that still IMO could be used to justify finer grained
> accouting in the DRM scheduler as stated above this make the difference
> between the min / max job quite large.

Yes, I agree that limiting the job size to at least ring size half makes 
sense to guarantee a contiguous flow.

> 
> Matt
> 
>> Christian.
>>
>>>
>>> Matt
>>>
>>>> Besides all that, you said that filling up the ring just enough to not let
>>>> the HW run dry rather than filling it up entirely is desirable. Why do you
>>>> think so? I tend to think that in most cases it shouldn't make difference.
>>>>
>>>> - Danilo
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Because one really is the minimum if you want to do work at all, but
>>>>>> as you mentioned above a job limit of one can let the ring run dry.
>>>>>>
>>>>>> In the end my proposal comes down to tracking the actual size of a
>>>>>> job rather than just assuming a pre-defined maximum job size, and
>>>>>> hence a dynamic job limit.
>>>>>>
>>>>>> I don't think this would hurt the scheduler granularity. In fact, it
>>>>>> should even contribute to the desire of not letting the ring run dry
>>>>>> even better. Especially for sequences of small jobs, where the
>>>>>> current implementation might wrongly assume the ring is already full
>>>>>> although actually there would still be enough space left.
>>>>>>
>>>>>>> Christian.
>>>>>>>
>>>>>>>>> Otherwise your scheduler might just overwrite the ring
>>>>>>>>> buffer by pushing things to fast.
>>>>>>>>>
>>>>>>>>> Christian.
>>>>>>>>>
>>>>>>>>>> Given that, it seems like it would be better to let
>>>>>>>>>> the scheduler keep track of empty ring "slots"
>>>>>>>>>> instead, such that the scheduler can deceide whether
>>>>>>>>>> a subsequent job will still fit on the ring and if
>>>>>>>>>> not re-evaluate once a previous job finished. Of
>>>>>>>>>> course each submitted job would be required to carry
>>>>>>>>>> the number of slots it requires on the ring.
>>>>>>>>>>
>>>>>>>>>> What to you think of implementing this as
>>>>>>>>>> alternative flow control mechanism? Implementation
>>>>>>>>>> wise this could be a union with the existing
>>>>>>>>>> hw_submission_limit.
>>>>>>>>>>
>>>>>>>>>> - Danilo
>>>>>>>>>>
>>>>>>>>>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>>>>>>>>>> kthread for submission / job cleanup. This doesn't scale if a large
>>>>>>>>>>> number of drm_gpu_scheduler are used. To work
>>>>>>>>>>> around the scaling issue,
>>>>>>>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>>>>>>>
>>>>>>>>>>> v2:
>>>>>>>>>>>      - (Rob Clark) Fix msm build
>>>>>>>>>>>      - Pass in run work queue
>>>>>>>>>>> v3:
>>>>>>>>>>>      - (Boris) don't have loop in worker
>>>>>>>>>>> v4:
>>>>>>>>>>>      - (Tvrtko) break out submit ready, stop,
>>>>>>>>>>> start helpers into own patch
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
> 

