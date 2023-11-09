Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E17E6147
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 01:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1095210E88E;
	Thu,  9 Nov 2023 00:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC3910E1BB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699488579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BDCV67ZJJzj3udjDKNsHDngo8mLUTTtP7ZAGfmOzog=;
 b=T4/dNpUKwSMhXGKJHOhX1RENDJEuU4BP1VpD6l+z8VDLHPyCilmGKK0xwXME4TGKAK9GYU
 eqiuE2f0y+cZIA5yRp3No83aQlU/HuwBGXsuJvvYP/MRVUnGDU6vlSOUZk3kKsZc33WhOe
 4HA5CUWVZMEN4K6nwXtrR/lQfoLPZ6Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-K9f1mybUNrWl95XCPXblEQ-1; Wed, 08 Nov 2023 19:09:36 -0500
X-MC-Unique: K9f1mybUNrWl95XCPXblEQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-32f790a39d2so106843f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 16:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699488575; x=1700093375;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+BDCV67ZJJzj3udjDKNsHDngo8mLUTTtP7ZAGfmOzog=;
 b=iMU10HD/yPhXdlwsyP271UrdOXb53ghqhyOonKVHOoH4GRlNio8s28lF6aHAndFEL6
 65g+ngcS1UqOBtWQpGMcEcpPiPl4bM5304KnTRcC0GmgiteucIAeN3Qm7gN3U9li3vjU
 1QzUd+DcXSRYzi7jMtUbLyrndPgIxY5ZPUbwe5r3LQLxRvvJFMLE91DCTMyhJBEwrQ1q
 4X2Aj/B1MjfVbqaFzMYPJE/aC6K5PYCerNkkdETmTTo4afQwoO2QN/kfhO/YAacRvQmH
 zMgaV5+XleFzn+6W+JvBueAgSeXD4tTJunxTIpgVFOrZQkmpuZLAZ83eD9CgOHvMcqmN
 1KfA==
X-Gm-Message-State: AOJu0YzNJJRvxboKDMb2abXNyWXftRqZ1UqIWamPVqERzWGWrz/WBjqh
 QTnwIXA/W9n7NhL6tGV0gFC4YHXO+wVYfTsMEaYkUgPL7L6+aCOn0irIJUGA965xl9X+3ABdnvs
 JwLPvAnP9QU94IBc3hDcyNu5DmzPc
X-Received: by 2002:a5d:6da2:0:b0:32f:8ace:f0b7 with SMTP id
 u2-20020a5d6da2000000b0032f8acef0b7mr3748253wrs.12.1699488575201; 
 Wed, 08 Nov 2023 16:09:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUAVT/jN+LlNSuyCU1pMvZ0q3i4Ug9qHBMHGhKW0QD7oqx2iJ3jNbf4SmDR+MVnr34xh2jkw==
X-Received: by 2002:a5d:6da2:0:b0:32f:8ace:f0b7 with SMTP id
 u2-20020a5d6da2000000b0032f8acef0b7mr3748243wrs.12.1699488574847; 
 Wed, 08 Nov 2023 16:09:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a0560001b0900b0032db430fb9bsm6011061wrz.68.2023.11.08.16.09.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 16:09:34 -0800 (PST)
Message-ID: <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
Date: Thu, 9 Nov 2023 01:09:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
To: Luben Tuikov <ltuikov89@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/23 06:46, Luben Tuikov wrote:
> Hi,
> 
> Could you please use my gmail address, the one one I'm responding from--I don't want
> to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com email should bounce
> as undeliverable.
> 
> On 2023-11-07 21:26, Danilo Krummrich wrote:
>> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable
>> number of run-queues") introduces drm_err() in drm_sched_job_init(), in
>> order to indicate that the given entity has no runq, however at this
>> time job->sched is not yet set, likely to be NULL initialized, and hence
>> shouldn't be used.
>>
>> Replace the corresponding drm_err() call with pr_err() to avoid a
>> potential page fault.
>>
>> While at it, extend the documentation of drm_sched_job_init() to
>> indicate that job->sched is not a valid pointer until
>> drm_sched_job_arm() has been called.
>>
>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 27843e37d9b7..dd28389f0ddd 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>    * This function returns -ENOENT in this case (which probably should be -EIO as
>>    * a more meanigful return value).
>>    *
>> + * Note that job->sched is not a valid pointer until drm_sched_job_arm() has
>> + * been called.
>> + *
> 
> Good catch!
> 
> Did you actually get this to page-fault and have a kernel log?

No, I just found it because I was about to make the same mistake.

> 
> I'm asking because we see it correctly set in this kernel log coming from AMD,

I think that's because amdgpu just sets job->sched to *some* scheduler instance after
job allocation [1].

[1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L108

> 
> [   11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched_job_init: entity has no rq!
> 
> in this email,
> https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=JLSgPnXBQ@mail.gmail.com
> 
>>    * Returns 0 for success, negative error code otherwise.
>>    */
>>   int drm_sched_job_init(struct drm_sched_job *job,
>> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>   		 * or worse--a blank screen--leave a trail in the
>>   		 * logs, so this can be debugged easier.
>>   		 */
>> -		drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>> +		pr_err("%s: entity has no rq!\n", __func__);
> 
> Is it feasible to do something like the following?
> 
> 		dev_err(job->sched ? job->sched->dev : NULL, "%s: entity has no rq!\n", __func__);

I don't think that's a good idea. Although I'd assume that every driver zero-initializes its job
structures, I can't see a rule enforcing that. Hence, job->sched can be a random value until
drm_sched_job_arm() is called.

However, I notice there are quite a view more fields of struct drm_sched_job that are never
initialized, hence there are either a couple more potential bugs or missing documentation that
drivers *must* ensure that a job is zero-initialized.

Not quite sure if we really want to rely on the latter for core infrastructure...

> 
>>   		return -ENOENT;
>>   	}
>>   
>>
>> base-commit: c015fb6d01adb616fb54824feb55ce5ab18e8ca1
> 

