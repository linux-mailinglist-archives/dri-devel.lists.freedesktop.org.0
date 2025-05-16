Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219EAB9B7F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 13:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1085510E135;
	Fri, 16 May 2025 11:53:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="DMmoEwQB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A95610E122
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 11:53:23 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so9438245e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747396402; x=1748001202;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ch/Rj/4SdVJXjJR99ndnnvzfGLGPgBeB9n9xS7Ien3E=;
 b=DMmoEwQBEO3HDYDU23xvNv8Jl6wRraU59uPG7gv4Eh6L9SH6Uy/nYFRDl9OiFlSVYM
 zQJRzX/TywMSolUVro0A72YnhUL2pFoB3Hn28tuG8iMmhdv3m6KNs6C96TSf6uAxyAvy
 9BxSKGOP3dzmOMfMfJluvnaXtesQZ/WahBMyA7/JkD/fas9nHIRZzCCjtKO4ZKiy0OcW
 OwCu4sLDAw92zFjhHXN9kSnCycP/RTlvMolNm8p66xC96Gb87hLWPQ0D+lhHK5JNlAqN
 UoBfSkfVSdR9haLCu+dqE966yrlmNixwPunZGeDoET0yAhgc1Sqs7kFKOIDoFRQkRCg/
 ayUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747396402; x=1748001202;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ch/Rj/4SdVJXjJR99ndnnvzfGLGPgBeB9n9xS7Ien3E=;
 b=LMczHbTDFbblCei7kzxi/O1X4vZwI0/Xe/dgf22eQKaXvACGbInnkSuEblt7hbdGXw
 hflU1mrqvVnneiQZefIJcoeG+cTFf6fm5tQR2jUAdJEIw/aoHOltdoFd+dQW4WwYrwKm
 Fv8ewN76FIN4LxaGNf1DzWo/hZSDkS4+K+omt2VONc35EYeSu43EpuRLk72VLZBIagT/
 HfsI89HM8Npaz6KdaIAOSSpECK2U3zQ4Rt19VmqH/lUpaB+BnJbgKaLj/ihFATGABQk9
 qjJCknILB4ILB/SoGX5HQ4Cm5spEYOQ/2kfdqZCzhOYo1kcHfu/pxgoH3WjholoXh4Gh
 8a7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3YCkDxwVYrxbLj9C2d31ksmVHcnsgZn6g+fVmzv7cxZzAJ8N18QKAenqWqlJM6/iOfnuC1CDxcG0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy73I378K+wM62JU2OwR+mWgOxDhflBgcndWkbc74sDy+3x+D8d
 notTFBzl8EZc4jxBv00Tk5hAMDKDLFh5fibb+ylM3mofDp2Ybb7pT3z284bG0f2S3D8=
X-Gm-Gg: ASbGncuwVB60cuHo6fg4+bJbu3a1Qc45D6QeTaMSUeSSTioDzM9Lxk82+SwY+EZtrEf
 Rq9vUMMDH4NRTM7oQ2gZBnjqXU+V4jCUEESfL3lYI+guHsmRYybtJt4pYapERi6V4CDycfkNZSH
 f6fVCcBdMUwN5JuFtIY1KQpj6ny6CXrVuZjMBjkPNikq+pm0zHSy0jdL1eMUDVyvQtXIoQ+sTbm
 YkQ9oR02Eo54FYe2D9pV42uLK38kCgma6vS+/nd1Gppcp3/4zXZ50dZQlhPGysXF94j7+f9+FJe
 HLjeaClx04YBvmDlpOuId5735OwKYen5qAYxdXu/sWZ+FDVu9Zy79BPojsoM9N+s7cF99o1H0gk
 j
X-Google-Smtp-Source: AGHT+IHQsiIPvOFAJlqSMsIWnhuK/gUiucGTkaZKv3CGdN8sUyHAnOxOXDFebOG3iH+aAxlsz6g+fg==
X-Received: by 2002:a05:600c:1e87:b0:43d:585f:ebf5 with SMTP id
 5b1f17b1804b1-442fd60b4c2mr28328285e9.1.1747396401644; 
 Fri, 16 May 2025 04:53:21 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442ebda7d2csm73546695e9.3.2025.05.16.04.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 04:53:20 -0700 (PDT)
Message-ID: <6e5ab077-77ff-443b-b345-7d99fcd01a73@ursulin.net>
Date: Fri, 16 May 2025 12:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: add drm_sched_prealloc_dependency_slots v3
To: phasta@kernel.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <ckoenig.leichtzumerken@gmail.com>, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, amd-gfx@lists.freedesktop.org
References: <20250515150038.4615-1-christian.koenig@amd.com>
 <20250515150038.4615-2-christian.koenig@amd.com>
 <a5e53b34-c247-4193-b4ab-551693ad089a@ursulin.net>
 <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <5c93f114a58e84796f239b9e0f4a13e9c223e45b.camel@mailbox.org>
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


