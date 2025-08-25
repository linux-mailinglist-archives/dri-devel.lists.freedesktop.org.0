Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7797B34BF1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1D010E558;
	Mon, 25 Aug 2025 20:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PeN85NPW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9D110E558
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71k/2zISjJxHjQoxh47LAW0zuhk+ghjx2VJUaeZ8RDQ=; b=PeN85NPWhTWTmve0vI6FUCf/WZ
 oMj1BpsLHFFP7xkqGDyh/qbyfBOxpONIFB3oilLVtCHx7J6ab+dWJk6TTOmhGXtvkVrp/au4Szw+b
 UfzVnhDHMxYWQKl9dHjX3Kni3docF+pQJhB80lYbueYJhK3lvZkI80AqM0pm5x2PGgW4rBImjh8fr
 WFJ3/aDUHDNd/i17yXK1w6w632SHsUSQ9x7+83uqyxKhix2VBYpxHW9gQpznSZSQAcPuR/UQUmJgA
 Wa4tfzYFbbxF8Eed1Wa/EhJEgDMQDdwOhjo5shp2mOUyANaIIzuPXST46jmL8dAqZzj0tTBeEbFO6
 YJSp6FTw==;
Received: from [189.7.87.79] (helo=[192.168.0.2])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uqdpj-001a07-Fd; Mon, 25 Aug 2025 22:30:27 +0200
Message-ID: <663613f4-6865-4a0d-aaf8-b1a3d92287e1@igalia.com>
Date: Mon, 25 Aug 2025 17:30:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] drm/v3d: Store a pointer to `struct v3d_file_priv`
 inside each job
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
 <20250815-v3d-queue-lock-v2-1-ce37258ffb53@igalia.com>
 <230174f5-4dd3-4974-a308-24262d5a6b02@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
In-Reply-To: <230174f5-4dd3-4974-a308-24262d5a6b02@igalia.com>
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

Hi Melissa,

On 25/08/25 16:56, Melissa Wen wrote:
> 
> 
> On 15/08/2025 16:58, Maíra Canal wrote:
>> Instead of storing a pointer to the DRM file data, store a pointer
>> directly to the private V3D file struct.
> Why? "to collect per-process information about the GPU"?

Just to avoid multiple levels of pointer indirection and make the code
more straight-forward. If the goal is to access `v3d_file_priv`, let's
use it directly.

Moreover, I'll use this later in the series.

Best Regards,
- Maíra

>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_drv.h    |  4 ++--
>>   drivers/gpu/drm/v3d/v3d_sched.c  | 10 +++++-----
>>   drivers/gpu/drm/v3d/v3d_submit.c |  2 +-
>>   3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/ 
>> v3d_drv.h
>> index 
>> 82d84a96235f0c5396ff634c2f6a0a7bb809b332..951a302336ce55f0a70f6a7adc0ec7ca30033198 100644
>> --- a/drivers/gpu/drm/v3d/v3d_drv.h
>> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
>> @@ -327,9 +327,9 @@ struct v3d_job {
>>       struct v3d_perfmon *perfmon;
>>       /* File descriptor of the process that submitted the job that 
>> could be used
>> -     * for collecting stats by process of GPU usage.
>> +     * to collect per-process information about the GPU.
>>        */
>> -    struct drm_file *file;
>> +    struct v3d_file_priv *file_priv;
>>       /* Callback for the freeing of the job on refcount going to 0. */
>>       void (*free)(struct kref *ref);
>> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/ 
>> v3d_sched.c
>> index 
>> f9d9a198d71866e662376a2367d7d5bcb4a363b6..1846030c5f3a508455087947872dacbfd6fb52ad 100644
>> --- a/drivers/gpu/drm/v3d/v3d_sched.c
>> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
>> @@ -139,7 +139,7 @@ static void
>>   v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
>>   {
>>       struct v3d_dev *v3d = job->v3d;
>> -    struct v3d_file_priv *file = job->file->driver_priv;
>> +    struct v3d_file_priv *file = job->file_priv;
>>       struct v3d_stats *global_stats = &v3d->queue[queue].stats;
>>       struct v3d_stats *local_stats = &file->stats[queue];
>>       u64 now = local_clock();
>> @@ -197,7 +197,7 @@ void
>>   v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>>   {
>>       struct v3d_dev *v3d = job->v3d;
>> -    struct v3d_file_priv *file = job->file->driver_priv;
>> +    struct v3d_file_priv *file = job->file_priv;
>>       struct v3d_stats *global_stats = &v3d->queue[queue].stats;
>>       u64 now = local_clock();
>>       unsigned long flags;
>> @@ -574,7 +574,7 @@ static void
>>   v3d_reset_performance_queries(struct v3d_cpu_job *job)
>>   {
>>       struct v3d_performance_query_info *performance_query = &job- 
>> >performance_query;
>> -    struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
>> +    struct v3d_file_priv *v3d_priv = job->base.file_priv;
>>       struct v3d_dev *v3d = job->base.v3d;
>>       struct v3d_perfmon *perfmon;
>> @@ -604,7 +604,7 @@ v3d_write_performance_query_result(struct 
>> v3d_cpu_job *job, void *data,
>>   {
>>       struct v3d_performance_query_info *performance_query =
>>                           &job->performance_query;
>> -    struct v3d_file_priv *v3d_priv = job->base.file->driver_priv;
>> +    struct v3d_file_priv *v3d_priv = job->base.file_priv;
>>       struct v3d_performance_query *perf_query =
>>               &performance_query->queries[query];
>>       struct v3d_dev *v3d = job->base.v3d;
>> @@ -722,7 +722,7 @@ static enum drm_gpu_sched_stat
>>   v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job 
>> *sched_job)
>>   {
>>       struct v3d_job *job = to_v3d_job(sched_job);
>> -    struct v3d_file_priv *v3d_priv = job->file->driver_priv;
>> +    struct v3d_file_priv *v3d_priv = job->file_priv;
>>       enum v3d_queue q;
>>       mutex_lock(&v3d->reset_lock);
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/ 
>> v3d_submit.c
>> index 
>> 5171ffe9012d4d0140d82d40af71ecbaf029a24a..f3652e90683c398f25d2ce306be1c0fdfe4d286f 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -166,7 +166,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file 
>> *file_priv,
>>       job->v3d = v3d;
>>       job->free = free;
>> -    job->file = file_priv;
>> +    job->file_priv = v3d_priv;
>>       ret = drm_sched_job_init(&job->base, &v3d_priv- 
>> >sched_entity[queue],
>>                    1, v3d_priv, file_priv->client_id);
>>
> 

