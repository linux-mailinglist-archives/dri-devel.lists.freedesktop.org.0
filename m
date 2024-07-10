Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323892D757
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8786110E84F;
	Wed, 10 Jul 2024 17:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Tk/+lyys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD2710E851
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKg8RkbXtuvga5iTR9zpiKPaxGzJarlVMlNKdIxK1a0=; b=Tk/+lyyshefTajYMxppERgGehi
 YquhP9Lzk6+XaiH9+mTWlPi4vMbyBdSZzqAhvVLZ5v0zOiyKCz1MJEIGjntvwFVaK4VVgRtFznrTS
 jTFIZuCjX0mKI1elbZ1Cgio6mCOPoU0MRwqxpZ+n1aX78yS4k7AqufvAnCFa7lf96fDJBjq2EGeo1
 GaZayvOPIDWy73Cb/UxB+a22Y+ihV81gzSokumGDkB+HWSAQoZ3M3/loBIjD26ygxUGFk0hZ+hQ5u
 DifOCcKDllmCjw2eRxIFIhz7K1N1KKAimDJyQrt5hi8YQ/GHlcBq0SrIz+qnY/2j32PEt+rOB0tMQ
 LiQs8tbQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRays-00DLXB-ST; Wed, 10 Jul 2024 19:19:51 +0200
Message-ID: <f013d686-7410-44b4-9074-c4b406dc8df9@igalia.com>
Date: Wed, 10 Jul 2024 14:19:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] drm/v3d: Move part of copying of reset/copy
 performance extension to a helper
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-7-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-7-tursulin@igalia.com>
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
> The loop which looks up the syncobj and copies the kperfmon ids is
> identical so lets move it to a helper.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 148 +++++++++++++------------------
>   1 file changed, 64 insertions(+), 84 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index b51600e236c8..35682433f75b 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -641,13 +641,63 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   	return err;
>   }
>   
> +static int

Could you prefix the name of this function with `v3d_`?

> +copy_query_info(struct v3d_performance_query_info *qinfo,
> +		unsigned int count,
> +		unsigned int nperfmons,
> +		u32 __user *syncs,
> +		u64 __user *kperfmon_ids,
> +		struct drm_file *fpriv)

Nit: s/fpriv/file_priv

