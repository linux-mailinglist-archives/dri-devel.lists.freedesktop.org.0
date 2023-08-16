Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9240677E54C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 17:40:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4210E382;
	Wed, 16 Aug 2023 15:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F60A10E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692200448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1wnZQsNZoHilbT/cYUNd0LeRRoptjIuwNMTyiTjT6CQ=;
 b=HMAAdMl7dT32TTS+QBifGBJDAg7utWdmCw5/1rSJ+FpEOUP6re6w0f2g0AfF0T3LtEJ+Sn
 jCccqMyRUnEMm2px3iOl6L0VMNX/PkJZtG4mxj7jQTCmkbN0rNfq0xUOCUGy4MSy7OIR/u
 O1aVW2Ki5nbfSATV7d+6KBwCi2Z4SoM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-FbVG279DMqe4xEP-x8aPyg-1; Wed, 16 Aug 2023 11:40:46 -0400
X-MC-Unique: FbVG279DMqe4xEP-x8aPyg-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-99bebfada8cso397923966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 08:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692200445; x=1692805245;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1wnZQsNZoHilbT/cYUNd0LeRRoptjIuwNMTyiTjT6CQ=;
 b=ERqiMBK+Q7RTpxuFg1q5UwGeOmEtfxoHzXQHi7rp7YpYPdJf36xBqSxmtxmxtwBbZJ
 6KvIMmLphogTg7vHiYCbY8dxrD4MvKRUme8rKdnZLs9TwspFiKYI83A7TRTOwtAnluSk
 klc41wNeB4fwIUW1s2B0KqtYh+wpXOeqFB7hYGanQXif20P97IQdtAkaEpFZrZkJ/MsS
 jfeGwLqVqt9N3M65dm3VZRdl1LpH6pgKAovTLQcLS8Wu272Wtm/fW3+FBYV1qzva+pL6
 RUqZifgapex1pjI02sCvQRYJpx6RiF3IVZu0eybiFtnaiWSRo27etfUp3FCMzAEqLuhm
 9iCw==
X-Gm-Message-State: AOJu0YxOLmXDsR2yurEtWzrnOA4WekOJkP1/GRuyUx210FVh0U1tVHLC
 JgrLG8CsGHCmmWUTNgZQz15zIH69LHm/yyTsFeosJAj6+PFnt3tN3YHu6BTrhQZxr0JOAQF4FtK
 H6G1tXV5Pm59U0BB+ip2hO/cxKe56
X-Received: by 2002:a17:906:8465:b0:99c:ca27:c43a with SMTP id
 hx5-20020a170906846500b0099cca27c43amr1746433ejc.14.1692200445625; 
 Wed, 16 Aug 2023 08:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXa50nvPvPc25jU7lYJV/4ZGWF8bF3118LcFt7lrg9jnC4zvouXLi3U/Eo04dO/kDio75wIQ==
X-Received: by 2002:a17:906:8465:b0:99c:ca27:c43a with SMTP id
 hx5-20020a170906846500b0099cca27c43amr1746412ejc.14.1692200445320; 
 Wed, 16 Aug 2023 08:40:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a17090637c900b00992b66e54e9sm8585062ejc.214.2023.08.16.08.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 08:40:44 -0700 (PDT)
Message-ID: <b8103523-1a04-2e71-afc6-d2c7a00708b3@redhat.com>
Date: Wed, 16 Aug 2023 17:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/9] drm/sched: Convert drm scheduler to use a work
 queue rather than kthread
To: Matthew Brost <matthew.brost@intel.com>
References: <20230811023137.659037-1-matthew.brost@intel.com>
 <20230811023137.659037-2-matthew.brost@intel.com>
 <69b648f8-c6b3-5846-0d03-05a380d010d8@redhat.com>
 <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
 <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
 <ZNzfgNFmR/tevvh6@DUT025-TGLU.fm.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZNzfgNFmR/tevvh6@DUT025-TGLU.fm.intel.com>
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
 Liviu.Dudau@arm.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, luben.tuikov@amd.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/16/23 16:38, Matthew Brost wrote:
> On Wed, Aug 16, 2023 at 02:30:38PM +0200, Danilo Krummrich wrote:
>> On 8/16/23 16:05, Christian König wrote:
>>> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>>>> Hi Matt,
>>>>
>>>> On 8/11/23 04:31, Matthew Brost wrote:
>>>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>>>> seems a bit odd but let us explain the reasoning below.
>>>>>
>>>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>>>> guaranteed to be the same completion even if targeting the same hardware
>>>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>>>> apart as the TDR expects submission order == completion order. Using a
>>>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>>>
>>>>> 2. In XE submissions are done via programming a ring buffer (circular
>>>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>>>> control on the ring for free.
>>>>
>>>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>>>
> 
> In Xe the job submission is series of ring instructions done by the KMD.
> The instructions are cache flushes, seqno writes, jump to user BB,
> etc... The exact instructions for each job vary based on hw engine type,
> platform, etc... We dervive MAX_SIZE_PER_JOB from the largest set of
> instructions to submit a job and have a define in the driver for this. I
> believe it is currently set to 192 bytes (the actual define is
> MAX_JOB_SIZE_BYTES). So a 16k ring lets Xe have 85 jobs inflight at
> once.

Ok, that sounds different to how Nouveau works. The "largest set of 
instructions to submit a job" really is a given by how the hardware 
works rather than an arbitrary limit?

In Nouveau, userspace can submit an arbitrary amount of addresses of 
indirect bufferes containing the ring instructions. The ring on the 
kernel side takes the addresses of the indirect buffers rather than the 
instructions themself. Hence, technically there isn't really a limit on 
the amount of IBs submitted by a job except for the ring size.

> 
>>>> In Nouveau we currently do have such a limitation as well, but it is
>>>> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would
>>>> always be 1. However, I think most jobs won't actually utilize the
>>>> whole ring.
>>>
>>> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB =
>>> hw_submission_limit (or even hw_submission_limit - 1 when the hw can't
> 
> Yes, hw_submission_limit = RING_SIZE / MAX_SIZE_PER_JOB in Xe.
> 
> 
>>> distinct full vs empty ring buffer).
>>
>> Not sure if I get you right, let me try to clarify what I was trying to say:
>> I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really limited by
>> anything other than the RING_SIZE and hence we'd never allow more than 1
>> active job.
> 
> I'm confused how there isn't a limit on the size of the job in Nouveau?
> Based on what you have said, a job could be larger than the ring then?

As explained above, theoretically it could. It's only limited by the 
ring size.

> 
>>
>> However, it seems to be more efficient to base ring flow control on the
>> actual size of each incoming job rather than the worst case, namely the
>> maximum size of a job.
>>
> 
> If this doesn't work for Nouveau, feel free flow control the ring
> differently but this works rather well (and simple) for Xe.
> 
> Matt
> 
>>>
>>> Otherwise your scheduler might just overwrite the ring buffer by pushing
>>> things to fast.
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
>>>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>>>> use a worker rather than kthread for submission / job cleanup.
>>>>>
>>>>> v2:
>>>>>     - (Rob Clark) Fix msm build
>>>>>     - Pass in run work queue
>>>>> v3:
>>>>>     - (Boris) don't have loop in worker
>>>>> v4:
>>>>>     - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>
>>>
>>
> 

