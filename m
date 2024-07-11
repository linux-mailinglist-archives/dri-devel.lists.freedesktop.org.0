Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D6A92E8CD
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:06:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B02910EA5F;
	Thu, 11 Jul 2024 13:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FrN7Kdte";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2336810EA5E
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2T+TSiSgFdhW012P7ZrQRHK7y13AVXE5tYeBLPMsMv8=; b=FrN7KdteHhGNTDCkoI8nowQdr6
 NT+kVRB8P0+9QLvaZW30cJ/JAQLajty+GtY3NtuZM6dsw2jVkD58m5QDS68hLO04/4Epa2atFwnZz
 hUVkKcvT9R/oJ/4pAbw6ypl1I1DWhAinwdLRWIoqyfR0fgE4p+6hn+1HF0HPb6/XvMWpgEUD0bzzY
 +Edfa1BYtAP3Z741HGoypFTv1zX+l7jfdToLGcMuPOcSC1Z1q3QyyZFu7F9b4xhPEZw7azie30ce6
 3wItLgRImtMRGzNLpjhfHE+SEjVGd4WoVFqcK8zEB/cYo8IuSRLSgEHJhni6Y3MOqC5shOaAYVYVQ
 9ngAzAjg==;
Received: from [84.69.19.168] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtUg-00DhXA-8i; Thu, 11 Jul 2024 15:05:54 +0200
Message-ID: <e8ace7f1-2f2f-43d6-ae77-f9e75f7ff2a0@igalia.com>
Date: Thu, 11 Jul 2024 14:05:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/v3d: Fix potential memory leak in the
 performance extension
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Iago Toral Quiroga <itoral@igalia.com>,
 stable@vger.kernel.org
References: <20240711091542.82083-1-tursulin@igalia.com>
 <20240711091542.82083-4-tursulin@igalia.com>
 <b49d8545-91d7-4b84-b356-dd11f14cefa9@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b49d8545-91d7-4b84-b356-dd11f14cefa9@igalia.com>
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


