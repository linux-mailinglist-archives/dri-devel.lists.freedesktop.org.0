Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8F92E8B1
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0900210E2B8;
	Thu, 11 Jul 2024 13:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DF8yGEFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7B10E2B8
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gYMrITSB5LbfwzdSbMLl5VwE3L5thh7w/W6lel4HCQk=; b=DF8yGEFDAJjy83qP8KK2ABotdu
 ZQeaEi1VZFTmkSe3Oe+D4j+nKi5oXD6vMgDFCy5L0dzF4qy4gf50dZtsoMiG0EVaHuNTm3LbsLFmR
 rUe6zM6F9a9K95rmIMK08VG9qy/7Y4oAVCuggdsrUomjv1M7FuPT7bgunK9oVNXU34ENk5HIDGlUC
 5u1i3V2w3aU/FPND+78VLss/DJOwkSAYH27U1BklePnvduX/qNYjZdd1IVdUjwzsWQHQvkPHl/U8k
 bfxOfIkv/hFbuSRPtk0MH64wdbBFPbxnvBWJcYHuInoOfYzBp0fyt4wKJS9X0EbAl908YXsyo+rUm
 vDUti1RA==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtQK-00DhSG-Mj; Thu, 11 Jul 2024 15:01:25 +0200
Message-ID: <110e9540-5009-47e6-8e41-1ec841f3217e@igalia.com>
Date: Thu, 11 Jul 2024 10:01:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] drm/v3d: Fix potential memory leak in the timestamp
 extension
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240711091542.82083-1-tursulin@igalia.com>
 <20240711091542.82083-3-tursulin@igalia.com>
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
In-Reply-To: <20240711091542.82083-3-tursulin@igalia.com>
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

On 7/11/24 06:15, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> If fetching of userspace memory fails during the main loop, all drm sync
> objs looked up until that point will be leaked because of the missing
> drm_syncobj_put.
> 
> Fix it by exporting and using a common cleanup helper.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> Fixes: 9ba0ff3e083f ("drm/v3d: Create a CPU job extension for the timestamp query job")
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/v3d/v3d_drv.h    |  2 ++
>   drivers/gpu/drm/v3d/v3d_sched.c  | 22 +++++++++++-----
>   drivers/gpu/drm/v3d/v3d_submit.c | 43 ++++++++++++++++++++++----------
>   3 files changed, 48 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index 099b962bdfde..e208ffdfba32 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -563,6 +563,8 @@ void v3d_mmu_insert_ptes(struct v3d_bo *bo);
>   void v3d_mmu_remove_ptes(struct v3d_bo *bo);
>   
>   /* v3d_sched.c */
> +void v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
> +				   unsigned int count);
>   void v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue);
>   int v3d_sched_init(struct v3d_dev *v3d);
>   void v3d_sched_fini(struct v3d_dev *v3d);
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 03df37a3acf5..59dc0287dab9 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -73,18 +73,28 @@ v3d_sched_job_free(struct drm_sched_job *sched_job)
>   	v3d_job_cleanup(job);
>   }
>   
> +void
> +v3d_timestamp_query_info_free(struct v3d_timestamp_query_info *query_info,
> +			      unsigned int count)
> +{
> +	if (query_info->queries) {
> +		unsigned int i;
> +
> +		for (i = 0; i < count; i++)
> +			drm_syncobj_put(query_info->queries[i].syncobj);
> +
> +		kvfree(query_info->queries);
> +	}
> +}
> +
>   static void
>   v3d_cpu_job_free(struct drm_sched_job *sched_job)
>   {
>   	struct v3d_cpu_job *job = to_cpu_job(sched_job);
> -	struct v3d_timestamp_query_info *timestamp_query = &job->timestamp_query;
>   	struct v3d_performance_query_info *performance_query = &job->performance_query;
>   
> -	if (timestamp_query->queries) {
> -		for (int i = 0; i < timestamp_query->count; i++)
> -			drm_syncobj_put(timestamp_query->queries[i].syncobj);
> -		kvfree(timestamp_query->queries);
> -	}
> +	v3d_timestamp_query_info_free(&job->timestamp_query,
> +				      job->timestamp_query.count);
>   
>   	if (performance_query->queries) {
>   		for (int i = 0; i < performance_query->count; i++)
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 263fefc1d04f..121bf1314b80 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -452,6 +452,8 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_timestamp_query timestamp;
> +	unsigned int i;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
> @@ -480,19 +482,19 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   	offsets = u64_to_user_ptr(timestamp.offsets);
>   	syncs = u64_to_user_ptr(timestamp.syncs);
>   
> -	for (int i = 0; i < timestamp.count; i++) {
> +	for (i = 0; i < timestamp.count; i++) {
>   		u32 offset, sync;
>   
>   		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
> -			kvfree(job->timestamp_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->timestamp_query.queries[i].offset = offset;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			kvfree(job->timestamp_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> @@ -500,6 +502,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   	job->timestamp_query.count = timestamp.count;
>   
>   	return 0;
> +
> +error:
> +	v3d_timestamp_query_info_free(&job->timestamp_query, i);
> +	return err;
>   }
>   
>   static int
> @@ -509,6 +515,8 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   {
>   	u32 __user *syncs;
>   	struct drm_v3d_reset_timestamp_query reset;
> +	unsigned int i;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
> @@ -533,14 +541,14 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   
>   	syncs = u64_to_user_ptr(reset.syncs);
>   
> -	for (int i = 0; i < reset.count; i++) {
> +	for (i = 0; i < reset.count; i++) {
>   		u32 sync;
>   
>   		job->timestamp_query.queries[i].offset = reset.offset + 8 * i;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			kvfree(job->timestamp_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> @@ -548,6 +556,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   	job->timestamp_query.count = reset.count;
>   
>   	return 0;
> +
> +error:
> +	v3d_timestamp_query_info_free(&job->timestamp_query, i);
> +	return err;
>   }
>   
>   /* Get data for the copy timestamp query results job submission. */
> @@ -558,7 +570,8 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   {
>   	u32 __user *offsets, *syncs;
>   	struct drm_v3d_copy_timestamp_query copy;
> -	int i;
> +	unsigned int i;
> +	int err;
>   
>   	if (!job) {
>   		DRM_DEBUG("CPU job extension was attached to a GPU job.\n");
> @@ -591,15 +604,15 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   		u32 offset, sync;
>   
>   		if (copy_from_user(&offset, offsets++, sizeof(offset))) {
> -			kvfree(job->timestamp_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->timestamp_query.queries[i].offset = offset;
>   
>   		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			kvfree(job->timestamp_query.queries);
> -			return -EFAULT;
> +			err = -EFAULT;
> +			goto error;
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> @@ -613,6 +626,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   	job->copy.stride = copy.stride;
>   
>   	return 0;
> +
> +error:
> +	v3d_timestamp_query_info_free(&job->timestamp_query, i);
> +	return err;
>   }
>   
>   static int
