Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ECBB34B8E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 22:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCD510E36C;
	Mon, 25 Aug 2025 20:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pUuzXHiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E53410E36C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tAEAu58pwk1cRy7WuRsR1hx+nXlsmoeCpENRudc+e1k=; b=pUuzXHiPYu9Vw5CY/RdhU/rOwn
 LUpnY2R0hDMexCK72L5u881egDJ4L4hAR5MxfAblXWCu2epuloIKp8rXLK5qQ3PgR6wfeJ42B3jvv
 aiAdfgF7MTo+PCaENispoAlRBDKbLTxpdmpp9S9/mGFa2IC407yxEXLzWLKbHdYg5UhkTdFQLYltc
 OT5ipQwF+2hfuasbkaQft7V4C5ptBIro2S3cLwbkIpgcD11Yt9vBpawp6Uh5WJ0oqf5ImecSdL2V4
 UWyvhGVQLukT0rCEqCb5Bv/dVz/sVtzx/G8cn2iA1yU0SNWQzniaxBkEzBMdQtqUpsSbq5xEDpww8
 Fz3k7JBQ==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uqdbP-001Ze0-FC; Mon, 25 Aug 2025 22:15:39 +0200
Message-ID: <68714a32-ea27-425a-be4c-4826e642e94f@igalia.com>
Date: Mon, 25 Aug 2025 17:15:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/v3d: Protect per-fd reset counter against fd
 release
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Iago Toral Quiroga <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
References: <20250815-v3d-queue-lock-v2-0-ce37258ffb53@igalia.com>
 <20250815-v3d-queue-lock-v2-6-ce37258ffb53@igalia.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250815-v3d-queue-lock-v2-6-ce37258ffb53@igalia.com>
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



On 15/08/2025 16:58, Maíra Canal wrote:
> The per-fd reset counter tracks GPU resets caused by jobs submitted
> through a specific file descriptor. However, there's a race condition
> where the file descriptor can be closed while jobs are still running,
> leading to potential access to freed memory when updating the reset
> counter.
>
> Ensure that the per-fd reset counter is only updated when the file
> descriptor is still valid, preventing use-after-free scenarios during
> GPU reset handling.
>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index d2045d0db12e63bc67bac6a47cabcf746189ea88..05b7c2eae3a5dbd34620f2666ffb69364a5136d5 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -722,17 +722,19 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
>   }
>   
>   static enum drm_gpu_sched_stat
> -v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
> +v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job,
> +			  enum v3d_queue q)
>   {
>   	struct v3d_job *job = to_v3d_job(sched_job);
>   	struct v3d_file_priv *v3d_priv = job->file_priv;
> -	enum v3d_queue q;
> +	unsigned long irqflags;
> +	enum v3d_queue i;
>   
>   	mutex_lock(&v3d->reset_lock);
>   
>   	/* block scheduler */
> -	for (q = 0; q < V3D_MAX_QUEUES; q++)
> -		drm_sched_stop(&v3d->queue[q].sched, sched_job);
> +	for (i = 0; i < V3D_MAX_QUEUES; i++)
> +		drm_sched_stop(&v3d->queue[i].sched, sched_job);
>   
>   	if (sched_job)
>   		drm_sched_increase_karma(sched_job);
> @@ -741,15 +743,17 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>   	v3d_reset(v3d);
>   
>   	v3d->reset_counter++;
> -	v3d_priv->reset_counter++;
> +	spin_lock_irqsave(&v3d->queue[q].queue_lock, irqflags);
> +	if (v3d_priv)
> +		v3d_priv->reset_counter++;
> +	spin_unlock_irqrestore(&v3d->queue[q].queue_lock, irqflags);
>   
> -	for (q = 0; q < V3D_MAX_QUEUES; q++)
> +	for (i = 0; i < V3D_MAX_QUEUES; i++)
>   		drm_sched_resubmit_jobs(&v3d->queue[q].sched);
I'm a bit confused here.
Why are you iterating over i but always resubmitting jobs of the same queue?
>   
>   	/* Unblock schedulers and restart their jobs. */
> -	for (q = 0; q < V3D_MAX_QUEUES; q++) {
> -		drm_sched_start(&v3d->queue[q].sched, 0);
> -	}
> +	for (i = 0; i < V3D_MAX_QUEUES; i++)
> +		drm_sched_start(&v3d->queue[i].sched, 0);
Couldn't drm_sched_resumit_jobs() and drm_sched_start() calls be in the 
same V3D_MAX_QUEUES loop?
>   
>   	mutex_unlock(&v3d->reset_lock);
>   
> @@ -777,7 +781,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>   		return DRM_GPU_SCHED_STAT_NO_HANG;
>   	}
>   
> -	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> +	return v3d_gpu_reset_for_timeout(v3d, sched_job, q);
>   }
>   
>   static enum drm_gpu_sched_stat
> @@ -803,7 +807,7 @@ v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
>   {
>   	struct v3d_job *job = to_v3d_job(sched_job);
>   
> -	return v3d_gpu_reset_for_timeout(job->v3d, sched_job);
> +	return v3d_gpu_reset_for_timeout(job->v3d, sched_job, V3D_TFU);
>   }
>   
>   static enum drm_gpu_sched_stat
> @@ -822,7 +826,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>   		return DRM_GPU_SCHED_STAT_NO_HANG;
>   	}
>   
> -	return v3d_gpu_reset_for_timeout(v3d, sched_job);
> +	return v3d_gpu_reset_for_timeout(v3d, sched_job, V3D_CSD);
>   }
>   
>   static const struct drm_sched_backend_ops v3d_bin_sched_ops = {
>

