Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CC7FA105
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7510E29D;
	Mon, 27 Nov 2023 13:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91F610E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R5/EhQQBDF81O5U1caPTVm3fQe2khn8HUvYgKK43L6I=; b=PsUCySAEytJzx3YLGf/XEmN61M
 Q4QALqXUsGyosEBMv4hr++J50BCBBeZJao30fb2owfn4rBYaiCswcookJHL7la01vDe/rbyrOETUK
 NOjhr6FspF9+1zPRXsuA0+wxtLHlVuynQnWMdYpxEFtJ/CD80DQrZmk4LcXT60HkmogkczhLGBEGq
 TNc8aVvIOyouhJQMqTN0ga0YO8cW6ULB5MJ1uNG78e3M08WJuL9J8xwEC62cIqsBEtJu6b5PPSa+G
 bJp65fqJdoBYQ9jKzECyxCBiHlqh6ZPWBHVWhrxwFS+olup6En1dsJDfbE5rRIEffEh7yCgS2OZnu
 /x6+5EOg==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r7bd1-007aJR-Lx; Mon, 27 Nov 2023 14:26:23 +0100
Message-ID: <95c4b047-0be1-adbb-dca7-7d0ce7fc42e4@igalia.com>
Date: Mon, 27 Nov 2023 10:26:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 13/17] drm/v3d: Create a CPU job extension for the
 timestamp query job
Content-Language: en-US
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231124012548.772095-1-mcanal@igalia.com>
 <20231124012548.772095-14-mcanal@igalia.com>
 <ff71bbf4e8adab9abe5505aad7050ed723b037d2.camel@igalia.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <ff71bbf4e8adab9abe5505aad7050ed723b037d2.camel@igalia.com>
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
Cc: kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

