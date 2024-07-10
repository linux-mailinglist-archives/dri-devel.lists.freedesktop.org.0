Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B871792D6AA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 18:39:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0892210E835;
	Wed, 10 Jul 2024 16:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SaOAZbhH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE1B10E835
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 16:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VyOGG0qBiEBBcnMdvG8fEUcGJthJSAwtuDEMgOAUAAo=; b=SaOAZbhHLzAgovpUwk5aPKvioZ
 x1glWArBPnRG7HMZjkdvRG3+XgH4RLzfwcHV7aBdpzRj5pTcdJ3nEGeMPpGyFy/EBso/wR49M6lAM
 5T9Y0/bzTJx/zCnvW6n6lKnpEojSKNr3tbl2ZHUggJ6EWEPIVzU+AMiPyBDn3eWtmORr9HNZl+zF0
 GDOPvkVgdxrPO4/JjYlh3kEnUVLGm+zIHpU8xXtyU+Lpbx0mygn+rNGas3RgBgZ0Ix3jQKyoASwHC
 zpQuNjH4Mp4tDlZ0/YLrg9d/heNzgPuyvT2XfXfVJVJ4yV7nH399QUN9oioVOhxF0Ebjmg7N8f9Ah
 EOFz6jcg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRaLh-00DKi5-U4; Wed, 10 Jul 2024 18:39:22 +0200
Message-ID: <84d22fb2-c9e9-4354-90a2-675c0b42cb60@igalia.com>
Date: Wed, 10 Jul 2024 13:39:14 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/v3d: Prevent out of bounds access in
 performance query extensions
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-2-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-2-tursulin@igalia.com>
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
> Check that the number of perfmons userspace is passing in the copy and
> reset extensions is not greater than the internal kernel storage where
> the ids will be copied into.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> Fixes: bae7cb5d6800 ("drm/v3d: Create a CPU job extension for the reset performance query job"
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index 88f63d526b22..263fefc1d04f 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -637,6 +637,9 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   	if (copy_from_user(&reset, ext, sizeof(reset)))
>   		return -EFAULT;
>   
> +	if (reset.nperfmons > V3D_MAX_PERFMONS)
> +		return -EINVAL;
> +
>   	job->job_type = V3D_CPU_JOB_TYPE_RESET_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(reset.count,
> @@ -708,6 +711,9 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   	if (copy.pad)
>   		return -EINVAL;
>   
> +	if (copy.nperfmons > V3D_MAX_PERFMONS)
> +		return -EINVAL;
> +
>   	job->job_type = V3D_CPU_JOB_TYPE_COPY_PERFORMANCE_QUERY;
>   
>   	job->performance_query.queries = kvmalloc_array(copy.count,
