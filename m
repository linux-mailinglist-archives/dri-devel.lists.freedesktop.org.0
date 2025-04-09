Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED974A826CC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 15:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA9110E8CD;
	Wed,  9 Apr 2025 13:55:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mBHVpzi1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3110010E8CA;
 Wed,  9 Apr 2025 13:55:06 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3913958ebf2so6056781f8f.3; 
 Wed, 09 Apr 2025 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744206905; x=1744811705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kO32TsjGJaDwkdrneW/05FyiQbBo7obTRsjfSXKR83o=;
 b=mBHVpzi1gs2ZElVS0jhYvlQph0hGXX8ZYURIgK2pE5QPSg0vRvj9885UXYEd21pJse
 Dv2rp4ijRWVZxarpSuzPs6pho/dcIU16DpNagXEQLXLvvUzz2i5pxKlta3jWUxE9N7A4
 u1OQW4shDFPLOPmHgpPZHu1BbQoN0hnq1y5wjY4/IUYhwCuzj0CgK/EiOsqkyn4XG/57
 cHAmIiRfgWzTlbm4B/fVAzUCarfrf8QRJpEjqkHkeYb58XVcUmZUHEPR8gBsE4opAH+R
 M2keHbTkjxkFut0aBjN19ePo/WmGTY3eJAFQ0XovGZ0endTIkBZL3/7UW/updzSE9Tsh
 bqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744206905; x=1744811705;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kO32TsjGJaDwkdrneW/05FyiQbBo7obTRsjfSXKR83o=;
 b=G2pM4RTRK7gOI2L3kqbPSbQF3HvHvFK2NayggBT3YL50le34JtyWQBZF/Yyiki9PzW
 frRGBRTboKkH5x/jJ0mEV1vzny+2OyrzxCjP+0MgtytEngRbf7Mrb0YJ9NLe7ztd/4Ub
 rxwuOv/31CvB3YBRBStoqGrDY9oXDol7tMC6+dwVqBM9uW727fKgm5hTgP4rOrw29XiI
 pRz42UoxcA/E5HVRwTppNip7gWgxvtPIGaI5iqWWd24W6cxizJr5erC883QoLLJ8APnZ
 6FAwUiM4EjXSVnzjD3xKvy/CNOCIyD+9afWppd1MBdwm28NUf6FRxaV4uSsF0EYXECGH
 A1pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfihrVx9Ajx8UcZAX0laiwkdg9aZ/S3bytBTFtS250rfcPHqY2yvID8x6J6pCPIYPnrTlsXmOL@lists.freedesktop.org,
 AJvYcCXCh8xvtnf1SNc4Tvkaux2F3U89oBfxdCNEHxdf14d7RmXgJUxtw6wU5Uls3jvnLJCeXRrFjR43b/yf@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQFXa1pJewU/8ZqKYTfukISRhBwmzYc15tp3Mz2J6k/u453A2V
 fsRgWLyYRaI/KQ0p9CTWz2n7hxpuA6yW9zRrp/BgziXbW0Ld6RFv
X-Gm-Gg: ASbGncunX81la0eO+4wO/Ek44AZRx46KKND1C5wfmf1qcj1OgXPJ1KJLA0fPfyW3j+7
 bDK0gGV6HneW46p9GmpYgLQxOTiC7WU3GsLRgtFGyPLYMkS3ky9mgq5952BudMbberQZSfcYKLp
 W5n7qMiXL+slWw7keSvy+g/n7vZkyPhiHVQyFMsnU4Wv4kBBONyGCV+CydTU8Rdu3kSf9vfHuXo
 cySOw8exUVxE32rK7J8h3JifuH43OJzk0+aPDd0pxrW8jPOYp6IHLV85P/6fSWrapHYa8p1RWbB
 FD5asksg2OO62UC4P89o7gULyYHg8QqsIWCZGRGDaSXJOoI1F0NULnE5snHQmbL5jEVF2tlrJYZ
 qBwEC
X-Google-Smtp-Source: AGHT+IETub3WH2124sgzIzSNbJGv/sM4qtu5ztzqI+7EzvjsIht1Rs/N7WUGb+5zRhJPZHJoiedvbw==
X-Received: by 2002:a05:6000:1867:b0:38f:28dc:ec23 with SMTP id
 ffacd0b85a97d-39d87aa8294mr2390763f8f.19.1744206904475; 
 Wed, 09 Apr 2025 06:55:04 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f204c500bsm21820855e9.0.2025.04.09.06.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 06:55:03 -0700 (PDT)
Message-ID: <c2ed3d7e-d5c3-4d74-8365-fdb3f46f6a3a@gmail.com>
Date: Wed, 9 Apr 2025 15:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots v2
To: phasta@kernel.org, tvrtko.ursulin@igalia.com, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20250321155852.15162-1-christian.koenig@amd.com>
 <867c3abac8a222fa42921a6725e85fe459bc9d5e.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <867c3abac8a222fa42921a6725e85fe459bc9d5e.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
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