> +{
> +	unsigned int i, j;
> +	int err;
> +
> +	for (i = 0; i < count; i++) {
> +		struct v3d_performance_query *query = &qinfo->queries[i];
> +		u32 __user *ids_pointer;
> +		u32 sync, id;
> +		u64 ids;
> +
> +		if (get_user(sync, syncs++)) {

Could you mention on the commit message that now you are using
`get_user()`?


> +			err = -EFAULT;
> +			goto error;
> +		}
> +
> +		if (get_user(ids, kperfmon_ids++)) {
> +			err = -EFAULT;
> +			goto error;
> +		}
> +
> +		ids_pointer = u64_to_user_ptr(ids);
> +
> +		for (j = 0; j < nperfmons; j++) {
> +			if (get_user(id, ids_pointer++)) {
> +				err = -EFAULT;
> +				goto error;
> +			}
> +
> +			query->kperfmon_ids[j] = id;
> +		}
> +
> +		query->syncobj = drm_syncobj_find(fpriv, sync);
> +		if (!query->syncobj) {
> +			err = -ENOENT;
> +			goto error;
> +		}
> +	}
> +
> +	return 0;
> +
> +error:
> +	__v3d_performance_query_info_free(qinfo, i);
> +	return err;
> +}
> +
>   static int
>   v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   				     struct drm_v3d_extension __user *ext,
>   				     struct v3d_cpu_job *job)
>   {
> -	u32 __user *syncs;
> -	u64 __user *kperfmon_ids;
>   	struct drm_v3d_reset_performance_query reset;
>   	int err;
>   
> @@ -675,50 +725,17 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (!job->performance_query.queries)
>   		return -ENOMEM;
>   
> -	syncs = u64_to_user_ptr(reset.syncs);
> -	kperfmon_ids = u64_to_user_ptr(reset.kperfmon_ids);
> +	err = copy_query_info(qinfo, reset.count, reset.nperfmons,
> +			      u64_to_user_ptr(reset.syncs),
> +			      u64_to_user_ptr(reset.kperfmon_ids),
> +			      file_priv);

I'm missing where `qinfo` is being declared.

> +	if (err)
> +		return err;
>   
> -	for (int i = 0; i < reset.count; i++) {
> -		u32 sync;
> -		u64 ids;
> -		u32 __user *ids_pointer;
> -		u32 id;
> -
> -		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			err = -EFAULT;
> -			goto error;
> -		}
> -
> -		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
> -			err = -EFAULT;
> -			goto error;
> -		}
> -
> -		ids_pointer = u64_to_user_ptr(ids);
> -
> -		for (int j = 0; j < reset.nperfmons; j++) {
> -			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
> -				err = -EFAULT;
> -				goto error;
> -			}
> -
> -			job->performance_query.queries[i].kperfmon_ids[j] = id;
> -		}
> -
> -		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -		if (!job->performance_query.queries[i].syncobj) {
> -			err = -ENOENT;
> -			goto error;
> -		}
> -	}
>   	job->performance_query.count = reset.count;
>   	job->performance_query.nperfmons = reset.nperfmons;
>   
>   	return 0;
> -
> -error:
> -	__v3d_performance_query_info_free(qinfo, i);
> -	return err;
>   }
>   
>   static int
> @@ -726,8 +743,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   					  struct drm_v3d_extension __user *ext,
>   					  struct v3d_cpu_job *job)
>   {
> -	u32 __user *syncs;
> -	u64 __user *kperfmon_ids;
>   	struct drm_v3d_copy_performance_query copy;
>   	int err;
>   
> @@ -758,44 +773,13 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (!job->performance_query.queries)
>   		return -ENOMEM;
>   
> -	syncs = u64_to_user_ptr(copy.syncs);
> -	kperfmon_ids = u64_to_user_ptr(copy.kperfmon_ids);
> +	err = copy_query_info(qinfo, copy.count, copy.nperfmons,
> +			      u64_to_user_ptr(copy.syncs),
> +			      u64_to_user_ptr(copy.kperfmon_ids),
> +			      file_priv);

Same here.

Best Regards,
- Maíra

> +	if (err)
> +		return err;
>   
> -	for (int i = 0; i < copy.count; i++) {
> -		u32 sync;
> -		u64 ids;
> -		u32 __user *ids_pointer;
> -		u32 id;
> -
> -		if (copy_from_user(&sync, syncs++, sizeof(sync))) {
> -			err = -EFAULT;
> -			goto error;
> -		}
> -
> -		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -
> -		if (copy_from_user(&ids, kperfmon_ids++, sizeof(ids))) {
> -			err = -EFAULT;
> -			goto error;
> -		}
> -
> -		ids_pointer = u64_to_user_ptr(ids);
> -
> -		for (int j = 0; j < copy.nperfmons; j++) {
> -			if (copy_from_user(&id, ids_pointer++, sizeof(id))) {
> -				err = -EFAULT;
> -				goto error;
> -			}
> -
> -			job->performance_query.queries[i].kperfmon_ids[j] = id;
> -		}
> -
> -		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> -		if (!job->performance_query.queries[i].syncobj) {
> -			err = -ENOENT;
> -			goto error;
> -		}
> -	}
>   	job->performance_query.count = copy.count;
>   	job->performance_query.nperfmons = copy.nperfmons;
>   	job->performance_query.ncounters = copy.ncounters;
> @@ -807,10 +791,6 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	job->copy.stride = copy.stride;
>   
>   	return 0;
> -
> -error:
> -	__v3d_performance_query_info_free(qinfo, i);
> -	return err;
>   }
>   
>   /* Whenever userspace sets ioctl extensions, v3d_get_extensions parses data
