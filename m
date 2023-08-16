Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D5377E37A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DFD10E372;
	Wed, 16 Aug 2023 14:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB4B10E371
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 14:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692195868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3sRKlT8hXEn5OFLextJhDHP3mx2JjgDHfqkY8schRFY=;
 b=Ib0HuuMjIYEDcNBU8dSc/ySsvb3dZGwAAxnz1qnaLN9HEbvKXQUOVNdN4iqk4Wf4aXFPC+
 ZQAdYf6a016hb5EuHeAu48x8sJ8IBWjaGNKDDTEE5Tu90HkXqSjCojDYTIKcrTCg+x0qwc
 aXjhONQe+zlH6WC1d8ES5mu69jeQfuc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-8v73ISX2PhG_KNJoMJ9LHw-1; Wed, 16 Aug 2023 10:24:27 -0400
X-MC-Unique: 8v73ISX2PhG_KNJoMJ9LHw-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-98e40d91fdfso35989766b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 07:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692195866; x=1692800666;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sRKlT8hXEn5OFLextJhDHP3mx2JjgDHfqkY8schRFY=;
 b=Nf2r30DHG2FOOSv0vqR/mkXtVdmReFQB2YlGtS52Wpqtg77x3v9HbJUUroBskdYMFJ
 DWOCAulFmRplZJDEewXtww3hivo67fa56S7OFVIsmoLdEi69V6RegjxEP1DZ5cIqAsi1
 cy5w9PTN3rGaol35VLomatL6q29d6WuUTKzjMZuS7e523URiJ07UHXTYCrwLpCp+U8uv
 oDtA7wPqakiZ8NN4oGiVJQz2RGeVY50J1wOurzjSk4NLCkJ1cq8eeGJjsq5UUa7NFBal
 sAHmTND/Ha5d2kC3rp/V2FpXSrhhhxTVMiwFXk130Ak9h+dKdCxfRJUg3BZUNs3Yq3PT
 vCow==
X-Gm-Message-State: AOJu0YwaH/t8EWPD2kfTmj8PLBOiVt3neveRxVmNMNVUZOc12z7Sxd/6
 tp1zMAjJCT4zSCFq75JODjdBnk6Tr0PHsttdXAapwoXjJfVvgHjt7nXjSPKrLSQzPfPoBH7UrTR
 TkJSVryqb/0ruDkNeVKXFvFypc84D
X-Received: by 2002:a17:906:8a72:b0:99b:d1cb:5add with SMTP id
 hy18-20020a1709068a7200b0099bd1cb5addmr1451234ejc.35.1692195866153; 
 Wed, 16 Aug 2023 07:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEClvCwwkJzjT3/xLqFrOuVuDQISqd1sTXWJv9Jzko1G9VG6cN7ytoLbmVcGiwK0DKG9S9g/w==
X-Received: by 2002:a17:906:8a72:b0:99b:d1cb:5add with SMTP id
 hy18-20020a1709068a7200b0099bd1cb5addmr1451218ejc.35.1692195865862; 
 Wed, 16 Aug 2023 07:24:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a170906411700b00988e953a586sm8533663ejk.61.2023.08.16.07.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 07:24:25 -0700 (PDT)
Message-ID: <b9a6493c-243b-1078-afbc-d9270cac904a@redhat.com>
Date: Wed, 16 Aug 2023 14:30:38 +0200
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <069e6cd0-abd3-fdd9-217d-173e8f8e1d29@amd.com>
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

On 8/16/23 16:05, Christian König wrote:
> Am 16.08.23 um 13:30 schrieb Danilo Krummrich:
>> Hi Matt,
>>
>> On 8/11/23 04:31, Matthew Brost wrote:
>>> In XE, the new Intel GPU driver, a choice has made to have a 1 to 1
>>> mapping between a drm_gpu_scheduler and drm_sched_entity. At first this
>>> seems a bit odd but let us explain the reasoning below.
>>>
>>> 1. In XE the submission order from multiple drm_sched_entity is not
>>> guaranteed to be the same completion even if targeting the same hardware
>>> engine. This is because in XE we have a firmware scheduler, the GuC,
>>> which allowed to reorder, timeslice, and preempt submissions. If a using
>>> shared drm_gpu_scheduler across multiple drm_sched_entity, the TDR falls
>>> apart as the TDR expects submission order == completion order. Using a
>>> dedicated drm_gpu_scheduler per drm_sched_entity solve this problem.
>>>
>>> 2. In XE submissions are done via programming a ring buffer (circular
>>> buffer), a drm_gpu_scheduler provides a limit on number of jobs, if the
>>> limit of number jobs is set to RING_SIZE / MAX_SIZE_PER_JOB we get flow
>>> control on the ring for free.
>>
>> In XE, where does the limitation of MAX_SIZE_PER_JOB come from?
>>
>> In Nouveau we currently do have such a limitation as well, but it is 
>> derived from the RING_SIZE, hence RING_SIZE / MAX_SIZE_PER_JOB would 
>> always be 1. However, I think most jobs won't actually utilize the 
>> whole ring.
> 
> Well that should probably rather be RING_SIZE / MAX_SIZE_PER_JOB = 
> hw_submission_limit (or even hw_submission_limit - 1 when the hw can't 
> distinct full vs empty ring buffer).

Not sure if I get you right, let me try to clarify what I was trying to 
say: I wanted to say that in Nouveau MAX_SIZE_PER_JOB isn't really 
limited by anything other than the RING_SIZE and hence we'd never allow 
more than 1 active job.

However, it seems to be more efficient to base ring flow control on the 
actual size of each incoming job rather than the worst case, namely the 
maximum size of a job.

> 
> Otherwise your scheduler might just overwrite the ring buffer by pushing 
> things to fast.
> 
> Christian.
> 
>>
>> Given that, it seems like it would be better to let the scheduler keep 
>> track of empty ring "slots" instead, such that the scheduler can 
>> deceide whether a subsequent job will still fit on the ring and if not 
>> re-evaluate once a previous job finished. Of course each submitted job 
>> would be required to carry the number of slots it requires on the ring.
>>
>> What to you think of implementing this as alternative flow control 
>> mechanism? Implementation wise this could be a union with the existing 
>> hw_submission_limit.
>>
>> - Danilo
>>
>>>
>>> A problem with this design is currently a drm_gpu_scheduler uses a
>>> kthread for submission / job cleanup. This doesn't scale if a large
>>> number of drm_gpu_scheduler are used. To work around the scaling issue,
>>> use a worker rather than kthread for submission / job cleanup.
>>>
>>> v2:
>>>    - (Rob Clark) Fix msm build
>>>    - Pass in run work queue
>>> v3:
>>>    - (Boris) don't have loop in worker
>>> v4:
>>>    - (Tvrtko) break out submit ready, stop, start helpers into own patch
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>
> 

