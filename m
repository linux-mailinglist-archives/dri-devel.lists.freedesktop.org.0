Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FCC92E8EF
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 15:09:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5996110EA5B;
	Thu, 11 Jul 2024 13:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hHqQ/AZt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6710EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdInN5rrJC8hl/Sh3zAdQqXt/QfdPZmxf3X9+cn7zUo=; b=hHqQ/AZtdG3tKR1lvNPlgjGoIX
 KMIS8VqWJ3fm7zboJu8nBzfHY380HsTxlT2AEOh6HmSOGKmerQKsKrGgNu70pratKSgxshXHyxFg5
 loQ3R+TQoI0FCSsD7MFO+y520VWxf8kcH0viPvyxahDDx/fhQuw+V3LKZKuiXuLsyhGs6w0L49lBa
 wntAUK48KMuOMWNVgXv9650/qkQUbuTREgh1YldGNyVK+/aq/JzVrbJwsptd+F31MSfZPPnOHVPvv
 Ejqdf0seQT8HkYbHHa0o7ESaIKV/+Tr7RHZByrFCLU1Rz46cXDBI6RwtpVp9r0C9G2u69FbOk1hMb
 LTXULorg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRtYX-00Dhcf-Iu; Thu, 11 Jul 2024 15:09:53 +0200
Message-ID: <0e4f3ec3-e8dd-4e63-9e89-298e1a51e4f9@igalia.com>
Date: Thu, 11 Jul 2024 10:09:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] drm/v3d: Validate passed in drm syncobj handles in
 the performance extension
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240711091542.82083-1-tursulin@igalia.com>
 <20240711091542.82083-6-tursulin@igalia.com>
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
In-Reply-To: <20240711091542.82083-6-tursulin@igalia.com>
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
> If userspace provides an unknown or invalid handle anywhere in the handle
> array the rest of the driver will not handle that well.
> 
> Fix it by checking handle was looked up successfuly or otherwise fail the
> extension by jumping into the existing unwind.

I'm not a English-native speaker, but again I need to say that it feels
to me that it is something missing in this sentence.

I suggested "Fix it by checking if the handle..."

Also, s/successfuly/successfully

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
>   drivers/gpu/drm/v3d/v3d_submit.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index e3a00c8394a5..3838ebade45d 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -710,6 +710,10 @@ v3d_get_cpu_reset_performance_params(struct drm_file *file_priv,
>   		}
>   
>   		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!job->performance_query.queries[i].syncobj) {
> +			err = -ENOENT;
> +			goto error;
> +		}
>   	}
>   	job->performance_query.count = reset.count;
>   	job->performance_query.nperfmons = reset.nperfmons;
> @@ -790,6 +794,10 @@ v3d_get_cpu_copy_performance_query_params(struct drm_file *file_priv,
>   		}
>   
>   		job->performance_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!job->performance_query.queries[i].syncobj) {
> +			err = -ENOENT;
> +			goto error;
> +		}
>   	}
>   	job->performance_query.count = copy.count;
>   	job->performance_query.nperfmons = copy.nperfmons;
