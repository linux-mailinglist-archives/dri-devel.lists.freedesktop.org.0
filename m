Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B670E92E901
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C9F10EA60;
	Thu, 11 Jul 2024 13:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X7XtFW84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE2610EA60
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2pNmhdO1+JP1bDdegA+EKh13uL5sC5CM+wtYSgxT58M=; b=X7XtFW84l427oPpqCfcbai89Ls
 yiqUyXpi0kK7B8JFA7DjqbcJDWfrQSVg2v/Lp2ilFE5bj17y7DC8Iq/yds0ZpddVQSd9KesxoFvAc
 7GEJzVbcJpIAm7t9asR7V+YsOq6w3Zyjcvu3glzO9VdiLfW5W6rl+RHu8D6IlKE+IvCI/XEV0azlw
 tQ5JgV3W2UwZ685Fi6zzzC1aex0MQyuPpOx2xs6WJqmWu+I866HXivOQA9G8f8P6sX494GLCKrAyO
 kDqLFDhMG8d3jceeh6T248jYlt5Kx8+yHbApDLsKZFCFxx7vSMrtGdwk6g4IDUnexzk4kcuYBKQhc
 VhvAO5OQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtdB-00Dhoo-PV; Thu, 11 Jul 2024 15:14:42 +0200
Message-ID: <e0d6d777-e607-405c-8158-feb3d06c06d0@igalia.com>
Date: Thu, 11 Jul 2024 10:14:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] drm/v3d: Size the kperfmon_ids array at runtime
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240711091542.82083-1-tursulin@igalia.com>
 <20240711091542.82083-8-tursulin@igalia.com>
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
In-Reply-To: <20240711091542.82083-8-tursulin@igalia.com>
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
> Instead of statically reserving pessimistic space for the kperfmon_ids
> array, make the userspace extension code allocate the exactly required
> amount of space.
> 
> Apart from saving some memory at runtime, this also removes the need for
> the V3D_MAX_PERFMONS macro whose removal will benefit further driver
> cleanup.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_drv.h    |  6 +-----
>   drivers/gpu/drm/v3d/v3d_sched.c  |  4 +++-
>   drivers/gpu/drm/v3d/v3d_submit.c | 17 +++++++++++------
>   3 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> index dd3ead4cb8bd..b1dfec49ba7d 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.h
> +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> @@ -351,13 +351,9 @@ struct v3d_timestamp_query {
>   	struct drm_syncobj *syncobj;
>   };
>   
> -/* Number of perfmons required to handle all supported performance counters */
> -#define V3D_MAX_PERFMONS DIV_ROUND_UP(V3D_MAX_COUNTERS, \
> -				      DRM_V3D_MAX_PERF_COUNTERS)
> -
>   struct v3d_performance_query {
>   	/* Performance monitor IDs for this query */
> -	u32 kperfmon_ids[V3D_MAX_PERFMONS];
> +	u32 *kperfmon_ids;
>   
>   	/* Syncobj that indicates the query availability */
>   	struct drm_syncobj *syncobj;
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 5fbbee47c6b7..7b2195ba4248 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -94,8 +94,10 @@ v3d_performance_query_info_free(struct v3d_performance_query_info *query_info,
>   	if (query_info->queries) {
>   		unsigned int i;
>   
> -		for (i = 0; i < count; i++)
> +		for (i = 0; i < count; i++) {
>   			drm_syncobj_put(query_info->queries[i].syncobj);
> +			kvfree(query_info->queries[i].kperfmon_ids);
> +		}
>   
>   		kvfree(query_info->queries);
>   	}
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index ce56e31a027d..d1060e60aafa 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -671,10 +671,20 @@ v3d_copy_query_info(struct v3d_performance_query_info *query_info,
>   			goto error;
>   		}
>   
> +		query->kperfmon_ids =
> +			kvmalloc_array(nperfmons,
> +				       sizeof(struct v3d_performance_query *),
> +				       GFP_KERNEL);
> +		if (!query->kperfmon_ids) {
> +			err = -ENOMEM;
> +			goto error;
> +		}
> +
>   		ids_pointer = u64_to_user_ptr(ids);
>   
>   		for (j = 0; j < nperfmons; j++) {
>   			if (get_user(id, ids_pointer++)) {
> +				kvfree(query->kperfmon_ids);
>   				err = -EFAULT;
>   				goto error;
>   			}
> @@ -684,6 +694,7 @@ v3d_copy_query_info(struct v3d_performance_query_info *query_info,
>   
>   		query->syncobj = drm_syncobj_find(file_priv, sync);
>   		if (!query->syncobj) {
> +			kvfree(query->kperfmon_ids);
>   			err = -ENOENT;
>   			goto error;
>   		}
> @@ -717,9 +728,6 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (copy_from_user(&reset, ext, sizeof(reset)))
>   		return -EFAULT;
>   
> -	if (reset.nperfmons > V3D_MAX_PERFMONS)
> -		return -EINVAL;
> -
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(reset.count,
> @@ -767,9 +775,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (copy.pad)
>   		return -EINVAL;
>   
> -	if (copy.nperfmons > V3D_MAX_PERFMONS)
> -		return -EINVAL;
> -
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(copy.count,
