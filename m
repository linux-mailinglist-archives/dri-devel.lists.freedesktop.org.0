Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E05D7FB887
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 11:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D6410E4CE;
	Tue, 28 Nov 2023 10:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535DA10E4CE
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+kK2HCd+4n2Q4e4NylBvrv5NIfyLfbrnhoEWU+eXk1k=; b=A4KK7hLHRI0eMS7/k4IhbS3z8p
 yslkqNAvugD1FleOMFCRyE40w57XqqtbH4l5rJo2lPTW/AfOI8YLCwxWXuwR647aHdIWJmzth963u
 jOAqlsr5Gyaf/EPg0G71Fg8vpPjmNIYRu1jQun/OANd6e0c8m0JzxIyfuzLGjDWLIXXDkCxLden6j
 S+OQ3MiDxMGed/0SGCCUjVvrt4DfeSVLPZK8+jYxae8R1Tesp9AQHzkZfC3468LZoJWUvjdY1z6gy
 BXY2UQTLWC568DlrhspRb5okauhFdCp5dNsUaV0ymJUAmv10oPRm5QZ1F61Iw/URT621IHK2Bcex0
 ewb7fxVw==;
Received: from [177.34.168.16] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1r7vd8-007zs1-T3; Tue, 28 Nov 2023 11:47:51 +0100
Message-ID: <0c8c25e6-b74d-319a-9556-6dd42d7f7e8d@igalia.com>
Date: Tue, 28 Nov 2023 07:47:38 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 10/17] drm/v3d: Detach the CSD job BO setup
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
References: <20231127185723.10348-2-mcanal@igalia.com>
 <20231127185723.10348-12-mcanal@igalia.com>
 <a8cdbe3f24a9887c606fb0c6204f082d98cc6e66.camel@igalia.com>
Content-Language: en-US
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <a8cdbe3f24a9887c606fb0c6204f082d98cc6e66.camel@igalia.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Iago,

On 11/28/23 05:42, Iago Toral wrote:
> El lun, 27-11-2023 a las 15:48 -0300, Maíra Canal escribió:
>> From: Melissa Wen <mwen@igalia.com>
>>
>> Detach CSD job setup from CSD submission ioctl to reuse it in CPU
>> submission ioctl for indirect CSD job.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> Co-developed-by: Maíra Canal <mcanal@igalia.com>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_submit.c | 68 ++++++++++++++++++++----------
>> --
>>   1 file changed, 42 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index c134b113b181..eb26fe1e27e3 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -256,6 +256,45 @@ v3d_attach_fences_and_unlock_reservation(struct
>> drm_file *file_priv,
>>          }
>>   }
>>   
>> +static int
>> +v3d_setup_csd_jobs_and_bos(struct drm_file *file_priv,
>> +                          struct v3d_dev *v3d,
>> +                          struct drm_v3d_submit_csd *args,
>> +                          struct v3d_csd_job **job,
>> +                          struct v3d_job **clean_job,
>> +                          struct v3d_submit_ext *se,
>> +                          struct ww_acquire_ctx *acquire_ctx)
>> +{
>> +       int ret;
>> +
>> +       ret = v3d_job_allocate((void *)job, sizeof(**job));
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = v3d_job_init(v3d, file_priv, &(*job)->base,
>> +                          v3d_job_free, args->in_sync, se, V3D_CSD);
>> +       if (ret)
> 
> 
> We should free the job here.
> 
>> +               return ret;
>> +
>> +       ret = v3d_job_allocate((void *)clean_job,
>> sizeof(**clean_job));
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = v3d_job_init(v3d, file_priv, *clean_job,
>> +                          v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
>> +       if (ret)
> 
> We should free job and clean_job here.
> 
>> +               return ret;
>> +
>> +       (*job)->args = *args;
>> +
>> +       ret = v3d_lookup_bos(&v3d->drm, file_priv, *clean_job,
>> +                            args->bo_handles, args-
>>> bo_handle_count);
>> +       if (ret)
> 
> Same here.
> 
> I think we probably want to have a fail label where we do this and just
> jump there from all the paths I mentioned above.

Actually, we are freeing the job in `v3d_submit_csd_ioctl`. Take a look
here:

   48         ret = v3d_setup_csd_jobs_and_bos(file_priv, v3d, args,
   47                                          &job, &clean_job, &se,
   46                                          &acquire_ctx);
   45         if (ret)
   44                 goto fail;

If `v3d_setup_csd_jobs_and_bos` fails, we go to fail.

   43
   42         if (args->perfmon_id) {
   41                 job->base.perfmon = v3d_perfmon_find(v3d_priv,
   40 
args->perfmon_id);
   39                 if (!job->base.perfmon) {
   38                         ret = -ENOENT;
   37                         goto fail_perfmon;
   36                 }
   35         }
   34
   33         mutex_lock(&v3d->sched_lock);
   32         v3d_push_job(&job->base);
   31
   30         ret = drm_sched_job_add_dependency(&clean_job->base,
   29 
dma_fence_get(job->base.done_fence));
   28         if (ret)
   27                 goto fail_unreserve;
   26
   25         v3d_push_job(clean_job);
   24         mutex_unlock(&v3d->sched_lock);
   23
   22         v3d_attach_fences_and_unlock_reservation(file_priv,
   21                                                  clean_job,
   20                                                  &acquire_ctx,
   19                                                  args->out_sync,
   18                                                  &se,
   17 
clean_job->done_fence);
   16
   15         v3d_job_put(&job->base);
   14         v3d_job_put(clean_job);
   13
   12         return 0;
   11
   10 fail_unreserve:
    9         mutex_unlock(&v3d->sched_lock);
    8 fail_perfmon:
    7         drm_gem_unlock_reservations(clean_job->bo, 
clean_job->bo_count,
    6                                     &acquire_ctx);
    5 fail:
    4         v3d_job_cleanup((void *)job);
    3         v3d_job_cleanup(clean_job);

Here we cleanup `job` and `clean_job`. This will call `v3d_job_free` and
free the jobs.

Best Regards,
- Maíra

    2         v3d_put_multisync_post_deps(&se);
    1
1167         return ret;

> 
>> +               return ret;
>> +
>> +       return v3d_lock_bo_reservations(*clean_job, acquire_ctx);
>> +}
>> +
>>   static void
>>   v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
>>   {
>> @@ -700,32 +739,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev,
>> void *data,
>>                  }
>>          }
>>   
>> -       ret = v3d_job_allocate((void *)&job, sizeof(*job));
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret = v3d_job_init(v3d, file_priv, &job->base,
>> -                          v3d_job_free, args->in_sync, &se,
>> V3D_CSD);
>> -       if (ret)
>> -               goto fail;
>> -
>> -       ret = v3d_job_allocate((void *)&clean_job,
>> sizeof(*clean_job));
>> -       if (ret)
>> -               goto fail;
>> -
>> -       ret = v3d_job_init(v3d, file_priv, clean_job,
>> -                          v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
>> -       if (ret)
>> -               goto fail;
>> -
>> -       job->args = *args;
>> -
>> -       ret = v3d_lookup_bos(dev, file_priv, clean_job,
>> -                            args->bo_handles, args-
>>> bo_handle_count);
>> -       if (ret)
>> -               goto fail;
>> -
>> -       ret = v3d_lock_bo_reservations(clean_job, &acquire_ctx);
>> +       ret = v3d_setup_csd_jobs_and_bos(file_priv, v3d, args,
>> +                                        &job, &clean_job, &se,
>> +                                        &acquire_ctx);
>>          if (ret)
>>                  goto fail;
>>   
> 