On 11/07/2024 14:00, Maíra Canal wrote:
> On 7/11/24 06:15, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> If fetching of userspace memory fails during the main loop, all drm sync
>> objs looked up until that point will be leaked because of the missing
>> drm_syncobj_put.
>>
>> Fix it by exporting and using a common cleanup helper.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Fixes: bae7cb5d6800 ("drm/v3d: Create a CPU job extension for the 
>> reset performance query job")
>> Cc: Maíra Canal <mcanal@igalia.com>
>> Cc: Iago Toral Quiroga <itoral@igalia.com>
>> Cc: <stable@vger.kernel.org> # v6.8+
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.h    |  2 ++
>>   drivers/gpu/drm/v3d/v3d_sched.c  | 22 ++++++++++----
>>   drivers/gpu/drm/v3d/v3d_submit.c | 50 ++++++++++++++++++++------------
>>   3 files changed, 49 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h 
>> b/drivers/gpu/drm/v3d/v3d_drv.h
>> index e208ffdfba32..dd3ead4cb8bd 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -565,6 +565,8 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo);
>>   /* v3d_sched.c */
>>   void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info 
>> *query_info,
>>                      unsigned int count);
>> +void v3d_performance_query_info_free(struct 
>> v3d_performance_query_info *query_info,
>> +                     unsigned int count);
>>   void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue);
>>   int v3d_sched_init(struct v3d_dev *v3d);
>>   void v3d_sched_fini(struct v3d_dev *v3d);
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c 
>> b/drivers/gpu/drm/v3d/v3d_sched.c
>> index 59dc0287dab9..5fbbee47c6b7 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -87,20 +87,30 @@ v3d_timestamp_query_info_free(struct 
>> v3d_timestamp_query_info *query_info,
>>       }
>>   }
>> +void
>> +v3d_performance_query_info_free(struct v3d_performance_query_info 
>> *query_info,
>> +                unsigned int count)
>> +{
>> +    if (query_info->queries) {
>> +        unsigned int i;
>> +
>> +        for (i = 0; i < count; i++)
>> +            drm_syncobj_put(query_info->queries[i].syncobj);
>> +
>> +        kvfree(query_info->queries);
>> +    }
>> +}
>> +
>>   static void
>>   v3d_cpu_job_free(struct drm_sched_job *sched_job)
>>   {
>>       struct v3d_cpu_job *job = to_cpu_job(sched_job);
>> -    struct v3d_performance_query_info *performance_query = 
>> &job->performance_query;
>>       v3d_timestamp_query_info_free(&job->timestamp_query,
>>                         job->timestamp_query.count);
>> -    if (performance_query->queries) {
>> -        for (int i = 0; i < performance_query->count; i++)
>> -            drm_syncobj_put(performance_query->queries[i].syncobj);
>> -        kvfree(performance_query->queries);
>> -    }
>> +    v3d_performance_query_info_free(&job->performance_query,
>> +                    job->performance_query.count);
>>       v3d_job_cleanup(&job->base);
>>   }
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c 
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index 121bf1314b80..d626c8539b04 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -640,6 +640,8 @@ v3d_get_cpu_reset_performance_params(struct 
>> drm_file *file_priv,
>>       u32 __user *syncs;
>>       u64 __user *kperfmon_ids;
>>       struct drm_v3d_reset_performance_query reset;
>> +    unsigned int i, j;
>> +    int err;
>>       if (!job) {
>>           DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
>> @@ -668,39 +670,43 @@ v3d_get_cpu_reset_performance_params(struct 
>> drm_file *file_priv,
>>       syncs = u64_to_user_ptr(reset.syncs);
>>       kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
>> -    for (int i = 0; i < reset.count; i++) {
>> +    for (i = 0; i < reset.count; i++) {
>>           u32 sync;
>>           u64 ids;
>>           u32 __user *ids_pointer;
>>           u32 id;
>>           if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>> -            kvfree(job->performance_query.queries);
>> -            return -EFAULT;
>> +            err = -EFAULT;
>> +            goto error;
>>           }
>> -        job->performance_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>> -
>>           if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
>> -            kvfree(job->performance_query.queries);
>> -            return -EFAULT;
>> +            err = -EFAULT;
>> +            goto error;
>>           }
>>           ids_pointer = u64_to_user_ptr(ids);
>> -        for (int j = 0; j < reset.nperfmons; j++) {
>> +        for (j = 0; j < reset.nperfmons; j++) {
>>               if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
>> -                kvfree(job->performance_query.queries);
>> -                return -EFAULT;
>> +                err = -EFAULT;
>> +                goto error;
>>               }
>>               job->performance_query.queries[i].kperfmon_ids[j] = id;
>>           }
>> +
>> +        job->performance_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>>       }
>>       job->performance_query.count = reset.count;
>>       job->performance_query.nperfmons = reset.nperfmons;
>>       return 0;
>> +
>> +error:
>> +    v3d_performance_query_info_free(&job->performance_query, i);
>> +    return err;
>>   }
>>   static int
>> @@ -711,6 +717,8 @@ v3d_get_cpu_copy_performance_query_params(struct 
>> drm_file *file_priv,
>>       u32 __user *syncs;
>>       u64 __user *kperfmon_ids;
>>       struct drm_v3d_copy_performance_query copy;
>> +    unsigned int i, j;
>> +    int err;
>>       if (!job) {
>>           DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
>> @@ -749,27 +757,27 @@ v3d_get_cpu_copy_performance_query_params(struct 
>> drm_file *file_priv,
>>           u32 id;
>>           if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>> -            kvfree(job->performance_query.queries);
>> -            return -EFAULT;
>> +            err = -EFAULT;
>> +            goto error;
>>           }
>> -        job->performance_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>> -
>>           if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
>> -            kvfree(job->performance_query.queries);
>> -            return -EFAULT;
>> +            err = -EFAULT;
>> +            goto error;
>>           }
>>           ids_pointer = u64_to_user_ptr(ids);
>> -        for (int j = 0; j < copy.nperfmons; j++) {
>> +        for (j = 0; j < copy.nperfmons; j++) {
>>               if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
>> -                kvfree(job->performance_query.queries);
>> -                return -EFAULT;
>> +                err = -EFAULT;
>> +                goto error;
>>               }
>>               job->performance_query.queries[i].kperfmon_ids[j] = id;
>>           }
>> +
>> +        job->performance_query.queries[i].syncobj = 
>> drm_syncobj_find(file_priv, sync);
>>       }
>>       job->performance_query.count = copy.count;
>>       job->performance_query.nperfmons = copy.nperfmons;
>> @@ -782,6 +790,10 @@ v3d_get_cpu_copy_performance_query_params(struct 
>> drm_file *file_priv,
>>       job->copy.stride = copy.stride;
>>       return 0;
>> +
>> +error:
>> +    v3d_performance_query_info_free(&job->performance_query, i);
> 
> I'm seeing this compiling warning from this patch:
> 
> drivers/gpu/drm/v3d/v3d_submit.c:860:59: warning: variable 'i' is 
> uninitialized when used here [-Wuninitialized]
>    860 | v3d_performance_query_info_free(&job->performance_query, i);
>        |                                                                  ^
> drivers/gpu/drm/v3d/v3d_submit.c:781:16: note: initialize the variable 
> 'i' to silence this warning
>    781 |         unsigned int i, j;
>        |                       ^
>        |                        = 0
> 1 warning generated.
> 
> I believe that we are currently defining int i twice.

Yep.. more re-ordering/rebasing fails on my end. Fixed locally.

Regards,

Tvrtko
