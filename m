Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A1AB83B0
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE75A10E20D;
	Thu, 15 May 2025 10:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="tCGVm1tm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2C110E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:22:12 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so3947445e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 03:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747304531; x=1747909331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tra52DHq39mqk+jFOeYMb7Z3ZzaJA5WY51V1VxllvVM=;
 b=tCGVm1tmeHndrvjbWy/muOtcDZZbow18Fn/VCnzj54S/L8UIAJcESNu75XJ6+Fzhyq
 m5o5EqmWFgyyp/lUE4qeRBYpjIXASzVdm4Su2jOF4/Gc3l9wfWaFXuqTpSWwkCabYg27
 +wFeXBPgMK7934ZF/2K65UkXoWloyXlSVbe2risy/t15FGHPuBmk7TZUXYfC84gOmpqJ
 /6utHmjqBY6hAowcHz8uO4fDZot+BnsalH7kgup1PQnfjtJRpjaafvNOt5idq7GaoIsu
 D9jvR8I++Lmo3Hpf7skTyJUNSEtpc+2NzcsOO0QX566kLOV2e9ALkgjl3VKv7ng6LeqB
 D2YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747304531; x=1747909331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tra52DHq39mqk+jFOeYMb7Z3ZzaJA5WY51V1VxllvVM=;
 b=QhQZAoCkK+a/mCp2BYF8S9iet3XikhKLF7SAB0kwxu2oEU5+9Mksml0A5M+TLaz6bW
 BvQmN/o0uD1LuojnuuEyHS6lpvoW5Qf4/GIjaYhAZHDwBvCitlzHc48QWt+68urpJguu
 +5JT0wagll+ZJd6q94gJkFqhLHelpxxCWwjmnHkVuCDtaZoPEYtvKs6u6VbjoZkGp6Ic
 kQy0sndA0+PSYMZlq35Q8UqdHHvu6HkqGsj8wwqIcxdBtSslf5UopFo6a6cY+T4q/V45
 F7M7xQr4vepMdHW2zJT30WcwSi6xAdDtS6nITsqMEQs8uRBNjGvlfftp3n4in+onHm/8
 JBRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq1eDHPzVk9x/TQdTYzShSQQO3Yg49N8hZ1NGaLsxwI2FpZvMpePsZ/kWDoWU2XxNcOxYN9nnhQyo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIxB5xpiSVZ4wpd3k8q6zrjUcwC06bvLg5nAoCK/lZqiO6GOQb
 qKBdkdKdd0LYxWIg0tAMmQR5JC3xhzzNrK/2uKOD/4Ir5qvGYAzZTzQA2uOxQBU=
X-Gm-Gg: ASbGncueKQpC4Hi+jGE1h7Gg7bixAXJHeCMctMilyeSD8wzpnWTrth9wwihWqFFyWRj
 FYBB8ujYunsTZiaZIzBj9qMPu8icF+LiS1hgYJ9ArsBter4y/g0jio+TfMvfgaN6lS3QNI7Z+Bi
 OyZfOp6yH4nou//9fO+R0ZCJ07NaqcgoCH6f/HS+bm2xgw1zECX1R+xMNqnJDvGEvXwfrpK/+p3
 J9VLyAvhBvU3BZcz0auFQSyRxynmNZ42bzibIWtM42rzJ3DDKtBKMRe2TSUn49Gq+n4XK+j6gVL
 yPm/EnRyhAeNz1+2ydOrDf9slm2dk2hzMHW0h1qPTP1oEQRwzea40NwKZtvzUWrwJw==
X-Google-Smtp-Source: AGHT+IGsy+SLrGfG0F/rt7qHUmzvLD5L5eZtbKBx4gNtZP24EJzr+0e7+uq+C5ZJFa9/sxQZcMLLUg==
X-Received: by 2002:a05:600c:c0d2:20b0:442:f482:c421 with SMTP id
 5b1f17b1804b1-442f482c78emr27010095e9.22.1747304530789; 
 Thu, 15 May 2025 03:22:10 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecccbsm22466120f8f.32.2025.05.15.03.22.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 03:22:10 -0700 (PDT)
Message-ID: <6f55b934-ae02-45f0-b285-eb22283b7d3f@ursulin.net>
Date: Thu, 15 May 2025 11:22:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org, aamd-gfx@lists.freedesktop.org
Cc: haijun.chang@amd.com, zhenguo.yin@amd.com,
 Danilo Krummrich <dakr@kernel.org>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 15/05/2025 10:05, Philipp Stanner wrote:
> On Thu, 2025-05-15 at 10:48 +0200, Christian König wrote:
>> Explicitly adding the scheduler maintainers.
>>
>> On 5/15/25 04:07, Lin.Cao wrote:
>>> Previously we only signaled finished fence which may cause some
>>> submission's dependency cannot be cleared the cause benchmark hang.
>>> Signal both scheduled fence and finished fence could fix this
>>> issue.
> 
> Code seems legit to me; but be so kind and also pimp up the commit
> message a bit, Christian. It's not very clear what the bug is and why
> setting the parent to NULL solves it. Or is the issue simply that the
> fence might be dropped unsignaled, being a bug by definition? Needs to
> be written down.
> 
> Grammar is also a bit too broken.
> 
> And running the unit tests before pushing is probably also a good idea.

I believe we even have DRM rules that state unit tests coverage should 
even be added when fixing issues in the component which has unit tests. ;)

"""
KUnit Coverage Rules
~~~~~~~~~~~~~~~~~~~~

KUnit support is gradually added to the DRM framework and helpers. 
There's no
general requirement for the framework and helpers to have KUnit tests at the
moment. However, patches that are affecting a function or helper already
covered by KUnit tests must provide tests if the change calls for one.
"""

So a new variant similar to drm_sched_basic_entity_cleanup() would be 
very welcomed.

Regards,

Tvrtko

> 
>>>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
> 
> Acked-by: Philipp Stanner <phasta@kernel.org>
> 
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Danilo & Philipp can we quickly get an rb for that? I'm volunteering
>> to push it to drm-misc-fixes and add the necessary stable tags since
>> this is a fix for a rather ugly bug.
>>
>> Regards,
>> Christian.
>>
>>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index bd39db7bb240..e671aa241720 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -176,6 +176,7 @@ static void
>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>   {
>>>   	struct drm_sched_job *job = container_of(wrk,
>>> typeof(*job), work);
>>>   
>>> +	drm_sched_fence_scheduled(job->s_fence, NULL);
>>>   	drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>   	WARN_ON(job->s_fence->parent);
>>>   	job->sched->ops->free_job(job);
>>
> 

