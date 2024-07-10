Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EB592D774
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C5510E00D;
	Wed, 10 Jul 2024 17:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UctQm9IQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B502B10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kVsRk3PaSnKyD3LvELrhP/a5zPIgtqnRvq3C6M+B32Y=; b=UctQm9IQeqkDX7dI3XNokHnNvA
 r3dX/Vo+38m10bRgT9B25UZ20bNADqlXzUg4bCg1LKuKYtasnsiD8FcvbIOthEG0qKfv0TJuSJCyj
 G2QcsVKyPbURLxbMSTZnaBVMAkdTxT7h3TknPH1AnTYUeAE3MXTNAGGLlgx1bGpyDUJRYxQvqutov
 jAxw6qUW2NRHJ0fedngujBDR3Xr/1ISsVHnkabvXZ4nGVCPtBdiZ/2NbQuTvNRxlGzIcmukXZ8LtU
 FcArZ3Sgp4n0rFn32qZE6i5md/CP0vRHVLu77fqFWYbdcXSoynC74aR9Z9j0m+JXOebtmbBsY54d+
 nBWm2pYA==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRb8T-00DLgl-PV; Wed, 10 Jul 2024 19:29:46 +0200
Message-ID: <ff764b11-fe88-4995-96c3-ffe4f5d407dd@igalia.com>
Date: Wed, 10 Jul 2024 14:29:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] drm/v3d: Size the kperfmon_ids array at runtime
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-8-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-8-tursulin@igalia.com>
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
> index 38c80168da51..00fe5d993175 100644
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
> index 173801aa54ee..fc8730264386 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -94,8 +94,10 @@ __v3d_performance_query_info_free(struct v3d_performance_query_info *qinfo,
>   	if (qinfo->queries) {
>   		unsigned int i;
>   
> -		for (i = 0; i < count; i++)
> +		for (i = 0; i < count; i++) {
>   			drm_syncobj_put(qinfo->queries[i].syncobj);
> +			kvfree(qinfo->queries[i].kperfmon_ids);
> +		}
>   
>   		kvfree(qinfo->queries);
>   	}
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 35682433f75b..8dae3ab5f936 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -668,10 +668,20 @@ copy_query_info(struct v3d_performance_query_info *qinfo,
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
> @@ -681,6 +691,7 @@ copy_query_info(struct v3d_performance_query_info *qinfo,
>   
>   		query->syncobj = drm_syncobj_find(fpriv, sync);
>   		if (!query->syncobj) {
> +			kvfree(query->kperfmon_ids);
>   			err = -ENOENT;
>   			goto error;
>   		}
> @@ -714,9 +725,6 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (copy_from_user(&reset, ext, sizeof(reset)))
>   		return -EFAULT;
>   
> -	if (reset.nperfmons > V3D_MAX_PERFMONS)
> -		return -EINVAL;
> -
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(reset.count,
> @@ -762,9 +770,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (copy.pad)
>   		return -EINVAL;
>   
> -	if (copy.nperfmons > V3D_MAX_PERFMONS)
> -		return -EINVAL;
> -
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(copy.count,
