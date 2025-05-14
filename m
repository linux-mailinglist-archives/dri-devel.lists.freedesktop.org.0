Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E6AB669E
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 10:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7210A10E27F;
	Wed, 14 May 2025 08:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="QL0TKXOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246B10E27F;
 Wed, 14 May 2025 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pSV2aiUoqueBLMDiIgq7LqJACGC6xwwprxx6WXXvSng=; b=QL0TKXOl+YBrqo3avEuXDh9s4S
 veMnxZu9zdNrX9ox2r8ZFO69InpORQGwM0heKJ2v6w/sa9KWzrnkBY9rTIOiPqI+ZcRreSAckNDgn
 rMy9ttw44otFj+Ysudq3fmua72sCIbz74HI7hHkN2YJfgz8UA96vDg+rQaNQEGNQpnTAwTDRmuUbg
 hsF6dN6vDkQPCGnq+NtF+hMp4BnjAL9kkVNMHimOGADYIrri3zupErqxvuR/XCi5uho0Wp+FGMU3z
 4Z7SV1rJHapnOjKDVjCO9dbmxsHFzj6LazrPPTFE9AiYhABlJs22CNQDmk5PkNUnEMt1VZimr+mxC
 Fi5RVzlw==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uF7ph-0083ql-Le; Wed, 14 May 2025 10:57:04 +0200
Message-ID: <eae2623f-65db-42db-9c6e-acc76bd50423@igalia.com>
Date: Wed, 14 May 2025 09:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v4 05/16] drm/sched: Consolidate drm_sched_job_timedout
To: phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250425102034.85133-1-tvrtko.ursulin@igalia.com>
 <20250425102034.85133-6-tvrtko.ursulin@igalia.com>
 <207366049668e3df24ac81cd9f2e07bc1a2358ad.camel@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <207366049668e3df24ac81cd9f2e07bc1a2358ad.camel@mailbox.org>
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


On 12/05/2025 13:53, Philipp Stanner wrote:
> On Fri, 2025-04-25 at 11:20 +0100, Tvrtko Ursulin wrote:
>> Reduce to one spin_unlock for hopefully a little bit clearer flow in
>> the
>> function. It may appear that there is a behavioural change with the
>> drm_sched_start_timeout_unlocked() now not being called if there were
>> initially no jobs on the pending list, and then some appeared after
>> unlock, however if the code would rely on the TDR handler restarting
>> itself then it would fail to do that if the job arrived on the
>> pending
>> list after the check.
>>
>> Also fix one stale comment while touching the function.
> 
> Same here, that's a good candidate for a separate patch / series.

It conflicts with the in progress work from Maíra (fixing memory leaks 
on false timeouts) so I will keep this one on the back-burner until her 
work lands.

Regards,

Tvrtko

>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Philipp Stanner <phasta@kernel.org>
>> ---
>>   drivers/gpu/drm/scheduler/sched_main.c | 37 +++++++++++++-----------
>> --
>>   1 file changed, 18 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index a45b02fd2af3..a26cc11c8ade 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -516,38 +516,37 @@ static void drm_sched_job_begin(struct
>> drm_sched_job *s_job)
>>   
>>   static void drm_sched_job_timedout(struct work_struct *work)
>>   {
>> -	struct drm_gpu_scheduler *sched;
>> +	struct drm_gpu_scheduler *sched =
>> +		container_of(work, struct drm_gpu_scheduler,
>> work_tdr.work);
>> +	enum drm_gpu_sched_stat status;
>>   	struct drm_sched_job *job;
>> -	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>> -
>> -	sched = container_of(work, struct drm_gpu_scheduler,
>> work_tdr.work);
>>   
>>   	/* Protects against concurrent deletion in
>> drm_sched_get_finished_job */
>>   	spin_lock(&sched->job_list_lock);
>>   	job = list_first_entry_or_null(&sched->pending_list,
>>   				       struct drm_sched_job, list);
>> -
>>   	if (job) {
>>   		/*
>>   		 * Remove the bad job so it cannot be freed by
>> concurrent
>> -		 * drm_sched_cleanup_jobs. It will be reinserted
>> back after sched->thread
>> -		 * is parked at which point it's safe.
>> +		 * drm_sched_get_finished_job. It will be reinserted
>> back after
>> +		 * scheduler worker is stopped at which point it's
>> safe.
>>   		 */
>>   		list_del_init(&job->list);
>> -		spin_unlock(&sched->job_list_lock);
>> +	}
>> +	spin_unlock(&sched->job_list_lock);
>>   
>> -		status = job->sched->ops->timedout_job(job);
>> +	if (!job)
>> +		return;
>>   
>> -		/*
>> -		 * Guilty job did complete and hence needs to be
>> manually removed
>> -		 * See drm_sched_stop doc.
>> -		 */
>> -		if (sched->free_guilty) {
>> -			job->sched->ops->free_job(job);
>> -			sched->free_guilty = false;
>> -		}
>> -	} else {
>> -		spin_unlock(&sched->job_list_lock);
>> +	status = job->sched->ops->timedout_job(job);
>> +
>> +	/*
>> +	 * Guilty job did complete and hence needs to be manually
>> removed. See
>> +	 * documentation for drm_sched_stop.
>> +	 */
>> +	if (sched->free_guilty) {
>> +		job->sched->ops->free_job(job);
>> +		sched->free_guilty = false;
>>   	}
>>   
>>   	if (status != DRM_GPU_SCHED_STAT_ENODEV)
> 