On 11/27/23 06:16, Iago Toral wrote:
> El jue, 23-11-2023 a las 21:47 -0300, Maíra Canal escribió:
> 
> (...)
>> +static void
>> +v3d_timestamp_query(struct v3d_cpu_job *job)
>> +{
>> +       struct v3d_timestamp_query_info *timestamp_query = &job-
>>> timestamp_query;
>> +       struct v3d_bo *bo = to_v3d_bo(job->base.bo[0]);
> 
> I presume there is an implicit expectation here that a timestamp query
> job only has one BO where we are writing query results, right? Maybe we
> should document this more explicitly in the uAPI and also check that we
> have at least that one BO before trying to map it and write to it?

I'll do it.

> 
> Also, is there a reason why we take the job reference from job-
>> base.bo[0] instead of job->bo[0]?

job is a struct v3d_cpu_job, which has a struct v3d_job as base.
The BOs are stored on struct v3d_job, as this is a common functionality
of all job types.

Best Regards,
- Maíra

> 
> Iago
> 
>> +       u8 *value_addr;
>> +
>> +       v3d_get_bo_vaddr(bo);
>> +
>> +       for (int i = 0; i < timestamp_query->count; i++) {
>> +               value_addr = ((u8 *) bo->vaddr) + timestamp_query-
>>> queries[i].offset;
>> +               *((u64 *) value_addr) = i == 0 ? ktime_get_ns() :
>> 0ull;
>> +
>> +               drm_syncobj_replace_fence(timestamp_query-
>>> queries[i].syncobj,
>> +                                         job->base.done_fence);
>> +       }
>> +
>> +       v3d_put_bo_vaddr(bo);
>> +}
>> +
>>   static struct dma_fence *
>>   v3d_cpu_job_run(struct drm_sched_job *sched_job)
>>   {
>> @@ -315,6 +352,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
>>   
>>          void (*v3d_cpu_job_fn[])(struct v3d_cpu_job *job) = {
>>                  [V3D_CPU_JOB_TYPE_INDIRECT_CSD] =
>> v3d_rewrite_csd_job_wg_counts_from_indirect,
>> +               [V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY] =
>> v3d_timestamp_query,
>>          };
>>   
>>          v3d->cpu_job = job;
>> @@ -504,7 +542,7 @@ static const struct drm_sched_backend_ops
>> v3d_cache_clean_sched_ops = {
>>   static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
>>          .run_job = v3d_cpu_job_run,
>>          .timedout_job = v3d_generic_job_timedout,
>> -       .free_job = v3d_sched_job_free
>> +       .free_job = v3d_cpu_job_free
>>   };
>>   
>>   int
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index b6707ef42706..2f03c8bca593 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -438,6 +438,64 @@ v3d_get_cpu_indirect_csd_params(struct drm_file
>> *file_priv,
>>                                            NULL, &info->acquire_ctx);
>>   }
>>   
>> +/* Get data for the query timestamp job submission. */
>> +static int
>> +v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>> +                                  struct drm_v3d_extension __user
>> *ext,
>> +                                  struct v3d_cpu_job *job)
>> +{
>> +       u32 __user *offsets, *syncs;
>> +       struct drm_v3d_timestamp_query timestamp;
>> +
>> +       if (!job) {
>> +               DRM_DEBUG("CPU job extension was attached to a GPU
>> job.\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (job->job_type) {
>> +               DRM_DEBUG("Two CPU job extensions were added to the
>> same CPU job.\n");
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (copy_from_user(&timestamp, ext, sizeof(timestamp)))
>> +               return -EFAULT;
>> +
>> +       if (timestamp.pad)
>> +               return -EINVAL;
>> +
>> +       job->job_type = V3D_CPU_JOB_TYPE_TIMESTAMP_QUERY;
>> +
>> +       job->timestamp_query.queries =
>> kvmalloc_array(timestamp.count,
>> +                                                     sizeof(struct
>> v3d_timestamp_query),
>> +                                                     GFP_KERNEL);
>> +       if (!job->timestamp_query.queries)
>> +               return -ENOMEM;
>> +
>> +       offsets = u64_to_user_ptr(timestamp.offsets);
>> +       syncs = u64_to_user_ptr(timestamp.syncs);
>> +
>> +       for (int i = 0; i < timestamp.count; i++) {
>> +               u32 offset, sync;
>> +
>> +               if (copy_from_user(&offset, offsets++,
>> sizeof(offset))) {
>> +                       kvfree(job->timestamp_query.queries);
>> +                       return -EFAULT;
>> +               }
>> +
>> +               job->timestamp_query.queries[i].offset = offset;
>> +
>> +               if (copy_from_user(&sync, syncs++, sizeof(sync))) {
>> +                       kvfree(job->timestamp_query.queries);
>> +                       return -EFAULT;
>> +               }
>> +
>> +               job->timestamp_query.queries[i].syncobj =
>> drm_syncobj_find(file_priv, sync);
>> +       }
>> +       job->timestamp_query.count = timestamp.count;
>> +
>> +       return 0;
>> +}
>> +
>>   /* Whenever userspace sets ioctl extensions, v3d_get_extensions
>> parses data
>>    * according to the extension id (name).
>>    */
>> @@ -466,6 +524,9 @@ v3d_get_extensions(struct drm_file *file_priv,
>>                  case DRM_V3D_EXT_ID_CPU_INDIRECT_CSD:
>>                          ret =
>> v3d_get_cpu_indirect_csd_params(file_priv, user_ext, job);
>>                          break;
>> +               case DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY:
>> +                       ret =
>> v3d_get_cpu_timestamp_query_params(file_priv, user_ext, job);
>> +                       break;
>>                  default:
>>                          DRM_DEBUG_DRIVER("Unknown extension id:
>> %d\n", ext.id);
>>                          return -EINVAL;
>> @@ -954,6 +1015,7 @@ v3d_submit_cpu_ioctl(struct drm_device *dev,
>> void *data,
>>          v3d_job_cleanup((void *)csd_job);
>>          v3d_job_cleanup(clean_job);
>>          v3d_put_multisync_post_deps(&se);
>> +       kvfree(cpu_job->timestamp_query.queries);
>>   
>>          return ret;
>>   }
>> diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
>> index 059b84984fb0..65d5de076366 100644
>> --- a/include/uapi/drm/v3d_drm.h
>> +++ b/include/uapi/drm/v3d_drm.h
>> @@ -73,6 +73,7 @@ struct drm_v3d_extension {
>>          __u32 id;
>>   #define DRM_V3D_EXT_ID_MULTI_SYNC                      0x01
>>   #define DRM_V3D_EXT_ID_CPU_INDIRECT_CSD                0x02
>> +#define DRM_V3D_EXT_ID_CPU_TIMESTAMP_QUERY             0x03
>>          __u32 flags; /* mbz */
>>   };
>>   
>> @@ -400,6 +401,32 @@ struct drm_v3d_indirect_csd {
>>          __u32 wg_uniform_offsets[3];
>>   };
>>   
>> +/**
>> + * struct drm_v3d_timestamp_query - ioctl extension for the CPU job
>> to calculate
>> + * a timestamp query
>> + *
>> + * When an extension DRM_V3D_EXT_ID_TIMESTAMP_QUERY is defined, it
>> points to
>> + * this extension to define a timestamp query submission. This CPU
>> job will
>> + * calculate the timestamp query and update the query value within
>> the
>> + * timestamp BO. Moreover, it will signal the timestamp syncobj to
>> indicate
>> + * query availability.
>> + */
>> +struct drm_v3d_timestamp_query {
>> +       struct drm_v3d_extension base;
>> +
>> +       /* Array of queries' offsets within the timestamp BO for
>> their value */
>> +       __u64 offsets;
>> +
>> +       /* Array of timestamp's syncobjs to indicate its availability
>> */
>> +       __u64 syncs;
>> +
>> +       /* Number of queries */
>> +       __u32 count;
>> +
>> +       /* mbz */
>> +       __u32 pad;
>> +};
>> +
>>   struct drm_v3d_submit_cpu {
>>          /* Pointer to a u32 array of the BOs that are referenced by
>> the job. */
>>          __u64 bo_handles;
> 
