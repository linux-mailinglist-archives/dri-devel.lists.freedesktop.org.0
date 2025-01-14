Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC140A104B4
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A11A10E055;
	Tue, 14 Jan 2025 10:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eIrDI5J/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA85010E055
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UIslr+PwZqivEPymyx1WnsNjg8+wyqT81QkJ3FFZpQc=; b=eIrDI5J/yHa+nPEOFQvaWDaQo/
 MUm3fnfphSKBPo2J7pluqRzXFZA37am1dt48UvGCbjC6JjlX+U89Msqz3J45iZ+OZLA+q4tYTUFRF
 gZUzmW02Z/W/HO74UvwNIyfh3zbFkXWAFcs/UhvaHSior2Ggb3CDQCBY6zl4CPChzpVJ7rOSl5Fte
 Jk5MzCwRGepjvgznljy7MVTWGIWLObWBiTq0ho6NOLCwdkgTwF0sAB3McuI7KQufC3JKaq0BODnU6
 O55r53QtkVvDReU+c46Cq99xpCiBCZ5jN6sBhOANOiXLPy3E7STK5QZspPJLafq+pSfmEKR52GE4v
 rjrw/rOQ==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tXeZN-00FbgE-0C; Tue, 14 Jan 2025 11:54:49 +0100
Message-ID: <2806edc1-d290-4c65-a978-7a49fd8fdaa4@igalia.com>
Date: Tue, 14 Jan 2025 10:54:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: Add helper to check job dependencies
To: Danilo Krummrich <dakr@kernel.org>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Matt Coster <matt.coster@imgtec.com>,
 dri-devel@lists.freedesktop.org
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
 <c00fb7af-4e13-4e35-8a34-b5fd0083381c@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c00fb7af-4e13-4e35-8a34-b5fd0083381c@kernel.org>
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


Hi,

On 13/01/2025 13:12, Danilo Krummrich wrote:
> On 13.01.2025 11:33, Tvrtko Ursulin wrote:
>> Lets isolate scheduler internals from drivers such as pvr which currently
>> walks the dependency array to look for fences.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <pstanner@redhat.com>
>> Reviewed-by: Matt Coster <matt.coster@imgtec.com>
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Thanks! Would you also be happy to merge the two?

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++++
>>   include/drm/gpu_scheduler.h            |  3 ++-
>>   2 files changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 57da84908752..e6f1f2a8e033 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -997,6 +997,29 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>   }
>>   EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>>   
>> +/**
>> + * drm_sched_job_has_dependency - check whether fence is the job's dependency
>> + * @job: scheduler job to check
>> + * @fence: fence to look for
>> + *
>> + * Returns:
>> + * True if @fence is found within the job's dependencies, or otherwise false.
>> + */
>> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
>> +				  struct dma_fence *fence)
>> +{
>> +	struct dma_fence *f;
>> +	unsigned long index;
>> +
>> +	xa_for_each(&job->dependencies, index, f) {
>> +		if (f == fence)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +EXPORT_SYMBOL(drm_sched_job_has_dependency);
>> +
>>   /**
>>    * drm_sched_job_cleanup - clean up scheduler job resources
>>    * @job: scheduler job to clean up
>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>> index 95e17504e46a..d118a0a57ab1 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -577,7 +577,8 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
>>   int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>>   					    struct drm_gem_object *obj,
>>   					    bool write);
>> -
>> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
>> +				  struct dma_fence *fence);
>>   
>>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>   				    struct drm_gpu_scheduler **sched_list,
> 
