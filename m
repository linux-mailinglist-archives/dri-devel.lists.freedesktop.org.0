Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39B92D713
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7271910E84A;
	Wed, 10 Jul 2024 17:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="AcqwWzrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CCB10E84A
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRR+VOPImDzRutZToW8U5ii8OFf2+i/kT3Ts0v9OFqY=; b=AcqwWzrPemNbiK/XfUUCN7xyyJ
 TuULETL1VroN+cxuWkBJq34nfMiMwXUz2b+lO68GPCC9Hiy4wCgHMLH4XyaHQ8uvlK6b1eFK1RSva
 siFCg8U5wqTF2bFgnyRox14LWd1uWfH429K9fQObohsqEyTHmZ5T5mJqmAPxy7k3CLdivuFjn96Yr
 dfwvO4JGO37guPrH1n0StaeENB0wZqWvImktM1EFFhCrF4XloU9u3UNBrfHnbMPbuYOkZmZ606VTF
 ZsnSUR0YvYrE9UejDIQR32NtyfkiuxrbIsVaJQWhsTtINRfvCRq3rGav1jiDYVOdI6FivbmelVFBh
 3yI4RZzQ==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sRamI-00DLFl-3O; Wed, 10 Jul 2024 19:06:50 +0200
Message-ID: <6c4a6268-6e0a-476b-adca-b1c35ea71abc@igalia.com>
Date: Wed, 10 Jul 2024 14:06:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] drm/v3d: Validate passed in drm syncobj handles in
 the timestamp extension
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>, stable@vger.kernel.org
References: <20240710134130.17292-1-tursulin@igalia.com>
 <20240710134130.17292-5-tursulin@igalia.com>
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
In-Reply-To: <20240710134130.17292-5-tursulin@igalia.com>
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
> If userspace provides an unknown or invalid handle anywhere in the handle
> array the rest of the driver will not handle that well.
> 
> Fix it by checking handle was looked up successfuly or otherwise fail the

I believe you mean "Fix it by checking if the handle..."

Also s/successfuly/successfully

> extension by jumping into the existing unwind.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Fixes: 9ba0ff3e083f ("drm/v3d: Create a CPU job extension for the timestamp query job")
> Cc: Maíra Canal <mcanal@igalia.com>
> Cc: Iago Toral Quiroga <itoral@igalia.com>
> Cc: <stable@vger.kernel.org> # v6.8+
> ---
>   drivers/gpu/drm/v3d/v3d_submit.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
> index ca1b1ad0a75c..3313423080e7 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -497,6 +497,10 @@ v3d_get_cpu_timestamp_query_params(struct drm_file *file_priv,
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!job->timestamp_query.queries[i].syncobj) {
> +			err = -ENOENT;

I'm not sure if err should be -ENOENT or -EINVAL, but based on other 
drivers, I believe it should be -EINVAL.

Best Regards,
- Maíra

> +			goto error;
> +		}
>   	}
>   	job->timestamp_query.count = timestamp.count;
>   
> @@ -550,6 +554,10 @@ v3d_get_cpu_reset_timestamp_params(struct drm_file *file_priv,
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!job->timestamp_query.queries[i].syncobj) {
> +			err = -ENOENT;
> +			goto error;
> +		}
>   	}
>   	job->timestamp_query.count = reset.count;
>   
> @@ -613,6 +621,10 @@ v3d_get_cpu_copy_query_results_params(struct drm_file *file_priv,
>   		}
>   
>   		job->timestamp_query.queries[i].syncobj = drm_syncobj_find(file_priv, sync);
> +		if (!job->timestamp_query.queries[i].syncobj) {
> +			err = -ENOENT;
> +			goto error;
> +		}
>   	}
>   	job->timestamp_query.count = copy.count;
>   