Am 09.04.25 um 12:28 schrieb Philipp Stanner:
> On Fri, 2025-03-21 at 16:58 +0100, Christian König wrote:
>> Sometimes drivers need to be able to submit multiple jobs which
>> depend on
>> each other to different schedulers at the same time, but using
>> drm_sched_job_add_dependency() can't fail any more after the first
>> job is
>> initialized.
>>
>> This function preallocate memory for dependency slots so that no
>> ENOMEM
>> can come later while adding dependencies.
>>
>> v2: rework implementation an documentation
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 44
>> ++++++++++++++++++++++++--
>>  include/drm/gpu_scheduler.h            |  2 ++
>>  2 files changed, 43 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 4d4219fbe49d..ee3701f346b2 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -852,6 +852,39 @@ void drm_sched_job_arm(struct drm_sched_job
>> *job)
>>  }
>>  EXPORT_SYMBOL(drm_sched_job_arm);
>>  
>> +/**
>> + * drm_sched_job_prealloc_dependency_slots - avoid ENOMEM on adding
>> dependencies
>> + * @job: scheduler job where dependencies will be added
>> + * @num_deps: number of dependencies to preallocate slots for
>> +  *
>> + * Sometimes drivers need to be able to submit multiple jobs which
>> depend on
>> + * each other to different schedulers at the same time, but using
>> + * drm_sched_job_add_dependency() can't fail any more after the
>> first job is
>> + * initialized.
>> + *
>> + * This function preallocate memory for dependency slots so that no
>> ENOMEM can
>> + * come later while adding dependencies.
>> + *
>> + * Return:
>> + * 0 on success, or an error on failing to expand the array.
>> + */
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>> *job,
>> +					    unsigned int num_deps)
>> +{
>> +	u32 id = 0;
>> +	int ret;
>> +
>> +	while (num_deps--) {
>> +		ret = xa_alloc(&job->dependencies, &id,
>> XA_ZERO_ENTRY,
>> +			       xa_limit_32b, GFP_KERNEL);
> I've had some time to re-read the xarray documentation and I think that
> this is what xa_reserve() was born for. The Book of Documentation/core-
> api/xarray.rst sayeth:
>
> "Sometimes you need to ensure that a subsequent call to xa_store()
> will not need to allocate memory.  The xa_reserve() function
> will store a reserved entry at the indicated index.  Users of the
> normal API will see this entry as containing ``NULL``."
>
> That's far better, this way we don't have to use that more or less
> xarray-internal flag.

Yeah I have seen that as well. The reason why I didn't followed this route was that I wasn't sure if I then need to check for NULL entries while iterating over the XA.

Additional to that I couldn't figure out of hand how to determine a the next free index slot.

Have you found any example how to use that? I mean the documentation could certainly be improved a bit.

Regards,
Christian.

>
>
>> +		if (ret != 0)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_prealloc_dependency_slots);
>> +
>>  /**
>>   * drm_sched_job_add_dependency - adds the fence as a job dependency
>>   * @job: scheduler job to add the dependencies to
>> @@ -878,10 +911,15 @@ int drm_sched_job_add_dependency(struct
>> drm_sched_job *job,
>>  	 * engines involved, rather than the number of BOs.
>>  	 */
>>  	xa_for_each(&job->dependencies, index, entry) {
>> -		if (entry->context != fence->context)
>> +		if (xa_is_zero(entry)) {
>> +			/*
>> +			 * Reserved entries must not alloc memory,
>> but let's
>> +			 * use GFP_ATOMIC just to be on the
>> defensive side.
>> +			*/
>> +			xa_store(&job->dependencies, index, fence,
>> GFP_ATOMIC);
> And regarding this – it can actually never happen, but you provide
> ATOMIC just to be sure?
>
> I think it would be better if we'd just run into an obvious bug here
> instead, so like a deadlock with GFP_KERNEL.
>
> That's how we do it with pointers that cannot be NULL, too. If the
> impossible were to happen and it were NULL, we'd crash.
>
> P.
>
>> +		} else if (entry->context != fence->context) {
>>  			continue;
>> -
>> -		if (dma_fence_is_later(fence, entry)) {
>> +		} else if (dma_fence_is_later(fence, entry)) {
>>  			dma_fence_put(entry);
>>  			xa_store(&job->dependencies, index, fence,
>> GFP_KERNEL);
>>  		} else {
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 1a7e377d4cbb..916e820b27ff 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -632,6 +632,8 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>  		       u32 credits, void *owner);
>>  void drm_sched_job_arm(struct drm_sched_job *job);
>>  void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>> +int drm_sched_job_prealloc_dependency_slots(struct drm_sched_job
>> *job,
>> +					    unsigned int num_deps);
>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>  				 struct dma_fence *fence);
>>  int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,