On 16/05/2025 08:28, Philipp Stanner wrote:
> On Thu, 2025-05-15 at 17:17 +0100, Tvrtko Ursulin wrote:
>>
>> On 15/05/2025 16:00, Christian König wrote:
>>> Sometimes drivers need to be able to submit multiple jobs which
>>> depend on
>>> each other to different schedulers at the same time, but using
>>> drm_sched_job_add_dependency() can't fail any more after the first
>>> job is
>>> initialized.
>>>
>>> This function preallocate memory for dependency slots so that no
>>> ENOMEM
>>> can come later while adding dependencies.
>>>
>>> v2: rework implementation an documentation
>>> v3: rework from scratch, use separate function to add preallocated
>>> deps
> 
> I think we agreed to not put change logs into commit messages anymore
> :)
> 
> They aren't useful for any reader. Who needs the changelog afterwards
> can retreive it through the mail thread link that we add.
> 
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/scheduler/sched_main.c | 45
>>> ++++++++++++++++++++++++++
>>>    include/drm/gpu_scheduler.h            |  4 +++
>>>    2 files changed, 49 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index f7118497e47a..b95e7089aa70 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -858,6 +858,51 @@ void drm_sched_job_arm(struct drm_sched_job
>>> *job)
>>>    }
>>>    EXPORT_SYMBOL(drm_sched_job_arm);
>>>    
>>> +/**
>>> + * drm_sched_job_prealloc_dependency_slot - avoid ENOMEM on adding
>>> dependencies
>>> + * @job: scheduler job where dependencies will be added
>>> + * @id: id for the allocated slot
>>> +  *
>>> + * Sometimes drivers need to be able to submit multiple jobs which
>>> depend on
>>> + * each other to different schedulers at the same time, but using
>>> + * drm_sched_job_add_dependency() can't fail any more after the
>>> first job is
>>> + * initialized.
>>> + *
>>> + * This function preallocate memory for a dependency slot so that
>>> no ENOMEM can
>>> + * come later while adding dependencies. The index of the
>>> preallocated slot is
>>> + * returned in @id.
>>> + *
>>> + * Return:
>>> + * 0 on success, or an error on failing to expand the array.
>>> + */
>>> +int drm_sched_job_prealloc_dependency_slot(struct drm_sched_job
>>> *job,
>>> +					   u32 *id)
>>> +{
>>> +	return xa_alloc(&job->dependencies, id, NULL,
>>> xa_limit_32b, GFP_KERNEL);
>>> +}
>>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slot);
>>> +
>>> +/**
>>> + * drm_sched_job_add_prealloc_dep - add dependency to preallocated
>>> slot
>>> + * @job: scheduler job where dependencies will be added
>>> + * @id: the preallocated slot index
>>> + * @fence: the dependency to add
>>> + *
>>> + * Consumes @fence and adds it to the preallocated slot
>>> dependency.
>>> + */
>>> +void drm_sched_job_add_prealloc_dep(struct drm_sched_job *job, u32
>>> id,
>>> +				    struct dma_fence *fence)
>>> +{
>>> +	fence = xa_store(&job->dependencies, id, fence,
>>> GFP_ATOMIC);
>>
>> Add assert that the passed id exists (was preallocated) and is NULL?
> 
> You

Hm?

>>
>> Also, if someone preallocates and does not consume the slot will that
>> confuse the iteration in drm_sched_job_dependency()?
> 
> drm_sched_job_add_dependency() you mean.

I was actually thinking of drm_sched_job_dependency() because that 
looked it would skip dependencies upon encountering an unconsumed 
preallocated slot, but yes, drm_sched_job_add_dependency() could explode 
even earlier if adding a normal dependency after preallocating a slot.

> Yes, it would. All operations simply give you NULL for those slots. So
> seems to me you have to check for NULL wherever a preallocated slot
> might drop out. That would then be a bug.
> 
> It's kind of tricky, all that. It's a pity that Wilcox didn't answer
> our questions about the idiomatic way to do it.
> 
> Maybe reserving slots with already signaled fences wasn't such a bad
> idea after all?
> 
> If we go for the NULL approach, it's probably the only sane way to then
> check for NULL wherever dependencies are accessed :(
> 
> Opinions?

Well if the xarray API returns the NULL consistently the approach from 
this patch is fine I think.

We just need to add two more checks to the above mentioned functions, 
some more unit tests probably to make sure, and that should be fine for now.

On the bikeshedding front I would perhaps suggest:

  - drm_sched_job_preallocate_dependency()
  - drm_sched_job_replace_dependency()

Reads a little bit more aligned with the rest of the API and a bit 
easier on the eyes, to my eyes at least.

Regards,

Tvrtko

