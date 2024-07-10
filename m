Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A416B92D6FF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:00:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6498210E1C8;
	Wed, 10 Jul 2024 17:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="H49peGiQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D964210E838
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DdZXvo7kSPL3UziVB8WkVRWnMr0YmDhIiYuzIYjnN7o=; b=H49peGiQGsGTppxO1gH7wDd8oa
 BMsdjLD8OhBHjn7+PlDTReqvcLJ6s3j3hO0eweumhdqJM6qpFEHHzPVMY/OGx8VRehmFnHij/4fGA
 3EbR4fDnkY1xRAZFOBo/AkAVw4XAbO8AiXbvC4LDBp2qwfki4dPGDrx25/cTiAKXuVuhaY/JWPwCB
 fe4rEJT7BUPDDCi8vVK2fpbH7otIxcLVnY3aqUQW4JXWItvmqTx5fyyVpsm0XcmFJ1RM0F0j2+Lt8
 npCC5uCYeMswRYHePCht4sZbVc3Jzn8kj30ce7UYp8bfzMfnBF5cHt4JHDy3djdUvweJiVvb217sz
 tTyf9dQg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRafy-00DL93-Jc; Wed, 10 Jul 2024 19:00:18 +0200
Message-ID: <97404689-f27b-4051-b593-b17ec50f1d07@igalia.com>
Date: Wed, 10 Jul 2024 14:00:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] drm/v3d: Fix potential memory leak in the
 performance extension
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-4-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240710134130.17292-4-tursulin@igalia.com>
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

On 7/10/24 10:41, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> If fetching of userspace memory fails during the main loop, all drm sync
> objs looked up until that point will be leaked because of the missing
> drm_syncobj_put.
> 
> Fix it by exporting and using a common cleanup helper.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: bae7cb5d6800 ("drm/v3d: Create a CPU job extension for the reset performance query job"

Missing ) at the end of Fixes.

> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/v3d/v3d_drv.h    |  2 ++
>   drivers/gpu/drm/v3d/v3d_sched.c  | 22 +++++++++++++-----
>   drivers/gpu/drm/v3d/v3d_submit.c | 40 +++++++++++++++++++++-----------
>   3 files changed, 44 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 95651c3c926f..38c80168da51 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -565,6 +565,8 @@ void v3d_mmu_remove_ptes(struct v3d_bo *bo);
>   /* v3d_sched.c */
>   void __v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *qinfo,
>   				     unsigned int count);
> +void __v3d_performance_query_info_free(struct v3d_performance_query_info *qinfo,
> +				       unsigned int count);

Same nits from the previous patch.

>   void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue);
>   int v3d_sched_init(struct v3d_dev *v3d);
>   void v3d_sched_fini(struct v3d_dev *v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index e45d3ddc6f82..173801aa54ee 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -87,20 +87,30 @@ __v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *qinfo,
>   	}
>   }
>   
> +void
> +__v3d_performance_query_info_free(struct v3d_performance_query_info *qinfo,
> +				  unsigned int count)
> +{
> +	if (qinfo->queries) {
> +		unsigned int i;
> +
> +		for (i = 0; i < count; i++)
> +			drm_syncobj_put(qinfo->queries[i].syncobj);
> +
> +		kvfree(qinfo->queries);
> +	}
> +}
> +
>   static void
>   v3d_cpu_job_free(struct drm_sched_job *sched_job)
>   {
>   	struct v3d_cpu_job *job = to_cpu_job(sched_job);
> -	struct v3d_performance_query_info *performance_query = &job->performance_query;
>   
>   	__v3d_timestamp_query_info_free(&job->timestamp_query,
>   					job->timestamp_query.count);
>   
> -	if (performance_query->queries) {
> -		for (int i = 0; i < performance_query->count; i++)
> -			drm_syncobj_put(performance_query->queries[i].syncobj);
> -		kvfree(performance_query->queries);
> -	}
> +	__v3d_performance_query_info_free(&job->performance_query,
> +					  job->performance_query.count);
>   
>   	v3d_job_cleanup(&job->base);
>   }
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 2818afdd4807..ca1b1ad0a75c 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -637,6 +637,7 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	u32 __user *syncs;
>   	u64 __user *kperfmon_ids;
>   	struct drm_v3d_reset_performance_query reset;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
> @@ -672,32 +673,36 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   		u32 id;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			kvfree(job->performance_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
> -		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -
>   		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
> -			kvfree(job->performance_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		ids_pointer = u64_to_user_ptr(ids);
>   
>   		for (int j = 0; j < reset.nperfmons; j++) {
>   			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
> -				kvfree(job->performance_query.queries);
> -				return -EFAULT;
> +				err = -EFAULT;
> +				goto error;
>   			}
>   
>   			job->performance_query.queries[i].kperfmon_ids[j] = id;
>   		}
> +
> +		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
>   	}
>   	job->performance_query.count = reset.count;
>   	job->performance_query.nperfmons = reset.nperfmons;
>   
>   	return 0;
> +
> +error > +	__v3d_performance_query_info_free(qinfo, i);

I miss the declaration of `qinfo`.

> +	return err;
>   }
>   
>   static int
> @@ -708,6 +713,7 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	u32 __user *syncs;
>   	u64 __user *kperfmon_ids;
>   	struct drm_v3d_copy_performance_query copy;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
> @@ -746,27 +752,29 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   		u32 id;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			kvfree(job->performance_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);

I believe this line should be deleted as it is introduced later in this
patch.

>   
>   		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
> -			kvfree(job->performance_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		ids_pointer = u64_to_user_ptr(ids);
>   
>   		for (int j = 0; j < copy.nperfmons; j++) {
>   			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
> -				kvfree(job->performance_query.queries);
> -				return -EFAULT;
> +				err = -EFAULT;
> +				goto error;
>   			}
>   
>   			job->performance_query.queries[i].kperfmon_ids[j] = id;
>   		}
> +
> +		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
>   	}
>   	job->performance_query.count = copy.count;
>   	job->performance_query.nperfmons = copy.nperfmons;
> @@ -779,6 +787,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	job->copy.stride = copy.stride;
>   
>   	return 0;
> +
> +error:
> +	__v3d_performance_query_info_free(qinfo, i);

Missing declaration of `qinfo`.

Best Regards,
- Maíra

> +	return err;
>   }
>   
>   /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
