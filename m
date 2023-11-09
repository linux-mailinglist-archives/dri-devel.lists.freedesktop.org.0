Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926A77E7280
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 20:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C38610E8FB;
	Thu,  9 Nov 2023 19:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB3110E8FB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 19:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699559748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=449SuGePvATjn5tp4HyLcKrMf3SZiN0UHIQUcLzqf1M=;
 b=Bb5vzacC4glpCwpIvGANyNZN4OyEwKCr0in5nQJ93tqIsvaNnDZudZrdh2nDFvczTkqcGR
 m6JqKU2MfnRwJQThOczDeBwr/JKepes8DMQO8jBrbOPanh5V2IcLBV6JJiidIch0D8MfE3
 AE1i+7zHWGZAjbRGWo4r8u0I4EhRvAo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-fUc4GD_9NDig2cEQbc73pw-1; Thu, 09 Nov 2023 14:55:47 -0500
X-MC-Unique: fUc4GD_9NDig2cEQbc73pw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4083717431eso8780855e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 11:55:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699559746; x=1700164546;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=449SuGePvATjn5tp4HyLcKrMf3SZiN0UHIQUcLzqf1M=;
 b=iErcyXfLtWzcBEvntlsRDjYT3yGyDMolL5F9kX0wp8aCD7ARW8kBOFv9DATRFp+DWm
 jk7SvRkgYD0bZ0IUjO3fUAI/WQeOf4D9bn68yVBKP31OF9hXiUF8/4hD01FF9699noLF
 Y5M1UYSAD2IeFT/QnBEc2Mv35/nAfHatJeQbqIw9DUeX1vWMMGVk2khi3R41xhKZBgf4
 i7OmUx9b8feAEJiQRGHpJafxpTCZFJr9HoKG8NGO0+H6BIPkOonSikPPhlKgR0HAOSEk
 S3YChYVOO4ARLF1Eeb7qyv6mu5b4uzT9YfeBcA8CVTfTtTDjexNFZSoI4tPR3kxgNLhf
 SYJw==
X-Gm-Message-State: AOJu0Yy9Y0NGuWyFvXyZSM/3RbL/SCLN7uJ9D1yAEj+hxJdvcBgc4dbf
 kO8q6REVPjt4n8DXU1Karwq8XF7u56mCYtPNvPKG0hYdu7akXovaSxDfVux/DplH21e4fFQ3jYA
 UFysts13SyWmJKE+r8m8pKMKa9U+P
X-Received: by 2002:a05:600c:68a:b0:408:4475:8cc1 with SMTP id
 a10-20020a05600c068a00b0040844758cc1mr5397603wmn.35.1699559745985; 
 Thu, 09 Nov 2023 11:55:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4NKG5wB0gJEbcmArHRa0/4XU4inkMLfBR3udGHiHduQub1uThCHjG5THdPgesq8DE9mXvWQ==
X-Received: by 2002:a05:600c:68a:b0:408:4475:8cc1 with SMTP id
 a10-20020a05600c068a00b0040844758cc1mr5397593wmn.35.1699559745564; 
 Thu, 09 Nov 2023 11:55:45 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c359600b004080f0376a0sm3043990wmq.42.2023.11.09.11.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:55:45 -0800 (PST)
Message-ID: <c2c4a1e3-9a8c-4922-aecc-8894d13a8054@redhat.com>
Date: Thu, 9 Nov 2023 20:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: fix potential page fault in
 drm_sched_job_init()
From: Danilo Krummrich <dakr@redhat.com>
To: Luben Tuikov <ltuikov89@gmail.com>, airlied@gmail.com, daniel@ffwll.ch,
 christian.koenig@amd.com
References: <20231108022716.15250-1-dakr@redhat.com>
 <fff7a8db-be77-4c5e-a4dd-82b254adbb78@gmail.com>
 <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
Organization: RedHat
In-Reply-To: <242188d1-2232-4e37-8ad7-f2cdebacddd9@redhat.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 01:09, Danilo Krummrich wrote:
> On 11/8/23 06:46, Luben Tuikov wrote:
>> Hi,
>>
>> Could you please use my gmail address, the one one I'm responding from--I don't want
>> to miss any DRM scheduler patches. BTW, the luben.tuikov@amd.com email should bounce
>> as undeliverable.
>>
>> On 2023-11-07 21:26, Danilo Krummrich wrote:
>>> Commit 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable
>>> number of run-queues") introduces drm_err() in drm_sched_job_init(), in
>>> order to indicate that the given entity has no runq, however at this
>>> time job->sched is not yet set, likely to be NULL initialized, and hence
>>> shouldn't be used.
>>>
>>> Replace the corresponding drm_err() call with pr_err() to avoid a
>>> potential page fault.
>>>
>>> While at it, extend the documentation of drm_sched_job_init() to
>>> indicate that job->sched is not a valid pointer until
>>> drm_sched_job_arm() has been called.
>>>
>>> Fixes: 56e449603f0a ("drm/sched: Convert the GPU scheduler to variable number of run-queues")
>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 27843e37d9b7..dd28389f0ddd 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -680,6 +680,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>>    * This function returns -ENOENT in this case (which probably should be -EIO as
>>>    * a more meanigful return value).
>>>    *
>>> + * Note that job->sched is not a valid pointer until drm_sched_job_arm() has
>>> + * been called.
>>> + *
>>
>> Good catch!
>>
>> Did you actually get this to page-fault and have a kernel log?
> 
> No, I just found it because I was about to make the same mistake.
> 
>>
>> I'm asking because we see it correctly set in this kernel log coming from AMD,
> 
> I think that's because amdgpu just sets job->sched to *some* scheduler instance after
> job allocation [1].
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c#L108
> 
>>
>> [   11.886024] amdgpu 0000:0a:00.0: [drm] *ERROR* drm_sched_job_init: entity has no rq!
>>
>> in this email,
>> https://lore.kernel.org/r/CADnq5_PS64jYS_Y3kGW27m-kuWP+FQFiaVcOaZiB=JLSgPnXBQ@mail.gmail.com
>>
>>>    * Returns 0 for success, negative error code otherwise.
>>>    */
>>>   int drm_sched_job_init(struct drm_sched_job *job,
>>> @@ -691,7 +694,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>            * or worse--a blank screen--leave a trail in the
>>>            * logs, so this can be debugged easier.
>>>            */
>>> -        drm_err(job->sched, "%s: entity has no rq!\n", __func__);
>>> +        pr_err("%s: entity has no rq!\n", __func__);
>>
>> Is it feasible to do something like the following?
>>
>>         dev_err(job->sched ? job->sched->dev : NULL, "%s: entity has no rq!\n", __func__);
> 
> I don't think that's a good idea. Although I'd assume that every driver zero-initializes its job
> structures, I can't see a rule enforcing that. Hence, job->sched can be a random value until
> drm_sched_job_arm() is called.
> 
> However, I notice there are quite a view more fields of struct drm_sched_job that are never
> initialized, hence there are either a couple more potential bugs or missing documentation that
> drivers *must* ensure that a job is zero-initialized.

Any opinions on that? Otherwise I'd probably go ahead and send a fix for the other bugs too.

> 
> Not quite sure if we really want to rely on the latter for core infrastructure...
> 
>>
>>>           return -ENOENT;
>>>       }
>>>
>>> base-commit: c015fb6d01adb616fb54824feb55ce5ab18e8ca1
>>

