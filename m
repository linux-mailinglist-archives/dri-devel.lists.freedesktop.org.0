Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F90D7A55F3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 00:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA94010E138;
	Mon, 18 Sep 2023 22:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2BE10E138
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 22:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695077668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9f0yv/S9UHSEkV9Zr6cqv1t64ii4PCwk3VFGZAoSnlA=;
 b=hYA3TQwYVaXgjBige6HoSuKtnY+HvyWdOgc1W+su3iH5mvKYl10vTrBIa0wQIghfAQSwZ+
 jtd9KuGb1aua+nXjoN8peRv45CvmO8KA3p+Nr1yse+3sPa/TY/NZsFnTCd/l2UX1jcGTA2
 gA2ALazD1Fk0QLTW+Q32ha0PVFTRcfc=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-TsngmpSyPl2NB8nznDIAaA-1; Mon, 18 Sep 2023 18:54:27 -0400
X-MC-Unique: TsngmpSyPl2NB8nznDIAaA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2bffe368ae3so21771931fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 15:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695077666; x=1695682466;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9f0yv/S9UHSEkV9Zr6cqv1t64ii4PCwk3VFGZAoSnlA=;
 b=i5dYMcLSkgGc9JeOiN0TMxBxoNGPYsvCt3NaA9YGy5qXBZ+iadKooFTAUyk5cB8CiY
 PyC2HzRA47fre7kj2XxxD7eXxFZ+39+npYjK+iC893OJdGQJLJScQ5UYQtYh/iLiWzsO
 S3D7PcQORkP1Okj1jQwpLKHekeNC1soSoWTA6AoTIrDs3o8SOu4swHedkt9MCrWqoFkp
 3f2Nujx9+RwRrhiRUl7viI3WWWEwjD/o2X58ueYH40+7ERk4MDh1jsJAuTZTFV3l1Hsr
 DEyYkw0TK31IzjQyT0SYNf6rXSsY/ueIm+yGBG5lTOvnHXWTtjba869f//dwe6D5jmTQ
 nl2w==
X-Gm-Message-State: AOJu0YzBqVR7qxBhB5ghZAyXqSBMlzM8w/Evu6aZmNPip+t9QnezUu6T
 0IjV9MAwstHk7YSyqP5ikZYalPNEM6y2KgN9OKdcHY9HBeRvU67nWSRnFxtH0wiBM6ksR2TrRlq
 /p8sWeJuJRGAsKWh7fTjgPrGdOpVd
X-Received: by 2002:a2e:9783:0:b0:2b6:df23:2117 with SMTP id
 y3-20020a2e9783000000b002b6df232117mr9362964lji.43.1695077665823; 
 Mon, 18 Sep 2023 15:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMe2Aji3GYAwmI29Ffub232eEVZ6AFsIcTLMXhl5PXfW+G/EHpSkbpwLrP2auyuIdB/uVO4A==
X-Received: by 2002:a2e:9783:0:b0:2b6:df23:2117 with SMTP id
 y3-20020a2e9783000000b002b6df232117mr9362959lji.43.1695077665467; 
 Mon, 18 Sep 2023 15:54:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 rp9-20020a170906d96900b0099e05fb8f95sm6959032ejb.137.2023.09.18.15.54.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 15:54:25 -0700 (PDT)
Message-ID: <160309f7-060a-fe15-7ba8-98fd2f3865f7@redhat.com>
Date: Tue, 19 Sep 2023 00:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH] drm/nouveau: sched: fix leaking memory of
 timedout job
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
References: <20230916162835.5719-1-dakr@redhat.com>
 <c938aabcd97eb6b118ed853799a30c729ec3eafa.camel@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <c938aabcd97eb6b118ed853799a30c729ec3eafa.camel@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/23 00:19, Lyude Paul wrote:
> BTW - Would you like me to review work like this? I'm totally happy to do
> that, although I'm not terribly familiar with these parts of nouveau/drm (but
> I'm always willing to learn, and would like to know more about these areas
> anyway :)

Of course, that's absolutely welcome. :)

> 
> …if the answer is yes, this patch looks fine to me so far - I guess the one
> question I have that might have an obvious answer - how are jobs without an
> job->ops->timeout callback cleaned up?

Currently there are only two types of jobs, EXEC jobs and VM_BIND jobs.
EXEC jobs do have the callback, where on timeout the fence context is killed and
hence pending fences for this channel are signaled with an error code. Queued up
jobs from the channel's corresponding entity are discarded.

VM_BIND jobs still execute on the CPU and can't really time out. Well, technically, they
actually could, since drm_sched_job_begin() is called before the run_job() callback.
However, this would require mapping / unmapping stuff taking an absolutely unreasonable
amount of time. But even then it'd be safe because drm_sched_stop() would block until
the run_job() callback returns and subsequently the job would be cleaned up by
drm_sched_stop() since we'd pass it to drm_sched_stop() as 'bad' job.

However, I'm also working on a series [1] to make use of the DRM_SCHED_POLICY_SINGLE_ENTITY
work from Matt [2] in order to properly support the firmware scheduler.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/commits/sched-single-entity/
[2] https://lore.kernel.org/dri-devel/20230912021615.2086698-1-matthew.brost@intel.com/

> 
> On Sat, 2023-09-16 at 18:28 +0200, Danilo Krummrich wrote:
>> Always stop and re-start the scheduler in order to let the scheduler
>> free up the timedout job in case it got signaled. In case of exec jobs
>> the job type specific callback will take care to signal all fences and
>> tear down the channel.
>>
>> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_exec.c  |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_sched.c | 12 +++++++++---
>>   2 files changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
>> index 9c031d15fe0b..49d83ac9e036 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
>> @@ -185,7 +185,7 @@ nouveau_exec_job_timeout(struct nouveau_job *job)
>>   
>>   	nouveau_sched_entity_fini(job->entity);
>>   
>> -	return DRM_GPU_SCHED_STAT_ENODEV;
>> +	return DRM_GPU_SCHED_STAT_NOMINAL;
>>   }
>>   
>>   static struct nouveau_job_ops nouveau_exec_job_ops = {
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> index 88217185e0f3..3b7ea5221226 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -375,14 +375,20 @@ nouveau_sched_run_job(struct drm_sched_job *sched_job)
>>   static enum drm_gpu_sched_stat
>>   nouveau_sched_timedout_job(struct drm_sched_job *sched_job)
>>   {
>> +	struct drm_gpu_scheduler *sched = sched_job->sched;
>>   	struct nouveau_job *job = to_nouveau_job(sched_job);
>> +	enum drm_gpu_sched_stat stat = DRM_GPU_SCHED_STAT_NOMINAL;
>>   
>> -	NV_PRINTK(warn, job->cli, "Job timed out.\n");
>> +	drm_sched_stop(sched, sched_job);
>>   
>>   	if (job->ops->timeout)
>> -		return job->ops->timeout(job);
>> +		stat = job->ops->timeout(job);
>> +	else
>> +		NV_PRINTK(warn, job->cli, "Generic job timeout.\n");
>> +
>> +	drm_sched_start(sched, true);
>>   
>> -	return DRM_GPU_SCHED_STAT_ENODEV;
>> +	return stat;
>>   }
>>   
>>   static void
> 

